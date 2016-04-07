DROP PROCEDURE ASU.SEND_STATUS_TO_ALL
/

--
-- SEND_STATUS_TO_ALL  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBMS_ALERT (Synonym)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSTATE (Table)
--
CREATE OR REPLACE PROCEDURE ASU."SEND_STATUS_TO_ALL" (nStatusID IN NUMBER) IS
 CURSOR ONLINE_LIST IS(
  SELECT *
    FROM TSTATE
   WHERE FK_ID IN (SELECT MAX(S.FK_ID) FROM TSTATE S GROUP BY FK_USERID)
     AND FN_STATE > 0);
 -- Created 20070511 by Linnikov
 -- Процедура отсылает всем сообщение об изменении статуса
BEGIN
 dbms_alert.signal('STATUS', TO_CHAR(nStatusID));
END;
/

SHOW ERRORS;


