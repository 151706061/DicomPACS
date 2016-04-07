DROP TRIGGER ASU.TNAZWIZZARD_MEDNAZ_BI
/

--
-- TNAZWIZZARD_MEDNAZ_BI  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_NAZWIZZARD_MEDNAZ (Sequence)
--   TNAZWIZZARD_MEDNAZ (Table)
--
CREATE OR REPLACE TRIGGER ASU."TNAZWIZZARD_MEDNAZ_BI" 
 BEFORE
  INSERT
 ON tnazwizzard_mednaz
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
WHEN (
new.fk_id is null
      )
begin
	select seq_nazwizzard_mednaz.nextval into :new.fk_id from dual;
end;
/
SHOW ERRORS;


