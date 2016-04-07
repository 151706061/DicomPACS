DROP PACKAGE BODY ASU.PKG_R_MONTHIB
/

--
-- PKG_R_MONTHIB  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_R_MONTHIB" 
 is-- Created by TimurLan
  FUNCTION cGET_FC_KOD(pFK_PACID NUMBER)
  RETURN VARCHAR2
   IS
    CURSOR c IS SELECT FC_NAME FROM TSUBVID WHERE FK_ID = (SELECT FK_KOD FROM TKARTA WHERE FK_ID = pFK_PACID);
    cTemp VARCHAR2(30);
  BEGIN
    OPEN c;
    FETCH c INTO cTemp;
    CLOSE c;
    RETURN cTemp;
  END;
/*############################################################################################################*/
  FUNCTION DO_CALC_REPORT_BY_ALL (pFD_DATA1 IN DATE,pFD_DATA2 IN DATE,pFK_VRACHID IN NUMBER)
  RETURN NUMBER
   IS-- Used in rMonthIB.dpr
    CURSOR cMain is
      select GET_PACFIO(fk_pacid) as FC_FIO,
             GET_PAC_PUT(fk_pacid) as FC_PUT,
             TO_CHAR(fd_data1,'dd.mm.yyyy hh24:mi') as FD_DATE1,
             TO_CHAR(fd_data2,'dd.mm.yyyy hh24:mi') as FD_DATE2,
             fk_pacid
        from tsroky
       where fd_data1 between pFD_DATA1 and pFD_DATA2+1-1/(24*60*60)
         and fk_pryb = 2
    ORDER BY 3,1;
    nC NUMBER;
    cC CLOB;
    str VARCHAR2 (32767);
  BEGIN
    INSERT INTO TCLOBS (FC_CLOB)
           VALUES (EMPTY_CLOB () )
           RETURNING FK_ID,FC_CLOB INTO nC,cC;
    DBMS_LOB.OPEN (cC, DBMS_LOB.LOB_READWRITE);
    str := PKG_HTML.GET_HEAD('word','Отчет по санаторно-курортным книжкам и историям болезней за период с '|| TO_CHAR(pFD_DATA1,'dd.mm.yyyy') ||' г. по '||TO_CHAR(pFD_DATA2,'dd.mm.yyyy') ||' г.',
                             null,'10.0',null,
                             null,null,null,
                             null,null,null,
                             null,null,null,
                             '10','10','10','10',
                             null,null,null,'left',
                             null,null,null,null,
                             null,null,null);
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    str:='<body><div class=user>'||
         '<p align=center><B>Санаторий "'|| PKG_SMINI.READSTRING ('CONFIG', 'S_NAME', 'Не известен') ||'"</B></p>'||
         '<BR><p align=center>Отчет по санаторно-курортным книжкам и историям болезней<BR>за период с '|| TO_CHAR(pFD_DATA1,'dd.mm.yyyy') ||' г. по '||TO_CHAR(pFD_DATA2,'dd.mm.yyyy') ||' г.</p>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    str:='<table><tr>'||
         '<td width="5%" rowspan=2><p class=user>№ п.п.</p></td>'||
         '<td rowspan=2><p class=user>Ф.И.О.</p></td>'||
         '<td rowspan=2><p class=user>Номера путевок</p></td>'||
         '<td width="40%" colspan=2><p class=user>Срок путевки</p></td>'||
         '<td rowspan=2><p class=user>Подразделение</p></td>'||
         '</tr>'||
         '<tr>'||
         '<td><p class=user>с</p></td>'||
         '<td><p class=user>по</p></td></tr>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    for p in cMain loop
      str:='<tr><td><p class=user>'||cMain%ROWCOUNT||'.</P></td>'||
           '<td class=user><p class=user>'||p.FC_FIO||'</P></td>'||
           '<td style=''text-align:right''><p class=user>'||p.FC_PUT||'</P></td>'||
           '<td><p class=user>'||p.FD_DATE1||'</P></td>'||
           '<td><p class=user>'||p.FD_DATE2||'</P></td>'||
           '<td class=user><p class=user>'||cGET_FC_KOD(p.fk_pacid)||'</P></td></tr>';
      DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
    end loop;
    str:='</table>'||
         '<BR><P><B>Медрегистратор___________________ '|| DO_VRACHFIO (pFK_VRACHID)||
         '<BR>'|| TO_CHAR(SYSDATE,'dd.mm.yyyy') ||' г.</B></P></div></body></html>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
    DBMS_LOB.CLOSE (cC);
    RETURN nC;
  END;
