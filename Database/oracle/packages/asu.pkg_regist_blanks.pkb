DROP PACKAGE BODY ASU.PKG_REGIST_BLANKS
/

--
-- PKG_REGIST_BLANKS  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_REGIST_BLANKS" 
 is-- Created by TimurLan

  FUNCTION RETURN_KORPUS (nValue IN NUMBER) RETURN VARCHAR IS
    cValue VARCHAR(30);
    CURSOR cTemp is select FC_NAME from TKORP where FK_ID = GET_PACKORPID(nValue,sysdate);
  BEGIN
    open cTemp;
    fetch cTemp into cValue;
    close cTemp;
    RETURN cValue;
  END;
  FUNCTION RETURN_PALATA (nValue IN NUMBER) RETURN VARCHAR IS
    cValue VARCHAR(10);
    CURSOR cTemp is select FC_PALATA from TROOM where FK_ID = GET_PACPALATAID(nValue);
  BEGIN
    open cTemp;
    fetch cTemp into cValue;
    close cTemp;
    RETURN cValue;
  END;
  FUNCTION RETURN_FLOOR (nValue IN NUMBER) RETURN VARCHAR IS
    cValue VARCHAR(10);
    CURSOR cTemp is select FN_FLOOR from TROOM where FK_ID = GET_PACPALATAID(nValue);
  BEGIN
    open cTemp;
    fetch cTemp into cValue;
    close cTemp;
    RETURN cValue;
  END;
  FUNCTION RETURN_VRACH (nValue IN NUMBER) RETURN VARCHAR IS
    cValue VARCHAR(90);
    CURSOR cTemp is select FC_FAM||' '||FC_NAME||' '||FC_OTCH from TSOTR where FK_ID = GET_PACVRACH(nValue);
  BEGIN
    open cTemp;
    fetch cTemp into cValue;
    close cTemp;
    RETURN cValue;
  END;
  FUNCTION RETURN_OSTATOK (nValue IN NUMBER) RETURN VARCHAR IS
    cValue NUMBER(3);
    CURSOR cTemp is select FN_KOL FROM TSROKY,(SELECT MAX(FK_ID) FK_MAXID FROM TSROKY WHERE FK_PACID=nValue) where fk_id = fk_maxid and FK_PRYB in (3,7);
  BEGIN
    open cTemp;
    fetch cTemp into cValue;
    close cTemp;
    RETURN cValue;
  END;
  FUNCTION RETURN_VYBTYPE (nValue IN NUMBER) RETURN VARCHAR IS
    cValue VARCHAR(30);
    CURSOR cTemp is select FC_NAME from TVYBTYPE where fk_id = (select FK_VYBID FROM TSROKY,(SELECT MAX(FK_ID) FK_MAXID FROM TSROKY WHERE FK_PACID=nValue) where fk_id = fk_maxid and FK_PRYB in (3,7) and FN_KOL > 0);
  BEGIN
    open cTemp;
    fetch cTemp into cValue;
    close cTemp;
    RETURN cValue;
  END;
  FUNCTION RETURN_OPOZDTYPE (nValue IN NUMBER) RETURN VARCHAR IS
    cValue VARCHAR(100);
    CURSOR cTemp is select FC_NAME from TOPOZD where fk_id = (select FK_VYBID FROM TSROKY where FK_PACID=nValue and FK_PRYB = 2);
  BEGIN
    open cTemp;
    fetch cTemp into cValue;
    close cTemp;
    RETURN cValue;
  END;

  FUNCTION GET_DINNER (pFK_PACID IN NUMBER,pFK_VRACHID IN NUMBER)
  RETURN NUMBER
   IS-- В столовую...

  CURSOR cMAIN
   IS
    SELECT GET_PACFULLFIO(TKARTA.FK_ID) FC_FIO,
           TPEOPLES.FD_ROJD,
           GET_COC_POL(TKARTA.FK_COC_POLID) FC_COC_POL,
           GET_GROUP(TKARTA.FK_GROUPID) FC_GROUP,
           GET_PRIZN(TKARTA.FK_PRIZN) FC_PRIZN,
           GET_PACINCOME(TKARTA.FK_ID) FD_DATA1,
           GET_PACPLANOUTCOME(TKARTA.FK_ID) FD_DATA3,
           GET_PACFCPALATA(TKARTA.FK_ID) FC_PALATA
    from TKARTA, TPEOPLES
    where TKARTA.FK_ID=pFK_PACID
    AND TPEOPLES.FK_ID=TKARTA.FK_PEPLID;

   cl CLOB;
   str VARCHAR2(32767);
   rc NUMBER;
   pFC_FIO VARCHAR2(200);
   pFD_ROJD DATE;
   pFC_COC_POL VARCHAR2(30);
   pFC_GROUP VARCHAR2(100);
   pFC_PRIZN VARCHAR2(100);
   pFD_DATA1 DATE;
   pFD_DATA3 DATE;
   pFC_PALATA VARCHAR(20);
  BEGIN
    OPEN cMAIN;
    FETCH cMAIN INTO pFC_FIO, pFD_ROJD, pFC_COC_POL, pFC_GROUP, pFC_PRIZN, pFD_DATA1, pFD_DATA3, pFC_PALATA;
    CLOSE cMAIN;

    INSERT INTO TCLOBS(FC_CLOB) VALUES(EMPTY_CLOB()) RETURNING FK_ID,FC_CLOB INTO rC,cl;
    DBMS_LOB.OPEN(cl,DBMS_LOB.LOB_READWRITE);
  --
    str:='<html><head><meta http-equiv="Content-Type" content="text/html; charset=windows-1251"></head><BODY><p ALIGN="RIGHT"><small>учетная форма 397</small></P><P ALIGN="CENTER"><B><BIG>В СТОЛОВУЮ</BIG></B></P>';
    DBMS_LOB.WRITEAPPEND(cl,LENGTH(str),str);
  --
    str:='<P ALIGN="LEFT"><font face="Courier New, Courier, mono"><B>Отдыхающий &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</B>'||pFC_FIO||'<BR>';
    str:=str||'<B>Дата рождения &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</B>'||to_char(pFD_ROJD,'dd.mm.yyyy')||'<BR>';
    str:=str||'<B>Социальное положение </B>'||pFC_COC_POL||'<BR>';
    str:=str||'<B>Группа отбора &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</B>'||pFC_GROUP||'<BR>';
    str:=str||'<B>Признак контингента &nbsp;</B>'||pFC_PRIZN||'<BR>';
    str:=str||'<B>Дата поступления &nbsp;&nbsp;&nbsp;&nbsp;</B>'||to_char(pFD_DATA1,'dd.mm.yyyy')||'<BR>';
    str:=str||'<B>Дата выбытия &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</B>'||to_char(pFD_DATA3,'dd.mm.yyyy')||'<BR>';
    str:=str||'<B>Лечащий врач &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</B>'||DO_VRACHFIO (GET_PACVRACH (pFK_PACID) ) ||'<BR><BR>';
    str:=str||'<B>Комната № </B>'||pFC_PALATA||'<B> Салфетка № </B>________ '||'<BR>';
    str:=str||'<B>&lt&lt____&gt&gt__________________  г.________</B><BR><BR>';
    str:=str||'<B>Медсестра &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</B>'||DO_VRACHFIO(pFK_VRACHID)||'<BR>';
    str:=str||'</FONT></P></BODY></HTML>';
    DBMS_LOB.WRITEAPPEND(cl,LENGTH(str),str);
    DBMS_LOB.CLOSE(cl);
    RETURN rc;
  END;
  FUNCTION GET_DAYPLAN (pFK_PACID IN NUMBER, pFC_TABLE IN VARCHAR2, pFC_SALFET IN VARCHAR2)
  RETURN NUMBER
   IS-- Created by TimurLan
   HTML_HEAD CONSTANT VARCHAR2 (32767) :=
  ' <html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:w="urn:schemas-microsoft-com:office:word" xmlns="http://www.w3.org/TR/REC-html40"> '||
  ' <head> '||
  ' <meta http-equiv=Content-Type content="text/html; charset=windows-1251"> '||
  ' <link rel=File-List href="./Doc3.files/filelist.xml"> '||
  ' <title>САНИТАРНО-КУРОРТНАЯ КАРТА</title> '||
  ' <!--[if gte mso 9]><xml> '||
  '  <w:WordDocument> '||
  '   <w:View>Print</w:View> '||
  '   <w:Zoom>BestFit</w:Zoom> '||
  '  </w:WordDocument> '||
  ' </xml><![endif]--> '||
  ' <style> '||
  ' <!-- '||
  '  /* Style Definitions */ '||
  ' .my_td  '||
  '     {border:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt} '||
  ' p.MsoNormal, li.MsoNormal, div.MsoNormal '||
  ' 	{mso-style-parent:""; '||
  ' 	margin:0mm; '||
  ' 	margin-bottom:.0001pt; '||
  ' 	mso-pagination:widow-orphan; '||
  ' 	font-size:12.0pt; '||
  ' 	font-family:"Courier New"; '||
  ' 	mso-fareast-font-family:"Courier New";} '||
  ' @page Section1 '||
  ' 	{size:842.0pt 210.0mm; '||
  ' 	mso-page-orientation:landscape; '||
  ' 	margin:20.0mm 70.9pt 20.0mm 70.9pt; '||
  ' 	mso-header-margin:0mm; '||
  ' 	mso-footer-margin:0mm; '||
  ' 	mso-columns:2 even 40.0mm; '||
  ' 	mso-paper-source:0;} '||
  ' div.Section1 '||
  ' 	{page:Section1;} '||
  ' --> '||
  ' </style> '||
  ' </head> '||
  ' <body> '||
  ' <div class=Section1> '||
  '  <!--здесь по-ходу начинается рамка титульника--> '||
  ' <table border=1 cellspacing=0 cellpadding=0 align=right width="100%" '||
  '  style=''width:100.0%;border-collapse:collapse;border:none;mso-border-alt:solid windowtext .5pt;mso-table-lspace:9.0pt;mso-table-rspace:9.0pt;mso-table-anchor-vertical:paragraph;mso-table-anchor-horizontal:margin;mso-table-left:right;mso-table-top:.1pt;mso-padding-alt:0mm 5.4pt 0mm 5.4pt''> '||
  ' <tr style=''height:485.5pt''> '||
  '   <td width="100%" valign=top style=''width:100.0%;border:solid windowtext .5pt;padding:0mm 5.4pt 0mm 5.4pt;height:485.5pt''> '||
  '    <!--содержимое титульника--> '||
  '   <p class=MsoNormal><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></p> '||
  '   <p class=MsoNormal align=center >САНАТОРНО-КУРОРТНАЯ КАРТА</p> '||
  '   <p class=MsoNormal><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></p> '||
  '   <p class=MsoNormal><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></p> '||
  '   <p class=MsoNormal><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></p> '||
  '   <p class=MsoNormal><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></p> '||
  '   <p class=MsoNormal><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></p> '||
  '   <p class=MsoNormal><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></p> '||
  '   <p class=MsoNormal><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></p> ';
  CURSOR cKARTA IS
   select /*+ rule*/
         TKARTA.FC_FAM FC_FAM, TKARTA.FC_IM FC_IM, TKARTA.FC_OTCH FC_OTCH, TKARTA.FC_PUT FC_PUT,
         GET_PACINCOME(TKARTA.FK_ID) FD_DATA1,
         GET_PACPLANOUTCOME(TKARTA.FK_ID) FD_DATA2,
         GET_VRACHFCOTDEL(GET_PACVRACH(TKARTA.FK_ID)) FC_OTDEL,
         GET_PACFCKORP(TKARTA.FK_ID) FC_KORP,
         GET_PACFCPALATA(TKARTA.FK_ID) FC_PALATA,
         DO_VRACHFIO(GET_PACVRACH(TKARTA.FK_ID)) FC_VRACH,
         null as FC_KAB,
  --       GET_VRACHFCKAB(GET_PACVRACH(TKARTA.FK_ID)) FC_KAB,
         GET_VRACHTEL(GET_PACVRACH(TKARTA.FK_ID)) FC_TEL
    from TKARTA
   where TKARTA.FK_ID = pFK_PACID;
   CURSOR cDayPlan IS select fc_time1, fc_time2, fc_name from tdayplan;
   cC CLOB;
   nC NUMBER;
   str VARCHAR2 (4000);
   cTemp1 VARCHAR (30);
   cTemp2 VARCHAR (30);
  BEGIN
    DBMS_LOB.CREATETEMPORARY (cC, TRUE, DBMS_LOB.SESSION);
    str := HTML_HEAD;
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);

    FOR p IN cKARTA LOOP
      str:='<p class=MsoNormal><b>Фамилия</b>&nbsp;&nbsp;&nbsp;'||p.FC_FAM||'</p>';
      str:=str||'<p class=MsoNormal><b>Имя</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'||p.FC_IM||'</p>';
      str:=str||'<p class=MsoNormal><b>Отчество</b>&nbsp;&nbsp;'||p.FC_OTCH||'</p>';
      if (p.FC_PUT = '') OR (p.FC_PUT IS NULL)
       then cTemp1 := '_______';
       else cTemp1 := p.FC_PUT; end if;
      str:=str||'<p class=MsoNormal><b>Путевка №</b>&nbsp;'||cTemp1||'</p>';
      str:=str||'<p class=MsoNormal><b>Лечение с</b>&nbsp;'||TO_CHAR(p.FD_DATA1,'DD.MM.YYYY')||'&nbsp;<b>по</b>&nbsp;'||TO_CHAR(p.FD_DATA2,'DD.MM.YYYY')||'</p>';
      str:=str||'<p class=MsoNormal><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></p>';
      str:=str||'<p class=MsoNormal><b>Прибыл</b>&nbsp;&nbsp;&nbsp;&nbsp;'||TO_CHAR(p.FD_DATA1,'DD.MM.YYYY')||'</p>';
      str:=str||'<p class=MsoNormal><b>Отделение</b>&nbsp;'||p.FC_OTDEL||'</p>';
      str:=str||'<p class=MsoNormal><b>Корпус</b>&nbsp;&nbsp;&nbsp;&nbsp;'||p.FC_KORP||'</p>';
      str:=str||'<p class=MsoNormal><b>Комната №</b>&nbsp;'||p.FC_PALATA||'</p>';
      if (pFC_TABLE = '') OR (pFC_TABLE IS NULL)
       then cTemp1 := '_______';
       else cTemp1 := pFC_TABLE; end if;
      str:=str||'<p class=MsoNormal><b>Стол №</b>&nbsp;'||cTemp1||'</p>';
      if (pFC_SALFET = '') OR (pFC_SALFET IS NULL)
       then cTemp1 := '_______';
       else cTemp1 := pFC_SALFET; end if;
      str:=str||'<p class=MsoNormal><b>Салфетка №</b>&nbsp;'||cTemp1||'</p>';
      str:=str||'<p class=MsoNormal><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></p>';
      str:=str||'<p class=MsoNormal><b>Лечащий врач</b>&nbsp;'||p.FC_VRACH||'</p>';
      if (p.FC_KAB = 'Неизвестен') OR (p.FC_KAB  IS NULL)
       then cTemp1 := '_______';
       else cTemp1:=p.FC_KAB; end if;
      if (p.FC_TEL = '') OR (p.FC_TEL IS NULL)
       then cTemp2 := '_______';
       else cTemp2:=p.FC_TEL; end if;
      str:=str||'<p class=MsoNormal><b>Каб. №</b>&nbsp;'||cTemp1||'&nbsp;<b>тел. №</b>&nbsp;'||cTemp2||'</p>';
    END LOOP;
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    str:='<p class=MsoNormal><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></p>';
    str:=str||'<p class=MsoNormal><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></p>';
    str:=str||'<p class=MsoNormal><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></p>';
    str:=str||'<p class=MsoNormal><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></p>';
    str:=str||'<p class=MsoNormal><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></p>';
    str:=str||'<p class=MsoNormal><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></p>';
    str:=str||'<p class=MsoNormal><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></p>';
    str:=str||'<p class=MsoNormal><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></p>';
    str:=str||'<p class=MsoNormal><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></p>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);

    str:='<p class=MsoNormal align=center>МЕДУЧРЕЖДЕНИЕ «'||PKG_SMINI.READSTRING ('CONFIG', 'S_NAME', 'Не известен') ||'»</p>';
    str:=str||'<p class=MsoNormal align=center>'|| TO_CHAR(SYSDATE, 'YYYY') ||' год</p>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);

    str:=
    '   </td> '||
    '  </tr> '||
    ' </table> '||
    '  <!--здесь кончается рамка титульника--> '||
    ' <p class=MsoNormal><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></p> '||
    '  <!--здесь начинается рамка распорядка--> '||
    ' <table border=1 cellspacing=0 cellpadding=0 align=right width="100%" '||
    '  style=''width:100.0%;border-collapse:collapse;border:none;mso-border-alt:solid windowtext .5pt;mso-table-lspace:9.0pt;mso-table-rspace:9.0pt;mso-table-anchor-vertical:paragraph;mso-table-anchor-horizontal:margin;mso-table-left:right;mso-table-top:.1pt;mso-padding-alt:0mm 5.4pt 0mm 5.4pt''> '||
    '  <tr style=''height:485.5pt''> '||
    '   <td width="100%" valign=top style=''width:100.0%;border:solid windowtext .5pt;padding:0mm 5.4pt 0mm 5.4pt;height:485.5pt''> '||
    '   <!--содержимое распорядка--> '||
    '   <p class=MsoNormal><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></p> '||
    '   <p class=MsoNormal align=center>РАСПОРЯДОК ДНЯ:</p> '||
    '   <p class=MsoNormal><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></p> '||
    '   <!--пошла таблица распорядка--> '||
    '   <table border=1 cellspacing=0 cellpadding=0 width="99%" style=''width:99.92%;border-collapse:collapse;border:none;mso-border-alt:solid windowtext .5pt;mso-padding-alt:0mm 5.4pt 0mm 5.4pt''> '||
    '    <tr><!--ШАПКА--> '||
    '     <td class="my_td"> '||
    '     <p class=MsoNormal align=center><b>Начало</b></p> '||
    '     </td> '||
    '     <td class="my_td"> '||
    '     <p class=MsoNormal align=center><b>Конец</b></p> '||
    '     </td> '||
    '     <td class="my_td"> '||
    '     <p class=MsoNormal align=center><b>Мероприятие</b></p> '||
    '     </td> '||
    '    </tr> ';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);

    str:=' <!--ТЕЛО-->';
    FOR p IN cDayPlan LOOP
      str:=str||'   <tr>';
      str:=str||'    <td class="my_td">';
      str:=str||'    <p class=MsoNormal align=center>'||p.FC_TIME1||'</p>';
      str:=str||'    </td>';
      str:=str||'    <td class="my_td">';
      str:=str||'    <p class=MsoNormal align=center>'||p.FC_TIME2||'</p>';
      str:=str||'    </td>';
      str:=str||'    <td class="my_td">';
      str:=str||'    <p class=MsoNormal>'||p.FC_NAME||'</p>';
      str:=str||'    </td>';
      str:=str||'   </tr>';
    END LOOP;
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);

    str:=
    '   </table> '||
    '   <!--Конец таблицы--> '||
    '   <p class=MsoNormal><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></p> '||
    '   <p class=MsoNormal><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></p> '||
    '  </td> '||
    ' </tr> '||
    ' </table> '||
    ' <!--Конец рамки--> '||
    ' <p class=MsoNormal><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></p> '||
    ' </div> '||
    ' </body></html> ';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);

    INSERT INTO TCLOBS
                (FC_CLOB)
         VALUES (cC)
      RETURNING FK_ID
      INTO nC;
    RETURN nC;
  END;
  FUNCTION GET_NAKL (pFK_PACID IN NUMBER)RETURN NUMBER IS
    nC NUMBER;
    cC CLOB;
    str VARCHAR2(32767);
    strFam VARCHAR(500);
    nSum NUMBER;
    CURSOR c IS SELECT FC_FAM||' '||FC_IM||' '||FC_OTCH,FN_SUM,GET_PACINCOME(TKARTA.FK_ID) FROM TKARTA WHERE FK_ID=pFK_PACID;
    dDate DATE;
  BEGIN
    INSERT INTO TCLOBS(FC_CLOB) VALUES(EMPTY_CLOB()) RETURNING FK_ID,FC_CLOB INTO nC,cC;
    DBMS_LOB.OPEN(cC,DBMS_LOB.LOB_READWRITE);
