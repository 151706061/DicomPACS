DROP FUNCTION ASU.GET_RESULT_TABLE2
/

--
-- GET_RESULT_TABLE2  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBMS_LOB (Synonym)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TRESAN (Table)
--   TSMID (Table)
--   TCLOBS (Table)
--   GET_NAME_FROM_SMID (Function)
--   GET_NORM (Function)
--   GET_PACID_FROM_NAZID (Function)
--   GET_PATALOGY_LEVEL (Function)
--   GET_PATNAME (Function)
--   GET_SMIDFROMNAZ (Function)
--   GET_TYPE_FROM_SMID (Function)
--
CREATE OR REPLACE FUNCTION ASU."GET_RESULT_TABLE2" (pFK_NAZID IN NUMBER)
  RETURN NUMBER IS
--
-- Purpose: Возвращает результат-таблицу
--
-- Wrote by Philip A. Milovanov
  CURSOR cD (pFK_SMID NUMBER) IS
    SELECT/*+rule*/ TO_CHAR (FD_INS, 'dd.mm.yyyy'), TSMID.FC_NAME
      FROM TRESAN, TSMID
     WHERE FK_NAZID = pFK_NAZID
           AND TSMID.FK_ID=pFK_SMID
       AND FL_ZAKL <> 1;
  CURSOR cGetHeader (pFK_SMID NUMBER) IS
    SELECT/*+rule*/ FK_ID, FC_NAME, FC_ED_IZM, GET_NORM (FK_ID, GET_PACID_FROM_NAZID (pFK_NAZID)), FC_TYPE
      FROM TSMID
     WHERE FK_OWNER = pFK_SMID
     ORDER BY FN_ORDER;
  CURSOR cGetFolder (pFK_SMID NUMBER) IS
    SELECT/*+rule*/ FK_ID, FC_NAME, FC_ED_IZM, GET_NORM (FK_ID, GET_PACID_FROM_NAZID (pFK_NAZID) ), FC_TYPE
      FROM TSMID
     WHERE FK_OWNER = pFK_SMID
     ORDER BY FN_ORDER;
  CURSOR cGetVal (pFK_SMID NUMBER) IS
    SELECT/*+rule*/ GET_NAME_FROM_SMID (FK_BLOBID), TO_CHAR (FN_RES, 'FM99999999990.0999'), FC_RES, GET_PATNAME (fk_patid), fk_patid, GET_TYPE_FROM_SMID (FK_BLOBID),
                    TO_CHAR (FN_RES2, 'FM99999999990.0999')
      FROM TRESAN
     WHERE FK_SMID = pFK_SMID
       AND FK_NAZID = pFK_NAZID
       AND FL_ZAKL <> 1;
  CURSOR cGetZakl (pFK_NAZID NUMBER) IS
    SELECT/*+rule*/ FC_RES
      FROM TRESAN
     WHERE FK_NAZID = pFK_NAZID
       AND FL_ZAKL = 1;
  CURSOR cGetFolderPat (pOwner NUMBER, pNazID NUMBER) IS
    SELECT GET_PATNAME (FK_PATID)
      FROM (SELECT FK_PATID, GET_PATALOGY_LEVEL (FK_PATID) FP_PATL
              FROM TSMID, TRESAN
             WHERE TRESAN.FK_SMID = TSMID.FK_ID
               AND FK_NAZID = pNAZID
               AND TSMID.FK_OWNER = pOWNER
               AND FL_ZAKL <> 1)
     WHERE fp_patl > 0
     ORDER BY fp_patl;
  str VARCHAR2 (32767);
  str2 VARCHAR2 (32767);
  c VARCHAR2 (32767);
  c1 VARCHAR2 (32767);
  c2 VARCHAR2 (32767);
  c3 VARCHAR2 (32767);
  cType VARCHAR2 (100);
  nSMID NUMBER;
  nSMRID NUMBER;
  n NUMBER;
  CL CLOB;
  nRes NUMBER;
  nRes2 VARCHAR2 (100);
  ccType VARCHAR2 (100);

  lalala    BOOLEAN;

  CURSOR ccc(nnn NUMBER) IS
      SELECT FC_CLOB
        FROM TCLOBS
       WHERE FK_ID = nnn
         FOR UPDATE;

