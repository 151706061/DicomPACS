DROP FUNCTION ASU.GET_AMBNAPR
/

--
-- GET_AMBNAPR  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TNAPR (Table)
--   TLABREG (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_AMBNAPR" ( pFK_NAZID IN NUMBER)
  RETURN  VARCHAR2 IS
  nTemp VARCHAR2(100);
  CURSOR cTemp IS
    SELECT /*+ rule*/
        TNAPR.fc_name
    FROM
        TLABREG,
        TNAPR
    WHERE
        TLABREG.fk_naprid = TNAPR.fk_id
        AND TLABREG.fk_nazid = pFK_NAZID;
BEGIN
  OPEN cTemp;
  FETCH cTemp INTO nTemp;
  CLOSE cTemp;
  RETURN nTemp;
END;
/

SHOW ERRORS;