--    str:='<html><head><meta http-equiv="Content-Type" content="text/html; charset=windows-1251"></head>';
    str:='<html xmlns:o="urn:schemas-microsoft-com:office:office" '||
         'xmlns:w="urn:schemas-microsoft-com:office:word" '||
         'xmlns="http://www.w3.org/TR/REC-html40"> '||
         '<head> '||
         '<meta http-equiv=Content-Type content="text/html; charset=windows-1251"> '||
         '<meta name=ProgId content=Word.Document> '||
         '<meta name=Generator content="Microsoft Word 9"> '||
         '<meta name=Originator content="Microsoft Word 9"> '||
         '<link rel=File-List href="./nakl.files/filelist.xml"> '||
         '<title>Накладная</title> '||
         '<!--[if gte mso 9]><xml> '||
         ' <o:DocumentProperties> '||
         '  <o:Author>Администратор</o:Author> '||
         '  <o:Template>Normal</o:Template> '||
         '  <o:LastAuthor>Администратор</o:LastAuthor> '||
         '  <o:Revision>3</o:Revision> '||
         '  <o:TotalTime>4</o:TotalTime> '||
         '  <o:Created>2001-06-07T12:02:00Z</o:Created> '||
         '  <o:LastSaved>2001-06-07T12:06:00Z</o:LastSaved> '||
         '  <o:Pages>1</o:Pages> '||
         '  <o:Company>Машук</o:Company> '||
         '  <o:Lines>1</o:Lines> '||
         '  <o:Paragraphs>1</o:Paragraphs> '||
         '  <o:Version>9.2812</o:Version> '||
         ' </o:DocumentProperties> '||
         '</xml><![endif]--> '||
         '<style> '||
         '<!-- '||
         ' /* Style Definitions */ '||
         'p.MsoNormal, li.MsoNormal, div.MsoNormal '||
         '	{mso-style-parent:""; '||
         '	margin:0cm; '||
         '	margin-bottom:.0001pt; '||
         '	mso-pagination:widow-orphan; '||
         '	font-size:12.0pt; '||
         '	font-family:"Times New Roman"; '||
         '	mso-fareast-font-family:"Times New Roman";} '||
         'h1 '||
         '	{mso-style-next:Обычный; '||
         '	margin:0cm; '||
         '	margin-bottom:.0001pt; '||
         '	text-align:center; '||
         '	mso-pagination:widow-orphan; '||
         '	page-break-after:avoid; '||
         '	mso-outline-level:1; '||
         '	font-size:12.0pt; '||
         '	font-family:"Times New Roman"; '||
         '	mso-font-kerning:0pt;} '||
         '@page Section1 '||
         '	{ size:595.3pt 841.9pt;'||
         '	margin:2.0cm 42.5pt 2.0cm 3.0cm; '||
         '	mso-header-margin:35.4pt; '||
         '	mso-footer-margin:35.4pt; '||
         '	mso-paper-source:0;} '||
         'div.Section1 '||
         '	{page:Section1;} '||
         '--> '||
         '</style> '||
         '</head> '||
         '<body lang=RU style=''tab-interval:35.4pt''> '||
         '<div class=Section1> '||
         '<p class=MsoNormal align=right style=''text-align:right''><span lang=EN-US '||
         'style=''mso-ansi-language:EN-US''>DATE</span></p> '||
         '<h1><span lang=EN-US style=''mso-ansi-language:EN-US''><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></h1> '||
         '<h1>Накладная №______</h1> '||
         '<p class=MsoNormal><i><span lang=EN-US style=''mso-ansi-language:EN-US''><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></i></p> '||
         '<p class=MsoNormal><i>Кому </i><span lang=EN-US style=''mso-ansi-language:EN-US''>WHOM</span></p> '||
         '<p class=MsoNormal><i><span lang=EN-US style=''mso-ansi-language:EN-US''><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></i></p> '||
         '<p class=MsoNormal><i>От кого </i>Медучреждении "'||PKG_SMINI.READSTRING ('CONFIG', 'S_NAME', 'Не известен')||'"</p> '||
         '<p class=MsoNormal><span lang=EN-US style=''mso-ansi-language:EN-US''><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></p> '||
         '<p class=MsoNormal><span lang=EN-US style=''mso-ansi-language:EN-US''><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></p> '||
         '<p class=MsoNormal><span lang=EN-US style=''mso-ansi-language:EN-US''><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></p> '||
         '<table border=1 cellspacing=0 cellpadding=0 style=''border-collapse:collapse; '||
         ' border:none;mso-border-alt:solid windowtext .5pt;mso-padding-alt:0cm 5.4pt 0cm 5.4pt''> '||
         ' <tr> '||
         '  <td width=105 valign=top style=''width:78.45pt;border:solid windowtext .5pt; '||
         '  padding:0cm 5.4pt 0cm 5.4pt''> '||
         '  <p class=MsoNormal align=center style=''text-align:center''>№ п/п</p> '||
         '  </td> '||
         '  <td width=126 valign=top style=''width:94.45pt;border:solid windowtext .5pt; '||
         '  border-left:none;mso-border-left-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt''> '||
         '  <p class=MsoNormal align=center style=''text-align:center''>Наименование</p> '||
         '  </td> '||
         '  <td width=125 valign=top style=''width:93.5pt;border:solid windowtext .5pt; '||
         '  border-left:none;mso-border-left-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt''> '||
         '  <p class=MsoNormal align=center style=''text-align:center''>Количество</p> '||
         '  </td> '||
         '  <td width=108 valign=top style=''width:81.0pt;border:solid windowtext .5pt; '||
         '  border-left:none;mso-border-left-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt''> '||
         '  <p class=MsoNormal align=center style=''text-align:center''>Цена</p> '||
         '  </td> '||
         '  <td width=175 valign=top style=''width:131.15pt;border:solid windowtext .5pt; '||
         '  border-left:none;mso-border-left-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt''> '||
         '  <p class=MsoNormal align=center style=''text-align:center''>Сумма</p> '||
         '  </td> '||
         ' </tr> '||
         ' <tr> '||
         '  <td width=105 valign=top style=''width:78.45pt;border:solid windowtext .5pt; '||
         '  border-top:none;mso-border-top-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt''> '||
         '  <p class=MsoNormal><i>1<o:p></o:p></i></p> '||
         '  </td> '||
         '  <td width=126 valign=top style=''width:94.45pt;border-top:none;border-left: '||
         '  none;border-bottom:solid windowtext .5pt;border-right:solid windowtext .5pt; '||
         '  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt; '||
         '  padding:0cm 5.4pt 0cm 5.4pt''> '||
         '  <p class=MsoNormal><i>путевка<o:p></o:p></i></p> '||
         '  </td> '||
         '  <td width=125 valign=top style=''width:93.5pt;border-top:none;border-left: '||
         '  none;border-bottom:solid windowtext .5pt;border-right:solid windowtext .5pt; '||
         '  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt; '||
         '  padding:0cm 5.4pt 0cm 5.4pt''> '||
         '  <p class=MsoNormal><i>1 шт<o:p></o:p></i></p> '||
         '  </td> '||
         '  <td width=108 valign=top style=''width:81.0pt;border-top:none;border-left: '||
         '  none;border-bottom:solid windowtext .5pt;border-right:solid windowtext .5pt; '||
         '  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt; '||
         '  padding:0cm 5.4pt 0cm 5.4pt''> '||
         '  <p class=MsoNormal><i><span lang=EN-US style=''mso-ansi-language:EN-US''>PRICE</span><o:p></o:p></i></p> '||
         '  </td> '||
         '  <td width=96 valign=top style=''width:72.0pt;border-top:none;border-left: '||
         '  none;border-bottom:solid windowtext .5pt;border-right:solid windowtext .5pt; '||
         '  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt; '||
         '  padding:0cm 5.4pt 0cm 5.4pt''> '||
         '  <p class=MsoNormal><i><span lang=EN-US style=''mso-ansi-language:EN-US''>PRICE</span><o:p></o:p></i></p> '||
         '  </td> '||
