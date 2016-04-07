DROP TRIGGER ASU.TPROFP_LIST_BEFORE_INSERT
/

--
-- TPROFP_LIST_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TKARTA (Sequence)
--   TPROFP_LIST (Table)
--
CREATE OR REPLACE TRIGGER ASU."TPROFP_LIST_BEFORE_INSERT" 
 BEFORE
  INSERT
 ON tprofp_list
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
  select seq_tkarta.NEXTVAL into :new.fk_id from dual;
end;
/
SHOW ERRORS;


