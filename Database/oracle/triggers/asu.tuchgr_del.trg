DROP TRIGGER ASU.TUCHGR_DEL
/

--
-- TUCHGR_DEL  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBMS_STANDARD (Package)
--   TUCHGR (Table)
--   PKGTUCHGR (Package)
--
CREATE OR REPLACE TRIGGER ASU."TUCHGR_DEL" 
BEFORE  DELETE
ON tuchgr
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
DECLARE
   nTmp   ROWID;
BEGIN
   IF pkgtuchgr.isExistsMedic(:old.fk_id) = 1 THEN
      raise_application_error (-20001, '¬ы не можете удалить фармакологиеческую группу, т.к. есть учетные единицы которые принадлежат этой группе');
   END IF;
END;
/
SHOW ERRORS;