/*         '  </td> '||
         '  <td width=79 valign=top style=''width:59.15pt;border-top:none;border-left: '||
         '  none;border-bottom:solid windowtext .5pt;border-right:solid windowtext .5pt; '||
         '  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt; '||
         '  padding:0cm 5.4pt 0cm 5.4pt''> '||
         '  <p class=MsoNormal><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></p> '||
         '  </td> '||
*/         ' </tr> '||
         '</table> '||
         '<p class=MsoNormal><span lang=EN-US style=''mso-ansi-language:EN-US''><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></p> '||
         '<p class=MsoNormal><span lang=EN-US style=''mso-ansi-language:EN-US''><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></p> '||
         '<p class=MsoNormal>Сдал____________<span style=''mso-tab-count:8''>                                                                                     </span>Принял__________</p> '||
         '</div> '||
         '</body> '||
         '</html> ';
    OPEN c;
    FETCH c INTO strFam,nSum,dDate;
    CLOSE c;
    str:=REPLACE(str,'WHOM',strFam);
    str:=REPLACE(str,'PRICE',nSum);
    str:=REPLACE(str,'DATE',TO_CHAR(dDate,'dd.mm.yyyy'));
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
    DBMS_LOB.CLOSE(cC);
    RETURN nC;
  END;
/*  FUNCTION GET_TITLE_OF_IB (pFK_PACID IN NUMBER) RETURN NUMBER IS
    CURSOR cKorp is select * from tkorp;
    CURSOR cMain is select get_ib(pFK_PACID) as FC_IB,FC_FAM,FC_IM,FC_OTCH,TRUNC(MONTHS_BETWEEN (SYSDATE, fd_rojd) / 12) AS FN_AGE,TO_CHAR(FD_ROJD,'dd.mm.yyyy') as FD_ROJD,FC_PUT,
           TO_CHAR(GET_PACPLANINCOME(pFK_PACID),'dd.mm.yyyy hh24:mi') as FC_PLANIN,
           TO_CHAR(GET_PACPLANOUTCOME(pFK_PACID),'dd.mm.yyyy hh24:mi') as FC_PLANOUT,
--           (select FC_NAME from TKORP where FK_ID = GET_PACKORPID(pFK_PACID)) as FC_KORP,
--           (select FC_PALATA from TROOM where FK_ID = GET_PACPALATAID(pFK_PACID)) as FC_PALATA,
--           (select FC_FAM||' '||FC_NAME||' '||FC_OTCH from TSOTR where FK_ID = GET_PACVRACH(pFK_PACID)) as FC_VRACH,
           TO_CHAR(GET_PACINCOME(pFK_PACID),'dd.mm.yyyy hh24:mi') as FC_IN,
           TO_CHAR(GET_PACOUTCOME(pFK_PACID),'dd.mm.yyyy hh24:mi') as FC_OUT,
           (TRUNC(GET_PACINCOME(pFK_PACID)) - TRUNC(GET_PACPLANINCOME(pFK_PACID))) as FN_OPOZD,
--           (select FN_KOL FROM TSROKY,(SELECT MAX(FK_ID) FK_MAXID FROM TSROKY WHERE FK_PACID=pFK_PACID) where fk_id = fk_maxid and FK_PRYB in (3,7)) as FN_OSTATOK,
--           (select FC_NAME from TVYBTYPE where fk_id = (select FK_VYBID FROM TSROKY,(SELECT MAX(FK_ID) FK_MAXID FROM TSROKY WHERE FK_PACID=pFK_PACID) where fk_id = fk_maxid and FK_PRYB in (3,7) and FN_KOL > 0)) as FC_VYBTYPE,
           GET_PACDAYS(pFK_PACID) as FN_KDN
      FROM TKARTA
     WHERE FK_ID = pFK_PACID;
    HTML_HEAD CONSTANT VARCHAR(32767) :=
    '<html xmlns:o="urn:schemas-microsoft-com:office:office"'||
    'xmlns:w="urn:schemas-microsoft-com:office:word"'||
    'xmlns="http://www.w3.org/TR/REC-html40">'||
    '<head>'||
    '<meta http-equiv=Content-Type content="text/html; charset=windows-1251">'||
    '<meta name=ProgId content=Word.Document>'||
    '<title>ИСТОРИЯ БОЛЕЗНИ</title>'||
    '<!--[if gte mso 9]><xml>'||
    ' <w:WordDocument>'||
    '  <w:View>Print</w:View>'||
    ' </w:WordDocument>'||
    '</xml><![endif]-->'||
    '<style>'||
    '<!--'||
    ' \* Style Definitions *\'||
    'p.MsoNormal, li.MsoNormal, div.MsoNormal'||
    '	{mso-style-parent:"";'||
    '	margin:0cm;'||
    '	margin-bottom:.0001pt;'||
    '	mso-pagination:widow-orphan;'||
    '	font-size:12.0pt;'||
    '	font-family:"Times New Roman";'||
    '	mso-fareast-font-family:"Times New Roman";}'||
    '@page Section1'||
    '	{size:595.3pt 841.9pt;'||
    '	margin:1.0cm 1.0cm 1.0cm 1.0cm;'||
    '	mso-header-margin:35.45pt;'||
    '	mso-footer-margin:35.45pt;'||
    '	mso-paper-source:0;}'||
    'div.Section1'||
    '	{page:Section1;}'||
    '-->'||
    '</style>'||
    '</head>'||
    '<body>'||
    '<div class=Section1>'||
    '<table border=0 cellspacing=0 cellpadding=0 width="100%">'||
    ' <tr>'||
    '  <td width="50%">'||
    '  <p class=MsoNormal style=''font-family:Arial''>Филиал ООО «Мострансгаз»</p>'||
    '  <p class=MsoNormal style=''font-family:Arial''>Санаторий «Голубая Горка»</p>'||
    '  </td>'||
    '  <td width="50%">'||
    '  <p align=center valing=top><i>С режимом ознакомлен(а):</i></p>'||
    '  </td>'||
    ' </tr>'||
    ' <tr>'||
    '  <td width="50%">&nbsp;</td>'||
    '  <td width="50%">'||
    '  <p>Страховой полис __________________</p>'||
    '  </td>'||
    ' </tr>'||
    '</table>'||
    '<BR>'||
--    '<BR>'||
    '<BR>';
    cC CLOB;
    nC NUMBER;
    str VARCHAR2 (8000);
    cRabota VARCHAR (1000);
    cAdress VARCHAR (1000);
    cGroup VARCHAR (100);
  BEGIN
    select GET_PACFULLWORKPLACE(pFK_PACID) into cRabota from dual;
    if length(cRabota) < 3 then
      select FC_RABOTA into cRabota
        from TPEOPLES
       where fk_id = (select fk_peplid from tkarta where fk_id = pFK_PACID);
    end if;

    select GET_PACFULLADRESS(pFK_PACID) into cAdress from Dual;
\*    select GET_PACFULLADRESS(adrid) into cAdress
      from (select MIN(TADRESS.FK_ID) as adrid from TADRESS where fk_pacid = (select fk_peplid from tkarta where fk_id = pFK_PACID));*\

    select FL_SKK into cGroup from tkarta where fk_id = pFK_PACID;
    if cGroup = 1 then
      select fc_name into cGroup from tgroup where fk_id = (select FK_GROUPID from tkarta where fk_id = pFK_PACID);
    else
      cGroup := '';
    end if;

    INSERT INTO TCLOBS (FC_CLOB) VALUES (EMPTY_CLOB () ) RETURNING FK_ID,FC_CLOB INTO nC,cC;
    DBMS_LOB.OPEN (cC, DBMS_LOB.LOB_READWRITE);
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (HTML_HEAD), HTML_HEAD);

    for n in cMain LOOP
    str:='<p class=MsoNormal style=''font-family:Arial'' align=center><BIG><i><b>ИСТОРИЯ БОЛЕЗНИ № '||n.FC_IB||'</b></i></BIG></p>';
    str:=str||'<p class=MsoNormal style=''font-family:Arial'' align=center><b>(санитарно-курортная карта больного)</b></p>';
    str:=str||'<BR>';
    str:=str||'<p class=MsoNormal style=''line-height:150%''>Ф.И.О. <B><i>'||n.FC_FAM||' '||n.FC_IM||' '||n.FC_OTCH||'</i></B></p>';
    str:=str||'<p class=MsoNormal style=''line-height:150%''>Возраст <i>'||n.FN_AGE||' ('||n.FD_ROJD||')'||'</i></p>';
    if length(cRabota) > 2 then
      str:=str||'<p class=MsoNormal style=''line-height:150%''>Место работы и занимаемая должность <i>'||cRabota||'</i></p>';
    else
      str:=str||'<p class=MsoNormal style=''line-height:150%''>Место работы и занимаемая должность _______________________________________________________</p>';
    end if;
    if length(cRabota) > 55 then
      str:=str||'';
    else
      str:=str||'<p class=MsoNormal style=''line-height:150%''>_________________________________________________________________________________________</p>';
    end if;
    if length(cAdress) > 2 then
      str:=str||'<p class=MsoNormal style=''line-height:150%''>Домашний адрес <i>'||cAdress||'</i></p>';
    else
      str:=str||'<p class=MsoNormal style=''line-height:150%''>Домашний адрес __________________________________________________________________________</p>';
    end if;
    if length(cAdress) > 55 then
      str:=str||'';
    else
      str:=str||'<p class=MsoNormal style=''line-height:150%''>_________________________________________________________________________________________</p>';
    end if;
    str:=str||'<p class=MsoNormal style=''line-height:150%''>№ путевки <i>'||n.FC_PUT||'</i> сроки путевки с <i>'||n.FC_PLANIN||'</i> по <i>'||n.FC_PLANOUT||'</i></p>';
    str:=str||'<p class=MsoNormal style=''line-height:150%''>курсовки</p>';
    str:=str||'<p class=MsoNormal style=''line-height:150%''>Корпус № <i>"'||RETURN_KORPUS(pFK_PACID)||'"</i> палата № <i>'||RETURN_PALATA(pFK_PACID)||'</i></p>';
    str:=str||'<p class=MsoNormal style=''line-height:150%''>Лечащий врач <i>'||RETURN_VRACH(pFK_PACID)||'</i></p>';
    if length(n.FC_IN) > 2 then
      str:=str||'<p class=MsoNormal style=''line-height:150%''>Прибыл(а) <i>'||n.FC_IN||'</i></p>';
    else
      str:=str||'<p class=MsoNormal style=''line-height:150%''>Прибыл(а) _______________________________________________________________________________</p>';
    end if;
    if length(n.FC_OUT) > 2 then
      str:=str||'<p class=MsoNormal style=''line-height:150%''>Выбыл(а) <i>'||n.FC_OUT||'</i></p>';
    else
      str:=str||'<p class=MsoNormal style=''line-height:150%''>Выбыл(а) ________________________________________________________________________________</p>';
    end if;
    str:=str||'<p class=MsoNormal style=''line-height:150%''>Опоздал(а) на <i>'||n.FN_OPOZD||'</i> дней</p>';
    if RETURN_OSTATOK(pFK_PACID) > 0 then
      str:=str||'<p class=MsoNormal style=''line-height:150%''>Выписан(а) досрочно на <i>'||RETURN_OSTATOK(pFK_PACID)||'</i> дней</p>';
    else
      str:=str||'<p class=MsoNormal style=''line-height:150%''>Выписан(а) досрочно на ____________ дней</p>';
    end if;
    if RETURN_OSTATOK(pFK_PACID) <> 0 then
      str:=str||'<p class=MsoNormal style=''line-height:150%''>Причина досрочной выписки <i>"'||RETURN_VYBTYPE(pFK_PACID)||'"</i></p>';
    else
      str:=str||'<p class=MsoNormal style=''line-height:150%''>Причина досрочной выписки _______________________________________________________________</p>';
    end if;
    str:=str||'<p class=MsoNormal style=''line-height:150%''>Продлено лечение на ____________ дней</p>';
    str:=str||'<p class=MsoNormal style=''line-height:150%''>Количество койко-дней <i>'||n.FN_KDN||'</i></p>';
    str:=str||'<p class=MsoNormal style=''line-height:150%''>Выдан б/лист № ____________ с ____________ по ____________</p>';
    if length(cGroup) > 2 then
      str:=str||'<p class=MsoNormal style=''line-height:150%''>Время и место отбора (наименование и адрес медицинского учреждения) <i>'||cGroup||'</i></p>';
    else
      str:=str||'<p class=MsoNormal style=''line-height:150%''>Время и место отбора (наименование и адрес медицинского учреждения) _________________________</p>';
    end if;
    if length(cGroup) > 28 then
      str:=str||'';
    else
      str:=str||'<p class=MsoNormal style=''line-height:150%''>_________________________________________________________________________________________</p>';
    end if;
    str:=str||'<p class=MsoNormal style=''line-height:150%''>Диагноз с места отбора ____________________________________________________________________</p>';
    str:=str||'<p class=MsoNormal style=''line-height:150%''>_________________________________________________________________________________________</p>';
    str:=str||'<p class=MsoNormal style=''line-height:150%''>Диагноз санатория при поступлении (дата):</p>';
    str:=str||'<p class=MsoNormal style=''line-height:150%''>а) основной ______________________________________________________________________________</p>';
    str:=str||'<p class=MsoNormal style=''line-height:150%''>_________________________________________________________________________________________</p>';
    str:=str||'<p class=MsoNormal style=''line-height:150%''>б) сопутствующий ________________________________________________________________________</p>';
    str:=str||'<p class=MsoNormal style=''line-height:150%''>_________________________________________________________________________________________</p>';
    str:=str||'<p class=MsoNormal style=''line-height:150%''>Диагноз заключительный (дата): </p>';
    str:=str||'<p class=MsoNormal style=''line-height:150%''>а) основной ______________________________________________________________________________</p>';
    str:=str||'<p class=MsoNormal style=''line-height:150%''>_________________________________________________________________________________________</p>';
    str:=str||'<p class=MsoNormal style=''line-height:150%''>б) сопутствующий ________________________________________________________________________</p>';
    str:=str||'<p class=MsoNormal style=''line-height:150%''>_________________________________________________________________________________________</p>';
    END LOOP;
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    str:='</div></body></html>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
    DBMS_LOB.CLOSE (cC);
    RETURN nC;
  END;*/
  FUNCTION GET_TITLE_OF_IB (pFK_PACID IN NUMBER) RETURN NUMBER IS
    CURSOR cKorp is select * from tkorp;
    CURSOR cMain is select FK_IBID ,FC_FAM,FC_IM,FC_OTCH,TRUNC(MONTHS_BETWEEN (SYSDATE, fd_rojd) / 12) AS FN_AGE,TO_CHAR(FD_ROJD,'dd.mm.yyyy') as FD_ROJD,FC_PUT,
           TO_CHAR(GET_PACPLANINCOME(pFK_PACID),'dd.mm.yyyy') as FC_PLANIN,
           TO_CHAR(GET_PACPLANOUTCOME(pFK_PACID),'dd.mm.yyyy') as FC_PLANOUT,
