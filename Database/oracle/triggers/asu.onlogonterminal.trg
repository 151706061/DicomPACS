DROP TRIGGER ASU.ONLOGONTERMINAL
/

--
-- ONLOGONTERMINAL  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   V_$SESSION (View)
--   DUAL (Synonym)
--   DBMS_STANDARD (Package)
--   MACHINE_LIST (Table)
--   ORA_USERS (Table)
--   PKG_AUD (Package)
--
CREATE OR REPLACE TRIGGER ASU."ONLOGONTERMINAL" 
 AFTER
 LOGON
 ON DATABASE
DISABLE
declare
  vTerm  varchar2(255);
  vHost varchar2(255);
  pFK_PEPLID number;
  vID NUMBER;
  pORAUserName varchar2(255);
begin
    select substr(SYS_CONTEXT('USERENV','terminal'),1,255) INTO vTerm from dual;
    select substr(SYS_CONTEXT('USERENV','SERVER_HOST'),1,255) INTO vHost from dual;
    if vHost <>  vTerm then
        select MAX(DECODE(USERNAME, null, ' ', USERNAME))
        into pORAUserName
        from sys.v_$session
        where audsid = sys_context('USERENV', 'SESSIONID');
        if pORAUserName like 'Z%' then
            pORAUserName := SUBSTR(pORAUserName , 2, LENGTH(pORAUserName) - 1);
        end if;

        SELECT nvl(max(FK_PEPLID), 0) INTO pFK_PEPLID FROM LOGIN.ORA_USERS WHERE FC_LOGIN = pORAUserName AND DISMISS_DATE IS NULL;
        select nvl(max(FK_ID), 0) INTO vID from LOGIN.machine_list where fc_machine  = UPPER(vTerm) and FK_PEPLID = pFK_PEPLID;
        if vID = 0 then
           LOGIN.PKG_aud.AUD_EVENT(LOGIN.PKG_aud.pError, LOGIN.PKG_aud.pMis, LOGIN.PKG_aud.pLogon, 'Попытка входа пользователя с запрещенного терминала');
           raise_application_error(-20000,rpad('Вход с данного терминала невозможен.',4000,' ')||'.');
        end if;
    end if;
end;
/
SHOW ERRORS;