BEGIN
  DELETE
    FROM TCLOBS
   WHERE FK_ID IN (SELECT FK_BLOBID
                     FROM TRESAN
                    WHERE FK_NAZID = pFK_NAZID
                      AND FL_ZAKL = 1);
  INSERT INTO TCLOBS
              (FK_ID, FC_CLOB)
       VALUES (-1, EMPTY_CLOB () )
    RETURNING FK_ID
    INTO nRes;

  OPEN ccc(nRes);
  FETCH ccc INTO cl;
  CLOSE ccc;

  nSMID  := GET_SMIDFROMNAZ (pFK_NAZID);
  OPEN cD (nSMID);
  FETCH cD INTO c, c1;
  CLOSE cD;
  str    :='&nbsp;&nbsp;&nbsp;&nbsp;' || C || ' &nbsp;&nbsp; <B>' || c1 || ' :</B>';
  DBMS_LOB.WRITE (cl, LENGTH (str), 1, str);

  lalala := FALSE;

  OPEN cGetHeader (nSMID);
  LOOP

    IF (NOT lalala) THEN
        FETCH cGetHeader INTO nSMRID, c, c1, c2, cType;
        EXIT WHEN cGetHeader%NOTFOUND;
        IF cType = 'FOLDER' THEN
            OPEN cGetFolder (nSMRID);
            lalala := TRUE;
        END IF;
    ELSE
        FETCH cGetFolder INTO nSMRID, c, c1, c2, cType;
        IF cGetFolder%NOTFOUND THEN
            lalala := FALSE;
            CLOSE cGetFolder;
        END IF;
      END IF;

    IF c IS NULL THEN
      c  := '&nbsp;';
    END IF;
    IF c1 IS NULL THEN
      c1  := '&nbsp;';
    END IF;
    IF c2 IS NULL THEN
      c2  := '&nbsp;';
    END IF;

    str  := ' &nbsp;&nbsp; ' || c || ' - ';
    str2  :=  '&nbsp;' || c1 || ' &nbsp;';
    IF c2 IS NULL THEN
        str2  :=  str2 || ';';
    ELSE
        str2  :=  str2 || '(' || c2 ||');';
    END IF;

      c       := '';
      c1      := '';
      c2      := '';
      c3      := '';
      ccType  := '';
      nRes2   := '';
      OPEN cGetVal (nSMRID);
      FETCH cGetVal INTO c, c1, c2, c3, n, ccType, nRes2;
      CLOSE cGetVal;
      IF    c IS NOT NULL
         OR c1 IS NOT NULL
         OR c2 IS NOT NULL THEN
        IF c IS NULL THEN
          c  := '&nbsp;';
        END IF;
        IF c1 IS NULL THEN
          c1  := '&nbsp;';
        END IF;
        IF c2 IS NULL THEN
          c2  := '&nbsp;';
        END IF;
        IF c3 IS NULL THEN
          c3  := '&nbsp;';
        END IF;
        IF cType = 'NUMBER' THEN
          str  := str || c1 || str2;
        ELSIF cType = 'VARCHAR2' THEN
          str  := str || c2 || str2;
        ELSIF cType = 'COMBOBOX' THEN
          IF ccType = 'NUMBER' THEN
            str  := str || c1 || ' ' || c || ';';
          ELSIF ccType = 'VARCHAR2' THEN
            str  := str || c2 || ' ' || c || ';';
          ELSIF ccType = 'DUALNUM' THEN
            str  := str || c1 || ' - ' || nRes2 || ' ' || c || ';';
          ELSE
            str  := str || c || ';';
          END IF;
        ELSIF cType = 'DUALNUM' THEN
          str  := str || c1 || ' - ' || nRes2 || ' ' || c || ';';
        ELSE
          str  := str || ';';
        END IF;
        DBMS_LOB.WRITE (cl, LENGTH (str), DBMS_LOB.GETLENGTH (cl) + 1, str);
      END IF;

  END LOOP;

  str  := '<BR>';
  DBMS_LOB.WRITE (cl, LENGTH (str), DBMS_LOB.GETLENGTH (cl) + 1, str);

  CLOSE cGetHeader;
  RETURN nRes;
END;-- Function GET_RESULT_TABLE
/

SHOW ERRORS;