/*############################################################################################################*/
  FUNCTION DO_CALC_REPORT_BY_KORP (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_VRACHID IN NUMBER, pFK_KORPID IN NUMBER)
  RETURN NUMBER
   IS-- Used in rMonthIB.dpr
    CURSOR cKorp is SELECT FC_NAME FROM TKORP WHERE FK_ID = pFK_KORPID;
    CURSOR cMain is
      select GET_PACFIO(fk_pacid) as FC_FIO,
             GET_PAC_PUT(fk_pacid) as FC_PUT,
             TO_CHAR(fd_data1,'dd.mm.yyyy hh24:mi') as FD_DATE1,
             TO_CHAR(fd_data2,'dd.mm.yyyy hh24:mi') as FD_DATE2,
             fk_pacid
        from tsroky
       where fd_data1 between pFD_DATA1 and pFD_DATA2+1-1/(24*60*60)
         and fk_pryb = 2
         AND GET_PACKORPID(fk_pacid,fd_data1) = pFK_KORPID
    ORDER BY 3,1;
    nC NUMBER;
    cC CLOB;
    str VARCHAR2 (32767);
    KORP_NAME VARCHAR(30);
  BEGIN
    open cKorp;
    fetch cKorp into KORP_NAME;
    close cKorp;
    INSERT INTO TCLOBS (FC_CLOB)
         VALUES (EMPTY_CLOB () )
      RETURNING FK_ID,FC_CLOB INTO nC,cC;
    DBMS_LOB.OPEN (cC, DBMS_LOB.LOB_READWRITE);
    str := PKG_HTML.GET_HEAD('word','Отчет по санаторно-курортным книжкам и историям болезней за период с '|| TO_CHAR(pFD_DATA1,'dd.mm.yyyy') ||' г. по '||TO_CHAR(pFD_DATA2,'dd.mm.yyyy') ||' г.',
                             null,'10.0',null,
                             null,null,null,
                             null,null,null,
                             null,null,null,
                             '10','10','10','10',
                             null,null,null,'left',
                             null,null,null,null,
                             null,null,null);
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    str:='<body><div class=user>'||
         '<p align=center><B>Санаторий "'|| PKG_SMINI.READSTRING ('CONFIG', 'S_NAME', 'Не известен') ||'"</B></p><p align=center style=''font-family:Arial''>('||KORP_NAME||')</p>'||
         '<p align=center>Отчет по санаторно-курортным книжкам и историям болезней<BR>за период с '|| TO_CHAR(pFD_DATA1,'dd.mm.yyyy') ||' г. по '||TO_CHAR(pFD_DATA2,'dd.mm.yyyy') ||' г.</p>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    str:='<table><tr>'||
         '<td width="5%" rowspan=2><p class=user>№ п.п.</p></td>'||
         '<td rowspan=2><p class=user>Ф.И.О.</p></td>'||
         '<td rowspan=2><p class=user>Номера путевок</p></td>'||
         '<td width="40%" colspan=2><p class=user>Срок путевки</p></td>'||
         '<td rowspan=2><p class=user>Подразделение</p></td></tr>'||
         '<tr><td><p class=user>с</p></td>'||
         '<td><p class=user>по</p></td></tr>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    for p in cMain loop
      str:=' <tr><td><p class=user>'||cMain%ROWCOUNT||'.</p></td>'||
           '<td class=user><p class=user>'||p.FC_FIO||'</p></td>'||
           '<td style=''text-align:right''><p class=user>'||p.FC_PUT||'</p></td>'||
           '<td><p class=user>'||p.FD_DATE1||'</p></td>'||
           '<td><p class=user>'||p.FD_DATE2||'</p></td>'||
           '<td class=user><p class=user>'||cGET_FC_KOD(p.fk_pacid)||'</p></td></tr>';
      DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
    end loop;
    str:='</table>'||
         '<BR><P><B>Медрегистратор___________________ '|| DO_VRACHFIO (pFK_VRACHID)||
         '<BR>'|| TO_CHAR(SYSDATE,'dd.mm.yyyy') ||' г.</B></P></div></body></html>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
    DBMS_LOB.CLOSE (cC);
    RETURN nC;
  END;
end PKG_R_MONTHIB;
/

SHOW ERRORS;


