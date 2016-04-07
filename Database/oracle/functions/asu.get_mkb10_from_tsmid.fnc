DROP FUNCTION ASU.GET_MKB10_FROM_TSMID
/

--
-- GET_MKB10_FROM_TSMID  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSMID (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_MKB10_FROM_TSMID" (fk_id IN NUMBER)
  RETURN VARCHAR2
IS
  CURSOR c (pfk_id IN NUMBER)
  IS
    SELECT fk_mkb10
      FROM tsmid
     WHERE fk_id = pfk_id;

  sRes   tsmid.fk_mkb10%TYPE;
BEGIN
  FOR i IN c (fk_id) LOOP
    sRes  := i.fk_mkb10;
  END LOOP;
  return sRes;
END;
/

SHOW ERRORS;


