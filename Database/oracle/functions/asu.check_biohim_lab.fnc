DROP FUNCTION ASU.CHECK_BIOHIM_LAB
/

--
-- CHECK_BIOHIM_LAB  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSOTR (Synonym)
--   TOTDEL (Synonym)
--
CREATE OR REPLACE FUNCTION ASU."CHECK_BIOHIM_LAB" (pFK_ID IN NUMBER)
  RETURN  NUMBER IS
  dTemp NUMBER;
  CURSOR cTemp IS SELECT FK_ID
                    FROM totdel
                   WHERE totdel.fk_id = (select tsotr.fk_otdid from tsotr where tsotr.fk_id = pFK_ID);
BEGIN
  OPEN cTemp;
  FETCH cTemp INTO dTemp;
  CLOSE cTemp;
  IF dTemp = 281 THEN
    RETURN 1;
   ELSE
    RETURN 0;
  END IF;
END;
/

SHOW ERRORS;


