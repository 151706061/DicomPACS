DROP TRIGGER ASU.TNAZIS_BEFORE_INSERT_AN
/

--
-- TNAZIS_BEFORE_INSERT_AN  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   TNAZIS (Table)
--   SEQ_TANNMBSTR (Sequence)
--
CREATE OR REPLACE TRIGGER ASU.TNAZIS_BEFORE_INSERT_AN
 BEFORE
 INSERT
 ON ASU.TNAZIS  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
BEGIN
  -- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  -- запись ACCESSIONNUMBER
  if trim(:new.fc_accessionnumber) is null then
    select to_char(MED.SEQ_TANNMBSTR.NEXTVAL) into :new.fc_accessionnumber from dual;
  end if;
  -- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
END;
/
SHOW ERRORS;


