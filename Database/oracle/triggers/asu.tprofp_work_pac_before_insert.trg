DROP TRIGGER ASU."tprofp_work_pac_BEFORE_INSERT"
/

--
-- "tprofp_work_pac_BEFORE_INSERT"  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TPROFP_ISPOL (Sequence)
--   TPROFP_WORK_PAC (Table)
--
CREATE OR REPLACE TRIGGER ASU."tprofp_work_pac_BEFORE_INSERT"
 BEFORE
  INSERT
 ON tprofp_work_pac
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
if :new.fk_id is null then
  select seq_tprofp_ispol.NEXTVAL into :new.fk_id from dual;
  end if;
end;
/
SHOW ERRORS;


