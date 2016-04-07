DROP TRIGGER ASU.TANAMBOL_DELETE
/

--
-- TANAMBOL_DELETE  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TANAMBOL (Table)
--   TBLOBS (Table)
--   TCLOBS (Table)
--
CREATE OR REPLACE TRIGGER ASU."TANAMBOL_DELETE" 
BEFORE DELETE
ON ASU.TANAMBOL REFERENCING OLD AS OLD NEW AS NEW
FOR EACH ROW
Begin
  delete from tblobs where fk_id=:old.fk_bid;
  delete from tclobs where fk_id=:old.fk_clobid;
End;
/
SHOW ERRORS;


