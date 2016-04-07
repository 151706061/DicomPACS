DROP FUNCTION ASU.GET_RESULT_VALUE
/

--
-- GET_RESULT_VALUE  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TRESAN (Table)
--   GET_NAME_FROM_SMID (Function)
--   GET_NAZ_CANCEL (Function)
--   GET_NAZ_TIME (Function)
--   GET_TYPE_FROM_SMID (Function)
--
CREATE OR REPLACE FUNCTION ASU."GET_RESULT_VALUE" (pFK_NAZID IN NUMBER, pFK_SMID IN NUMBER, pFK_COLID IN NUMBER := NULL)
  RETURN VARCHAR2 IS
--Получение результата значения по лаборатории
  CURSOR cGetVal (pSMID NUMBER, pNAZID NUMBER) IS
    SELECT GET_NAME_FROM_SMID (FK_BLOBID), TO_CHAR (FN_RES,'FM99999999990.0999'), FC_RES, GET_TYPE_FROM_SMID (FK_BLOBID), TO_CHAR (FN_RES2,'FM99999999990.0999'), FK_SOS
      FROM TRESAN
     WHERE FK_SMID = pSMID
       AND FK_NAZID = pNAZID
       AND FL_ZAKL <> 1;

  CURSOR cGetMVal (pSMID NUMBER, pNAZID NUMBER) IS
    SELECT GET_NAME_FROM_SMID (FK_BLOBID), TO_CHAR (FN_RES,'FM99999999990.0999'), FC_RES, GET_TYPE_FROM_SMID (FK_BLOBID), TO_CHAR (FN_RES2,'FM99999999990.0999'), FK_SOS
      FROM TRESAN
     WHERE FK_SMID = pSMID
       AND FK_NAZID = pNAZID
       AND FL_ZAKL <> 1
       AND FK_COLID = pFK_COLID;

  c VARCHAR2 (32767);
  c1 VARCHAR2 (32767);
  c2 VARCHAR2 (32767);
  c3 VARCHAR2 (32767);
  ccType VARCHAR2 (32767);
  cType VARCHAR2 (100);
  nRes2 VARCHAR2 (100);
  cFK_SOS NUMBER;
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

    IF pFK_COLID IS NULL THEN
      OPEN cGetVal (pFK_SMID, pFK_NAZID);
      FETCH cGetVal INTO c, c1, c2, ccType, nRes2, cFK_SOS;
      CLOSE cGetVal;
    ELSE
      OPEN cGetMVal (pFK_SMID, pFK_NAZID);
      FETCH cGetMVal INTO c, c1, c2, ccType, nRes2, cFK_SOS;
      CLOSE cGetMVal;
    END IF;

    IF c IS NOT NULL
       OR c1 IS NOT NULL
       OR c2 IS NOT NULL
       OR cType IS NOT NULL -- Kulechek
       OR nRes2 IS NOT NULL THEN

       IF cFK_SOS = GET_NAZ_CANCEL THEN
            RETURN  c2;
       ELSIF cFK_SOS = GET_NAZ_TIME THEN
           RETURN 'до ' || c2;

      elsIF cType = 'NUMBER' THEN
        RETURN c1;
      ELSIF cType = 'VARCHAR2' THEN
        RETURN c2;
      ELSIF cType = 'COMBOBOX' THEN
        IF ccType = 'NUMBER' THEN
          RETURN c1 || ' ' || c;
        ELSIF ccType = 'VARCHAR2' THEN
          RETURN c2 || ' ' || c;
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
END;-- Function GET_RESULT_VALUE
/

SHOW ERRORS;


