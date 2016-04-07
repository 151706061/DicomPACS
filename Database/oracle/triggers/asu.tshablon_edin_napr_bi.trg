DROP TRIGGER ASU.TSHABLON_EDIN_NAPR_BI
/

--
-- TSHABLON_EDIN_NAPR_BI  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TSHABLON_EDIN_NAPR (Sequence)
--   TSHABLON_EDIN_NAPR (Table)
--
CREATE OR REPLACE TRIGGER ASU."TSHABLON_EDIN_NAPR_BI" 
  before insert on asu.TSHABLON_EDIN_NAPR
  REFERENCING NEW AS NEW OLD AS OLD
  for each row
begin
  select SEQ_TSHABLON_EDIN_NAPR.nextval into :new.fk_id from dual;
end;
/
SHOW ERRORS;


