DROP FUNCTION ASU.GET_RESULT_MTABLE3
/

--
-- GET_RESULT_MTABLE3  (Function) 
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
CREATE OR REPLACE FUNCTION ASU."GET_RESULT_MTABLE3" (pFK_NAZID IN NUMBER)
  RETURN NUMBER IS
--
-- Purpose: Возвращает результат-Mтаблицу
--
-- Wrote by Philip A. Milovanov
  TYPE nCID IS TABLE OF NUMBER
    INDEX BY BINARY_INTEGER;
  CURSOR cD (pFK_SMID NUMBER) IS
    SELECT/*+rule*/ TO_CHAR (FD_INS, 'dd.mm.yyyy'), TSMID.FC_NAME
      FROM TRESAN, TSMID
     WHERE FK_NAZID = pFK_NAZID
           AND TSMID.FK_ID = pFK_SMID
       AND FL_ZAKL <> 1;
  CURSOR cGetHeader (pFK_SMID NUMBER) IS
    SELECT/*+rule*/ FK_ID, FC_NAME, FC_ED_IZM, GET_NORM (FK_ID,GET_PACID_FROM_NAZID (pFK_NAZID)  ), FC_TYPE
      FROM TSMID
     WHERE FK_OWNER = pFK_SMID
       AND FC_TYPE <> 'COLUMNS'
     ORDER BY FN_ORDER;
  CURSOR cGetFolder (pFK_SMID NUMBER) IS
    SELECT/*+rule*/ FK_ID, FC_NAME, FC_ED_IZM, GET_NORM (FK_ID, GET_PACID_FROM_NAZID (pFK_NAZID)), FC_TYPE
      FROM TSMID
     WHERE FK_OWNER = pFK_SMID
       AND FC_TYPE <> 'COLUMNS'
     ORDER BY FN_ORDER;
  CURSOR cGetVal (pFK_SMID NUMBER, pFK_COLID NUMBER) IS
    SELECT/*+rule*/ GET_NAME_FROM_SMID (FK_BLOBID), TO_CHAR (FN_RES, 'FM99999999990.0999'), FC_RES, GET_TYPE_FROM_SMID (FK_BLOBID), TO_CHAR (FN_RES2, 'FM99999999990.0999')
      FROM TRESAN
     WHERE FK_SMID = pFK_SMID
       AND FK_NAZID = pFK_NAZID
       AND FL_ZAKL <> 1
       AND FK_COLID = pFK_COLID;
  CURSOR cGetZakl (pFK_NAZID NUMBER) IS
    SELECT/*+rule*/ FC_RES
      FROM TRESAN
     WHERE FK_NAZID = pFK_NAZID
       AND FL_ZAKL = 1;
  CURSOR cGetColRoot (pFK_SMID NUMBER) IS
    SELECT FK_ID
      FROM TSMID
     WHERE FK_OWNER = pFK_SMID
       AND FC_TYPE = 'COLUMNS'
     ORDER BY FN_ORDER;
  CURSOR cGetColIDS (pFK_SMID NUMBER) IS
    SELECT FK_ID
      FROM TSMID
     WHERE FK_OWNER = pFK_SMID
       AND FC_TYPE = 'COLUMN'
     ORDER BY FN_ORDER;
  CURSOR cGetColNames (pFK_SMID NUMBER) IS
    SELECT FC_NAME
      FROM TSMID
     WHERE FK_OWNER = pFK_SMID
       AND FC_TYPE = 'COLUMN'
     ORDER BY FN_ORDER;
  CURSOR cGetPat (pFK_SMID NUMBER) IS
    SELECT/*+rule*/ GET_PATNAME (fk_patid) FC_PAT, GET_PATALOGY_LEVEL (fk_patid) FN_PATL
      FROM TRESAN
     WHERE FK_SMID = pFK_SMID
       AND FK_NAZID = pFK_NAZID
       AND FL_ZAKL <> 1
     ORDER BY FN_PATL DESC;
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
--CURSOR
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
  nColID NUMBER;
  nColsID nCID;
  nColCount NUMBER := 0;
  nRes2 VARCHAR2 (100);
  i NUMBER;
  ccType VARCHAR2 (100);
  bFilled BOOLEAN;
