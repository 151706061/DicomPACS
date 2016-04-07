DROP FUNCTION ASU.GET_MRTKABS_FOR_XRAY
/

--
-- GET_MRTKABS_FOR_XRAY  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSMINI (Table)
--
CREATE OR REPLACE FUNCTION ASU.get_mrtkabs_for_xray (PFK_KABID NUMBER)
  RETURN NUMBER IS

  CURSOR cKabs IS SELECT COUNT(*)
                   FROM ASU.TSMINI
                  WHERE FC_SECTION = 'XRAY'
                    AND FC_KEY = 'ÌÐÒ_ÊÀÁÈÍÅÒÛ_'||TO_CHAR(PFK_KABID)
                    AND FC_VALUE = TO_CHAR(PFK_KABID);

  nRes NUMBER;
  nCnt NUMBER;

BEGIN
  OPEN cKabs;
  FETCH cKabs INTO nCnt;
  CLOSE cKabs;

  IF nCnt > 0 THEN
    nRes := 1;
  ELSE
    nRes := 0;
  END IF;

  RETURN nRes;
END;
/

SHOW ERRORS;


