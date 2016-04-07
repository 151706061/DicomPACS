DROP FUNCTION ASU.GET_RESULT_TABLE
/

--
-- GET_RESULT_TABLE  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBMS_LOB (Synonym)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TRESAN (Table)
--   TSMID (Table)
--   TCLOBS (Table)
--   GET_FULLPATH_SHA (Function)
--   GET_NAME_FROM_SMID (Function)
--   GET_NORM (Function)
--   GET_PACID_FROM_NAZID (Function)
--   GET_PATALOGY_LEVEL (Function)
--   GET_PATNAME (Function)
--   GET_SMIDFROMNAZ (Function)
--   GET_TYPE_FROM_SMID (Function)
--
CREATE OR REPLACE FUNCTION ASU."GET_RESULT_TABLE" (pFK_NAZID IN NUMBER)
  RETURN NUMBER IS
--
-- Purpose: Возвращает результат-таблицу
--
-- Wrote by Philip A. Milovanov
  CURSOR cD (pFK_SMID NUMBER) IS
    SELECT/*+rule*/ TO_CHAR (FD_INS, 'dd.mm.yyyy'), GET_FULLPATH_SHA (pFK_SMID)
      FROM TRESAN
     WHERE FK_NAZID = pFK_NAZID
       AND FL_ZAKL <> 1;
  CURSOR cGetHeader (pFK_SMID NUMBER) IS
    SELECT/*+rule*/ FK_ID, FC_NAME, FC_ED_IZM, GET_NORM (FK_ID, GET_PACID_FROM_NAZID (pFK_NAZID) ), FC_TYPE
      FROM TSMID
     WHERE FK_OWNER = pFK_SMID
     ORDER BY FN_ORDER;
  CURSOR cGetFolder (pFK_SMID NUMBER) IS
    SELECT/*+rule*/ FK_ID, FC_NAME, FC_ED_IZM, GET_NORM (FK_ID, GET_PACID_FROM_NAZID (pFK_NAZID)), FC_TYPE
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
  str    :=
            /*'<HTML><HEAD><meta http-equiv="Content-Type" content="text/html; charset=windows-1251"></HEAD><BODY>'*/
            /*'<CENTER><B>Результат проведенного исследования от: </B>' ||*/'<B>'|| C  /*|| '</CENTER> <BR>'Mikrom || '<I>Наименование исследования: </I><BR><BR>'Mikrom*/ ||' '|| c1 ||'</B>';  -- BY PHP 060524
  DBMS_LOB.WRITE (cl, LENGTH (str), 1, str);
  str    :=
    '<table width="100%" border="1" align="center" bordercolordark="#FFFFFF" bordercolorlight="#000000" cellpadding="0" cellspacing="0"><TR ALIGN="CENTER"><TD WIDTH="30%">Наименование:</TD><TD WIDTH="10%">Ед.изм.:</TD><TD WIDTH="15%">Норма:</TD><TD WIDTH="25%">Результат:</TD><TD WIDTH="20%">Примечание:</TD></TR>';
  DBMS_LOB.WRITE (cl, LENGTH (str), DBMS_LOB.GETLENGTH (cl) + 1, str);
--  raise_application_error(-20002,to_char(nSMID));
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
    str  := '<TR ALIGN="LEFT"><TD WIDTH="30%"><B>' || c || '</B></TD><TD WIDTH="10%" ALIGN="CENTER">' || c1 || '</TD><TD WIDTH="15%"ALIGN="CENTER">' || c2 || '</TD><TD WIDTH="25%"ALIGN="CENTER">';
    IF cType = 'FOLDER' THEN
      str  := str || '&nbsp;</TD><TD WIDTH="20%" ALIGN="CENTER">';
      DBMS_LOB.WRITE (cl, LENGTH (str), DBMS_LOB.GETLENGTH (cl) + 1, str);
      str:='';
      OPEN  cGetFolderPat(nSMRID,pFK_NAZID);
      FETCH cGetFolderPat INTO str;
      CLOSE cGetFolderPat;
      str:=str||'&nbsp;</TD></TR>';
      DBMS_LOB.WRITE (cl, LENGTH (str), DBMS_LOB.GETLENGTH (cl) + 1, str);
      OPEN cGetFolder (nSMRID);
      LOOP
        FETCH cGetFolder INTO nSMRID, c, c1, c2, cType;
        EXIT WHEN cGetFolder%NOTFOUND;
--        FETCH cGetHeader INTO str, str, str, str, str;
        IF c IS NULL THEN
          c  := '&nbsp;';
        END IF;
        IF c1 IS NULL THEN
          c1  := '&nbsp;';
        END IF;
        IF c2 IS NULL THEN
          c2  := '&nbsp;';
        END IF;
        str     :=
          '<TR ALIGN="LEFT"><TD WIDTH="30%">&nbsp;&nbsp;<B>' || c || '</B></TD><TD WIDTH="10%" ALiGN="CENTER">' || c1 || '</TD><TD WIDTH="15%" ALIGN="CENTER">' || c2 ||
            '</TD><TD WIDTH="25%" ALIGN="CENTER">';
