DROP PACKAGE BODY ASU.PKG_R_PLAN_STOL
/

--
-- PKG_R_PLAN_STOL  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_R_PLAN_STOL" 
 is-- Created by TimurLan

  FUNCTION DO_CALC_REPORT (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_VRACHID IN NUMBER)
  RETURN NUMBER
   IS-- Used in rPlanStol.dpr
    CURSOR cInStol (pFN_KOL in NUMBER,pFD_DATA in DATE) is
      SELECT COUNT(*) FN_COUNT
        FROM TKARTA,TSROKY
       WHERE TSROKY.FK_PRYB IN (2,4)
         AND TSROKY.FD_DATA1 BETWEEN pFD_DATA AND pFD_DATA+1-1/(24*60*60)
         AND TSROKY.FN_KOL=pFN_KOL
         AND TKARTA.FK_ID=TSROKY.FK_PACID
         AND TKARTA.FK_STOLID>0;
    CURSOR cInPlanStol (pFN_KOL in NUMBER,pFD_DATA in DATE) is
      SELECT COUNT(*) FN_COUNT
        FROM TKARTA,TSROKY
       WHERE TSROKY.FK_PRYB=1
         AND TSROKY.FD_DATA1 BETWEEN pFD_DATA AND pFD_DATA+1-1/(24*60*60)
         AND TSROKY.FN_KOL=pFN_KOL
         AND TKARTA.FK_ID=TSROKY.FK_PACID
         AND TKARTA.FK_STOLID>0;
    CURSOR cOutStol (pFN_KOL in NUMBER,pFD_DATA in DATE) is
      SELECT COUNT(*) FN_COUNT
        FROM TKARTA,TSROKY
       WHERE TSROKY.FK_PRYB IN (3,7)
         AND TSROKY.FD_DATA1 BETWEEN pFD_DATA AND pFD_DATA+1-1/(24*60*60)
         AND TSROKY.FN_KOL=pFN_KOL
         AND TKARTA.FK_ID=TSROKY.FK_PACID
         AND TKARTA.FK_STOLID>0;
    CURSOR cOutPlanStol (pFN_KOL in NUMBER,pFD_DATA in DATE) is
      SELECT COUNT(*) FN_COUNT
        FROM TKARTA,TSROKY
       WHERE TSROKY.FK_PRYB=1
         AND TSROKY.FD_DATA2 BETWEEN pFD_DATA AND pFD_DATA+1-1/(24*60*60)
         AND TSROKY.FN_KOL=pFN_KOL
         AND TKARTA.FK_ID=TSROKY.FK_PACID
         AND TKARTA.FK_STOLID>0;
    CURSOR cKdnStol (pFN_KOL in NUMBER,pFD_DATA in DATE) is
      SELECT COUNT(*)
        FROM (SELECT FK_PACID
                FROM TKARTA,TSROKY
               WHERE (((FD_DATA1 BETWEEN pFD_DATA AND pFD_DATA+1-1/(24*60*60)) AND pFD_DATA < FD_DATA3)
                  OR (pFD_DATA BETWEEN FD_DATA1 AND FD_DATA3)
                  OR ((FD_DATA3 BETWEEN pFD_DATA AND pFD_DATA+1-1/(24*60*60)) AND pFD_DATA > FD_DATA1))
                 AND FK_PRYB NOT IN (1,3,7)
                 AND TSROKY.FN_KOL=pFN_KOL
                 AND TKARTA.FK_ID=TSROKY.FK_PACID
                 AND TKARTA.FK_STOLID>0
               UNION
              SELECT FK_PACID
                FROM TKARTA,TSROKY
               WHERE (((FD_DATA1 BETWEEN pFD_DATA AND pFD_DATA+1-1/(24*60*60)) AND pFD_DATA < FD_DATA3)
                  OR ((FD_DATA3 BETWEEN pFD_DATA AND pFD_DATA+1-1/(24*60*60)) AND pFD_DATA = FD_DATA1))
                 AND FK_PRYB IN (5,6)
                 AND TSROKY.FN_KOL=pFN_KOL
                 AND TKARTA.FK_ID=TSROKY.FK_PACID
                 AND TKARTA.FK_STOLID>0);
    CURSOR cKdnPlanStol (pFN_KOL in NUMBER,pFD_DATA in DATE) is
      SELECT COUNT(*)
        FROM (SELECT FK_PACID
                FROM TKARTA,TSROKY
               WHERE (((FD_DATA1 BETWEEN pFD_DATA AND pFD_DATA+1-1/(24*60*60)) AND pFD_DATA < FD_DATA3)
                  OR (pFD_DATA BETWEEN FD_DATA1 AND FD_DATA3)
                  OR ((FD_DATA3 BETWEEN pFD_DATA AND pFD_DATA+1-1/(24*60*60)) AND pFD_DATA > FD_DATA1))
                 AND FK_PRYB = 1
                 AND TSROKY.FN_KOL=pFN_KOL
                 AND TKARTA.FK_ID=TSROKY.FK_PACID
                 AND TKARTA.FK_STOLID>0);
    CURSOR cInAllStol (pFD_DATA in DATE) is
      SELECT COUNT(*) FN_COUNT
        FROM TKARTA,TSROKY
       WHERE TSROKY.FK_PRYB IN (2,4)
         AND TSROKY.FD_DATA1 BETWEEN pFD_DATA AND pFD_DATA+1-1/(24*60*60)
         AND TKARTA.FK_ID=TSROKY.FK_PACID
         AND TKARTA.FK_STOLID>0;
    CURSOR cInAllPlanStol (pFD_DATA in DATE) is
      SELECT COUNT(*) FN_COUNT
        FROM TKARTA,TSROKY
       WHERE TSROKY.FK_PRYB=1
         AND TSROKY.FD_DATA1 BETWEEN pFD_DATA AND pFD_DATA+1-1/(24*60*60)
         AND TKARTA.FK_ID=TSROKY.FK_PACID
         AND TKARTA.FK_STOLID>0;
    CURSOR cOutAllStol (pFD_DATA in DATE) is
      SELECT COUNT(*) FN_COUNT
        FROM TKARTA,TSROKY
       WHERE TSROKY.FK_PRYB IN (3,7)
         AND TSROKY.FD_DATA1 BETWEEN pFD_DATA AND pFD_DATA+1-1/(24*60*60)
         AND TKARTA.FK_ID=TSROKY.FK_PACID
         AND TKARTA.FK_STOLID>0;
    CURSOR cOutAllPlanStol (pFD_DATA in DATE) is
      SELECT COUNT(*) FN_COUNT
        FROM TKARTA,TSROKY
       WHERE TSROKY.FK_PRYB=1
         AND TSROKY.FD_DATA2 BETWEEN pFD_DATA AND pFD_DATA+1-1/(24*60*60)
         AND TKARTA.FK_ID=TSROKY.FK_PACID
         AND TKARTA.FK_STOLID>0;
    CURSOR cKdnAllStol (pFD_DATA in DATE) is
      SELECT COUNT(*)
        FROM (SELECT FK_PACID
                FROM TKARTA,TSROKY
               WHERE (((FD_DATA1 BETWEEN pFD_DATA AND pFD_DATA+1-1/(24*60*60)) AND pFD_DATA < FD_DATA3)
                  OR (pFD_DATA BETWEEN FD_DATA1 AND FD_DATA3)
                  OR ((FD_DATA3 BETWEEN pFD_DATA AND pFD_DATA+1-1/(24*60*60)) AND pFD_DATA > FD_DATA1))
                 AND FK_PRYB NOT IN (1,3,7)
                 AND TKARTA.FK_ID=TSROKY.FK_PACID
                 AND TKARTA.FK_STOLID>0
               UNION
              SELECT FK_PACID
                FROM TKARTA,TSROKY
               WHERE (((FD_DATA1 BETWEEN pFD_DATA AND pFD_DATA+1-1/(24*60*60)) AND pFD_DATA < FD_DATA3)
                  OR ((FD_DATA3 BETWEEN pFD_DATA AND pFD_DATA+1-1/(24*60*60)) AND pFD_DATA = FD_DATA1))
                 AND FK_PRYB IN (5,6)
                 AND TKARTA.FK_ID=TSROKY.FK_PACID
                 AND TKARTA.FK_STOLID>0);
    CURSOR cKdnAllPlanStol (pFD_DATA in DATE) is
      SELECT COUNT(*)
        FROM (SELECT FK_PACID
                FROM TKARTA,TSROKY
               WHERE (((FD_DATA1 BETWEEN pFD_DATA AND pFD_DATA+1-1/(24*60*60)) AND pFD_DATA < FD_DATA3)
                  OR (pFD_DATA BETWEEN FD_DATA1 AND FD_DATA3)
                  OR ((FD_DATA3 BETWEEN pFD_DATA AND pFD_DATA+1-1/(24*60*60)) AND pFD_DATA > FD_DATA1))
                 AND FK_PRYB = 1
                 AND TKARTA.FK_ID=TSROKY.FK_PACID
                 AND TKARTA.FK_STOLID>0);
    CURSOR cInSumStol (pFN_KOL in NUMBER) is
      SELECT COUNT(*) FN_COUNT
        FROM TKARTA,TSROKY
       WHERE TSROKY.FK_PRYB IN (2,4)
         AND TSROKY.FD_DATA1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
         AND TSROKY.FN_KOL=pFN_KOL
         AND TKARTA.FK_ID=TSROKY.FK_PACID
         AND TKARTA.FK_STOLID>0;
    CURSOR cInSumPlanStol (pFN_KOL in NUMBER) is
      SELECT COUNT(*) FN_COUNT
        FROM TKARTA,TSROKY
       WHERE TSROKY.FK_PRYB=1
         AND TSROKY.FD_DATA1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
         AND TSROKY.FN_KOL=pFN_KOL
         AND TKARTA.FK_ID=TSROKY.FK_PACID
         AND TKARTA.FK_STOLID>0;
    CURSOR cOutSumStol (pFN_KOL in NUMBER) is
      SELECT COUNT(*) FN_COUNT
        FROM TKARTA,TSROKY
       WHERE TSROKY.FK_PRYB IN (3,7)
         AND TSROKY.FD_DATA1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
         AND TSROKY.FN_KOL=pFN_KOL
         AND TKARTA.FK_ID=TSROKY.FK_PACID
         AND TKARTA.FK_STOLID>0;
    CURSOR cOutSumPlanStol (pFN_KOL in NUMBER) is
      SELECT COUNT(*) FN_COUNT
        FROM TKARTA,TSROKY
       WHERE TSROKY.FK_PRYB=1
         AND TSROKY.FD_DATA2 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
         AND TSROKY.FN_KOL=pFN_KOL
         AND TKARTA.FK_ID=TSROKY.FK_PACID
         AND TKARTA.FK_STOLID>0;
    CURSOR cInSumAllStol is
      SELECT COUNT(*) FN_COUNT
        FROM TKARTA,TSROKY
       WHERE TSROKY.FK_PRYB IN (2,4)
         AND TSROKY.FD_DATA1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
         AND TKARTA.FK_ID=TSROKY.FK_PACID
         AND TKARTA.FK_STOLID>0;
    CURSOR cInSumAllPlanStol is
      SELECT COUNT(*) FN_COUNT
        FROM TKARTA,TSROKY
       WHERE TSROKY.FK_PRYB=1
         AND TSROKY.FD_DATA1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
         AND TKARTA.FK_ID=TSROKY.FK_PACID
         AND TKARTA.FK_STOLID>0;
    CURSOR cOutSumAllStol is
      SELECT COUNT(*) FN_COUNT
        FROM TKARTA,TSROKY
       WHERE TSROKY.FK_PRYB IN (3,7)
         AND TSROKY.FD_DATA1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
         AND TKARTA.FK_ID=TSROKY.FK_PACID
         AND TKARTA.FK_STOLID>0;
    CURSOR cOutSumAllPlanStol is
      SELECT COUNT(*) FN_COUNT
        FROM TKARTA,TSROKY
       WHERE TSROKY.FK_PRYB=1
         AND TSROKY.FD_DATA2 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
         AND TKARTA.FK_ID=TSROKY.FK_PACID
         AND TKARTA.FK_STOLID>0;
    --CURSOR cUslvid is SELECT FK_ID, FC_NAME FROM TUSLVID ORDER BY FK_ID;
    CURSOR cDays is
      SELECT TSROKY.FN_KOL
        FROM TKARTA,TSROKY
       WHERE TSROKY.FK_PRYB=1
         AND TSROKY.FD_DATA1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
         AND TKARTA.FK_ID=TSROKY.FK_PACID
         AND TKARTA.FK_STOLID>0
         GROUP BY FN_KOL;
    /*TYPE TUsl IS TABLE OF cUslvid%ROWTYPE
              INDEX BY BINARY_INTEGER;*/
    TYPE TDays IS TABLE OF cDays%ROWTYPE
               INDEX BY BINARY_INTEGER;
    --Usl TUsl;
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
    FUNCTION GET_KDN_STOL (pFN_KOL in NUMBER)
    RETURN NUMBER
     IS
      nTemp NUMBER;
      S NUMBER;
    BEGIN
      S:=0;
      FOR i IN 0..pFD_DATA2-pFD_DATA1 LOOP
        open cKdnStol(pFN_KOL,pFD_DATA1+i);
        fetch cKdnStol into nTemp;
        close cKdnStol;
        S:=S+nTemp;
      END LOOP;
      RETURN S;
    END;
    FUNCTION GET_KDN_PLAN_STOL (pFN_KOL in NUMBER)
    RETURN NUMBER
     IS
      nTemp NUMBER;
      S NUMBER;
    BEGIN
      S:=0;
      FOR i IN 0..pFD_DATA2-pFD_DATA1 LOOP
        open cKdnPlanStol(pFN_KOL,pFD_DATA1+i);
        fetch cKdnPlanStol into nTemp;
        close cKdnPlanStol;
        S:=S+nTemp;
      END LOOP;
      RETURN S;
    END;
    FUNCTION GET_KDN_ALL_STOL
    RETURN NUMBER
     IS
      nTemp NUMBER;
      S NUMBER;
    BEGIN
      S:=0;
      FOR i IN 0..pFD_DATA2-pFD_DATA1 LOOP
        open cKdnAllStol(pFD_DATA1+i);
        fetch cKdnAllStol into nTemp;
        close cKdnAllStol;
        S:=S+nTemp;
      END LOOP;
      RETURN S;
    END;
    FUNCTION GET_KDN_ALL_PLAN_STOL
    RETURN NUMBER
     IS
      nTemp NUMBER;
      S NUMBER;
    BEGIN
      S:=0;
      FOR i IN 0..pFD_DATA2-pFD_DATA1 LOOP
        open cKdnAllPlanStol(pFD_DATA1+i);
        fetch cKdnAllPlanStol into nTemp;
        close cKdnAllPlanStol;
        S:=S+nTemp;
      END LOOP;
      RETURN S;
    END;
  BEGIN
    /*FOR p IN cUslvid LOOP
      Usl (cUslvid%ROWCOUNT) := p;
    END LOOP;*/
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
          '<P align="CENTER"><B>Планируемое и реальное движение пациентов по столовой санатория "' ||PKG_SMINI.READSTRING ('CONFIG', 'S_NAME', 'Не известен') ||'"</B><BR> за период с ' || TO_CHAR (pFD_DATA1, 'dd.mm.yyyy') || ' по ' || TO_CHAR (pFD_DATA2, 'dd.mm.yyyy') || '</P>'||
          '<table>'||
          '<TR>'||
          ' <TD rowspan=2 style=''border-right:solid windowtext 1.0pt''><p class=user><B>Дата:</B></p></TD>';
    /*FOR i IN 1 .. Usl.COUNT+1 LOOP
      if i <> Usl.COUNT+1 THEN
        str  := str || '<TD colspan='||Days.COUNT*6||' style=''border-right:solid windowtext 1.0pt''><p class=user><B>' || Usl(i).FC_NAME || '</B></p></TD>';
      else
        str  := str || '<TD colspan='||Days.COUNT*6||' style=''border-right:solid windowtext 1.0pt''><p class=user><B>Всего</B></p></TD>';
      end if;
    END LOOP;
    str := str || '</TR>';*/
    --DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);

    nColCount := Days.COUNT+1;
    nRowCount := pFD_DATA2-pFD_DATA1+1;

    --str :='<TR>';
    FOR i IN 1 .. nColCount LOOP
      if i <> nColCount THEN
        str  := str || '<TD colspan=6 style=''border-right:solid windowtext 1.0pt''><p class=user><B>' || Days(i).FN_KOL || '</B></p></TD>';
      else
        str  := str || '<TD colspan=6 style=''border-right:solid windowtext 1.0pt''><p class=user><B>Всего</B></p></TD>';
      end if;
    END LOOP;
    str := str || '</TR>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);

    str :='<TR>';
    FOR i IN 1 .. nColCount LOOP
      str  := str || '<TD class=v style=''white-space:nowrap;vertical-align:bottom''><p class=user>Приб. (план)</p></TD>'||
                     '<TD class=v style=''white-space:nowrap;vertical-align:bottom;background:silver''><p class=user>Приб. (факт)</p></TD>'||
                     '<TD class=v style=''white-space:nowrap;vertical-align:bottom''><p class=user>Выб. (план)</p></TD>'||
                     '<TD class=v style=''white-space:nowrap;vertical-align:bottom;background:silver''><p class=user>Выб. (факт)</p></TD>'||
                     '<TD class=v style=''white-space:nowrap;vertical-align:bottom''><p class=user>ЧДН (план)</p></TD>'||
                     '<TD class=v style=''white-space:nowrap;vertical-align:bottom;border-right:solid windowtext 1.0pt;background:silver''><p class=user>ЧДН (факт)</p></TD>';
    END LOOP;
    str := str || '</TR>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);

    FOR p IN 0..nRowCount LOOP
      if p <> nRowCount then
        str := '<TR><TD style=''border-right:solid windowtext 1.0pt''><p class=user>'||TO_CHAR(pFD_DATA1+p,'dd.mm.yyyy')||'</p></TD>';
        FOR i IN 1 .. nColCount LOOP
          if i = nColCount THEN-- col "VSEGO"
            open cInAllPlanStol(pFD_DATA1+p);
            fetch cInAllPlanStol into Value1;
            close cInAllPlanStol;
            open cInAllStol(pFD_DATA1+p);
            fetch cInAllStol into Value2;
            close cInAllStol;
            open cOutAllPlanStol(pFD_DATA1+p);
            fetch cOutAllPlanStol into Value3;
            close cOutAllPlanStol;
            open cOutAllStol(pFD_DATA1+p);
            fetch cOutAllStol into Value4;
            close cOutAllStol;
            open cKdnAllPlanStol(pFD_DATA1+p);
            fetch cKdnAllPlanStol into Value5;
            close cKdnAllPlanStol;
            open cKdnAllStol(pFD_DATA1+p);
            fetch cKdnAllStol into Value6;
            close cKdnAllStol;
            str  := str || '<TD><p class=user>'|| PKG_R_ALLFUNC.RETURN_VALUE(TO_CHAR(value1)) ||'</p></TD>'||
                           '<TD style=''background:silver''><p class=user>'|| PKG_R_ALLFUNC.RETURN_VALUE(TO_CHAR(value2)) ||'</p></TD>'||
                           '<TD><p class=user>'|| PKG_R_ALLFUNC.RETURN_VALUE(TO_CHAR(value3)) ||'</p></TD>'||
                           '<TD style=''background:silver''><p class=user>'|| PKG_R_ALLFUNC.RETURN_VALUE(TO_CHAR(value4)) ||'</p></TD>'||
                           '<TD><p class=user>'|| PKG_R_ALLFUNC.RETURN_VALUE(TO_CHAR(value5)) ||'</p></TD>'||
                           '<TD style=''border-right:solid windowtext 1.0pt;background:silver''><p class=user>'|| PKG_R_ALLFUNC.RETURN_VALUE(TO_CHAR(value6)) ||'</p></TD>';
          else
            open cInPlanStol(Days(i).FN_KOL,pFD_DATA1+p);
            fetch cInPlanStol into Value1;
            close cInPlanStol;
            open cInStol(Days(i).FN_KOL,pFD_DATA1+p);
            fetch cInStol into Value2;
            close cInStol;
            open cOutPlanStol(Days(i).FN_KOL,pFD_DATA1+p);
            fetch cOutPlanStol into Value3;
            close cOutPlanStol;
            open cOutStol(Days(i).FN_KOL,pFD_DATA1+p);
            fetch cOutStol into Value4;
            close cOutStol;
            open cKdnPlanStol(Days(i).FN_KOL,pFD_DATA1+p);
            fetch cKdnPlanStol into Value5;
            close cKdnPlanStol;
            open cKdnStol(Days(i).FN_KOL,pFD_DATA1+p);
            fetch cKdnStol into Value6;
            close cKdnStol;
            str  := str || '<TD><p class=user>'|| PKG_R_ALLFUNC.RETURN_VALUE(TO_CHAR(value1)) ||'</p></TD>'||
                           '<TD style=''background:silver''><p class=user>'|| PKG_R_ALLFUNC.RETURN_VALUE(TO_CHAR(value2)) ||'</p></TD>'||
                           '<TD><p class=user>'|| PKG_R_ALLFUNC.RETURN_VALUE(TO_CHAR(value3)) ||'</p></TD>'||
                           '<TD style=''background:silver''><p class=user>'|| PKG_R_ALLFUNC.RETURN_VALUE(TO_CHAR(value4)) ||'</p></TD>'||
                           '<TD><p class=user>'|| PKG_R_ALLFUNC.RETURN_VALUE(TO_CHAR(value5)) ||'</p></TD>'||
                           '<TD style=''border-right:solid windowtext 1.0pt;background:silver''><p class=user>'|| PKG_R_ALLFUNC.RETURN_VALUE(TO_CHAR(value6)) ||'</p></TD>';
          end if;
        END LOOP;
        str := str||'</TR>';
      else
        str := '<TR><TD style=''border-left:solid windowtext 1.0pt;border-top:solid windowtext 1.0pt;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt''><B>ВСЕГО:</B></TD>';
        FOR i IN 1 .. nColCount LOOP
          if i = nColCount THEN-- col "VSEGO"
            open cInSumAllPlanStol;
            fetch cInSumAllPlanStol into Value1;
            close cInSumAllPlanStol;
            open cInSumAllStol;
            fetch cInSumAllStol into Value2;
            close cInSumAllStol;
            open cOutSumAllPlanStol;
            fetch cOutSumAllPlanStol into Value3;
            close cOutSumAllPlanStol;
            open cOutSumAllStol;
            fetch cOutSumAllStol into Value4;
            close cOutSumAllStol;
            Value5 := GET_KDN_ALL_PLAN_STOL;
            Value6 := GET_KDN_ALL_STOL;
            str  := str || '<TD style=''border-bottom:solid windowtext 1.0pt;border-top:solid windowtext 1.0pt''><p class=user><B>'|| PKG_R_ALLFUNC.RETURN_VALUE(TO_CHAR(value1)) ||'</B></p></TD>'||
                           '<TD style=''border-bottom:solid windowtext 1.0pt;border-top:solid windowtext 1.0pt;background:silver''><p class=user><B>'|| PKG_R_ALLFUNC.RETURN_VALUE(TO_CHAR(value2)) ||'</B></p></TD>'||
                           '<TD style=''border-bottom:solid windowtext 1.0pt;border-top:solid windowtext 1.0pt''><p class=user><B>'|| PKG_R_ALLFUNC.RETURN_VALUE(TO_CHAR(value3)) ||'</B></p></TD>'||
                           '<TD style=''border-bottom:solid windowtext 1.0pt;border-top:solid windowtext 1.0pt;background:silver''><p class=user><B>'|| PKG_R_ALLFUNC.RETURN_VALUE(TO_CHAR(value4)) ||'</B></p></TD>'||
                           '<TD style=''border-bottom:solid windowtext 1.0pt;border-top:solid windowtext 1.0pt''><p class=user><B>'|| PKG_R_ALLFUNC.RETURN_VALUE(TO_CHAR(value5)) ||'</B></p></TD>'||
                           '<TD style=''border-bottom:solid windowtext 1.0pt;border-top:solid windowtext 1.0pt;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;background:silver''><p class=user><B>'|| PKG_R_ALLFUNC.RETURN_VALUE(TO_CHAR(value6)) ||'</B></p></TD>';
          else
            open cInSumPlanStol(Days(i).FN_KOL);
            fetch cInSumPlanStol into Value1;
            close cInSumPlanStol;
            open cInSumStol(Days(i).FN_KOL);
            fetch cInSumStol into Value2;
            close cInSumStol;
            open cOutSumPlanStol(Days(i).FN_KOL);
            fetch cOutSumPlanStol into Value3;
            close cOutSumPlanStol;
            open cOutSumStol(Days(i).FN_KOL);
            fetch cOutSumStol into Value4;
            close cOutSumStol;
            Value5 := GET_KDN_PLAN_STOL(Days(i).FN_KOL);
            Value6 := GET_KDN_STOL(Days(i).FN_KOL);
            str  := str || '<TD style=''border-bottom:solid windowtext 1.0pt;border-top:solid windowtext 1.0pt''><p class=user><B>'|| PKG_R_ALLFUNC.RETURN_VALUE(TO_CHAR(value1)) ||'</B></p></TD>'||
                           '<TD style=''border-bottom:solid windowtext 1.0pt;border-top:solid windowtext 1.0pt;background:silver''><p class=user><B>'|| PKG_R_ALLFUNC.RETURN_VALUE(TO_CHAR(value2)) ||'</B></p></TD>'||
                           '<TD style=''border-bottom:solid windowtext 1.0pt;border-top:solid windowtext 1.0pt''><p class=user><B>'|| PKG_R_ALLFUNC.RETURN_VALUE(TO_CHAR(value3)) ||'</B></p></TD>'||
                           '<TD style=''border-bottom:solid windowtext 1.0pt;border-top:solid windowtext 1.0pt;background:silver''><p class=user><B>'|| PKG_R_ALLFUNC.RETURN_VALUE(TO_CHAR(value4)) ||'</B></p></TD>'||
                           '<TD style=''border-bottom:solid windowtext 1.0pt;border-top:solid windowtext 1.0pt''><p class=user><B>'|| PKG_R_ALLFUNC.RETURN_VALUE(TO_CHAR(value5)) ||'</B></p></TD>'||
                           '<TD style=''border-bottom:solid windowtext 1.0pt;border-top:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;background:silver''><p class=user><B>'|| PKG_R_ALLFUNC.RETURN_VALUE(TO_CHAR(value6)) ||'</B></p></TD>';
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
end PKG_R_PLAN_STOL;
/

SHOW ERRORS;


