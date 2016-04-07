DROP PACKAGE BODY ASU.PKG_DATA_ZAGR
/

--
-- PKG_DATA_ZAGR  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_DATA_ZAGR" 
  IS
function GET_DATA_ZAGR (data in date,vrach_id in number,tip in varchar2)
return number
is
cursor c1 (data in date)
is
select get_palata_free_mesta(TROOM.fk_id,data) FREE, troom.fc_palata palata,TTIPROOM.FC_VID name FROM TROOM,TSRTIPROOM,TTIPROOM
WHERE TROOM.FK_ID=TSRTIPROOM.FK_PALATAID AND
      TSRTIPROOM.FK_VIDID=TTIPROOM.FK_ID
ORDER BY fc_palata;
 cursor c2 (data in date,roomid in number)
 is
select get_palata_free_mesta(TROOM.fk_id,data) FREE, troom.fc_palata palata,TTIPROOM.FC_VID name FROM TROOM,TSRTIPROOM,TTIPROOM
WHERE TROOM.FK_ID=TSRTIPROOM.FK_PALATAID AND
      TSRTIPROOM.FK_VIDID=TTIPROOM.FK_ID and
      ttiproom.fk_id=roomid
ORDER BY fc_palata;
 cursor c3 (data in date,korpid in number)
 is
select get_palata_free_mesta(TROOM.fk_id,data) FREE, troom.fc_palata palata,TTIPROOM.FC_VID name FROM TROOM,TSRTIPROOM,TTIPROOM
WHERE TROOM.FK_ID=TSRTIPROOM.FK_PALATAID AND
      TSRTIPROOM.FK_VIDID=TTIPROOM.FK_ID and
      troom.fk_korpid=korpid
ORDER BY fc_palata;
 cursor c4 (data in date,korpid in number,floorid in number)
 is
select get_palata_free_mesta(TROOM.fk_id,data) FREE, troom.fc_palata palata,TTIPROOM.FC_VID name FROM TROOM,TSRTIPROOM,TTIPROOM
WHERE TROOM.FK_ID=TSRTIPROOM.FK_PALATAID AND
      TSRTIPROOM.FK_VIDID=TTIPROOM.FK_ID and
      troom.fk_korpid=korpid and
      troom.fn_floor=floorid
ORDER BY fc_palata;
 cursor c5 (data in date,korpid in number,floorid in number,roomid in number)
 is
select get_palata_free_mesta(TROOM.fk_id,data) FREE, troom.fc_palata palata,TTIPROOM.FC_VID name FROM TROOM,TSRTIPROOM,TTIPROOM
WHERE TROOM.FK_ID=TSRTIPROOM.FK_PALATAID AND
      TSRTIPROOM.FK_VIDID=TTIPROOM.FK_ID and
      troom.fk_korpid=korpid and
      troom.fn_floor=floorid and
      ttiproom.fk_id=roomid
ORDER BY fc_palata;
 cursor c6 (data in date,korpid in number,roomid in number)
 is
select get_palata_free_mesta(TROOM.fk_id,data) FREE, troom.fc_palata palata,TTIPROOM.FC_VID name FROM TROOM,TSRTIPROOM,TTIPROOM
WHERE TROOM.FK_ID=TSRTIPROOM.FK_PALATAID AND
      TSRTIPROOM.FK_VIDID=TTIPROOM.FK_ID and
      troom.fk_korpid=korpid and
      ttiproom.fk_id=roomid
ORDER BY fc_palata;
  itog number;
  itogp number;
 stip varchar2(15);
 korpid number;
 floorid number;
 roomid number;
 nc number;  --   возвращаемое значение
 sch number;
 cc CLOB;    --   временный клоб
 str VARCHAR2 (32767);  --  временные строки HTML-кода
begin
itog:=0;
itogp:=0;
stip:=tip;
korpid:=to_number(substr(stip,1,instr(stip,',')-1));
--if korpid is null then korpid:=to_number(stip);
--end if;
stip:=substr(stip,instr(stip,',')+1,length(stip));
floorid:=to_number(substr(stip,1,instr(stip,',')-1));
stip:=substr(stip,instr(stip,',')+1,length(stip));
roomid:=to_number(substr(stip,1,instr(stip,',')+1));
if korpid is null then korpid:=0;
end if;
if floorid is null then floorid:=0;
end if;
if roomid is null then roomid:=0;
end if;
 DBMS_LOB.createtemporary(cc,true,DBMS_LOB.session);
