DROP PACKAGE BODY ASU.PKG_R_PLAN_YEAR_STOL
/

--
-- PKG_R_PLAN_YEAR_STOL  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_R_PLAN_YEAR_STOL" 
 is-- Created by TimurLan

  FUNCTION DO_CALC_REPORT (pFC_YEAR IN VARCHAR2,pFK_VRACHID IN NUMBER)
  RETURN NUMBER
   IS-- Used in rPlanYearStol.dpr
    CURSOR cInPlanStol (pFN_KOL in NUMBER,pFD_DATA1 in DATE,pFD_DATA2 in DATE) is
      SELECT COUNT(*) FN_COUNT
        FROM TKARTA,TSROKY
       WHERE TSROKY.FK_PRYB=1
         AND TSROKY.FD_DATA1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
         AND TSROKY.FN_KOL=pFN_KOL
         AND TKARTA.FK_ID=TSROKY.FK_PACID
         AND TKARTA.FK_STOLID>0;
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
    CURSOR cInAllPlanStol (pFD_DATA1 in DATE,pFD_DATA2 in DATE) is
      SELECT COUNT(*) FN_COUNT
        FROM TKARTA,TSROKY
       WHERE TSROKY.FK_PRYB=1
         AND TSROKY.FD_DATA1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
         AND TKARTA.FK_ID=TSROKY.FK_PACID
         AND TKARTA.FK_STOLID>0;
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
    --CURSOR cUslvid is SELECT FK_ID, FC_NAME FROM TUSLVID ORDER BY FK_ID;
    CURSOR cDays (pFD_DATA1 in DATE,pFD_DATA2 in DATE) is
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
--    nRowCount NUMBER;
    dDate1 DATE;
    dDate2 DATE;
    FUNCTION GET_KDN_PLAN_STOL (pFN_KOL in NUMBER,pFD_DATA1 in DATE,pFD_DATA2 in DATE)
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
    FUNCTION GET_KDN_ALL_PLAN_STOL (pFD_DATA1 in DATE,pFD_DATA2 in DATE)
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
    EXECUTE IMMEDIATE 'ALTER SESSION SET NLS_LANGUAGE=''RUSSIAN''';
    dDate1 := TO_DATE('01.01.'||pFC_YEAR,'dd.mm.yyyy');
    dDate2 := TO_DATE('31.12.'||pFC_YEAR,'dd.mm.yyyy');

    /*FOR p IN cUslvid LOOP
      Usl (cUslvid%ROWCOUNT) := p;
    END LOOP;*/
    FOR p IN cDays(dDate1,dDate2) LOOP
      Days (cDays%ROWCOUNT) := p;
    END LOOP;

    INSERT INTO TCLOBS (FC_CLOB)
         VALUES (EMPTY_CLOB () )
      RETURNING FK_ID, FC_CLOB INTO nC, cC;
    DBMS_LOB.OPEN (cC, DBMS_LOB.LOB_READWRITE);

    str := PKG_HTML.GET_HEAD('excel','Сведения по санаторию "'||PKG_SMINI.READSTRING('CONFIG','S_NAME','Не известен')||'" за '||pFC_YEAR||' год.',
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
          '<P align="CENTER"><B>ПЛАН</B></P>'||
          '<P align="CENTER"><B>по оздоровлению в санатории-профилактории г.Югорск (по столовой)<BR>на '||pFC_YEAR||' год</B></P>'||
          '<TABLE>'||
          '<TR>'||
          ' <TD rowspan=2 style=''border-right:solid windowtext 1.0pt''><p class=user><B>'||pFC_YEAR||'</B></p></TD>';
    /*FOR i IN 1 .. Usl.COUNT+1 LOOP
      if i <> Usl.COUNT+1 THEN
        str  := str || '<TD colspan='||Days.COUNT*2||'><p class=user><B>' || Usl(i).FC_NAME || '</B></p></TD>';
      else
        str  := str || '<TD colspan='||Days.COUNT*2||'><p class=user><B>Всего</B></p></TD>';
      end if;
    END LOOP;
    str := str || '</TR>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);*/

    nColCount := Days.COUNT+1;
--    nRowCount := 4;--+4+1;

    --str :='<TR>';
    FOR i IN 1 .. nColCount LOOP
      if i <> nColCount THEN
        str  := str || '<TD colspan=2><p class=user><B>' || Days(i).FN_KOL || '</B></p></TD>';
      else
        str  := str || '<TD colspan=2><p class=user><B>Всего</B></p></TD>';
      end if;
    END LOOP;
    str := str || '</TR>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);

    str :='<TR>';
    FOR i IN 1 .. nColCount LOOP
      str  := str || '<TD class=v style=''white-space:nowrap;vertical-align:bottom''><p class=user>Чел.</p></TD>'||
                     '<TD class=v style=''white-space:nowrap;vertical-align:bottom''><p class=user>ЧДН</p></TD>';
    END LOOP;
    str := str || '</TR>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);

    FOR p IN 0..4 LOOP
      if p <> 4 then
        FOR m IN 0..3 LOOP
          if m <> 3 then
            str := '<TR><TD style=''border-right:solid windowtext 1.0pt''><p class=user>'||TO_CHAR(dDate1,'Month')||'</p></TD>';
            FOR i IN 1 .. nColCount LOOP
              if i <> nColCount then
                open cInPlanStol (Days(i).FN_KOL,dDate1,LAST_DAY(dDate1));
                fetch cInPlanStol into nTemp;
                close cInPlanStol;
                str  := str || '<TD><p class=user>'|| PKG_R_ALLFUNC.RETURN_VALUE(TO_CHAR(nTemp)) ||'</p></TD>';
                nTemp := GET_KDN_PLAN_STOL (Days(i).FN_KOL,dDate1,LAST_DAY(dDate1));
                str  := str || '<TD><p class=user>'|| PKG_R_ALLFUNC.RETURN_VALUE(TO_CHAR(nTemp)) ||'</p></TD>';
              else
                open cInAllPlanStol (dDate1,LAST_DAY(dDate1));
                fetch cInAllPlanStol into nTemp;
                close cInAllPlanStol;
                str  := str || '<TD><p class=user>'|| PKG_R_ALLFUNC.RETURN_VALUE(TO_CHAR(nTemp)) ||'</p></TD>';
                nTemp := GET_KDN_ALL_PLAN_STOL (dDate1,LAST_DAY(dDate1));
                str  := str || '<TD><p class=user>'|| PKG_R_ALLFUNC.RETURN_VALUE(TO_CHAR(nTemp)) ||'</p></TD>';
              end if;
            END LOOP;
            str := str||'</TR>';
            dDate1 := ADD_MONTHS(dDate1,1);
            DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
          else
            str := '<TR><TD style=''border-left:solid windowtext 1.0pt;border-top:solid windowtext 1.0pt;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt''><B>'||TO_CHAR(p+1)||'-й квартал</B></TD>';
            FOR i IN 1 .. nColCount LOOP
              if i <> nColCount then
                open cInPlanStol (Days(i).FN_KOL,ADD_MONTHS(dDate1,-3),LAST_DAY(ADD_MONTHS(dDate1,-1)));
                fetch cInPlanStol into nTemp;
                close cInPlanStol;
                str  := str || '<TD style=''border-bottom:solid windowtext 1.0pt;border-top:solid windowtext 1.0pt''><p class=user>'|| PKG_R_ALLFUNC.RETURN_VALUE(TO_CHAR(nTemp)) ||'</p></TD>';
                nTemp := GET_KDN_PLAN_STOL (Days(i).FN_KOL,ADD_MONTHS(dDate1,-3),LAST_DAY(ADD_MONTHS(dDate1,-1)));
                str  := str || '<TD style=''border-bottom:solid windowtext 1.0pt;border-top:solid windowtext 1.0pt''><p class=user>'|| PKG_R_ALLFUNC.RETURN_VALUE(TO_CHAR(nTemp)) ||'</p></TD>';
              else
                open cInAllPlanStol (ADD_MONTHS(dDate1,-3),LAST_DAY(ADD_MONTHS(dDate1,-1)));
                fetch cInAllPlanStol into nTemp;
                close cInAllPlanStol;
                str  := str || '<TD style=''border-bottom:solid windowtext 1.0pt;border-top:solid windowtext 1.0pt''><p class=user>'|| PKG_R_ALLFUNC.RETURN_VALUE(TO_CHAR(nTemp)) ||'</p></TD>';
                nTemp := GET_KDN_ALL_PLAN_STOL (ADD_MONTHS(dDate1,-3),LAST_DAY(ADD_MONTHS(dDate1,-1)));
                str  := str || '<TD style=''border-bottom:solid windowtext 1.0pt;border-top:solid windowtext 1.0pt''><p class=user>'|| PKG_R_ALLFUNC.RETURN_VALUE(TO_CHAR(nTemp)) ||'</p></TD>';
              end if;
            END LOOP;
            str := str||'</TR>';
            DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
          end if;
        END LOOP;
      else
        dDate1 := TO_DATE('01.01.'||pFC_YEAR,'dd.mm.yyyy');
        dDate2 := TO_DATE('31.12.'||pFC_YEAR,'dd.mm.yyyy');
        str := '<TR><TD style=''border-left:solid windowtext 1.0pt;border-top:solid windowtext 1.0pt;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt''><B>ВСЕГО:</B></TD>';
        FOR i IN 1 .. nColCount LOOP
          if i <> nColCount then
            open cInPlanStol (Days(i).FN_KOL,dDate1,dDate2);
            fetch cInPlanStol into nTemp;
            close cInPlanStol;
            str  := str || '<TD style=''border-bottom:solid windowtext 1.0pt;border-top:solid windowtext 1.0pt''><p class=user><B>'|| PKG_R_ALLFUNC.RETURN_VALUE(TO_CHAR(nTemp)) ||'</B></p></TD>';
            nTemp := GET_KDN_PLAN_STOL (Days(i).FN_KOL,dDate1,dDate2);
            str  := str || '<TD style=''border-bottom:solid windowtext 1.0pt;border-top:solid windowtext 1.0pt''><p class=user><B>'|| PKG_R_ALLFUNC.RETURN_VALUE(TO_CHAR(nTemp)) ||'</B></p></TD>';
          else
            open cInAllPlanStol (dDate1,dDate2);
            fetch cInAllPlanStol into nTemp;
            close cInAllPlanStol;
            str  := str || '<TD style=''border-bottom:solid windowtext 1.0pt;border-top:solid windowtext 1.0pt''><p class=user><B>'|| PKG_R_ALLFUNC.RETURN_VALUE(TO_CHAR(nTemp)) ||'</B></p></TD>';
            nTemp := GET_KDN_ALL_PLAN_STOL (dDate1,dDate2);
            str  := str || '<TD style=''border-bottom:solid windowtext 1.0pt;border-top:solid windowtext 1.0pt''><p class=user><B>'|| PKG_R_ALLFUNC.RETURN_VALUE(TO_CHAR(nTemp)) ||'</B></p></TD>';
          end if;
        END LOOP;
        str := str||'</TR>';
        DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
      end if;
    END LOOP;

    str  := '</TABLE>(* ЧДН - человеко-дни)<BR><BR><P><B>Отчет составил_________________________' || DO_VRACHFIO (pFK_VRACHID)||
            '</B></P></BODY></HTML>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    DBMS_LOB.CLOSE (cC);
    RETURN nC;
  END;
end PKG_R_PLAN_YEAR_STOL;
/

SHOW ERRORS;


