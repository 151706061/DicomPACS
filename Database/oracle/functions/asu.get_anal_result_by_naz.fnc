DROP FUNCTION ASU.GET_ANAL_RESULT_BY_NAZ
/

--
-- GET_ANAL_RESULT_BY_NAZ  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   GET_SOTRNAME (Function)
--   TRESAN (Table)
--   TSMID (Table)
--   GET_FULLPATH_SHA (Function)
--   GET_NAME_FROM_SMID (Function)
--   GET_NORM (Function)
--   GET_PACID_FROM_NAZID (Function)
--   GET_PATALOGY_LEVEL (Function)
--   GET_PATNAME (Function)
--   GET_SMIDFROMNAZ (Function)
--   GET_TYPE_FROM_SMID (Function)
--
CREATE OR REPLACE FUNCTION ASU."GET_ANAL_RESULT_BY_NAZ" (pfk_nazid IN NUMBER)
  RETURN VARCHAR
IS
--
-- Purpose: Возвращает результат-таблицу
--
-- Wrote by PHP 060530
  CURSOR cd (pfk_smid NUMBER)
  IS
    SELECT /*+rule*/
           TO_CHAR (fd_ins, 'dd.mm.yyyy'), get_fullpath_sha (tsmid.fk_id) fc_name, tsmid.FC_TYPE
      FROM tresan, tsmid
     WHERE fk_nazid = pfk_nazid AND tsmid.fk_id = pfk_smid AND fl_zakl <> 1;

  CURSOR cgetheader (pfk_smid NUMBER)
  IS
    SELECT   /*+rule*/
             fk_id, DECODE (fl_showprint, 1, fc_name, ''), fc_ed_izm,
             get_norm (fk_id,get_pacid_from_nazid (pfk_nazid)),
             fc_type
        FROM tsmid
       WHERE fk_owner = pfk_smid
    ORDER BY fn_order;

  CURSOR cgetfolder (pfk_smid NUMBER)
  IS
    SELECT   /*+rule*/
             fk_id, DECODE (fl_showprint, 1, fc_name, ''), fc_ed_izm,
             get_norm (fk_id,get_pacid_from_nazid (pfk_nazid))
                      ,
             fc_type
        FROM tsmid
       WHERE --fk_owner = pfk_smid
                FL_SHOWANAL = 4
                AND FC_TYPE <> 'COLUMNS'
                AND FC_TYPE <> 'COLUMN'
         START WITH FK_OWNER = pFK_SMID
         CONNECT BY PRIOR FK_ID = FK_OWNER
         ORDER BY TSMID.FN_ORDER;
       
       