--           (select FC_NAME from TKORP where FK_ID = GET_PACKORPID(pFK_PACID)) as FC_KORP,
--           (select FC_PALATA from TROOM where FK_ID = GET_PACPALATAID(pFK_PACID)) as FC_PALATA,
--           (select FC_FAM||' '||FC_NAME||' '||FC_OTCH from TSOTR where FK_ID = GET_PACVRACH(pFK_PACID)) as FC_VRACH,
           TO_CHAR(GET_PACINCOME(pFK_PACID),'dd.mm.yyyy') as FC_IN,
--           TO_CHAR(GET_PACOUTCOME(pFK_PACID),'dd.mm.yyyy hh24:mi') as FC_OUT,
           (TRUNC(GET_PACINCOME(pFK_PACID)) - TRUNC(GET_PACPLANINCOME(pFK_PACID))) as FN_OPOZD,
--           (select FN_KOL FROM TSROKY,(SELECT MAX(FK_ID) FK_MAXID FROM TSROKY WHERE FK_PACID=pFK_PACID) where fk_id = fk_maxid and FK_PRYB in (3,7)) as FN_OSTATOK,
--           (select FC_NAME from TVYBTYPE where fk_id = (select FK_VYBID FROM TSROKY,(SELECT MAX(FK_ID) FK_MAXID FROM TSROKY WHERE FK_PACID=pFK_PACID) where fk_id = fk_maxid and FK_PRYB in (3,7) and FN_KOL > 0)) as FC_VYBTYPE,
           GET_PACDAYS(pFK_PACID) as FN_KDN,
           FK_GROUPID
      FROM TKARTA
     WHERE FK_ID = pFK_PACID;
    cC CLOB;
    nC NUMBER;
--    str VARCHAR2 (8000);
    cRabota VARCHAR (1000);
    cAdress VARCHAR (1000);
    cGroup VARCHAR (100);
    str VARCHAR2(32767);
    nTemp NUMBER;
    strT VARCHAR2(1000);
  BEGIN
str:='<html xmlns:o="urn:schemas-microsoft-com:office:office" '||CHR(13)||
      'xmlns:w="urn:schemas-microsoft-com:office:word" '||CHR(13)||
      'xmlns="http://www.w3.org/TR/REC-html40"> '||CHR(13)||
      '<head> '||CHR(13)||
      '<meta http-equiv=Content-Type content="text/html; charset=windows-1251"> '||CHR(13)||
      '<meta name=ProgId content=Word.Document> '||CHR(13)||
      '<meta name=Generator content="Microsoft Word 9"> '||CHR(13)||
      '<meta name=Originator content="Microsoft Word 9"> '||CHR(13)||
      '<link rel=File-List href="./Санаторий%20Сочи%20Лицо.files/filelist.xml"> '||CHR(13)||
      '<title>Санаторий "СОЧИ"</title> '||CHR(13)||
      '<!--[if gte mso 9]><xml> '||CHR(13)||
      ' <o:DocumentProperties> '||CHR(13)||
      '  <o:Author>Philip A. Milovanov</o:Author> '||CHR(13)||
      '  <o:Template>Normal</o:Template> '||CHR(13)||
      '  <o:LastAuthor>Philip A. Milovanov</o:LastAuthor> '||CHR(13)||
      '  <o:Revision>2</o:Revision> '||CHR(13)||
      '  <o:TotalTime>26</o:TotalTime> '||CHR(13)||
      '  <o:Created>2002-05-25T08:53:00Z</o:Created> '||CHR(13)||
      '  <o:LastSaved>2002-05-25T08:53:00Z</o:LastSaved> '||CHR(13)||
      '  <o:Pages>1</o:Pages> '||CHR(13)||
      '  <o:Company>SoftMaster</o:Company> '||CHR(13)||
      '  <o:Lines>1</o:Lines> '||CHR(13)||
      '  <o:Paragraphs>1</o:Paragraphs> '||CHR(13)||
      '  <o:Version>9.3821</o:Version> '||CHR(13)||
      ' </o:DocumentProperties> '||CHR(13)||
      '</xml><![endif]--> '||CHR(13)||
      '<style> '||CHR(13)||
      '<!-- '||CHR(13)||
      ' /* Style Definitions */ '||CHR(13)||
      'p.MsoNormal, li.MsoNormal, div.MsoNormal '||CHR(13)||
      '	{mso-style-parent:""; '||CHR(13)||
      '	margin:0cm; '||CHR(13)||
      '	margin-bottom:.0001pt; '||CHR(13)||
      '	mso-pagination:widow-orphan; '||CHR(13)||
      '	font-size:12.0pt; '||CHR(13)||
      '	font-family:"Times New Roman"; '||CHR(13)||
      '	mso-fareast-font-family:"Times New Roman";} '||CHR(13)||
      'h1 '||CHR(13)||
      '	{mso-style-next:Обычный; '||CHR(13)||
      '	margin:0cm; '||CHR(13)||
      '	margin-bottom:.0001pt; '||CHR(13)||
      '	text-align:center; '||CHR(13)||
      '	mso-pagination:widow-orphan; '||CHR(13)||
      '	page-break-after:avoid; '||CHR(13)||
      '	mso-outline-level:1; '||CHR(13)||
      '	font-size:12.0pt; '||CHR(13)||
      '	font-family:"Times New Roman"; '||CHR(13)||
      '	mso-font-kerning:0pt;} '||CHR(13)||
      '@page Section1 '||CHR(13)||
      '	{size:595.3pt 841.9pt; '||CHR(13)||
      '	margin:2.0cm 42.5pt 2.0cm 3.0cm; '||CHR(13)||
      '	mso-header-margin:35.4pt; '||CHR(13)||
      '	mso-footer-margin:35.4pt; '||CHR(13)||
      '	mso-paper-source:0;} '||CHR(13)||
      'div.Section1 '||CHR(13)||
      '	{page:Section1;} '||CHR(13)||
      '--> '||CHR(13)||
      '</style> '||CHR(13)||
      '</head> '||CHR(13)||
      '<body lang=RU style=''tab-interval:35.4pt''> '||CHR(13)||
      '<div class=Section1> '||CHR(13)||
      '<p class=MsoNormal align=center>Санаторий "СОЧИ"</p> '||CHR(13)||
      '<p class=MsoNormal align=center>Курортная книжка № :FK_IBID'||CHR(13)||
      '</span></p><BR> '||CHR(13)||
      '<table border=0 cellspacing=0 cellpadding=0 style=''border-collapse:collapse; '||CHR(13)||
      ' mso-padding-alt:0cm 5.4pt 0cm 5.4pt''> '||CHR(13)||
      ' <tr> '||CHR(13)||
      '  <td width=235 valign=top style=''width:176.4pt;padding:0cm 5.4pt 0cm 5.4pt''> '||CHR(13)||
      '  <p class=MsoNormal>Фамилия:</p> '||CHR(13)||
      '  </td> '||CHR(13)||
      '  <td width=180 valign=top style=''width:135.0pt;padding:0cm 5.4pt 0cm 5.4pt''> '||CHR(13)||
      '  <p class=MsoNormal><span lang=EN-US style=''mso-ansi-language:EN-US''>:FC_FAM<o:p></o:p></span></p> '||CHR(13)||
      '  </td> '||CHR(13)||
      ' </tr> '||CHR(13)||
      ' <tr> '||CHR(13)||
      '  <td width=235 valign=top style=''width:176.4pt;padding:0cm 5.4pt 0cm 5.4pt''> '||CHR(13)||
      '  <p class=MsoNormal>Имя Отчество:</p> '||CHR(13)||
      '  </td> '||CHR(13)||
      '  <td width=180 valign=top style=''width:135.0pt;padding:0cm 5.4pt 0cm 5.4pt''> '||CHR(13)||
      '  <p class=MsoNormal><span lang=EN-US style=''mso-ansi-language:EN-US''>:FC_NAMEOTCH<o:p></o:p></span></p> '||CHR(13)||
      '  </td> '||CHR(13)||
      ' </tr> '||CHR(13)||
      ' <tr> '||CHR(13)||
      '  <td width=235 valign=top style=''width:176.4pt;padding:0cm 5.4pt 0cm 5.4pt''> '||CHR(13)||
      '  <p class=MsoNormal>Дата рождения:</p> '||CHR(13)||
      '  </td> '||CHR(13)||
      '  <td width=180 valign=top style=''width:135.0pt;padding:0cm 5.4pt 0cm 5.4pt''> '||CHR(13)||
      '  <p class=MsoNormal><span lang=EN-US style=''mso-ansi-language:EN-US''>:FD_ROJD<o:p></o:p></span></p> '||CHR(13)||
      '  </td> '||CHR(13)||
      ' </tr> '||CHR(13)||
      ' <tr> '||CHR(13)||
      '  <td width=235 valign=top style=''width:176.4pt;padding:0cm 5.4pt 0cm 5.4pt''> '||CHR(13)||
      '  <p class=MsoNormal><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></p> '||CHR(13)||
      '  </td> '||CHR(13)||
      '  <td width=180 valign=top style=''width:135.0pt;padding:0cm 5.4pt 0cm 5.4pt''> '||CHR(13)||
      '  <p class=MsoNormal><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></p> '||CHR(13)||
      '  </td> '||CHR(13)||
      ' </tr> '||CHR(13)||
      ' <tr> '||CHR(13)||
      '  <td width=235 valign=top style=''width:176.4pt;padding:0cm 5.4pt 0cm 5.4pt''> '||CHR(13)||
      '  <p class=MsoNormal>Путевка</p> '||CHR(13)||
      '  </td> '||CHR(13)||
      '  <td width=180 valign=top style=''width:135.0pt;padding:0cm 5.4pt 0cm 5.4pt''> '||CHR(13)||
      '  <p class=MsoNormal><span lang=EN-US style=''mso-ansi-language:EN-US''>:FC_PUT<o:p></o:p></span></p> '||CHR(13)||
      '  </td> '||CHR(13)||
      ' </tr> '||CHR(13)||
      ' <tr> '||CHR(13)||
      '  <td width=235 valign=top style=''width:176.4pt;padding:0cm 5.4pt 0cm 5.4pt''> '||CHR(13)||
      '  <p class=MsoNormal>Срок лечения:</p> '||CHR(13)||
      '  </td> '||CHR(13)||
      '  <td width=180 valign=top style=''width:135.0pt;padding:0cm 5.4pt 0cm 5.4pt''> '||CHR(13)||
      '  <p class=MsoNormal>с :FD_PD1 '||CHR(13)||
      '   по :FD_PD2 '||CHR(13)||
      '  </p> '||CHR(13)||
      '  </td> '||CHR(13)||
      ' </tr> '||CHR(13)||
      ' <tr> '||CHR(13)||
      '  <td width=235 valign=top style=''width:176.4pt;padding:0cm 5.4pt 0cm 5.4pt''> '||CHR(13)||
      '  <p class=MsoNormal><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></p> '||CHR(13)||
      '  </td> '||CHR(13)||
      '  <td width=180 valign=top style=''width:135.0pt;padding:0cm 5.4pt 0cm 5.4pt''> '||CHR(13)||
      '  <p class=MsoNormal><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></p> '||CHR(13)||
      '  </td> '||CHR(13)||
      ' </tr> '||CHR(13)||
      ' <tr> '||CHR(13)||
      '  <td width=235 valign=top style=''width:176.4pt;padding:0cm 5.4pt 0cm 5.4pt''> '||CHR(13)||
      '  <p class=MsoNormal>Дата фактического прибытия:</p> '||CHR(13)||
      '  </td> '||CHR(13)||
      '  <td width=180 valign=top style=''width:135.0pt;padding:0cm 5.4pt 0cm 5.4pt''> '||CHR(13)||
      '  <p class=MsoNormal><span lang=EN-US style=''mso-ansi-language:EN-US''>:FD_F1<o:p></o:p></span></p> '||CHR(13)||
      '  </td> '||CHR(13)||
      ' </tr> '||CHR(13)||
      ' <tr> '||CHR(13)||
      '  <td width=235 valign=top style=''width:176.4pt;padding:0cm 5.4pt 0cm 5.4pt''> '||CHR(13)||
      '  <p class=MsoNormal><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></p> '||CHR(13)||
      '  </td> '||CHR(13)||
      '  <td width=180 valign=top style=''width:135.0pt;padding:0cm 5.4pt 0cm 5.4pt''> '||CHR(13)||
      '  <p class=MsoNormal><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></p> '||CHR(13)||
      '  </td> '||CHR(13)||
      ' </tr> '||CHR(13)||
      ' <tr> '||CHR(13)||
      '  <td width=235 valign=top style=''width:176.4pt;padding:0cm 5.4pt 0cm 5.4pt''> '||CHR(13)||
      '  <p class=MsoNormal>Столовая:</p> '||CHR(13)||
      '  </td> '||CHR(13)||
      '  <td width=180 valign=top style=''width:135.0pt;padding:0cm 5.4pt 0cm 5.4pt''> '||CHR(13)||
      '  <p class=MsoNormal><span lang=EN-US style=''mso-ansi-language:EN-US''>:FC_STOL<o:p></o:p></span></p> '||CHR(13)||
      '  </td> '||CHR(13)||
      ' </tr> '||CHR(13)||
      ' <tr> '||CHR(13)||
      '  <td width=235 valign=top style=''width:176.4pt;padding:0cm 5.4pt 0cm 5.4pt''> '||CHR(13)||
      '  <p class=MsoNormal>Корпус:</p> '||CHR(13)||
      '  </td> '||CHR(13)||
      '  <td width=180 valign=top style=''width:135.0pt;padding:0cm 5.4pt 0cm 5.4pt''> '||CHR(13)||
      '  <p class=MsoNormal>:FC_KORPUS '||CHR(13)||
      '  </span></p> '||CHR(13)||
      '  </td> '||CHR(13)||
      ' </tr> '||CHR(13)||
      ' <tr> '||CHR(13)||
      '  <td width=235 valign=top style=''width:176.4pt;padding:0cm 5.4pt 0cm 5.4pt''> '||CHR(13)||
      '  <p class=MsoNormal>Комната:</p> '||CHR(13)||
      '  </td> '||CHR(13)||
      '  <td width=180 valign=top style=''width:135.0pt;padding:0cm 5.4pt 0cm 5.4pt''> '||CHR(13)||
      '  <p class=MsoNormal>:FC_PALATA '||CHR(13)||
      '  </span></p> '||CHR(13)||
      '  </td> '||CHR(13)||
      ' </tr> '||CHR(13)||
      '</table> '||CHR(13)||
      '<p class=MsoNormal><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></p> '||CHR(13)||
      '<B>Санаторий "СОЧИ"</B> '||CHR(13)||
      '<table border=0 cellspacing=0 cellpadding=0 style=''border-collapse:collapse; '||CHR(13)||
      ' mso-padding-alt:0cm 5.4pt 0cm 5.4pt''> '||CHR(13)||
      ' <tr> '||CHR(13)||
      '  <td width=319 valign=top style=''width:238.95pt;padding:0cm 5.4pt 0cm 5.4pt''> '||CHR(13)||
      '  <p class=MsoNormal>Шифр&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;)</p> '||CHR(13)||
      '  </td> '||CHR(13)||
      '  <td width=319 valign=top style=''width:239.6pt;padding:0cm 5.4pt 0cm 5.4pt''> '||CHR(13)||
      '  <p class=MsoNormal>Комната № :FC_PALATA '||CHR(13)||
      '  </span> Отделение №&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p> '||CHR(13)||
      '  </td> '||CHR(13)||
      ' </tr> '||CHR(13)||
      ' <tr> '||CHR(13)||
      '  <td width=319 valign=top style=''width:238.95pt;padding:0cm 5.4pt 0cm 5.4pt''> '||CHR(13)||
      '  <p class=MsoNormal>Факторы риска:</p> '||CHR(13)||
      '  </td> '||CHR(13)||
      '  <td width=319 valign=top style=''width:239.6pt;padding:0cm 5.4pt 0cm 5.4pt''> '||CHR(13)||
      '  <p class=MsoNormal>Корпус <:FC_KORPUS '||CHR(13)||
      '  </span>></p> '||CHR(13)||
      '  </td> '||CHR(13)||
      ' </tr> '||CHR(13)||
      ' <tr> '||CHR(13)||
      '  <td width=319 valign=top style=''width:238.95pt;padding:0cm 5.4pt 0cm 5.4pt''> '||CHR(13)||
      '  <p class=MsoNormal><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></p> '||CHR(13)||
      '  </td> '||CHR(13)||
      '  <td width=319 valign=top style=''width:239.6pt;padding:0cm 5.4pt 0cm 5.4pt''> '||CHR(13)||
      '  <p class=MsoNormal>Лечащий врач&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p> '||CHR(13)||
      '  </td> '||CHR(13)||
      ' </tr> '||CHR(13)||
      ' <tr> '||CHR(13)||
      '  <td width=319 valign=top style=''width:238.95pt;padding:0cm 5.4pt 0cm 5.4pt''> '||CHR(13)||
      '  <p class=MsoNormal>АГ</p> '||CHR(13)||
      '  </td> '||CHR(13)||
      '  <td width=319 valign=top style=''width:239.6pt;padding:0cm 5.4pt 0cm 5.4pt''> '||CHR(13)||
      '  <p class=MsoNormal>Лечился в санатории в&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;году</p> '||CHR(13)||
      '  </td> '||CHR(13)||
      ' </tr> '||CHR(13)||
      ' <tr> '||CHR(13)||
      '  <td width=319 valign=top style=''width:238.95pt;padding:0cm 5.4pt 0cm 5.4pt''> '||CHR(13)||
      '  <p class=MsoNormal>ГХ</p> '||CHR(13)||
      '  </td> '||CHR(13)||
      '  <td width=319 valign=top style=''width:239.6pt;padding:0cm 5.4pt 0cm 5.4pt''> '||CHR(13)||
      '  <p class=MsoNormal>Температура&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p> '||CHR(13)||
      '  </td> '||CHR(13)||
      ' </tr> '||CHR(13)||
      ' <tr> '||CHR(13)||
      '  <td width=319 valign=top style=''width:238.95pt;padding:0cm 5.4pt 0cm 5.4pt''> '||CHR(13)||
      '  <p class=MsoNormal>ГГ</p> '||CHR(13)||
      '  </td> '||CHR(13)||
      '  <td width=319 valign=top style=''width:239.6pt;padding:0cm 5.4pt 0cm 5.4pt''> '||CHR(13)||
      '  <p class=MsoNormal>Форма 20&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p> '||CHR(13)||
      '  </td> '||CHR(13)||
      ' </tr> '||CHR(13)||
      ' <tr> '||CHR(13)||
      '  <td width=319 valign=top style=''width:238.95pt;padding:0cm 5.4pt 0cm 5.4pt''> '||CHR(13)||
      '  <p class=MsoNormal>К</p> '||CHR(13)||
      '  </td> '||CHR(13)||
      '  <td width=319 valign=top style=''width:239.6pt;padding:0cm 5.4pt 0cm 5.4pt''> '||CHR(13)||
      '  <p class=MsoNormal>Аллергия :FC_ALERG</p> '||CHR(13)||
