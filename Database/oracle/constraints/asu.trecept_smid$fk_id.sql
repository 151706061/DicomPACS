ALTER TABLE ASU.TRECEPT_SMID
  DROP CONSTRAINT TRECEPT_SMID$FK_ID
/

-- 
-- Non Foreign Key Constraints for Table TRECEPT_SMID 
-- 
ALTER TABLE ASU.TRECEPT_SMID ADD (
  CONSTRAINT TRECEPT_SMID$FK_ID
 UNIQUE (FK_ID))
/