str:=get_html_header(1);
  DBMS_LOB.WRITEAPPEND (cc, LENGTH (str), str); --                                        Заносим данные в конец клоба
  /*  str  :=  '<P ALIGN="CENTER"><B><font size="+1">Использование палат за период </font>';
    str  := str || ' с ' || TO_CHAR (data, 'dd/mm/yyyy') || ' по ' || TO_CHAR (data2, 'dd/mm/yyyy')||' по санаторию '||PKG_SMINI.READSTRING ('CONFIG', 'S_NAME', 'Не известен')||'<BR>';
  DBMS_LOB.WRITEAPPEND (cc, LENGTH (str), str); --                                        Заносим данные в конец клоба
  */
    str  := '<table align="center" width="100%" border="1" bordercolorlight="#000000" bordercolordark="#FFFFFF" bordercolor="#FFFFFF" bgcolor="#FFFFFF" cellpadding="0" cellspacing="0" class="sm_table">';

           --                                Шапка таблицы
    str  := str || '<tr><td class="sm_td" WIDTH=90 ALIGN="CENTER"><B>№ Палаты:</B></td><td class="sm_td" align="center"><B>№ Тип палаты:</B></td><td width="20%" class="sm_td" align="center"><b>Св.места:</b></td></tr>';
  DBMS_LOB.WRITEAPPEND (cc, LENGTH (str), str);
  --              По всему санаторию
  if korpid =0 and floorid =0 and roomid=0 then
           for c_rec in c1(data) loop
            str:='<tr><td   class="sm_td"  align="center">'||c_rec.palata||
     '</td><td  class="sm_td"  align="center">'||c_rec.name||
     '</td><td  class="sm_td"  align="center">'||c_rec.free||'</td></tr>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
           itog:=itog+1;
           itogp:=itogp+c_rec.free;
           end loop;
  end if;
  --              тип палаты по всему санаторию
  if korpid =0 and floorid =0 and roomid<>0 then
           for c_rec in c2(data,roomid) loop
            str:='<tr><td   class="sm_td"  align="center">'||c_rec.palata||
     '</td><td  class="sm_td"  align="center">'||c_rec.name||
     '</td><td  class="sm_td"  align="center">'||c_rec.free||'</td></tr>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
               itog:=itog+1;
           itogp:=itogp+c_rec.free;
           end loop;
 end if;
 --             все типы палат по корпусу
  if korpid <>0 and floorid =0 and roomid=0 then
           for c_rec in c3(data,korpid) loop
            str:='<tr><td   class="sm_td"  align="center">'||c_rec.palata||
     '</td><td  class="sm_td"  align="center">'||c_rec.name||
     '</td><td  class="sm_td"  align="center">'||c_rec.free||'</td></tr>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
               itog:=itog+1;
           itogp:=itogp+c_rec.free;
           end loop;
 end if;
 --            Все типы палат по этажу
 if korpid <>0 and floorid <>0 and roomid=0 then
           for c_rec in c4(data,korpid,floorid) loop
            str:='<tr><td   class="sm_td"  align="center">'||c_rec.palata||
     '</td><td  class="sm_td"  align="center">'||c_rec.name||
     '</td><td  class="sm_td"  align="center">'||c_rec.free||'</td></tr>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
               itog:=itog+1;
           itogp:=itogp+c_rec.free;
           end loop;
 end if;
--                     Тип палаты по этажу
 if korpid <>0 and floorid <>0 and roomid<>0 then
           for c_rec in c5(data,korpid,floorid,roomid) loop
            str:='<tr><td   class="sm_td"  align="center">'||c_rec.palata||
     '</td><td  class="sm_td"  align="center">'||c_rec.name||
     '</td><td  class="sm_td"  align="center">'||c_rec.free||'</td></tr>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
               itog:=itog+1;
           itogp:=itogp+c_rec.free;
           end loop;
 end if;
--                     Тип палаты по корпусу
 if korpid <>0 and floorid =0 and roomid<>0 then
           for c_rec in c6(data,korpid,roomid) loop
            str:='<tr><td   class="sm_td"  align="center">'||c_rec.palata||
     '</td><td  class="sm_td"  align="center">'||c_rec.name||
     '</td><td  class="sm_td"  align="center">'||c_rec.free||'</td></tr>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
               itog:=itog+1;
           itogp:=itogp+c_rec.free;
           end loop;
 end if;
            str:='<tr><td   class="sm_td"  align="center">'||'Итого:'||
     '</td><td  class="sm_td"  align="center">'||itog||
     '</td><td  class="sm_td"  align="center">'||itogp||'</td></tr>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
--      str  := '</tr><tr><td width=638 colspan=9 valign=top style="width:478.55pt;border:solid windowtext .5pt;';
  --    str  := str || 'border-top:none;mso-border-top-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt"><p class=MsoNormal ><b> Всего:&nbsp'||sch|| '</B></p></td></tr>';
--  DBMS_LOB.WRITEAPPEND (cc, LENGTH (str), str);
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

END; -- Package Specification PKG_DATA_ZAGR
/

SHOW ERRORS;


