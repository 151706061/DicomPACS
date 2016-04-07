DROP TRIGGER ASU.TPAC_APPEARANCE_BEFORE_INS
/

--
-- TPAC_APPEARANCE_BEFORE_INS  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TPAC_APPEARANCE (Sequence)
--   TPAC_APPEARANCE (Table)
--
CREATE OR REPLACE TRIGGER ASU."TPAC_APPEARANCE_BEFORE_INS" 
 BEFORE
  INSERT
 ON tpac_appearance
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
  select seq_tpac_appearance.NEXTVAL into :new.fk_id  from dual;
end;
/
SHOW ERRORS;


