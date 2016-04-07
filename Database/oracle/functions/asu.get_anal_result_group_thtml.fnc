DROP FUNCTION ASU.GET_ANAL_RESULT_GROUP_THTML
/

--
-- GET_ANAL_RESULT_GROUP_THTML  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBMS_LOB (Synonym)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   ANALRESTHTML_USE_COL_PRIMECH (Function)
--   ANALRESTHTML_USE_RESULT (Function)
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
--   GET_PACID_FROM_NAZID (Function)
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
CREATE OR REPLACE FUNCTION ASU."GET_ANAL_RESULT_GROUP_THTML" (pFD_DATE IN DATE, pFN_PROBE IN NUMBER, pFK_GROUPID IN NUMBER,
 pFK_SOTRID IN NUMBER, pFD_RUN IN DATE, pFK_PACID IN NUMBER, pFK_VRACHID IN NUMBER, pFK_NAZTYPEID IN NUMBER, pFD_DATERUN IN DATE)
  RETURN CLOB IS
  --by TimurLan

CURSOR cNAZCAUSE(nFK_NAZID INTEGER, nFK_SMID INTEGER) IS
    SELECT FC_RES FROM TRESAN WHERE FK_NAZID = nFK_NAZID AND FK_SMID = nFK_SMID;

CURSOR cGROUPNAME IS SELECT FC_NAME FROM TSMID WHERE FK_ID = pFK_GROUPID;

CURSOR cGetNaz IS
 SELECT TNAZGROUP.FK_SMID, TRIM(GET_FULLPATH_SHA(TNAZGROUP.FK_SMID)) FC_NAME, GET_NAZDATE(TNAZGROUP.FK_NAZID) FD_NAZ, TNAZGROUP.FD_RUN, GET_SOSBYNAZ(TNAZGROUP.FK_NAZID) FK_NAZSOSID, GET_NAZSOS(GET_SOSBYNAZ(TNAZGROUP.FK_NAZID)) FC_NAZSOS, TNAZGROUP.FK_VRACHID, TNAZGROUP.FK_NAZID
            FROM TNAZGROUP
            WHERE TNAZGROUP.FK_GROUPID = pFK_GROUPID
                  AND TNAZGROUP.FK_PACID = pFK_PACID
                  AND TNAZGROUP.FN_PROBE = pFN_PROBE
                  AND TNAZGROUP.FK_VRACHID = pFK_VRACHID
                  AND TRUNC(TNAZGROUP.FD_REGIST) = TRUNC(pFD_DATE)
                  AND TNAZGROUP.FD_RUN = pFD_RUN
                  AND TNAZGROUP.FD_DATE = pFD_DATERUN
                  AND FK_NAZTYPEID = pFK_NAZTYPEID
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
                  AND TNAZGROUP.FD_DATE = pFD_DATERUN
                  AND TRESAN.FK_NAZID = TNAZGROUP.FK_NAZID
                  AND FK_NAZTYPEID = pFK_NAZTYPEID
                  AND EXISTS (SELECT FK_ID
                              FROM TSMID_RIGHTS
                              WHERE FK_SOTRID = pFK_SOTRID
                                    AND FK_SMID = TNAZGROUP.FK_SMID)
                  AND FL_ZAKL=1;