--    ORDER BY fn_order;

  CURSOR cgetval (pfk_smid NUMBER)
  IS
    SELECT /*+rule*/
           get_name_from_smid (fk_blobid), TO_CHAR (fn_res, 'FM99999999990.0999'), fc_res,
           get_patname (fk_patid), fk_patid, get_type_from_smid (fk_blobid),
           TO_CHAR (fn_res2, 'FM99999999990.0999')
      FROM tresan
     WHERE fk_smid = pfk_smid AND fk_nazid = pfk_nazid AND fl_zakl <> 1;

  CURSOR cgetzakl (pfk_nazid NUMBER)
  IS
    SELECT /*+rule*/
           fc_res
      FROM tresan
     WHERE fk_nazid = pfk_nazid AND fl_zakl = 1;

  CURSOR cgetfolderpat (powner NUMBER, pnazid NUMBER)
  IS
    SELECT   get_patname (fk_patid)
        FROM (SELECT fk_patid, get_patalogy_level (fk_patid) fp_patl
                FROM tsmid, tresan
               WHERE tresan.fk_smid = tsmid.fk_id
                 AND fk_nazid = pnazid
                 AND tsmid.fk_owner = powner
                 AND fl_zakl <> 1)
       WHERE fp_patl > 0
    ORDER BY fp_patl;



    CURSOR cGetMHeader(pFK_SMID BINARY_INTEGER) IS
    SELECT /*+ rule*/FK_ID, FC_NAME, FC_ED_IZM, GET_NORM(FK_ID,GET_PACID_FROM_NAZID(pFK_NAZID)) FC_NORM, FC_TYPE
      FROM TSMID
     WHERE FK_OWNER = pFK_SMID
       AND FC_TYPE <> 'COLUMNS'
     ORDER BY FN_ORDER;

    CURSOR cGetMFolder (pFK_SMID BINARY_INTEGER) IS
    SELECT /*+ rule*/FK_ID, FC_NAME, FC_ED_IZM, GET_NORM(FK_ID, GET_PACID_FROM_NAZID(pFK_NAZID)) FC_NORM, FC_TYPE
      FROM TSMID
     WHERE FL_SHOWANAL = 4
                AND FC_TYPE <> 'COLUMNS'
                AND FC_TYPE <> 'COLUMN'
         START WITH FK_OWNER = pFK_SMID
         CONNECT BY PRIOR FK_ID = FK_OWNER
         ORDER BY TSMID.FN_ORDER;

  --   get_name_from_smid (fk_blobid), TO_CHAR (fn_res, 'FM99999999990.0999'), fc_res,
 --          get_patname (fk_patid), fk_patid, get_type_from_smid (fk_blobid),
   --        TO_CHAR (fn_res2, 'FM99999999990.0999')

    CURSOR cGetMVal(pFK_SMID BINARY_INTEGER, pFK_COLID BINARY_INTEGER) IS
    SELECT /*+ rule*/GET_NAME_FROM_SMID(FK_BLOBID) FC_NAME,
           TO_CHAR(FN_RES, 'FM99999999990.0999') FN_RES,
           FC_RES,
           get_patname (fk_patid), fk_patid,
           GET_TYPE_FROM_SMID(FK_BLOBID) FC_TYPE,
           TO_CHAR(FN_RES2, 'FM99999999990.0999') FN_RES2
      FROM TRESAN
     WHERE FK_SMID = pFK_SMID
       AND FK_NAZID = pFK_NAZID
       AND FL_ZAKL <> 1
       AND FK_COLID = pFK_COLID;

    CURSOR cGetMFolderPat(pOwner BINARY_INTEGER, pNazID BINARY_INTEGER) IS
    SELECT GET_PATNAME(FK_PATID) FC_PAT
      FROM (SELECT /*+ rule*/FK_PATID, GET_PATALOGY_LEVEL (FK_PATID) FP_PATL
              FROM TSMID, TRESAN
             WHERE TRESAN.FK_SMID = TSMID.FK_ID
               AND FK_NAZID = pNAZID
               AND TSMID.FK_OWNER = pOWNER
               AND FL_ZAKL <> 1)
     WHERE FP_PATL > 0
     ORDER BY FP_PATL;

     CURSOR cGetMZakl IS
    SELECT /*+ first_rows*/FD_INS, FC_RES, LOGIN.GET_SOTRNAME(FK_VRACHID) FC_SOTR, FK_VRACHID, FK_PACID
      FROM TRESAN
     WHERE FK_NAZID = pFK_NAZID AND FL_ZAKL = 1;

 TYPE nCID IS TABLE OF BINARY_INTEGER INDEX BY BINARY_INTEGER;
 TYPE sCNAME IS TABLE OF VARCHAR(32767) INDEX BY BINARY_INTEGER;
  str      VARCHAR2 (32767);
  str2     VARCHAR2 (32767);
  c        VARCHAR2 (32767);
  c1       VARCHAR2 (32767);
  c2       VARCHAR2 (32767);
  c3       VARCHAR2 (32767);
  ctype    VARCHAR2 (100);
  nsmid    NUMBER;
  nsmrid   NUMBER;
  n        NUMBER;
  cl       CLOB;
  nres     NUMBER;
  nres2    VARCHAR2 (100);
  cctype   VARCHAR2 (100);
  nc_tmp   VARCHAR2 (32767);
  lalala   BOOLEAN;
  naztype  VARCHAR2(100);
  nColID NUMBER;
  nColCount BINARY_INTEGER := 0;
  nColsID nCID;
  sColsNAME sCNAME;
  cNAME VARCHAR2(32767);
  endsymbol varchar2(2);
  isRes Boolean;
