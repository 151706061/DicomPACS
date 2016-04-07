DROP TRIGGER ASU.TIBXMLTEXT_DEL
/

--
-- TIBXMLTEXT_DEL  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TIBXMLTEXT (Table)
--   TBLOBS (Table)
--   TCLOBS (Table)
--
CREATE OR REPLACE TRIGGER ASU."TIBXMLTEXT_DEL" 
 AFTER
  DELETE
 ON asu.tibxmltext
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
Begin
  delete from tclobs where fk_id = :old.fk_blobid;
  delete from tblobs where fk_id = :old.fk_blobid;
End;
/
SHOW ERRORS;


