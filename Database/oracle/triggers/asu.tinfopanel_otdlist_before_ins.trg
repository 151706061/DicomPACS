DROP TRIGGER ASU.TINFOPANEL_OTDLIST_BEFORE_INS
/

--
-- TINFOPANEL_OTDLIST_BEFORE_INS  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TINFOPANEL_OTDLIST (Sequence)
--   TINFOPANEL_OTDLIST (Table)
--
CREATE OR REPLACE TRIGGER ASU."TINFOPANEL_OTDLIST_BEFORE_INS" 
before insert on tinfopanel_otdlist
for each row
begin
  select seq_tinfopanel_otdlist.NEXTVAL into :new.fk_id from dual;
end;
/
SHOW ERRORS;


