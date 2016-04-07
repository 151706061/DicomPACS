DROP FUNCTION ASU.GET_NAZTYPE
/

--
-- GET_NAZTYPE  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TNAZSOS (Table)
--   TNAZTYPE (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_NAZTYPE" (pFK_NAZTYPEID IN NUMBER) RETURN VARCHAR2 IS
  -- Created by PHP 15.02.2005
  -- (тип назначения 1: плановый; 2: экстренный; 3: цито)
  CURSOR cTemp IS
    SELECT FC_NAME
      FROM TNAZTYPE
     WHERE FK_ID = pFK_NAZTYPEID;
  nTemp TNAZSOS.FC_NAME%TYPE;
BEGIN
  OPEN cTemp;
  FETCH cTemp INTO nTemp;
  CLOSE cTemp;
  RETURN NVL(nTemp,'');
END;
/

SHOW ERRORS;


