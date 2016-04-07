DROP FUNCTION ASU.GET_ANAL_RESULT_OBCHBIO_THTML
/

--
-- GET_ANAL_RESULT_OBCHBIO_THTML  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBMS_LOB (Synonym)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   GET_SOTRNAME (Function)
--   GET_SOTR_OTDELNAME (Function)
--   TNAZAN (Table)
--   TLABREG (Table)
--   TRESAN (Table)
--   TSMID (Table)
--   PKG_REGIST_PACFUNC (Package)
--   PKG_SMINI (Package)
--   GET_ANALBIOHIM (Function)
--   GET_COUNTRY (Function)
--   GET_FULLPATH_SHA (Function)
--   GET_NAME_FROM_SMID (Function)
--   GET_NAZSOS (Function)
--   GET_NAZ_CANCEL (Function)
--   GET_NORM (Function)
--   GET_PACID_FROM_NAZID (Function)
--   GET_PATALOGY_LEVEL (Function)
--   GET_PATNAME (Function)
--   GET_REGION (Function)
--   GET_STREET (Function)
--   GET_TOWN (Function)
--   GET_TYPE_FROM_SMID (Function)
--   GET_VIPNAZ (Function)
--
CREATE OR REPLACE FUNCTION ASU."GET_ANAL_RESULT_OBCHBIO_THTML" (pFD_DATE IN DATE, pFN_PROBE IN NUMBER)
  RETURN CLOB IS
  --by TimurLan

CURSOR cNAZCAUSE(pFK_NAZCAUSE INTEGER) IS
    SELECT FC_NAME FROM TSMID WHERE FK_ID = pFK_NAZCAUSE;


CURSOR cGetNaz IS
  SELECT FK_SMID, T.FC_NAME, FD_NAZ, FD_RUN, FK_NAZSOSID, FC_NAZSOS, FK_VRACHID, T.FK_NAZCAUSEID
    FROM TSMID,
           (SELECT TSMID.fk_id, TNAZAN.FK_SMID, TRIM(GET_FULLPATH_SHA(TNAZAN.FK_SMID)) FC_NAME, TNAZAN.FD_NAZ, TNAZAN.FD_RUN, TNAZAN.FK_NAZSOSID, GET_NAZSOS(TNAZAN.FK_NAZSOSID) FC_NAZSOS, TNAZAN.FK_VRACHID, TNAZAN.FK_NAZCAUSEID
            FROM TSMID, TLABREG, TNAZAN
            WHERE TRUNC(TLABREG.FD_REGIST) = TRUNC(pFD_DATE)
                    AND TLABREG.FN_PROBE = pFN_PROBE
                    AND TNAZAN.fk_smid = TSMID.fk_id
                    AND TLABREG.FK_NAZID(+) = TNAZAN.FK_ID
                    AND FK_OWNER = GET_ANALBIOHIM ) T
  WHERE TSMID.FK_OWNER = T.FK_ID;

CURSOR cGetZakl IS
    SELECT distinct FD_INS, FC_RES, LOGIN.GET_SOTRNAME(FK_VRACHID) FC_SOTR, FK_VRACHID, FK_PACID
    FROM TRESAN
    WHERE TRESAN.fk_nazid IN (SELECT NAZANID
                              FROM TSMID,
                                  (SELECT TSMID.fk_id, TNAZAN.fk_id as NAZANID, TNAZAN.fk_nazsosid
                                   FROM TSMID, TLABREG, TNAZAN
                                   WHERE TRUNC(TLABREG.FD_REGIST) = TRUNC(pFD_DATE)
                                         AND TLABREG.FN_PROBE = pFN_PROBE
                                         AND TNAZAN.fk_smid = TSMID.fk_id
                                         AND TLABREG.FK_NAZID(+) = TNAZAN.FK_ID
                                         AND FK_OWNER = GET_ANALBIOHIM ) T
                              WHERE TSMID.FK_OWNER = T.FK_ID)
    AND FL_ZAKL=1;

