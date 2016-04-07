DROP PACKAGE BODY ASU.PKG_R_PLAN
/

--
-- PKG_R_PLAN  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_R_PLAN" 
 is-- Created by TimurLan

  FUNCTION DO_CALC_REPORT (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_VRACHID IN NUMBER)
  RETURN NUMBER
   IS-- Used in rPlan.dpr
    CURSOR cIn (pFK_USLVIDID in NUMBER,pFN_KOL in NUMBER,pFD_DATA in DATE) is
      SELECT COUNT(*) FN_COUNT
        FROM TKARTA,TSROKY
       WHERE TSROKY.FK_PRYB IN (2,4)
         AND TSROKY.FD_DATA1 BETWEEN pFD_DATA AND pFD_DATA+1-1/(24*60*60)
         AND TSROKY.FN_KOL=pFN_KOL
         AND TKARTA.FK_ID=TSROKY.FK_PACID
         AND TKARTA.FK_USLVIDID=pFK_USLVIDID;
    CURSOR cInPlan (pFK_USLVIDID in NUMBER,pFN_KOL in NUMBER,pFD_DATA in DATE) is
      SELECT COUNT(*) FN_COUNT
        FROM TKARTA,TSROKY
       WHERE TSROKY.FK_PRYB=1
         AND TSROKY.FD_DATA1 BETWEEN pFD_DATA AND pFD_DATA+1-1/(24*60*60)
         AND TSROKY.FN_KOL=pFN_KOL
         AND TKARTA.FK_ID=TSROKY.FK_PACID
         AND TKARTA.FK_USLVIDID=pFK_USLVIDID;
    CURSOR cOut (pFK_USLVIDID in NUMBER,pFN_KOL in NUMBER,pFD_DATA in DATE) is
      SELECT COUNT(*) FN_COUNT
        FROM TKARTA,TSROKY
       WHERE TSROKY.FK_PRYB IN (3,7)
         AND TSROKY.FD_DATA1 BETWEEN pFD_DATA AND pFD_DATA+1-1/(24*60*60)
         AND TSROKY.FN_KOL=pFN_KOL
         AND TKARTA.FK_ID=TSROKY.FK_PACID
         AND TKARTA.FK_USLVIDID=pFK_USLVIDID;
    CURSOR cOutPlan (pFK_USLVIDID in NUMBER,pFN_KOL in NUMBER,pFD_DATA in DATE) is
      SELECT COUNT(*) FN_COUNT
        FROM TKARTA,TSROKY
       WHERE TSROKY.FK_PRYB=1
         AND TSROKY.FD_DATA2 BETWEEN pFD_DATA AND pFD_DATA+1-1/(24*60*60)
         AND TSROKY.FN_KOL=pFN_KOL
         AND TKARTA.FK_ID=TSROKY.FK_PACID
         AND TKARTA.FK_USLVIDID=pFK_USLVIDID;
    CURSOR cKdn (pFK_USLVIDID in NUMBER,pFN_KOL in NUMBER,pFD_DATA in DATE) is
      SELECT COUNT(*)
        FROM (SELECT FK_PACID
                FROM TKARTA,TSROKY
               WHERE (((FD_DATA1 BETWEEN pFD_DATA AND pFD_DATA+1-1/(24*60*60)) AND pFD_DATA < FD_DATA3)
                  OR (pFD_DATA BETWEEN FD_DATA1 AND FD_DATA3)
                  OR ((FD_DATA3 BETWEEN pFD_DATA AND pFD_DATA+1-1/(24*60*60)) AND pFD_DATA > FD_DATA1))
                 AND FK_PRYB NOT IN (1,3,7)
                 AND TSROKY.FN_KOL=pFN_KOL
                 AND TKARTA.FK_ID=TSROKY.FK_PACID
                 AND TKARTA.FK_USLVIDID=pFK_USLVIDID
               UNION
              SELECT FK_PACID
                FROM TKARTA,TSROKY
               WHERE (((FD_DATA1 BETWEEN pFD_DATA AND pFD_DATA+1-1/(24*60*60)) AND pFD_DATA < FD_DATA3)
                  OR ((FD_DATA3 BETWEEN pFD_DATA AND pFD_DATA+1-1/(24*60*60)) AND pFD_DATA = FD_DATA1))
                 AND FK_PRYB IN (5,6)
                 AND TSROKY.FN_KOL=pFN_KOL
                 AND TKARTA.FK_ID=TSROKY.FK_PACID
                 AND TKARTA.FK_USLVIDID=pFK_USLVIDID);
    CURSOR cKdnPlan (pFK_USLVIDID in NUMBER,pFN_KOL in NUMBER,pFD_DATA in DATE) is
      SELECT COUNT(*)
        FROM (SELECT FK_PACID
                FROM TKARTA,TSROKY
               WHERE (((FD_DATA1 BETWEEN pFD_DATA AND pFD_DATA+1-1/(24*60*60)) AND pFD_DATA < FD_DATA3)
                  OR (pFD_DATA BETWEEN FD_DATA1 AND FD_DATA3)
                  OR ((FD_DATA3 BETWEEN pFD_DATA AND pFD_DATA+1-1/(24*60*60)) AND pFD_DATA > FD_DATA1))
                 AND FK_PRYB = 1
                 AND TSROKY.FN_KOL=pFN_KOL
                 AND TKARTA.FK_ID=TSROKY.FK_PACID
                 AND TKARTA.FK_USLVIDID=pFK_USLVIDID);
    CURSOR cInAll (pFN_KOL in NUMBER,pFD_DATA in DATE) is
      SELECT COUNT(*) FN_COUNT
        FROM TKARTA,TSROKY
       WHERE TSROKY.FK_PRYB IN (2,4)
         AND TSROKY.FD_DATA1 BETWEEN pFD_DATA AND pFD_DATA+1-1/(24*60*60)
         AND TSROKY.FN_KOL=pFN_KOL
         AND TKARTA.FK_ID=TSROKY.FK_PACID;
    CURSOR cInAllPlan (pFN_KOL in NUMBER,pFD_DATA in DATE) is
      SELECT COUNT(*) FN_COUNT
        FROM TKARTA,TSROKY
       WHERE TSROKY.FK_PRYB=1
         AND TSROKY.FD_DATA1 BETWEEN pFD_DATA AND pFD_DATA+1-1/(24*60*60)
         AND TSROKY.FN_KOL=pFN_KOL
         AND TKARTA.FK_ID=TSROKY.FK_PACID;
    CURSOR cOutAll (pFN_KOL in NUMBER,pFD_DATA in DATE) is
      SELECT COUNT(*) FN_COUNT
        FROM TKARTA,TSROKY
       WHERE TSROKY.FK_PRYB IN (3,7)
         AND TSROKY.FD_DATA1 BETWEEN pFD_DATA AND pFD_DATA+1-1/(24*60*60)
         AND TSROKY.FN_KOL=pFN_KOL
         AND TKARTA.FK_ID=TSROKY.FK_PACID;
    CURSOR cOutAllPlan (pFN_KOL in NUMBER,pFD_DATA in DATE) is
      SELECT COUNT(*) FN_COUNT
        FROM TKARTA,TSROKY
       WHERE TSROKY.FK_PRYB=1
         AND TSROKY.FD_DATA2 BETWEEN pFD_DATA AND pFD_DATA+1-1/(24*60*60)
         AND TSROKY.FN_KOL=pFN_KOL
         AND TKARTA.FK_ID=TSROKY.FK_PACID;
    CURSOR cKdnAll (pFN_KOL in NUMBER,pFD_DATA in DATE) is
      SELECT COUNT(*)
        FROM (SELECT FK_PACID
                FROM TKARTA,TSROKY
               WHERE (((FD_DATA1 BETWEEN pFD_DATA AND pFD_DATA+1-1/(24*60*60)) AND pFD_DATA < FD_DATA3)
                  OR (pFD_DATA BETWEEN FD_DATA1 AND FD_DATA3)
                  OR ((FD_DATA3 BETWEEN pFD_DATA AND pFD_DATA+1-1/(24*60*60)) AND pFD_DATA > FD_DATA1))
                 AND FK_PRYB NOT IN (1,3,7)
                 AND TSROKY.FN_KOL=pFN_KOL
                 AND TKARTA.FK_ID=TSROKY.FK_PACID
               UNION
              SELECT FK_PACID
                FROM TKARTA,TSROKY
               WHERE (((FD_DATA1 BETWEEN pFD_DATA AND pFD_DATA+1-1/(24*60*60)) AND pFD_DATA < FD_DATA3)
                  OR ((FD_DATA3 BETWEEN pFD_DATA AND pFD_DATA+1-1/(24*60*60)) AND pFD_DATA = FD_DATA1))
                 AND FK_PRYB IN (5,6)
                 AND TSROKY.FN_KOL=pFN_KOL
                 AND TKARTA.FK_ID=TSROKY.FK_PACID);
    CURSOR cKdnAllPlan (pFN_KOL in NUMBER,pFD_DATA in DATE) is
      SELECT COUNT(*)
        FROM (SELECT FK_PACID
                FROM TKARTA,TSROKY
               WHERE (((FD_DATA1 BETWEEN pFD_DATA AND pFD_DATA+1-1/(24*60*60)) AND pFD_DATA < FD_DATA3)
                  OR (pFD_DATA BETWEEN FD_DATA1 AND FD_DATA3)
                  OR ((FD_DATA3 BETWEEN pFD_DATA AND pFD_DATA+1-1/(24*60*60)) AND pFD_DATA > FD_DATA1))
                 AND FK_PRYB = 1
                 AND TSROKY.FN_KOL=pFN_KOL
                 AND TKARTA.FK_ID=TSROKY.FK_PACID);
    CURSOR cInSum (pFK_USLVIDID in NUMBER,pFN_KOL in NUMBER) is
      SELECT COUNT(*) FN_COUNT
        FROM TKARTA,TSROKY
       WHERE TSROKY.FK_PRYB IN (2,4)
         AND TSROKY.FD_DATA1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
         AND TSROKY.FN_KOL=pFN_KOL
         AND TKARTA.FK_ID=TSROKY.FK_PACID
         AND TKARTA.FK_USLVIDID=pFK_USLVIDID;
    CURSOR cInSumPlan (pFK_USLVIDID in NUMBER,pFN_KOL in NUMBER) is
      SELECT COUNT(*) FN_COUNT
        FROM TKARTA,TSROKY
       WHERE TSROKY.FK_PRYB=1
         AND TSROKY.FD_DATA1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
         AND TSROKY.FN_KOL=pFN_KOL
         AND TKARTA.FK_ID=TSROKY.FK_PACID
         AND TKARTA.FK_USLVIDID=pFK_USLVIDID;
    CURSOR cOutSum (pFK_USLVIDID in NUMBER,pFN_KOL in NUMBER) is
      SELECT COUNT(*) FN_COUNT
        FROM TKARTA,TSROKY
       WHERE TSROKY.FK_PRYB IN (3,7)
         AND TSROKY.FD_DATA1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
         AND TSROKY.FN_KOL=pFN_KOL
         AND TKARTA.FK_ID=TSROKY.FK_PACID
         AND TKARTA.FK_USLVIDID=pFK_USLVIDID;
    CURSOR cOutSumPlan (pFK_USLVIDID in NUMBER,pFN_KOL in NUMBER) is
      SELECT COUNT(*) FN_COUNT
        FROM TKARTA,TSROKY
       WHERE TSROKY.FK_PRYB=1
         AND TSROKY.FD_DATA2 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
         AND TSROKY.FN_KOL=pFN_KOL
         AND TKARTA.FK_ID=TSROKY.FK_PACID
         AND TKARTA.FK_USLVIDID=pFK_USLVIDID;
    CURSOR cInSumAll (pFN_KOL in NUMBER) is
      SELECT COUNT(*) FN_COUNT
        FROM TKARTA,TSROKY
       WHERE TSROKY.FK_PRYB IN (2,4)
         AND TSROKY.FD_DATA1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
         AND TSROKY.FN_KOL=pFN_KOL
         AND TKARTA.FK_ID=TSROKY.FK_PACID;
    CURSOR cInSumAllPlan (pFN_KOL in NUMBER) is
      SELECT COUNT(*) FN_COUNT
        FROM TKARTA,TSROKY
       WHERE TSROKY.FK_PRYB=1
         AND TSROKY.FD_DATA1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
         AND TSROKY.FN_KOL=pFN_KOL
         AND TKARTA.FK_ID=TSROKY.FK_PACID;
    CURSOR cOutSumAll (pFN_KOL in NUMBER) is
      SELECT COUNT(*) FN_COUNT
        FROM TKARTA,TSROKY
       WHERE TSROKY.FK_PRYB IN (3,7)
         AND TSROKY.FD_DATA1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
         AND TSROKY.FN_KOL=pFN_KOL
         AND TKARTA.FK_ID=TSROKY.FK_PACID;
    CURSOR cOutSumAllPlan (pFN_KOL in NUMBER) is
      SELECT COUNT(*) FN_COUNT
        FROM TKARTA,TSROKY
       WHERE TSROKY.FK_PRYB=1
         AND TSROKY.FD_DATA2 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
         AND TSROKY.FN_KOL=pFN_KOL
         AND TKARTA.FK_ID=TSROKY.FK_PACID;
    CURSOR cUslvid is SELECT FK_ID, FC_NAME FROM TUSLVID ORDER BY FK_ID;
    CURSOR cDays is
      SELECT TSROKY.FN_KOL
        FROM TKARTA,TSROKY
       WHERE TSROKY.FK_PRYB=1
         AND TSROKY.FD_DATA1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
         AND TKARTA.FK_ID=TSROKY.FK_PACID
         GROUP BY FN_KOL;
    TYPE TUsl IS TABLE OF cUslvid%ROWTYPE
              INDEX BY BINARY_INTEGER;
    TYPE TDays IS TABLE OF cDays%ROWTYPE
               INDEX BY BINARY_INTEGER;
    Usl TUsl;
    Days TDays;
    nC NUMBER;
    cC CLOB;
    str VARCHAR2 (32767);
    nTemp NUMBER;
    nColCount NUMBER;
    nRowCount NUMBER;
    Value1 NUMBER;
    Value2 NUMBER;
    Value3 NUMBER;
    Value4 NUMBER;
    Value5 NUMBER;
    Value6 NUMBER;
    FUNCTION GET_KDN (pFK_USLVIDID in NUMBER,pFN_KOL in NUMBER)
    RETURN NUMBER
     IS
      nTemp NUMBER;
      S NUMBER;
    BEGIN
      S:=0;
      FOR i IN 0..pFD_DATA2-pFD_DATA1 LOOP
        open cKdn(pFK_USLVIDID,pFN_KOL,pFD_DATA1+i);
        fetch cKdn into nTemp;
        close cKdn;
        S:=S+nTemp;
      END LOOP;
      RETURN S;
    END;
    FUNCTION GET_KDN_PLAN (pFK_USLVIDID in NUMBER,pFN_KOL in NUMBER)
    RETURN NUMBER
     IS
      nTemp NUMBER;
      S NUMBER;
    BEGIN
      S:=0;
      FOR i IN 0..pFD_DATA2-pFD_DATA1 LOOP
        open cKdnPlan(pFK_USLVIDID,pFN_KOL,pFD_DATA1+i);
        fetch cKdnPlan into nTemp;
        close cKdnPlan;
        S:=S+nTemp;
      END LOOP;
      RETURN S;
    END;
    FUNCTION GET_KDN_ALL (pFN_KOL in NUMBER)
    RETURN NUMBER
     IS
      nTemp NUMBER;
      S NUMBER;
    BEGIN
      S:=0;
      FOR i IN 0..pFD_DATA2-pFD_DATA1 LOOP
        open cKdnAll(pFN_KOL,pFD_DATA1+i);
        fetch cKdnAll into nTemp;
        close cKdnAll;
        S:=S+nTemp;
      END LOOP;
      RETURN S;
    END;
    FUNCTION GET_KDN_ALL_PLAN (pFN_KOL in NUMBER)
    RETURN NUMBER
     IS
      nTemp NUMBER;
      S NUMBER;
    BEGIN
      S:=0;
      FOR i IN 0..pFD_DATA2-pFD_DATA1 LOOP
        open cKdnAllPlan(pFN_KOL,pFD_DATA1+i);
        fetch cKdnAllPlan into nTemp;
        close cKdnAllPlan;
        S:=S+nTemp;
      END LOOP;
      RETURN S;
    END;
  BEGIN
    FOR p IN cUslvid LOOP
      Usl (cUslvid%ROWCOUNT) := p;
    END LOOP;
    FOR p IN cDays LOOP
      Days (cDays%ROWCOUNT) := p;
    END LOOP;

    INSERT INTO TCLOBS (FC_CLOB)
         VALUES (EMPTY_CLOB () )
      RETURNING FK_ID, FC_CLOB INTO nC, cC;
    DBMS_LOB.OPEN (cC, DBMS_LOB.LOB_READWRITE);

    str := PKG_HTML.GET_HEAD('excel','Сведения по санаторию "'||PKG_SMINI.READSTRING('CONFIG','S_NAME','Не известен')||'" за период с '||TO_CHAR(pFD_DATA1,'dd.mm.yyyy')||' по '||TO_CHAR(pFD_DATA2,'dd.mm.yyyy'),
                             null,'10.0',null,
                             null,null,null,
                             null,null,null,
                             '297','210','landscape',
                             '.39','.39','.39','.39',
                             null,null,null,'left',
                             null,null,null,null,
                             null,null,null);
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    str :='<BODY>'||
          '<P align="CENTER"><B>Планируемое и реальное движение пациентов по санаторию "' ||PKG_SMINI.READSTRING ('CONFIG', 'S_NAME', 'Не известен') ||'"</B><BR> за период с ' || TO_CHAR (pFD_DATA1, 'dd.mm.yyyy') || ' по ' || TO_CHAR (pFD_DATA2, 'dd.mm.yyyy') || '</P>'||
          '<table>'||
          '<TR>'||
          ' <TD rowspan=3 style=''border-right:solid windowtext 1.0pt''><p class=user><B>Дата:</B></p></TD>';
    FOR i IN 1 .. Usl.COUNT+1 LOOP
      if i <> Usl.COUNT+1 THEN
        str  := str || '<TD colspan='||Days.COUNT*6||' style=''border-right:solid windowtext 1.0pt''><p class=user><B>' || Usl(i).FC_NAME || '</B></p></TD>';
      else
        str  := str || '<TD colspan='||Days.COUNT*6||' style=''border-right:solid windowtext 1.0pt''><p class=user><B>Всего</B></p></TD>';
      end if;
    END LOOP;
    str := str || '</TR>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);

    nColCount := Usl.COUNT+1;
    nRowCount := pFD_DATA2-pFD_DATA1+1;

    str :='<TR>';
    FOR i IN 1 .. nColCount LOOP
      FOR j IN 1 .. Days.COUNT LOOP
        str  := str || '<TD colspan=6 style=''border-right:solid windowtext 1.0pt''><p class=user><B>' || Days(j).FN_KOL || '</B></p></TD>';
      END LOOP;
    END LOOP;
    str := str || '</TR>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);

    str :='<TR>';
    FOR i IN 1 .. nColCount LOOP
      FOR j IN 1 .. Days.COUNT LOOP
        str  := str || '<TD class=v style=''white-space:nowrap;vertical-align:bottom''><p class=user>Приб. (план)</p></TD>'||
                       '<TD class=v style=''white-space:nowrap;vertical-align:bottom;background:silver''><p class=user>Приб. (факт)</p></TD>'||
                       '<TD class=v style=''white-space:nowrap;vertical-align:bottom''><p class=user>Выб. (план)</p></TD>'||
                       '<TD class=v style=''white-space:nowrap;vertical-align:bottom;background:silver''><p class=user>Выб. (факт)</p></TD>'||
                       '<TD class=v style=''white-space:nowrap;vertical-align:bottom''><p class=user>ЧДН (план)</p></TD>'||
                       '<TD class=v style=''white-space:nowrap;vertical-align:bottom;border-right:solid windowtext 1.0pt;background:silver''><p class=user>ЧДН (факт)</p></TD>';
        /*str  := str || '<TD class=v style=''white-space:nowrap;vertical-align:bottom''><p class=user>Прибытие (план)</p></TD>'||
                       '<TD class=v style=''white-space:nowrap;vertical-align:bottom;background:silver''><p class=user>Прибытие (факт)</p></TD>'||
                       '<TD class=v style=''white-space:nowrap;vertical-align:bottom''><p class=user>Выбытие (план)</p></TD>'||
                       '<TD class=v style=''white-space:nowrap;vertical-align:bottom;background:silver''><p class=user>Выбытие (факт)</p></TD>'||
                       '<TD class=v style=''white-space:nowrap;vertical-align:bottom''><p class=user>Койко-дни (план)</p></TD>'||
                       '<TD class=v style=''white-space:nowrap;vertical-align:bottom;border-right:solid windowtext 1.0pt;background:silver''><p class=user>Койко-дни (факт)</p></TD>';*/
      END LOOP;
    END LOOP;
    str := str || '</TR>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);

    FOR p IN 0..nRowCount LOOP
      if p <> nRowCount then
        str := '<TR><TD style=''border-right:solid windowtext 1.0pt''><p class=user>'||TO_CHAR(pFD_DATA1+p,'dd.mm.yyyy')||'</p></TD>';
        FOR i IN 1 .. nColCount LOOP
          if i = nColCount THEN-- col "VSEGO"
            FOR j IN 1 .. Days.COUNT LOOP
              open cInAllPlan(Days(j).FN_KOL,pFD_DATA1+p);
              fetch cInAllPlan into Value1;
              close cInAllPlan;
              open cInAll(Days(j).FN_KOL,pFD_DATA1+p);
              fetch cInAll into Value2;
              close cInAll;
              open cOutAllPlan(Days(j).FN_KOL,pFD_DATA1+p);
              fetch cOutAllPlan into Value3;
              close cOutAllPlan;
              open cOutAll(Days(j).FN_KOL,pFD_DATA1+p);
              fetch cOutAll into Value4;
              close cOutAll;
              open cKdnAllPlan(Days(j).FN_KOL,pFD_DATA1+p);
              fetch cKdnAllPlan into Value5;
              close cKdnAllPlan;
              open cKdnAll(Days(j).FN_KOL,pFD_DATA1+p);
              fetch cKdnAll into Value6;
              close cKdnAll;
              str  := str || '<TD><p class=user>'|| PKG_R_ALLFUNC.RETURN_VALUE(TO_CHAR(value1)) ||'</p></TD>'||
                             '<TD style=''background:silver''><p class=user>'|| PKG_R_ALLFUNC.RETURN_VALUE(TO_CHAR(value2)) ||'</p></TD>'||
                             '<TD><p class=user>'|| PKG_R_ALLFUNC.RETURN_VALUE(TO_CHAR(value3)) ||'</p></TD>'||
                             '<TD style=''background:silver''><p class=user>'|| PKG_R_ALLFUNC.RETURN_VALUE(TO_CHAR(value4)) ||'</p></TD>'||
                             '<TD><p class=user>'|| PKG_R_ALLFUNC.RETURN_VALUE(TO_CHAR(value5)) ||'</p></TD>'||
                             '<TD style=''border-right:solid windowtext 1.0pt;background:silver''><p class=user>'|| PKG_R_ALLFUNC.RETURN_VALUE(TO_CHAR(value6)) ||'</p></TD>';
            END LOOP;
          else
            FOR j IN 1 .. Days.COUNT LOOP
              open cInPlan(Usl(i).FK_ID,Days(j).FN_KOL,pFD_DATA1+p);
              fetch cInPlan into Value1;
              close cInPlan;
              open cIn(Usl(i).FK_ID,Days(j).FN_KOL,pFD_DATA1+p);
              fetch cIn into Value2;
              close cIn;
              open cOutPlan(Usl(i).FK_ID,Days(j).FN_KOL,pFD_DATA1+p);
              fetch cOutPlan into Value3;
              close cOutPlan;
              open cOut(Usl(i).FK_ID,Days(j).FN_KOL,pFD_DATA1+p);
              fetch cOut into Value4;
              close cOut;
              open cKdnPlan(Usl(i).FK_ID,Days(j).FN_KOL,pFD_DATA1+p);
              fetch cKdnPlan into Value5;
              close cKdnPlan;
              open cKdn(Usl(i).FK_ID,Days(j).FN_KOL,pFD_DATA1+p);
              fetch cKdn into Value6;
              close cKdn;
              str  := str || '<TD><p class=user>'|| PKG_R_ALLFUNC.RETURN_VALUE(TO_CHAR(value1)) ||'</p></TD>'||
                             '<TD style=''background:silver''><p class=user>'|| PKG_R_ALLFUNC.RETURN_VALUE(TO_CHAR(value2)) ||'</p></TD>'||
                             '<TD><p class=user>'|| PKG_R_ALLFUNC.RETURN_VALUE(TO_CHAR(value3)) ||'</p></TD>'||
                             '<TD style=''background:silver''><p class=user>'|| PKG_R_ALLFUNC.RETURN_VALUE(TO_CHAR(value4)) ||'</p></TD>'||
                             '<TD><p class=user>'|| PKG_R_ALLFUNC.RETURN_VALUE(TO_CHAR(value5)) ||'</p></TD>'||
                             '<TD style=''border-right:solid windowtext 1.0pt;background:silver''><p class=user>'|| PKG_R_ALLFUNC.RETURN_VALUE(TO_CHAR(value6)) ||'</p></TD>';
            END LOOP;
          end if;
        END LOOP;
        str := str||'</TR>';
      else
        str := '<TR><TD style=''border-left:solid windowtext 1.0pt;border-top:solid windowtext 1.0pt;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt''><B>ВСЕГО:</B></TD>';
        FOR i IN 1 .. nColCount LOOP
          if i = nColCount THEN-- col "VSEGO"
            FOR j IN 1 .. Days.COUNT LOOP
              open cInSumAllPlan(Days(j).FN_KOL);
              fetch cInSumAllPlan into Value1;
              close cInSumAllPlan;
              open cInSumAll(Days(j).FN_KOL);
              fetch cInSumAll into Value2;
              close cInSumAll;
              open cOutSumAllPlan(Days(j).FN_KOL);
              fetch cOutSumAllPlan into Value3;
              close cOutSumAllPlan;
              open cOutSumAll(Days(j).FN_KOL);
              fetch cOutSumAll into Value4;
              close cOutSumAll;
              Value5 := GET_KDN_ALL_PLAN(Days(j).FN_KOL);
              Value6 := GET_KDN_ALL(Days(j).FN_KOL);
              str  := str || '<TD style=''border-bottom:solid windowtext 1.0pt;border-top:solid windowtext 1.0pt''><p class=user><B>'|| PKG_R_ALLFUNC.RETURN_VALUE(TO_CHAR(value1)) ||'</B></p></TD>'||
                             '<TD style=''border-bottom:solid windowtext 1.0pt;border-top:solid windowtext 1.0pt;background:silver''><p class=user><B>'|| PKG_R_ALLFUNC.RETURN_VALUE(TO_CHAR(value2)) ||'</B></p></TD>'||
                             '<TD style=''border-bottom:solid windowtext 1.0pt;border-top:solid windowtext 1.0pt''><p class=user><B>'|| PKG_R_ALLFUNC.RETURN_VALUE(TO_CHAR(value3)) ||'</B></p></TD>'||
                             '<TD style=''border-bottom:solid windowtext 1.0pt;border-top:solid windowtext 1.0pt;background:silver''><p class=user><B>'|| PKG_R_ALLFUNC.RETURN_VALUE(TO_CHAR(value4)) ||'</B></p></TD>'||
                             '<TD style=''border-bottom:solid windowtext 1.0pt;border-top:solid windowtext 1.0pt''><p class=user><B>'|| PKG_R_ALLFUNC.RETURN_VALUE(TO_CHAR(value5)) ||'</B></p></TD>'||
                             '<TD style=''border-bottom:solid windowtext 1.0pt;border-top:solid windowtext 1.0pt;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;background:silver''><p class=user><B>'|| PKG_R_ALLFUNC.RETURN_VALUE(TO_CHAR(value6)) ||'</B></p></TD>';
            END LOOP;
          else
            FOR j IN 1 .. Days.COUNT LOOP
              open cInSumPlan(Usl(i).FK_ID,Days(j).FN_KOL);
              fetch cInSumPlan into Value1;
              close cInSumPlan;
              open cInSum(Usl(i).FK_ID,Days(j).FN_KOL);
              fetch cInSum into Value2;
              close cInSum;
              open cOutSumPlan(Usl(i).FK_ID,Days(j).FN_KOL);
              fetch cOutSumPlan into Value3;
              close cOutSumPlan;
              open cOutSum(Usl(i).FK_ID,Days(j).FN_KOL);
              fetch cOutSum into Value4;
              close cOutSum;
              Value5 := GET_KDN_PLAN(Usl(i).FK_ID,Days(j).FN_KOL);
              Value6 := GET_KDN(Usl(i).FK_ID,Days(j).FN_KOL);
              str  := str || '<TD style=''border-bottom:solid windowtext 1.0pt;border-top:solid windowtext 1.0pt''><p class=user><B>'|| PKG_R_ALLFUNC.RETURN_VALUE(TO_CHAR(value1)) ||'</B></p></TD>'||
                             '<TD style=''border-bottom:solid windowtext 1.0pt;border-top:solid windowtext 1.0pt;background:silver''><p class=user><B>'|| PKG_R_ALLFUNC.RETURN_VALUE(TO_CHAR(value2)) ||'</B></p></TD>'||
                             '<TD style=''border-bottom:solid windowtext 1.0pt;border-top:solid windowtext 1.0pt''><p class=user><B>'|| PKG_R_ALLFUNC.RETURN_VALUE(TO_CHAR(value3)) ||'</B></p></TD>'||
                             '<TD style=''border-bottom:solid windowtext 1.0pt;border-top:solid windowtext 1.0pt;background:silver''><p class=user><B>'|| PKG_R_ALLFUNC.RETURN_VALUE(TO_CHAR(value4)) ||'</B></p></TD>'||
                             '<TD style=''border-bottom:solid windowtext 1.0pt;border-top:solid windowtext 1.0pt''><p class=user><B>'|| PKG_R_ALLFUNC.RETURN_VALUE(TO_CHAR(value5)) ||'</B></p></TD>'||
                             '<TD style=''border-bottom:solid windowtext 1.0pt;border-top:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;background:silver''><p class=user><B>'|| PKG_R_ALLFUNC.RETURN_VALUE(TO_CHAR(value6)) ||'</B></p></TD>';
            END LOOP;
          end if;
        END LOOP;
        str := str||'</TR>';
      end if;
      DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    END LOOP;

    str  := '</TABLE>(* ЧДН - человеко-дни)<BR><BR><P><B>Отчет составил_________________________' || DO_VRACHFIO (pFK_VRACHID)||
            '</B></P></BODY></HTML>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    DBMS_LOB.CLOSE (cC);
    RETURN nC;
  END;
end PKG_R_PLAN;
/

SHOW ERRORS;