--        dbms_output.put_line(str);
--        ||'<TR ALIGN="LEFT"><TD WIDTH="30%">'||c||'</TD><TD WIDTH="10%">'||c1||'</TD><TD WIDTH="15%">'||c2||'</TD><TD WIDTH="25%">';
        c       := '';
        c1      := '';
        c2      := '';
        c3      := '';
        ccType  := '';
        nRes2   := '';
        OPEN cGetVal (nSMRID);
        FETCH cGetVal INTO c, c1, c2, c3, n, ccType, nRes2;
        CLOSE cGetVal;
        IF     c IS NULL
           AND c1 IS NULL
           AND c2 IS NULL THEN
          NULL;
        ELSE
          DBMS_LOB.WRITE (cl, LENGTH (str), DBMS_LOB.GETLENGTH (cl) + 1, str);
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
            str  := c1 || '</TD><TD WIDTH="20%"ALIGN="CENTER">';
          ELSIF cType = 'VARCHAR2' THEN
            str  := c2 || '</TD><TD WIDTH="20%"ALIGN="CENTER">';
          ELSIF cType = 'COMBOBOX' THEN
            IF ccType = 'NUMBER' THEN
              str  := c1 || ' ' || c || '</TD><TD WIDTH="20%"ALIGN="CENTER">';
            ELSIF ccType = 'VARCHAR2' THEN
              str  := c2 || ' ' || c || '</TD><TD WIDTH="20%"ALIGN="CENTER">';
            ELSIF ccType = 'DUALNUM' THEN
              str  := c1 || ' - ' || nRes2 || ' ' || c || '</TD><TD WIDTH="20%"ALIGN="CENTER">';
            ELSE
              str  := c || '</TD><TD WIDTH="20%"ALIGN="CENTER">';
            END IF;
          ELSIF cType = 'DUALNUM' THEN
            str  := c1 || ' - ' || nRes2 || ' ' || c || '</TD><TD WIDTH="20%"ALIGN="CENTER">';
          ELSE
            str  := '&nbsp;</TD><TD WIDTH="20%"ALIGN="CENTER">';
          END IF;
          DBMS_LOB.WRITE (cl, LENGTH (str), DBMS_LOB.GETLENGTH (cl) + 1, str);
          IF n <> 0 THEN
            str  := c3 || '</TD></TR>';
          ELSE
            str  := '&nbsp;</TD></TR>';
          END IF;
          DBMS_LOB.WRITE (cl, LENGTH (str), DBMS_LOB.GETLENGTH (cl) + 1, str);
        END IF;
      END LOOP;
      CLOSE cGetFolder;
    ELSE
--      DBMS_LOB.WRITE (cl, LENGTH (str), DBMS_LOB.GETLENGTH (cl) + 1, str);
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
          str  := str || c1 || '</TD><TD WIDTH="20%"ALIGN="CENTER">';
        ELSIF cType = 'VARCHAR2' THEN
          str  := str || c2 || '</TD><TD WIDTH="20%"ALIGN="CENTER">';
        ELSIF cType = 'COMBOBOX' THEN
          IF ccType = 'NUMBER' THEN
            str  := str || c1 || ' ' || c || '</TD><TD WIDTH="20%"ALIGN="CENTER">';
          ELSIF ccType = 'VARCHAR2' THEN
            str  := str || c2 || ' ' || c || '</TD><TD WIDTH="20%"ALIGN="CENTER">';
          ELSIF ccType = 'DUALNUM' THEN
            str  := str || c1 || ' - ' || nRes2 || ' ' || c || '</TD><TD WIDTH="20%"ALIGN="CENTER">';
          ELSE
            str  := str || c || '</TD><TD WIDTH="20%"ALIGN="CENTER">';
          END IF;
        ELSIF cType = 'DUALNUM' THEN
          str  := str || c1 || ' - ' || nRes2 || ' ' || c || '</TD><TD WIDTH="20%"ALIGN="CENTER">';
        ELSE
          str  := str || '&nbsp;</TD><TD WIDTH="20%"ALIGN="CENTER">';
        END IF;
--        DBMS_LOB.WRITE (cl, LENGTH (str), DBMS_LOB.GETLENGTH (cl) + 1, str);
        IF n <> 0 THEN
          str  := str || c3 || '</TD></TR>';
        ELSE
          str  := str || '&nbsp;</TD></TR>';
        END IF;
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
    str  := '</TABLE>';--|| '</BODY></HTML>';
  END IF;
  DBMS_LOB.WRITE (cl, LENGTH (str), DBMS_LOB.GETLENGTH (cl) + 1, str);
  RETURN nRes;
END;-- Function GET_RESULT_TABLE
/

SHOW ERRORS;


