DROP PACKAGE BODY ASU.PKG_R_DIRECTOR
/

--
-- PKG_R_DIRECTOR  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_R_DIRECTOR" 
 is-- Created by TimurLan
  FUNCTION DO_CALC_REPORT(pFD_DATA IN DATE /*ВНИМАНИЕ! Сюда передается TDateTime!*/, pFK_VRACHID IN NUMBER)
  RETURN NUMBER
   IS-- Used in rDirector.dpr
    CURSOR cKorpCol is SELECT COUNT(FK_ID) FROM TKORP;
    CURSOR cKorpName is SELECT FK_ID,FC_NAME FROM TKORP ORDER BY FC_NAME;
    CURSOR cRoomVidCol is SELECT COUNT(FK_ID) FROM TTIPROOM WHERE FK_ID > 0;
    CURSOR cRoomVidName is SELECT FK_ID,FC_VID FROM TTIPROOM WHERE FK_ID > 0 ORDER BY FC_VID;
    CURSOR cCOUNT_ALL is
           select /*+ rule*/count(fk_pacid)
             from tsroky
            where pFD_DATA > FD_DATA1
              and pFD_DATA <= FD_DATA3
              and FK_PRYB IN (2,4,5,6);
    CURSOR cCOUNT_CHILDS is
           select /*+ rule*/count(fk_pacid)
             from tsroky
            where pFD_DATA > FD_DATA1
              and pFD_DATA <= FD_DATA3
              and FK_PRYB IN (2,4,5,6)
              and GET_AGE_DATE(fk_pacid,pFD_DATA) < 12; -- 14; _Valdai_
    CURSOR cCOUNT_ALL_BY_KORP(pFK_KORPID IN NUMBER) is
           select /*+ rule*/count(fk_pacid)
             from tsroky
            where pFD_DATA > FD_DATA1
              and pFD_DATA <= FD_DATA3
              and FK_PRYB IN (2,4,5,6)
              AND GET_PACKORPID(fk_pacid,pFD_DATA) = pFK_KORPID;
    CURSOR cCOUNT_CHILDS_BY_KORP(pFK_KORPID IN NUMBER) is
           select /*+ rule*/count(fk_pacid)
             from tsroky
            where pFD_DATA > FD_DATA1
              and pFD_DATA <= FD_DATA3
              and FK_PRYB IN (2,4,5,6)
              AND GET_PACKORPID(fk_pacid,pFD_DATA) = pFK_KORPID
              and GET_AGE_DATE(fk_pacid,pFD_DATA) < 12; -- 14; _Valdai_
    CURSOR cCOUNT_FREEROOM_ALL(pFK_KORPID IN NUMBER, pFK_VIDID IN NUMBER) is
           SELECT /*+ rule*/COUNT(TROOM.FK_ID)
             FROM TROOM
            WHERE FK_KORPID=pFK_KORPID
              AND GET_PALATA_FREE_MESTA(TROOM.FK_ID,pFD_DATA)>0
              AND IS_PALATA_ON_REMONT(TROOM.FK_ID,pFD_DATA)=0
              AND GET_PALATAVID(TROOM.FK_ID,pFD_DATA)= pFK_VIDID
              AND (GET_PALATA_SEX_CODE(TROOM.FK_ID,pFD_DATA) = 2
                  OR
                  GET_PALATA_SEX_CODE(TROOM.FK_ID,pFD_DATA) IS NULL);
    CURSOR cCOUNT_FREEROOM_SEX(pFK_KORPID IN NUMBER, pFK_VIDID IN NUMBER, SEX IN NUMBER) is
           SELECT /*+ rule*/COUNT(TROOM.FK_ID)
             FROM TROOM
            WHERE FK_KORPID=pFK_KORPID
              AND GET_PALATA_FREE_MESTA(TROOM.FK_ID,pFD_DATA)>0
              AND IS_PALATA_ON_REMONT(TROOM.FK_ID,pFD_DATA)=0
              AND GET_PALATAVID(TROOM.FK_ID,pFD_DATA)= pFK_VIDID
              AND GET_PALATA_SEX_CODE(TROOM.FK_ID,pFD_DATA) = SEX;
    nC NUMBER;
    cC CLOB;
    str VARCHAR2 (32767);
    nTemp NUMBER;
    nTemp1 NUMBER;
    nTemp2 NUMBER;
    S1 NUMBER;
    S2 NUMBER;
    S3 NUMBER;
  BEGIN
    open cKorpCol;
    fetch cKorpCol into nTemp;
    close cKorpCol;
    open cRoomVidCol;
    fetch cRoomVidCol into nTemp1;
    close cRoomVidCol;
    system.PROGRESS_BAR.SETMAXValue (2 + nTemp*nTemp1);
    system.PROGRESS_BAR.SETSTROUT ('Формирование отчета...');
    INSERT INTO TCLOBS (FC_CLOB)
         VALUES (EMPTY_CLOB () )
      RETURNING FK_ID,FC_CLOB INTO nC,cC;
    DBMS_LOB.OPEN (cC, DBMS_LOB.LOB_READWRITE);
    str := PKG_HTML.GET_HEAD('word','Ежедневные сведения о номерном фонде по санаторию "'||PKG_SMINI.READSTRING('CONFIG','S_NAME','Не известен')||'" на '||TO_CHAR(pFD_DATA,'hh24:mi dd.mm.yyyy'),
                             null,'10.0',null,
                             null,null,null,
                             null,null,null,
                             null,null,null,
                             null,null,null,null,
                             null,null,null,'left',
                             null,null,null,null,
                             null,null,null);
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    str:='<body>'||
         '<div class=user>'||
         '<p align=center><b>'||
