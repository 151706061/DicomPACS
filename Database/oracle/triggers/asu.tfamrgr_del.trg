DROP TRIGGER ASU.TFAMRGR_DEL
/

--
-- TFAMRGR_DEL  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBMS_STANDARD (Package)
--   TFARMGR (Table)
--   PKGTFARMGR (Package)
--
CREATE OR REPLACE TRIGGER ASU."TFAMRGR_DEL" 
BEFORE  DELETE
ON tfarmgr
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
DECLARE
   nTmp   ROWID;
BEGIN
   IF pkgtfarmgr.isExistsMedic(:old.fk_id) = 1 THEN
      raise_application_error (-20001, '¬ы не можете удалить фармакологиеческую группу, т.к. есть учетные единицы которые принадлежат этой группе');
   END IF;
END;
/
SHOW ERRORS;


