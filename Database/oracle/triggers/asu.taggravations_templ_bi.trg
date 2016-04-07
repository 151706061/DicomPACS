DROP TRIGGER ASU.TAGGRAVATIONS_TEMPL_BI
/

--
-- TAGGRAVATIONS_TEMPL_BI  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   TAGGRAVATIONS_TEMPL (Table)
--   SEQ_TAGGRAVATIONS_TEMPL (Sequence)
--
CREATE OR REPLACE TRIGGER ASU."TAGGRAVATIONS_TEMPL_BI" 
  before insert on asu.taggravations_templ
  REFERENCING NEW AS NEW OLD AS OLD
  for each row
declare
  -- local variables here
begin
  select asu.SEQ_TAGGRAVATIONS_TEMPL.nextval into :new.fk_id from dual;
end;
/
SHOW ERRORS;


