DROP TRIGGER ASU.TSMID_DELETE
/

--
-- TSMID_DELETE  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TIB (Table)
--   TVRACHKAB_NAZ (Table)
--   TDIAG (Table)
--   TSMID (Table)
--   TSUBDIAG (Table)
--   VNAZ (Table)
--
CREATE OR REPLACE TRIGGER ASU."TSMID_DELETE" 
BEFORE  DELETE
ON tsmid
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
BEGIN
  DELETE tvrachkab_naz--tnazvrach
   WHERE fk_smid = :old.fk_id;

  DELETE
    FROM tib
   WHERE fk_smid = :old.fk_id;

  DELETE
    FROM tib
   WHERE fk_smeditid = :old.fk_id;

  DELETE
    FROM tdiag
   WHERE fk_smdiagid = :old.fk_id;

  DELETE
    FROM tsubdiag
   WHERE fk_smdiagid = :old.fk_id;

  DELETE
    FROM vnaz
   WHERE fk_smid = :old.fk_id;
END;
/
SHOW ERRORS;


