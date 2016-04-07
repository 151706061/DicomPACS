DROP TRIGGER ASU.TNAZAN_DELETE
/

--
-- TNAZAN_DELETE  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TNAZAN (Table)
--   TNAZGROUP (Table)
--   TIB (Table)
--   TLABREG (Table)
--   TRESAN (Table)
--   TRESIS (Table)
--   DO_CHECK_DELETE_TALON (Procedure)
--   INSNAZ (Package)
--   VNAZ (Table)
--   TEXPAN (Table)
--
CREATE OR REPLACE TRIGGER ASU."TNAZAN_DELETE" 
 AFTER
 DELETE
 ON asu.TNAZAN
 REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
Begin
  DELETE FROM TIB WHERE FK_PACID = :OLD.FK_ID;
  DELETE FROM TRESIS WHERE FK_NAZID = :OLD.FK_ID;
  DELETE FROM TEXPAN WHERE FK_NAZID = :OLD.FK_ID;
  DELETE FROM TLABREG WHERE FK_NAZID = :OLD.FK_ID;
  DELETE FROM TNAZGROUP WHERE FK_NAZID = :OLD.FK_ID;

  if insnaz.bins then
    return;
  end if;
  insnaz.bins := true;
  asu.DO_CHECK_DELETE_TALON(:old.FK_ID);
  DELETE FROM TRESAN WHERE FK_NAZID = :OLD.FK_ID;
  DELETE FROM VNAZ WHERE FK_ID = :OLD.FK_ID;

  insnaz.bins := false;
exception
  when others then
    insnaz.bins := false;
End;
/
SHOW ERRORS;


