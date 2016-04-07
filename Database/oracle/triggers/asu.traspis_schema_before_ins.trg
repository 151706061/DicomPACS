DROP TRIGGER ASU.TRASPIS_SCHEMA_BEFORE_INS
/

--
-- TRASPIS_SCHEMA_BEFORE_INS  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TRASPIS (Sequence)
--   TRASPIS_SCHEMA (Table)
--
CREATE OR REPLACE TRIGGER ASU."TRASPIS_SCHEMA_BEFORE_INS" before insert on TRaspis_schema
for each row
begin
  select SEQ_TRASPIS.NEXTVAL into :new.fk_id from dual;
end;
/
SHOW ERRORS;


