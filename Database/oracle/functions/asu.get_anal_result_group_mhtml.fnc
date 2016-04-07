DROP FUNCTION ASU.GET_ANAL_RESULT_GROUP_MHTML
/

--
-- GET_ANAL_RESULT_GROUP_MHTML  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBMS_LOB (Synonym)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   ANALRESMHTML_USE_COL_PRIMECH (Function)
--   ANALRESMHTML_USE_RESULT (Function)
--   GET_SOTRNAME (Function)
--   GET_SOTR_OTDELNAME (Function)
--   TNAZGROUP (Table)
--   TDIAG (Table)
--   TRESAN (Table)
--   TSMID (Table)
--   TSMID_RIGHTS (Table)
--   PKG_REGIST_PACFUNC (Package)
--   PKG_SMINI (Package)
--   GET_COUNTRY (Function)
--   GET_FULLPATH_SHA (Function)
--   GET_MAINDIAG (Function)
--   GET_NAME_FROM_SMID (Function)
--   GET_NAZDATE (Function)
--   GET_NAZSOS (Function)
--   GET_NAZSOS_GROUP (Function)
--   GET_NAZ_CANCEL (Function)
--   GET_NAZ_CANCEL_PODPIS (Function)
--   GET_NORM (Function)
--   GET_OTDNAME (Function)
--   GET_PATALOGY_LEVEL (Function)
--   GET_PATNAME (Function)
--   GET_REGION (Function)
--   GET_SMIDORDER (Function)
--   GET_SOSBYNAZ (Function)
--   GET_STREET (Function)
--   GET_TOWN (Function)
--   GET_TYPE_FROM_SMID (Function)
--   GET_VIPNAZ (Function)
--
CREATE OR REPLACE FUNCTION ASU."GET_ANAL_RESULT_GROUP_MHTML" (pFD_DATE IN DATE, pFN_PROBE IN NUMBER, pFK_GROUPID IN NUMBER,
 pFK_SOTRID IN NUMBER, pFD_RUN IN DATE, pFK_PACID IN NUMBER, pFK_VRACHID IN NUMBER, pFK_NAZTYPEID IN NUMBER, pFD_DATERUN in date default null)
  RETURN CLOB IS

CURSOR cNAZCAUSE(nFK_NAZID INTEGER, nFK_SMID INTEGER) IS
    SELECT FC_RES FROM TRESAN WHERE FK_NAZID = nFK_NAZID AND FK_SMID = nFK_SMID;

CURSOR cGROUPNAME IS SELECT FC_NAME FROM TSMID WHERE FK_ID = pFK_GROUPID;

CURSOR cGET_NAZGROUP IS
     SELECT TNAZGROUP.FK_SMID, TNAZGROUP.FK_NAZID
     FROM TNAZGROUP
     WHERE TNAZGROUP.FK_GROUPID = pFK_GROUPID
           AND TNAZGROUP.FK_PACID = pFK_PACID
           AND TNAZGROUP.FN_PROBE = pFN_PROBE
           AND TNAZGROUP.FK_VRACHID = pFK_VRACHID
           AND TRUNC(TNAZGROUP.FD_REGIST) = TRUNC(pFD_DATE)
           AND TNAZGROUP.FD_RUN = pFD_RUN
           AND TNAZGROUP.FD_DATE = nvl(pFD_DATERUN,TNAZGROUP.FD_DATE)
           AND FK_NAZTYPEID = pFK_NAZTYPEID
           AND EXISTS (SELECT FK_ID
                       FROM TSMID_RIGHTS
                       WHERE FK_SOTRID = pFK_SOTRID
                             AND FK_SMID = TNAZGROUP.FK_SMID);


