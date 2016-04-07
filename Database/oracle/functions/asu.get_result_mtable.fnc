DROP FUNCTION ASU.GET_RESULT_MTABLE
/

--
-- GET_RESULT_MTABLE  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBMS_LOB (Synonym)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TRESAN (Table)
--   TSMID (Table)
--   TCLOBS (Table)
--   GET_FULLPATH (Function)
--   GET_NAME_FROM_SMID (Function)
--   GET_NORM (Function)
--   GET_PACID_FROM_NAZID (Function)
--   GET_PATALOGY_LEVEL (Function)
--   GET_PATNAME (Function)
--   GET_SMIDFROMNAZ (Function)
--   GET_TYPE_FROM_SMID (Function)
--
CREATE OR REPLACE FUNCTION ASU."GET_RESULT_MTABLE" (pFK_NAZID IN NUMBER)
  RETURN NUMBER IS
--
-- Purpose: Возвращает результат-Mтаблицу
--
-- Wrote by Philip A. Milovanov
  TYPE nCID IS TABLE OF NUMBER
    INDEX BY BINARY_INTEGER;
  CURSOR cD (pFK_SMID NUMBER) IS
    SELECT/*+rule*/ TO_CHAR (FD_INS, 'dd.mm.yyyy'), GET_FULLPATH (pFK_SMID)
      FROM TRESAN
     WHERE FK_NAZID = pFK_NAZID
       AND FL_ZAKL <> 1;
  CURSOR cGetHeader (pFK_SMID NUMBER) IS
    SELECT/*+rule*/ FK_ID, FC_NAME, FC_ED_IZM, GET_NORM (FK_ID, GET_PACID_FROM_NAZID (pFK_NAZID) ), FC_TYPE
      FROM TSMID
     WHERE FK_OWNER = pFK_SMID
       AND FC_TYPE <> 'COLUMNS'
     ORDER BY FN_ORDER;
  CURSOR cGetFolder (pFK_SMID NUMBER) IS
    SELECT/*+rule*/ FK_ID, FC_NAME, FC_ED_IZM, GET_NORM (FK_ID, GET_PACID_FROM_NAZID (pFK_NAZID)  ), FC_TYPE
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
  str    :=
            --'<HTML><HEAD><meta http-equiv="Content-Type" content="text/html; charset=windows-1251"></HEAD><BODY>
--Mikrom
            '<CENTER><B>Результат проведенного исследования от: </B>' || C || '</CENTER>' || c1;
--Mikrom
--            '<CENTER><B>Результат проведенного исследования от: </B>' || C || '</CENTER><BR>' || '<I>Наименование исследования: </I><BR><BR>' || c1;
  DBMS_LOB.WRITE (cl, LENGTH (str), 1, str);
  str    :=
    '<table width="100%" border="1" align="center" bordercolordark="#FFFFFF" bordercolorlight="#000000" cellpadding="0" cellspacing="0"><TR ALIGN="CENTER"><TD>Наименование:</TD><TD >Ед.изм.:</TD><TD >Норма:</TD>';
  DBMS_LOB.WRITE (cl, LENGTH (str), DBMS_LOB.GETLENGTH (cl) + 1, str);
  FOR p IN cGetColNames (nColID) LOOP
    str        := '<TD>' || p.FC_NAME || ':</TD>';
    DBMS_LOB.WRITE (cl, LENGTH (str), DBMS_LOB.GETLENGTH (cl) + 1, str);
    nColCount  := nColCount + 1;
  END LOOP;
  str    := '<TD >Примечание:</TD></TR>';
  DBMS_LOB.WRITE (cl, LENGTH (str), DBMS_LOB.GETLENGTH (cl) + 1, str);
--  raise_application_error(-20002,to_char(nSMID));
--Заполнение PL таблицы кодами колонок
  FOR p IN cGetColIDS (nColID) LOOP
    nColsID (cGetColIDS%ROWCOUNT - 1)  := p.FK_ID;
  END LOOP;
--End
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
    str  := '<TR ALIGN="LEFT"><TD ><B>' || c || '</B></TD><TD ALIGN="CENTER">' || c1 || '</TD><TD ALIGN="CENTER">' || c2;
    IF cType = 'FOLDER' THEN
      DBMS_LOB.WRITEAPPEND (cl, LENGTH (str), str);
      FOR i IN 0 .. nColCount - 1 LOOP
--        raise_application_error(-20002,'"'||str||'"');
        str  := '</TD><TD ALIGN="CENTER">&nbsp;';
        DBMS_LOB.WRITEAPPEND (cl, LENGTH (str), str);
      END LOOP;
