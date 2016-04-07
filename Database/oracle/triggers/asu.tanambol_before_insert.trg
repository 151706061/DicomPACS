DROP TRIGGER ASU.TANAMBOL_BEFORE_INSERT
/

--
-- TANAMBOL_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   TANAMBOL (Table)
--   SEQ_TANAMBOL (Sequence)
--
CREATE OR REPLACE TRIGGER ASU."TANAMBOL_BEFORE_INSERT" 
BEFORE INSERT
ON ASU.TANAMBOL REFERENCING OLD AS OLD NEW AS NEW
FOR EACH ROW
Begin
  if :new.fk_id is null then
    select seq_tanambol.nextval into :new.fk_id from dual;
  end if;
End;
/
SHOW ERRORS;


