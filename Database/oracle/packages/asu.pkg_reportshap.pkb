DROP PACKAGE BODY ASU.PKG_REPORTSHAP
/

--
-- PKG_REPORTSHAP  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_REPORTSHAP" IS
--------------------------------------------------------------------------------
-- NEBARY (Create 21.03.2002)
-- XANDER (Modify 20.05.2005)
-- Возвращает шарку и подписи всех отчетов(64) CLOB в HTML
--------------------------------------------------------------------------------

  sHeader VARCHAR2(32767):=
    '<html>'||CR||
    '<head>'||CR||
    '<title>Untitled Document</title>'||CR||
    '<meta http-equiv="Content-Type" content="text/html; charset=windows-1251">'||CR||
    '<style type="text/css">'||CR||
    '<!--'||CR||
    'br {mso-data-placement:same-cell;}'||CR||
    '.ButtonFaceAllYes {border:0.25pt solid; border-color:black; background:#C0C0C0;}'||CR||
    '.ButtonFaceAllNon {border: none; background:#C0C0C0;}'||CR||
    '.ButtonFaceR {border:0.25pt solid; border-color:black; background:#C0C0C0; border-right: none;}'||CR||
    '.ButtonFaceL {border:0.25pt solid; border-color:black; background:#C0C0C0; border-left: none;}'||CR||
    '.ButtonFaceT {border:0.25pt solid; border-color:black; background:#C0C0C0; border-top: none;}'||CR||
    '.ButtonFaceB {border:0.25pt solid; border-color:black; background:#C0C0C0; border-bottom: none;}'||CR||
    '.ButtonFaceRL {border:0.25pt solid; border-color:black; background:#C0C0C0; border-right: none; border-left: none;}'||CR||
    '.ButtonFaceRT {border:0.25pt solid; border-color:black; background:#C0C0C0; border-right: none; border-top: none;}'||CR||
    '.ButtonFaceRB {border:0.25pt solid; border-color:black; background:#C0C0C0; border-right: none; border-bottom: none;}'||CR||
    '.ButtonFaceLT {border:0.25pt solid; border-color:black; background:#C0C0C0; border-left: none; border-top: none;}'||CR||
    '.ButtonFaceLB {border:0.25pt solid; border-color:black; background:#C0C0C0; border-left: none; border-bottom: none;}'||CR||
    '.ButtonFaceTB {border:0.25pt solid; border-color:black; background:#C0C0C0; border-top: none; border-bottom: none;}'||CR||
    '.ButtonFaceRLT {border:0.25pt solid; border-color:black; background:#C0C0C0; border-right: none; border-left: none; border-top: none;}'||CR||
    '.ButtonFaceRLB {border:0.25pt solid; border-color:black; background:#C0C0C0; border-right: none; border-left: none; border-bottom: none;}'||CR||
    '.ButtonFaceRTB {border:0.25pt solid; border-color:black; background:#C0C0C0; border-right: none; border-top: none; border-bottom: none;}'||CR||
    '.ButtonFaceLTB {border:0.25pt solid; border-color:black; background:#C0C0C0; border-left: none; border-top: none; border-bottom: none;}'||CR||
    ''||CR||
    '.WhiteAllYes {border:0.25pt solid; border-color:black; background:white;}'||CR||
    '.WhiteAllNon {border: none; background:white;}'||CR||
    '.WhiteR {border:0.25pt solid; border-color:black; background:white; border-right: none;}'||CR||
    '.WhiteL {border:0.25pt solid; border-color:black; background:white; border-left: none;}'||CR||
    '.WhiteT {border:0.25pt solid; border-color:black; background:white; border-top: none;}'||CR||
    '.WhiteB {border:0.25pt solid; border-color:black; background:white; border-bottom: none;}'||CR||
    '.WhiteRL {border:0.25pt solid; border-color:black; background:white; border-right: none; border-left: none;}'||CR||
    '.WhiteRT {border:0.25pt solid; border-color:black; background:white; border-right: none; border-top: none;}'||CR||
    '.WhiteRB {border:0.25pt solid; border-color:black; background:white; border-right: none; border-bottom: none;}'||CR||
    '.WhiteLT {border:0.25pt solid; border-color:black; background:white; border-left: none; border-top: none;}'||CR||
    '.WhiteLB {border:0.25pt solid; border-color:black; background:white; border-left: none; border-bottom: none;}'||CR||
    '.WhiteTB {border:0.25pt solid; border-color:black; background:white; border-top: none; border-bottom: none;}'||CR||
    '.WhiteRLT {border:0.25pt solid; border-color:black; background:white; border-right: none; border-left: none; border-top: none;}'||CR||
    '.WhiteRLB {border:0.25pt solid; border-color:black; background:white; border-right: none; border-left: none; border-bottom: none;}'||CR||
    '.WhiteRTB {border:0.25pt solid; border-color:black; background:white; border-right: none; border-top: none; border-bottom: none;}'||CR||
    '.WhiteLTB {border:0.25pt solid; border-color:black; background:white; border-left: none; border-top: none; border-bottom: none;}'||CR||
    ''||CR||
    '.YellowAllYesBoldFont {border:0.25pt solid; border-color:black; background:#FFFF99; font-family:Times New Roman; font-size:10pt; font:bold;}'||CR||
    '.YellowAllYes {border:0.25pt solid; border-color:black; background:#FFFF99;}'||CR||
    '.YellowAllNon {border: none; background:#FFFF99;}'||CR||
    '.YellowR {border:0.25pt solid; border-color:black; background:#FFFF99; border-right: none;}'||CR||
    '.YellowL {border:0.25pt solid; border-color:black; background:#FFFF99; border-left: none;}'||CR||
    '.YellowT {border:0.25pt solid; border-color:black; background:#FFFF99; border-top: none;}'||CR||
    '.YellowB {border:0.25pt solid; border-color:black; background:#FFFF99; border-bottom: none;}'||CR||
    '.YellowRL {border:0.25pt solid; border-color:black; background:#FFFF99; border-right: none; border-left: none;}'||CR||
    '.YellowRT {border:0.25pt solid; border-color:black; background:#FFFF99; border-right: none; border-top: none;}'||CR||
    '.YellowRB {border:0.25pt solid; border-color:black; background:#FFFF99; border-right: none; border-bottom: none;}'||CR||
    '.YellowLT {border:0.25pt solid; border-color:black; background:#FFFF99; border-left: none; border-top: none;}'||CR||
    '.YellowLB {border:0.25pt solid; border-color:black; background:#FFFF99; border-left: none; border-bottom: none;}'||CR||
    '.YellowTB {border:0.25pt solid; border-color:black; background:#FFFF99; border-top: none; border-bottom: none;}'||CR||
    '.YellowRLT {border:0.25pt solid; border-color:black; background:#FFFF99; border-right: none; border-left: none; border-top: none;}'||CR||
    '.YellowRLB {border:0.25pt solid; border-color:black; background:#FFFF99; border-right: none; border-left: none; border-bottom: none;}'||CR||
    '.YellowRTB {border:0.25pt solid; border-color:black; background:#FFFF99; border-right: none; border-top: none; border-bottom: none;}'||CR||
    '.YellowLTB {border:0.25pt solid; border-color:black; background:#FFFF99; border-left: none; border-top: none; border-bottom: none;}'||CR||
    ''||CR||
    '.BlueAllYes {border:0.25pt solid; border-color:black; background:#CCFFFF;}'||CR||
    '.BlueAllNon {border: none; background:white;}'||CR||
    '.BlueR {border:0.25pt solid; border-color:black; background:#CCFFFF; border-right: none;}'||CR||
    '.BlueL {border:0.25pt solid; border-color:black; background:#CCFFFF; border-left: none;}'||CR||
    '.BlueT {border:0.25pt solid; border-color:black; background:#CCFFFF; border-top: none;}'||CR||
    '.BlueB {border:0.25pt solid; border-color:black; background:#CCFFFF; border-bottom: none;}'||CR||
    '.BlueRL {border:0.25pt solid; border-color:black; background:#CCFFFF; border-right: none; border-left: none;}'||CR||
    '.BlueRT {border:0.25pt solid; border-color:black; background:#CCFFFF; border-right: none; border-top: none;}'||CR||
    '.BlueRB {border:0.25pt solid; border-color:black; background:#CCFFFF; border-right: none; border-bottom: none;}'||CR||
    '.BlueLT {border:0.25pt solid; border-color:black; background:#CCFFFF; border-left: none; border-top: none;}'||CR||
    '.BlueLB {border:0.25pt solid; border-color:black; background:#CCFFFF; border-left: none; border-bottom: none;}'||CR||
    '.BlueTB {border:0.25pt solid; border-color:black; background:#CCFFFF; border-top: none; border-bottom: none;}'||CR||
    '.BlueRLT {border:0.25pt solid; border-color:black; background:#CCFFFF; border-right: none; border-left: none; border-top: none;}'||CR||
    '.BlueRLB {border:0.25pt solid; border-color:black; background:#CCFFFF; border-right: none; border-left: none; border-bottom: none;}'||CR||
    '.BlueRTB {border:0.25pt solid; border-color:black; background:#CCFFFF; border-right: none; border-top: none; border-bottom: none;}'||CR||
    '.BlueLTB {border:0.25pt solid; border-color:black; background:#CCFFFF; border-left: none; border-top: none; border-bottom: none;}'||CR||
    ''||CR||
    '.Podpis {border:0.25pt solid; border-color:black; border-left: none; border-right: none; border-top: none;}'||CR||
    '-->'||CR||
    '</style>'||CR||
    '</head>'||CR||
    ''||CR||
    '<body bgcolor="#FFFFFF" text="#000000">'||CR||
    '<table align="center" cellspacing=0 cellpading=0 border=0 style="font-family:Times New Roman; font-size:8pt;">'||CR||
    '  <tr> '||CR||
    '    <td class="ButtonFaceRB" colspan="10"><i>Наименование </i></td>'||CR||
    '    <td class="WhiteAllYes" colspan=":csWhitePos" align="center" valign="middle">:pWhitePosition</td>'||CR||
    '    <td align="center" valign="bottom" class="ButtonFaceRLB">&nbsp;</td>'||CR||
    '    <td align="center" valign="middle" class="YellowAllYesBoldFont">ФОРМА<br>:pFormType</td>'||CR||
    '  </tr>'||CR||
    '  <tr> '||CR||
    '    <td class="ButtonFaceTB" colspan=":csFull">&nbsp;</td>'||CR||
    '  </tr>'||CR||
    '  <tr> '||CR||
    '    <td align="center" valign="middle" class="ButtonFaceRTB" colspan=":csOneDecrease" style="font-family:Times New Roman; font-size:10pt; font:bold;">:pFullReportName</td>'||CR||
    '    <td align="center" valign="middle" class="YellowAllYesBoldFont">:pPolugodie</td>'||CR||
    '  </tr>'||CR||
    '  <tr> '||CR||
    '    <td colspan="18" class="ButtonFaceRTB" align="right">за :pMonthName г.</td>'||CR||
    '    <td colspan=":cs-18" class="ButtonFaceLTB">&nbsp;</td>'||CR||
    '  </tr>'||CR||
    '  <tr> '||CR||
    '    <td colspan="18" class="ButtonFaceRTB" align="right"><i>(период)</i></td>'||CR||
    '    <td colspan=":cs-18" class="ButtonFaceLTB">&nbsp;</td>'||CR||
    '  </tr>'||CR||
    '  <tr> '||CR||
    '    <td colspan="18" class="ButtonFaceRTB" align="right">&#160;</td>'||CR||
    '    <td colspan=":cs-21" class="ButtonFaceAllNon" width=":pFirstWidth">&nbsp;</td>'||CR||
    '    <td colspan="3" rowspan="3" class="ButtonFaceLT">:pDefaultText</td>'||CR||
    '  </tr>'||CR||
    '  <tr> '||CR||
    '    <td class="ButtonFaceAllYes" align="center" height="24" width="24">:p1</td>'||CR||
    '    <td class="ButtonFaceL" align="center" height="24" width="24">:p2</td>'||CR||
    '    <td class="ButtonFaceL" align="center" height="24" width="24">:p3</td>'||CR||
    '    <td class="ButtonFaceL" align="center" width="24">:p4</td>'||CR||
    '    <td class="ButtonFaceAllNon" align="center" height="24" width="24">&nbsp;</td>'||CR||
    '    <td class="ButtonFaceAllYes" align="center" height="24" width="24">:p5</td>'||CR||
    '    <td class="ButtonFaceL" align="center" height="24" width="24">:p6</td>'||CR||
    '    <td class="ButtonFaceAllNon" align="center" height="24" width="24">&nbsp;</td>'||CR||
    '    <td class="WhiteAllYes" align="center" height="24" width="24">:p7</td>'||CR||
    '    <td class="WhiteL" align="center" height="24" width="24">:p8</td>'||CR||
    '    <td class="ButtonFaceAllNon" align="center" height="24" width="24">&nbsp;</td>'||CR||
    '    <td class="WhiteAllYes" align="center" height="24" width="24">&nbsp;</td>'||CR||
    '    <td class="WhiteL" align="center" height="24" width="24">&nbsp;</td>'||CR||
    '    <td class="ButtonFaceAllNon" height="24" width="24">&nbsp;</td>'||CR||
    '    <td class="WhiteAllYes" height="24" width="24">&nbsp;</td>'||CR||
    '    <td class="WhiteL" height="24" width="24">&nbsp;</td>'||CR||
    '    <td class="WhiteL" height="24" width="24">&nbsp;</td>'||CR||
    '    <td class="WhiteL" height="24" width="24">&nbsp;</td>'||CR||
    '    <td colspan=":cs-21" class="ButtonFaceAllNon">&nbsp;</td>'||CR||
    '  </tr>'||CR||
    '  <tr> '||CR||
    '    <td colspan="4" align="center" class="ButtonFaceRT">код формы</td>'||CR||
    '    <td align="center" class="ButtonFaceRLT">&nbsp;</td>'||CR||
    '    <td colspan="2" align="center" class="ButtonFaceRLT">раздел</td>'||CR||
    '    <td align="center" class="ButtonFaceRLT">&nbsp;</td>'||CR||
    '    <td colspan="2" align="center" class="ButtonFaceRLT">год</td>'||CR||
    '    <td align="center" class="ButtonFaceRLT">&nbsp;</td>'||CR||
    '    <td colspan="2" align="center" class="ButtonFaceRLT">период</td>'||CR||
    '    <td align="center" class="ButtonFaceRLT">&nbsp;</td>'||CR||
    '    <td colspan="4" align="center" class="ButtonFaceRLT">код общества</td>'||CR||
    '    <td colspan=":cs-21" align="center" class="ButtonFaceRLT">&nbsp;</td>'||CR||
    '  </tr>'||CR;
  sEnd VARCHAR2(32767):=
    '  <tr>'||CR||
    '    <td colspan="4">&nbsp;</td>'||CR||
    '    <td>&nbsp;</td>'||CR||
    '    <td colspan="5">&nbsp;</td>'||CR||
    '    <td>&nbsp;</td>'||CR||
    '    <td colspan="7">&nbsp;</td>'||CR||
    '    <td colspan=":cs-21">&nbsp;</td>'||CR||
    '    <td colspan="3">&nbsp;</td>'||CR||
    '  </tr>'||CR||
    '  <tr> '||CR||
    '    <td colspan="5">Должностное лицо,<br> составившее форму <br>'||CR||
    '    </td>'||CR||
    '    <td colspan="5" class="Podpis">&nbsp;</td>'||CR||
    '    <td>&nbsp;</td>'||CR||
    '    <td colspan="7" class="Podpis">&nbsp;</td>'||CR||
    '    <td colspan=":cs-21">&nbsp;</td>'||CR||
    '    <td colspan="3" class="Podpis">&nbsp;</td>'||CR||
    '  </tr>'||CR||
    '  <tr>'||CR||
    '    <td colspan="4">&nbsp;</td>'||CR||
    '    <td>&nbsp;</td>'||CR||
    '    <td colspan="5" align="center">должность</td>'||CR||
    '    <td>&nbsp;</td>'||CR||
    '    <td colspan="7" align="center">подпись</td>'||CR||
    '    <td colspan=":cs-21">&nbsp;</td>'||CR||
    '    <td colspan="3" align="center">Ф.И.О.</td>'||CR||
    '  </tr>'||CR||
    '  <tr>'||CR||
    '    <td colspan="4">&nbsp;</td>'||CR||
    '    <td>&nbsp;</td>'||CR||
    '    <td colspan="5">&nbsp;</td>'||CR||
    '    <td>&nbsp;</td>'||CR||
    '    <td colspan="7">телефон:</td>'||CR||
    '    <td colspan=":cs-21">&nbsp;</td>'||CR||
    '    <td colspan="3">&nbsp;</td>'||CR||
    '  </tr>'||CR||
    '  <tr>'||CR||
    '    <td colspan="4">Оператор ввода<br>&nbsp;</td>'||CR||
    '    <td>&nbsp;</td>'||CR||
    '    <td colspan="5" class="Podpis">&nbsp;</td>'||CR||
    '    <td>&nbsp;</td>'||CR||
    '    <td colspan="7" class="Podpis">&nbsp;</td>'||CR||
    '    <td colspan=":cs-21">&nbsp;</td>'||CR||
    '    <td colspan="3" class="Podpis">&nbsp;</td>'||CR||
    '  </tr>'||CR||
    '  <tr>'||CR||
    '    <td colspan="4">&nbsp;</td>'||CR||
    '    <td>&nbsp;</td>'||CR||
    '    <td colspan="5" align="center">должность</td>'||CR||
    '    <td>&nbsp;</td>'||CR||
    '    <td colspan="7" align="center">подпись</td>'||CR||
    '    <td colspan=":cs-21">&nbsp;</td>'||CR||
    '    <td colspan="3" align="center">Ф.И.О.</td>'||CR||
    '  </tr>'||CR||
    '</table>'||CR||
    '</body>'||CR||
    '</html>'||CR;

  FUNCTION GET_FULLPATH(nID NUMBER, sIdent IN VARCHAR2) RETURN NUMBER IS
    sRes  VARCHAR2(32767);
    nLCnt NUMBER;
  BEGIN
    sRes:='';
    SELECT MAX(LEVEL) INTO nLCnt FROM trepheaders
                 START WITH fc_ident=sIdent
                 CONNECT BY PRIOR fk_id=fk_owner;
    nLCnt:=nLCnt*3;
    FOR cRec IN (SELECT fn_order FROM trepheaders
                 START WITH fk_id=nID
                 CONNECT BY fk_id= PRIOR fk_owner) LOOP
      sRes:=LPAD(TO_CHAR(cRec.fn_order), 3, '0') || sRes;
    END LOOP;
    sRes:=RPAD(sRes,nLCnt, '0');
    RETURN sRes;
  END;

  FUNCTION GET_BODYHAP(sWhat IN VARCHAR2) RETURN CLOB
  IS
    CURSOR cBody(nLevel IN NUMBER) IS SELECT fk_id,
                                             fc_caption,
                                             DECODE(fn_width, NULL, '', 'width="'||TO_CHAR(fn_width)||'" ') AS fc_width,
                                             'style="vertical-align:middle; mso-rotate:'||TO_CHAR(fn_rotate)||';"' AS fc_rotate,
                                             DECODE(fn_colspan, NULL, '', 'colspan="'||TO_CHAR(fn_colspan)||'" ') AS fc_colspan,
                                             DECODE(fn_rowspan, NULL, '', 'rowspan="'||TO_CHAR(fn_rowspan)||'" ') AS fc_rowspan
      FROM trepheaders
      WHERE LEVEL=nLevel
      START WITH fc_ident=sWhat
      CONNECT BY PRIOR fk_id=fk_owner
      ORDER BY get_fullpath(fk_id, sWhat);
    sTmp    VARCHAR2(32767);
    cResult CLOB;
    nLev    NUMBER;
    bFirst  BOOLEAN;
  BEGIN
    bFirst:=TRUE;
    DBMS_LOB.CREATETEMPORARY(cResult, TRUE, DBMS_LOB.SESSION);
    SELECT MAX(LEVEL) INTO nLev FROM trepheaders
      START WITH fc_ident=sWhat
      CONNECT BY PRIOR fk_id=fk_owner;
    DBMS_LOB.WRITE(cResult, 1, 1, ' ');
    FOR I IN 2..nLev LOOP
      sTmp:='  <tr> '||CR;
      DBMS_LOB.WRITEAPPEND(cResult, LENGTH(sTmp), sTmp);
      FOR C IN cBody(I) LOOP
        IF bFirst THEN
          sTmp:='    <td '||c.fc_rowspan||c.fc_colspan||C.fc_width||'align="center" valign="middle" class="WhiteT" '||c.fc_rotate||'>'||c.fc_caption||'</td>'||CR;
          bFirst:=FALSE;
        ELSE
          sTmp:='    <td '||c.fc_rowspan||c.fc_colspan||C.fc_width||'align="center" valign="middle" class="WhiteLT" '||c.fc_rotate||'>'||c.fc_caption||'</td>'||CR;
        END IF;
        DBMS_LOB.WRITEAPPEND(cResult, LENGTH(sTmp), sTmp);
      END LOOP;
      sTmp:='  </tr> '||CR;
      DBMS_LOB.WRITEAPPEND(cResult, LENGTH(sTmp), sTmp);
    END LOOP;
    RETURN cResult;
  END;