CURSOR cGetNaz IS
 SELECT TNAZGROUP.FK_SMID, TRIM(GET_FULLPATH_SHA(TNAZGROUP.FK_SMID)) FC_NAME, GET_NAZDATE(TNAZGROUP.FK_NAZID) FD_NAZ, TNAZGROUP.FD_RUN, GET_SOSBYNAZ(TNAZGROUP.FK_NAZID) FK_NAZSOSID, GET_NAZSOS(GET_SOSBYNAZ(TNAZGROUP.FK_NAZID)) FC_NAZSOS, TNAZGROUP.FK_VRACHID, TNAZGROUP.FK_NAZID
            FROM TNAZGROUP
            WHERE TNAZGROUP.FK_GROUPID = pFK_GROUPID
                  AND TNAZGROUP.FK_PACID = pFK_PACID
                  AND TNAZGROUP.FN_PROBE = pFN_PROBE
                  AND TNAZGROUP.FK_VRACHID = pFK_VRACHID
                  AND TRUNC(TNAZGROUP.FD_REGIST) = TRUNC(pFD_DATE)
                  AND TNAZGROUP.FD_RUN = pFD_RUN
                  AND FK_NAZTYPEID = pFK_NAZTYPEID
                  AND TNAZGROUP.FD_DATE = nvl(pFD_DATERUN,TNAZGROUP.FD_DATE)
                  AND EXISTS (SELECT FK_ID
                              FROM TSMID_RIGHTS
                              WHERE FK_SOTRID = pFK_SOTRID
                                    AND FK_SMID = TNAZGROUP.FK_SMID)
            ORDER BY GET_SMIDORDER(TNAZGROUP.FK_SMID);

CURSOR cGetZakl IS
    SELECT DISTINCT TRESAN.FD_INS, TRESAN.FC_RES, GET_SOTRNAME(TRESAN.FK_VRACHID) FC_SOTR, TRESAN.FK_VRACHID, TRESAN.FK_PACID
            FROM TNAZGROUP, TRESAN
            WHERE TNAZGROUP.FK_GROUPID = pFK_GROUPID
                  AND TNAZGROUP.FK_PACID = pFK_PACID
                  AND TNAZGROUP.FN_PROBE = pFN_PROBE
                  AND TNAZGROUP.FK_VRACHID = pFK_VRACHID
                  AND TRUNC(TNAZGROUP.FD_REGIST) = TRUNC(pFD_DATE)
                  AND TNAZGROUP.FD_RUN = pFD_RUN
                  AND TRESAN.FK_NAZID = TNAZGROUP.FK_NAZID
                  AND FK_NAZTYPEID = pFK_NAZTYPEID
                  AND TNAZGROUP.FD_DATE = nvl(pFD_DATERUN,TNAZGROUP.FD_DATE)
                  AND EXISTS (SELECT FK_ID
                              FROM TSMID_RIGHTS
                              WHERE FK_SOTRID = pFK_SOTRID
                                    AND FK_SMID = TNAZGROUP.FK_SMID)
                  AND FL_ZAKL=1;

CURSOR cGetHeader IS
    SELECT TSMID.FK_ID, TSMID.FC_NAME, TSMID.FC_ED_IZM, GET_NORM(TSMID.FK_ID,FK_PACID) FC_NORM, TSMID.FC_TYPE, FK_NAZID
            FROM TNAZGROUP, TSMID
            WHERE TNAZGROUP.FK_GROUPID = pFK_GROUPID
                  AND TNAZGROUP.FK_PACID = pFK_PACID
                  AND TNAZGROUP.FN_PROBE = pFN_PROBE
                  AND TNAZGROUP.FK_VRACHID = pFK_VRACHID
                  AND TRUNC(TNAZGROUP.FD_REGIST) = TRUNC(pFD_DATE)
                  AND TNAZGROUP.FD_RUN = pFD_RUN
                  AND TNAZGROUP.FK_SMID = TSMID.FK_OWNER
                  AND GET_SOSBYNAZ(TNAZGROUP.FK_NAZID) = GET_VIPNAZ
                  AND FK_NAZTYPEID = pFK_NAZTYPEID
                  AND EXISTS (SELECT FK_ID
                              FROM TSMID_RIGHTS
                              WHERE FK_SOTRID = pFK_SOTRID
                                    AND FK_SMID = TNAZGROUP.FK_SMID)

    ORDER BY GET_SMIDORDER(TNAZGROUP.FK_SMID), TSMID.FN_ORDER;


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


