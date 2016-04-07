DROP TRIGGER ASU.VRES_DEL
/

--
-- VRES_DEL  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TRESAN (Table)
--   TRESIS (Table)
--   TRESKONS (Table)
--   TRESLECH (Table)
--   TPATALOGY (Table)
--   VRES (Table)
--   INSNAZ (Package)
--
CREATE OR REPLACE TRIGGER ASU."VRES_DEL" 
 BEFORE
 DELETE
 ON asu.VRES
 REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
DECLARE
BEGIN
    DELETE FROM tpatalogy WHERE fk_resid = :old.fk_id;
    if insnaz.bins then
      return;
    end if;
   insnaz.bins:=true;
    DELETE FROM tresis    WHERE fk_id = :old.fk_id;
    DELETE FROM treskons  WHERE fk_id = :old.fk_id;
    DELETE FROM treslech  WHERE fk_id = :old.fk_id;
    DELETE FROM tresan    WHERE fk_id = :old.fk_id;
  insnaz.bins:=false;
 exception
    when others then
      insnaz.bins:=false;
      raise;
END;
/
SHOW ERRORS;


