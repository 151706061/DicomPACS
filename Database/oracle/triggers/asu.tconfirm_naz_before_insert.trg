DROP TRIGGER ASU.TCONFIRM_NAZ_BEFORE_INSERT
/

--
-- TCONFIRM_NAZ_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TCONFIRM_NAZ (Sequence)
--   TCONFIRM_NAZ (Table)
--
CREATE OR REPLACE TRIGGER ASU."TCONFIRM_NAZ_BEFORE_INSERT" 
 BEFORE
  INSERT
 ON asu.tconfirm_naz
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
  select seq_tconfirm_naz.NEXTVAL into :new.fk_id from dual;
end;
/
SHOW ERRORS;


