DROP PACKAGE BODY ASU.PKG_SANKARTA
/

--
-- PKG_SANKARTA  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_SANKARTA" IS
   FUNCTION get_fullkart (
      ppacid   IN   NUMBER/*,
      ucher    IN   VARCHAR2 DEFAULT 'Профилакторий ТТГ',
      obl      IN   VARCHAR2 DEFAULT 'ТЮМЕНСКАЯ',
      town     IN   VARCHAR2 DEFAULT 'ЮГОРСК',
      street   IN   VARCHAR2 DEFAULT 'ЖЕЛЕЗНОДОРОЖНАЯ, 23А'*/
   )
      RETURN NUMBER
   IS
      nclob_id   NUMBER           := 0.0;
      c          CLOB;
      str        VARCHAR2 (32000) := '';
      psex       VARCHAR2 (100)   := '';
      fam varchar2(100):='';
      im varchar2(100):='';
      otch varchar2(100):='';

      CURSOR c_sex IS SELECT DECODE (get_sex (ppacid), 0, 'ж.', 1, 'м.', 'не зад.') FROM DUAL;
      CURSOR c_FIO is select initcap(fc_fam), initcap(fc_im), initcap(fc_otch) from tkarta where fk_id=ppacid
                      union
                      select initcap(fc_fam), initcap(fc_im), initcap(fc_otch) from tambulance where fk_id=ppacid;
   BEGIN
      INSERT INTO tclobs
                  (fk_id, fc_clob)
           VALUES (-1, EMPTY_CLOB ())
        RETURNING fk_id
             INTO nclob_id;

      SELECT     /*+rule*/
                 fc_clob
            INTO c
            FROM tclobs
           WHERE fk_id = nclob_id
      FOR UPDATE;

      OPEN c_sex;
      FETCH c_sex INTO psex;
      CLOSE c_sex;
      open c_fio;
      fetch c_fio into fam, im, otch;
      close c_fio;
      str:='<html xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office"'||
           'xmlns:w="urn:schemas-microsoft-com:office:word"'||
           'xmlns="http://www.w3.org/TR/REC-html40">';
      DBMS_LOB.WRITE (c, LENGTH(str), DBMS_LOB.getlength(c)+1, str);
      str:='<head>'||
           '<meta http-equiv=Content-Type content="text/html; charset=windows-1251">'||
           '<meta name=ProgId content=Word.Document>'||
           '<meta name=Generator content="Microsoft Word 10">'||
           '<meta name=Originator content="Microsoft Word 10">'||
           '<title>Санаторно-курортная карта № '||get_ib(ppacid)||'</title>';
      DBMS_LOB.WRITE (c, LENGTH(str), DBMS_LOB.getlength(c)+1, str);
      str:='<style>'||
           '<!--'||
           '/* Font Definitions */'||
           ' @font-face '||
           ' {font-family:Tahoma; panose-1:2 11 6 4 3 5 4 4 2 4; mso-font-charset:204; mso-generic-font-family:swiss;'||
	       ' mso-font-pitch:variable; mso-font-signature:1627421319 -2147483648 8 0 66047 0;}';
      DBMS_LOB.WRITE(c, LENGTH(str), DBMS_LOB.getlength(c)+1, str);
      str:=' /* Style Definitions */ '||
           ' p.MsoNormal, li.MsoNormal, div.MsoNormal {mso-style-parent:""; margin:0cm; margin-bottom:.0001pt;'||
           ' mso-pagination:widow-orphan; font-size:14.0pt; mso-bidi-font-size:10.0pt; font-family:"Times New Roman";'||
    	   ' mso-fareast-font-family:"Times New Roman";}';
      DBMS_LOB.WRITE(c, LENGTH(str), DBMS_LOB.getlength(c)+1, str);
      str:=' h3 {mso-style-next:???????; margin:0cm; margin-bottom:.0001pt; text-align:center; mso-pagination:widow-orphan;'||
	       ' page-break-after:avoid; mso-outline-level:3; font-size:12.0pt; mso-bidi-font-size:10.0pt;'||
 	       ' font-family:"Times New Roman"; mso-bidi-font-weight:normal;}';
      DBMS_LOB.WRITE(c, LENGTH(str), DBMS_LOB.getlength(c)+1, str);
      str:=' p.MsoHeading9, li.MsoHeading9, div.MsoHeading9 {mso-style-next:???????; margin:0cm;'||
	       ' margin-bottom:.0001pt; text-align:center; mso-pagination:widow-orphan; page-break-after:avoid;'||
           ' mso-outline-level:9; font-size:14.0pt; mso-bidi-font-size:10.0pt; font-family:"Times New Roman";'||
	       ' mso-fareast-font-family:"Times New Roman"; font-weight:bold; mso-bidi-font-weight:normal;'||
	       ' text-decoration:underline; text-underline:single;}';
      DBMS_LOB.WRITE(c, LENGTH(str), DBMS_LOB.getlength(c)+1, str);
      str:=' p.MsoHeader, li.MsoHeader, div.MsoHeader {margin:0cm; margin-bottom:.0001pt; mso-pagination:widow-orphan;'||
	       ' tab-stops:center 207.65pt right 415.3pt; font-size:10.0pt; font-family:"Times New Roman";'||
	       ' mso-fareast-font-family:"Times New Roman";}';
      DBMS_LOB.WRITE(c, LENGTH(str), DBMS_LOB.getlength(c)+1, str);
      str:=' p.MsoFooter, li.MsoFooter, div.MsoFooter {margin:0cm; margin-bottom:.0001pt; mso-pagination:widow-orphan;'||
	       ' tab-stops:center 207.65pt right 415.3pt; font-size:10.0pt; font-family:"Times New Roman";'||
	       ' mso-fareast-font-family:"Times New Roman";}';
      DBMS_LOB.WRITE(c, LENGTH(str), DBMS_LOB.getlength(c)+1, str);
      str:=' p.MsoBodyText3, li.MsoBodyText3, div.MsoBodyText3 {margin:0cm; margin-bottom:.0001pt;'||
    	   ' text-align:center; mso-pagination:widow-orphan; font-size:12.0pt;'||
	       ' mso-bidi-font-size:10.0pt; font-family:"Times New Roman"; mso-fareast-font-family:"Times New Roman";'||
	       ' font-weight:bold; mso-bidi-font-weight:normal;}';
      DBMS_LOB.WRITE(c, LENGTH(str), DBMS_LOB.getlength(c)+1, str);
      str:=' p.MsoDocumentMap, li.MsoDocumentMap, div.MsoDocumentMap {mso-style-noshow:yes; margin:0cm;'||
	       ' margin-bottom:.0001pt; mso-pagination:widow-orphan; background:navy; font-size:14.0pt;'||
	       ' mso-bidi-font-size:10.0pt; font-family:Tahoma; mso-fareast-font-family:"Times New Roman";}';
      DBMS_LOB.WRITE(c, LENGTH(str), DBMS_LOB.getlength(c)+1, str);
      str:=' span.GramE {mso-style-name:""; mso-gram-e:yes;}';
      DBMS_LOB.WRITE(c, LENGTH(str), DBMS_LOB.getlength(c)+1, str);
      str:=' @page Section1 {size:595.3pt 841.9pt; margin:42.55pt 56.65pt 56.75pt 70.9pt; mso-header-margin:36.0pt;'||
	       ' mso-footer-margin:36.0pt; mso-page-numbers:135; '||
	       ' mso-paper-source:0;}';
      DBMS_LOB.WRITE(c, LENGTH(str), DBMS_LOB.getlength(c)+1, str);
      str:=' div.Section1 {page:Section1;} /* List Definitions */';
      DBMS_LOB.WRITE(c, LENGTH(str), DBMS_LOB.getlength(c)+1, str);
      str:=' @list l0 {mso-list-id:759645020; mso-list-type:simple; mso-list-template-ids:68747279;}';
      DBMS_LOB.WRITE(c, LENGTH(str), DBMS_LOB.getlength(c)+1, str);
      str:=' @list l0:level1 {mso-level-tab-stop:18.0pt; mso-level-number-position:left; margin-left:18.0pt;'||
	       ' text-indent:-18.0pt;}';
      DBMS_LOB.WRITE(c, LENGTH(str), DBMS_LOB.getlength(c)+1, str);
      str:='ol {margin-bottom:0cm;} ul {margin-bottom:0cm;} --> </style> </head>';
      DBMS_LOB.WRITE(c, LENGTH(str), DBMS_LOB.getlength(c)+1, str);
      str:='<body lang=RU style=''tab-interval:35.4pt''>'||
           '<div class=Section1>'||
           '<table class=MsoNormalTable border=1 cellspacing=0 cellpadding=0 '||
           ' style=''margin-left:5.4pt;border-collapse:collapse;border:none;mso-border-alt: '||
           ' solid windowtext .5pt;mso-padding-alt:0cm 5.4pt 0cm 5.4pt;mso-border-insideh: '||
           ' .5pt solid windowtext;mso-border-insidev:.5pt solid windowtext''>'||
           ' <tr style=''mso-yfti-irow:0;mso-yfti-lastrow:yes;height:82.0pt''>'||
           ' <td width=337 valign=top style=''width:252.95pt;border:solid windowtext 1.0pt;'||
           ' mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:82.0pt''>'||
           ' <p class=MsoNormal align=center style=''text-align:center''><span '||
           ' style=''font-size:10.0pt''><o:p>&nbsp;</o:p></span></p> '||
           ' <p class=MsoHeading9><a name="_Toc31118110"></a><a name="_Toc31117310"><span '||
           ' style=''mso-bookmark:_Toc31118110''><span style=''font-size:10.0pt''>Штамп</span></span></a><span '||
           ' style=''font-size:10.0pt''> <o:p></o:p></span></p> '||
           ' <p class=MsoNormal align=center style=''text-align:center''><span '||
           ' style=''font-size:10.0pt''>Лечебно-профилактического учреждения, выдавшего '||
           ' санаторно-курортную карту<o:p></o:p></span></p> '||
           ' <p class=MsoNormal align=center style=''text-align:center''><span '||
           ' style=''font-size:10.0pt''><o:p>&nbsp;</o:p></span></p> '||
           ' </td> </tr> </table>';
      DBMS_LOB.WRITE(c, LENGTH(str), DBMS_LOB.getlength(c)+1, str);
      str:=' <p class=MsoNormal style=''text-align:justify;text-indent:42.55pt''><span '||
           ' style=''font-size:10.0pt''><o:p>&nbsp;</o:p></span></p> '||
           ' <h3 align=left style=''text-align:left''><a name="_Toc31118111"></a><a '||
           ' name="_Toc31117311"><span style=''mso-bookmark:_Toc31118111''><span '||
           ' style=''font-size:10.0pt;mso-bidi-font-weight:bold''>САНАТОРНО-КУРОРТНАЯ КАРТА № '||
           get_ib(ppacid)||' </span></span></a><span style=''font-size:10.0pt;mso-bidi-font-weight:bold''>'||
           ' <o:p></o:p></span></h3>';
      DBMS_LOB.WRITE(c, LENGTH(str), DBMS_LOB.getlength(c)+1, str);
      str:='<p class=MsoNormal style=''text-align:justify''><span lang=EN-US '||
           ' style=''font-size:10.0pt;mso-ansi-language:EN-US''><o:p>&nbsp;</o:p></span></p> '||
           ' <p class=MsoNormal><span style=''font-size:10.0pt''>Дата заполнения '||
           ' <u>'||TO_CHAR(NVL(PKG_REGIST_PACFUNC.GET_PAC_INCOME(pPACID),SYSDATE), 'DD.MM.YYYY')||'</u><o:p></o:p></span></p>'||--by TimurLan
           ' <p class=MsoNormal style=''text-align:justify''><span style=''font-size:10.0pt''>Название '||
           ' лечебно-профилактического учреждения, выдавшего карту <o:p></o:p></span></p> '||
           ' <p class=MsoNormal style=''text-align:justify''>'||
           ' <u><span style=''font-size:10.0pt''>Профилакторий ТТГ<o:p></o:p></span></u></p>';
      DBMS_LOB.WRITE(c, LENGTH(str), DBMS_LOB.getlength(c)+1, str);
      str:='<p class=MsoNormal style=''text-align:justify''><span style=''font-size:10.0pt''>Адрес: '||
           ' область <u>Тюменская</u><o:p></o:p></span></p>'||
           ' <p class=MsoNormal style=''text-align:justify''><span style=''font-size:10.0pt''>Город '||
           ' <u>Югорск</u><o:p></o:p></span></p> '||
           ' <p class=MsoNormal style=''text-align:justify''><span style=''font-size:10.0pt''>Улица '||
           ' <u>Железнодорожная</u> дом №  '||
           ' <u>23А</u><o:p></o:p></span></p>';
      DBMS_LOB.WRITE(c, LENGTH(str), DBMS_LOB.getlength(c)+1, str);
      str:=' <p class=MsoNormal style=''text-align:justify''><span style=''font-size:10.0pt''>Фамилия, '||
           ' имя, отчество лечащего врача <u>'||
           initcap(do_vrachfio(get_lechvrach(ppacid)))||' </u><o:p></o:p></span></p>'||
           '<p class=MsoNormal style=''margin-left:18.0pt;text-align:justify;text-indent: '||
           ' -18.0pt;mso-list:l0 level1 lfo1;tab-stops:list 18.0pt''><![if !supportLists]><span '||
           ' style=''font-size:10.0pt''><span style=''mso-list:Ignore''>1.<span '||
           ' style=''font:7.0pt "Times New Roman"''>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; '||
           ' </span></span></span><![endif]><span style=''font-size:10.0pt''>Фамилия больного '||
           ' <u>'||
           fam||' </u><o:p></o:p></span></p>';
      DBMS_LOB.WRITE(c, LENGTH(str), DBMS_LOB.getlength(c)+1, str);
      str:=' <p class=MsoNormal style=''text-align:justify''><span style=''font-size:10.0pt''>Имя '||
           ' <u>'||im||'</u> отчество '||
           ' <u>'||otch||'</u><o:p></o:p></span></p>'||
           ' <p class=MsoNormal style=''text-align:justify''><span style=''font-size:10.0pt''>Пол: '||
           ' <u>'||psex||'</u>, год рождения '||
           ' <u>'||TO_CHAR(get_pacrojd(ppacid),'YYYY')||
           ' </u><o:p></o:p></span></p>'||
           ' <p class=MsoNormal style=''text-align:justify''><span style=''font-size:10.0pt''>Адрес '||
           ' больного <u>'||
           PKG_REGIST_PACFUNC.GET_PAC_ADRFULL(pPacID)||'</u><o:p></o:p></span></p>';
      DBMS_LOB.WRITE(c, LENGTH(str), DBMS_LOB.getlength(c)+1, str);
      str:=' <p class=MsoNormal style=''margin-top:0cm;margin-right:-.35pt;margin-bottom: '||
           ' 0cm;margin-left:18.0pt;margin-bottom:.0001pt;text-align:justify;text-indent: '||
           ' -18.0pt;mso-list:l0 level1 lfo1;tab-stops:list 18.0pt''><![if !supportLists]><span '||
           ' style=''font-size:10.0pt''><span style=''mso-list:Ignore''>2.<span '||
           ' style=''font:7.0pt "Times New Roman"''>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; '||
           ' </span></span></span><![endif]><span style=''font-size:10.0pt''>Место работы '||
           ' <u>'||
           PKG_REGIST_PACFUNC.GET_PAC_WORKPLACE(pPacID)||' </u><o:p></o:p></span></p>';
      DBMS_LOB.WRITE(c, LENGTH(str), DBMS_LOB.getlength(c)+1, str);
      str:='<p class=MsoNormal style=''margin-left:18.0pt;text-align:justify;text-indent: '||
           ' -18.0pt;mso-list:l0 level1 lfo1;tab-stops:list 18.0pt''><![if !supportLists]><span '||
           ' style=''font-size:10.0pt''><span style=''mso-list:Ignore''>3.<span '||
           ' style=''font:7.0pt "Times New Roman"''>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; '||
           ' </span></span></span><![endif]><span style=''font-size:10.0pt''>Жалобы, давность '||
           ' заболевания, данные анамнеза, предшествующее лечение, в том числе '||
           ' санаторно-курортное: <o:p></o:p></span></p>';
      DBMS_LOB.WRITE(c, LENGTH(str), DBMS_LOB.getlength(c)+1, str);
      DBMS_LOB.append(c, getRazdelIbText(ppacid, get_galobid, '', 'Жалоб нет'));
      DBMS_LOB.append(c, getanambolIbText(ppacid));
      str:=' <p class=MsoNormal style=''text-align:left''><span style=''font-size:10.0pt''>4. Краткие '||
           ' данные клинического, лабораторного, рентгенологического и других исследований: '||
           ' <br>';
      DBMS_LOB.WRITE(c, LENGTH(str), DBMS_LOB.getlength(c)+1, str);
