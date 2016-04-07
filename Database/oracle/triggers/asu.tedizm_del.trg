DROP TRIGGER ASU.TEDIZM_DEL
/

--
-- TEDIZM_DEL  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBMS_STANDARD (Package)
--   TEDIZM (Table)
--   PKGTEDIZM (Package)
--
CREATE OR REPLACE TRIGGER ASU."TEDIZM_DEL" 
BEFORE DELETE
ON ASU.TEDIZM REFERENCING OLD AS OLD NEW AS NEW
FOR EACH ROW
DECLARE
   nTmp   ROWID;
BEGIN
   IF pkgtedizm.isExistsMedic(:old.fk_id) = 1 THEN
      raise_application_error (-20001, 'Вы не можете удалить эту единицу измерения, т.к. есть записи зависящие от нее');
   END IF;
END;
/
SHOW ERRORS;


