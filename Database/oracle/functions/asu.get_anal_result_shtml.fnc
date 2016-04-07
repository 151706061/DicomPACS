DROP FUNCTION ASU.GET_ANAL_RESULT_SHTML
/

--
-- GET_ANAL_RESULT_SHTML  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBMS_LOB (Synonym)
--   GET_SOTRNAME (Function)
--   TNAZAN (Table)
--   TRESAN (Table)
--   TSMID (Table)
--   GET_FULLPATH_SHA (Function)
--   GET_NAME_FROM_SMID (Function)
--   GET_NAZSOS (Function)
--   GET_NORM (Function)
--   GET_PACID_FROM_NAZID (Function)
--   GET_PATNAME (Function)
--   GET_SEX (Function)
--   GET_VIPNAZ (Function)
--   GET_AGE_DATE (Function)
--
CREATE OR REPLACE FUNCTION ASU."GET_ANAL_RESULT_SHTML" (pFK_NAZID IN BINARY_INTEGER)
  RETURN CLOB IS
  --by TimurLan
  -- not USED!
  -- not WORKS!
  CURSOR cGetNaz IS
    SELECT /*+ first_row*/FK_SMID, TRIM(GET_FULLPATH_SHA(FK_SMID)) FC_NAME, FD_NAZ, FD_RUN, FK_NAZSOSID, GET_NAZSOS(FK_NAZSOSID) FC_NAZSOS
      FROM TNAZAN
     WHERE FK_ID = pFK_NAZID;
  CURSOR cGetZakl IS
    SELECT /*+ first_row*/FD_INS, FC_RES, LOGIN.GET_SOTRNAME(FK_VRACHID) FC_SOTR
      FROM TRESAN
     WHERE FK_NAZID = pFK_NAZID AND FL_ZAKL = 1;
  CURSOR cGetHeader(pFK_SMID BINARY_INTEGER) IS
    SELECT /*+ rule*/FC_NAME,
           FC_ED_IZM,
           GET_NORM(pFK_SMID, GET_SEX(GET_PACID_FROM_NAZID(pFK_NAZID)),GET_AGE_DATE(GET_PACID_FROM_NAZID(pFK_NAZID),SYSDATE)) FC_NORM,
           FC_TYPE
      FROM TSMID
     WHERE FK_ID = pFK_SMID;
  CURSOR cGetVal(pFK_SMID BINARY_INTEGER) IS
    SELECT /*+ rule*/GET_NAME_FROM_SMID(FK_BLOBID),
           TO_CHAR(FN_RES),
           FC_RES,
           GET_PATNAME(FK_PATID),
           FK_PATID
      FROM TRESAN
     WHERE FK_SMID = pFK_SMID
       AND FK_NAZID = pFK_NAZID
       AND FL_ZAKL <> 1;

  clTemp  CLOB;
  sHtml   VARCHAR2(32767);
  nSmidID BINARY_INTEGER;
  cType   TSMID.FC_TYPE%TYPE;
  cZakl   TRESAN.FC_RES%TYPE;
  nPat    TRESAN.FK_PATID%TYPE;
  dDone   DATE;
  cSotr   VARCHAR2(32767);
  cTemp   VARCHAR2(32767);
  cTemp1  VARCHAR2(32767);
  cTemp2  VARCHAR2(32767);
  cTemp3  VARCHAR2(32767);
BEGIN
  DBMS_LOB.CREATETEMPORARY(clTemp, FALSE);
  for p in cGetNaz loop
    if p.FK_NAZSOSID = GET_VIPNAZ then
      nSmidID := p.FK_SMID;
      cTemp   := p.FC_NAME;
      EXIT;
    else
      sHtml := '<BR>Лабораторное исследование "' || p.FC_NAME || '" (' || TO_CHAR(p.FD_NAZ, 'dd.mm.yyyy') || ') имеет статус <B>' || p.FC_NAZSOS || '</B><BR>';
      DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);
      RETURN (clTemp);
    end if;
  end loop;

  if nSmidID is null then
    RETURN (NULL);
  end if;

  for p in cGetZakl loop
    sHtml := '<BR>Результат лабораторного исследования "' || cTemp || '"<BR>'||CHR(13);
    cZakl := TRIM(p.FC_RES);
    dDone := p.FD_INS;
    cSotr := p.FC_SOTR;
    DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);
  end loop;

  sHtml := '<TABLE WIDTH="100%" BORDER="1" ALIGN="CENTER" BORDERCOLORDARK="#FFFFFF" BORDERCOLORLIGHT="#000000" CELLPADDING="0" CELLSPACING="0">'||CHR(13)||
           ' <TR ALIGN="CENTER">'||CHR(13)||
           '  <TD WIDTH="30%">Наименование:</TD>'||CHR(13)||
           '  <TD WIDTH="10%">Ед.изм.:</TD>'||CHR(13)||
           '  <TD WIDTH="15%">Норма:</TD>'||CHR(13)||
           '  <TD WIDTH="25%">Результат:</TD>'||CHR(13)||
           '  <TD WIDTH="20%">Примечание:</TD>'||CHR(13)||
           ' </TR>'||CHR(13);
  DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);

  for p in cGetHeader(nSmidID) loop
    cTemp := NVL(p.FC_NAME,'&nbsp;');
    cTemp1 := NVL(p.FC_ED_IZM,'&nbsp;');
    cTemp2 := NVL(p.FC_NORM,'&nbsp;');
    cType := p.FC_TYPE;
    EXIT;
  end loop;

  sHtml := ' <TR ALIGN="CENTER">'||CHR(13)||
           '  <TD WIDTH="30%"><B>' || cTemp || '</B></TD>'||CHR(13)||
           '  <TD WIDTH="10%">' || cTemp1 || '</TD>'||CHR(13)||
           '  <TD WIDTH="15%">' || cTemp2 || '</TD>'||CHR(13)||
           '  <TD WIDTH="25%">';
  DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);

  OPEN cGetVal(nSmidID);
  FETCH cGetVal
    INTO cTemp, cTemp1, cTemp2, cTemp3, nPat;
  CLOSE cGetVal;
  sHtml := '&nbsp;';
  IF cType = 'NUMBER' THEN
    sHtml := cTemp1;
  ELSIF cType = 'VARCHAR2' THEN
    sHtml := cTemp2;
  ELSIF cType = 'COMBOBOX' THEN
    sHtml := cTemp;
  END IF;
  sHtml := sHtml || '</TD>'||CHR(13)||'  <TD WIDTH="20%">';
  DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);

  IF nPat <> 0 THEN
    sHtml := cTemp3 || '</TD>'||CHR(13)||' </TR>'||CHR(13);
  ELSE
    sHtml := '&nbsp;</TD>'||CHR(13)||' </TR>'||CHR(13);
  END IF;
  DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);

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


