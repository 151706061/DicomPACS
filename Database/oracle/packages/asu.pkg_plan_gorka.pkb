DROP PACKAGE BODY ASU.PKG_PLAN_GORKA
/

--
-- PKG_PLAN_GORKA  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_PLAN_GORKA" IS -- Created by TimurLan
  FUNCTION RETURN_VALUE (nValue IN NUMBER) RETURN VARCHAR IS
    cValue VARCHAR(15);
  BEGIN
    if (nValue is NULL) or (nValue = 0) then cValue:='&nbsp;';
    else cValue:=TO_CHAR(nValue);
    end if;
    RETURN cValue;
  END;
/*############################################################################################################*/
  FUNCTION DO_GRAPH_FOR_PLAN (pFK_MAINID IN NUMBER, pFK_VRACHID IN NUMBER) RETURN NUMBER IS
    CURSOR cTIPROOM(DATA IN DATE) IS SELECT FK_VIDID,GET_PALATA_FCVID(FK_VIDID) AS FC_VID FROM TPLANSLAVE WHERE FK_MAINID = pFK_MAINID AND FD_DATE = TRUNC(DATA) ORDER BY 1;
    CURSOR cTIPCOUNT(DATA IN DATE) IS SELECT COUNT(FK_VIDID) FN_COUNT FROM TPLANSLAVE WHERE FK_MAINID = pFK_MAINID AND FD_DATE = TRUNC(DATA);
    CURSOR cDATE IS SELECT DISTINCT FD_DATE FROM TPLANSLAVE WHERE FK_MAINID = pFK_MAINID;
    CURSOR cNUMBER(DATA IN DATE, VIDID IN NUMBER) IS SELECT FN_KOL FROM TPLANSLAVE WHERE FK_MAINID = pFK_MAINID AND FD_DATE = TRUNC(DATA) AND FK_VIDID = VIDID;
--    CURSOR cMAIN is SELECT FK_PLANID,FK_KORPID,FN_KDN,FN_COUNT FROM TPLANMAIN WHERE FK_ID = pFK_MAINID;
    HTML_HEAD CONSTANT VARCHAR(32767) :=
    '<html xmlns:o="urn:schemas-microsoft-com:office:office"'||
    'xmlns:x="urn:schemas-microsoft-com:office:excel"'||
    'xmlns="http://www.w3.org/TR/REC-html40">'||
    '<head>'||
    '<meta http-equiv=Content-Type content="text/html; charset=windows-1251">'||
    '<meta name=ProgId content=Excel.Sheet>'||
    '<style>'||
    '<!--table'||
    '	{mso-displayed-decimal-separator:"\,";'||
    '	mso-displayed-thousand-separator:" ";}'||
    '@page'||
    '	{margin:.39in .39in .39in .79in;'||
    '	mso-header-margin:0in;'||
    '	mso-footer-margin:0in;'||
    '	mso-page-orientation:landscape;}'||
    'tr'||
    '	{mso-height-source:auto;}'||
    'col'||
    '	{mso-width-source:auto;}'||
    'br'||
    '	{mso-data-placement:same-cell;}'||
    '.style0'||
    '	{mso-number-format:General;'||
    '	text-align:general;'||
    '	vertical-align:bottom;'||
    '	white-space:nowrap;'||
    '	mso-rotate:0;'||
    '	mso-background-source:auto;'||
    '	mso-pattern:auto;'||
    '	color:windowtext;'||
    '	font-size:10.0pt;'||
    '	font-weight:400;'||
    '	font-style:normal;'||
    '	text-decoration:none;'||
    '	font-family:"Arial Cyr";'||
    '	mso-generic-font-family:auto;'||
    '	mso-font-charset:204;'||
    '	border:none;'||
    '	mso-protection:locked visible;'||
    '	mso-style-name:Normal;'||
    '	mso-style-id:0;}'||
    'td'||
    '	{mso-style-parent:style0;'||
    '	padding-top:1px;'||
    '	padding-right:1px;'||
    '	padding-left:1px;'||
    '	mso-ignore:padding;'||
    '	color:windowtext;'||
    '	font-size:10.0pt;'||
    '	font-weight:400;'||
    '	font-style:normal;'||
    '	text-decoration:none;'||
    '	font-family:"Times New Roman", serif;'||
    '	mso-font-charset:204;'||
    '	mso-number-format:General;'||
    '	text-align:center;'||
    '	vertical-align:middle;'||
    '	border:none;'||
    '	mso-background-source:auto;'||
    '	mso-pattern:auto;'||
    '	mso-protection:locked visible;'||
    '	white-space:nowrap;'||
    '	mso-text-control:shrinktofit;'||
    '	mso-rotate:0;}'||
    '.xl27'||
    '	{mso-style-parent:style0;'||
    '	border:.5pt solid windowtext;}'||
    '.xl28'||
    '	{mso-style-parent:style0;'||
    '	border:.5pt solid windowtext;'||
    '	mso-rotate:90;}'||
    '.xl32'||
    '	{mso-style-parent:style0;'||
    '	text-align:left;'||
    '	border:.5pt solid windowtext;'||
    '	padding-left:12px;'||
    '	mso-char-indent-count:1;}'||
    '-->'||
    '</style>'||
    '<!--[if gte mso 9]><xml>'||
    ' <x:ExcelWorkbook>'||
    '  <x:ExcelWorksheets>'||
    '   <x:ExcelWorksheet>'||
    '    <x:Name>Sheet</x:Name>'||
    '    <x:WorksheetOptions>'||
    '     <x:FitToPage/>'||
    '     <x:FitToPage/>'||
    '     <x:Print>'||
    '      <x:FitHeight>128</x:FitHeight>'||
    '      <x:ValidPrinterInfo/>'||
    '      <x:PaperSizeIndex>9</x:PaperSizeIndex>'||
    '      <x:Scale>85</x:Scale>'||
    '      <x:HorizontalResolution>300</x:HorizontalResolution>'||
    '      <x:VerticalResolution>300</x:VerticalResolution>'||
    '     </x:Print>'||
    '     <x:Selected/>'||
    '    </x:WorksheetOptions>'||
    '   </x:ExcelWorksheet>'||
    '  </x:ExcelWorksheets>'||
    ' </x:ExcelWorkbook>'||
    '</xml><![endif]-->'||
    '</head>';
    str VARCHAR2 (8000);
    nC NUMBER;
    cC CLOB;
    nValue NUMBER;
    sValue VARCHAR2(30);
    nTemp NUMBER;
    nPP   NUMBER;
    --
    nVidCount NUMBER;
    nYear     NUMBER(4);
    nPlanID   NUMBER;
    nKorpID   NUMBER;
    nKDN      NUMBER;
    nCount    NUMBER;
    dStart    DATE;
    --
  BEGIN
    SELECT FK_PLANID,FK_KORPID,FN_KDN,FN_COUNT
      INTO nPlanID,nKorpID,nKDN,nCount
      FROM TPLANMAIN
      WHERE FK_ID = pFK_MAINID;
    SELECT FN_YEAR
      INTO nYear
      FROM TPLAN
      WHERE FK_ID = nPlanID;
    SELECT MIN(FD_DATE) INTO dStart FROM TPLANSLAVE WHERE FK_MAINID = pFK_MAINID;
    SELECT FC_NAME INTO sValue FROM TKORP WHERE FK_ID = nKorpID;
    open cTIPCOUNT(dStart);
    fetch cTIPCOUNT into nVidCount;
    close cTIPCOUNT;