--      '  <p class=MsoNormal>Аллергия нет, есть&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p> '||CHR(13)||
      '  </td> '||CHR(13)||
      ' </tr> '||CHR(13)||
      ' <tr> '||CHR(13)||
      '  <td width=319 valign=top style=''width:238.95pt;padding:0cm 5.4pt 0cm 5.4pt''> '||CHR(13)||
      '  <p class=MsoNormal>О</p> '||CHR(13)||
      '  </td> '||CHR(13)||
      '  <td width=319 valign=top style=''width:239.6pt;padding:0cm 5.4pt 0cm 5.4pt''> '||CHR(13)||
      '  <p class=MsoNormal>&nbsp;</p> '||CHR(13)||
      '  </td> '||CHR(13)||
      ' </tr> '||CHR(13)||
      ' <tr> '||CHR(13)||
      '  <td width=319 valign=top style=''width:238.95pt;padding:0cm 5.4pt 0cm 5.4pt''> '||CHR(13)||
      '  <p class=MsoNormal>СТФН</p> '||CHR(13)||
      '  </td> '||CHR(13)||
      '  <td width=319 valign=top style=''width:239.6pt;padding:0cm 5.4pt 0cm 5.4pt''> '||CHR(13)||
      '  <p class=MsoNormal>Метеочуствительность</p> '||CHR(13)||
      '  </td> '||CHR(13)||
      ' </tr> '||CHR(13)||
      '</table> '||CHR(13)||
      '<p class=MsoNormal align=center style=''text-align:center''><b><span lang=EN-US '||CHR(13)||
      'style=''mso-ansi-language:EN-US''><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></b></p> '||CHR(13)||
      '<b>ИСТОРИЯ БОЛЕЗНИ № '||CHR(13)||
      ':FK_IBID '||CHR(13)||
      '</span><o:p></o:p></b> '||CHR(13)||
      '<table border=0 cellspacing=0 cellpadding=0 style=''border-collapse:collapse; '||CHR(13)||
      ' mso-padding-alt:0cm 5.4pt 0cm 5.4pt''> '||CHR(13)||
      ' <tr style=''mso-row-margin-left:230.4pt''> '||CHR(13)||
      '  <td style=''mso-cell-special:placeholder;border:none;padding:0cm 0cm 0cm 0cm'' '||CHR(13)||
      '  width=307><p class=''MsoNormal''>&nbsp;</td> '||CHR(13)||
      '  <td width=132 colspan=2 valign=top style=''width:99.0pt;padding:0cm 5.4pt 0cm 5.4pt''> '||CHR(13)||
      '  <p class=MsoNormal align=left style=''text-align:left''>&nbsp;&nbsp; :FC_GROUP</p> '||CHR(13)||
      '  </td> '||CHR(13)||
/*      '  <td width=139 valign=top style=''width:104.5pt;padding:0cm 5.4pt 0cm 5.4pt''> '||CHR(13)||
      '  <p class=MsoNormal align=center style=''text-align:center''>Не контингент</p> '||CHR(13)||
      '  </td> '||CHR(13)||*/
      '  <td width=29 valign=top style=''width:21.5pt;padding:0cm 5.4pt 0cm 5.4pt''> '||CHR(13)||
      '  <p class=MsoNormal align=center style=''text-align:center''>:FC_SEX</p> '||CHR(13)||
      '  </td> '||CHR(13)||
