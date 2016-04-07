DROP PACKAGE BODY ASU.PKG_PRIB_PERIOD
/

--
-- PKG_PRIB_PERIOD  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_PRIB_PERIOD" 
IS
  FUNCTION GET_PRIB_PERIOD (DATA1 IN DATE, DATA2 IN DATE, VRACH_ID IN NUMBER)
    RETURN NUMBER
  IS
    CURSOR c1
    IS
      SELECT fk_id, fc_name
        FROM tvid;
    CURSOR C2 (DATA1 IN DATE, DATA2 IN DATE, ID IN NUMBER)
    IS
      SELECT get_pacfio (tkarta.fk_id) fio,
             fc_put numput,
             TO_CHAR (fd_data1, 'dd/mm/yyyy') pdata1,
             TO_CHAR (fd_data2, 'dd/mm/yyyy') pdata2,
             FC_RABOTA RAB,
             TSROKY.FD_DATA2 - TSROKY.FD_DATA1 DNI,
             TKARTA.FN_SUM cena
        FROM tkarta, tsroky
       WHERE tsroky.fk_pacid = tkarta.fk_id
         AND tsroky.fk_pryb = 2
         AND tsroky.fd_data1 BETWEEN DATA1 AND DATA2
         AND tkarta.fk_kod2 = ID;
    CURSOR c3 (data1 IN DATE, data2 IN DATE, id IN NUMBER)
    IS
      SELECT SUM (TKARTA.FN_SUM), COUNT (FC_FAM)
        FROM tkarta, tsroky
       WHERE tsroky.fk_pacid = tkarta.fk_id
         AND tsroky.fk_pryb = 2
         AND tsroky.fd_data1 BETWEEN DATA1 AND DATA2
         AND tkarta.fk_kod2 = ID;
    F         NUMBER;
    nc        NUMBER;--   возвращаемое значение
    cc        CLOB;--   временный клоб
    str       VARCHAR2 (32767);--  временные строки HTML-кода
    sumcena   NUMBER;
    sch       NUMBER;
    itog      NUMBER;
    kol       NUMBER;
    n         VARCHAR2 (10);
  BEGIN
    DBMS_LOB.createtemporary (cc, TRUE, DBMS_LOB.session);
    str      := get_html_header (1);
    DBMS_LOB.WRITEAPPEND (cc, LENGTH (str), str);
--                                        Заносим данные в конец клоба
    sumcena  := 0;
    sch      := 0;
--                                    ШАПКА
    str      :=
      '<P ALIGN="CENTER"><B><font size="+1"> Сведения о прибывших за период с ' || TO_CHAR (data1, 'dd.mm.yyyy') || ' по ' || TO_CHAR (data2, 'dd.mm.yyyy') || ' по медучреждению "' ||
        PKG_SMINI.READSTRING ('CONFIG', 'S_NAME', 'Не известен') ||
        '"</font></B><BR>';
    DBMS_LOB.WRITEAPPEND (cc, LENGTH (str), str);
--                                        Заносим данные в конец клоба
--                                 Определение таблицы
    str      :=
      '<table align="center" width="100%" border="1" bordercolorlight="#000000" bordercolordark="#FFFFFF" bordercolor="#FFFFFF" bgcolor="#FFFFFF" cellpadding="0" cellspacing="0" class="sm_table">';
--                                Шапка таблицы
    str      :=
      str || '<tr><td class="sm_td" WIDTH=34 ALIGN="CENTER"><B>№:</B></td><td  class="sm_td" align="center" width=69 >' ||
        '<b>№ Путёвки:</b></td><td class="sm_td" width=180 align="center"><B>Ф.И.О.:</B></td><td width=160 class="sm_td"' ||
        ' width=160 align="center"><B>Место работы, должность:</B></td><td  class="sm_td" width=79' ||
        ' align="center"><B>С...</B></td><td class="sm_td" width=79 align="center"><B>Дни:</B></td>' ||
        '<td class="sm_td"  width=79 align="center"  ><B>ПО...</B></td><td  class="sm_td" width=95 align="center">' ||
        '<B>Цена:</B></td></tr>';
    DBMS_LOB.WRITEAPPEND (cc, LENGTH (str), str);
