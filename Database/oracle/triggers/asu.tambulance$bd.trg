DROP TRIGGER ASU.TAMBULANCE$BD
/

--
-- TAMBULANCE$BD  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   V$SESSION (Synonym)
--   TAMBULANCE (Table)
--   TDOCOBSL (Table)
--   TMISEXCH_TASKS_USERS (Table)
--   INSMSG (Procedure)
--   TUSLVID (Table)
--
CREATE OR REPLACE TRIGGER ASU."TAMBULANCE$BD" 
 BEFORE 
 DELETE
 ON ASU.TAMBULANCE  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
DISABLE
DECLARE
CURSOR C1 is
    SELECT   fk_userid, DECODE (COUNT (fk_userid), 0, 0, 1) AS fp_support
                      FROM ASU.tmisexch_tasks_users
                  GROUP BY fk_userid;
CURSOR C2 is
    SELECT OSUSER, MACHINE, PROGRAM, MODULE, ACTION
          FROM V$SESSION
         WHERE AUDSID = USERENV('SESSIONID');
CURSOR C3 (nDocObsl IN NUMBER) is
    select NVL(tu.fc_name,  'Отсутствует') , tu.fk_id
    from tdocobsl td, tuslvid tu
    where td.FK_ID = nDocObsl and tu.fk_id =td.fk_viddocid;
    nRes NUMBER;
    sOSUSER VARCHAR2(50);
    sMACHINE VARCHAR2(100);
    sPROGRAM VARCHAR2(100);
    sMODULE VARCHAR2(100);
    sACTION VARCHAR2(100);
    sNAMEDOC VARCHAR2(100);
    nTYPEDOC NUMBER;
    sTextMSG VARCHAR2(4000);
begin
    IF :OLD.FC_FAM IS NULL THEN RETURN; end if;
    OPEN C2;
    FETCH C2 into sOSUSER, sMACHINE, sPROGRAM, sMODULE, sACTION;
    CLOSE C2;

    OPEN C3 (:OLD.FK_DOCOBSL );
    FETCH C3 into sNAMEDOC, nTYPEDOC;
    CLOSE C3;

    sTextMSG:='ВНИМАНИЕ! Осуществляется удаление из TAMBULANCE'||chr(10)
          ||'| Документ: '||sNAMEDOC||chr(10)
          ||'| № '||:OLD.FK_IBID||'/'||:OLD.FK_IBY||chr(10)
          ||'| Пациент: '||:OLD.FC_FAM||' '||:OLD.FC_IM||' '||:OLD.FC_OTCH||'  Родился: '||to_char(:OLD.FD_ROJD,'DD.MM.YYYY')||chr(10)
          ||'| Действие осуществляет пользователь "'||sOSUSER||'"  '||'  из программы "'||sPROGRAM||'"'||chr(10)
          ||'| Необходимо срочно сообщить о данном действии разработчкам в Таганрог!'
          ||chr(10)
          ||'| Техническая информация:'||chr(10)
          ||'| TAMBULANCE.FK_ID = '||:OLD.FK_ID||chr(10)
          ||'| TAMBULANCE.FK_PEPLID = '||:OLD.FK_PEPLID||chr(10)
          ||'| TAMBULANCE.FK_DOCOBSL = '||:OLD.FK_DOCOBSL||chr(10)
          ||'| TAMBULANCE.FK_UCHID = '||:OLD.FK_UCHID||chr(10)
          ||'| TUSLVID.FK_ID = '||nTYPEDOC
          ||'| работающий модуль = '||sMODULE
          ||'| описание модуля = '||sACTION
          ||'| действие осуществлено на компьютере "'||to_char(sMACHINE)||'"';

    FOR C in C1
    LOOP
        InsMSG(C.fk_userid,sTextMSG);
        /*INSERT INTO ASU.TMSG
          (FK_SENDER,
           FK_RECIEVER,
           FD_SEND,
           FC_TEXT,
           FP_NEED_READ,
           FK_BLOB,
           FP_TYPE,
           FP_MAIL,
           FK_OWNERID)
         VALUES
          (0,
          C.fk_userid,
          SYSDATE,
          sTextMSG,
          0,
          0,
          0,
          0,
          NULL);*/
    END LOOP;
  --RAISE_APPLICATION_ERROR (-20010, sTextMSG);
end;
/
SHOW ERRORS;


