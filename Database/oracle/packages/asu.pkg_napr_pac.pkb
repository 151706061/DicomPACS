DROP PACKAGE BODY ASU.PKG_NAPR_PAC
/

--
-- PKG_NAPR_PAC  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_NAPR_PAC" 
IS
function GET_NAPR_PAC (data1 in date,data2 in date,vrach_id in number)
RETURN NUMBER
 IS
CURSOR c
 is
select count(*) from tsroky,tkarta
where tkarta.fk_id=tsroky.fk_pacid and
      tsroky.fd_data1 between data1 AND data2 AND
      tsroky.fk_pryb =3 and
      tkarta.fl_ill=1;
 tc number;
 nc number;  --   возвращаемое значение
 cc CLOB;    --   временный клоб
 str VARCHAR2 (32767);  --  временные строки HTML-кода
  BEGIN

 DBMS_LOB.createtemporary(cc,true,DBMS_LOB.session);
 str:=GET_HTML_HEADER(0);
  DBMS_LOB.WRITEAPPEND (cc, LENGTH (str), str); --                                        Заносим данные в конец клоба
         --                                    ШАПКА
  str  :='<P ALIGN="CENTER"><B><font size="+1"> Медучреждение "' ||
        PKG_SMINI.READSTRING ('CONFIG', 'S_NAME', 'Не известен') ||
        '"</font></B><BR>';
    str  := str || '<ALIGN="CENTER"><font size="+2">"Отчет о пациентах, направленных в больницу"  </font><br>';
    str  := str || 'за период с ' || TO_CHAR (data1, 'dd.mm.yyyy') || ' по ' || TO_CHAR (data2, 'dd.mm.yyyy')||'<BR>';
  DBMS_LOB.WRITEAPPEND (cc, LENGTH (str), str); --                                        Заносим данные в конец клоба
str := '<BR><p align="left"><B>Количество больных направленных в больницу:</B>';
open c;
fetch c into tc;
close c;
str:= str||' '||tc||'</p><br>';
DBMS_LOB.WRITEAPPEND (cc, LENGTH (str), str);
      str:='<p align="left">Отчёт составил:  _________________________'|| DO_VRACHFIO(vrach_id)||'</p>';
      DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
 --             Концовка
 str  := '</html>';
 DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    INSERT INTO TCLOBS
                (FC_CLOB)
         VALUES (cc)
      RETURNING FK_ID
          INTO nC;
  RETURN nc;
 end;

END; -- Package Body PKG_NAPR_PAC
/

SHOW ERRORS;