/*      '  <td width=31 valign=top style=''width:23.15pt;padding:0cm 5.4pt 0cm 5.4pt''> '||CHR(13)||
      '  <p class=MsoNormal align=center style=''text-align:center''>Ж</p> '||CHR(13)||*/
      '  </td> '||CHR(13)||
      ' </tr> '||CHR(13)||
      ' <tr> '||CHR(13)||
      '  <td width=319 colspan=2 valign=top style=''width:239.25pt;padding:0cm 5.4pt 0cm 5.4pt''> '||CHR(13)||
      '  <p class=MsoNormal>Фамилия: :FC_FAM'||CHR(13)||
      '  </span></p> '||CHR(13)||
      '  </td> '||CHR(13)||
      '  <td width=319 colspan=4 valign=top style=''width:239.3pt;padding:0cm 5.4pt 0cm 5.4pt''> '||CHR(13)||
      '  <p class=MsoNormal>Путевка № :FC_PUT '||CHR(13)||
      '  </span> с :FD_PD1'||CHR(13)||
      '   по :FD_PD2 '||CHR(13)||
      '  </p> '||CHR(13)||
      '  </td> '||CHR(13)||
      ' </tr> '||CHR(13)||
      ' <tr> '||CHR(13)||
      '  <td width=319 colspan=2 valign=top style=''width:239.25pt;padding:0cm 5.4pt 0cm 5.4pt''> '||CHR(13)||
      '  <p class=MsoNormal>И<span lang=EN-US style=''mso-ansi-language:EN-US''>.</span>О<span '||CHR(13)||
      '  lang=EN-US style=''mso-ansi-language:EN-US''>.: :FC_NAMEOTCH<o:p></o:p></span></p> '||CHR(13)||
      '  </td> '||CHR(13)||
      '  <td width=319 colspan=4 valign=top style=''width:239.3pt;padding:0cm 5.4pt 0cm 5.4pt''> '||CHR(13)||
      '  <p class=MsoNormal>Прибыл: :FD_F1 '||CHR(13)||
      '  </p> '||CHR(13)||
      '  </td> '||CHR(13)||
      ' </tr> '||CHR(13)||
      ' <tr> '||CHR(13)||
      '  <td width=319 colspan=2 valign=top style=''width:239.25pt;padding:0cm 5.4pt 0cm 5.4pt''> '||CHR(13)||
      '  <p class=MsoNormal><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></p> '||CHR(13)||
      '  </td> '||CHR(13)||
      '  <td width=319 colspan=4 valign=top style=''width:239.3pt;padding:0cm 5.4pt 0cm 5.4pt''> '||CHR(13)||
      '  <p class=MsoNormal>Выбыл:<o:p> :FD_F2 </o:p></span></p> '||CHR(13)||
      '  </td> '||CHR(13)||
      ' </tr> '||CHR(13)||
      ' <tr> '||CHR(13)||
      '  <td width=319 colspan=2 valign=top style=''width:239.25pt;padding:0cm 5.4pt 0cm 5.4pt''> '||CHR(13)||
      '  <p class=MsoNormal>Возраст: :FN_VOZR '||CHR(13)||
      '  </span> Дата рождения: :FD_ROJD '||CHR(13)||
      '  </td> '||CHR(13)||
      '  <td width=319 colspan=4 valign=top style=''width:239.3pt;padding:0cm 5.4pt 0cm 5.4pt''> '||CHR(13)||
      '  <p class=MsoNormal>Количество койкодней:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;.</p> '||CHR(13)||
      '  </td> '||CHR(13)||
      ' </tr> '||CHR(13)||
      ' <tr> '||CHR(13)||
      '  <td width=319 colspan=2 valign=top style=''width:239.25pt;padding:0cm 5.4pt 0cm 5.4pt''> '||CHR(13)||
      '  <p class=MsoNormal><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></p> '||CHR(13)||
      '  </td> '||CHR(13)||
      '  <td width=319 colspan=4 valign=top style=''width:239.3pt;padding:0cm 5.4pt 0cm 5.4pt''> '||CHR(13)||
      '  <p class=MsoNormal>Опоздание на :FN_OPOZD'||CHR(13)||
      '  </span> '||CHR(13)||
      '  дней</p> '||CHR(13)||
      '  </td> '||CHR(13)||
      ' </tr> '||CHR(13)||
      ' <tr> '||CHR(13)||
      '  <td width=319 colspan=2 valign=top style=''width:239.25pt;padding:0cm 5.4pt 0cm 5.4pt''> '||CHR(13)||
      '  <p class=MsoNormal>Место работы, должность:</p> '||CHR(13)||
      '  </td> '||CHR(13)||
      '  <td width=319 colspan=4 valign=top style=''width:239.3pt;padding:0cm 5.4pt 0cm 5.4pt''> '||CHR(13)||
      '  <p class=MsoNormal>Выбыл доср. на &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;дней</p> '||CHR(13)||
      '  </td> '||CHR(13)||
      ' </tr> '||CHR(13)||
      ' <tr> '||CHR(13)||
      '  <td width=319 colspan=2 valign=top style=''width:239.25pt;padding:0cm 5.4pt 0cm 5.4pt''> '||CHR(13)||
      '  <p class=MsoNormal><span lang=EN-US style=''mso-ansi-language:EN-US''>:FC_RABOTA<o:p></o:p></span></p> '||CHR(13)||
      '  </td> '||CHR(13)||
      '  <td width=319 colspan=4 valign=top style=''width:239.3pt;padding:0cm 5.4pt 0cm 5.4pt''> '||CHR(13)||
      '  <p class=MsoNormal>Переведен в</p> '||CHR(13)||
      '  </td> '||CHR(13)||
      ' </tr> '||CHR(13)||
      ' <tr> '||CHR(13)||
      '  <td width=319 colspan=2 valign=top style=''width:239.25pt;padding:0cm 5.4pt 0cm 5.4pt''> '||CHR(13)||
      '  <p class=MsoNormal>Домашний адрес:</p> '||CHR(13)||
      '  </td> '||CHR(13)||
      '  <td width=319 colspan=4 valign=top style=''width:239.3pt;padding:0cm 5.4pt 0cm 5.4pt''> '||CHR(13)||
      '  <p class=MsoNormal>Продление на&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;дней</p> '||CHR(13)||
      '  </td> '||CHR(13)||
      ' </tr> '||CHR(13)||
      ' <tr> '||CHR(13)||
      '  <td width=319 colspan=2 valign=top style=''width:239.25pt;padding:0cm 5.4pt 0cm 5.4pt''> '||CHR(13)||
      '  <p class=MsoNormal><span lang=EN-US style=''mso-ansi-language:EN-US''>:FC_ADR<o:p></o:p></span></p> '||CHR(13)||
      '  </td> '||CHR(13)||
      '  <td width=319 colspan=4 valign=top style=''width:239.3pt;padding:0cm 5.4pt 0cm 5.4pt''> '||CHR(13)||
      '  <p class=MsoNormal>Выдан б/л №&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;серия&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p> '||CHR(13)||
      '  </td> '||CHR(13)||
      ' </tr> '||CHR(13)||
      ' <tr> '||CHR(13)||
      '  <td width=319 colspan=2 valign=top style=''width:239.25pt;padding:0cm 5.4pt 0cm 5.4pt''> '||CHR(13)||
      '  <p class=MsoNormal><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></p> '||CHR(13)||
      '  </td> '||CHR(13)||
      '  <td width=319 colspan=4 valign=top style=''width:239.3pt;padding:0cm 5.4pt 0cm 5.4pt''> '||CHR(13)||
      '  <p class=MsoNormal>С&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;по&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(к/дн)&nbsp;&nbsp;&nbsp;</p> '||CHR(13)||
      '  </td> '||CHR(13)||
      ' </tr> '||CHR(13)||
      ' <![if !supportMisalignedColumns]> '||CHR(13)||
      ' <tr height=0> '||CHR(13)||
      '  <td width=339 style=''border:none''></td> '||CHR(13)||
      '  <td width=13 style=''border:none''></td> '||CHR(13)||
      '  <td width=133 style=''border:none''></td> '||CHR(13)||
      '  <td width=154 style=''border:none''></td> '||CHR(13)||
      '  <td width=32 style=''border:none''></td> '||CHR(13)||
      '  <td width=34 style=''border:none''></td> '||CHR(13)||
      ' </tr> '||CHR(13)||
      ' <![endif]> '||CHR(13)||
      '</table> '||CHR(13)||
      '<p class=MsoNormal><b><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></b></p> '||CHR(13)||
      '</div> '||CHR(13)||
      '</body> '||CHR(13)||
      '</html> ';
      select PKG_REGIST_PACFUNC.GET_PAC_WORKPLACE/*GET_PACFULLWORKPLACE*/(pFK_PACID) into cRabota from dual;
      /*if length(cRabota) < 3 then
        select FC_RABOTA into cRabota
        from TPEOPLES
        where fk_id = (select fk_peplid from tkarta where fk_id = pFK_PACID);
      end if;*/
      str:=REPLACE(str,':FC_RABOTA',cRabota);

      select PKG_REGIST_PACFUNC.GET_PAC_ADRSHORT/*GET_PACFULLADRESS*/(pFK_PACID) into cAdress from Dual;
      str:=REPLACE(str,':FC_ADR',cAdress);

      INSERT INTO TCLOBS (FC_CLOB) VALUES (EMPTY_CLOB () ) RETURNING FK_ID,FC_CLOB INTO nC,cC;
      DBMS_LOB.OPEN (cC, DBMS_LOB.LOB_READWRITE);
--      DBMS_LOB.WRITEAPPEND (cC, LENGTH (HTML_HEAD), HTML_HEAD);

    for n in cMain LOOP
--      NULL;
      str:=REPLACE(str,':FK_IBID',n.FK_IBID);
      str:=REPLACE(str,':FC_FAM',n.FC_FAM);
      str:=REPLACE(str,':FC_NAMEOTCH',n.FC_IM||' '||n.FC_OTCH);
      str:=REPLACE(str,':FD_ROJD',n.FD_ROJD);
      str:=REPLACE(str,':FC_PUT',n.FC_PUT);
      str:=REPLACE(str,':FD_PD1',n.FC_PLANIN);
      str:=REPLACE(str,':FD_PD2',n.FC_PLANOUT);
      str:=REPLACE(str,':FD_F1',n.FC_IN);
      str:=REPLACE(str,':FD_F2',NVL( TO_CHAR(GET_PACOUTCOME(pFK_PACID),'dd.mm.yyyy') , '&nbsp;' ));
      BEGIN
        SELECT FK_KORPID INTO nTemp FROM TROOM WHERE FK_ID=GET_PACPALATAID(pFK_PACID);
      EXCEPTION
        WHEN OTHERS THEN nTemp:=200;
      END;
      IF nTemp=200 THEN
        str:=REPLACE(str,':FC_STOL','"Приморский"');
      ELSE
        str:=REPLACE(str,':FC_STOL','"Люкс"');
      END IF;
      BEGIN
        SELECT FC_NAME INTO strT FROM TKORP WHERE FK_ID=nTemp;
        str:=REPLACE(str,':FC_KORPUS','"'||strT||'"');
      EXCEPTION
        WHEN OTHERS THEN str:=REPLACE(str,':FC_KORPUS','&nbsp;');
      END;
      str:=REPLACE(str,':FC_PALATA',GET_PACFCPALATA(pFK_PACID));
      str:=REPLACE(str,':FN_VOZR',n.FN_AGE);
      str:=REPLACE(str,':FN_OPOZD',n.FN_OPOZD);
      IF n.FK_GROUPID<>113 THEN
        str:=REPLACE(str,':FC_GROUP','Контингент');
      ELSE
        str:=REPLACE(str,':FC_GROUP','Не контингент');
      END IF;
    END LOOP;

    select PKG_REGIST_PACFUNC.GET_PAC_SEXLITER(pFK_PACID) into cRabota from dual;
    str:=REPLACE(str,':FC_SEX',cRabota);

    BEGIN
      SELECT FL_ALERG INTO nTemp FROM TEPID WHERE FK_PACID=pFK_PACID;
    EXCEPTION
      WHEN OTHERS THEN nTemp:=0;
    END;
    IF nTemp=1 THEN
      str:=REPLACE(str,':FC_ALERG','есть');
    ELSE
      str:=REPLACE(str,':FC_ALERG','нет');
    END IF;

    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