--                                     Заполнение таблицы
    FOR c_rec1 IN c1 LOOP
      OPEN c3 (data1, data2, c_rec1.fk_id);
      FETCH c3 INTO itog, F;
      CLOSE c3;
      IF F <> 0 THEN
          str  :=
            '<tr><td class="sm_td" align="center">&nbsp</td><td  class="sm_td" align="center">&nbsp</td><td class="sm_td" align="center">' || c_rec1.fc_name ||
              '</td><td  class="sm_td"  align="center">' ||
              '&nbsp' ||
              '</td><td class="sm_td" align="center">' ||
              '&nbsp' ||
              '</td><td class="sm_td" align="center">' ||
              '&nbsp' ||
              '</td><td class="sm_td" align="center">' ||
              '&nbsp' ||
              '</td><td align="center" class="sm_td" >' ||
              '&nbsp' ||
              '</td></tr>';
        DBMS_LOB.WRITEAPPEND (cc, LENGTH (str), str);
--
--
        FOR c_rec2 IN c2 (data1, data2, c_rec1.fk_id) LOOP
       if c_rec2.numput=0 then n:='&nbs';
       else n:=c_rec2.numput;
        end if;
          sch  := sch + 1;
          str  :=
            '<tr><td class="sm_td" align="center">' || sch || '</td><td  class="sm_td" align="center">' || n || '</td><td class="sm_td" align="left">' || c_rec2.fio ||
              '</td><td  class="sm_td"  align="center">' ||
              c_rec2.rab ||
              '</td><td class="sm_td" align="center">' ||
              c_rec2.pdata1 ||
              '</td><td class="sm_td" align="center">' ||
              c_rec2.dni ||
              '</td><td class="sm_td" align="center">' ||
              c_rec2.pdata2 ||
              '</td><td align="center" class="sm_td" >' ||
              c_rec2.cena ||
              '</td></tr>';
          DBMS_LOB.WRITEAPPEND (cc, LENGTH (str), str);
--
        END LOOP;
        sumCENA  := sumCENA + itog;
          str  :=
            '<tr><td class="sm_td" align="center">&nbsp</td><td  class="sm_td" align="center">&nbsp</td><td class="sm_td" align="center">' || '&nbsp' ||
              '</td><td  class="sm_td"  align="center">' ||
              '&nbsp' ||
              '</td><td class="sm_td" align="center">' ||
              '&nbsp' ||
              '</td><td class="sm_td" align="center">' ||
              '&nbsp' ||
              '</td><td class="sm_td" align="center">' ||
              'Итого:' ||
              '</td><td align="center" class="sm_td" >' ||
              itog ||
              '</td></tr>';
        DBMS_LOB.WRITEAPPEND (cc, LENGTH (str), str);
      END IF;
    END LOOP;
          str  :=
            '<tr><td class="sm_td" align="center">&nbsp</td><td  class="sm_td" align="center">&nbsp</td><td class="sm_td" align="center">' || '&nbsp' ||
              '</td><td  class="sm_td"  align="center">' ||
              '&nbsp' ||
              '</td><td class="sm_td" align="center">' ||
              '&nbsp' ||
              '</td><td class="sm_td" align="center">' ||
              '&nbsp' ||
              '</td><td class="sm_td" align="center">' ||
              'Итого:' ||
              '</td><td align="center" class="sm_td" >' ||
              Sumcena ||
              '</td></tr>';
    DBMS_LOB.WRITEAPPEND (cc, LENGTH (str), str);
        str      := '</table><p align="left">Всего путёвок:  ' || sch || '<br>в т/ч:';
    DBMS_LOB.WRITEAPPEND (cc, LENGTH (str), str);
    str:='<br>';
    DBMS_LOB.WRITEAPPEND (cc, LENGTH (str), str);


    FOR c_rec1 IN c1 LOOP
      OPEN c3 (data1, data2, c_rec1.fk_id);
      FETCH c3 INTO itog, F;
      CLOSE c3;
      if f is null then f:=0;
      end if;
    str:= c_rec1.fc_name||': '|| f || '<br>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    end loop;
    str:='</p>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    --------------------------
       str      := '<p align="left">Общая сумма: &nbsp ' ||get_moneystr( sumcena) || '<br>в т/ч:';
    DBMS_LOB.WRITEAPPEND (cc, LENGTH (str), str);
 -------------------------------------------------------
    str:='<br>';
    DBMS_LOB.WRITEAPPEND (cc, LENGTH (str), str);


    FOR c_rec1 IN c1 LOOP
      OPEN c3 (data1, data2, c_rec1.fk_id);
      FETCH c3 INTO itog, F;
      CLOSE c3;
      if itog is null then itog:=0;
      end if;
    str:= c_rec1.fc_name||':&nbsp '||Get_moneystr( itog) || '<br>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    end loop;
    str:='</p>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
--
    str      := '<p align="left">Отчёт составил:  _________________________' || DO_VRACHFIO (vrach_id) || '</p>';
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
END;-- Package Body PKG_PRIB_PERIOD
/

SHOW ERRORS;