--------------------------------------------------------------------------------
-- Main ------------------------------------------------------------------------
--------------------------------------------------------------------------------
  FUNCTION GET_HAP(pDate1 IN DATE,
                   pDate2 IN DATE,
                   pWhitePosition IN VARCHAR2,
                   pFormType IN VARCHAR2,
                   pFullReportName IN VARCHAR2,
                   pDefaultText IN VARCHAR2,
                   pRazdel IN VARCHAR2,
                   pFirstWidth IN NUMBER,
                   pColSpan IN NUMBER,
                   pPolugodie IN VARCHAR2)
  RETURN CLOB
  IS
    cResult CLOB;
    sMonth  VARCHAR2(50);
    sYear   VARCHAR(50);
  BEGIN
    DBMS_LOB.CREATETEMPORARY(cResult, TRUE, DBMS_LOB.SESSION);
    DBMS_LOB.WRITE(cResult, LENGTH(sHeader), 1, sHeader);

    /*IF pMonth=1 THEN sMonth:='январь'; END IF;
    IF pMonth=2 THEN sMonth:='февраль'; END IF;
    IF pMonth=3 THEN sMonth:='март'; END IF;
    IF pMonth=4 THEN sMonth:='апрель'; END IF;
    IF pMonth=5 THEN sMonth:='май'; END IF;
    IF pMonth=6 THEN sMonth:='июнь'; END IF;
    IF pMonth=7 THEN sMonth:='июль'; END IF;
    IF pMonth=8 THEN sMonth:='август'; END IF;
    IF pMonth=9 THEN sMonth:='сентябрь'; END IF;
    IF pMonth=10 THEN sMonth:='октябрь'; END IF;
    IF pMonth=11 THEN sMonth:='ноябрь'; END IF;
    IF pMonth=12 THEN sMonth:='декабрь'; END IF;*/

    sMonth:=STAT.PKG_STATUTIL.GET_MONTHNAME(TO_NUMBER(to_char(pDate1,'MM')),FALSE)||' '||TO_CHAR(pDATE2,'YYYY')||'г. - '||STAT.PKG_STATUTIL.GET_MONTHNAME(TO_NUMBER(to_char(pDATE2,'MM')),FALSE)||' '||TO_CHAR(pDATE2,'YYYY');
    IF TO_CHAR(pDate1,'YYYY')=TO_CHAR(pDate2,'YYYY') THEN
     sYear:=TO_CHAR(pDate1,'YYYY');
    ELSE
     sYear:=TO_CHAR(pDate1,'YYYY')||'-'||TO_CHAR(pDate2,'YYYY');
    END IF;


    cResult:=CLOB_REPLACE(cResult, ':pWhitePosition', NVL(pWhitePosition,'&nbsp;'));

    cResult:=CLOB_REPLACE(cResult, ':pFormType', NVL(pFormType,'&nbsp;'));

    cResult:=CLOB_REPLACE(cResult, ':p1', NVL(SUBSTR(pFormType,1,INSTR(pFormType,'-')-1),'&nbsp;'));
    cResult:=CLOB_REPLACE(cResult, ':p2', NVL(SUBSTR(pFormType,INSTR(pFormType,'-')+1,1),'&nbsp;'));
    cResult:=CLOB_REPLACE(cResult, ':p3', NVL(SUBSTR(pFormType,INSTR(pFormType,'-')+2,1),'&nbsp;'));
    cResult:=CLOB_REPLACE(cResult, ':p4', NVL(SUBSTR(pFormType,INSTR(pFormType,'-')+3,1),'&nbsp;'));
    cResult:=CLOB_REPLACE(cResult, ':p5', NVL(SUBSTR(pRazdel,1,1),'&nbsp;'));
    cResult:=CLOB_REPLACE(cResult, ':p6', NVL(SUBSTR(pRazdel,2,1),'&nbsp;'));
    cResult:=CLOB_REPLACE(cResult, ':p7', NVL(SUBSTR(sYear,3,1),'&nbsp;'));
    cResult:=CLOB_REPLACE(cResult, ':p8', NVL(SUBSTR(sYear,4,1),'&nbsp;'));

    cResult:=CLOB_REPLACE(cResult, ':pFullReportName', NVL(pFullReportName,'&nbsp;'));
    cResult:=CLOB_REPLACE(cResult, ':pDefaultText', NVL(pDefaultText,'&nbsp;'));

    cResult:=CLOB_REPLACE(cResult, ':pFullYear', NVL(sYear,'&nbsp;'));
    cResult:=CLOB_REPLACE(cResult, ':pMonthName', sMonth);
    cResult:=CLOB_REPLACE(cResult, ':pFirstWidth', TO_CHAR(pFirstWidth));

    cResult:=CLOB_REPLACE(cResult, ':csWhitePos', TO_CHAR(pColSpan-12));
    cResult:=CLOB_REPLACE(cResult, ':csFull', TO_CHAR(pColSpan));
    cResult:=CLOB_REPLACE(cResult, ':csOneDecrease', TO_CHAR(pColSpan-1));
    cResult:=CLOB_REPLACE(cResult, ':cs-18', TO_CHAR(pColSpan-18));
    cResult:=CLOB_REPLACE(cResult, ':cs-21', TO_CHAR(pColSpan-21));

    cResult:=CLOB_REPLACE(cResult, ':pPolugodie', pPolugodie);
    RETURN cResult;
  END;

  FUNCTION GET_END(pColSpan IN NUMBER)
  RETURN CLOB
  IS
    cResult CLOB;
  BEGIN
    DBMS_LOB.CREATETEMPORARY(cResult, TRUE, DBMS_LOB.SESSION);
    DBMS_LOB.WRITE(cResult, LENGTH(sEnd), 1, sEnd);
    cResult:=CLOB_REPLACE(cResult, ':cs-21', TO_CHAR(pColSpan-21));
    RETURN cResult;
  END;
END;
/

SHOW ERRORS;