--    PROGRESS_BAR.SETSTROUT ('Формирование отчета... шаг 0 из '||TO_CHAR(12*KorpCol));
--    PROGRESS_BAR.STEPIT;
    INSERT INTO TCLOBS (FC_CLOB) VALUES (EMPTY_CLOB () ) RETURNING FK_ID,FC_CLOB INTO nC,cC;
    DBMS_LOB.OPEN (cC, DBMS_LOB.LOB_READWRITE);
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (HTML_HEAD), HTML_HEAD);
    str:='<body><table x:str border=0 cellpadding=0 cellspacing=0 width=1124 style=''border-collapse:collapse;table-layout:fixed;width:843pt''>'||
         '<col width=100 style=''mso-width-source:userset;mso-width-alt:3657; width:75pt''>'||
         '<col span='||TO_CHAR(nVidCount*2)||'>'||
         ' <tr>'||
         '  <td colspan='||TO_CHAR(nVidCount*2+1)||'><BIG><B>ГРАФИК ЗАЕЗДОВ В '||UPPER(sValue)||' САНАТОРИЯ &quot;ГОЛУБАЯ ГОРКА&quot; НА '||TO_CHAR(nYear)||' г.</B></BIG></td>'||
         ' </tr>'||
         ' <tr height=50 style=''mso-height-source:userset;height:37.5pt''>'||
         '  <td colspan='||TO_CHAR(nVidCount*2+1)||' style=''vertical-align:top;''><B>СРОК ПУТЕВКИ - '||TO_CHAR(nKDN)||' ДН.</B></td>'||
         ' </tr>'||
         ' <tr height=25 style=''mso-height-source:userset;height:18.0pt''>'||
         '  <td rowspan=2 class=xl27>&nbsp;</td>'||
         '  <td colspan='||TO_CHAR(nVidCount)||' class=xl27>Основные места</td>'||
         '  <td colspan='||TO_CHAR(nVidCount)||' class=xl27>Дополнительные места</td>'||
         ' </tr>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    str:='<tr>';
    FOR i in cTIPROOM(dStart) LOOP
      str:=str||' <td class=xl28>'||i.FC_VID||'</td>';
    END LOOP;
    FOR i in cTIPROOM(dStart) LOOP
      str:=str||' <td class=xl28>'||i.FC_VID||'</td>';
    END LOOP;
    str:=str||'</tr>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    nTemp:=nCount;
    nPP:=0;
    str:='';
    FOR i in cDATE LOOP
      if nTemp = nCount then
        Inc(nPP);
        str:=str||'<tr><td colspan='||TO_CHAR(nVidCount*2+1)||' class=xl32 style=''mso-char-indent-count:2;''><B><U>'||nPP||' заезд</U></B></td></tr>';
      end if;
      nTemp:=nTemp-1;
      if nTemp = 0
        then nTemp := nCount;
      end if;
      str:=str||'<tr>';
      str:=str||'<td class=xl32>'||TO_CHAR(i.FD_DATE,'dd.mm')||'-'||TO_CHAR(i.FD_DATE+nKDN-1,'dd.mm')||'</td>';
      FOR j in cTIPROOM(dStart) LOOP
        open cNUMBER(i.FD_DATE,j.FK_VIDID);
        fetch cNUMBER into nValue;
        close CNUMBER;
        str:=str||'<td class=xl27 x:num>'||RETURN_VALUE(nValue)||'</td>';
      END LOOP;
      FOR j in 1..nVidCount LOOP
        str:=str||'<td class=xl27 x:num>&nbsp;</td>';
      END LOOP;
      str:=str||'</tr>';
      DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
      str:='';
    END LOOP;
