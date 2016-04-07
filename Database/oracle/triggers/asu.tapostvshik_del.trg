DROP TRIGGER ASU.TAPOSTVSHIK_DEL
/

--
-- TAPOSTVSHIK_DEL  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBMS_STANDARD (Package)
--   TAPOSTAVSHIK (Table)
--   PKGTAPOSTAVSHIK (Package)
--
CREATE OR REPLACE TRIGGER ASU."TAPOSTVSHIK_DEL" 
BEFORE DELETE
ON ASU.TAPOSTAVSHIK REFERENCING OLD AS OLD NEW AS NEW
FOR EACH ROW
DECLARE
   nTmp   ROWID;
BEGIN
   IF pkgTAPOSTAVSHIK.isExistsAprih(:old.fk_id) = 1 THEN
      raise_application_error (-20001, 'Вы не можете удалить поставщика, т.к. есть данные о поставках от него');
   END IF;
END;
/
SHOW ERRORS;


