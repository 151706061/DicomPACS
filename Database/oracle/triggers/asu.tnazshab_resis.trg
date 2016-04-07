DROP TRIGGER ASU.TNAZSHAB_RESIS
/

--
-- TNAZSHAB_RESIS  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TNAZSHABLON (Sequence)
--
CREATE OR REPLACE TRIGGER ASU."TNAZSHAB_RESIS" 
BEFORE INSERT
ON tnazshab_resis
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
 select SEQ_TNAZSHABLON.nextval  into :new.fk_id from dual;
end;
/
SHOW ERRORS;


