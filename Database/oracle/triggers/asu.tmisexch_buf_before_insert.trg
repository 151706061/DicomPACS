DROP TRIGGER ASU.TMISEXCH_BUF_BEFORE_INSERT
/

--
-- TMISEXCH_BUF_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TMISEXCH_BUF (Sequence)
--   TMISEXCH_BUF (Table)
--
CREATE OR REPLACE TRIGGER ASU."TMISEXCH_BUF_BEFORE_INSERT" 
BEFORE
 INSERT
ON tmisexch_buf
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
 select seq_tmisexch_buf.NEXTVAL into :new.fk_id from dual;
end;
/
SHOW ERRORS;