BEGIN
  nsmid := get_smidfromnaz (pfk_nazid);

  OPEN cd (nsmid);

  FETCH cd
   INTO c, c1, naztype;

  CLOSE cd;

  str := ' ' || c1 || ': ';
  lalala := FALSE;


  if naztype = 'TABLE' then

  OPEN cgetheader (nsmid);

  LOOP
    IF (NOT lalala)
    THEN
      FETCH cgetheader
       INTO nsmrid, c, c1, c2, ctype;

      EXIT WHEN cgetheader%NOTFOUND;

      IF ctype = 'FOLDER'
      THEN
        OPEN cgetfolder (nsmrid);

        lalala := TRUE;
      END IF;
    ELSE
      FETCH cgetfolder
       INTO nsmrid, c, c1, c2, ctype;

      IF cgetfolder%NOTFOUND
      THEN
        lalala := FALSE;
        nsmrid := null;
        CLOSE cgetfolder;
      END IF;
    END IF;

    IF c IS NULL
    THEN
      c := '';
    END IF;

    IF c1 IS NULL
    THEN
      c1 := '';
    END IF;

    IF c2 IS NULL
    THEN
      c2 := '';
    END IF;

--   str  := '*-6*'||str||'*-5*'||' ' || c || ' - '||'*-4*';
    nc_tmp := c ;
    --DBMS_OUTPUT.put_line (str);
    str2 := ' ' || c1 || ';';
    c := '';
    c1 := '';
    c2 := '';
    c3 := '';
    cctype := '';
    nres2 := '';

    OPEN cgetval (nsmrid);

    FETCH cgetval
     INTO c, c1, c2, c3, n, cctype, nres2;

    CLOSE cgetval;

    IF c IS NOT NULL OR c1 IS NOT NULL OR c2 IS NOT NULL
    THEN
      IF c IS NULL
      THEN
        c := '';
      END IF;

      IF c1 IS NULL
      THEN
        c1 := '';
      END IF;

      IF c2 IS NULL
      THEN
        c2 := '';
      END IF;

      IF c3 IS NULL
      THEN
        c3 := '';
      END IF;
      
      IF ctype = 'NUMBER'
      THEN
        IF c1 IS NOT NULL
        THEN
          str := str || nc_tmp || ' - ' || c1 || str2;
        END IF;
      ELSIF ctype = 'VARCHAR2'
      THEN
        IF c2 IS NOT NULL
        THEN
          str := str || nc_tmp || ' - ' || c2 || str2;
        END IF;
      ELSIF ctype = 'COMBOBOX'
      THEN
        IF cctype = 'NUMBER'
        THEN
          IF c1 IS NOT NULL
          THEN
            str := str || nc_tmp || ' - ' || c1 || ' ' || c || '; ';
          END IF;
        ELSIF cctype = 'VARCHAR2'
        THEN
          IF c IS NOT NULL
          THEN
            str := str || nc_tmp || ' - ' || c2 || ' ' || c || '; ';
          END IF;
        ELSIF cctype = 'DUALNUM'
        THEN
          IF c1 IS NOT NULL
          THEN
            str := str || nc_tmp || ' - ' || c1 || ' - ' || nres2 || ' ' || c || '; ';
          END IF;
        ELSE
          IF c IS NOT NULL
          THEN
            str := str || nc_tmp || ' - ' || c || '; ';
          END IF;
        END IF;
      ELSIF ctype = 'DUALNUM'
      THEN
        IF nres2 IS NOT NULL
        THEN
          str := str || nc_tmp || ' - ' || nres2 || ' ' || c || '; ';
        END IF;
      ELSE
        str := str || ';';
      END IF;
    END IF;
  END LOOP;

  CLOSE cgetheader;
  elsif naztype = 'MTABLE' then

      for p in (SELECT /*+ first_rows*/FK_ID FROM TSMID WHERE FK_OWNER = nsmid AND FC_TYPE = 'COLUMNS' ORDER BY FN_ORDER) loop
         nColID := p.FK_ID;
         EXIT;
      end loop;

     for p in (SELECT FK_ID, FC_NAME FROM TSMID WHERE FK_OWNER = nColID AND FC_TYPE = 'COLUMN' ORDER BY FN_ORDER) loop
        nColsID (nColCount)  := p.FK_ID;
        sColsNAME(nColCount)  := p.FC_NAME;
     --   sHtml := '  <TD>' || p.FC_NAME || ':</TD>'||CHR(13);
        nColCount  := nColCount + 1;
     end loop;

     for p in cGetMHeader(nsmid) loop
        nSmRID:= p.FK_ID;
        cType := p.FC_TYPE;
        cNAME := p.FC_NAME;
        IF cType = 'FOLDER' THEN
