DROP PROCEDURE ASU.CHECK_STATE
/

--
-- CHECK_STATE  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PROCEDURE ASU."CHECK_STATE" IS
 nTmp NUMBER;
-- Created 20070511 by Linnikov
-- Процедура проверки состояния
BEGIN

/* Commented 20070828 by Linnikov FOR C IN (SELECT *
             FROM TSTATE
            WHERE FK_ID IN (SELECT MAX(S.FK_ID) FROM TSTATE S GROUP BY FK_USERID)
              AND FN_STATE > 0) LOOP
  DBMS_PIPE.PACK_MESSAGE(C.FK_USERID);
  nTmp := DBMS_PIPE.SEND_MESSAGE(TO_CHAR(C.FK_USERID));
  dbms_lock.sleep(0.05);
  nTmp := dbms_pipe.receive_message(TO_CHAR(C.FK_USERID), 0.05);
  IF nTmp = 0 THEN
   nTmp := CHANGE_STATE(C.FK_USERID, C.FK_CARID, 0, 'ОТКЛЮЧЕНИЕ ПРИ ПОТЕРЕ СОЕДИНЕНИЯ');
  END IF;
 END LOOP;*/
   NULL;
END CHECK_STATE;
/

SHOW ERRORS;


