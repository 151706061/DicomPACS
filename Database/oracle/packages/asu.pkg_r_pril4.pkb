DROP PACKAGE BODY ASU.PKG_R_PRIL4
/

--
-- PKG_R_PRIL4  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_R_PRIL4" 
 is-- Created by TimurLan
  FUNCTION DO_CALC_REPORT (pFN_YEAR IN VARCHAR2, pFK_VRACHID IN NUMBER)
  RETURN NUMBER
   IS-- Used in rPril4.dpr [4 "BLUE ROCK" SANATORIUM O_N_L_Y !]
    CURSOR cKorp is select * from tkorp;
    CURSOR cAll (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_KORPID IN NUMBER)
     is
      SELECT COUNT (FK_PACID)
        FROM TSROKY
       WHERE FD_DATA1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
         AND FK_PRYB = 3
         AND get_packorpid(fk_pacid,pFD_DATA1) = pFK_KORPID;
    CURSOR cWithOutSKK (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_KORPID IN NUMBER)
     is
      SELECT COUNT (FK_PACID)
        FROM TSROKY
       WHERE FK_PRYB = 3
         AND FD_DATA1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
         AND GET_PAC_SKK (FK_PACID) = 0
         and get_packorpid(fk_pacid,pFD_DATA1) = pFK_KORPID;
    CURSOR cByPrizn (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_KORPID IN NUMBER, pFK_PRIZN IN NUMBER)
     is
      SELECT COUNT (FK_PACID)
        FROM TSROKY
       WHERE FD_DATA1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
         AND FK_PRYB = 3
         AND GET_PAC_PRIZN_KODE (FK_PACID) = pFK_PRIZN
         and get_packorpid(fk_pacid,pFD_DATA1) = pFK_KORPID;
    CURSOR cByPriznByVid (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_KORPID IN NUMBER, pFK_PRIZN IN NUMBER, pFK_KOD2 IN NUMBER)
     is
      SELECT COUNT (FK_PACID)
        FROM TSROKY
       WHERE FD_DATA1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
         AND FK_PRYB = 3
         AND GET_PAC_PRIZN_KODE (FK_PACID) = pFK_PRIZN
         AND GET_PAC_VID_KODE (FK_PACID) = pFK_KOD2
         and get_packorpid(fk_pacid,pFD_DATA1) = pFK_KORPID;
    CURSOR cByPriznBySocPol (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_KORPID IN NUMBER, pFK_PRIZN IN NUMBER, pFK_COCPOL IN NUMBER)
     is
      SELECT COUNT (FK_PACID)
        FROM TSROKY
       WHERE FD_DATA1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
         AND FK_PRYB = 3
         AND GET_PAC_PRIZN_KODE (FK_PACID) = pFK_PRIZN
         AND GET_PAC_SOCPOLID (FK_PACID) = pFK_COCPOL
         and get_packorpid(fk_pacid,pFD_DATA1) = pFK_KORPID;
    CURSOR cByPriznByAge (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_KORPID IN NUMBER, pFK_PRIZN IN NUMBER, pMinAge IN NUMBER, pMaxAge IN NUMBER)
     is
      SELECT COUNT (FK_PACID)
        FROM TSROKY
       WHERE FD_DATA1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
         AND FK_PRYB = 3
         AND GET_PAC_PRIZN_KODE (FK_PACID) = pFK_PRIZN
         AND GET_PACVOZR (FK_PACID) BETWEEN pMinAge-1 AND pMaxAge+1
         and get_packorpid(fk_pacid,pFD_DATA1) = pFK_KORPID;
    CURSOR cByPriznBySex (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_KORPID IN NUMBER, pFK_PRIZN IN NUMBER, pSex IN NUMBER)
     is
      SELECT COUNT (FK_PACID)
        FROM TSROKY
       WHERE FD_DATA1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
         AND FK_PRYB = 3
         AND GET_PAC_PRIZN_KODE (FK_PACID) = pFK_PRIZN
         AND GET_SEX (FK_PACID) = pSex
         and get_packorpid(fk_pacid,pFD_DATA1) = pFK_KORPID;
    HTML_HEAD CONSTANT VARCHAR(32767) :=
    '<html xmlns:x="urn:schemas-microsoft-com:office:excel">'||
    '<head>'||
    '<meta http-equiv=Content-Type content="text/html; charset=windows-1251">'||
    '<meta name=ProgId content=Excel.Sheet>'||
    '<style>'||
    '<!--table'||
    '	{mso-displayed-decimal-separator:"\,";'||
    '	mso-displayed-thousand-separator:" ";}'||
    '@page'||
    '	{margin:.39in .39in .39in .39in;'||
    '	mso-header-margin:0in;'||
    '	mso-footer-margin:0in;'||
    '	mso-page-orientation:landscape;'||
    ' mso-horizontal-page-align:center;}'||
    'tr'||
    '	{mso-height-source:auto;}'||
    'col'||
    '	{mso-width-source:auto;}'||
    'br'||
    '	{mso-data-placement:same-cell;}'||
    '.style0'||
    '	{mso-number-format:General;'||
    '	text-align:center;'||
    '	vertical-align:middle;'||
    '	white-space:normal;'||
    '	mso-rotate:0;'||
    '	mso-background-source:auto;'||
    '	mso-pattern:auto;'||
    '	color:windowtext;'||
    '	font-size:10.0pt;'||
    '	font-weight:400;'||
    '	font-style:normal;'||
    '	text-decoration:none;'||
    '	font-family:"Times New Roman", serif;'||
    '	mso-font-charset:204;'||
    '	border:.5pt solid windowtext;'||
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
    '	border:.5pt solid windowtext;'||
    '	mso-background-source:auto;'||
    '	mso-pattern:auto;'||
    '	mso-protection:locked visible;'||
    '	white-space:normal;'||
    '	mso-rotate:0;}'||
    '.tdg'||
    '	{mso-style-parent:style0;'||
    '	border-top:.5pt solid windowtext;'||
    '	border-right:.5pt solid windowtext;'||
    '	border-bottom:.5pt solid windowtext;'||
    '	border-left:.5pt solid windowtext;'||
    '	mso-rotate:0;}'||
    '.tdv'||
    '	{mso-style-parent:style0;'||
    '	border-top:.5pt solid windowtext;'||
    '	border-right:.5pt solid windowtext;'||
    '	border-bottom:.5pt solid windowtext;'||
    '	border-left:.5pt solid windowtext;'||
    '	mso-rotate:90;}'||
    '-->'||
    '</style>'||
    '<!--[if gte mso 9]><xml>'||
    ' <x:ExcelWorkbook>'||
    '  <x:ExcelWorksheets>'||
    '   <x:ExcelWorksheet>'||
    '    <x:Name>Sheet1</x:Name>'||
    '    <x:WorksheetOptions>'||
    '     <x:StandardWidth>2133</x:StandardWidth>'||
    '     <x:Print>'||
    '      <x:ValidPrinterInfo/>'||
    '      <x:PaperSizeIndex>9</x:PaperSizeIndex>'||
    '     </x:Print>'||
    '    </x:WorksheetOptions>'||
    '   </x:ExcelWorksheet>'||
    ' </x:ExcelWorkbook>'||
    '</xml><![endif]-->'||
    '</head>';
    d1 DATE;
    d2 DATE;
    cC CLOB;
    nValue NUMBER;
    sValue VARCHAR2(30);
    sTemp VARCHAR(8);
    nTemp NUMBER;
    nTemp2 NUMBER;
    nStep NUMBER;
    KorpCol NUMBER;
    str VARCHAR2 (8000);
    nC NUMBER;
    c1 number;
    c2 number;
    c3 number;
    c4 number;
    c5 number;
    c6 number;
    c7 number;
    c8 number;
    c9 number;
    c10 number;
    c11 number;
    c12 number;
    c13 number;
    c14 number;
    c15 number;
    cVred NUMBER;
  BEGIN
    c1  := 0;
    c2  := 0;
    c3  := 0;
    c4  := 0;
    c5  := 0;
    c6  := 0;
    c7  := 0;
    c8  := 0;
    c9  := 0;
    c10  := 0;
    c11  := 0;
    c12  := 0;
    c13  := 0;
    c14  := 0;
    c15  := 0;
    cVred  := 0;
    Select count(fk_id) into KorpCol from tkorp;
    PROGRESS_BAR.SETSTROUT ('Формирование отчета... шаг 0 из '||TO_CHAR(12*KorpCol));
    PROGRESS_BAR.STEPIT;
    d1:=TO_DATE('01.01.'||pFN_YEAR,'dd.mm.yyyy');
    d2:=TO_DATE('31.01.'||pFN_YEAR,'dd.mm.yyyy');
    INSERT INTO TCLOBS (FC_CLOB) VALUES (EMPTY_CLOB () ) RETURNING FK_ID,FC_CLOB INTO nC,cC;
    DBMS_LOB.OPEN (cC, DBMS_LOB.LOB_READWRITE);
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (HTML_HEAD), HTML_HEAD);
    str:='<body>'||
         '<table x:str border=0 cellpadding=0 cellspacing=0 width=910 style=''border-collapse:collapse;table-layout:fixed;width:688pt''>'||
         ' <col width=50 style=''mso-width-source:userset;mso-width-alt:2133;width:38pt''>'||
         ' <col width=80 style=''mso-width-source:userset;mso-width-alt:3413;width:60pt''>'||
         ' <col width=60 style=''mso-width-source:userset;mso-width-alt:2560;width:45pt''>'||
         ' <col width=50 span=4 style=''width:38pt''>'||
         ' <col width=55 span=2 style=''mso-width-source:userset;mso-width-alt:2346;width:41pt''>'||
         ' <col width=50 span=5 style=''width:38pt''>'||
         ' <col width=60 style=''mso-width-source:userset;mso-width-alt:2560;width:45pt''>'||
         ' <col width=50 span=2 style=''width:38pt''>'||
         '<tr height=17>'||
         ' <td rowspan=2 height=68 width=50>'||pFN_YEAR||'<br>год</td>'||
         ' <td rowspan=2 width=80>корпус</td>'||
         ' <td rowspan=2 width=60>всего</td>'||
         ' <td colspan=7 width=360>Сотрудники</td>'||
         ' <td colspan=2 width=100>Члены семьи</td>'||
         ' <td colspan=2 width=100>Пенсионеры</td>'||
         ' <td rowspan=2 width=60>Прочие за налич. расчет</td>'||
         ' <td rowspan=2 width=50>Конференции</td>'||
         ' <td rowspan=2 width=50>Без сан-курорт. карты</td>'||
         '</tr>'||
         '<tr height=51>'||
         ' <td height=51 width=50>всего</td>'||
         ' <td width=50>администрация</td>'||
         ' <td width=50>руководители</td>'||
         ' <td width=50>специалисты</td>'||
         ' <td width=55>рабочие</td>'||
         ' <td width=55>женщины</td>'||
         ' <td width=50>проф. вред.</td>'||
         ' <td width=50>прочие</td>'||
         ' <td width=50>дети до 14</td>'||
         ' <td width=50>МТГ</td>'||
         ' <td width=50>прочие</td>'||
         '</tr>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    nTemp:=1;
    nStep:=1;
    WHILE nTemp < 13 LOOP
      if nTemp=1 then sTemp:='Янв';
      else
        if nTemp=2 then sTemp:='Фев';
        else
          if nTemp=3 then sTemp:='Март';
          else
            if nTemp=4 then sTemp:='Апр';
            else
              if nTemp=5 then sTemp:='Май';
              else
                if nTemp=6 then sTemp:='Июнь';
                else
                  if nTemp=7 then sTemp:='Июль';
                  else
                    if nTemp=8 then sTemp:='Авг';
                    else
                      if nTemp=9 then sTemp:='Сен';
                      else
                        if nTemp=10 then sTemp:='Окт';
                        else
                          if nTemp=11 then sTemp:='Нояб';
                          else
                            if nTemp=12 then sTemp:='Дек';
                            end if;
                          end if;
                        end if;
                      end if;
                    end if;
                  end if;
                end if;
              end if;
            end if;
          end if;
        end if;
      end if;
      if nTemp=1 then
        d1:=d1;d2:=d2;
      else
        d1:=ADD_MONTHS(d1,1);
        d2:=ADD_MONTHS(d2,1);
      end if;
      nTemp2:=1;
      FOR i in cKorp LOOP
        cVred:=0;
        PROGRESS_BAR.SETSTROUT ('Формирование отчета... шаг '||TO_CHAR(nStep)||' из '||TO_CHAR(12*KorpCol));
        PROGRESS_BAR.STEPIT;
        str:='<tr height=17>';
        if nTemp2 = 1 then
          str:=str||'<td rowspan='||KorpCol||' height=51 class=tdv width=50>'||sTemp||'</td>';
        end if;
        str:=str||' <td width=80>'||i.FC_NAME||'</td>';
          OPEN cAll(d1,d2,i.FK_ID);--Всего
          FETCH cAll INTO nValue;
          CLOSE cALL;
          c1:=c1+nValue;
          sValue:=PKG_R_ALLFUNC.RETURN_VALUE(nValue);
        str:=str||' <td width=60>'||sValue||'</td>';
          OPEN cByPrizn(d1,d2,i.FK_ID,1);--Всего сотрудников
          FETCH cByPrizn INTO nValue;
          CLOSE cByPrizn;
          c2:=c2+nValue;
          sValue:=PKG_R_ALLFUNC.RETURN_VALUE(nValue);
        str:=str||' <td width=50>'||sValue||'</td>';
          OPEN cByPriznBySocPol(d1,d2,i.FK_ID,1,87);--Администрация
          FETCH cByPriznBySocPol INTO nValue;
          CLOSE cByPriznBySocPol;
          c3:=c3+nValue;
          sValue:=PKG_R_ALLFUNC.RETURN_VALUE(nValue);
        str:=str||' <td width=50>'||sValue||'</td>';
          OPEN cByPriznBySocPol(d1,d2,i.FK_ID,1,88);--Руководители
          FETCH cByPriznBySocPol INTO nValue;
          CLOSE cByPriznBySocPol;
          c4:=c4+nValue;
          sValue:=PKG_R_ALLFUNC.RETURN_VALUE(nValue);
        str:=str||' <td width=50>'||sValue||'</td>';
          OPEN cByPriznBySocPol(d1,d2,i.FK_ID,1,89);--Специалисты
          FETCH cByPriznBySocPol INTO nValue;
          CLOSE cByPriznBySocPol;
          c5:=c5+nValue;
          cVred:=nValue;
          sValue:=PKG_R_ALLFUNC.RETURN_VALUE(nValue);
        str:=str||' <td width=50>'||sValue||'</td>';
          OPEN cByPriznBySocPol(d1,d2,i.FK_ID,1,90);--Рабочие
          FETCH cByPriznBySocPol INTO nValue;
          CLOSE cByPriznBySocPol;
          c6:=c6+nValue;
          cVred:=cVred+nValue;
          sValue:=PKG_R_ALLFUNC.RETURN_VALUE(nValue);
        str:=str||' <td width=55>'||sValue||'</td>';
          OPEN cByPriznBySex(d1,d2,i.FK_ID,1,0);--Женщины
          FETCH cByPriznBySex INTO nValue;
          CLOSE cByPriznBySex;
          c7:=c7+nValue;
          sValue:=PKG_R_ALLFUNC.RETURN_VALUE(nValue);
        str:=str||' <td width=55>'||sValue||'</td>';
          nValue:=cVred;--Проф. вредности
          c8:=c8+nValue;
          sValue:=PKG_R_ALLFUNC.RETURN_VALUE(nValue);
        str:=str||' <td width=50>'||sValue||'</td>';
          OPEN cByPriznByAge(d1,d2,i.FK_ID,67,15,200);--Члены семьи /ПРОЧИЕ
          FETCH cByPriznByAge INTO nValue;
          CLOSE cByPriznByAge;
          c9:=c9+nValue;
          sValue:=PKG_R_ALLFUNC.RETURN_VALUE(nValue);
        str:=str||' <td width=50>'||sValue||'</td>';
          OPEN cByPriznByAge(d1,d2,i.FK_ID,67,1,14);--Члены семьи /ДЕТИ ДО 14
          FETCH cByPriznByAge INTO nValue;
          CLOSE cByPriznByAge;
          c10:=c10+nValue;
          sValue:=PKG_R_ALLFUNC.RETURN_VALUE(nValue);
        str:=str||' <td width=50>'||sValue||'</td>';
          OPEN cByPriznBySocPol(d1,d2,i.FK_ID,0,91);--ПРОЧИЕ /ПЕНСИОНЕРЫ МТГ
          FETCH cByPriznBySocPol INTO nValue;
          CLOSE cByPriznBySocPol;
          c11:=c11+nValue;
          sValue:=PKG_R_ALLFUNC.RETURN_VALUE(nValue);
        str:=str||' <td width=50>'||sValue||'</td>';
          OPEN cByPriznBySocPol(d1,d2,i.FK_ID,0,13);--ПРОЧИЕ /ПЕНСИОНЕРЫ
          FETCH cByPriznBySocPol INTO nValue;
          CLOSE cByPriznBySocPol;
          c12:=c12+nValue;
          sValue:=PKG_R_ALLFUNC.RETURN_VALUE(nValue);
        str:=str||' <td width=50>'||sValue||'</td>';
          OPEN cByPriznByVid(d1,d2,i.FK_ID,0,3);--ПРОЧИЕ /ЗА НАЛ. РАСЧЕТ (ПО ЗАЯВКЕ)
          FETCH cByPriznByVid INTO nValue;
          CLOSE cByPriznByVid;
          c13:=c13+nValue;
          sValue:=PKG_R_ALLFUNC.RETURN_VALUE(nValue);
        str:=str||' <td width=60>'||sValue||'</td>';
          OPEN cByPrizn(d1,d2,i.FK_ID,68);--КОНФЕРЕНЦИИ
          FETCH cByPrizn INTO nValue;
          CLOSE cByPrizn;
          c14:=c14+nValue;
          sValue:=PKG_R_ALLFUNC.RETURN_VALUE(nValue);
        str:=str||' <td width=50>'||sValue||'</td>';
          OPEN cWithOutSKK(d1,d2,i.FK_ID);
          FETCH cWithOutSKK INTO nValue;
          CLOSE cWithOutSKK;
          c15:=c15+nValue;
          sValue:=PKG_R_ALLFUNC.RETURN_VALUE(nValue);
        str:=str||' <td width=50>'||sValue||'</td>';
        str:=str||'</tr>';
        nTemp2:=nTemp2+1;
        DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
        nStep:=nStep+1;
      END LOOP;
      nTemp:=nTemp+1;
    END LOOP;
    str:=' <tr height=17 style=''height:12.75pt''>';
    str:=str||'  <td colspan=2 height=17 class=xl26 width=130 style=''border-right:.5pt solid black;height:12.75pt;width:98pt''>Итого за год</td>';
    str:=str||'  <td width=60 style=''border-top:none;border-left:none;width:45pt''>'||PKG_R_ALLFUNC.RETURN_VALUE(c1)||'</td>';
    str:=str||'  <td width=50 style=''border-top:none;border-left:none;width:38pt''>'||PKG_R_ALLFUNC.RETURN_VALUE(c2)||'</td>';
    str:=str||'  <td width=50 style=''border-top:none;border-left:none;width:38pt''>'||PKG_R_ALLFUNC.RETURN_VALUE(c3)||'</td>';
    str:=str||'  <td width=50 style=''border-top:none;border-left:none;width:38pt''>'||PKG_R_ALLFUNC.RETURN_VALUE(c4)||'</td>';
    str:=str||'  <td width=50 style=''border-top:none;border-left:none;width:38pt''>'||PKG_R_ALLFUNC.RETURN_VALUE(c5)||'</td>';
    str:=str||'  <td width=55 style=''border-top:none;border-left:none;width:41pt''>'||PKG_R_ALLFUNC.RETURN_VALUE(c6)||'</td>';
    str:=str||'  <td width=55 style=''border-top:none;border-left:none;width:41pt''>'||PKG_R_ALLFUNC.RETURN_VALUE(c7)||'</td>';
    str:=str||'  <td width=50 style=''border-top:none;border-left:none;width:38pt''>'||PKG_R_ALLFUNC.RETURN_VALUE(c8)||'</td>';
    str:=str||'  <td width=50 style=''border-top:none;border-left:none;width:38pt''>'||PKG_R_ALLFUNC.RETURN_VALUE(c9)||'</td>';
    str:=str||'  <td width=50 style=''border-top:none;border-left:none;width:38pt''>'||PKG_R_ALLFUNC.RETURN_VALUE(c10)||'</td>';
    str:=str||'  <td width=50 style=''border-top:none;border-left:none;width:38pt''>'||PKG_R_ALLFUNC.RETURN_VALUE(c11)||'</td>';
    str:=str||'  <td width=50 style=''border-top:none;border-left:none;width:38pt''>'||PKG_R_ALLFUNC.RETURN_VALUE(c12)||'</td>';
    str:=str||'  <td width=60 style=''border-top:none;border-left:none;width:45pt''>'||PKG_R_ALLFUNC.RETURN_VALUE(c13)||'</td>';
    str:=str||'  <td width=50 style=''border-top:none;border-left:none;width:38pt''>'||PKG_R_ALLFUNC.RETURN_VALUE(c14)||'</td>';
    str:=str||'  <td width=50 style=''border-top:none;border-left:none;width:38pt''>'||PKG_R_ALLFUNC.RETURN_VALUE(c15)||'</td>';
    str:=str||' </tr>';
