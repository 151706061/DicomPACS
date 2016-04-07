DROP PACKAGE BODY ASU.PKG_R_STOLBUH
/

--
-- PKG_R_STOLBUH  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_R_STOLBUH" 
 IS-- Created by TimurLan
  FUNCTION GET_KORPNAME (pFK_KORPID IN NUMBER)
  RETURN VARCHAR2
   IS
    CURSOR c IS
      select FC_NAME
        from TKORP
       where FK_ID = pFK_KORPID;
    cTemp VARCHAR2(30);
  BEGIN
    open c;
    fetch c into cTemp;
    close c;
    RETURN NVL(cTemp,'По санаторию');
  END;
  FUNCTION GET_COUNT_PRYB_KORP(pFD_DATA1 IN DATE,pFD_DATA2 IN DATE,pFK_KORPID IN NUMBER)
  RETURN NUMBER
   IS
    CURSOR cAll IS
      SELECT COUNT (FK_PACID)
        FROM TSROKY
       WHERE (pFD_DATA1 <= FD_DATA1 AND FD_DATA1 < pFD_DATA2)
         AND FK_PRYB in (2,4);
    CURSOR cKorp IS
      SELECT COUNT (FK_PACID)
        FROM TSROKY
       WHERE (pFD_DATA1 <= FD_DATA1 AND FD_DATA1 < pFD_DATA2)
         AND FK_PRYB in (2,4)
         AND GET_PACKORPID(FK_PACID,FD_DATA1)=pFK_KORPID;
    i NUMBER;
  BEGIN
    if pFK_KORPID > 0 then
      OPEN cKorp;
      FETCH cKorp INTO i;
      CLOSE cKorp;
    else
      OPEN cAll;
      FETCH cAll INTO i;
      CLOSE cAll;
    end if;
    RETURN i;
  END;
  FUNCTION GET_COUNT_VYB_KORP(pFD_DATA1 IN DATE,pFD_DATA2 IN DATE,pFK_KORPID IN NUMBER)
  RETURN NUMBER
   IS
    CURSOR cAll IS
      SELECT COUNT (FK_PACID)
        FROM TSROKY
       WHERE (pFD_DATA1 < FD_DATA1 AND FD_DATA1 <= pFD_DATA2)
         AND FK_PRYB in (3,7);
    CURSOR cKorp IS
      SELECT COUNT (FK_PACID)
        FROM TSROKY
       WHERE (pFD_DATA1 < FD_DATA1 AND FD_DATA1 <= pFD_DATA2)
         AND FK_PRYB in (3,7)
         AND GET_PACKORPID(FK_PACID,FD_DATA1)=pFK_KORPID;
    i NUMBER;
  BEGIN
    if pFK_KORPID > 0 then
      OPEN cKorp;
      FETCH cKorp INTO i;
      CLOSE cKorp;
    else
      OPEN cAll;
      FETCH cAll INTO i;
      CLOSE cAll;
    end if;
    RETURN i;
  END;
  FUNCTION DO_CALC_REPORT(pFD_DATA IN DATE, pFK_VRACHID IN NUMBER, pFK_KORPID IN NUMBER)
  RETURN NUMBER
   IS
    nC NUMBER;
    D1 NUMBER;
    P1 NUMBER;
    P2 NUMBER;
    P3 NUMBER;
    sP NUMBER;
    U1 NUMBER;
    U2 NUMBER;
    U3 NUMBER;
    sU NUMBER;
    D2 NUMBER;
    cC CLOB;
    str VARCHAR2 (32767);
  BEGIN
    INSERT INTO TCLOBS(FC_CLOB)
         VALUES (EMPTY_CLOB())
      RETURNING FK_ID,FC_CLOB INTO nC,cC;
    DBMS_LOB.OPEN(cC,DBMS_LOB.LOB_READWRITE);
    str := PKG_HTML.GET_HEAD('word','Сведения о движении отдыхающих по столовой санатория "' ||PKG_SMINI.READSTRING('CONFIG','S_NAME','Не известен')||'"',
                             null,'8.0',null,
                             null,null,null,
                             null,null,null,
                             '150','100',null,
                             '15','15','5','15',
                             null,null,null,
                             'left',null,'none','none',
                             null,null,null,null);
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    D1 := PKG_R_ALLFUNC.GET_COUNT_MORNING_KORP(pFD_DATA + 8/24,pFK_KORPID);
    P1 := GET_COUNT_PRYB_KORP( TRUNC(pFD_DATA),
                               TO_DATE(TO_CHAR(pFD_DATA,'dd.mm.yyyy') ||' '|| PKG_SMINI.READSTRING('CONFIG','S_ZAVTRAKD',0),'dd.mm.yyyy hh24:mi:ss'),
                               pFK_KORPID );
    P2 := GET_COUNT_PRYB_KORP( TO_DATE(TO_CHAR(pFD_DATA,'dd.mm.yyyy') ||' '|| PKG_SMINI.READSTRING('CONFIG','S_ZAVTRAKD',0),'dd.mm.yyyy hh24:mi:ss'),
                               TO_DATE(TO_CHAR(pFD_DATA,'dd.mm.yyyy') ||' '|| PKG_SMINI.READSTRING('CONFIG','S_OBEDD',0),'dd.mm.yyyy hh24:mi:ss'),
                               pFK_KORPID );
    P3 := GET_COUNT_PRYB_KORP( TO_DATE(TO_CHAR(pFD_DATA,'dd.mm.yyyy') ||' '|| PKG_SMINI.READSTRING('CONFIG','S_OBEDD',0),'dd.mm.yyyy hh24:mi:ss'),
                               TO_DATE(TO_CHAR(pFD_DATA,'dd.mm.yyyy') ||' '|| PKG_SMINI.READSTRING('CONFIG','S_UZHIND',0),'dd.mm.yyyy hh24:mi:ss'),
                               pFK_KORPID );
    U1 := GET_COUNT_VYB_KORP( TO_DATE(TO_CHAR(pFD_DATA,'dd.mm.yyyy') ||' '|| PKG_SMINI.READSTRING('CONFIG','S_ZAVTRAK',0),'dd.mm.yyyy hh24:mi:ss'),
                              TO_DATE(TO_CHAR(pFD_DATA,'dd.mm.yyyy') ||' '|| PKG_SMINI.READSTRING('CONFIG','S_OBED',0),'dd.mm.yyyy hh24:mi:ss'),
                              pFK_KORPID );
    U2 := GET_COUNT_VYB_KORP( TO_DATE(TO_CHAR(pFD_DATA,'dd.mm.yyyy') ||' '|| PKG_SMINI.READSTRING('CONFIG','S_OBED',0),'dd.mm.yyyy hh24:mi:ss'),
                              TO_DATE(TO_CHAR(pFD_DATA,'dd.mm.yyyy') ||' '|| PKG_SMINI.READSTRING('CONFIG','S_UZHIN',0),'dd.mm.yyyy hh24:mi:ss'),
                              pFK_KORPID );
    U3 := GET_COUNT_VYB_KORP( TO_DATE(TO_CHAR(pFD_DATA,'dd.mm.yyyy') ||' '|| PKG_SMINI.READSTRING('CONFIG','S_UZHIN',0),'dd.mm.yyyy hh24:mi:ss'),
                              TRUNC(pFD_DATA)+1-1/(24*60*60),
                              pFK_KORPID);
    D2 := PKG_R_ALLFUNC.GET_COUNT_MORNING_KORP(pFD_DATA + 1 + 8/24,pFK_KORPID);
    sP:=P1+P2+P3;
    sU:=U1+U2+U3;
    str:='<body><div class=user><p align=center>Санаторий «'|| PKG_SMINI.READSTRING ('CONFIG', 'S_NAME', 'Не известен') ||'»<BR>'||
         '<BIG>С В Е Д Е Н И Я</BIG></p><BR>'||
         '<p>о движении больных за '|| TO_CHAR(pFD_DATA,'dd.mm.yyyy') ||' г. ('|| GET_KORPNAME(pFK_KORPID) ||')</p>'||
         '<p>Состояло на 8-00 '|| TO_CHAR(pFD_DATA,'dd.mm.yyyy') ||' г. '|| D1 ||' чел.</p>'||
         '<p class=user>&nbsp;</p>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    str:='<table>'||
         '<tr>'||
         '<td class=user width=234 colspan=2><p align=center>ПРИБЫЛО</p></td>'||
         '<td class=user width=234 colspan=2><p align=center>УБЫЛО</p></td>'||
         '</tr>'||
         '<tr>'||
         '<td class=user width=158><p>С завтрака</p></td>'||
         '<td class=user width=76><p>'|| P1 ||' чел.</p></td>'||
         '<td class=user width=164><p>С завтрака</p></td>'||
         '<td class=user width=70><p>'|| U1 ||' чел.</p></td>'||
         '</tr>'||
         '<tr>'||
         '<td class=user width=158><p>С обеда</p></td>'||
         '<td class=user width=76><p>'|| P2 ||' чел.</p></td>'||
         '<td class=user width=164><p>С обеда</p></td>'||
         '<td class=user width=70><p>'|| U2 ||' чел.</p></td>'||
         '</tr>'||
         '<tr>'||
         '<td class=user width=158><p>С ужина</p></td>'||
         '<td class=user width=76><p>'|| P3 ||' чел.</p></td>'||
         '<td class=user width=164><p>С ужина</p></td>'||
         '<td class=user width=70><p>'|| U3 ||' чел.</p></td>'||
         '</tr>'||
         '</table>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    str:='<hr size=3 width="100%" align=center noshade>'||
         '<p class=user>&nbsp;</p>'||
         '<table>'||
         '<tr>'||
         '<td width=158 class=user><p>Итого </p></td>'||
         '<td width=76 class=user><p>'|| sP ||' чел.</p></td>'||
         '<td width=164 class=user><p>Итого </p></td>'||
         '<td width=70 class=user><p>'|| sU ||' чел.</p></td>'||
         '</tr>'||
         '</table>'||
         '<p>Состоит на 8-00 '|| TO_CHAR(pFD_DATA+1,'dd.mm.yyyy') ||' г. '|| D2 ||' чел.</p>'||
         '<BR>'||
         '<p align=center>Медрегистратор___________________ '|| DO_VRACHFIO (pFK_VRACHID)||'</p>'||
         '</div></body></html>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    DBMS_LOB.CLOSE (cC);
    RETURN nC;
  END;
END;
/

SHOW ERRORS;