CURSOR cGetHeader IS
    SELECT TSMID.FK_ID, TSMID.FC_NAME, TSMID.FC_ED_IZM, GET_NORM(TSMID.FK_ID,GET_PACID_FROM_NAZID(FK_NAZID)) FC_NORM, TSMID.FC_TYPE, FK_NAZID
            FROM TNAZGROUP, TSMID
            WHERE TNAZGROUP.FK_GROUPID = pFK_GROUPID
                  AND TNAZGROUP.FK_PACID = pFK_PACID
                  AND TNAZGROUP.FN_PROBE = pFN_PROBE
                  AND TNAZGROUP.FK_VRACHID = pFK_VRACHID
                  AND TRUNC(TNAZGROUP.FD_REGIST) = TRUNC(pFD_DATE)
                  AND TNAZGROUP.FD_RUN = pFD_RUN
                  AND TNAZGROUP.FD_DATE = pFD_DATERUN
                  AND TNAZGROUP.FK_SMID = TSMID.FK_OWNER
                  AND FK_NAZTYPEID = pFK_NAZTYPEID
                  AND GET_SOSBYNAZ(TNAZGROUP.FK_NAZID) = GET_VIPNAZ
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
    SELECT TSMID.FK_ID, TSMID.FC_NAME, TSMID.FC_ED_IZM, GET_NORM(TSMID.FK_ID,GET_PACID_FROM_NAZID(pNazID)) FC_NORM, TSMID.FC_TYPE

         FROM TSMID
         WHERE  FL_SHOWANAL = 4
                AND FC_TYPE <> 'COLUMNS'
                AND FC_TYPE <> 'COLUMN'
         START WITH FK_OWNER = pFK_SMID
         CONNECT BY PRIOR FK_ID = FK_OWNER
         ORDER BY TSMID.FN_ORDER;

  CURSOR cGetVal(pFK_SMID BINARY_INTEGER, pFK_NAZID BINARY_INTEGER) IS
    SELECT /*+ rule*/FC_COMENT,
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
       AND FL_ZAKL <> 1;

  CURSOR cSotrName(nNazID NUMBER) IS SELECT LOGIN.GET_SOTRNAME(FK_VRACHID) FC_NAME FROM TRESAN WHERE fk_nazid = nNazID AND FL_ZAKL = 1;

  cursor cDiag(pacid number) is
   select s.fc_name
     from asu.tdiag d, asu.tsmid s, asu.tsmid s2
    where s.fk_id = d.fk_smdiagid
      and s2.fk_id = d.fp_type
      and d.fk_pacid = pacid
      and d.fl_main = asu.get_maindiag
    order by decode(s2.fc_synonim,'PRI_VYPISKE',1,'DIAG_SPEC',2,'CLINIK',3,'PRI_POSTYPLENII',4,'S_MESTA_OTBORA',5,'NA_OSMOTRE',6,7);

  clTemp  CLOB;
  sHtml   LONG;
  nSmidID BINARY_INTEGER;
  nSmRID  BINARY_INTEGER;
  nFK_NAZ BINARY_INTEGER;
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
  cMYNE1  LONG;
  cMYNE2  LONG;
  strGROUPNAME VARCHAR(200);
  nNazSotrID BINARY_INTEGER;
  strNAZCAUSE VARCHAR(200);
  cTemp0 LONG;
  cFK_SOS NUMBER;
  comma varchar2(2);
  sDiag asu.tsmid.fc_name%type;

BEGIN
sHtml := '1';
  comma := ' ';
  DBMS_LOB.CREATETEMPORARY(clTemp, FALSE);
  OPEN cGROUPNAME;
  FETCH cGROUPNAME INTO strGROUPNAME;
  CLOSE cGROUPNAME;

  for p in cGetNaz loop
    if GET_NAZSOS_GROUP(pFD_DATE, pFN_PROBE, pFK_GROUPID, pFK_SOTRID, pFK_VRACHID, pFK_PACID, pFD_RUN, pFK_NAZTYPEID, pFD_DATERUN)  = 'Выполнено' then
sHtml := '2';
      nSmidID := p.FK_SMID;
      cTemp   := p.FC_NAME;
      nNazSotrID := p.FK_VRACHID;
     -- sHtml := '<BR>Лабораторное исследование ' || strGROUPNAME || ' (' || TO_CHAR(p.FD_NAZ, 'dd.mm.yyyy') || ')<BR>';
      --DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);
      EXIT;
    ELSE
sHtml := '3';
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
sHtml := '4';
  if nSmidID is null then
    RETURN (NULL);
  end if;
sHtml := '5';
  for p in cGetZakl LOOP
sHtml := '6';
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
             ' Пол: '||PKG_REGIST_PACFUNC.GET_PAC_SEX(p.FK_PACID)||CHR(13)||'; '||
             ' <BR>Адрес:'||replace(PKG_REGIST_PACFUNC.GET_PAC_ADRFULL(p.FK_PACID),'РОССИЙСКАЯ ФЕДЕРАЦИЯ, ')||'; '||CHR(13)||
             ' <BR>Отделение: '||asu.get_otdname(asu.pkg_regist_pacfunc.GET_PAC_OTDELID(p.FK_PACID))||'; '||CHR(13)||
             ' Диагноз: '||sDiag||'; '||CHR(13)||
             ' <BR>Врач: '||LOGIN.GET_SOTRNAME(nNazSotrID)||'; '||CHR(13)||
            -- ' <BR>Подразделение: '||LOGIN.GET_SOTR_OTDELNAME(nNazSotrID)||CHR(13)||
             ' № пробы: '||TO_CHAR(pFN_PROBE)||'; '||CHR(13);
             if nvl(asu.analresthtml_use_result,1) = 1 then
              sHtml := sHtml ||' <BR>Результат лабораторного исследования: <b>' || strGROUPNAME ||'</b>'||CHR(13);
             end if;
             sHtml := sHtml ||' </font> '||chr(13);
    cZakl := TRIM(p.FC_RES);
    dDone := p.FD_INS;
    cSotr := p.FC_SOTR;
    DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);
    EXIT;
  end loop;