--             OPEN  cGetMFolderPat(nSMRID,pFK_NAZID);
--             FETCH cGetMFolderPat INTO cTemp;
--             CLOSE cGetMFolderPat;
             for f in cGetMFolder(nSmRID) loop
                 nSmRID:= f.FK_ID;
                 cType := f.FC_TYPE;
                 cNAME := f.FC_NAME;
             --    str :=  str || cNAME;
                 isRes := False;
                 for i in 0 .. nColCount - 1 loop

                      c := '';
                      c1 := '';
                      c2 := '';
                      c3 := '';
                      n := '';
                      cctype := '';
                      nres2 := '';
                      if i = nColCount - 1 then
                        endsymbol := '; ';
                       else
                        endsymbol := '';
                      end if;
                      OPEN cGetMVal (nSMRID, nColsID(i));
                      FETCH cGetMVal INTO c, c1, c2, c3, n, cctype, nres2;
                      CLOSE cGetMVal;
                      IF c IS NOT NULL OR c1 IS NOT NULL OR c2 IS NOT NULL THEN
                         IF c IS NULL THEN
                             c := '';
                         END IF;

                         IF c1 IS NULL THEN
                            c1 := '';
                         END IF;

                         IF c2 IS NULL THEN
                            c2 := '';
                         END IF;

                         IF c3 IS NULL THEN
                            c3 := '';
                         END IF;
                     --     str := str || sColsNAME(i) || ' - ';
                         if cNAME = '' then
                             nc_tmp := ', ' || sColsNAME(i);
                         else
                            nc_tmp := cNAME || ': ' || sColsNAME(i);
                            cNAME := '';
                         end if;
                         IF ctype = 'NUMBER' THEN
                            IF c1 IS NOT NULL THEN
                                isRes := True;
                                str := str || nc_tmp || ' - ' || c1 || str2;-- || endsymbol;
                            END IF;
                         ELSIF ctype = 'VARCHAR2' THEN
                            IF c2 IS NOT NULL THEN
                                isRes := True;
                                str := str || nc_tmp || ' - ' || c2 || str2;-- || endsymbol;
                            END IF;
                         ELSIF ctype = 'COMBOBOX' THEN
                            IF cctype = 'NUMBER' THEN
                                IF c1 IS NOT NULL THEN
                                    str := str || nc_tmp || ' - ' || c1 || ' ' || c ;--|| endsymbol;
                                    isRes := True;
                                END IF;
                             ELSIF cctype = 'VARCHAR2' THEN
                                IF c IS NOT NULL THEN
                                    str := str || nc_tmp || ' - ' || c2 || ' ' || c ;--|| endsymbol;
                                    isRes := True;
                                END IF;
                             ELSIF cctype = 'DUALNUM' THEN
                                IF c1 IS NOT NULL THEN
                                    str := str || nc_tmp || ' - ' || c1 || ' - ' || nres2 || ' ' || c ;--|| endsymbol;
                                    isRes := True;
                                END IF;
                             ELSE
                                IF c IS NOT NULL THEN
                                    str := str || nc_tmp || ' - ' || c;-- || endsymbol;
                                    isRes := True;
                                END IF;
                             END IF;
                        ELSIF ctype = 'DUALNUM' THEN
                            IF nres2 IS NOT NULL THEN
                                str := str || nc_tmp || ' - ' || nres2 || ' ' || c;-- || endsymbol;
                                isRes := True;
                            END IF;
                        ELSE
                            str := str || ';';
                        END IF;

                        END IF;

     --     FETCH cGetMVal INTO cTemp, cTemp1, cTemp2, cType1, cTemp4;
    --      CLOSE cGetMVal;
                 END LOOP;
                 if isRes then
                    str := str || '; ';
                 end if;
             END LOOP;
            else
                --    str :=  str || cNAME || ': ';
                     isRes := False;
                     for i in 0 .. nColCount - 1 loop

                      c := '';
                      c1 := '';
                      c2 := '';
                      c3 := '';
                      n := '';
                      cctype := '';
                      nres2 := '';
                      if i = nColCount - 1 then
                        endsymbol := '; ';
                       else
                        endsymbol := ', ';
                      end if;
                      OPEN cGetMVal (nSMRID, nColsID(i));

                      FETCH cGetMVal INTO c, c1, c2, c3, n, cctype, nres2;
                      CLOSE cGetMVal;
                      IF c IS NOT NULL OR c1 IS NOT NULL OR c2 IS NOT NULL THEN
                         IF c IS NULL THEN
                             c := '';
                         END IF;

                         IF c1 IS NULL THEN
                            c1 := '';
                         END IF;

                         IF c2 IS NULL THEN
                            c2 := '';
                         END IF;

                         IF c3 IS NULL THEN
                            c3 := '';
                         END IF;
