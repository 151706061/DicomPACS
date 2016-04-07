DROP TRIGGER ASU.TPROFACTOR_SMIDKONS$BI
/

--
-- TPROFACTOR_SMIDKONS$BI  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   TPROFACTOR_SMIDKONS (Table)
--   SEQ_PROFACTOR_SMID (Sequence)
--
CREATE OR REPLACE TRIGGER ASU."TPROFACTOR_SMIDKONS$BI" 
 BEFORE
  INSERT
 ON tprofactor_smidkons
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW

-- Код триггера модифицирован системой автоматической генерации триггеров репликации aTrigger.exe от:22.09.2005 10:09:50
BEGIN
  IF (USERENV('CLIENT_INFO') is null) or (USERENV('CLIENT_INFO') <> '%MAIL%') THEN
    BEGIN
    -- ORIGINAL TRIGGER BODY BEGIN FROM HERE:

begin
  IF :NEW.fk_id IS NULL
  THEN
    SELECT seq_profactor_smid.NEXTVAL
      INTO :NEW.fk_id
      FROM DUAL;
  END IF;
end;

    -- ORIGINAL TRIGGER BODY ENDS HERE
    END;
  END IF;
END;
/
SHOW ERRORS;


