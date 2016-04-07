DROP TRIGGER ASU.TKURS_INS
/

--
-- TKURS_INS  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TKURS (Sequence)
--   TKURS (Table)
--
CREATE OR REPLACE TRIGGER ASU."TKURS_INS" 
 BEFORE 
 INSERT
 ON ASU.TKURS  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
Begin 
  select SEQ_TKURS.nextval into :new.KURSID from dual;
End;
/
SHOW ERRORS;


