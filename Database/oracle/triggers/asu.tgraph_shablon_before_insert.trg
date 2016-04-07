DROP TRIGGER ASU.TGRAPH_SHABLON_BEFORE_INSERT
/

--
-- TGRAPH_SHABLON_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TGRAPH_SHABLON (Sequence)
--   TGRAPH_SHABLON (Table)
--
CREATE OR REPLACE TRIGGER ASU."TGRAPH_SHABLON_BEFORE_INSERT" 
BEFORE INSERT 
ON tgraph_shablon
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
Begin
select seq_tgraph_shablon.nextval into :new.fk_id from dual;
End;
/
SHOW ERRORS;


