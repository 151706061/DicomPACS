DROP FUNCTION ASU.GET_RESULT_VALUE_PATALOGY
/

--
-- GET_RESULT_VALUE_PATALOGY  (Function) 
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
CREATE OR REPLACE FUNCTION ASU."GET_RESULT_VALUE_PATALOGY" (pFK_NAZID IN NUMBER, pFK_SMID IN NUMBER, pFK_COLID IN NUMBER := NULL)
  RETURN VARCHAR2 IS
-- Получение результата значения по лаборатории
-- Kashira Oleg для отчета анализов по реанимации
-- За основу бралась функция GET_RESULT_VALUE

  CURSOR cGetVal (pSMID NUMBER, pNAZID NUMBER) IS
    SELECT GET_NAME_FROM_SMID(rz.FK_BLOBID),
           TO_CHAR(rz.FN_RES,'FM99999999990.0999'),
           rz.FC_RES,
           GET_TYPE_FROM_SMID(rz.FK_BLOBID),
           TO_CHAR (rz.FN_RES2,'FM99999999990.0999'),
           rz.FK_SOS,
           rz.FK_PATID
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
  cFK_PATALOGY NUMBER;
BEGIN
  cType  := GET_TYPE_FROM_SMID (pFK_SMID);

  IF cType = 'FOLDER' THEN
    RETURN ' ';
  ELSE
    c            := NULL;
    c1           := NULL;
    c2           := NULL;
    c3           := NULL;
    ccType       := NULL;
    nRes2        := NULL;
    cFK_PATALOGY := NULL;

    IF pFK_COLID IS NULL THEN
      OPEN cGetVal (pFK_SMID, pFK_NAZID);
      FETCH cGetVal INTO c, c1, c2, ccType, nRes2, cFK_SOS, cFK_PATALOGY;
      CLOSE cGetVal;
    END IF;

    IF c IS NOT NULL
       OR c1 IS NOT NULL
       OR c2 IS NOT NULL
       OR cType IS NOT NULL -- Kulechek
       OR nRes2 IS NOT NULL THEN

       IF cFK_SOS = GET_NAZ_CANCEL THEN
          RETURN c2;
       ELSIF cFK_SOS = GET_NAZ_TIME THEN
          RETURN 'до ' || c2;
      elsIF cType = 'NUMBER' THEN
        IF c1 IS NOT NULL THEN
          IF cFK_PATALOGY IS NOT NULL THEN
            RETURN c1 || ' !';
          ELSE
            RETURN c1;
          END IF;
        ELSE
          RETURN c1;
        END IF;
      ELSIF cType = 'VARCHAR2' THEN
        RETURN c2;
     /*
        IF c2 IS NOT NULL THEN
          IF cFK_PATALOGY IS NOT NULL THEN
            RETURN c2 || ' !';
          ELSE
            RETURN c2;
          END IF;
        ELSE
          RETURN c2;
        END IF;
     */
      ELSIF cType = 'COMBOBOX' THEN
        IF ccType = 'NUMBER' THEN
          IF c IS NOT NULL THEN
            IF cFK_PATALOGY IS NOT NULL THEN
              RETURN c1 || ' !';
            ELSE
              RETURN c1;
            END IF;
          ELSE
            RETURN c1 || c;
          END IF;
        ELSIF ccType = 'VARCHAR2' THEN
          RETURN c2 || c;
          /*
          IF c2 IS NOT NULL THEN
            IF cFK_PATALOGY IS NOT NULL THEN
              RETURN c2 || c || ' !';
            ELSE
              RETURN c2 || c;
            END IF;
          ELSE
            RETURN c2 || c;
          END IF;
          */
        ELSE
          RETURN c;
        END IF;
      ELSE
        RETURN NULL;
      END IF;
        RETURN NULL;
   END IF;
        RETURN NULL;

  END IF;
END;-- Function GET_RESULT_VALUE_PATALOGY
/

SHOW ERRORS;


