DROP PACKAGE BODY ASU.PKG_ZAGR_PALAT
/

--
-- PKG_ZAGR_PALAT  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_ZAGR_PALAT" 
IS
function GET_ZAGR_PALAT (data1 in date,data2 in date,vrach_id in number,tip in varchar2)
return number
is
cursor c1 (data1 in date,data2 in date,tipid in number)
is
select get_pacfcpalata(tkarta.fk_id) palata,get_pacfio(tkarta.fk_id) FIO,to_char(fd_data1,'dd/mm/yyyy')
         pdata1,fd_data2-FD_DATA1 srok,to_char(fd_data2,'dd/mm/yyyy') PDATA2,TO_CHAR (FD_ROJD,'dd/mm/yyyy') rojd,
         get_pacadress(tkarta.fk_id) adr,fc_rabota
 from tkarta,tSROKY
    where tkarta.fk_id=tsroky.fk_pacid and
         tsroky.fk_pryb=1 and
         tsroky.FD_data1 between data1 AND data2 AND
         tsroky.FD_data2 between data1 AND data2 AND
         GET_PAC_TIPROOMID(TKARTA.FK_ID)=tipid
  order by fio;
 cursor c2
 is
 select count(*) from ttiproom;
cursor c3(id in number)
is
select fc_vid from ttiproom
where fk_id=id;
 nc number;  --   возвращаемое значение
 tektip number;
 nametip varchar2(15);
 itog number;
 alltip number;
 tipid number;
 sch number;
 cc CLOB;    --   временный клоб
 str VARCHAR2 (32767);  --  временные строки HTML-кода
begin
sch:=1;
itog:=0;
 DBMS_LOB.createtemporary(cc,true,DBMS_LOB.session);
str:=get_html_header(1);
  DBMS_LOB.WRITEAPPEND (cc, LENGTH (str), str); --                                        Заносим данные в конец клоба
    str  :=  '<P ALIGN="CENTER"><B><font size="+1">Использование палат за период </font>';
    str  := str || ' с ' || TO_CHAR (data1, 'dd/mm/yyyy') || ' по ' || TO_CHAR (data2, 'dd/mm/yyyy')||' по санаторию '||PKG_SMINI.READSTRING ('CONFIG', 'S_NAME', 'Не известен')||'<BR>';
  DBMS_LOB.WRITEAPPEND (cc, LENGTH (str), str); --                                        Заносим данные в конец клоба
    str  := '<table align="center" width="100%" border="1" bordercolorlight="#000000" bordercolordark="#FFFFFF" bordercolor="#FFFFFF" bgcolor="#FFFFFF" cellpadding="0" cellspacing="0" class="sm_table">';

           --                                Шапка таблицы
    str  := str || '<tr><td class="sm_td" WIDTH=90 ALIGN="CENTER"><B>№ п.п.:</B></td><td class="sm_td" align="center"><B>№ Палаты:</B></td><td width="20%" class="sm_td" align="center"><b>Ф.И.О.:</b></td><td class="sm_td" align="center"><B>C...</B></td><td class="sm_td" align="center"><B>НА...</B></td><td class="sm_td" align="center"><B>ПО...</B></td><td class="sm_td" align="center"><B>Дата рожд:</B></td><td class="sm_td" align="center"><B>Домашний адрес:</B></td><td class="sm_td" align="center"><B>Место работы (должность):</B></td></tr>';
  DBMS_LOB.WRITEAPPEND (cc, LENGTH (str), str);

open c2;
fetch c2 into alltip;
close c2;
for i in 0..alltip loop
 tektip := to_number(i);
open c3(tektip);
fetch c3 into nametip;
close c3;
if instr(tip,tektip) <>0 then tipid:=tektip;
      str  := '</tr><tr><td width=638 colspan=9 valign=top style="width:478.55pt;border:solid windowtext .5pt;';
      str  := str || 'border-top:none;mso-border-top-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt"><p class=MsoNormal ><b>' ||nametip|| ':</B></p></td></tr>';
  DBMS_LOB.WRITEAPPEND (cc, LENGTH (str), str);

for c_rec in c1(data1,data2,tipid) loop
str:='<tr><td   class="sm_td"  align="center">'||sch||
     '</td><td  class="sm_td"  align="center">'||c_rec.palata||
     '</td><td  class="sm_td"  align="center">'||c_rec.fio||
     '</td><td  class="sm_td"  align="center">'||c_rec.pdata1||
     '</td><td  class="sm_td"  align="center">'||c_rec.srok||
     '</td><td  class="sm_td"  align="center">'||c_rec.pdata2||
     '</td><td  class="sm_td"  align="center">'||c_rec.rojd||
     '</td><td  class="sm_td"  align="center">'||c_rec.adr||
     '</td><td  class="sm_td"  align="center">'||c_rec.fc_rabota||'</td></tr>';
  DBMS_LOB.WRITEAPPEND (cc, LENGTH (str), str);
  PROGRESS_BAR.SetStrOut('Расчёт: '||c_rec.fio);
  PROGRESS_BAR.STEPIT;
itog:=itog+1;
sch:=sch+1;

end loop;
      str  := '</tr><tr><td width=638 colspan=9 valign=top style="width:478.55pt;border:solid windowtext .5pt;';
      str  := str || 'border-top:none;mso-border-top-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt"><p class=MsoNormal ><b> Итого: &nbsp'||itog|| '</B></p></td></tr>';
  DBMS_LOB.WRITEAPPEND (cc, LENGTH (str), str);
end if;
itog:=0;
end loop;
sch:=sch-1;
      str  := '</tr><tr><td width=638 colspan=9 valign=top style="width:478.55pt;border:solid windowtext .5pt;';
      str  := str || 'border-top:none;mso-border-top-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt"><p class=MsoNormal ><b> Всего:&nbsp'||sch|| '</B></p></td></tr>';
  DBMS_LOB.WRITEAPPEND (cc, LENGTH (str), str);
    str      := '</table><p align="left">Отчёт составил:  _________________________' || DO_VRACHFIO (vrach_id) || '</p>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
--             Концовка
    str      := '</HTML>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    INSERT INTO TCLOBS
                (FC_CLOB)
         VALUES (cc)
      RETURNING FK_ID
      INTO nC;
    RETURN nc;
  END;
END;
/

SHOW ERRORS;


