DROP FUNCTION ASU.GET_RES_AN
/

--
-- GET_RES_AN  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   DBMS_LOB (Synonym)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   GET_RES_IB_AN (Function)
--   TRESAN (Table)
--   TSMID (Table)
--   GET_FULLPATH (Function)
--   GET_NAME_FROM_SMID (Function)
--   GET_NORM (Function)
--   GET_PATALOGY_LEVEL (Function)
--   GET_PATNAME (Function)
--   GET_TYPE_FROM_SMID (Function)
--
CREATE OR REPLACE FUNCTION ASU."GET_RES_AN" (pSmid NUMBER,pPAcid NUMBER)
  RETURN CLOB IS
--
-- Purpose: Возвращает результат-таблицу
--
-- Wrote by Philip A. Milovanov
-- Modify by XAND 05.07.2006
-- Modify by X-Side 04.07.2006 -- убран заголовок "Результат проведенного исследования" (по просьбе Оли)
  CURSOR cD  IS
    SELECT/*+ rule*/  GET_FULLPATH (pSmid)
      FROM DUAL;
  CURSOR cGetHeader (pFK_SMID NUMBER) IS
    SELECT/*+ rule*/ FK_ID, FC_NAME, FC_ED_IZM, asu.GET_NORM (FK_ID, pPacid ), FC_TYPE
      FROM TSMID
     WHERE FK_OWNER = pFK_SMID
     ORDER BY FN_ORDER;
  CURSOR ISSLED IS SELECT fd_ins,fk_nazid FROM asu.tresan where fk_pacid=pPacid AND FL_ZAKL = 1 AND fk_smid=pSmid ORDER BY fd_ins,fk_id;
   CURSOR ISSLEDCOUNT IS SELECT COUNT(fk_id) cnt FROM asu.tresan where fk_pacid=pPacid AND FL_ZAKL = 1 AND fk_smid=pSmid ORDER BY fd_ins,fk_id;

  CURSOR cGetFolder (pFK_SMID NUMBER) IS
    SELECT/*+ rule*/ FK_ID, FC_NAME, FC_ED_IZM, asu.GET_NORM (FK_ID, pPacid ), FC_TYPE
      FROM TSMID
     WHERE FK_OWNER = pFK_SMID
     ORDER BY FN_ORDER;
  CURSOR cGetVal(pFK_SMID NUMBER,pFK_NAZID NUMBER) IS
    SELECT/*+ rule*/ asu.GET_NAME_FROM_SMID (FK_BLOBID), TO_CHAR (FN_RES, 'FM99999999990.0999'), FC_RES, DECODE(asu.GET_PATNAME (fk_patid),NULL,'',' ('||asu.GET_PATNAME (fk_patid)||')'), fk_patid, asu.GET_TYPE_FROM_SMID (FK_BLOBID),
                    TO_CHAR (FN_RES2, 'FM99999999990.0999')
      FROM asu.TRESAN
     WHERE FK_SMID = pFK_SMID
       AND FK_NAZID = pFK_NAZID
       AND FL_ZAKL <> 1;
  CURSOR cGetZakl (pFK_NAZID NUMBER) IS
    SELECT/*+ rule*/ FC_RES
      FROM asu.TRESAN
     WHERE FK_NAZID = pFK_NAZID
       AND FL_ZAKL = 1;
  CURSOR cGetFolderPat (pOwner NUMBER, pNazID NUMBER) IS
    SELECT asu.GET_PATNAME (FK_PATID)
      FROM (SELECT FK_PATID, asu.GET_PATALOGY_LEVEL (FK_PATID) FP_PATL
              FROM TSMID, asu.TRESAN
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

  nSMRID NUMBER;
  n NUMBER;
  CL CLOB;
  nRes NUMBER;
  nRes2 VARCHAR2 (100);
  ccType VARCHAR2 (100);
  nExist          NUMBER;


BEGIN
   return stat.get_res_ib_an(psmid, ppacid);
   DBMS_LOB.CREATETEMPORARY(CL, TRUE, DBMS_LOB.SESSION);

  OPEN cD;
  FETCH cD INTO C1;
  CLOSE cD;
  str    := '<BR><font size="2">' || c1 || '</font>';
  DBMS_LOB.WRITE (cl, LENGTH (str), 1, str);
  str    :=
    '<table width="100%" border="1" align="center" bordercolordark="#FFFFFF" bordercolorlight="#000000" cellpadding="0" cellspacing="0">'||
    '<TR ALIGN="CENTER">'||
    '<TD WIDTH="30%"><font size="2">Наименование:</font></TD>'||
    '<TD WIDTH="10%"><font size="2">Ед.изм.:</font></TD>'||
    '<TD WIDTH="15%"><font size="2">Норма:</font></TD>';

  FOR C IN ISSLED LOOP
   str:=str||'<TD WIDTH="25%"><font size="2">'||TO_CHAR(C.fd_ins,'dd.mm.yy HH24:MI')||'</font></TD>';
  END LOOP;
  DBMS_LOB.WRITE (cl, LENGTH (str), DBMS_LOB.GETLENGTH (cl) + 1, str);
  OPEN cGetHeader (pSmid);
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
  --  nExist := 0;
    str  := '<TR ALIGN="LEFT"><TD WIDTH="30%"><font size="2">'/*<B>'*/ || c || /*'</B>*/'</font></TD><TD WIDTH="10%" ALIGN="CENTER"><font size="2">' || c1 || '</font></TD><TD WIDTH="15%"ALIGN="CENTER"><font size="2">' || c2 || '</font></TD>';
    IF cType = 'FOLDER' THEN
      FOR C IN ISSLED LOOP
        OPEN  cGetFolderPat(nSMRID,C.FK_NAZID);
        FETCH cGetFolderPat INTO str2;
        IF cGetFolderPat%NOTFOUND THEN str2:=''; END IF;
        CLOSE cGetFolderPat;

        str  := str||'<TD WIDTH="25%"ALIGN="CENTER"><font size="2">&nbsp;'||str2||'</font></TD>';
      END LOOP;

      str:=str||'</TR>';
      DBMS_LOB.WRITE (cl, LENGTH (str), DBMS_LOB.GETLENGTH (cl) + 1, str);
      str:='';

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

        nExist:=0;
        str     :=
          '<TR ALIGN="LEFT"><TD WIDTH="30%"><font size="2">&nbsp;&nbsp;'/*<B>'*/ || c || /*'</B>*/'</font></TD><TD WIDTH="10%" ALiGN="CENTER"><font size="2">' || c1 || '</font></TD><TD WIDTH="15%" ALIGN="CENTER"><font size="2">' || c2 || '</font></TD>';

       FOR VAL IN ISSLED LOOP
         c       := '';
        c1      := '';
        c2      := '';
        c3      := '';
        ccType  := '';
        nRes2   := '';
        OPEN cGetVal (nSMRID,VAL.fk_nazid);
        FETCH cGetVal INTO c, c1, c2, c3, n, ccType, nRes2;
        CLOSE cGetVal;
        str:=str||'<TD WIDTH="25%" ALIGN="CENTER"><font size="2">';
          IF c IS NULL THEN
            c  := '&nbsp;';
          ELSE
            nExist:=1;
          END IF;
          IF c1 IS NULL THEN
            c1  := '&nbsp;';
          ELSE
            nExist:=1;
          END IF;
          IF c2 IS NULL THEN
            c2  := '&nbsp;';
          ELSE
            nExist:=1;
          END IF;
          IF c3 IS NULL THEN
            c3  := '&nbsp;';
          ELSE
            nExist:=1;
          END IF;

          IF cType = 'NUMBER' THEN
            str  := sTr||c1 ||c3|| '</font></TD>';
          ELSIF cType = 'VARCHAR2' THEN
            str  := sTr||c2 ||c3|| '</font></TD>';
          ELSIF cType = 'COMBOBOX' THEN
            IF ccType = 'NUMBER' THEN
              str  := str||c1 || ' ' || c ||c3|| '</font></TD>';
            ELSIF ccType = 'VARCHAR2' THEN
              str  := str||c2||c1 || ' ' || c ||c3|| '</font></TD>';
            ELSIF ccType = 'DUALNUM' THEN
              str  := str||c1 || ' - ' || nRes2 || ' ' || c||c3 || '</font></TD>';
            ELSE
              str  :=str|| c ||c3|| '</font></TD>';
            END IF;
          ELSIF cType = 'DUALNUM' THEN
            str  := str||c1 || ' - ' || nRes2 || ' ' || c||c3 || '</font></TD>';
          ELSE
            str  :=str|| '&nbsp;'||c3||'</font></TD>';
          END IF;
        END LOOP;
          sTr:=str||'</TR>';
          IF nExist=1 THEN
           DBMS_LOB.WRITE (cl, LENGTH (str), DBMS_LOB.GETLENGTH (cl) + 1, str);
          END IF;
    END LOOP;
      CLOSE cGetFolder;
  ELSE
     nExist:=0;
     FOR VAL IN ISSLED LOOP
      c       := '';
      c1      := '';
      c2      := '';
      c3      := '';
      ccType  := '';
      nRes2   := '';
 --     nExist:=0;
      str:=str||'<TD WIDTH="25%"ALIGN="CENTER"><font size="2">';
      OPEN cGetVal (nSMRID,VAL.fk_nazid);
      FETCH cGetVal INTO c, c1, c2, c3, n, ccType, nRes2;
      CLOSE cGetVal;

        IF c IS NULL THEN
          c  := '&nbsp;';
        ELSE
          nExist:=1;
        END IF;
        IF c1 IS NULL THEN
          c1  := '&nbsp;';
        ELSE
          nExist:=1;
        END IF;
        IF c2 IS NULL THEN
          c2  := '&nbsp;';
        ELSE
          nExist:=1;
        END IF;
        IF c3 IS NULL THEN
          c3  := '&nbsp;';
        ELSE
          nExist:=1;
        END IF;
        IF cType = 'NUMBER' THEN
          str  := str || c1 ||c3|| '</font></TD>';
        ELSIF cType = 'VARCHAR2' THEN
          str  := str || c2||c1||c3 || '</font></TD>';
        ELSIF cType = 'COMBOBOX' THEN
          IF ccType = 'NUMBER' THEN
            str  := str || c1 || ' ' || c||c3 || '</font></TD>';
          ELSIF ccType = 'VARCHAR2' THEN
            str  := str || c2||c1 || ' ' || c ||c3|| '</font></TD>';
          ELSIF ccType = 'DUALNUM' THEN
            str  := str || c1 || ' - ' || nRes2 || ' ' || c ||c3||'</font></TD>';
          ELSE
            str  := str || c||c3 || '</font></TD>';
          END IF;
        ELSIF cType = 'DUALNUM' THEN
          str  := str || c1 || ' - ' || nRes2 || ' ' || c||c3 || '</font></TD>';
        ELSE
          str  := str || '&nbsp;'||c3||'</font></TD>';
        END IF;
       END LOOP;
        str:=sTr||'</TR>';
        IF nExist=1 THEN
         DBMS_LOB.WRITE (cl, LENGTH (str), DBMS_LOB.GETLENGTH (cl) + 1, str);
        END IF;
      END IF;
   END LOOP;
  CLOSE cGetHeader;
  c3     := NULL;
  str:='';
  FOR C IN ISSLED LOOP
      OPEN cGetZakl(C.FK_NAZID);
      FETCH cGetZakl INTO c3;
      IF (cGetZakl%NOTFOUND) OR (c3 IS NULL) THEN
        c3:='';
      ELSE
       C3:='<br>'||C3;
      END IF;
      CLOSE cGetZakl;
      sTr:=sTr||c3;
  END LOOP;
  IF TRIM (c3) IS NOT NULL THEN
    str  := '</TABLE><BR><I>Заключение врача:</I>' || str;
  ELSE
    str  := '</TABLE>';
  END IF;
  DBMS_LOB.WRITE (cl, LENGTH (str), DBMS_LOB.GETLENGTH (cl) + 1, str);
  RETURN cl;
END;-- Function GET_RESULT_TABLE
/

SHOW ERRORS;