--         'Филиал ООО «Мострансгаз»<BR>'||
         'Санаторий "'||PKG_SMINI.READSTRING('CONFIG','S_NAME','Не известен')||'"</b></p>'||
         '<BR>'||
         '<p align=center>СВЕДЕНИЯ<BR>'||
         'о количестве проживающих по состоянию на '||TO_CHAR(pFD_DATA,'hh24:mi dd.mm.yyyy')||'</p>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    str:='<table>'||
         '<tr>'||
         '<td width="30%">&nbsp;</td>'||
         '<td width="30%">Кол-во:</td>'||
         '<td width="30%">Из них детей (до 12 лет):</td>'||--  '<td width="30%">Из них детей (до 14 лет):</td>'|| _Valdai_
         '</tr>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    PROGRESS_BAR.SETSTROUT ('Подсчет количества проживающих...');
    PROGRESS_BAR.STEPIT;
    FOR p1 IN cKorpName LOOP
      str := '<tr><td>'||p1.FC_NAME||'</td>';
      open cCOUNT_ALL_BY_KORP(p1.FK_ID);
      fetch cCOUNT_ALL_BY_KORP into nTemp;
      close cCOUNT_ALL_BY_KORP;
      str := str || '<td>'||nTemp||'</td>';
      open cCOUNT_CHILDS_BY_KORP(p1.FK_ID);
      fetch cCOUNT_CHILDS_BY_KORP into nTemp;
      close cCOUNT_CHILDS_BY_KORP;
      str := str || '<td>'||nTemp||'</td></tr>';
      DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    END LOOP;
    str:='<tr>'||
         '<td><u>ВСЕГО:</u></td>';
    open cCOUNT_ALL;
    fetch cCOUNT_ALL into nTemp;
    close cCOUNT_ALL;
    str:=str||'<td><u>'||nTemp||'</u></td>';
    open cCOUNT_CHILDS;
    fetch cCOUNT_CHILDS into nTemp;
    close cCOUNT_CHILDS;
    str:=str||'<td><u>'||nTemp||'</u></td>'||
         '</tr>'||
         '</table><BR><p><B>Медрегистратор _______________ '|| DO_VRACHFIO (pFK_VRACHID)||'</B></p><BR><BR>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    str:='<p align=center>СВЕДЕНИЯ<BR>'||
         'о свободных номерах по состоянию на '||TO_CHAR(pFD_DATA,'hh24:mi dd.mm.yyyy')||'</p>'||
         '<table>'||
         ' <tr>'||
         '  <td width="50%">Тип палаты:</td>'||
         '  <td width="50%">Кол-во:</td>'||
         ' </tr>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    FOR k IN cKorpName LOOP
      str:=' <tr><td colspan=2><u>'||k.FC_NAME||'</u></td></tr>';
      S1:=0;
      S2:=0;
      S3:=0;
      FOR r IN cRoomVidName LOOP
        PROGRESS_BAR.SETSTROUT ('Подсчет количества свободных номеров - '||k.FC_NAME||' "'||r.FC_VID||'"');
        PROGRESS_BAR.STEPIT;

        open cCOUNT_FREEROOM_ALL(k.FK_ID,r.FK_ID);
        fetch cCOUNT_FREEROOM_ALL into nTemp;
        close cCOUNT_FREEROOM_ALL;

        open cCOUNT_FREEROOM_SEX(k.FK_ID,r.FK_ID,1);
        fetch cCOUNT_FREEROOM_SEX into nTemp1;
        close cCOUNT_FREEROOM_SEX;

        open cCOUNT_FREEROOM_SEX(k.FK_ID,r.FK_ID,0);
        fetch cCOUNT_FREEROOM_SEX into nTemp2;
        close cCOUNT_FREEROOM_SEX;

        S1:=S1+nTemp;
        S2:=S2+nTemp1;
        S3:=S3+nTemp2;
        str := str || '<tr><td class=user><p class=user>'||r.FC_VID||'</p></td>'||
                      '<td><p class=user>'||nTemp||'&nbsp;&nbsp;&nbsp;+( '||nTemp1||' м &nbsp;&nbsp;'||nTemp2||' ж)'||'</p></td></tr>';
      END LOOP;
      str := str || '<tr><td><u>ВСЕГО:</u></td><td><u>'||S1||'&nbsp;&nbsp;&nbsp;+( '||S2||' м &nbsp;&nbsp;'||S3||' ж)'||'</u></td></tr>';
      DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    END LOOP;
    str:='</table><BR><p><b>Медрегистратор _______________ '|| DO_VRACHFIO (pFK_VRACHID)||'</b></p></div></body></html>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    PROGRESS_BAR.SETSTROUT ('Почти все готово...');
    PROGRESS_BAR.STEPIT;
    DBMS_LOB.CLOSE (cC);
    RETURN nC;
  END;
end PKG_R_DIRECTOR;
/

SHOW ERRORS;


