DROP TRIGGER ASU.TBAC_MAP_BEFORE_INSERT
/

--
-- TBAC_MAP_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_VAC_MAP (Sequence)
--   TVAC_MAP (Table)
--
CREATE OR REPLACE TRIGGER ASU."TBAC_MAP_BEFORE_INSERT" BEFORE INSERT
ON ASU.TVAC_MAP FOR EACH ROW
begin
    --  Column "FK_ID" uses sequence SEQ_VAC_MAP
      IF :NEW.FK_ID IS NULL
      THEN
         SELECT SEQ_VAC_MAP.NEXTVAL INTO :NEW.FK_ID from dual;
      END IF;
end;
/
SHOW ERRORS;


