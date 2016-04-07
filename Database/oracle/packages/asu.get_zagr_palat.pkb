DROP PACKAGE BODY ASU.GET_ZAGR_PALAT
/

--
-- GET_ZAGR_PALAT  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."GET_ZAGR_PALAT" IS
function get_zagr_palat (data1 in date,data2 in date,vrach_id in number,tip_id in number)
return number
is
cursor c (data1 in date,data2 in date,tipid in number)
is
select get_pacfcpalata(tkarta.fk_id) palata,get_pacfio(tkarta.fk_id) FIO,to_char(fd_data1,'dd.mm.yyyy')
         pdata1,fd_data2-FD_DATA1 srok,to_char(fd_data2,'dd.mm.yyyy') PDATA2,TO_CHAR (FD_ROJD,'dd.mm.yyyy') rojd,
         fc_adr,fc_rabota from tkarta,tSROKY
where tkarta.fk_id=tsroky.fk_pacid and
      tsroky.fk_pryb=1 and
      tsroky.FD_data1 between data1 AND data2 AND
      tsroky.FD_data2 between data1 AND data2 AND
      GET_PAC_TIPROOMID(TKARTA.FK_ID)=tipid;
 nc number;  --   возвращаемое значение
 sch number;
 cc CLOB;    --   временный клоб
 str VARCHAR2 (32767);  --  временные строки HTML-кода
begin
sch:=1;
 DBMS_LOB.createtemporary(cc,true,DBMS_LOB.session);
str:=get_html_header(1);
DBMS_LOB.WRITEAPPEND (cc, LENGTH (str), str); --                                        Заносим данные в конец клоба
    str  := '<table align="center" width="100%" border="1" bordercolorlight="#000000" bordercolordark="#FFFFFF" bordercolor="#FFFFFF" bgcolor="#FFFFFF" cellpadding="0" cellspacing="0" class="sm_table">';
           --                                Шапка таблицы
    str  := str || '<tr><td class="sm_td" WIDTH=90 ALIGN="CENTER"><B>№ п.п.:</B></td><td class="sm_td" align="center"><B>№ Палаты:</B></td><td width="20%" class="sm_td" align="center"><b>Ф.И.О.:</b></td><td class="sm_td" align="center"><B>C...</B></td><td class="sm_td" align="center"><B>НА...</B></td><td class="sm_td" align="center"><B>ПО...</B></td><td class="sm_td" align="center"><B>Дата рожд:</B></td><td class="sm_td" align="center"><B>Домашний адрес:</B></td><td class="sm_td" align="center"><B>Место работы (должность):</B></td></tr>';
  DBMS_LOB.WRITEAPPEND (cc, LENGTH (str), str);
for c_rec in c(data1,data2,tipid) loop
str:='<tr><td  class="sm_td"  align="center">'||sch||
     '</td><td  class="sm_td"  align="center">'||c_rec.palata||
     '</td><td  class="sm_td"  align="center">'||c_rec.fio||
     '</td><td  class="sm_td"  align="center">'||c_rec.pdata1||
     '</td><td  class="sm_td"  align="center">'||c_rec.srok||
     '</td><td  class="sm_td"  align="center">'||c_rec.pdata2||
     '</td><td  class="sm_td"  align="center">'||c_rec.rojd||
     '</td><td  class="sm_td"  align="center">'||c_rec.fc_adr||
     '</td><td  class="sm_td"  align="center">'||c_rec.fc_rabota||'</td></tr>';
  DBMS_LOB.WRITEAPPEND (cc, LENGTH (str), str);
sch:=sch+1;
end loop;
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
END; -- Package Body GET_ZAGR_PALAT
/

SHOW ERRORS;


