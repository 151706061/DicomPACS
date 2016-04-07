DROP TRIGGER ASU.TGRAPH_SHAB_DATA_BEFORE_INSERT
/

--
-- TGRAPH_SHAB_DATA_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TGRAPH_SHAB_DATA (Sequence)
--   TGRAPH_SHAB_DATA (Table)
--
CREATE OR REPLACE TRIGGER ASU."TGRAPH_SHAB_DATA_BEFORE_INSERT" 
BEFORE INSERT 
ON tgraph_shab_data
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
Begin
select seq_tgraph_shab_data.nextval into :new.fk_id from dual;
End;
/
SHOW ERRORS;