--str := '"' ||TO_CHAR(nSMRID) || '-'|| TO_CHAR(nColsID(i)) || '"';
                        -- str := str || sColsNAME(i) || ' - ';
                      --  nc_tmp := sColsNAME(i);

                        if cNAME = '' then
                             nc_tmp := ', ' || sColsNAME(i);
                         else
                            nc_tmp := cNAME || ': ' || sColsNAME(i);
                            cNAME := '';
                         end if;
                         IF ctype = 'NUMBER' THEN
                            IF c1 IS NOT NULL THEN
                                str := str || nc_tmp || ' - ' || c1 || str2;-- || endsymbol;
                                isRes := True;
                            END IF;
                         ELSIF ctype = 'VARCHAR2' THEN
                            IF c2 IS NOT NULL THEN
                                str := str || nc_tmp || ' - ' || c2 || str2;-- || endsymbol;
                                isRes := True;
                            END IF;
                         ELSIF ctype = 'COMBOBOX' THEN
                            IF cctype = 'NUMBER' THEN
                                IF c1 IS NOT NULL THEN
                                    str := str || nc_tmp || ' - ' || c1 || ' ' || c ;--|| endsymbol;
                                    isRes := True;
                                END IF;
                             ELSIF cctype = 'VARCHAR2' THEN
                                IF c IS NOT NULL THEN
                                    str := str || nc_tmp || ' - ' || c2 || ' ' || c ;--|| endsymbol;
                                    isRes := True;
                                END IF;
                             ELSIF cctype = 'DUALNUM' THEN
                                IF c1 IS NOT NULL THEN
                                    str := str || nc_tmp || ' - ' || c1 || ' - ' || nres2 || ' ' || c ;--|| endsymbol;
                                    isRes := True;
                                END IF;
                             ELSE
                                IF c IS NOT NULL THEN
                                    str := str || nc_tmp || ' - ' || c ;--|| endsymbol;
                                    isRes := True;
                                END IF;
                             END IF;
                        ELSIF ctype = 'DUALNUM' THEN
                            IF nres2 IS NOT NULL THEN
                                str := str || nc_tmp || ' - ' || nres2 || ' ' || c ;--|| endsymbol;
                                isRes := True;
                            END IF;
                        ELSE
                            str := str || ';';
                        END IF;
                        END IF;

     --     FETCH cGetMVal INTO cTemp, cTemp1, cTemp2, cType1, cTemp4;
    --      CLOSE cGetMVal;

                 END LOOP;

                 if isRes then
                  str :=  str || '; ';
                 end if;
       --      END LOOP;


         -- str := 'kajsdfkjashndfkjasdf';
        END IF;






     END LOOP;




 -- END LOOP;



  end if;

  RETURN str;
END;                                                                    -- Function GET_RESULT_TABLE
/

SHOW ERRORS;