CURSOR cGetFolder (pFK_SMID BINARY_INTEGER, pNazID BINARY_INTEGER) IS
    SELECT TSMID.FK_ID, TSMID.FC_NAME, TSMID.FC_ED_IZM, GET_NORM(TSMID.FK_ID, pFK_PACID) FC_NORM, TSMID.FC_TYPE

         FROM TSMID
         WHERE  FL_SHOWANAL = 4
                AND FC_TYPE <> 'COLUMNS'
                AND FC_TYPE <> 'COLUMN'
         START WITH FK_OWNER = pFK_SMID
         CONNECT BY PRIOR FK_ID = FK_OWNER
         ORDER BY TSMID.FN_ORDER;

  CURSOR cGetVal(pFK_SMID BINARY_INTEGER, pFK_NAZID BINARY_INTEGER, pFK_COLID BINARY_INTEGER) IS
    SELECT /*+ rule*/
           FC_COMENT,
           GET_NAME_FROM_SMID(FK_BLOBID) FC_NAME,
           TO_CHAR(FN_RES, 'FM99999999990.0999') FN_RES,
           FC_RES,
           GET_PATNAME(FK_PATID) FC_PAT,
           FK_PATID,
           GET_TYPE_FROM_SMID(FK_BLOBID) FC_TYPE,
           TO_CHAR(FN_RES2, 'FM99999999990.0999') FN_RES2,
           FK_SOS
      FROM TRESAN
     WHERE FK_SMID = pFK_SMID
       AND FK_NAZID = pFK_NAZID
       AND FL_ZAKL <> 1
       AND FK_COLID = pFK_COLID;

  CURSOR cGetPat (pFK_SMID BINARY_INTEGER, pFK_NAZID BINARY_INTEGER) IS
    SELECT /*+ rule*/GET_PATNAME (FK_PATID) FC_PAT, GET_PATALOGY_LEVEL (FK_PATID) FN_PATL
      FROM TRESAN
     WHERE FK_SMID = pFK_SMID
       AND FK_NAZID = pFK_NAZID
       AND FL_ZAKL <> 1
     ORDER BY FN_PATL DESC;

  CURSOR cSotrName(nNazID NUMBER) IS SELECT LOGIN.GET_SOTRNAME(FK_VRACHID) FC_NAME FROM TRESAN WHERE fk_nazid = nNazID AND FL_ZAKL = 1;


  cursor cDiag(pacid number) is
   select s.fc_name
     from asu.tdiag d, asu.tsmid s, asu.tsmid s2
    where s.fk_id = d.fk_smdiagid
      and s2.fk_id = d.fp_type
      and d.fk_pacid = pacid
      and d.fl_main = asu.get_maindiag
    order by decode(s2.fc_synonim,'PRI_VYPISKE',1,'DIAG_SPEC',2,'CLINIK',3,'PRI_POSTYPLENII',4,'S_MESTA_OTBORA',5,'NA_OSMOTRE',6,7);

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
  cMYNE1  LONG;
  cMYNE2  LONG;
  strGROUPNAME VARCHAR(200);
  nNazSotrID BINARY_INTEGER;
  strNAZCAUSE VARCHAR(200);
  nFK_NAZ BINARY_INTEGER;
  cTemp0 LONG;
  cFK_SOS NUMBER;
  --comma varchar2(2);
  comma varchar2(6);
  -- Added --
  nTempCall number;
  nColsID2 nCID2;
  nColID2  BINARY_INTEGER;
  nColCountTemp BINARY_INTEGER := 0;
  sDiag asu.tsmid.fc_name%type;