sHtml := '7';
  sHtml := CHR(13)||'<TABLE WIDTH="100%" BORDER="1" ALIGN="CENTER" style=''font-size:10.0pt'' BORDERCOLORDARK="#FFFFFF" BORDERCOLORLIGHT="#000000" CELLPADDING="0" CELLSPACING="0">'||CHR(13)||
           ' <TR ALIGN="CENTER">'||CHR(13)||
           '  <TD WIDTH="30%">Наименование:</TD>'||CHR(13)||
           '  <TD WIDTH="25%">Результат:</TD>'||CHR(13)||
           '  <TD WIDTH="10%">Ед.изм.:</TD>'||CHR(13)||
           '  <TD WIDTH="15%">Норма:</TD>'||CHR(13);
           if nvl(asu.analresthtml_use_col_primech,1) = 1 then
             sHtml := sHtml ||'  <TD WIDTH="20%">Примечание:</TD>'||CHR(13);
           end if;
           shtml := shtml || ' </TR>'||CHR(13);
  DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);

  for p in cGetHeader loop
    nSmRID:= p.FK_ID;
    nFK_NAZ:=p.FK_NAZID;
    cTemp := NVL(p.FC_NAME,'&nbsp;');
    cTemp1 := NVL(p.FC_ED_IZM,'&nbsp;');
    cTemp2 := NVL(p.FC_NORM,'&nbsp;');
    cType := p.FC_TYPE;
    IF cType = 'FOLDER' THEN
      sHtml := ' <TR ALIGN="LEFT">'||CHR(13)||
               '  <TD WIDTH="30%"><B>' || cTemp || '</B></TD>'||CHR(13)||
               '  <TD WIDTH="25%" ALIGN="CENTER">'|| '&nbsp;</TD>'||CHR(13)||
               '  <TD WIDTH="10%" ALIGN="CENTER">' || cTemp1 || '</TD>'||CHR(13)||
               '  <TD WIDTH="15%" ALIGN="CENTER">' || cTemp2 || '</TD>'||CHR(13);--||
               if nvl(asu.analresthtml_use_col_primech,1) = 1 then
               shtml := shtml ||'  <TD WIDTH="20%" ALIGN="CENTER">';               
 --     DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);
      cTemp := '';
  --    for f in cGetFolderPat(nSMRID,nFK_NAZ) loop
  --      cTemp := f.FC_PAT;
  --    end loop;
      sHtml := sHtml || NVL(cTemp,'&nbsp;') ||'</TD>'||CHR(13);
      end if;
      shtml := shtml ||' </TR>'||CHR(13);
  --    DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);

      for f in cGetFolder(nSMRID, nFK_NAZ) loop

        nSmRID:= f.FK_ID;
        cType := f.FC_TYPE;
        cTemp := '';
        cTemp1 := '';
        cTemp2 := '';
        cTemp3 := '';
        cType1  := '';
        cTemp4 := '';
        cTemp0 := '';
        cFK_SOS := '';
        nPat := 0;
        OPEN cGetVal (nSmRID, nFK_NAZ);
        FETCH cGetVal INTO cTemp0, cTemp, cTemp1, cTemp2, cTemp3, nPat, cType1, cTemp4, cFK_SOS;
        CLOSE cGetVal;
        if cTemp0 IS NULL AND cTemp IS NULL AND cTemp1 IS NULL AND cTemp2 IS NULL then
          NULL;
        else
          if sHtml is not null then
            DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);
          end if;
          sHtml := ' <TR ALIGN="LEFT">'||CHR(13)||
                   '  <TD WIDTH="30%">&nbsp;&nbsp;<B>' || NVL(f.FC_NAME,'&nbsp;') || '</B></TD>'||CHR(13)||
                   '  <TD WIDTH="25%" ALIGN="CENTER">';

          DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);
          cTemp0 := NVL(cTemp0,'&nbsp;');
          cTemp := NVL(cTemp,'&nbsp;');
          cTemp1 := NVL(cTemp1,'&nbsp;');
          cTemp2 := NVL(cTemp2,'&nbsp;');
          cTemp3 := NVL(cTemp3,'&nbsp;');

          IF TO_NUMBER(cFK_SOS) = 23 THEN
            sHtml := cTemp2;
          ELSIF TO_NUMBER(cFK_SOS) = 244 THEN
            sHtml := 'до ' || cTemp2;
          ELSIF cType = 'NUMBER' THEN
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
          sHtml := NVL(TRIM(sHtml),'&nbsp;') || '</TD>'||CHR(13)||
                   '  <TD WIDTH="10%" ALIGN="CENTER">' || NVL(f.FC_ED_IZM,'&nbsp;') || '</TD>'||CHR(13)||
                   '  <TD WIDTH="15%" ALIGN="CENTER">' || NVL(f.FC_NORM,'&nbsp;') || '</TD>'||CHR(13);
                   if nvl(asu.analresthtml_use_col_primech,1) = 1 then
                     shtml := shtml ||'  <TD WIDTH="20%" ALIGN="CENTER">';
                   end if;
          DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);

          if nvl(asu.analresthtml_use_col_primech,1) = 1 then
          IF nPat <> 0 THEN
            sHtml := cTemp3 || '</TD>'||CHR(13)|| ' </TR>'||CHR(13);
          ELSE
            sHtml := '&nbsp;</TD>'||CHR(13)|| ' </TR>'||CHR(13);
          END IF;
          else
            shtml := ' </TR>'||CHR(13);
          end if;
          DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);
          sHtml := '';
        end if;
      end loop;
    ELSE -- if cType <> 'FOLDER'
      sHtml := ' <TR ALIGN="LEFT">'||CHR(13)||
               '  <TD WIDTH="30%"><B>' || cTemp || '</B></TD>'||CHR(13)||
               '  <TD WIDTH="25%" ALIGN="CENTER">';
      cTemp := '';
      cTemp1 := '';
      cTemp2 := '';
      cTemp3 := '';
      cType1 := '';
      cTemp4 := '';
      cTemp0 := '';
      cFK_SOS := '';
      nPat := 0;
      OPEN cGetVal (nSMRID, nFK_NAZ);
      FETCH cGetVal INTO cTemp0, cTemp, cTemp1, cTemp2, cTemp3, nPat, cType1, cTemp4, cFK_SOS;
      CLOSE cGetVal;
     -- sHtml := '=BLA -' ||nSMRID||'- ALB=';
   --   DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);

      if cFK_SOS IS NOT NULL OR cTemp IS NOT NULL OR cTemp1 IS NOT NULL OR cTemp2 IS NOT NULL then
        DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);
        cTemp0 := NVL(cTemp0,'&nbsp;');
        cTemp := NVL(cTemp,'&nbsp;');
        cTemp1 := NVL(cTemp1,'&nbsp;');
        cTemp2 := NVL(cTemp2,'&nbsp;');
        cTemp3 := NVL(cTemp3,'&nbsp;');
        sHtml := '&nbsp;';

        IF TO_NUMBER(cFK_SOS) = 23 THEN
            sHtml := cTemp2;
        ELSIF TO_NUMBER(cFK_SOS) = 244 THEN
            sHtml := 'до ' || cTemp2;
        ELSIF cType = 'NUMBER' THEN
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
        cTemp1 := NVL(p.FC_ED_IZM,'&nbsp;');
        cTemp2 := NVL(p.FC_NORM,'&nbsp;');
        sHtml := sHtml || '</TD>'||CHR(13)||
               '  <TD WIDTH="10%" ALIGN="CENTER">' || cTemp1 || '</TD>'||CHR(13)||
               '  <TD WIDTH="15%" ALIGN="CENTER">' || cTemp2 || '</TD>'||CHR(13);
               if nvl(asu.analresthtml_use_col_primech,1) = 1 then
                 shtml := shtml || '  <TD WIDTH="20%" ALIGN="CENTER">';
               end if;
        DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);

        if nvl(asu.analresthtml_use_col_primech,1) = 1 then
        IF nPat <> 0 THEN
          sHtml := cTemp3 || '</TD>'||CHR(13)||' </TR>'||CHR(13);
        ELSE
          sHtml := '&nbsp;</TD>'||CHR(13)||' </TR>'||CHR(13);
        END IF;
        else
          shtml := ' </TR>'||CHR(13);
        end if;
        DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);
      END IF;
    END IF;
  END LOOP;

  sHtml := '</TABLE><FONT style=''font-size:10.0pt''>'||CHR(13);
  if cZakl IS NOT NULL then
    sHtml := sHtml || '<BR><I>Заключение: </I>' || cZakl ||CHR(13);
  end if;
  sHtml := sHtml || '<BR><B>'|| TO_CHAR(dDone,'DD.MM.YYYY') ||' '|| cSotr ||'</B>'||CHR(13);
  sHtml := sHtml ||'</font>'||chr(13);
  DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);
  RETURN (clTemp);
END;
/

SHOW ERRORS;


