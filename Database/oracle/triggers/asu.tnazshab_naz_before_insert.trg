DROP TRIGGER ASU.TNAZSHAB_NAZ_BEFORE_INSERT
/

--
-- TNAZSHAB_NAZ_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TNAZSHAB_NAZ (Sequence)
--   TNAZSHAB_NAZ (Table)
--
CREATE OR REPLACE TRIGGER ASU."TNAZSHAB_NAZ_BEFORE_INSERT" 
BEFORE INSERT
ON tnazshab_naz
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
select seq_tnazshab_naz.NEXTVAL into :New.fk_id from dual;
end;
/
SHOW ERRORS;


