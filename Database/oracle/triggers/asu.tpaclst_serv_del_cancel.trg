DROP TRIGGER ASU.TPACLST_SERV_DEL_CANCEL
/

--
-- TPACLST_SERV_DEL_CANCEL  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   V$SESSION (Synonym)
--   DBMS_STANDARD (Package)
--   TPACLST (Table)
--
CREATE OR REPLACE TRIGGER ASU."TPACLST_SERV_DEL_CANCEL" 
 BEFORE
  DELETE
 ON asu.tpaclst
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DISABLE
DECLARE
  sMODULENAME varchar2(4000);
BEGIN
  SELECT PROGRAM
    INTO sMODULENAME
    FROM V$SESSION
   WHERE AUDSID = USERENV('SESSIONID');

   if sMODULENAME = 'SamozapisClientService.exe' then
    raise_application_error(-20003,'невозможно удалить точку расписания через сервис');
   end if;

END;
/
SHOW ERRORS;