BEGIN
  DELETE
    FROM TCLOBS
   WHERE FK_ID = (SELECT FK_BLOBID
                    FROM TRESAN
                   WHERE FK_NAZID = pFK_NAZID
                     AND FL_ZAKL = 1);
  INSERT INTO TCLOBS
              (FK_ID, FC_CLOB)
       VALUES (-1, EMPTY_CLOB () )
    RETURNING FK_ID
    INTO nRes;
  SELECT FC_CLOB
    INTO cl
    FROM TCLOBS
   WHERE FK_ID = nRes
     FOR UPDATE;
  nSMID  := GET_SMIDFROMNAZ (pFK_NAZID);
  OPEN cGetColRoot (nSMID);
  FETCH cGetColRoot INTO nColID;
  CLOSE cGetColRoot;
  OPEN cD (nSMID);
  FETCH cD INTO c, c1;
  CLOSE cD;

  str    := '&nbsp;&nbsp;&nbsp;&nbsp; <B>' || c1 || ' :</B>';
  DBMS_LOB.WRITE (cl, LENGTH (str), 1, str);

  FOR p IN cGetColIDS (nColID) LOOP
    nColsID (cGetColIDS%ROWCOUNT - 1)  := p.FK_ID;
    nColCount := nColCount + 1;
  END LOOP;

  OPEN cGetHeader (nSMID);
  LOOP
    FETCH cGetHeader INTO nSMRID, c, c1, c2, cType;
    EXIT WHEN cGetHeader%NOTFOUND;
    IF c IS NULL THEN
      c  := '&nbsp;';
    END IF;
    IF c1 IS NULL THEN
      c1  := '&nbsp;';
    END IF;
    IF c2 IS NULL THEN
      c2  := '&nbsp;';
    END IF;
    IF cType = 'FOLDER' THEN

      OPEN cGetFolder (nSMRID);
      LOOP
        FETCH cGetFolder INTO nSMRID, c, c1, c2, cType;
        EXIT WHEN cGetFolder%NOTFOUND;
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
        str2  :=  '&nbsp;' || c1 || ';';

        bFilled  := FALSE;
        FOR i IN 0 .. nColCount - 1 LOOP
          c      := '';
          c1     := '';
          c2     := '';
          c3     := '';
          nRes2  := '';
          OPEN cGetVal (nSMRID, nColsID (i) );
          FETCH cGetVal INTO c, c1, c2, ccType, nRes2;
          CLOSE cGetVal;
          IF c IS NULL THEN
            c  := '&nbsp;';
          ELSE
            bFilled:=TRUE;
          END IF;
          IF c1 IS NULL THEN
            c1  := '&nbsp;';
          ELSE
            bFilled  := TRUE;
          END IF;
          IF c2 IS NULL THEN
            c2  := '&nbsp;';
          ELSE
            bFilled  := TRUE;
          END IF;
          IF nRes2 IS NULL THEN
            nRes2  := '&nbsp;';
          ELSE
            bFilled  := TRUE;
          END IF;
          IF cType = 'NUMBER' THEN
            str  := str || c1 || str2;
          ELSIF cType = 'VARCHAR2' THEN
            str  := str || c2 || str2;
          ELSIF cType = 'COMBOBOX' THEN
            IF ccType = 'NUMBER' THEN
              str  := str || c1 || ' ' || c;
            ELSIF ccType = 'VARCHAR2' THEN
              str  := str || c2 || ' ' || c;
            ELSIF ccType = 'DUALNUM' THEN
              str  := str || c1 || ' - ' || nRes2 || ' ' || c;
            ELSE
              str  := str || c;
            END IF;
          ELSIF cType = 'DUALNUM' THEN
            str  := str || c1 || ' - ' || nRes2;
          ELSE
            str  := str || '&nbsp;';
          END IF;

        IF i <> nColCount - 1 THEN
            str  := str || ',';
        ELSE
            str  := str || '; ';
        END IF;

        END LOOP;

          DBMS_LOB.WRITE (cl, LENGTH (str), DBMS_LOB.GETLENGTH (cl) + 1, str);
      END LOOP;
      CLOSE cGetFolder;
    ELSE
      str  := ' &nbsp;&nbsp; ' || c || ' (' || c2 ||' ' || c1 || ') - ';
      bFilled  := FALSE;
      FOR i IN 0 .. nColCount - 1 LOOP
        c      := '';
        c1     := '';
        c2     := '';
        c3     := '';
        nRes2  := '';
        OPEN cGetVal (nSMRID, nColsID (i) );
        FETCH cGetVal INTO c, c1, c2, ccType, nRes2;
        CLOSE cGetVal;
        IF c IS NULL THEN
          c  := '&nbsp;';
        END IF;
        IF c1 IS NULL THEN
          c1  := '&nbsp;';
        ELSE
          bFilled  := TRUE;
        END IF;
        IF c2 IS NULL THEN
          c2  := '&nbsp;';
        ELSE
          bFilled  := TRUE;
        END IF;
        IF nRes2 IS NULL THEN
          nRes2  := '&nbsp;';
        ELSE
          bFilled  := TRUE;
        END IF;
        IF cType = 'NUMBER' THEN
          str  := str || c1;
        ELSIF cType = 'VARCHAR2' THEN
          str  := str || c2;
        ELSIF cType = 'COMBOBOX' THEN
          IF ccType = 'NUMBER' THEN
            str  := str || c1 || ' ' || c;
          ELSIF ccType = 'VARCHAR2' THEN
            str  := str || c2 || ' ' || c;
          ELSIF ccType = 'DUALNUM' THEN
            str  := str || c1 || ' - ' || nRes2 || ' ' || c/*|| '</TD><TD WIDTH="20%"ALIGN="CENTER">'*/;
          ELSE
            str  := str || c;
          END IF;
        ELSIF cType = 'DUALNUM' THEN
          str  := str || c1 || ' - ' || nRes2/*|| '</TD><TD WIDTH="20%"ALIGN="CENTER">'*/;
        ELSE
          str  := str || '&nbsp;';
        END IF;

        IF i <> nColCount - 1 THEN
            str  := str || ',';
        ELSE
            str  := str || '; ';
        END IF;

      END LOOP;
      IF bFilled THEN
        DBMS_LOB.WRITE (cl, LENGTH (str), DBMS_LOB.GETLENGTH (cl) + 1, str);
      END IF;
    END IF;
  END LOOP;

  str  := '<BR>';
  DBMS_LOB.WRITE (cl, LENGTH (str), DBMS_LOB.GETLENGTH (cl) + 1, str);

  CLOSE cGetHeader;
  RETURN nRes;
END;
-- Function GET_RESULT_MTABLE
/

SHOW ERRORS;


