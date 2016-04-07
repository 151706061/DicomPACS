DROP FUNCTION ASU.GET_ANAL_RESULT_MHTML
/

--
-- GET_ANAL_RESULT_MHTML  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBMS_LOB (Synonym)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   PLITBLM (Synonym)
--   GET_SOTRNAME (Function)
--   GET_SOTR_OTDELNAME (Function)
--   TNAZAN (Table)
--   TRESAN (Table)
--   TSMID (Table)
--   PKG_REGIST_PACFUNC (Package)
--   PKG_SMINI (Package)
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
CREATE OR REPLACE FUNCTION ASU."GET_ANAL_RESULT_MHTML" (pFK_NAZID IN BINARY_INTEGER)
  RETURN CLOB IS

  CURSOR cNAZCAUSE(pFK_NAZCAUSE INTEGER) IS
    SELECT FC_NAME FROM TSMID WHERE FK_ID = pFK_NAZCAUSE;

  --by TimurLan
  CURSOR cGetNaz IS
    SELECT /*+ first_rows*/FK_SMID, TRIM(GET_FULLPATH_SHA(FK_SMID)) FC_NAME, FD_NAZ, FD_RUN, FK_NAZSOSID, GET_NAZSOS(FK_NAZSOSID) FC_NAZSOS, FK_VRACHID, FK_NAZCAUSEID
      FROM TNAZAN
     WHERE FK_ID = pFK_NAZID;
  CURSOR cGetZakl IS
    SELECT /*+ first_rows*/FD_INS, FC_RES, LOGIN.GET_SOTRNAME(FK_VRACHID) FC_SOTR, FK_VRACHID, FK_PACID
      FROM TRESAN
     WHERE FK_NAZID = pFK_NAZID AND FL_ZAKL = 1;
  CURSOR cGetHeader(pFK_SMID BINARY_INTEGER) IS
    SELECT /*+ rule*/FK_ID, FC_NAME, FC_ED_IZM, GET_NORM(FK_ID,GET_PACID_FROM_NAZID(pFK_NAZID)) FC_NORM, FC_TYPE
      FROM TSMID
     WHERE FK_OWNER = pFK_SMID
       AND FC_TYPE <> 'COLUMNS'
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
    SELECT /*+ rule*/FK_ID, FC_NAME, FC_ED_IZM, GET_NORM(FK_ID, GET_PACID_FROM_NAZID(pFK_NAZID)) FC_NORM, FC_TYPE
      FROM TSMID
     WHERE FK_OWNER = pFK_SMID
       AND FC_TYPE <> 'COLUMNS'
     ORDER BY FN_ORDER;
  CURSOR cGetVal(pFK_SMID BINARY_INTEGER, pFK_COLID BINARY_INTEGER) IS
    SELECT /*+ rule*/GET_NAME_FROM_SMID(FK_BLOBID) FC_NAME,
           TO_CHAR(FN_RES, 'FM99999999990.0999') FN_RES,
           FC_RES,
           GET_TYPE_FROM_SMID(FK_BLOBID) FC_TYPE,
           TO_CHAR(FN_RES2, 'FM99999999990.0999') FN_RES2
      FROM TRESAN
     WHERE FK_SMID = pFK_SMID
       AND FK_NAZID = pFK_NAZID
       AND FL_ZAKL <> 1
       AND FK_COLID = pFK_COLID;
  CURSOR cGetPat (pFK_SMID BINARY_INTEGER) IS
    SELECT /*+ rule*/GET_PATNAME (FK_PATID) FC_PAT, GET_PATALOGY_LEVEL (FK_PATID) FN_PATL
      FROM TRESAN
     WHERE FK_SMID = pFK_SMID
       AND FK_NAZID = pFK_NAZID
       AND FL_ZAKL <> 1
     ORDER BY FN_PATL DESC;

  TYPE nCID IS TABLE OF BINARY_INTEGER INDEX BY BINARY_INTEGER;
  TYPE nCID2 IS TABLE OF BINARY_INTEGER INDEX BY BINARY_INTEGER;
  clTemp  CLOB;
  sHtml   LONG;
  sHtmlF  LONG;
  nSmidID BINARY_INTEGER;
  nColID  BINARY_INTEGER;
  nColCount BINARY_INTEGER := 0;
  nColsID nCID;
  nSmRID  BINARY_INTEGER;
  cType   TSMID.FC_TYPE%TYPE;
  cType1  TSMID.FC_TYPE%TYPE;
  cZakl   TRESAN.FC_RES%TYPE;
  nPat    TRESAN.FK_PATID%TYPE;
  dDone   DATE;
  cSotr   LONG;
  bFilled BOOLEAN;
  cTemp   LONG;
  cTemp1  LONG;
  cTemp2  LONG;
  cTemp3  LONG;
  cTemp4  LONG;
  nNazSotrID BINARY_INTEGER;
  strNAZCAUSE VARCHAR(200);
  -- Added by Melnikov 2014.06.16
  nTempCall number;
  nColsID2 nCID2;
  nColID2  BINARY_INTEGER;
  nColCountTemp BINARY_INTEGER := 0;
