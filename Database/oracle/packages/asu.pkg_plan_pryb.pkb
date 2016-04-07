DROP PACKAGE BODY ASU.PKG_PLAN_PRYB
/

--
-- PKG_PLAN_PRYB  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_PLAN_PRYB" 
IS
function get_plan_pryb(data in date,vrach_id in number)
return number
is
cursor c1
is
select fk_id,fc_name from tvid;
cursor c2(data in date,id in number)
is
select get_pacfio(tkarta.fk_id) fio,get_pacsex(tkarta.fk_id) sex,fc_put numput,get_pacfcpalata(tkarta.fk_id) palata,
    to_char(fd_data1,'dd.mm.yyyy') pdata1,to_char(fd_data2,'dd.mm.yyyy') pdata2,
    get_pac_org(fk_kod2,fk_kod) org,get_pac_num_put(fk_kod2,fk_kod) ser

  from tkarta,tsroky
    where tsroky.fk_pacid=tkarta.fk_id and
      tsroky.fk_pryb=1 and
      tsroky.fd_data1 = data and
      tkarta.fk_kod2=id;
cursor c3(data in date,id in number)
 is
select count(*)
  from tkarta,tsroky
    where tsroky.fk_pacid=tkarta.fk_id and
      tsroky.fk_pryb=1 and
      tsroky.fd_data1 = data and
      tkarta.fk_kod2=id;
 nc number;  --   возвращаемое значение
 cc CLOB;    --   временный клоб
 str VARCHAR2 (32767);  --  временные строки HTML-кода
sumkol number;
sch number;
kol number;
n varchar2(5);
begin
 DBMS_LOB.createtemporary(cc,true,DBMS_LOB.session);
    str       :=
        ' <html xmlns:x="urn:schemas-microsoft-com:office:excel"> '||
        ' <head> '||
        ' <meta http-equiv=Content-Type content="text/html; charset=windows-1251"> '||
        ' <style> '||
        ' <!-- '||
        ' .sm_td { border:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt} ' ||
        ' .sm_table{border-collapse:collapse;border:none;mso-border-alt:solid windowtext .5pt;mso-padding-alt:0cm 5.4pt 0cm 5.4pt} '||
        ' @page  '||
        ' { mso-page-orientation:landscape; }  '||
        ' @page Section1  '||
        ' { mso-page-orientation:landscape;  '||
        '   size:841.9pt 595.3pt; }  '||
        ' div.Section1  '||
        ' {page:Section1;} '||
        ' --> '||
        ' </style> '||
        ' <xml> '||
        '  <x:ExcelWorkbook> '||
        '   <x:ExcelWorksheets> '||
        '    <x:ExcelWorksheet> '||
        '     <x:WorksheetOptions> '||
        '      <x:Print> '||
        '       <x:ValidPrinterInfo/> '||
        '      </x:Print> '||
        '     </x:WorksheetOptions> '||
        '    </x:ExcelWorksheet> '||
        '   </x:ExcelWorksheets> '||
        '  </x:ExcelWorkbook> '||
        ' </xml> '||
        ' </head> ';

  DBMS_LOB.WRITEAPPEND (cc, LENGTH (str), str); --                                        Заносим данные в конец клоба
 sumkol:=0;
 sch:=0;
         --                                    ШАПКА
  str  := '<P ALIGN="CENTER"><B><font size="+1"> Планируемый заезд на ' || TO_CHAR (data, 'dd.mm.yyyy') || ' по медучреждению "' ||
        PKG_SMINI.READSTRING ('CONFIG', 'S_NAME', 'Не известен') ||
        '"</font></B><BR>';
  DBMS_LOB.WRITEAPPEND (cc, LENGTH (str), str); --                                        Заносим данные в конец клоба
      --                                 Определение таблицы
    str  := '<table align="center" width="100%" border="1" bordercolorlight="#000000" bordercolordark="#FFFFFF" bordercolor="#FFFFFF" bgcolor="#FFFFFF" cellpadding="0" cellspacing="0" class="sm_table">';

           --                                Шапка таблицы
    str  := str || '<tr><td class="sm_td" WIDTH=90 ALIGN="CENTER"><B>№ п.п.:</B></td><td width="20%" class="sm_td" align="center"><b>Ф.И.О.:</b></td><td class="sm_td" align="center"><B>Пол:</B></td><td class="sm_td" align="center"><B>№ Путёвки:</B></td><td class="sm_td" align="center"><B>№ Палаты:</B></td><td class="sm_td" align="center"><B>C</B></td><td class="sm_td" align="center"><B>ПО</B></td><td class="sm_td" align="center"><B>Расшифровка:</B></td></tr>';
  DBMS_LOB.WRITEAPPEND (cc, LENGTH (str), str);
    --                                     Заполнение таблицы
