ALTER TABLE ASU.TRECIPE_DLO_PAC_KAT
  DROP CONSTRAINT TRECIPE_DLO_PAC_KAT_PK
/

-- 
-- Non Foreign Key Constraints for Table TRECIPE_DLO_PAC_KAT 
-- 
ALTER TABLE ASU.TRECIPE_DLO_PAC_KAT ADD (
  CONSTRAINT TRECIPE_DLO_PAC_KAT_PK
 PRIMARY KEY
 (FK_ID))
/
