DROP PACKAGE BODY ASU.PKG_DEZHUR
/

--
-- PKG_DEZHUR  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_DEZHUR" is

function GetSotrLIstInCell(pFK_DEZHURSPECID in number, pFD_DATE in Date) return varchar2 is
 sRes varchar2(4000);
begin
 sRes:='';
 for c in (   Select s.FC_FAM from ASU.Tdezhur d, ASU.Tdezhurspec ds, asu.tsotr S where
               d.fk_dezhurspecid = ds.fk_id
              and
               d.fd_date = TRUNC(pFD_DATE)
              and
               d.fk_dezhurspecid =  pFK_DEZHURSPECID
              and
               d.fk_vrachid = s.FK_ID )
   loop
    sRes:=sRes||c.fc_fam||'<br>';
   end loop;

   if length(sRes) > 1 then
     sRes := SubStr(sRes,1,length(sRes)-4);
   else
     sRes := '';
   end if;

   Return sRes;
end;
 --В отчет должна передаваться дата начала действия. Печатается от передаваемой даты до конца месяца.
function GET_GRAPHDEZH (pDate in date) return clob is
 CR               VARCHAR2(2):=CHR(13)||CHR(10);
 sTmp varchar2(32767);
 cl clob;
 mm varchar2(2);
 yyyy varchar2(4);
 Title varchar2(4000);
 FromDate date;
 ToDate date;
 CurDate date;
 DateColsInTable number := 5;
 TableCount number;
 CurTable number;
 pDays number;
 IsFirst boolean;
 IsFirstTable boolean := true;

 begin
  select TO_CHAR(pDate,'mm'), TO_CHAR(pDate,'yyyy') into mm, yyyy from DUAL;
  FromDate  := pDate; -- Собирать отчет С
  ToDate := add_months(TO_DATE('01.'||mm||'.'||yyyy,'DD.MM.YYYY'),1)-1 ; -- Собирать отчет по

  Title := 'График дежурств экстренной бригады ОКБ на '||TO_CHAR(pDate,'month')|| ' ' ||TO_CHAR(yyyy)||'г.';
  DBMS_LOB.CREATETEMPORARY(cl, TRUE, DBMS_LOB.call);
  sTmp:='<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">'||CR||
             '<html'||CR||
             '<head> '||CR||
             '<meta http-equiv=Content-Type content="text/html; charset=windows-1251"> '||CR||
             '<title>'||Title||'</title> '||
             '</head>'||CR||
             '<body>'||CR||
             '<div class=MsoNormal align=right style=''text-align:right''><span style=''font-size:14.0pt''>«УТВЕРЖДАЮ»</span></div>'||CR||
             '<div class=MsoNormal align=right style=''text-align:right''><span style=''font-size:14.0pt''>Зам. главного врача по медицинской части</span></div>'||CR||
             '<div class=MsoNormal align=right style=''text-align:right''><span style=''font-size:14.0pt''>________________В.Г. Шаляпин</span></div>'||CR||
             '<br>'||CR||
             '<br>'||CR||
             '<br>'||CR||
             '<br>'||CR||
             '<br>'||CR||
             '<br>'||CR||
             '<br>'||CR||
             '<br>'||CR||
             '<br>'||CR||
             '<div align=''center''  style=''font-size:20.0pt''><b>'||Title||'</b>'||CR||
             '<br clear=all style=''mso-special-character:line-break;page-break-before:always''>'||CR||
             '</div>'||CR;

   DBMS_LOB.writeappend(cl,LENGTH(sTmp),sTmp);
   --Сколько всего будет таблиц
   pDays := ToDate - FromDate + 1;
   Select (trunc((pDays)/DateColsInTable) + DECODE( mod((pDays),DateColsInTable),0,0,1)) into TableCount from DUAL;
   CurTable := 1;
   CurDate :=  FromDate;
   loop
    IsFirst := true;
    if CurTable > TableCount then
     exit;
    end if;

    if IsFirstTable then
     sTmp:='<div align=''center''  style=''font-size:14.0pt''><b>'||Title||'</b>'||CR;
     IsFirstTable := false;
    else
     sTmp:='<br><div align=''center''  style=''font-size:14.0pt''><b>'||Title||'</b>'||CR;
    end if;


    sTmp:=sTmp||'<table width="100%" border="1" align="center" bordercolordark="#FFFFFF" bordercolorlight="#000000" cellpadding="1" cellspacing="1">';
    --ШАпка
    sTmp := sTmp ||'<tr>'||CR||
                       '<td>'||'<b>Специальность</b>'||'</td>'||CR||
                       '<td WIDTH="16%"><b>'||TO_CHAR(CurDate + 0, 'DD.MM')||' '||TO_CHAR(CurDate + 0, 'dy')||'</b></td>'||CR||
                       '<td WIDTH="16%"><b>'||TO_CHAR(CurDate + 1, 'DD.MM')||' '||TO_CHAR(CurDate + 1, 'dy')||'</b></td>'||CR||
                       '<td WIDTH="16%"><b>'||TO_CHAR(CurDate + 2, 'DD.MM')||' '||TO_CHAR(CurDate + 2, 'dy')||'</b></td>'||CR||
                       '<td WIDTH="16%"><b>'||TO_CHAR(CurDate + 3, 'DD.MM')||' '||TO_CHAR(CurDate + 3, 'dy')||'</b></td>'||CR||
                       '<td WIDTH="16%"><b>'||TO_CHAR(CurDate + 4, 'DD.MM')||' '||TO_CHAR(CurDate + 4, 'dy')||'</b></td>'||CR||
                  '</tr>'||CR;

    --данные
    For c In (
              select ROWNUM as RN,
                     ASU.Tdezhurspec.FC_NAME,
                     PKG_DEZHUR.GetSotrLIstInCell(FK_ID, CurDate + 0) as d0,
                     PKG_DEZHUR.GetSotrLIstInCell(FK_ID, CurDate + 1) as d1,
                     PKG_DEZHUR.GetSotrLIstInCell(FK_ID, CurDate + 2) as d2,
                     PKG_DEZHUR.GetSotrLIstInCell(FK_ID, CurDate + 3) as d3,
                     PKG_DEZHUR.GetSotrLIstInCell(FK_ID, CurDate + 4) as d4,
                     (select DECODE(max(FN_COLOR),0,'white',NULL,'white','gray') from ASU.tdezhur t where  TRUNC(t.fd_date) = TRUNC(CurDate + 0) ) as cl0,
                     (select DECODE(max(FN_COLOR),0,'white',NULL,'white','gray') from ASU.tdezhur t where  TRUNC(t.fd_date) = TRUNC(CurDate + 1) ) as cl1,
                     (select DECODE(max(FN_COLOR),0,'white',NULL,'white','gray') from ASU.tdezhur t where  TRUNC(t.fd_date) = TRUNC(CurDate + 2) ) as cl2,
                     (select DECODE(max(FN_COLOR),0,'white',NULL,'white','gray') from ASU.tdezhur t where  TRUNC(t.fd_date) = TRUNC(CurDate + 3) ) as cl3,
                     (select DECODE(max(FN_COLOR),0,'white',NULL,'white','gray') from ASU.tdezhur t where  TRUNC(t.fd_date) = TRUNC(CurDate + 4) ) as cl4,


                     --DECODE(TO_CHAR(CurDate + 0,'d'),6,'gray',7,'gray','white') as cl0,
                     --DECODE(TO_CHAR(CurDate + 1,'d'),6,'gray',7,'gray','white')*/ as cl1,
                     --DECODE(TO_CHAR(CurDate + 2,'d'),6,'gray',7,'gray','white')*/ as cl2,
                     --DECODE(TO_CHAR(CurDate + 3,'d'),6,'gray',7,'gray','white')*/ as cl3,
                     --DECODE(TO_CHAR(CurDate + 4,'d'),6,'gray',7,'gray','white')*/ as cl4,

                     DECODE(ASU.Tdezhurspec.FN_STYLE,0,'n',1,'b',2,'i',3,'u') as stl

                from ASU.Tdezhurspec
              where FL_SHOW = 1
              order by FN_ORDER )
    loop
     sTmp := sTmp ||'<tr>'||CR;

     if c.stl <> 'n' Then
      sTmp := sTmp ||'<td><'||c.stl||'>'||c.fc_name||'</'||c.stl||'></td>'||CR;
     -- IsFirst := false;
     else
     -- sTmp := sTmp ||'<td>'||c.fc_name||'</td>'||CR;
      sTmp := sTmp ||'<td>'||c.fc_name||'</td>'||CR     ;
     end if;

     sTmp := sTmp ||'<td bgcolor="'||c.cl0||'">'||c.d0||'</td>'||CR||
                    '<td bgcolor="'||c.cl1||'">'||c.d1||'</td>'||CR||
                    '<td bgcolor="'||c.cl2||'">'||c.d2||'</td>'||CR||
                    '<td bgcolor="'||c.cl3||'">'||c.d3||'</td>'||CR||
                    '<td bgcolor="'||c.cl4||'">'||c.d4||'</td>'||CR||
                  '</tr>'||CR;
    end loop;
    sTmp := sTmp ||'</table>'||CR;
    DBMS_LOB.writeappend(cl,LENGTH(sTmp),sTmp);
    CurTable :=  CurTable + 1;
    CurDate :=  CurDate + DateColsInTable;
    --Нужно сбросить клоб и начать новую таблицу
   end loop;

   sTmp:='</body>'||CR||
         '</html>';
   DBMS_LOB.writeappend(cl,LENGTH(sTmp),sTmp);
  RETURN cl;
 end;
end PKG_DEZHUR;
/

SHOW ERRORS;


