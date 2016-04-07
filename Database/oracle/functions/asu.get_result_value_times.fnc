DROP FUNCTION ASU.GET_RESULT_VALUE_TIMES
/

--
-- GET_RESULT_VALUE_TIMES  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TNAZAN (Table)
--   TRESAN (Table)
--   GET_NAME_FROM_SMID (Function)
--   GET_NAZ_CANCEL (Function)
--   GET_NAZ_TIME (Function)
--   GET_TYPE_FROM_SMID (Function)
--
CREATE OR REPLACE FUNCTION ASU."GET_RESULT_VALUE_TIMES" (pFK_NAZID IN NUMBER, pFK_SMID IN NUMBER, pFK_COLID IN NUMBER := NULL)
  RETURN VARCHAR2 IS
--Получение результата значения по лаборатории

  CURSOR cGetVal (pSMID NUMBER, pNAZID NUMBER) IS
    SELECT GET_NAME_FROM_SMID (rz.FK_BLOBID), TO_CHAR (rz.FN_RES,'FM99999999990.0999'),
           rz.FC_RES, GET_TYPE_FROM_SMID (rz.FK_BLOBID), TO_CHAR (rz.FN_RES2,'FM99999999990.0999'),
           rz.FK_SOS, TO_CHAR(nz.FD_RUN,'DD.MM.YYYY HH24:MI:SS')
      FROM TRESAN rz, TNAZAN nz
     WHERE rz.FK_SMID = pSMID
       AND rz.FK_NAZID = pNAZID
       AND nz.FK_ID = rz.FK_NAZID
       AND rz.FL_ZAKL <> 1
     ORDER BY nz.FD_RUN DESC;

  c VARCHAR2 (32767);
  c1 VARCHAR2 (32767);
  c2 VARCHAR2 (32767);
  c3 VARCHAR2 (32767);
  ccType VARCHAR2 (32767);
  cType VARCHAR2 (100);
  nRes2 VARCHAR2 (100);
  cFK_SOS NUMBER;
  cFD_RUN VARCHAR2 (20);
BEGIN
  cType  := GET_TYPE_FROM_SMID (pFK_SMID);

  IF cType = 'FOLDER' THEN
    RETURN ' ';
  ELSE
    c       := NULL;
    c1      := NULL;
    c2      := NULL;
    c3      := NULL;
    ccType  := NULL;
    nRes2   := NULL;
    cFD_RUN := NULL;

    IF pFK_COLID IS NULL THEN
      OPEN cGetVal (pFK_SMID, pFK_NAZID);
      FETCH cGetVal INTO c, c1, c2, ccType, nRes2, cFK_SOS, cFD_RUN;
      CLOSE cGetVal;
    END IF;

    IF c IS NOT NULL
       OR c1 IS NOT NULL
       OR c2 IS NOT NULL
       OR cType IS NOT NULL -- Kulechek
       OR nRes2 IS NOT NULL THEN

       IF cFK_SOS = GET_NAZ_CANCEL THEN
          IF c2 IS NOT NULL THEN
            RETURN c2 || ' (' || cFD_RUN || ')';
          ELSE
            RETURN c2;
          END IF;
       ELSIF cFK_SOS = GET_NAZ_TIME THEN
          IF c2 IS NOT NULL THEN
            RETURN 'до ' || c2 || ' (' || cFD_RUN || ')';
          ELSE
            RETURN 'до ' || c2;
          END IF;
      elsIF cType = 'NUMBER' THEN
        IF c1 IS NOT NULL THEN
          RETURN c1 || ' (' || cFD_RUN || ')';
        ELSE
          RETURN c1;
        END IF;
      ELSIF cType = 'VARCHAR2' THEN
        IF c2 IS NOT NULL THEN
          RETURN c2 || ' (' || cFD_RUN || ')';
        ELSE
          RETURN c2;
        END IF;
      ELSIF cType = 'COMBOBOX' THEN
        IF ccType = 'NUMBER' THEN
          IF c IS NOT NULL THEN
            RETURN c1 || c || ' (' || cFD_RUN || ')';
          ELSE
            RETURN c1 || c;
          END IF;
        ELSIF ccType = 'VARCHAR2' THEN
          IF c IS NOT NULL THEN
            RETURN c2 || c || ' (' || cFD_RUN || ')';
          ELSE
            RETURN c2 || c;
          END IF;
        ELSE
          IF c IS NOT NULL THEN
            RETURN c || ' (' || cFD_RUN || ')';
          ELSE
            RETURN c;
          END IF;
        END IF;
      ELSE
        RETURN NULL;
      END IF;
        RETURN NULL;

    END IF;
        RETURN NULL;

  END IF;
END;-- Function GET_RESULT_VALUE
/

SHOW ERRORS;


