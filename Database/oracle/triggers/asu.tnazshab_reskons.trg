DROP TRIGGER ASU.TNAZSHAB_RESKONS
/

--
-- TNAZSHAB_RESKONS  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TNAZSHAB_RESKONS (Sequence)
--
CREATE OR REPLACE TRIGGER ASU."TNAZSHAB_RESKONS" 
BEFORE INSERT
ON tnazshab_reskons
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
 select SEQ_TNAZSHAB_RESKONS.nextval  into :new.fk_id from dual;
end;
/
SHOW ERRORS;


