DROP TRIGGER ASU.SEQ_TS_SPRAV_BI
/

--
-- SEQ_TS_SPRAV_BI  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TSMID (Sequence)
--   TS_SPRAV (Table)
--
CREATE OR REPLACE TRIGGER ASU."SEQ_TS_SPRAV_BI" 
 BEFORE
 INSERT
 ON ASU.TS_SPRAV  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
begin
    select SEQ_TSMID.nextval into :new.fk_id from dual;
end;
/
SHOW ERRORS;