---------------
      str  := '&nbsp;</TD><TD WIDTH="20%" ALIGN="CENTER">';
      DBMS_LOB.WRITE (cl, LENGTH (str), DBMS_LOB.GETLENGTH (cl) + 1, str);
      str  := '';
      OPEN cGetFolderPat (nSMRID, pFK_NAZID);
      FETCH cGetFolderPat INTO str;
      CLOSE cGetFolderPat;
      str  := str || '&nbsp;</TD></TR>';
      DBMS_LOB.WRITE (cl, LENGTH (str), DBMS_LOB.GETLENGTH (cl) + 1, str);
-----------
--      str := '</TD><TD ALIGN="CENTER">&nbsp;</TD></TR>';
--      DBMS_LOB.WRITE (cl, LENGTH (str), DBMS_LOB.GETLENGTH (cl) + 1, str);
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
        str      := '<TR ALIGN="LEFT"><TD >&nbsp;&nbsp;<B>' || c || '</B></TD><TD ALIGN="CENTER">' || c1 || '</TD><TD ALIGN="CENTER">' || c2;
        bFilled  := FALSE;
--        DBMS_LOB.WRITE (cl, LENGTH (str), DBMS_LOB.GETLENGTH (cl) + 1, str);
        FOR i IN 0 .. nColCount - 1 LOOP
          str    := str || '</TD><TD ALIGN="CENTER">';
--          DBMS_LOB.WRITE (cl, LENGTH (str), DBMS_LOB.GETLENGTH (cl) + 1, str);
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
--          DBMS_LOB.WRITE (cl, LENGTH (str), DBMS_LOB.GETLENGTH (cl) + 1, str);
        END LOOP;
        n        := 0;
        OPEN cGetPat (nSMRID);
        FETCH cGetPat INTO c3, n;
        CLOSE cGetPat;
        IF n > 0 THEN
          str      := str || '</TD><TD ALIGN="CENTER">' || c3 || '&nbsp;</TD></TR>';
          bFilled  := TRUE;
--          raise_application_error(-20002,'tst');
        ELSE
          str  := str || '</TD><TD ALIGN="CENTER">&nbsp;</TD></TR>';
        END IF;
        IF bFilled THEN
          DBMS_LOB.WRITE (cl, LENGTH (str), DBMS_LOB.GETLENGTH (cl) + 1, str);
        END IF;
      END LOOP;
      CLOSE cGetFolder;
    ELSE
      bFilled  := FALSE;
--      DBMS_LOB.WRITE (cl, LENGTH (str), DBMS_LOB.GETLENGTH (cl) + 1, str);
      FOR i IN 0 .. nColCount - 1 LOOP
        str    := str || '</TD><TD ALIGN="CENTER">';
--        DBMS_LOB.WRITE (cl, LENGTH (str), DBMS_LOB.GETLENGTH (cl) + 1, str);
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
/*        ELSE
          bFilled:=TRUE;
*/
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
--        DBMS_LOB.WRITE (cl, LENGTH (str), DBMS_LOB.GETLENGTH (cl) + 1, str);
      END LOOP;
      FOR rec IN cGetPat (nSMRID) LOOP
        IF rec.FN_PATL > 0 THEN
          i   := rec.FN_PATL;
          c3  := rec.FC_PAT;
        END IF;
      END LOOP;
      IF n <> 0 THEN
        str      := str || '</TD><TD ALIGN="CENTER">' || c3 || '&nbsp;</TD></TR>';
        bFilled  := TRUE;
      ELSE
        str  := str || '</TD><TD ALIGN="CENTER">&nbsp;</TD></TR>';
      END IF;
      IF bFilled THEN
        DBMS_LOB.WRITE (cl, LENGTH (str), DBMS_LOB.GETLENGTH (cl) + 1, str);
      END IF;
    END IF;
  END LOOP;
  CLOSE cGetHeader;
  c3     := NULL;
  OPEN cGetZakl (pFK_NAZID);
  FETCH cGetZakl INTO c3;
  CLOSE cGetZakl;
  IF TRIM (c3) IS NOT NULL THEN
    str  := '</TABLE><BR><I>Заключение врача:</I><BR>' || c3;--|| '</BODY></HTML>';
  ELSE
    str  := '</TABLE>';
  END IF;
  DBMS_LOB.WRITE (cl, LENGTH (str), DBMS_LOB.GETLENGTH (cl) + 1, str);
  RETURN nRes;
END;
-- Function GET_RESULT_MTABLE
/

SHOW ERRORS;