for c_rec1 in c1 loop
open c3 (data,c_rec1.fk_id);
fetch c3 into kol;
close c3;
if kol<>0 then
str:=  '<tr><td class="sm_td" width=83 valign=top style="width:62.5pt;border:solid windowtext .5pt;border-top:none;mso-border-top-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt"><p class=MsoNormal>  '||c_rec1.fc_name||': '||'</p></td><td class="sm_td" width=555 colspan=7 valign=top style="width:416.05pt;border-top:none;';

DBMS_LOB.WRITEAPPEND (cc, LENGTH (str), str); --
str:= ' border-left:none;border-bottom:solid windowtext .5pt;border-right:solid windowtext .5pt;mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt"><p class=MsoNormal align="center"><![if !supportEmptyParas]>  Количество пациентов: '||kol||'<![endif]><o:p></o:p></p></td></tr>';

DBMS_LOB.WRITEAPPEND (cc, LENGTH (str), str); --

for c_rec2 in c2(data,c_rec1.fk_id) loop
if c_rec2.numput is null then c_rec2.numput:=0;
end if;
if c_rec2.ser is null then n:='&nbsp';
else n:='№';
end if;
sch:=sch+1;
str :=  '<tr><td class="sm_td" align="center">'||sch||'</td><td class="sm_td" align="left">'||c_rec2.fio||'</td><td class="sm_td">'||c_rec2.sex||'</td><td class="sm_td" align="center">'||c_rec2.numput||'</td><td class="sm_td" align="center">'||c_rec2.palata||'</td><td class="sm_td" align="center">'||c_rec2.pdata1||'</td><td class="sm_td" align="center">'||c_rec2.pdata2||'</td><td class="sm_td" width=200>'||c_rec2.org||n||c_rec2.ser||'</td></tr>';
DBMS_LOB.WRITEAPPEND (cc, LENGTH (str), str); --
end loop;
sumkol:=sumkol+kol;
end if;
end loop;
str:=' <tr><td class="sm_td" width=83 valign=top style="width:62.5pt;border:solid windowtext .5pt;';
str:=str||'border-top:none;mso-border-top-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt"><p class=MsoNormal>Итого</p></td>';
str:=str||'<td class="sm_td" width=555 colspan=7 valign=top style="width:416.05pt;border-top:none;border-left:none;border-bottom:solid windowtext .5pt;border-right:solid windowtext .5pt;mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt">';
str:=str||'<p class=MsoNormal align="center"><![if !supportEmptyParas]>'||sumkol||'<![endif]><o:p></o:p></p></td></tr>';
DBMS_LOB.WRITEAPPEND (cc, LENGTH (str), str); --
      str:='</table><p align="left">Отчёт составил:  _________________________'|| DO_VRACHFIO(vrach_id)||'</p>';
      DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
                                     --             Концовка
 str  := '</HTML>';
 DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    INSERT INTO TCLOBS
                (FC_CLOB)
         VALUES (cc)
      RETURNING FK_ID
          INTO nC;
  RETURN nc;
 end;

END; -- Package Body PKG_PLAN_PRYB
/

SHOW ERRORS;


