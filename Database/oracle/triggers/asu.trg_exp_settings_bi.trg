DROP TRIGGER ASU.TRG_EXP_SETTINGS_BI
/

--
-- TRG_EXP_SETTINGS_BI  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_EXP_MAIN (Sequence)
--   T_EXP_SETTINGS (Table)
--
CREATE OR REPLACE TRIGGER ASU."TRG_EXP_SETTINGS_BI" 
  before insert on asu.t_exp_settings
  for each row
declare
  -- local variables here
begin
  select seq_exp_main.nextval
    into :new.fk_id
    from dual;
end trg_exp_settings_bi;
/
SHOW ERRORS;


