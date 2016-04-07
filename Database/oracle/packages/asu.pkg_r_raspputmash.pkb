DROP PACKAGE BODY ASU.PKG_R_RASPPUTMASH
/

--
-- PKG_R_RASPPUTMASH  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_R_RASPPUTMASH" 
 is-- Created by TimurLan
  PROCEDURE DO_FILL_MONTHS (nYear IN NUMBER) IS
    i NUMBER;
  BEGIN
    Month (1).sName   := 'Январь';
    Month (2).sName   := 'Февраль';
    Month (3).sName   := 'Март';
    Month (4).sName   := 'Апрель';
    Month (5).sName   := 'Май';
    Month (6).sName   := 'Июнь';
    Month (7).sName   := 'Июль';
    Month (8).sName   := 'Август';
    Month (9).sName   := 'Сентябрь';
    Month (10).sName  := 'Откябрь';
    Month (11).sName  := 'Ноябрь';
    Month (12).sName  := 'Декабрь';
    FOR i IN 1 .. 12 LOOP
      Month (i).dData1  := TO_DATE ('01.' || i || '.' || nYear, 'dd.mm.yyyy');
      IF i = 12 THEN
        Month (i).dData2  := TO_DATE ('31.' || i || '.' || nYear, 'dd.mm.yyyy');
      ELSE
        Month (i).dData2  := TO_DATE ('01.' || (i + 1) || '.' || nYear, 'dd.mm.yyyy') - 1;
      END IF;
    END LOOP;
  END;
  FUNCTION GET_COUNT_PUT_PERIOD (dData1 IN DATE, dData2 IN DATE)
  RETURN NUMBER
   IS
    CURSOR c IS
      SELECT /*+ rule*/COUNT (DISTINCT TPUTS.FC_PUT)
        FROM TSROKY, TKARTA, TPUTS
       WHERE FD_DATA1 BETWEEN dData1 AND dData2+1-1/(24*60*60)
         AND TSROKY.FK_PRYB = 2
         AND TKARTA.FK_ID = TSROKY.FK_PACID
         AND TPUTS.FK_PACID = TKARTA.FK_ID
         AND IS_FCPUT_MORE_ZERO(TPUTS.FC_PUT) > 0;
    i NUMBER;
  BEGIN
    OPEN c;
    FETCH c INTO i;
    CLOSE c;
    RETURN i;
  END;
  FUNCTION GET_COUNT_PUT_GROUP_PERIOD (dData1 IN DATE, dData2 IN DATE, nGroup IN NUMBER)
  RETURN NUMBER
   IS
    CURSOR c IS
      SELECT /*+ rule*/COUNT (DISTINCT TPUTS.FC_PUT)
        FROM TSROKY, TKARTA, TPUTS
       WHERE FD_DATA1 BETWEEN dData1 AND dData2+1-1/(24*60*60)
         AND TSROKY.FK_PRYB = 2
         AND TKARTA.FK_ID = TSROKY.FK_PACID
         AND TKARTA.FK_GROUPID = nGroup
         AND TPUTS.FK_PACID = TKARTA.FK_ID
         AND IS_FCPUT_MORE_ZERO(TPUTS.FC_PUT) > 0;
    i NUMBER;
  BEGIN
    OPEN c;
    FETCH c INTO i;
    CLOSE c;
    RETURN i;
  END;
  FUNCTION DO_CALC_REPORT (nMonth1 IN NUMBER, nMonth2 IN NUMBER, nYear IN NUMBER, pFK_VRACHID IN NUMBER)
  RETURN NUMBER
   IS-- Used in rRaspPutPred.dpr
    CURSOR c IS SELECT FC_NAME, FK_ID FROM TGROUP order by 1;
    cC CLOB;
    nC NUMBER;
    str VARCHAR2 (32767);
    i NUMBER;
    s VARCHAR2 (4000);
    d1 DATE;
    d2 DATE;
  BEGIN
    DO_FILL_MONTHS (nYear);
    INSERT INTO TCLOBS (FC_CLOB)
         VALUES (EMPTY_CLOB () )
      RETURNING FK_ID, FC_CLOB INTO nC, cC;
    DBMS_LOB.OPEN (cC, DBMS_LOB.LOB_READWRITE);
    str := PKG_HTML.GET_HEAD('excel','Сведения по фактическому заезду отдыхающих по санаторию "' ||PKG_SMINI.READSTRING ('CONFIG', 'S_NAME', 'Не известен') ||'"',
                             null,null,null,
                             null,null,null,
                             null,null,null,
                             null,null,'landscape',
                             '.78','.39','.78','.78',
                             null,null,null,'left',
                             null,null,null,null,
                             null,null,null);
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    s := Month (nMonth1).sName;
    if (nMonth1 = 3) OR (nMonth1 = 8) then
      s := s || 'а';
    else
      s := SUBSTR (s, 1, LENGTH (s) - 1) || 'я';
    end if;
    str := '<BODY><P ALIGN="CENTER"><B>Сведения по фактическому заезду отдыхающих по санаторию "' || PKG_SMINI.READSTRING ('CONFIG', 'S_NAME', 'Не известен') || '"</B><BR>'||
           'за период с ' || s || ' по ' || Month (nMonth2).sName || ' ' || nYear || ' года</P><BR>'||
           '<table>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    str  := '<TR><TD><B>Наименование предприятия:</B></TD>';
    FOR i IN nMonth1 .. nMonth2 LOOP
      str  := str || '<TD class=v><B>' || Month (i).sName || '</B></TD>';
    END LOOP;
    str  := str || '<TD class=v><B>Итого факт:</B></TD>'||
                   '<TD class=v><B>Итого план на ' || nYear || ' год:</B></TD></TR>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    PROGRESS_BAR.SETMAXVALUE (468);
    FOR p IN c LOOP
      str  := '<TR><TD class=user>' || c%ROWCOUNT || '. ' || p.FC_NAME || '</TD>';
      FOR i IN nMonth1 .. nMonth2 LOOP
        d1:=Month (i).dData1;
        d2:=Month (i).dData2;
        str  := str || '<TD>' || PKG_R_ALLFUNC.RETURN_VALUE( GET_COUNT_PUT_GROUP_PERIOD (d1, d2, p.FK_ID) ) || '</TD>';
        PROGRESS_BAR.SETSTROUT ('Подсчет путевок по ' || p.FC_NAME || ' за ' || Month (i).sName);
        PROGRESS_BAR.STEPIT;
      END LOOP;
      d1:=Month (nMonth1).dData1;
      d2:=Month (nMonth2).dData2;
      str  := str || '<TD><B>' || PKG_R_ALLFUNC.RETURN_VALUE( GET_COUNT_PUT_GROUP_PERIOD (d1, d2, p.FK_ID) ) || '</B></TD>'||
                     '<TD>&nbsp;</TD></TR>';
      DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    END LOOP;
    str  := '<TR><TD class=user><B>Итого:</B></TD>';
    FOR i IN nMonth1 .. nMonth2 LOOP
      d1:=Month (i).dData1;
      d2:=Month (i).dData2;
      str  := str || '<TD><B>' || GET_COUNT_PUT_PERIOD (d1, d2) || '</B></TD>';
      PROGRESS_BAR.SETSTROUT ('Подсчет общего количества путевок за ' || Month (i).sName);
      PROGRESS_BAR.STEPIT;
    END LOOP;
    d1:=Month (nMonth1).dData1;
    d2:=Month (nMonth2).dData2;
    str  := str || '<TD><B>' || GET_COUNT_PUT_PERIOD (d1, d2) || '</B></TD>'||
                   '<TD>&nbsp;</TD></TR>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    str  := '</TABLE><BR><P><B>Отчет составил: _________________________ ' || DO_VRACHFIO (pFK_VRACHID) || '</B></P></BODY></HTML>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    DBMS_LOB.CLOSE (cC);
    RETURN nC;
  END;
end PKG_R_RASPPUTMASH;
/

SHOW ERRORS;