/*    str:=' <tr height=17 style=''height:12.75pt''>';
    str:=str||'  <td colspan=2 height=17 class=xl26 width=130 style=''border-right:.5pt solid black;height:12.75pt;width:98pt''>Итого за год</td>';
    str:=str||'  <td width=60 style=''border-top:none;border-left:none;width:45pt''>'||RETURN_VALUE(c1)||'</td>';
    str:=str||'  <td width=50 style=''border-top:none;border-left:none;width:38pt''>'||RETURN_VALUE(c2)||'</td>';
    str:=str||'  <td width=50 style=''border-top:none;border-left:none;width:38pt''>'||RETURN_VALUE(c3)||'</td>';
    str:=str||'  <td width=50 style=''border-top:none;border-left:none;width:38pt''>'||RETURN_VALUE(c4)||'</td>';
    str:=str||'  <td width=50 style=''border-top:none;border-left:none;width:38pt''>'||RETURN_VALUE(c5)||'</td>';
    str:=str||'  <td width=55 style=''border-top:none;border-left:none;width:41pt''>'||RETURN_VALUE(c6)||'</td>';
    str:=str||'  <td width=55 style=''border-top:none;border-left:none;width:41pt''>'||RETURN_VALUE(c7)||'</td>';
    str:=str||'  <td width=50 style=''border-top:none;border-left:none;width:38pt''>'||RETURN_VALUE(c8)||'</td>';
    str:=str||'  <td width=50 style=''border-top:none;border-left:none;width:38pt''>'||RETURN_VALUE(c9)||'</td>';
    str:=str||'  <td width=50 style=''border-top:none;border-left:none;width:38pt''>'||RETURN_VALUE(c10)||'</td>';
    str:=str||'  <td width=50 style=''border-top:none;border-left:none;width:38pt''>'||RETURN_VALUE(c11)||'</td>';
    str:=str||'  <td width=50 style=''border-top:none;border-left:none;width:38pt''>'||RETURN_VALUE(c12)||'</td>';
    str:=str||'  <td width=60 style=''border-top:none;border-left:none;width:45pt''>'||RETURN_VALUE(c13)||'</td>';
    str:=str||'  <td width=50 style=''border-top:none;border-left:none;width:38pt''>'||RETURN_VALUE(c14)||'</td>';
    str:=str||'  <td width=50 style=''border-top:none;border-left:none;width:38pt''>'||RETURN_VALUE(c15)||'</td>';
    str:=str||' </tr>';
    str:=str||' <![if supportMisalignedColumns]>';
    str:=str||' <tr height=0 style=''display:none''>';
    str:=str||'  <td width=50 style=''width:38pt''></td>';
    str:=str||'  <td width=80 style=''width:60pt''></td>';
    str:=str||'  <td width=60 style=''width:45pt''></td>';
    str:=str||'  <td width=50 style=''width:38pt''></td>';
    str:=str||'  <td width=50 style=''width:38pt''></td>';
    str:=str||'  <td width=50 style=''width:38pt''></td>';
    str:=str||'  <td width=50 style=''width:38pt''></td>';
    str:=str||'  <td width=55 style=''width:41pt''></td>';
    str:=str||'  <td width=55 style=''width:41pt''></td>';
    str:=str||'  <td width=50 style=''width:38pt''></td>';
    str:=str||'  <td width=50 style=''width:38pt''></td>';
    str:=str||'  <td width=50 style=''width:38pt''></td>';
    str:=str||'  <td width=50 style=''width:38pt''></td>';
    str:=str||'  <td width=50 style=''width:38pt''></td>';
    str:=str||'  <td width=60 style=''width:45pt''></td>';
    str:=str||'  <td width=50 style=''width:38pt''></td>';
    str:=str||'  <td width=50 style=''width:38pt''></td>';
    str:=str||' </tr>';
    str:=str||' <![endif]>';*/
--    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
--    PROGRESS_BAR.SETSTROUT ('Формирование отчета... шаг последний');
--    PROGRESS_BAR.STEPIT;
    str:='</table></body></html>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
    DBMS_LOB.CLOSE (cC);
    RETURN nC;
  END;
/*############################################################################################################*/
END;
/

SHOW ERRORS;