/*      ФЛЮРОГРАФИЯ*/
      DBMS_LOB.append(c, getFlurografText(ppacid));
      str:='<br>';
      DBMS_LOB.WRITE(c, LENGTH(str), DBMS_LOB.getlength(c)+1, str);
/*      ОБЩИЙ АНАЛИЗ КРОВИ*/
/*      ОБЩИЙ АНАЛИЗ МОЧИ*/
/*      КРОВЬ НА RW*/
/*      ЭКГ*/
      DBMS_LOB.append(c, getEKGText(ppacid));
      str:='<br>';
      DBMS_LOB.WRITE(c, LENGTH(str), DBMS_LOB.getlength(c)+1, str);
/*      ГИНЕКОЛОГ*/
      if get_sex(ppacid)=0 then
        DBMS_LOB.append(c, getGinekologText(ppacid));
      end if;

      -- by Kapustin A.V.
/*      */
      str:='<br>';
      DBMS_LOB.WRITE(c, LENGTH(str), DBMS_LOB.getlength(c)+1, str);
      DBMS_LOB.append(c, getResAnText(ppacid));

      str:=' </span><o:p></o:p></span></p>';
      DBMS_LOB.WRITE(c, LENGTH(str), DBMS_LOB.getlength(c)+1, str);
      str:=' <p class=MsoNormal style=''text-align:justify''><span style=''font-size:10.0pt''><o:p>&nbsp;</o:p></span></p> '||
           ' <p class=MsoNormal style=''text-align:justify''><span style=''font-size:10.0pt''>Заключение: '||
           ' <b style=''mso-bidi-font-weight:normal''><u>';
      DBMS_LOB.WRITE(c, LENGTH(str), DBMS_LOB.getlength(c)+1, str);
      str:='</u></b><o:p></o:p></span></p> '||
           ' <p class=MsoNormal style=''text-align:justify''><span style=''font-size:10.0pt''>5. Диагноз: '||
           ' <o:p></o:p></span></p>';
      DBMS_LOB.WRITE(c, LENGTH(str), DBMS_LOB.getlength(c)+1, str);
      str:=' <p class=MsoNormal style=''text-align:justify''><span style=''font-size:10.0pt''><span '||
           ' style=''mso-spacerun:yes''> </span>а) основной '||
           ' <u>'||DO_DIAGBYTYPE(ppacid, 1, 1)||'<o:p></o:p></u></span></p>'||
           ' <p class=MsoNormal style=''text-align:justify''><span style=''font-size:10.0pt''> б) '||
           ' сопутствующие заболевания <u>'||
           DO_DIAGBYTYPE(ppacid, 1, 0)||'</u><o:p></o:p></span></p>';
      DBMS_LOB.WRITE(c, LENGTH(str), DBMS_LOB.getlength(c)+1, str);
      str:=' <p class=MsoNormal style=''text-align:justify''><b style=''mso-bidi-font-weight: '||
           ' normal''><span style=''font-size:10.0pt''>Заключение: </span></b><span '||
           ' style=''font-size:10.0pt''>'||
           ' Рекомендуемое лечение __________________________________________________________<o:p></o:p></span></p> '||
           ' <p class=MsoNormal style=''text-align:justify''><span style=''font-size:10.0pt''>'||
           ' ____________________________________________________________________________________________'||
           ' <o:p></o:p></span></p>';
      DBMS_LOB.WRITE(c, LENGTH(str), DBMS_LOB.getlength(c)+1, str);
      str:=' <p class=MsoNormal style=''text-align:justify''>'||
           ' <span style=''font-size:10.0pt''><o:p>а) курортное лечение (указать рекомендуемый курорт)_________________________</o:p></span></p>' ||
           ' <p class=MsoNormal style=''text-align:justify''><span style=''font-size:10.0pt''> б) '||
           ' в санатории (указать профиль) ___________________________________________<o:p></o:p></span></p> ';
      DBMS_LOB.WRITE(c, LENGTH(str), DBMS_LOB.getlength(c)+1, str);
      str:='<p class=MsoNormal style=''text-align:justify''><span style=''font-size:10.0pt''> в)'||
           ' курортно-амбулаторное лечение (подчеркнуть) _____________________________<o:p></o:p></span></p> '||
           ' <p class=MsoNormal style=''text-align:justify''><span style=''font-size:10.0pt''>Время '||
           ' года (зимой, весной, летом, осенью, круглый год) (подчеркнуть)<o:p></o:p></span></p> '||
           ' <p class=MsoNormal style=''text-align:justify''><span style=''font-size:10.0pt''><o:p>&nbsp;</o:p></span></p>';
      DBMS_LOB.WRITE(c, LENGTH(str), DBMS_LOB.getlength(c)+1, str);
      str:=' <table class=MsoTableGrid border=0 cellspacing=0 cellpadding=0 '||
           ' style=''border-collapse:collapse;mso-yfti-tbllook:480;mso-padding-alt:0cm 5.4pt 0cm 5.4pt''> '||
           ' <tr style=''mso-yfti-irow:0''> '||
           ' <td width=115 valign=top style=''width:86.4pt;padding:0cm 5.4pt 0cm 5.4pt''> '||
           ' <p class=MsoNormal style=''text-align:justify''><b style=''mso-bidi-font-weight: '||
           ' normal''><span style=''font-size:10.0pt''><o:p>&nbsp;</o:p></span></b></p> </td>';
      DBMS_LOB.WRITE(c, LENGTH(str), DBMS_LOB.getlength(c)+1, str);
      str:=' <td width=228 valign=top style=''width:171.0pt;padding:0cm 5.4pt 0cm 5.4pt''> '||
           ' <p class=MsoNormal style=''text-align:justify''><b style=''mso-bidi-font-weight: '||
           ' normal''><span lang=EN-US style=''font-size:10.0pt;mso-ansi-language:EN-US''><o:p>&nbsp;</o:p></span></b></p>'||
           ' </td> <td width=295 valign=top style=''width:221.15pt;padding:0cm 5.4pt 0cm 5.4pt''> '||
           ' <p class=MsoNormal align=right style=''text-align:right''><span '||
           ' style=''font-size:10.0pt''>Зав отделением - '||
           ' <u>'||
           initcap(do_vrachfio(GET_ZAVTERAPEVT))||'</u></span><b style=''mso-bidi-font-weight:normal''><span '||
           ' lang=EN-US style=''font-size:10.0pt;mso-ansi-language:EN-US''><o:p></o:p></span></b></p> </td> </tr>';
      DBMS_LOB.WRITE(c, LENGTH(str), DBMS_LOB.getlength(c)+1, str);
      str:=' <tr style=''mso-yfti-irow:1''> <td width=115 valign=top style=''width:86.4pt;padding:0cm 5.4pt 0cm 5.4pt''> '||
           ' <p class=MsoNormal style=''text-align:justify''><span style=''font-size:10.0pt''>Подписи:<b '||
           ' style=''mso-bidi-font-weight:normal''><o:p></o:p></b></span></p> </td>'||
           ' <td width=228 valign=top style=''width:171.0pt;padding:0cm 5.4pt 0cm 5.4pt''> '||
           ' <p class=MsoNormal style=''text-align:justify''><b style=''mso-bidi-font-weight: '||
           ' normal''><span lang=EN-US style=''font-size:10.0pt;mso-ansi-language:EN-US''><o:p>&nbsp;</o:p></span></b></p>'||
           ' </td> <td width=295 valign=top style=''width:221.15pt;padding:0cm 5.4pt 0cm 5.4pt''> '||
           ' <p class=MsoNormal align=right style=''text-align:right''><span '||
           ' style=''font-size:10.0pt''><o:p>&nbsp;</o:p></span></p></td> </tr>';
      DBMS_LOB.WRITE(c, LENGTH(str), DBMS_LOB.getlength(c)+1, str);
      str:=' <tr style=''mso-yfti-irow:2;mso-yfti-lastrow:yes''> '||
           ' <td width=115 valign=top style=''width:86.4pt;padding:0cm 5.4pt 0cm 5.4pt''> '||
           ' <p class=MsoNormal style=''text-align:justify''><b style=''mso-bidi-font-weight: '||
           ' normal''><span style=''font-size:10.0pt''><o:p>&nbsp;</o:p></span></b></p> </td> '||
           ' <td width=228 valign=top style=''width:171.0pt;padding:0cm 5.4pt 0cm 5.4pt''> '||
           ' <p class=MsoNormal style=''text-align:justify''><b style=''mso-bidi-font-weight: '||
           ' normal''><span lang=EN-US style=''font-size:10.0pt;mso-ansi-language:EN-US''><o:p>&nbsp;</o:p></span></b></p>'||
           ' </td> <td width=295 valign=top style=''width:221.15pt;padding:0cm 5.4pt 0cm 5.4pt''> '||
           ' <p class=MsoNormal align=right style=''text-align:right''><span '||
           ' style=''font-size:10.0pt''>Лечащий врач '||
           ' <u>'||initcap(do_vrachfio(get_lechvrach(ppacid)))||'</u></span>'||
           '<o:p></o:p></span></p> </td> </tr> </table>';
      DBMS_LOB.WRITE(c, LENGTH(str), DBMS_LOB.getlength(c)+1, str);
      str:='<p class=MsoNormal style=''text-align:justify''><b style=''mso-bidi-font-weight: '||
           ' normal''><span lang=EN-US style=''font-size:10.0pt;mso-ansi-language:EN-US''><o:p>&nbsp;</o:p></span></b></p> '||
           ' <p class=MsoNormal style=''text-align:justify''><span style=''font-size:10.0pt''><o:p>&nbsp;</o:p></span></p> '||
           ' <p class=MsoNormal style=''text-align:justify''><span style=''font-size:10.0pt''>Место '||
           ' печати<o:p></o:p></span></p>';
      DBMS_LOB.WRITE(c, LENGTH(str), DBMS_LOB.getlength(c)+1, str);
      str:=' <p class=MsoNormal style=''text-align:justify''><span style=''font-size:10.0pt''><o:p>&nbsp;</o:p></span></p> '||
           ' <p class=MsoNormal style=''text-align:justify''><span style=''font-size:10.0pt''><o:p>&nbsp;</o:p></span></p> '||
           ' <p class=MsoNormal style=''text-align:justify''><span style=''font-size:10.0pt'||'</u><o:p></o:p></span></p>';
           --'>Дата: '||' <u>'||TO_CHAR(SYSDATE, 'DD.MM.YYYY')
      DBMS_LOB.WRITE(c, LENGTH(str), DBMS_LOB.getlength(c)+1, str);
      str:='</div> </body> </html>';
      DBMS_LOB.WRITE(c, LENGTH(str), DBMS_LOB.getlength(c)+1, str);
      RETURN nclob_id;
   END;

  FUNCTION getRazdelIbText (pFK_PACID IN NUMBER, nStartID IN NUMBER, sCaption IN VARCHAR2, sDefault IN VARCHAR2)
    RETURN CLOB
  IS
    sTmp    VARCHAR2 (32767);
    sTxt    VARCHAR2 (32767);
    cl      CLOB;
    bNull   BOOLEAN          := TRUE;

    CURSOR c
    IS
      SELECT/*+INDEX_ASC(TSMID TSMID_BY_OWNER_ORDER)*/
         DECODE (fl_showprint, 1, (LPAD (' ', 2 * (LEVEL - 1)) || fc_name) || ': ', '') AS Name, fk_id
        FROM tsmid
       WHERE fc_type = 'FORM'
       START WITH fk_owner = nStartID
      CONNECT BY PRIOR fk_id = fk_owner;
  BEGIN
    DBMS_LOB.CREATETEMPORARY (cl, TRUE, 2);
    stmp:=' <p class=MsoNormal style=''text-align:justify;text-indent:18.0pt''> '||
           ' <u><span style=''font-size:10.0pt''>';
    DBMS_LOB.writeappend (cl, LENGTH (sTmp), sTmp);
    FOR i IN c LOOP
      IF i.name IS NOT NULL THEN
        sTmp   := i.name || get_ibformvalue (pFK_PACID, i.fk_id, sDefault);
        bNull  := FALSE;
        DBMS_LOB.writeappend (cl, LENGTH (sTmp), sTmp);
      ELSE
        sTxt  := get_ibformvalue (pFK_PACID, i.fk_id, '');
        IF sTxt IS NOT NULL THEN
          sTmp   := sTxt;
          bNull  := FALSE;
          DBMS_LOB.writeappend (cl, LENGTH (sTmp), sTmp);
        END IF;
      END IF;
    END LOOP;
    IF bNull THEN
      sTmp  := sDefault;
      DBMS_LOB.writeappend (cl, LENGTH (sTmp), sTmp);
    END IF;
    sTmp:='</span></u><span style=''font-size:10.0pt''><o:p></o:p></span></p>';
    DBMS_LOB.writeappend (cl, LENGTH (sTmp), sTmp);
    RETURN cl;
  END;

    FUNCTION getanambolIbText (pFK_PACID IN NUMBER)
    RETURN CLOB
  IS
    CURSOR cAnamBol
    IS
      SELECT fc_clob
        FROM tclobs, tanambol
       WHERE tclobs.fk_id = tanambol.fk_clobid
         AND tanambol.FK_PACID = pFK_PACID;

    sTmp    VARCHAR2 (2000);
    clTmp   CLOB;
    b       BOOLEAN;
  BEGIN
    DBMS_LOB.CREATETEMPORARY (clTmp, TRUE, 2);
    b     := FALSE;
    stmp:=' <p class=MsoNormal style=''text-align:justify;text-indent:18.0pt''> '||
           ' <u><span style=''font-size:10.0pt''>';
    DBMS_LOB.writeappend (clTmp, LENGTH (sTmp), sTmp);
    FOR i IN cAnamBol LOOP
      DBMS_LOB.APPEND (clTmp, i.FC_CLOB);
      b  := TRUE;
    END LOOP;
    IF NOT b THEN
      sTmp  := 'Не заполнен';
      DBMS_LOB.writeappend (clTmp, LENGTH (sTmp), sTmp);
    END IF;
    sTmp:='</span></u><span style=''font-size:10.0pt''><o:p></o:p></span></p><br>';
    DBMS_LOB.writeappend (clTmp, LENGTH (sTmp), sTmp);
    RETURN clTmp;
  END;

  function getFlurografText(pPacID in number) return clob
  is
    cursor c is
      select fc_res from tresis
       where fk_pacid=ppacid
         and fk_sos=get_vipnaz
         and fk_smid=(select fk_id from tsmid where fc_SYNONIM='FLUROGRAF_ISSLED');
    cursor c1 is--added by TimurLan
      SELECT FN_FLUR,
             FD_FLUR,
             DECODE (FL_FLUR, 0, 'Без патологии.', 1, 'Патология.', 'нет данных.') AS FL_FLUR,
             FC_FLUR
        FROM TKARTA
       WHERE FK_ID=pPACID;
    sTmp    VARCHAR2 (32767);
    clTmp   CLOB;
  begin
    DBMS_LOB.CREATETEMPORARY (clTmp, TRUE, 2);
    sTmp:='Рентгенологическое исследование: <u>';
    DBMS_LOB.writeappend (clTmp, LENGTH (sTmp), sTmp);

    /*OPEN c;
      FETCH c into sTmp;
      if c%NOTFOUND then
        sTmp:='нет данных.';
      end if;
    CLOSE c;*/--remmed by TimurLan
    sTmp:='нет данных.';
    FOR p in c1 LOOP
      if p.FN_FLUR is null then EXIT;
      end if;
      sTmp:=PKG_REGIST_PACFUNC.REPLACE_SPACES('№'||p.FN_FLUR||' от '||TO_CHAR(p.FD_FLUR,'dd.mm.yyyy')||'. Заключение: '||p.FL_FLUR||' '||p.FC_FLUR);
    END LOOP;

    DBMS_LOB.writeappend (clTmp, LENGTH (sTmp), sTmp);
    sTmp:='</u>';
    DBMS_LOB.writeappend (clTmp, LENGTH (sTmp), sTmp);
    RETURN clTmp;
  end;

  function getEKGText(ppacid in number) return clob
  is
    cursor c is
      select substr(fc_res, instr(UPPER(fc_res), 'ЗАКЛЮЧЕНИЕ', 10, 1), length(fc_res)-instr(UPPER(fc_res), 'ЗАКЛЮЧЕНИЕ', 10, 1)+1),
             TO_CHAR(nvl(fd_ins, sysdate), 'DD.MM.YYYY') from tresis
       where fk_pacid=ppacid
         and fk_sos=get_vipnaz
         and fk_smid in (GET_SYNID('EKG_ISSLED'), GET_SYNID('NEUROSOFT_LINK ЭКГ'));

    sTmp    VARCHAR2 (32767);
    clTmp   CLOB;
    sDate varchar2(100);
  begin
    DBMS_LOB.CREATETEMPORARY (clTmp, TRUE, 2);
    sTmp:='Исследование ЭКГ: <u>';
    DBMS_LOB.writeappend (clTmp, LENGTH (sTmp), sTmp);
    OPEN c;
      FETCH c into sTmp, sDate;
      if c%NOTFOUND then
        sTmp:='нет данных.';
      else
        sTmp:=/*'дата '||sDate||' '||*/sTmp;--Rem by TimurLan
      end if;
    CLOSE c;
    DBMS_LOB.writeappend (clTmp, LENGTH (sTmp), sTmp);
    sTmp:='</u>';
    DBMS_LOB.writeappend (clTmp, LENGTH (sTmp), sTmp);
    RETURN clTmp;
  end;

 function getGinekologText(ppacid in number) return clob
 is
    cursor c is
      select substr(fc_res, instr(UPPER(fc_res), 'ЗАКЛЮЧЕНИЕ', 10, 1), length(fc_res)-instr(UPPER(fc_res), 'ЗАКЛЮЧЕНИЕ', 10, 1)+1),
             TO_CHAR(nvl(fd_ins, sysdate), 'DD.MM.YYYY') from treskons
       where fk_pacid=ppacid
         and fk_sos=get_vipnaz
         and fk_smid=(select fk_id from tsmid where fc_SYNONIM='GINEKOLOG_KONS');

    sTmp    VARCHAR2 (32767);
    clTmp   CLOB;
    sDate varchar2(100);
 begin
    DBMS_LOB.CREATETEMPORARY (clTmp, TRUE, 2);
    sTmp:='Консультация гинеколога: <u>';
    DBMS_LOB.writeappend (clTmp, LENGTH (sTmp), sTmp);
    OPEN c;
      FETCH c into sTmp, sDate;
      if c%NOTFOUND then
        sTmp:='нет данных.';
      else
        sTmp:=/*'дата '||sDate||' '||*/sTmp;--Rem by TimurLan
      end if;
    CLOSE c;
    DBMS_LOB.writeappend (clTmp, LENGTH (sTmp), sTmp);
    sTmp:='</u>';
    DBMS_LOB.writeappend (clTmp, LENGTH (sTmp), sTmp);
    RETURN clTmp;
 end;

 -- Added by Kapustin A.V.
 function getResAnText(ppacid in number) return clob is

    clTmp   CLOB;
    sTmp    VARCHAR2 (32767);
    i       NUMBER;
    bExists NUMBER := 0;

    OBSH_ANAL_MOCHI BOOLEAN := False;
    ISSL_YAC_GELM   BOOLEAN := False;
    OBSH_ANAL_KROV  BOOLEAN := False;
    KOV_NA_RW_ANAL  BOOLEAN := False;
    CURSOR c IS
      SELECT fc_clob, tresan.fk_smid as smid
           FROM tresan, tclobs, tnazan
           WHERE fl_zakl = 1
                 AND tresan.fK_blobid3 = tclobs.fk_id
                 AND tresan.fk_pacid = ppacid
                 AND tnazan.fk_id = tresan.fk_nazid
                 AND tnazan.fd_naz BETWEEN TO_DATE(NVL(PKG_REGIST_PACFUNC.GET_PAC_INCOME(ppacid),SYSDATE)) AND TO_DATE(NVL(PKG_REGIST_PACFUNC.GET_PAC_OUTCOME(ppacid),SYSDATE))
                 AND tresan.fk_smid IN (GET_synid('OBSH_ANAL_MOCHI'), GET_synid('ISSL_YAC_GELM'), GET_synid('OBSH_ANAL_KROV'), GET_synid('KOV_NA_RW_ANAL'))
           ORDER BY
                 tnazan.fd_naz;
 begin
    DBMS_LOB.CREATETEMPORARY (clTmp, TRUE, 2);
    sTmp:='Лабораторные исследования: <u>';
    DBMS_LOB.writeappend (clTmp, LENGTH (sTmp), sTmp);
    FOR i IN c LOOP
      bExists := 1;

      if (i.smid = GET_synid('OBSH_ANAL_MOCHI')) and (not OBSH_ANAL_MOCHI) then
        OBSH_ANAL_MOCHI := true;
        DBMS_LOB.append(clTmp, i.fc_clob);
      end if;

      if (i.smid = GET_synid('ISSL_YAC_GELM')) and (not ISSL_YAC_GELM) then
        ISSL_YAC_GELM := true;
        DBMS_LOB.append(clTmp, i.fc_clob);
      end if;

      if (i.smid = GET_synid('OBSH_ANAL_KROV')) and (not OBSH_ANAL_KROV) then
        OBSH_ANAL_KROV := true;
        DBMS_LOB.append(clTmp, i.fc_clob);
      end if;

      if (i.smid = GET_synid('KOV_NA_RW_ANAL')) and (not KOV_NA_RW_ANAL) then
        KOV_NA_RW_ANAL := true;
        DBMS_LOB.append(clTmp, i.fc_clob);
      end if;

      if (OBSH_ANAL_MOCHI and ISSL_YAC_GELM and OBSH_ANAL_KROV and KOV_NA_RW_ANAL) then
        exit;
      end if;

    END LOOP;

    IF bExists = 0 THEN
      sTmp := 'Не проводились';
      DBMS_LOB.writeappend(clTmp, LENGTH(sTmp), sTmp);
    END IF;
    sTmp:='</u>';
    DBMS_LOB.writeappend (clTmp, LENGTH (sTmp), sTmp);
    RETURN clTmp;
 end;

END;
/

SHOW ERRORS;