--    str:='</div></body></html>';
--    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
    DBMS_LOB.CLOSE (cC);
    RETURN nC;
  END;

  FUNCTION GET_TALON (pFK_PACID IN NUMBER,pFK_VRACHID IN NUMBER)
  RETURN NUMBER
   IS-- Обратный талон к путевке
    CURSOR с IS
       select FC_FAM,FC_IM,FC_OTCH,FP_SEX,FK_IBID,FC_PUT
         from TKARTA
        where fk_id = pFK_PACID;
    cl CLOB;
    rc NUMBER;
    str VARCHAR2(32767);
  BEGIN
    INSERT INTO TCLOBS(FC_CLOB)
         VALUES (EMPTY_CLOB())
      RETURNING FK_ID,FC_CLOB INTO rC,cl;
    DBMS_LOB.OPEN(cl,DBMS_LOB.LOB_READWRITE);

    str := PKG_HTML.GET_HEAD('word','Обратный талон к путевке',
                             null,null,null,
                             null,null,null,
                             null,null,null,
                             null,null,null,
                             '20','10','20','20',
                             null,null,null,'left',
                             null,null,null,null,
                             null,null,null);
    DBMS_LOB.WRITEAPPEND(cl,LENGTH(str),str);

    str:='<BODY><DIV class=user><P ALIGN="CENTER"><b>ОБРАТНЫЙ ТАЛОН К ПУТЕВКЕ<BR></P><BR>';
    DBMS_LOB.WRITEAPPEND(cl,LENGTH(str),str);
    FOR p in с LOOP
      if p.FP_SEX = 1 then
        str:='<P>Ф.И.О: '|| p.FC_FAM ||' '|| p.FC_IM ||' '|| p.FC_OTCH ||'</P><BR>'||
             '<P>Отдыхал в санатории "'|| PKG_SMINI.READSTRING ('CONFIG', 'S_NAME', 'Не известен') ||'" по путевке № '|| p.FC_PUT ||' с '|| TO_CHAR(GET_PACPLANINCOME(pFK_PACID),'DD.MM.YYYY') ||' по '|| TO_CHAR(GET_PACPLANOUTCOME(pFK_PACID),'DD.MM.YYYY') ||'</P><BR>'||
             '<P>Фактически: с '|| TO_CHAR(GET_PACINCOME(pFK_PACID),'DD.MM.YYYY') ||' по '|| NVL( TO_CHAR(GET_PACOUTCOME(pFK_PACID),'DD.MM.YYYY') , TO_CHAR(GET_PACPLANOUTCOME(pFK_PACID),'DD.MM.YYYY') ) ||'</P><BR>'||
             '<P>Регистрационный № '|| p.FK_IBID ||'</P><BR><BR>'||
             '<P ALIGN="CENTER">М.П. &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Медрегистратор:_____________________'|| DO_VRACHFIO(pFK_VRACHID) ||'</P>';
      elsif p.FP_SEX = 0 then
        str:='<P>Ф.И.О: '|| p.FC_FAM ||' '|| p.FC_IM ||' '|| p.FC_OTCH ||'</P><BR>'||
             '<P>Отдыхала в санатории "'|| PKG_SMINI.READSTRING ('CONFIG', 'S_NAME', 'Не известен') ||'" по путевке № '|| p.FC_PUT ||' с '|| TO_CHAR(GET_PACPLANINCOME(pFK_PACID),'DD.MM.YYYY') ||' по '|| TO_CHAR(GET_PACPLANOUTCOME(pFK_PACID),'DD.MM.YYYY') ||'</P><BR>'||
             '<P>Фактически: с '|| TO_CHAR(GET_PACINCOME(pFK_PACID),'DD.MM.YYYY') ||' по '|| NVL( TO_CHAR(GET_PACOUTCOME(pFK_PACID),'DD.MM.YYYY') , TO_CHAR(GET_PACPLANOUTCOME(pFK_PACID),'DD.MM.YYYY') ) ||'</P><BR>'||
             '<P>Регистрационный № '|| p.FK_IBID ||'</P><BR><BR>'||
             '<P ALIGN="CENTER">М.П. &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Медрегистратор:_____________________'|| DO_VRACHFIO(pFK_VRACHID) ||'</P>';
      else
        str:='<P>Ф.И.О: '|| p.FC_FAM ||' '|| p.FC_IM ||' '|| p.FC_OTCH ||'</P><BR>'||
             '<P>Отдыхал(а) в санатории "'|| PKG_SMINI.READSTRING ('CONFIG', 'S_NAME', 'Не известен') ||'" по путевке № '|| p.FC_PUT ||' с '|| TO_CHAR(GET_PACPLANINCOME(pFK_PACID),'DD.MM.YYYY') ||' по '|| TO_CHAR(GET_PACPLANOUTCOME(pFK_PACID),'DD.MM.YYYY') ||'</P><BR>'||
             '<P>Фактически: с '|| TO_CHAR(GET_PACINCOME(pFK_PACID),'DD.MM.YYYY') ||' по '|| NVL( TO_CHAR(GET_PACOUTCOME(pFK_PACID),'DD.MM.YYYY') , TO_CHAR(GET_PACPLANOUTCOME(pFK_PACID),'DD.MM.YYYY') ) ||'</P><BR>'||
             '<P>Регистрационный № '|| p.FK_IBID ||'</P><BR><BR>'||
             '<P ALIGN="CENTER">М.П. &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Медрегистратор:_____________________'|| DO_VRACHFIO(pFK_VRACHID) ||'</P>';
      end if;
    END LOOP;
    DBMS_LOB.WRITEAPPEND(cl,LENGTH(str),str);
    DBMS_LOB.CLOSE(cl);
    RETURN rc;
  END;
  FUNCTION GET_TOB_ADULT(pFK_PACID IN NUMBER,pFK_VRACHID IN NUMBER)
  RETURN NUMBER
   IS
    cC CLOB;
    nC NUMBER;
    str VARCHAR2 (32767);
    cTemp VARCHAR2 (32767);
    nTemp NUMBER;
    dTemp DATE;
  BEGIN
    INSERT INTO TCLOBS(FC_CLOB)
         VALUES (EMPTY_CLOB())
      RETURNING FK_ID,FC_CLOB INTO nC,cC;
    DBMS_LOB.OPEN(cC,DBMS_LOB.LOB_READWRITE);

    str := PKG_HTML.GET_HEAD('word','История болезни',
                             null,'10.0',null,
                             null,null,null,
                             null,null,null,
                             null,null,null,
                             '10','10','20','10',
                             null,null,null,'left',
                             'top','none','none','0',
                             '0','0','0');
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);

    str:='<BODY><DIV class=user>'||
         '<TABLE>'||
         '<TR>'||
         '<TD class=user width=30%><P class=user>С правилами внутреннего<BR>распорядка ознакомлен:<BR>______________________________<BR><BR>Деж.м/с: '|| DO_VRACHFIO(pFK_VRACHID) ||'</P></TD>'||
         '<TD class=user width=5%><P class=user>&nbsp;</P></TD>'||
         '<TD class=user width=30%>'||
         ' <TABLE>';
    FOR p in cPriviv(pFK_PACID) LOOP
      str := str ||
         ' <TR><TD class=user><P class=user>'|| p.FC_NAME ||'</P></TD><TD class=user style=''border:none;mso-border-alt:none''><P class=user>'|| p.FL_BOOL ||'</P></TD></TR>';
    END LOOP;
    str := str ||
         ' </TABLE>'||
         '</TD>'||
         '<TD class=user width=5%><P class=user>&nbsp;</P></TD>'||
         '<TD class=user width=30%>'||
         ' <TABLE>';
    FOR p in cDisease(pFK_PACID) LOOP
      str := str ||
         ' <TR><TD class=user style=''border:none;mso-border-alt:none''><P class=user>'|| p.FC_NAME ||'</P></TD><TD class=user style=''border:none;mso-border-alt:none''><P class=user>'|| p.FL_BOOL ||'</P></TD></TR>';
    END LOOP;
    str := str ||
         ' </TABLE>'||
         '</TD>'||
         '</TR>'||
         '</TABLE><BR>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);

    str := '<P style=''font-size:16.0pt;font-family:Arial'' align=center><B>ПЯТИГОРСКИЙ ЦЕНТРАЛЬНЫЙ ДЕТСКИЙ САНАТОРИЙ МО РФ</B></P>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    str := '<P style=''font-size:16.0pt;font-family:Arial'' align=center><B>ИСТОРИЯ БОЛЕЗНИ № '|| GET_IB(pFK_PACID) ||'</B></P><BR>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);

    cTemp := PKG_R_ALLFUNC.RETURN_VALUE(RETURN_VRACH(pFK_PACID));
    if (cTemp = '&nbsp;') OR (cTemp = 'Неизвестен  ') then
--      str := '<P>Лечащий врач: ___________________________________________________________________________</P>';
      str := '<P>Лечащий врач:</P>';
    else
      str := '<P>Лечащий врач: <I>'|| UPPER(cTemp) ||'</I></P>';
    end if;
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);

    str := '<TABLE><TR>'||
           '<TD rowspan=2 class=user>Размещение:</TD>'||
           '<TD>Корпус</TD>'||
           '<TD>Отделение</TD>'||
           '<TD>Комната</TD>'||
           '</TR><TR>'||
           '<TD>'|| RETURN_KORPUS(pFK_PACID) ||'</TD>'||
           '<TD>'|| RETURN_FLOOR(pFK_PACID) ||'</TD>'||
           '<TD>'|| RETURN_PALATA(pFK_PACID) ||'</TD>'||
           '</TR></TABLE>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);

    str := '<TABLE><TR>'||
           '<TD style=''vertical-align:top'' width=16%>'||
           'Дата поступления<BR>';

    dTemp := GET_PACINCOME(pFK_PACID);
    str := str ||
           TO_CHAR(dTemp,'dd.mm.yyyy')||'<BR>время<BR>'||TO_CHAR(dTemp,'hh24:mi')||'<BR>'||
           '</TD>'||
           '<TD style=''vertical-align:top'' width=16%>'||
           'Срок лечения<BR>'||
           'по путевке<BR>';
    cTemp := PKG_R_ALLFUNC.RETURN_VALUE(GET_PAC_PUT(pFK_PACID));
    if cTemp = '&nbsp;' then
      str := str || '№ _________';
    else
      str := str || '№ ' || cTemp;
    end if;
    str := str ||
           '<BR> c '|| TO_CHAR(GET_PACPLANINCOME(pFK_PACID),'dd.mm.yyyy') ||
           '<BR> по '|| TO_CHAR(GET_PACPLANOUTCOME(pFK_PACID),'dd.mm.yyyy') ||
           '</TD>'||
           '<TD style=''vertical-align:top'' width=16%>'||
           'Опоздал на<BR>'|| (TRUNC(GET_PACINCOME(pFK_PACID)) - TRUNC(GET_PACPLANINCOME(pFK_PACID))) ||' дней<BR>'||
           'причина:<BR>';
    cTemp := PKG_R_ALLFUNC.RETURN_VALUE(RETURN_OPOZDTYPE(pFK_PACID));
    if cTemp = '&nbsp;' then
      str := str || '___________<BR>___________';
    else
      str := str || cTemp;
    end if;
    str := str ||
           '</TD>'||
           '<TD style=''vertical-align:top'' width=20%>'||
           'Выбыл досрочно<BR>на __ дней<BR>причина:<BR>___________<BR>___________'||
           '</TD>'||
           '<TD style=''vertical-align:top'' width=16%>'||
           'Дата убытия<BR>___________<BR>время:<BR>___________'||
           '</TD>'||
           '<TD style=''vertical-align:top'' width=16%>'||
           'Всего пробыл<BR>__ дней'||
           '</TD>'||
           '</TR></TABLE><BR>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);

    cTemp := PKG_REGIST_PACFUNC.GET_PAC_FULLFIO(pFK_PACID);
    str := '<P style=''line-height:150%''>1. Ф.И.О.: <I>'|| UPPER(cTemp) ||'</I></P>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);

    SELECT PKG_R_ALLFUNC.RETURN_VALUE(GET_PACCOMPANY_DOLGNOST(FK_DOLGNOST)) into cTemp
      FROM TPEOPLES
     WHERE FK_ID = (SELECT FK_PEPLID FROM TKARTA WHERE FK_ID = pFK_PACID);
    if cTemp = '&nbsp;' then
      str := '<P style=''line-height:150%''>2. Воинское звание: ________________________________________________________________________</P>';
    else
      str := '<P style=''line-height:150%''>2. Воинское звание: <I>'|| UPPER(cTemp) ||'</I></P>';
    end if;
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);

    str := '<P style=''line-height:150%''>3. Род войск (сухопутные,ВВС,ВМФ,МБ,пр.): __________________________________________________</P>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);

    str := '<P style=''line-height:150%''>4. Член семьи, пенсионер МО, служащий МО РФ, прочий:&nbsp;_______________________________________</P>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);

    SELECT PKG_R_ALLFUNC.RETURN_VALUE(TO_CHAR(FD_ROJD,'yyyy')) into cTemp
      FROM TPEOPLES
     WHERE FK_ID = (SELECT FK_PEPLID FROM TKARTA WHERE FK_ID = pFK_PACID);
    if cTemp = '&nbsp;' then
      str := '<P style=''line-height:150%''>5. Год рождения:&nbsp;&nbsp;__________________________________________________________________________</P>';
    else
      str := '<P style=''line-height:150%''>5. Год рождения: <I>'|| cTemp ||'</I></P>';
    end if;
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);

    cTemp := PKG_R_ALLFUNC.RETURN_VALUE(PKG_REGIST_PACFUNC.GET_PAC_ADRSHORT(pFK_PACID));
    if cTemp = '&nbsp;' then
      cTemp := '<P style=''line-height:150%''>6. Домашний адрес: ____________________________________________________________________________________</P>';
      nTemp := length(cTemp)-7-28;
    else
      cTemp := '<P style=''line-height:150%''>6. Домашний адрес: <I>'|| cTemp ||'</I></P>';
      nTemp := length(cTemp)-14-28;
    end if;
    if nTemp > 80 then
      str := cTemp;
    else
      str := cTemp ||
             '<P style=''line-height:150%''>&nbsp;_________________________________________________________________________________________</P>';
    end if;
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);

    SELECT PKG_R_ALLFUNC.RETURN_VALUE( PKG_REGIST_PACFUNC.REPLACE_SPACES(GET_PACSUBVID(FK_KOD2,FK_KOD)) ) into cTemp
      FROM TKARTA
     WHERE FK_ID = pFK_PACID;
    if cTemp = '&nbsp;' then
      str := '<P style=''line-height:150%''>7. Наименование СОК: _____________________________________________________________________</P>';
    else
      str := '<P style=''line-height:150%''>7. Наименование СОК: <I>'|| UPPER(cTemp) ||'</I></P>';
    end if;
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);

    cTemp := PKG_R_ALLFUNC.RETURN_VALUE( DO_DIAGBYTYPE(pFK_PACID, 1, 1, -1, 1) );
    if cTemp = '&nbsp;' then
      cTemp := '<P style=''line-height:150%''>8. Диагноз СОК: ___________________________________________________________________________</P>';
      nTemp := length(cTemp)-7-28;
    else
      cTemp := '<P style=''line-height:150%''>8. Диагноз СОК: <I>'|| cTemp ||'</I></P>';
      nTemp := length(cTemp)-14-28;
    end if;
    if nTemp > 102 then
      str := cTemp ||
             '<P style=''line-height:150%''>&nbsp;_________________________________________________________________________________________</P>';
    else
      str := cTemp ||
             '<P style=''line-height:150%''>&nbsp;_________________________________________________________________________________________</P>'||
             '<P style=''line-height:150%''>&nbsp;_________________________________________________________________________________________</P>';
    end if;
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);

