DROP TRIGGER ASU.TNAZLECH_DELETE
/

--
-- TNAZLECH_DELETE  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TNAZLECH (Table)
--   TIB (Table)
--   TRESLECH (Table)
--   DO_CHECK_DELETE_TALON (Procedure)
--   INSNAZ (Package)
--   VNAZ (Table)
--
CREATE OR REPLACE TRIGGER ASU."TNAZLECH_DELETE" 
 BEFORE
 DELETE
 ON asu.TNAZLECH
 REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
Begin
 delete from tib where fk_pacid=:old.fk_id;
 delete from treslech where fk_nazid=:old.fk_id;
 if insnaz.bins then
   return;
 end if;
 insnaz.bins:=true;
 asu.DO_CHECK_DELETE_TALON(:old.FK_ID);
 delete from vnaz where fk_id=:old.fk_id;
 insnaz.bins:=false;
 exception
    when others then
        insnaz.bins:=false;
         raise;
End;
/
SHOW ERRORS;


