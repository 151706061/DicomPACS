DROP TRIGGER ASU.TPFOFP_LIST_NAZ_BEFORE_INSERT
/

--
-- TPFOFP_LIST_NAZ_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TKARTA (Sequence)
--   TPROFP_LIST_NAZ (Table)
--
CREATE OR REPLACE TRIGGER ASU."TPFOFP_LIST_NAZ_BEFORE_INSERT" 
 BEFORE
  INSERT
 ON tprofp_list_naz
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
  select seq_tkarta.NEXTVAL into :new.fk_id from dual;
end;
/
SHOW ERRORS;


