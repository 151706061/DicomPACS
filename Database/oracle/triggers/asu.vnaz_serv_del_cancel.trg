DROP TRIGGER ASU.VNAZ_SERV_DEL_CANCEL
/

--
-- VNAZ_SERV_DEL_CANCEL  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   V$SESSION (Synonym)
--   DBMS_STANDARD (Package)
--   VNAZ (Table)
--
CREATE OR REPLACE TRIGGER ASU."VNAZ_SERV_DEL_CANCEL" 
 BEFORE
  DELETE
 ON asu.vnaz
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
    raise_application_error(-20003,'невозможно удалить назначение через сервис');
   end if;

END;
/
SHOW ERRORS;