--    str := '<P>7. Правильность отбора (подчеркнуть) показан, не показан, противопоказан ________________________</P>';
    str := '<P style=''line-height:150%''>9. Правильность отбора (подчеркнуть) показан, не показан, противопоказан</P>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);

    str := '<P style=''line-height:150%''>10. Диагноз санатория: а) основной ___________________________________________________________</P>'||
             '<P style=''line-height:150%''>&nbsp;_________________________________________________________________________________________</P>'||
             '<P style=''line-height:150%''>&nbsp;_________________________________________________________________________________________</P>'||
             '<P style=''line-height:150%''>&nbsp;_________________________________________________________________________________________</P>'||
             '<P style=''line-height:150%''>&nbsp;_________________________________________________________________________________________</P>'||
             '<P style=''line-height:150%''>&nbsp;_________________________________________________________________________________________</P>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);

    str := '<P style=''line-height:150%''>б) сопутствующие заболевания ______________________________________________________________</P>'||
             '<P style=''line-height:150%''>&nbsp;_________________________________________________________________________________________</P>'||
             '<P style=''line-height:150%''>&nbsp;_________________________________________________________________________________________</P>'||
             '<P style=''line-height:150%''>&nbsp;_________________________________________________________________________________________</P>'||
             '<P style=''line-height:150%''>&nbsp;_________________________________________________________________________________________</P>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);

    str:='</DIV></BODY></HTML>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
    DBMS_LOB.CLOSE (cC);
    RETURN nC;
  END;
  FUNCTION GET_TOB_CHILD(pFK_PACID IN NUMBER,pFK_VRACHID IN NUMBER)
  RETURN NUMBER
   IS
    CURSOR cConvoy(pFK_ID IN NUMBER) is
      SELECT PKG_REGIST_PACFUNC.GET_PAC_FULLFIO(FK_CONVOYID) FC_FIO,
             PKG_REGIST_PACFUNC.GET_PAC_WORKPLACE(FK_CONVOYID) FC_WORKPLACE,
             FC_PHONE
        FROM TPACCONVOY,TPEOPLES
       WHERE TPACCONVOY.FK_ID = pFK_ID
         AND TPEOPLES.FK_ID = PKG_REGIST_PEPLFUNC.GET_PEPL_ID(FK_CONVOYID);
    cC CLOB;
    nC NUMBER;
    str VARCHAR2 (32767);
    cTemp VARCHAR2 (32767);
    nTemp NUMBER;
    dTemp DATE;
  BEGIN
    INSERT INTO TCLOBS(FC_CLOB)
         VALUES (EMPTY_CLOB())
      RETURNING FK_ID,FC_CLOB INTO nC,cC;
    DBMS_LOB.OPEN(cC,DBMS_LOB.LOB_READWRITE);

    str := PKG_HTML.GET_HEAD('word','История болезни',
                             null,'10.0',null,
                             null,null,null,
                             null,null,null,
                             null,null,null,
                             '10','10','20','10',
                             null,null,null,'left',
                             'top','none','none','0',
                             '0','0','0');
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);

    str:='<BODY><DIV class=user>'||
         '<TABLE>'||
         '<TR>'||
         '<TD class=user width=30%><P class=user>С правилами внутреннего<BR>распорядка ознакомлен:<BR>______________________________<BR><BR>Деж.м/с: '|| DO_VRACHFIO(pFK_VRACHID) ||'</P></TD>'||
         '<TD class=user width=5%><P class=user>&nbsp;</P></TD>'||
         '<TD class=user width=30%>'||
         ' <TABLE>';
    FOR p in cPriviv(pFK_PACID) LOOP
      str := str ||
         ' <TR><TD class=user><P class=user>'|| p.FC_NAME ||'</P></TD><TD class=user style=''border:none;mso-border-alt:none''><P class=user>'|| p.FL_BOOL ||'</P></TD></TR>';
    END LOOP;
    str := str ||
         ' </TABLE>'||
         '</TD>'||
         '<TD class=user width=5%><P class=user>&nbsp;</P></TD>'||
         '<TD class=user width=30%>'||
         ' <TABLE>';
    FOR p in cDisease(pFK_PACID) LOOP
      str := str ||
         ' <TR><TD class=user style=''border:none;mso-border-alt:none''><P class=user>'|| p.FC_NAME ||'</P></TD><TD class=user style=''border:none;mso-border-alt:none''><P class=user>'|| p.FL_BOOL ||'</P></TD></TR>';
    END LOOP;
    str := str ||
         ' </TABLE>'||
         '</TD>'||
         '</TR>'||
         '</TABLE><BR>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);

    str := '<P style=''font-size:16.0pt;font-family:Arial'' align=center><B>ПЯТИГОРСКИЙ ЦЕНТРАЛЬНЫЙ ДЕТСКИЙ САНАТОРИЙ МО РФ</B></P>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    str := '<P style=''font-size:16.0pt;font-family:Arial'' align=center><B>ИСТОРИЯ БОЛЕЗНИ РЕБЕНКА № '|| GET_IB(pFK_PACID) ||'</B></P><BR>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);

    cTemp := PKG_R_ALLFUNC.RETURN_VALUE(RETURN_VRACH(pFK_PACID));
    if (cTemp = '&nbsp;') OR (cTemp = 'Неизвестен  ') then
--      str := '<P>Лечащий врач: ___________________________________________________________________________</P>';
      str := '<P>Лечащий врач:</P>';
    else
      str := '<P>Лечащий врач: <I>'|| UPPER(cTemp) ||'</I></P>';
    end if;
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);

    str := '<TABLE><TR>'||
           '<TD rowspan=2 class=user>Размещение:</TD>'||
           '<TD>Корпус</TD>'||
           '<TD>Отделение</TD>'||
           '<TD>Комната</TD>'||
           '</TR><TR>'||
           '<TD>'|| RETURN_KORPUS(pFK_PACID) ||'</TD>'||
           '<TD>'|| RETURN_FLOOR(pFK_PACID) ||'</TD>'||
           '<TD>'|| RETURN_PALATA(pFK_PACID) ||'</TD>'||
           '</TR></TABLE>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);

    str := '<TABLE><TR>'||
           '<TD style=''vertical-align:top'' width=16%>'||
           'Дата поступления<BR>';

    dTemp := GET_PACINCOME(pFK_PACID);
    str := str ||
           TO_CHAR(dTemp,'dd.mm.yyyy')||'<BR>время<BR>'||TO_CHAR(dTemp,'hh24:mi')||'<BR>'||
           '</TD>'||
           '<TD style=''vertical-align:top'' width=16%>'||
           'Срок лечения<BR>'||
           'по путевке<BR>';
    cTemp := PKG_R_ALLFUNC.RETURN_VALUE(GET_PAC_PUT(pFK_PACID));
    if cTemp = '&nbsp;' then
      str := str || '№ _________';
    else
      str := str || '№ ' || cTemp;
    end if;
    str := str ||
           '<BR> c '|| TO_CHAR(GET_PACPLANINCOME(pFK_PACID),'dd.mm.yyyy') ||
           '<BR> по '|| TO_CHAR(GET_PACPLANOUTCOME(pFK_PACID),'dd.mm.yyyy') ||
           '</TD>'||
           '<TD style=''vertical-align:top'' width=16%>'||
           'Опоздал на<BR>'|| (TRUNC(GET_PACINCOME(pFK_PACID)) - TRUNC(GET_PACPLANINCOME(pFK_PACID))) ||' дней<BR>'||
           'причина:<BR>';
    cTemp := PKG_R_ALLFUNC.RETURN_VALUE(RETURN_OPOZDTYPE(pFK_PACID));
    if cTemp = '&nbsp;' then
      str := str || '___________<BR>___________';
    else
      str := str || cTemp;
    end if;
    str := str ||
           '</TD>'||
           '<TD style=''vertical-align:top'' width=20%>'||
           'Выбыл досрочно<BR>на __ дней<BR>причина:<BR>___________<BR>___________'||
           '</TD>'||
           '<TD style=''vertical-align:top'' width=16%>'||
           'Дата убытия<BR>___________<BR>время:<BR>___________'||
           '</TD>'||
           '<TD style=''vertical-align:top'' width=16%>'||
           'Всего пробыл<BR>__ дней'||
           '</TD>'||
           '</TR></TABLE><BR>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);

    cTemp := PKG_REGIST_PACFUNC.GET_PAC_FULLFIO(pFK_PACID);
    str := '<P style=''line-height:150%''>1. Ф.И.О.: <I>'|| UPPER(cTemp) ||'</I>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; пол: <I>'|| PKG_REGIST_PACFUNC.GET_PAC_SEXLITER(pFK_PACID) ||'</I></P>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);

    cTemp := PKG_REGIST_PACFUNC.GET_PAC_AGE_MONTH(pFK_PACID);
    SELECT FD_ROJD into dTemp
      FROM TPEOPLES
     WHERE FK_ID = (SELECT FK_PEPLID FROM TKARTA WHERE FK_ID = pFK_PACID);
    if cTemp = '&nbsp;' then
      str := '<P style=''line-height:150%''>2. Возраст (число лет и месяцев): _________________________________ Дата рождения: _____________</P>';
    else
      str := '<P style=''line-height:150%''>2. Возраст (число лет и месяцев): <I>'|| UPPER(cTemp) ||'</I>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Дата рождения: <I>'|| PKG_R_ALLFUNC.RETURN_VALUE(TO_CHAR(dTemp,'dd.mm.yyyy')) ||'</I></P>';
    end if;
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);

    cTemp := PKG_R_ALLFUNC.RETURN_VALUE(PKG_REGIST_PACFUNC.GET_PAC_WORKPLACE(pFK_PACID));
    if cTemp = '&nbsp;' then
      str := '<P style=''line-height:150%''>3. Место учебы: _______________________________________________________________________________________</P>';
    else
      str := '<P style=''line-height:150%''>3. Место учебы: <I>'|| UPPER(cTemp) ||'</I></P>';
    end if;
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);

    SELECT FC_PHONE into cTemp
      FROM TPEOPLES
     WHERE FK_ID = (SELECT FK_PEPLID FROM TKARTA WHERE FK_ID = pFK_PACID);
    if cTemp is not null then
      cTemp := ' ТЕЛ.№ '|| cTemp;
    end if;
    cTemp := PKG_R_ALLFUNC.RETURN_VALUE( PKG_REGIST_PACFUNC.GET_PAC_ADRSHORT(pFK_PACID) || cTemp );
    if cTemp = '&nbsp;' then
      cTemp := '<P style=''line-height:150%''>4. Домашний адрес: ____________________________________________________________________________________</P>';
      nTemp := length(cTemp)-7-28;
    else
      cTemp := '<P style=''line-height:150%''>4. Домашний адрес: <I>'|| cTemp ||'</I></P>';
      nTemp := length(cTemp)-14-28;
    end if;
    if nTemp > 80 then
      str := cTemp;
    else
      str := cTemp ||
             '<P style=''line-height:150%''>&nbsp;_________________________________________________________________________________________</P>';
    end if;
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);

    SELECT MIN(FK_ID) INTO nTemp FROM TPACCONVOY WHERE FK_PACID = pFK_PACID;
    if NVL(nTemp,0) > 0 then
      FOR p in cConvoy(nTemp) LOOP
        str := '<P style=''line-height:150%''>5. Ф.И.О. отца (матери) '|| p.FC_FIO;
        if PKG_R_ALLFUNC.RETURN_VALUE(p.FC_PHONE) <> '&nbsp;' then
          str := str || '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Тел: '|| p.FC_PHONE ||'</P>';
        else
          str := str || '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Тел:</P>';
        end if;
        if PKG_R_ALLFUNC.RETURN_VALUE(p.FC_WORKPLACE) <> '&nbsp;' then
          str := str || '<P style=''line-height:150%''>6. Место службы отца (матери) '|| p.FC_WORKPLACE ||'</P>';
        else
          str := str || '<P style=''line-height:150%''>6. Место службы отца (матери) ______________________________________________________________</P>';
        end if;
        EXIT;
      END LOOP;
    else
      str := '<P style=''line-height:150%''>5. Ф.И.О. отца (матери) _______________________________________________ раб. Тел: _____________</P>'||
             '<P style=''line-height:150%''>6. Место службы отца (матери) ______________________________________________________________</P>';
    end if;
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);

    SELECT PKG_R_ALLFUNC.RETURN_VALUE( PKG_REGIST_PACFUNC.REPLACE_SPACES(GET_PACSUBVID(FK_KOD2,FK_KOD)) ) into cTemp
      FROM TKARTA
     WHERE FK_ID = pFK_PACID;
    if cTemp = '&nbsp;' then
      str := '<P style=''line-height:150%''>7. Наименование СОК: _____________________________________________________________________</P>';
    else
      str := '<P style=''line-height:150%''>7. Наименование СОК: <I>'|| UPPER(cTemp) ||'</I></P>';
    end if;
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);

    cTemp := PKG_R_ALLFUNC.RETURN_VALUE( DO_DIAGBYTYPE(pFK_PACID, 1, 1, -1, 1) );
    if cTemp = '&nbsp;' then
      cTemp := '<P style=''line-height:150%''>8. Диагноз СОК: ___________________________________________________________________________</P>';
      nTemp := length(cTemp)-7-28;
    else
      cTemp := '<P style=''line-height:150%''>8. Диагноз СОК: <I>'|| cTemp ||'</I></P>';
      nTemp := length(cTemp)-14-28;
    end if;
    if nTemp > 102 then
      str := cTemp ||
             '<P style=''line-height:150%''>&nbsp;_________________________________________________________________________________________</P>';
    else
      str := cTemp ||
             '<P style=''line-height:150%''>&nbsp;_________________________________________________________________________________________</P>'||
             '<P style=''line-height:150%''>&nbsp;_________________________________________________________________________________________</P>';
    end if;
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);

--    str := '<P>7. Правильность отбора (подчеркнуть) показан, не показан, противопоказан ________________________</P>';
    str := '<P style=''line-height:150%''>9. Правильность отбора (подчеркнуть) показан, не показан, противопоказан</P>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);

    str := '<P style=''line-height:150%''>10. Диагноз санатория: а) основной ___________________________________________________________</P>'||
             '<P style=''line-height:150%''>&nbsp;_________________________________________________________________________________________</P>'||
             '<P style=''line-height:150%''>&nbsp;_________________________________________________________________________________________</P>'||
             '<P style=''line-height:150%''>&nbsp;_________________________________________________________________________________________</P>'||
             '<P style=''line-height:150%''>&nbsp;_________________________________________________________________________________________</P>'||
             '<P style=''line-height:150%''>&nbsp;_________________________________________________________________________________________</P>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);

    str := '<P style=''line-height:150%''>б) сопутствующие заболевания ______________________________________________________________</P>'||
             '<P style=''line-height:150%''>&nbsp;_________________________________________________________________________________________</P>'||
             '<P style=''line-height:150%''>&nbsp;_________________________________________________________________________________________</P>'||
             '<P style=''line-height:150%''>&nbsp;_________________________________________________________________________________________</P>'||
             '<P style=''line-height:150%''>&nbsp;_________________________________________________________________________________________</P>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);

    str:='</DIV></BODY></HTML>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
    DBMS_LOB.CLOSE (cC);
    RETURN nC;
  END;

end PKG_REGIST_BLANKS;
/

SHOW ERRORS;