BEGIN
  --comma := ' ';
  comma := '&nbsp;'; -- Added by Kosov 01.08.2012 иначен не прорисовывались столбцы
  DBMS_LOB.CREATETEMPORARY(clTemp, FALSE);
  OPEN cGROUPNAME;
  FETCH cGROUPNAME INTO strGROUPNAME;
  CLOSE cGROUPNAME;

  for p in cGetNaz loop
    if GET_NAZSOS_GROUP(pFD_DATE, pFN_PROBE, pFK_GROUPID, pFK_SOTRID, pFK_VRACHID, pFK_PACID, pFD_RUN, pFK_NAZTYPEID, pfd_daterun)  = 'Выполнено' then
      nSmidID := p.FK_SMID;
      cTemp   := p.FC_NAME;
      nNazSotrID := p.FK_VRACHID;
      EXIT;
    else

      sHtml := '<BR>Лабораторное исследование ' || strGROUPNAME || ' (' || TO_CHAR(p.FD_NAZ, 'dd.mm.yyyy') || ') имеет статус <B>' || p.FC_NAZSOS || '</B><BR>';
      DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);
      IF p.FK_NAZSOSID = GET_NAZ_CANCEL THEN
        OPEN  cNAZCAUSE(p.FK_NAZID, p.FK_SMID);
        FETCH cNAZCAUSE INTO strNAZCAUSE;
        CLOSE cNAZCAUSE;
        sHtml := '<BR>Причина отмены: <B>'|| strNAZCAUSE || '</B><BR>';
        DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);
      END IF;
      IF p.FK_NAZSOSID = GET_NAZ_CANCEL_PODPIS THEN
        OPEN cSotrName(p.FK_NAZID);
        FETCH cSotrName INTO  cTemp;
        CLOSE cSotrName;
        sHtml := '<BR>Результаты исследования были отменены сотрудником:  <B>'|| cTemp || '</B><BR>';
        DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);
      END IF;
      RETURN (clTemp);
    end if;
  end loop;

  if nSmidID is null then
    RETURN (NULL);
  end if;

  for p in cGetZakl loop
    open cDiag(p.fk_pacid);
    fetch cDiag into sDiag;
    if cDiag%notfound then sDiag := ''; end if;
    close cDiag;
    sHtml := '<DIV ALIGN=CENTER>'||CHR(13)||
             ' <P><FONT style=''font-size:10.0pt;color:navy''><B>'||PKG_SMINI.READSTRING('CONFIG','S_FULLNAME','Ханты-Мансийский автономный округ<BR>государственное учреждение здравоохранения<B>ОКРУЖНАЯ КЛИНИЧЕСКАЯ БОЛЬНИЦА</B>')||'</B></FONT>'||CHR(13)||
             ' <BR><FONT style=''font-size:8.0pt''>'||
               GET_COUNTRY(PKG_SMINI.READSTRING('CONFIG','S_COUNTRY','-1'))||','||
               GET_REGION(PKG_SMINI.READSTRING('CONFIG','S_REGION','-1'))||','||
               GET_TOWN(PKG_SMINI.READSTRING('CONFIG','S_TOWN','-1'))||','||
               GET_STREET(PKG_SMINI.READSTRING('CONFIG','S_STREET','-1'))||' '||
               PKG_SMINI.READSTRING('CONFIG','S_HOUSE','')||' тел.'||
               PKG_SMINI.READSTRING('CONFIG','S_PHONE','')||' факс'||
               PKG_SMINI.READSTRING('CONFIG','S_FAX','')||' e-mail:'||
               PKG_SMINI.READSTRING('CONFIG','S_EMAIL','')||' '||
             ' </FONT>'||CHR(13)||
             ' <BR><FONT style=''font-size:10.0pt;color:red''><B>'||LOGIN.GET_SOTR_OTDELNAME(p.FK_VRACHID)||'</B></FONT>'||CHR(13)||
             '</DIV>'||CHR(13)||
             ' <FONT style=''font-size:10.0pt''><P>ФИО: '||initcap(PKG_REGIST_PACFUNC.GET_PAC_FULLFIO(p.FK_PACID))||'; '||CHR(13)||
             ' Дата рождения: '||PKG_REGIST_PACFUNC.GET_PAC_BITH(p.FK_PACID)||'; '||CHR(13)||
             ' Пол: '||PKG_REGIST_PACFUNC.GET_PAC_SEX(p.FK_PACID)||'; '||CHR(13)||
             ' <BR>Адрес:'||replace(PKG_REGIST_PACFUNC.GET_PAC_ADRFULL(p.FK_PACID),'РОССИЙСКАЯ ФЕДЕРАЦИЯ, ')||'; '||CHR(13)||
             ' <BR>Отделение: '||asu.get_otdname(asu.pkg_regist_pacfunc.GET_PAC_OTDELID(p.FK_PACID))||'; '||CHR(13)||
             ' Диагноз: '||sDiag||'; '||CHR(13)||
             ' <BR>Врач: '||LOGIN.GET_SOTRNAME(nNazSotrID)||'; '||CHR(13)||
             ' Подразделение: '||LOGIN.GET_SOTR_OTDELNAME(nNazSotrID)||'; '||CHR(13)||
             ' № пробы: '||TO_CHAR(pFN_PROBE)||'; '||CHR(13);
             if nvl(asu.analresmhtml_use_result,1) = 1 then
              sHtml := sHtml ||' <BR>Результат лабораторного исследования: <b>' || strGROUPNAME || '</b> ' ||CHR(13);
             end if;
             shtml := shtml ||' </font> '||chr(13);
    cZakl := TRIM(p.FC_RES);
    dDone := p.FD_INS;
    cSotr := p.FC_SOTR;
    DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);
    EXIT;
  end loop;

  for p in (SELECT /*+ first_rows*/FK_ID FROM TSMID WHERE FK_OWNER = nSmidID AND FC_TYPE = 'COLUMNS' and fl_del = 0 ORDER BY FN_ORDER) loop
    nColID := p.FK_ID;
    EXIT;
  end loop;
  -- Added --
  nTempCall := 0;
  for p in (SELECT /*+ first_rows*/FK_ID FROM TSMID WHERE FK_OWNER = nSmidID AND FC_TYPE = 'COLUMNS' ORDER BY FN_ORDER) loop
    if nTempCall = 1 then
      nColID2 := p.FK_ID;
      EXIT;
    end if;
    nTempCall := nTempCall + 1;
  end loop;
  -- End Added --

  sHtml := CHR(13)||'<TABLE WIDTH="100%" BORDER="1" style=''font-size:10.0pt'' ALIGN="CENTER" BORDERCOLORDARK="#FFFFFF" BORDERCOLORLIGHT="#000000" CELLPADDING="0" CELLSPACING="0">'||CHR(13)||
           ' <TR ALIGN="CENTER">'||CHR(13)||
           '  <TD>Наименование:</TD>'||CHR(13);
  DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);

  for p in (SELECT FK_ID, FC_NAME FROM TSMID WHERE FK_OWNER = nColID AND FC_TYPE = 'COLUMN' ORDER BY FN_ORDER) loop
    nColsID (nColCount)  := p.FK_ID;
    sHtml := '  <TD>' || p.FC_NAME || ':</TD>'||CHR(13);
    nColCount  := nColCount + 1;
    DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);
  end loop;

  shtml := '  <TD>Ед.изм.:</TD>'||CHR(13)||
           '  <TD>Норма:</TD>'||CHR(13);
  DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);
      
  -- Added --
  for p in (SELECT FK_ID, FC_NAME FROM TSMID WHERE FK_OWNER = nColID2 AND FC_TYPE = 'COLUMN' ORDER BY FN_ORDER) loop
    nColsID2 (nColCountTemp)  := p.FK_ID;
    nColCountTemp  := nColCountTemp + 1;
  end loop;
  -- end added --
  if nvl(asu.analresmhtml_use_col_primech,1) = 1 then
    sHtml := '  <TD>Примечание:</TD>'||CHR(13)||
             ' </TR>'||CHR(13);
    DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);
  else
      sHtml :=       ' </TR>'||CHR(13);
    DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);
  end if;

  for p in cGetHeader loop
    nSmRID:= p.FK_ID;
    cType := p.FC_TYPE;
    nFK_NAZ:=p.FK_NAZID;

    IF cType = 'FOLDER' THEN
      sHtml := ' <TR ALIGN="LEFT">'||CHR(13)||
               '  <TD><B>' || NVL(p.FC_NAME,comma) || '</B></TD>';
      --DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);
      FOR i IN 0 .. nColCount - 1 LOOP
        sHtml := sHtml ||'</TD>'||CHR(13)||'  <TD ALIGN="CENTER">&nbsp;';--Edited by Kosov "&nbsp;" вместо ";"
        --DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);
      END LOOP;
      sHtml := sHtml ||'&nbsp;</TD>'||CHR(13)||'  <TD ALIGN="CENTER">';--Edited by Kosov "&nbsp;" вместо ";"
      --DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);

      cTemp := '';
   --   OPEN  cGetFolderPat(nSMRID,pFK_NAZID);
   ---   FETCH cGetFolderPat INTO cTemp;
   --   CLOSE cGetFolderPat;
      sHtml := sHtml || NVL(cTemp,'&nbsp;')||'</TD>'||CHR(13)||
               '  <TD ALIGN="CENTER">' || NVL(p.FC_ED_IZM,comma) || '</TD>'||CHR(13)||
               '  <TD ALIGN="CENTER">' || NVL(p.FC_NORM,comma);--||
      if nvl(asu.analresmhtml_use_col_primech,1) = 1 then
       sHtml := shtml||'  <TD ALIGN="CENTER">'||CHR(13);
      end if;
      shtml := shtml|| CHR(13)||' </TR>'||CHR(13);--Edited by Kosov "&nbsp;" вместо ";"
      --DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);

      for f in cGetFolder(nSMRID, nFK_NAZ) loop
        nSmRID:= f.FK_ID;
        cType := f.FC_TYPE;
        sHtmlF := ' <TR ALIGN="LEFT">'||CHR(13)||
                  '  <TD>&nbsp;&nbsp;<B>' || NVL(f.FC_NAME,'&nbsp;') || '</B>';
        bFilled  := FALSE;

        for i in 0 .. nColCount - 1 loop
          sHtmlF := sHtmlF ||'</TD>'||CHR(13)||'  <TD ALIGN="CENTER">';
          cTemp      := '';
          cTemp1     := '';
          cTemp2     := '';
          cTemp4     := '';
          cType1  := '';
          cTemp0 := '';
          cFK_SOS := '';
          OPEN cGetVal (nSMRID, nFK_NAZ, nColsID(i));
          FETCH cGetVal INTO cTemp0, cTemp, cTemp1, cTemp2, cTemp3, nPat, cType1, cTemp4, cFK_SOS;
          CLOSE cGetVal;

          bFilled := bFilled OR cFK_SOS IS NOT NULL OR cTemp IS NOT NULL OR cTemp1 IS NOT NULL OR cTemp2 IS NOT NULL OR cTemp4 IS NOT NULL;
          cTemp0 := NVL(cTemp0,comma);
          cTemp := NVL(cTemp,comma);
          cTemp1 := NVL(cTemp1,comma);
          cTemp2 := NVL(cTemp2,comma);
          cTemp4 := NVL(cTemp4,comma);

          IF TO_NUMBER(cFK_SOS) = 23 THEN
            sHtml := cTemp2;
          ELSIF TO_NUMBER(cFK_SOS) = 244 THEN
            sHtml := 'ai ' || cTemp2;
          ELSIF cType = 'NUMBER' THEN
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
            sHtmlF := sHtmlF || ';';
          END IF;
        end loop;

        nPat := 0;
        cTemp3 := '';
        OPEN cGetPat (nSMRID, nFK_NAZ);
        FETCH cGetPat INTO cTemp3, nPat;
        CLOSE cGetPat;
        IF nPat > 0 THEN
          sHtmlF := sHtmlF || '</TD>'||CHR(13)||CHR(13)|| --Edited by Kosov "&nbsp;" вместо ";"
                  '  <TD ALIGN="CENTER">' || NVL(f.FC_ED_IZM,'&nbsp;') || '</TD>'||CHR(13)||
                  '  <TD ALIGN="CENTER">' || NVL(f.FC_NORM,'&nbsp;')||'</TD>';--||
          if nvl(asu.analresmhtml_use_col_primech,1) = 1 then
           sHtmlF := shtmlf ||'  <TD ALIGN="CENTER">'|| nvl(cTemp3,comma) ||'</TD>';
          end if;
          shtmlf := shtmlf||CHR(13)||' </TR>'||CHR(13);
          bFilled  := TRUE;
        ELSE
          sHtmlF := sHtmlF || '</TD>'||CHR(13)||CHR(13)|| --Edited by Kosov "&nbsp;" вместо ";"
                  '  <TD ALIGN="CENTER">' || NVL(f.FC_ED_IZM,'&nbsp;') || '</TD>'||CHR(13)||
                  '  <TD ALIGN="CENTER">' || NVL(f.FC_NORM,'&nbsp;')||'</TD>';--||
          if nvl(asu.analresmhtml_use_col_primech,1) = 1 then
           shtmlf := shtmlf ||'  <TD ALIGN="CENTER">&nbsp;'||'</TD>';
          end if;
          shtmlf := shtmlf || CHR(13)||' </TR>'||CHR(13); -- Edited by Kosov 01.08.2012
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
               '  <TD><B>' || NVL(p.FC_NAME,comma)||'</B>' ;
      bFilled  := FALSE;
      for i in 0 .. nColCount - 1 loop
        sHtml := sHtml ||'</TD>'||CHR(13)||'  <TD ALIGN="CENTER">';
        cTemp      := '';
        cTemp1     := '';
        cTemp2     := '';
        cTemp4     := '';
        cType1     := '';
        cTemp0 := '';
        cFK_SOS := '';
        OPEN cGetVal (nSMRID, nFK_NAZ, nColsID(i));
        FETCH cGetVal INTO cTemp0, cTemp, cTemp1, cTemp2, cTemp3, nPat, cType1, cTemp4, cFK_SOS;
        CLOSE cGetVal;
        --Added --
        if (cTemp is null) and  -- не если изменили столбци "результат"
           (cTemp1 is null) and
           (cTemp2 is null) and
           (cTemp4 is null) and
           (cType1 is null) and
           (cTemp0 is null) and
           (cFK_SOS is null) and (nColCountTemp >= i) and (nColCountTemp > 0) then
           OPEN cGetVal (nSMRID, nFK_NAZ, nColsID2(i));
           FETCH cGetVal INTO cTemp0, cTemp, cTemp1, cTemp2, cTemp3, nPat, cType1, cTemp4, cFK_SOS;
           CLOSE cGetVal;           
        end if;
        -- end added -- 
        bFilled := bFilled OR cFK_SOS IS NOT NULL OR cTemp IS NOT NULL OR cTemp1 IS NOT NULL OR cTemp2 IS NOT NULL OR cTemp4 IS NOT NULL;
        cTemp0 := NVL(cTemp0,comma);
        cTemp := NVL(cTemp,comma);
        cTemp1 := NVL(cTemp1,comma);
        cTemp2 := NVL(cTemp2,comma);
        cTemp4 := NVL(cTemp4,comma);
        
        
        IF TO_NUMBER(cFK_SOS) = 23 THEN
            sHtml := cTemp2;
        ELSIF TO_NUMBER(cFK_SOS) = 244 THEN
            sHtml := 'до ' || cTemp2;
        ELSIF cType = 'NUMBER' THEN
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
          sHtml := sHtml || ';';
        END IF;
      end loop;

      nPat := 0;
      cTemp3 := '';
      OPEN cGetPat (nSMRID, nFK_NAZ);
      FETCH cGetPat INTO cTemp3, nPat;
      CLOSE cGetPat;
      IF nPat > 0 THEN
        sHtml := sHtml || '</TD>'||CHR(13)||
               '  <TD ALIGN="CENTER">' || NVL(p.FC_ED_IZM,comma)||'</TD> '||CHR(13)||CHR(13)||
               '  <TD ALIGN="CENTER">' || NVL(p.FC_NORM,comma)||'</TD>';
        if nvl(asu.analresmhtml_use_col_primech,1) = 1 then
         shtml := shtml ||' <TD ALIGN="CENTER">'|| nvl(cTemp3,comma)  || '</TD>';
        end if;
        shtml := shtml ||CHR(13)||' </TR>'||CHR(13);
        bFilled  := TRUE;
      ELSE
        --sHtml := sHtml || '</TD>'||CHR(13)||'  <TD ALIGN="CENTER">;</TD>'||CHR(13)||' </TR>'||CHR(13);
        sHtml := sHtml || '</TD>'||CHR(13)||
               '  <TD ALIGN="CENTER">' || NVL(p.FC_ED_IZM,comma)|| '</TD>'||CHR(13)||CHR(13)||
               '  <TD ALIGN="CENTER">' || NVL(p.FC_NORM,comma)||'</TD>'||CHR(13);
       if nvl(asu.analresmhtml_use_col_primech,1) = 1 then
        shtml := shtml ||'  <TD ALIGN="CENTER">&nbsp;'||'</TD>';
       end if;
       shtml := shtml || ' </TR>'||CHR(13); -- Edited by Kosov 01.08.2012
      END IF;

      IF bFilled THEN
        DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);
      END IF;
    END IF;
  end loop;

  sHtml := '</TABLE><FONT style=''font-size:10.0pt''>'||CHR(13);
  if cZakl IS NOT NULL then
    sHtml := sHtml || '<BR><I>Заключение: </I>' || cZakl ||CHR(13);
  end if;
  sHtml := sHtml || '<BR><B>'|| TO_CHAR(dDone,'DD.MM.YYYY') ||' '|| cSotr ||'</B>'||CHR(13);
  shtml := shtml ||'</font> '||chr(13);
  DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);
  RETURN (clTemp);
END;
/

SHOW ERRORS;


