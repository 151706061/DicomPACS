DROP TRIGGER ASU.TRASPIS_BEFOR_DELETE
/

--
-- TRASPIS_BEFOR_DELETE  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TRESLECH (Table)
--   TRASPIS (Table)
--   TNAZVRACH (View)
--
CREATE OR REPLACE TRIGGER ASU."TRASPIS_BEFOR_DELETE" 
 BEFORE 
 DELETE
 ON ASU.TRASPIS  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
DECLARE
  sotr number;
  nTemp NUMBER;  
BEGIN
  SELECT fk_sotrid into sotr FROM tnazvrach WHERE fk_id=:old.fk_nazvrachid;
  UPDATE treslech SET fl_patfirst=0 WHERE fk_vrachid=sotr and fl_patfirst<>0;
END;
/
SHOW ERRORS;


