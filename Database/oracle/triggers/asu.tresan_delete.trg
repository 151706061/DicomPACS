DROP TRIGGER ASU.TRESAN_DELETE
/

--
-- TRESAN_DELETE  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TRESAN (Table)
--   TCLOBS (Table)
--   VRES (Table)
--   INSNAZ (Package)
--
CREATE OR REPLACE TRIGGER ASU."TRESAN_DELETE" 
  AFTER DELETE ON ASU.TRESAN   REFERENCING NEW AS NEW OLD AS OLD
  FOR EACH ROW
Begin
  if insnaz.bins then
    return;
  end if;
  insnaz.bins := true;

  delete from vres where fk_id = :old.fk_id;
  IF :OLD.FL_ZAKL = 1 THEN
    DELETE FROM TCLOBS WHERE FK_ID = :OLD.FK_BLOBID;
    DELETE FROM TCLOBS WHERE FK_ID = :OLD.FK_BLOBID2; --by TimurLan 05/10/06
    DELETE FROM TCLOBS WHERE FK_ID = :OLD.FK_BLOBID3; --by TimurLan 05/10/06
  END IF;

  insnaz.bins := false;
exception
  when others then
    insnaz.bins := false;
    raise;
End;
/
SHOW ERRORS;


