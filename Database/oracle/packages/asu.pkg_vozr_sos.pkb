DROP PACKAGE BODY ASU.PKG_VOZR_SOS
/

--
-- PKG_VOZR_SOS  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_VOZR_SOS" 
  IS
FUNCTION GET_VOZR_SOS(DATA1 IN DATE,DATA2 IN DATE,vrach_id in number)
RETURN NUMBER
  IS
NN NUMBER;
cursor intvoz
 is
select fc_name,fn_1,fn_2 from tvozr;
CURSOR C1(FN_1 NUMBER,FN_2 NUMBER,data1 in date,data2 in date)
  IS
SELECT COUNT(*) COUNTM FROM TKARTA,tsroky
WHERE (MONTHS_BETWEEN (tsroky.FD_DATa1, tkarta.fd_rojd) / 12)  BETWEEN FN_1 AND FN_2
      AND tkarta.FP_SEX=1 and
      tsroky.fk_pacid=tkarta.fk_id and
      tsroky.fd_data1 between data1 and data2 and
      tsroky.fk_pryb=3;

CURSOR C2(FN1 NUMBER,FN2 NUMBER,data1 in date,data2 in date)
  IS
SELECT COUNT(*) COUNTM FROM TKARTA,tsroky
WHERE (MONTHS_BETWEEN (tsroky.FD_DATa1, tkarta.fd_rojd) / 12)  BETWEEN FN1 AND FN2
      AND tkarta.FP_SEX=0 and
      tsroky.fk_pacid=tkarta.fk_id and
      tsroky.fd_data1 between data1 and data2 and
      tsroky.fk_pryb=3;
      --                         Объявление переменных
 nc number;  --   возвращаемое значение
 cc CLOB;    --   временный клоб
 str VARCHAR2 (32767);  --  временные строки HTML-кода
 ncountm number;
 ncountw number;
 sumcount number;
 fullcount number;
 sumcountw number;
 sumcountm number;
Begin
DBMS_LOB.createtemporary(cc,true,DBMS_LOB.session);
str:=get_html_header(0);
  DBMS_LOB.WRITEAPPEND (cc, LENGTH (str), str); --                                        Заносим данные в конец клоба
sumcount:=0;
fullcount:=0;
sumcountw :=0;
sumcountm:=0;
        --                                    ШАПКА
  str  :='<P ALIGN="CENTER"><B><font size="+1"> Санаторий "' ||
        PKG_SMINI.READSTRING ('CONFIG', 'S_NAME', 'Не известен') ||
        '"</font></B><BR>';
    str  := str || '<ALIGN="CENTER"><font size="+2"> "Отчет о возрастном составе лечившихся"  </font><br>';
    str  := str || 'за период с ' || TO_CHAR (data1, 'dd.mm.yyyy') || ' по ' || TO_CHAR (data2, 'dd.mm.yyyy');
  DBMS_LOB.WRITEAPPEND (cc, LENGTH (str), str); --                                        Заносим данные в конец клоба
      --                                 Определение таблицы
    str  := '<table align="center" width="100%" border="1" bordercolorlight="#000000" bordercolordark="#FFFFFF" bordercolor="#FFFFFF" bgcolor="#FFFFFF" cellpadding="0" cellspacing="0" class="sm_table" >';

           --                                Шапка таблицы
    str  := str || '<tr><td class="sm_td" align="center"><B>Возраст:</B></td><td class="sm_td" align="center"><b>Количество пациентов:</b></td><td class="sm_td" align="center"><b>Из них мужчин:</b></td><td class="sm_td" align="center"><b>Из них женщин:</b></td></tr>';
  DBMS_LOB.WRITEAPPEND (cc, LENGTH (str), str);
    --                                     Заполнение таблицы
for c_rec in intvoz loop
  open c1(c_rec.fn_1,c_rec.fn_2,data1,data2);
  fetch c1 into ncountm;
  close c1;
  open c2(c_rec.fn_1,c_rec.fn_2,data1,data2);
  fetch c2 into ncountw;
  close c2;
  sumcount:=ncountm+ncountw;
  sumcountw:=sumcountw+ncountw;
  sumcountm:=sumcountm+ncountm;
  fullcount:=sumcountm+sumcountw;
  str :=  '<TR align="left"><TD class="sm_td">'|| c_rec.fc_name ||'</TD><TD class="sm_td" align="center">'|| sumcount ||'</TD><TD class="sm_td" align="center">'|| ncountm ||'</TD><TD class="sm_td" align="center">'|| ncountw ||'</TD>';
  DBMS_LOB.WRITEAPPEND (cc, LENGTH (str), str);
  ncountm:=0;
  sumcount:=0;
  ncountw:=0;
  PROGRESS_BAR.SetStrOut('Расчёт: '||c_rec.fc_name);
  PROGRESS_BAR.STEPIT;

end loop;

       str :=
         '<TR align="left"><TD class="sm_td"><B>Итого:</B></TD><TD class="sm_td" align="center"><B>'|| fullcount ||'</B></TD><TD class="sm_td" align="center"><B>'|| sumcountm ||'</B></TD><TD class="sm_td" align="center"><B>'|| sumcountw ||'</B></TD></TR>';
      DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
      str:='</TABLE><p align="left">Отчёт составил:  _________________________'|| DO_VRACHFIO(vrach_id)||'</p>';
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
END;
END; -- Package Body PKG_VOZR_SOS
/

SHOW ERRORS;