BEGIN
  DBMS_LOB.CREATETEMPORARY(clTemp, FALSE);

  for p in cGetNaz loop
    if p.FK_NAZSOSID = GET_VIPNAZ then
      nSmidID := p.FK_SMID;
      cTemp   := p.FC_NAME;
      nNazSotrID := p.FK_VRACHID;
      EXIT;
    else
      sHtml := '<BR>Лабораторное исследование "' || p.FC_NAME || '" (' || TO_CHAR(p.FD_NAZ, 'dd.mm.yyyy') || ') имеет статус <B>' || p.FC_NAZSOS || '</B><BR>';
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
             '<P>Результат лабораторного исследования "' || cTemp || '"'||CHR(13);
    --sHtml := '<BR>Результат лабораторного исследования "' || cTemp || '"<BR>'||CHR(13);
    cZakl := TRIM(p.FC_RES);
    dDone := p.FD_INS;
    cSotr := p.FC_SOTR;
    DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);
  end loop;

  for p in (SELECT /*+ first_rows*/FK_ID FROM TSMID WHERE FK_OWNER = nSmidID and fl_del = 0 AND FC_TYPE = 'COLUMNS' ORDER BY FN_ORDER) loop
    nColID := p.FK_ID;
    EXIT;
  end loop;
  
  -- Added by Melnikov 2014.06.16
  nTempCall := 0;
  for p in (SELECT /*+ first_rows*/FK_ID FROM TSMID WHERE FK_OWNER = nSmidID and fl_del = 1 AND FC_TYPE = 'COLUMNS' ORDER BY FN_ORDER) loop
   -- if nTempCall = 1 then
      nColID2 := p.FK_ID;
      EXIT;
   -- end if;
  --  nTempCall := nTempCall + 1;
  end loop;

  sHtml := CHR(13)||'<TABLE WIDTH="100%" BORDER="1" ALIGN="CENTER" BORDERCOLORDARK="#FFFFFF" BORDERCOLORLIGHT="#000000" CELLPADDING="0" CELLSPACING="0">'||CHR(13)||
           ' <TR ALIGN="CENTER">'||CHR(13)||
           '  <TD>Наименование:</TD>'||CHR(13)||
           '  <TD>Ед.изм.:</TD>'||CHR(13)||
           '  <TD>Норма:</TD>'||CHR(13);
  DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);

  for p in (SELECT FK_ID, FC_NAME FROM TSMID WHERE FK_OWNER = nColID AND FC_TYPE = 'COLUMN' ORDER BY FN_ORDER) loop
    nColsID (nColCount)  := p.FK_ID;
    sHtml := '  <TD>' || p.FC_NAME || ':</TD>'||CHR(13);
    nColCount  := nColCount + 1;
    DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);
  end loop;

  sHtml := '  <TD>Примечание:</TD>'||CHR(13)||
           ' </TR>'||CHR(13);
  DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);

  -- Added by Melnikov 2014.06.16
  for p in (SELECT FK_ID, FC_NAME FROM TSMID WHERE FK_OWNER = nColID2 AND FC_TYPE = 'COLUMN' ORDER BY FN_ORDER) loop
    nColsID2 (nColCountTemp)  := p.FK_ID;
    nColCountTemp  := nColCountTemp + 1;
  end loop;

  for p in cGetHeader(nSmidID) loop
    nSmRID:= p.FK_ID;
    cType := p.FC_TYPE;

    IF cType = 'FOLDER' THEN
      sHtml := ' <TR ALIGN="LEFT">'||CHR(13)||
               '  <TD><B>' || NVL(p.FC_NAME,'&nbsp;') || '</B></TD>'||CHR(13)||
               '  <TD ALIGN="CENTER">' || NVL(p.FC_ED_IZM,'&nbsp;') || '</TD>'||CHR(13)||
               '  <TD ALIGN="CENTER">' || NVL(p.FC_NORM,'&nbsp;');
      --DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);
      FOR i IN 0 .. nColCount - 1 LOOP
        sHtml := sHtml ||'</TD>'||CHR(13)||'  <TD ALIGN="CENTER">&nbsp;';
        --DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);
      END LOOP;
      sHtml := sHtml ||'&nbsp;</TD>'||CHR(13)||'  <TD ALIGN="CENTER">';
      --DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);

      cTemp := '';
      OPEN  cGetFolderPat(nSMRID,pFK_NAZID);
      FETCH cGetFolderPat INTO cTemp;
      CLOSE cGetFolderPat;
      sHtml := sHtml || NVL(cTemp,'&nbsp;')||'</TD>'||CHR(13)||' </TR>'||CHR(13);
      --DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);

      for f in cGetFolder(nSMRID) loop
        nSmRID:= f.FK_ID;
        cType := f.FC_TYPE;
        sHtmlF := ' <TR ALIGN="LEFT">'||CHR(13)||
                  '  <TD>&nbsp;&nbsp;<B>' || NVL(f.FC_NAME,'&nbsp;') || '</B></TD>'||CHR(13)||
                  '  <TD ALIGN="CENTER">' || NVL(f.FC_ED_IZM,'&nbsp;') || '</TD>'||CHR(13)||
                  '  <TD ALIGN="CENTER">' || NVL(f.FC_NORM,'&nbsp;');
        bFilled  := FALSE;

        for i in 0 .. nColCount - 1 loop
          sHtmlF := sHtmlF ||'</TD>'||CHR(13)||'  <TD ALIGN="CENTER">';
          cTemp      := '';
          cTemp1     := '';
          cTemp2     := '';
          cTemp4     := '';
          cType1  := '';
          OPEN cGetVal (nSMRID, nColsID(i));
          FETCH cGetVal INTO cTemp, cTemp1, cTemp2, cType1, cTemp4;
          CLOSE cGetVal;
          
          --Added by Melnikov 2014.06.16
        if (cTemp is null) and  -- не если изменили столбци "результат"
           (cTemp1 is null) and
           (cTemp2 is null) and
           (cTemp4 is null) and
           (cType1 is null) /*and
           --(cTemp0 is null) and
           (cFK_SOS is null) and (nColCountTemp >= i) and (nColCountTemp > 0)*/ then
           if nColsID2.exists(i) then
           OPEN cGetVal (nSMRID, nColsID2(i));
           FETCH cGetVal INTO cTemp, cTemp1, cTemp2, cType1, cTemp4;
           CLOSE cGetVal;        
           end if;
        end if;

          bFilled := bFilled OR cTemp IS NOT NULL OR cTemp1 IS NOT NULL OR cTemp2 IS NOT NULL OR cTemp4 IS NOT NULL;
          cTemp := NVL(cTemp,'&nbsp;');
          cTemp1 := NVL(cTemp1,'&nbsp;');
          cTemp2 := NVL(cTemp2,'&nbsp;');
          cTemp4 := NVL(cTemp4,'&nbsp;');

          IF cType = 'NUMBER' THEN
            sHtmlF := sHtmlF || cTemp1;
          ELSIF cType = 'VARCHAR2' THEN
            sHtmlF := sHtmlF || cTemp2;
          ELSIF cType = 'COMBOBOX' THEN
            IF cType1 = 'NUMBER' THEN
              sHtmlF := sHtmlF || cTemp1 ||' '|| cTemp;
            ELSIF cType1 = 'VARCHAR2' THEN
              sHtmlF := sHtmlF || cTemp2 ||' '|| cTemp;
            ELSIF cType1 = 'DUALNUM' THEN
              sHtmlF := sHtmlF || cTemp1 ||' - '|| cTemp4 ||' '|| cTemp;
            ELSE
              sHtmlF := sHtmlF || cTemp;
            END IF;
          ELSIF cType = 'DUALNUM' THEN
            sHtmlF := sHtmlF || cTemp1 ||' - '|| cTemp4;
          ELSE
            sHtmlF := sHtmlF || '&nbsp;';
          END IF;
        end loop;

        nPat := 0;
        cTemp3 := '';
        OPEN cGetPat (nSMRID);
        FETCH cGetPat INTO cTemp3, nPat;
        CLOSE cGetPat;
        IF nPat > 0 THEN
          sHtmlF := sHtmlF || '</TD>'||CHR(13)||'  <TD ALIGN="CENTER">'|| cTemp3 ||'</TD>'||CHR(13)||' </TR>'||CHR(13);
          bFilled  := TRUE;
        ELSE
          sHtmlF := sHtmlF || '</TD>'||CHR(13)||'  <TD ALIGN="CENTER">&nbsp;</TD>'||CHR(13)||' </TR>'||CHR(13);
        END IF;

        IF bFilled THEN
          if sHtml is not null then
            DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);
            sHtml := '';
          end if;
          DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtmlF),sHtmlF);
        END IF;
      end loop;
    ELSE
      sHtml := ' <TR ALIGN="LEFT">'||CHR(13)||
               '  <TD><B>' || NVL(p.FC_NAME,'&nbsp;') || '</B></TD>'||CHR(13)||
               '  <TD ALIGN="CENTER">' || NVL(p.FC_ED_IZM,'&nbsp;') || '</TD>'||CHR(13)||
               '  <TD ALIGN="CENTER">' || NVL(p.FC_NORM,'&nbsp;');
      bFilled  := FALSE;
      for i in 0 .. nColCount - 1 loop
        sHtml := sHtml ||'</TD>'||CHR(13)||'  <TD ALIGN="CENTER">';
        cTemp      := '';
        cTemp1     := '';
        cTemp2     := '';
        cTemp4     := '';
        cType1     := '';
        OPEN cGetVal (nSMRID, nColsID(i));
        FETCH cGetVal INTO cTemp, cTemp1, cTemp2, cType1, cTemp4;
        CLOSE cGetVal;

        bFilled := bFilled OR cTemp IS NOT NULL OR cTemp1 IS NOT NULL OR cTemp2 IS NOT NULL OR cTemp4 IS NOT NULL;
        cTemp := NVL(cTemp,'&nbsp;');
        cTemp1 := NVL(cTemp1,'&nbsp;');
        cTemp2 := NVL(cTemp2,'&nbsp;');
        cTemp4 := NVL(cTemp4,'&nbsp;');

        IF cType = 'NUMBER' THEN
          sHtml := sHtml || cTemp1;
        ELSIF cType = 'VARCHAR2' THEN
          sHtml := sHtml || cTemp2;
        ELSIF cType = 'COMBOBOX' THEN
          IF cType1 = 'NUMBER' THEN
            sHtml := sHtml || cTemp1 ||' '|| cTemp;
          ELSIF cType1 = 'VARCHAR2' THEN
            sHtml := sHtml || cTemp2 ||' '|| cTemp;
          ELSIF cType1 = 'DUALNUM' THEN
            sHtml := sHtml || cTemp1 ||' - '|| cTemp4 ||' '|| cTemp;
          ELSE
            sHtml := sHtml || cTemp;
          END IF;
        ELSIF cType = 'DUALNUM' THEN
          sHtml := sHtml || cTemp1 ||' - '|| cTemp4;
        ELSE
          sHtml := sHtml || '&nbsp;';
        END IF;
      end loop;

      nPat := 0;
      cTemp3 := '';
      OPEN cGetPat (nSMRID);
      FETCH cGetPat INTO cTemp3, nPat;
      CLOSE cGetPat;
      IF nPat > 0 THEN
        sHtml := sHtml || '</TD>'||CHR(13)||'  <TD ALIGN="CENTER">'|| cTemp3 ||'</TD>'||CHR(13)||' </TR>'||CHR(13);
        bFilled  := TRUE;
      ELSE
        sHtml := sHtml || '</TD>'||CHR(13)||'  <TD ALIGN="CENTER">&nbsp;</TD>'||CHR(13)||' </TR>'||CHR(13);
      END IF;
--bFilled  := TRUE;
      IF bFilled THEN
        DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);
      END IF;
    END IF;
  end loop;

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


