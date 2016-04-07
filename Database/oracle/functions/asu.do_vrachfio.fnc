DROP FUNCTION ASU.DO_VRACHFIO
/

--
-- DO_VRACHFIO  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSOTR (Synonym)
--
CREATE OR REPLACE FUNCTION ASU."DO_VRACHFIO" (pFK_ID IN NUMBER, pFullFIO IN NUMBER DEFAULT 0, pUpper IN NUMBER DEFAULT 0) RETURN VARCHAR2 IS
  dTemp VARCHAR2(100);
  d1    VARCHAR2(100);
  d2    VARCHAR2(100);
  CURSOR cTemp IS
    SELECT /*+ rule*/FC_FAM, FC_NAME, FC_OTCH
      FROM TSOTR
     WHERE FK_ID = pFK_ID;
BEGIN
  OPEN cTemp;
  FETCH cTemp
    INTO dTemp, d1, d2;
  IF cTemp%NOTFOUND THEN
    dTemp := 'Не известен';
  END IF;
  CLOSE cTemp;
  IF d1 IS NOT NULL THEN
    IF pFullFIO = 0 THEN
       d1 := SUBSTR(d1, 0, 1) || '.';
    END IF;
    dTemp := dTemp || ' ' || d1;

    IF d2 IS NOT NULL THEN
      IF pFullFIO = 0 THEN
        d2 := SUBSTR(d2, 0, 1)|| '.';
      END IF;
      dTemp := dTemp || ' ' || d2;
    END IF;
  END IF;
  IF pUpper = 1 THEN
    dTemp := UPPER(dTemp);
  END IF;
  RETURN dTemp;
END;
/

SHOW ERRORS;


DROP SYNONYM BUH.DO_VRACHFIO
/

--
-- DO_VRACHFIO  (Synonym) 
--
--  Dependencies: 
--   DO_VRACHFIO (Function)
--
CREATE SYNONYM BUH.DO_VRACHFIO FOR ASU.DO_VRACHFIO
/


DROP SYNONYM STAT.DO_VRACHFIO
/

--
-- DO_VRACHFIO  (Synonym) 
--
--  Dependencies: 
--   DO_VRACHFIO (Function)
--
CREATE SYNONYM STAT.DO_VRACHFIO FOR ASU.DO_VRACHFIO
/


