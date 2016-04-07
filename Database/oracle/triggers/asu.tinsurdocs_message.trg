DROP TRIGGER ASU.TINSURDOCS_MESSAGE
/

--
-- TINSURDOCS_MESSAGE  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   V$SESSION (Synonym)
--   DBMS_STANDARD (Package)
--   TTYPEDOC (Table)
--   TINSURDOCS (Table)
--   TMISEXCH_TASKS_USERS (Table)
--   GET_PEOPLE_FIO (Function)
--   INSMSG (Procedure)
--
CREATE OR REPLACE TRIGGER ASU."TINSURDOCS_MESSAGE" 
 AFTER 
 DELETE OR UPDATE
 ON ASU.TINSURDOCS  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
DECLARE
CURSOR C1 is
    SELECT   fk_userid, DECODE (COUNT (fk_userid), 0, 0, 1) AS fp_support
                      FROM ASU.tmisexch_tasks_users
                  GROUP BY fk_userid;
CURSOR C2 is
    SELECT OSUSER, MACHINE, MODULE --, TERMINAL, MODULE, ACTION, CLIENT_INFO, LOGON_TIME, PROCESS
          FROM V$SESSION
         WHERE AUDSID = USERENV('SESSIONID');
    nRes NUMBER;
    sOSUSER VARCHAR2(50);
    sMACHINE VARCHAR2(100);
    sMODULE VARCHAR2(100);
    sOld VARCHAR(100);
    sNew VARCHAR(100);
    sPacFIO VARCHAR(100);
    sTextMSG VARCHAR2(4000);
BEGIN

  IF UPDATING('FK_TYPEDOCID') and  :OLD.FK_TYPEDOCID<>:NEW.FK_TYPEDOCID THEN
    OPEN C2;
    FETCH C2 into sOSUSER, sMACHINE, sMODULE;
    CLOSE C2;

    FOR C3 in (select FC_NAME from  TTYPEDOC where FK_ID = :OLD.FK_TYPEDOCID)
    LOOP
        sOld:=sOld||C3.FC_NAME||' ';
    END LOOP;
    FOR C4 in (select FC_NAME into sNew from  TTYPEDOC where FK_ID = :NEW.FK_TYPEDOCID)
    LOOP
        sNew:=sNew||C4.FC_NAME||' ';
    END LOOP;

    sPacFIO:=GET_PEOPLE_FIO(:OLD.FK_PEPLID);

    sTextMSG:='Внимание! Произведено изменение типа страхового документа у пациента "'|| sPacFIO
                || '"  с ' || sOld ||' ('|| :OLD.FK_TYPEDOCID || ')  на '|| sNew||' (' || :NEW.FK_TYPEDOCID||') '
                ||'   пользователем "'||sOSUSER||'"  на компьютере "'||sMACHINE||'"' || '  в модуле "'||sModule||'". TINSURDOCS.fk_id = ' ||:NEW.FK_ID;

    FOR C in C1
    LOOP
        InsMSG(C.fk_userid,sTextMSG);
    END LOOP;
  END IF;
END;
/
SHOW ERRORS;