CURSOR cGetHeader(pFK_SMID BINARY_INTEGER) IS
    SELECT TSMID.FK_ID, TSMID.FC_NAME, TSMID.FC_ED_IZM, GET_NORM(TSMID.FK_ID,GET_PACID_FROM_NAZID(FK_NAZID)) FC_NORM, TSMID.FC_TYPE
    FROM TSMID,
           (SELECT TSMID.fk_id, FK_NAZID
            FROM TSMID, TLABREG, TNAZAN
            WHERE TRUNC(TLABREG.FD_REGIST) = TRUNC(pFD_DATE)
                    AND TLABREG.FN_PROBE = pFN_PROBE
                    AND TNAZAN.fk_smid = TSMID.fk_id
                    AND TLABREG.FK_NAZID(+) = TNAZAN.FK_ID
                    AND FK_OWNER = GET_ANALBIOHIM ) T
    WHERE TSMID.FK_OWNER = T.FK_ID
    ORDER BY FN_ORDER;


  CURSOR cGetFolderPat(pOwner BINARY_INTEGER, pNazID BINARY_INTEGER) IS
    SELECT GET_PATNAME(FK_PATID) FC_PAT
      FROM (SELECT /*+ rule*/FK_PATID, GET_PATALOGY_LEVEL (FK_PATID) FP_PATL
              FROM TSMID, TRESAN
             WHERE TRESAN.FK_SMID = TSMID.FK_ID
               AND FK_NAZID = pNAZID
               AND TSMID.FK_OWNER = pOWNER
               AND FL_ZAKL <> 1)
     WHERE FP_PATL > 0
     ORDER BY FP_PATL;


CURSOR cGetFolder (pFK_SMID BINARY_INTEGER) IS
    SELECT TSMID.FK_ID, TSMID.FC_NAME, TSMID.FC_ED_IZM, GET_NORM(TSMID.FK_ID,GET_PACID_FROM_NAZID(FK_NAZID)) FC_NORM, TSMID.FC_TYPE
    FROM TSMID,
           (SELECT TSMID.fk_id, FK_NAZID
            FROM TSMID, TLABREG, TNAZAN
            WHERE TRUNC(TLABREG.FD_REGIST) = TRUNC(pFD_DATE)
                    AND TLABREG.FN_PROBE = pFN_PROBE
                    AND TNAZAN.fk_smid = TSMID.fk_id
                    AND TLABREG.FK_NAZID(+) = TNAZAN.FK_ID
                    AND FK_OWNER = GET_ANALBIOHIM ) T
    WHERE TSMID.FK_OWNER = T.FK_ID
    ORDER BY FN_ORDER;

  CURSOR cGetVal(pFK_SMID BINARY_INTEGER) IS
    SELECT /*+ rule*/GET_NAME_FROM_SMID(FK_BLOBID) FC_NAME,
           TO_CHAR(FN_RES, 'FM99999999990.0999') FN_RES,
           FC_RES,
           GET_PATNAME(FK_PATID) FC_PAT,
           FK_PATID,
           GET_TYPE_FROM_SMID(FK_BLOBID) FC_TYPE,
           TO_CHAR(FN_RES2, 'FM99999999990.0999') FN_RES2
    FROM TRESAN
    WHERE TRESAN.fk_nazid IN (SELECT NAZANID
                          FROM TSMID,
                              (SELECT TSMID.fk_id, TNAZAN.fk_id as NAZANID, TNAZAN.fk_nazsosid
                               FROM TSMID, TLABREG, TNAZAN
                               WHERE TRUNC(TLABREG.FD_REGIST) = TRUNC(pFD_DATE)
                                     AND TLABREG.FN_PROBE = pFN_PROBE
                                     AND TNAZAN.fk_smid = TSMID.fk_id
                                     AND TLABREG.FK_NAZID(+) = TNAZAN.FK_ID
                                     AND FK_OWNER = GET_ANALBIOHIM ) T
                          WHERE TSMID.FK_OWNER = T.FK_ID
                          AND TSMID.FK_ID = pFK_SMID )
    AND FL_ZAKL<>1;

  clTemp  CLOB;
  sHtml   LONG;
  nSmidID BINARY_INTEGER;
  nSmRID  BINARY_INTEGER;
  cType   TSMID.FC_TYPE%TYPE;
  cType1  TSMID.FC_TYPE%TYPE;
  cZakl   TRESAN.FC_RES%TYPE;
  nPat    TRESAN.FK_PATID%TYPE;
  dDone   DATE;
  cSotr   LONG;
  cTemp   LONG;
  cTemp1  LONG;
  cTemp2  LONG;
  cTemp3  LONG;
  cTemp4  LONG;
  nNazSotrID BINARY_INTEGER;
  strNAZCAUSE VARCHAR(200);
