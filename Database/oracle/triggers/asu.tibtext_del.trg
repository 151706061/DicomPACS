DROP TRIGGER ASU.TIBTEXT_DEL
/

--
-- TIBTEXT_DEL  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TIBTEXT (Table)
--   TBLOBS (Table)
--   TCLOBS (Table)
--
CREATE OR REPLACE TRIGGER ASU."TIBTEXT_DEL" 
AFTER DELETE
ON ASU.TIBTEXT REFERENCING OLD AS OLD NEW AS NEW
FOR EACH ROW
Begin
  delete from tclobs where fk_id = :old.fk_blobid;
  delete from tblobs where fk_id = :old.fk_blobid;
End;
/
SHOW ERRORS;


