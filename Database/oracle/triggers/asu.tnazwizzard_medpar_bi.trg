DROP TRIGGER ASU.TNAZWIZZARD_MEDPAR_BI
/

--
-- TNAZWIZZARD_MEDPAR_BI  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_NAZWIZZARD_MEDPAR (Sequence)
--   TNAZWIZZARD_MEDPAR (Table)
--
CREATE OR REPLACE TRIGGER ASU."TNAZWIZZARD_MEDPAR_BI" 
 BEFORE
  INSERT
 ON tnazwizzard_medpar
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
WHEN (
new.fk_id is null
      )
begin
	select seq_nazwizzard_medpar.nextval into :new.fk_id from dual;
end;
/
SHOW ERRORS;


