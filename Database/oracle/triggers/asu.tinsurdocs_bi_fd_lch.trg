DROP TRIGGER ASU.TINSURDOCS_BI_FD_LCH
/

--
-- TINSURDOCS_BI_FD_LCH  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   TINSURDOCS (Table)
--
CREATE OR REPLACE TRIGGER ASU."TINSURDOCS_BI_FD_LCH" 
    BEFORE INSERT
    ON ASU.TINSURDOCS     REFERENCING OLD AS OLD NEW AS NEW
    FOR EACH ROW
Begin
      select sysdate into :new.FD_LAST_CHANGE from dual;
    End;
/
SHOW ERRORS;