/*    str:=str||' <tr height=17 style=''height:12.75pt''>';
    str:=str||'  <td colspan=2 height=17 class=xl26 width=130 style=''border-right:.5pt solid black;height:12.75pt;width:98pt''>Переходящие</td>';
    str:=str||'  <td width=60 style=''border-top:none;border-left:none;width:45pt''>&nbsp;</td>';
    str:=str||'  <td width=50 style=''border-top:none;border-left:none;width:38pt''>&nbsp;</td>';
    str:=str||'  <td width=50 style=''border-top:none;border-left:none;width:38pt''>&nbsp;</td>';
    str:=str||'  <td width=50 style=''border-top:none;border-left:none;width:38pt''>&nbsp;</td>';
    str:=str||'  <td width=50 style=''border-top:none;border-left:none;width:38pt''>&nbsp;</td>';
    str:=str||'  <td width=55 style=''border-top:none;border-left:none;width:41pt''>&nbsp;</td>';
    str:=str||'  <td width=55 style=''border-top:none;border-left:none;width:41pt''>&nbsp;</td>';
    str:=str||'  <td width=50 style=''border-top:none;border-left:none;width:38pt''>&nbsp;</td>';
    str:=str||'  <td width=50 style=''border-top:none;border-left:none;width:38pt''>&nbsp;</td>';
    str:=str||'  <td width=50 style=''border-top:none;border-left:none;width:38pt''>&nbsp;</td>';
    str:=str||'  <td width=50 style=''border-top:none;border-left:none;width:38pt''>&nbsp;</td>';
    str:=str||'  <td width=50 style=''border-top:none;border-left:none;width:38pt''>&nbsp;</td>';
    str:=str||'  <td width=60 style=''border-top:none;border-left:none;width:45pt''>&nbsp;</td>';
    str:=str||'  <td width=50 style=''border-top:none;border-left:none;width:38pt''>&nbsp;</td>';
    str:=str||'  <td width=50 style=''border-top:none;border-left:none;width:38pt''>&nbsp;</td>';
    str:=str||' </tr>';*/
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
    str:=str||' <![endif]>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    PROGRESS_BAR.SETSTROUT ('Формирование отчета... шаг последний');
    PROGRESS_BAR.STEPIT;
    str:='</table></body></html>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
    DBMS_LOB.CLOSE (cC);
    RETURN nC;
  END;
end PKG_R_PRIL4;
/

SHOW ERRORS;


