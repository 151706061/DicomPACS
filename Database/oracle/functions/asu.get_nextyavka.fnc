DROP FUNCTION ASU.GET_NEXTYAVKA
/

--
-- GET_NEXTYAVKA  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TNEXTYAVKA (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_NEXTYAVKA" (pFK_SMID IN NUMBER, pFK_PACID in number) RETURN DATE IS
  res Date;
  CURSOR cTemp IS
    SELECT Tnextyavka.Fd_Date
      FROM asu.Tnextyavka
     WHERE FK_SMID = pFK_SMID and FK_PACID = pFK_PACID;
BEGIN
  RES := NULL;
  OPEN cTemp;
  FETCH cTemp INTO res;
  CLOSE cTemp;

  RETURN RES;
END;
/

SHOW ERRORS;