BEGIN
  DBMS_LOB.CREATETEMPORARY(clTemp, FALSE);

  for p in cGetNaz loop
    if p.FK_NAZSOSID = GET_VIPNAZ then
      nSmidID := p.FK_SMID;
      cTemp   := p.FC_NAME;
      nNazSotrID := p.FK_VRACHID;
      EXIT;
    else
      sHtml := '<BR>Лабораторное исследование "Общая биохимия" (' || TO_CHAR(p.FD_NAZ, 'dd.mm.yyyy') || ') имеет статус <B>' || p.FC_NAZSOS || '</B><BR>';
      DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);
      IF p.FK_NAZSOSID = GET_NAZ_CANCEL THEN
        OPEN  cNAZCAUSE(p.FK_NAZCAUSEID);
        FETCH cNAZCAUSE INTO strNAZCAUSE;
        CLOSE cNAZCAUSE;
        sHtml := '<BR>Причина отмены: <B>'|| strNAZCAUSE || '</B><BR>';
        DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);
      END IF;
      RETURN (clTemp);
    end if;
  end loop;

  if nSmidID is null then
    RETURN (NULL);
  end if;

  for p in cGetZakl loop
    sHtml := '<DIV ALIGN=CENTER>'||CHR(13)||
             ' <P><FONT style=''font-size:12.0pt;color:navy''><B>'||PKG_SMINI.READSTRING('CONFIG','S_FULLNAME','Ханты-Мансийский автономный округ<BR>государственное учреждение здравоохранения<B>ОКРУЖНАЯ КЛИНИЧЕСКАЯ БОЛЬНИЦА</B>')||'</B></FONT>'||CHR(13)||
             ' <BR><FONT style=''font-size:8.0pt''>'||
               GET_COUNTRY(PKG_SMINI.READSTRING('CONFIG','S_COUNTRY','-1'))||','||
               GET_REGION(PKG_SMINI.READSTRING('CONFIG','S_REGION','-1'))||','||
               GET_TOWN(PKG_SMINI.READSTRING('CONFIG','S_TOWN','-1'))||','||
               GET_STREET(PKG_SMINI.READSTRING('CONFIG','S_STREET','-1'))||' '||
               PKG_SMINI.READSTRING('CONFIG','S_HOUSE','')||' <BR>тел.'||
               PKG_SMINI.READSTRING('CONFIG','S_PHONE','')||' факс'||
               PKG_SMINI.READSTRING('CONFIG','S_FAX','')||' e-mail:'||
               PKG_SMINI.READSTRING('CONFIG','S_EMAIL','')||' '||
             ' </FONT>'||CHR(13)||
             ' <P><FONT style=''font-size:14.0pt;color:red''><B>'||LOGIN.GET_SOTR_OTDELNAME(p.FK_VRACHID)||'</B></FONT>'||CHR(13)||
             '</DIV>'||CHR(13)||
             ' <P>ФИО: '||PKG_REGIST_PACFUNC.GET_PAC_FIO(p.FK_PACID)||CHR(13)||
             ' <BR>Адрес: '||PKG_REGIST_PACFUNC.GET_PAC_ADRFULL(p.FK_PACID)||CHR(13)||
             ' <BR>Врач: '||LOGIN.GET_SOTRNAME(nNazSotrID)||CHR(13)||
             ' <BR>Подразделение: '||LOGIN.GET_SOTR_OTDELNAME(nNazSotrID)||CHR(13)||
             '<P>Результат лабораторного исследования "Общая биохимия"'||CHR(13);
    --sHtml := '<BR>Результат лабораторного исследования "' || cTemp || '"<BR>'||CHR(13);
    cZakl := TRIM(p.FC_RES);
    dDone := p.FD_INS;
    cSotr := p.FC_SOTR;
    DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);
  end loop;

  sHtml := CHR(13)||'<TABLE WIDTH="100%" BORDER="1" ALIGN="CENTER" BORDERCOLORDARK="#FFFFFF" BORDERCOLORLIGHT="#000000" CELLPADDING="0" CELLSPACING="0">'||CHR(13)||
           ' <TR ALIGN="CENTER">'||CHR(13)||
           '  <TD WIDTH="30%">Наименование:</TD>'||CHR(13)||
           '  <TD WIDTH="10%">Ед.изм.:</TD>'||CHR(13)||
           '  <TD WIDTH="15%">Норма:</TD>'||CHR(13)||
           '  <TD WIDTH="25%">Результат:</TD>'||CHR(13)||
           '  <TD WIDTH="20%">Примечание:</TD>'||CHR(13)||
           ' </TR>'||CHR(13);
  DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);

  for p in cGetHeader(nSmidID) loop
    nSmRID:= p.FK_ID;
    cTemp := NVL(p.FC_NAME,'&nbsp;');
    cTemp1 := NVL(p.FC_ED_IZM,'&nbsp;');
    cTemp2 := NVL(p.FC_NORM,'&nbsp;');
    cType := p.FC_TYPE;

    /*sHtml := ' <TR ALIGN="LEFT">'||CHR(13)||
             '  <TD WIDTH="30%"><B>' || cTemp || '</B></TD>'||CHR(13)||
             '  <TD WIDTH="10%" ALIGN="CENTER">' || cTemp1 || '</TD>'||CHR(13)||
             '  <TD WIDTH="15%" ALIGN="CENTER">' || cTemp2 || '</TD>'||CHR(13)||
             '  <TD WIDTH="25%" ALIGN="CENTER">';*/
    --DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);
    IF cType = 'FOLDER' THEN
      sHtml := ' <TR ALIGN="LEFT">'||CHR(13)||
               '  <TD WIDTH="30%"><B>' || cTemp || '</B></TD>'||CHR(13)||
               '  <TD WIDTH="10%" ALIGN="CENTER">' || cTemp1 || '</TD>'||CHR(13)||
               '  <TD WIDTH="15%" ALIGN="CENTER">' || cTemp2 || '</TD>'||CHR(13)||
               '  <TD WIDTH="25%" ALIGN="CENTER">'|| '&nbsp;</TD>'||CHR(13)||
               '  <TD WIDTH="20%" ALIGN="CENTER">';
      --DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);
      cTemp := '';
  --    for f in cGetFolderPat(nSMRID,pFK_NAZID) loop
 --       cTemp := f.FC_PAT;
 --     end loop;
      sHtml := sHtml || NVL(cTemp,'&nbsp;') ||'</TD>'||CHR(13)||' </TR>'||CHR(13);
      --DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);

      for f in cGetFolder(nSMRID) loop
        nSmRID:= f.FK_ID;
        cType := f.FC_TYPE;
        cTemp := '';
        cTemp1 := '';
        cTemp2 := '';
        cTemp3 := '';
        cType1  := '';
        cTemp4 := '';
        nPat := 0;
        OPEN cGetVal (nSMRID);
        FETCH cGetVal INTO cTemp, cTemp1, cTemp2, cTemp3, nPat, cType1, cTemp4;
        CLOSE cGetVal;
        if cTemp IS NULL AND cTemp1 IS NULL AND cTemp2 IS NULL then
          NULL;
        else
          if sHtml is not null then
            DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);
          end if;
          sHtml := ' <TR ALIGN="LEFT">'||CHR(13)||
                   '  <TD WIDTH="30%">&nbsp;&nbsp;<B>' || NVL(f.FC_NAME,'&nbsp;') || '</B></TD>'||CHR(13)||
                   '  <TD WIDTH="10%" ALIGN="CENTER">' || NVL(f.FC_ED_IZM,'&nbsp;') || '</TD>'||CHR(13)||
                   '  <TD WIDTH="15%" ALIGN="CENTER">' || NVL(f.FC_NORM,'&nbsp;') || '</TD>'||CHR(13)||
                   '  <TD WIDTH="25%" ALIGN="CENTER">';

          DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);
          cTemp := NVL(cTemp,'&nbsp;');
          cTemp1 := NVL(cTemp1,'&nbsp;');
          cTemp2 := NVL(cTemp2,'&nbsp;');
          cTemp3 := NVL(cTemp3,'&nbsp;');

          IF cType = 'NUMBER' THEN
            sHtml := cTemp1;
          ELSIF cType = 'VARCHAR2' THEN
            sHtml := cTemp2;
          ELSIF cType = 'COMBOBOX' THEN
            sHtml := cTemp;
            IF cType1 = 'NUMBER' THEN
              sHtml := cTemp1 ||' '|| cTemp;
            ELSIF cType1 = 'VARCHAR2' THEN
              sHtml := cTemp2 ||' '|| cTemp;
            ELSIF cType1 = 'DUALNUM' THEN
              sHtml := cTemp1 ||' - '|| cTemp4 ||' '|| cTemp;
            END IF;
          ELSIF cType = 'DUALNUM' THEN
            sHtml := cTemp1 ||' - '|| cTemp4 ||' '|| cTemp;
          END IF;
          sHtml := NVL(TRIM(sHtml),'&nbsp;') || '</TD>'||CHR(13)||'  <TD WIDTH="20%" ALIGN="CENTER">';
          DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);

          IF nPat <> 0 THEN
            sHtml := cTemp3 || '</TD>'||CHR(13)||' </TR>'||CHR(13);
          ELSE
            sHtml := '&nbsp;</TD>'||CHR(13)||' </TR>'||CHR(13);
          END IF;
          DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);
          sHtml := '';
        end if;
      end loop;
    ELSE -- if cType <> 'FOLDER'

      sHtml := ' <TR ALIGN="LEFT">'||CHR(13)||
               '  <TD WIDTH="30%"><B>' || cTemp || '</B></TD>'||CHR(13)||
               '  <TD WIDTH="10%" ALIGN="CENTER">' || cTemp1 || '</TD>'||CHR(13)||
               '  <TD WIDTH="15%" ALIGN="CENTER">' || cTemp2 || '</TD>'||CHR(13)||
               '  <TD WIDTH="25%" ALIGN="CENTER">';
      cTemp := '';
      cTemp1 := '';
      cTemp2 := '';
      cTemp3 := '';
      cType1 := '';
      cTemp4 := '';
      nPat := 0;
      OPEN cGetVal (nSMRID);
      FETCH cGetVal INTO cTemp, cTemp1, cTemp2, cTemp3, nPat, cType1, cTemp4;
      CLOSE cGetVal;
      if cTemp IS NOT NULL OR cTemp1 IS NOT NULL OR cTemp2 IS NOT NULL then
        DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);
        cTemp := NVL(cTemp,'&nbsp;');
        cTemp1 := NVL(cTemp1,'&nbsp;');
        cTemp2 := NVL(cTemp2,'&nbsp;');
        cTemp3 := NVL(cTemp3,'&nbsp;');
        sHtml := '&nbsp;';
        IF cType = 'NUMBER' THEN
          sHtml := cTemp1;
        ELSIF cType = 'VARCHAR2' THEN
          sHtml := cTemp2;
        ELSIF cType = 'COMBOBOX' THEN
          sHtml := cTemp;
          IF cType1 = 'NUMBER' THEN
            sHtml := cTemp1 ||' '|| cTemp;
          ELSIF cType1 = 'VARCHAR2' THEN
            sHtml := cTemp2 ||' '|| cTemp;
          ELSIF cType1 = 'DUALNUM' THEN
            sHtml := cTemp1 ||' - '|| cTemp4 ||' '|| cTemp;
          END IF;
        ELSIF cType = 'DUALNUM' THEN
          sHtml := cTemp1 ||' - '|| cTemp4 ||' '|| cTemp;
        END IF;
        sHtml := sHtml || '</TD>'||CHR(13)||'  <TD WIDTH="20%" ALIGN="CENTER">';
        DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);

        IF nPat <> 0 THEN
          sHtml := cTemp3 || '</TD>'||CHR(13)||' </TR>'||CHR(13);
        ELSE
          sHtml := '&nbsp;</TD>'||CHR(13)||' </TR>'||CHR(13);
        END IF;
        DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);
      END IF;
    END IF;
  END LOOP;

  sHtml := '</TABLE>'||CHR(13);
  if cZakl IS NOT NULL then
    sHtml := sHtml || '<BR><I>Заключение: </I>' || cZakl ||CHR(13);
  end if;
  sHtml := sHtml || '<BR><B>'|| TO_CHAR(dDone,'DD.MM.YYYY') ||' '|| cSotr ||'</B>'||CHR(13);

  DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);
  RETURN (clTemp);
END;
/

SHOW ERRORS;


