DROP PACKAGE BODY ASU.PKG_R_RAPORT
/

--
-- PKG_R_RAPORT  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_R_RAPORT" 
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
    RETURN cTemp;
  END;
  FUNCTION DO_CALC_REPORT (pFD_DATA IN DATE, pFK_VRACHID IN NUMBER, pFK_KORPID IN NUMBER)
  RETURN NUMBER
   IS-- Used in rRaport.dpr
    CURSOR cPrybRanAll
     IS
      select count(t1.fk_pacid),SUM(t1.FD_DATA1-t2.FD_DATA1)
        from tsroky t1,tsroky t2
       where t1.fd_data1 BETWEEN pFD_DATA AND pFD_DATA+1-1/(24*60*60)
         and t1.fk_pryb=2
         and t1.fk_pacid=t2.fk_pacid
         and t2.fk_pryb=1
         and TRUNC(t1.FD_DATA1) > TRUNC(t2.FD_DATA1);
    CURSOR cPrybRanKorp
     IS
      select count(t1.fk_pacid),SUM(t1.FD_DATA1-t2.FD_DATA1)
        from tsroky t1,tsroky t2
       where t1.fd_data1 BETWEEN pFD_DATA AND pFD_DATA+1-1/(24*60*60)
         and t1.fk_pryb=2
         and t1.fk_pacid=t2.fk_pacid
         and t2.fk_pryb=1
         and TRUNC(t1.FD_DATA1) > TRUNC(t2.FD_DATA1)
         AND GET_PACKORPID(t1.fk_pacid,pFD_DATA) = pFK_KORPID;
    CURSOR cVybRanAll
     IS
      select count(fk_pacid),sum(fd_data2-fd_data3)
        from tsroky
       where fd_data3 BETWEEN pFD_DATA AND pFD_DATA+1-1/(24*60*60)
         and fk_vyb = 3
         and TRUNC(fd_data2) > TRUNC(fd_data3);
    CURSOR cVybRanKorp
     IS
      select count(fk_pacid),sum(fd_data2-fd_data3)
        from tsroky
       where fd_data3 BETWEEN pFD_DATA AND pFD_DATA+1-1/(24*60*60)
         and fk_vyb = 3
         and TRUNC(fd_data2) > TRUNC(fd_data3)
         AND GET_PACKORPID(fk_pacid,pFD_DATA) = pFK_KORPID;
    CURSOR cProdlAll(nPryb NUMBER)
     IS
      select count(fk_pacid),sum(fn_kol)
        from tsroky
       where fd_data1 BETWEEN pFD_DATA AND pFD_DATA+1-1/(24*60*60)
         and fk_pryb=npryb;
    CURSOR cProdlKorp(nPryb NUMBER)
     IS
      select count(fk_pacid),sum(fn_kol)
        from tsroky
       where fd_data1 BETWEEN pFD_DATA AND pFD_DATA+1-1/(24*60*60)
         and fk_pryb=npryb
         AND GET_PACKORPID(fk_pacid,pFD_DATA) = pFK_KORPID;
    CURSOR cTypePut IS SELECT * FROM TTIPROOM ORDER BY FC_VID;
    CURSOR cPrybAll(pFD_DATA DATE,nType NUMBER)
     IS
      SELECT GET_PACFIO(TKARTA.FK_ID) FC_FIO, fc_put, t2.fd_data1, t2.fd_data2,
             TRUNC(t1.fd_data1) - TRUNC(t2.fd_data1) fn_opozd,
             GET_SUBVIDNAME(TKARTA.FK_KOD) as FC_SUBVID
        FROM tkarta, tsroky t1, tsroky t2
       WHERE tkarta.fk_id = t1.fk_pacid
         AND t1.fd_data1 BETWEEN pFD_DATA AND pFD_DATA+1-1/(24*60*60)
         AND t1.fk_pryb = 2
         AND t2.fk_pacid = t1.fk_pacid
         AND t2.fk_pryb = 1
         AND TRUNC(t1.fd_data1) > TRUNC(t2.fd_data1)
         AND fk_puttype = nType
       UNION ALL
      SELECT GET_PACFIO(TKARTA.FK_ID) FC_FIO, fc_put, t2.fd_data1, t2.fd_data2,
             0 fn_opozd,
             GET_SUBVIDNAME(TKARTA.FK_KOD) as FC_SUBVID
        FROM tkarta, tsroky t1, tsroky t2
       WHERE tkarta.fk_id = t1.fk_pacid
         AND t1.fd_data1 BETWEEN pFD_DATA AND pFD_DATA+1-1/(24*60*60)
         AND t1.fk_pryb = 2
         AND t2.fk_pacid = t1.fk_pacid
         AND t2.fk_pryb = 1
         AND TRUNC(t1.fd_data1) <= TRUNC(t2.fd_data1)
         AND fk_puttype = nType
       UNION ALL
      SELECT GET_PACFIO(TKARTA.FK_ID) || ' (восст.)' FC_FIO, fc_put, t2.fd_data1, t2.fd_data2,
             TRUNC(t3.fd_data1) - TRUNC(t2.fd_data1) fn_opozd,
             GET_SUBVIDNAME(TKARTA.FK_KOD) as FC_SUBVID
        FROM tkarta, tsroky t1, tsroky t2, tsroky t3
       WHERE tkarta.fk_id = t1.fk_pacid
         AND t1.fd_data1 BETWEEN pFD_DATA AND pFD_DATA+1-1/(24*60*60)
         AND t1.fk_pryb = 4
         AND t2.fk_pacid = t1.fk_pacid
         AND t1.fk_pacid = t3.fk_pacid
         AND t2.fk_pryb = 1
         AND t3.fk_vyb = 7
         AND TRUNC(t1.fd_data1) > TRUNC(t2.fd_data1)
         AND fk_puttype = nType
       UNION ALL
      SELECT GET_PACFIO(TKARTA.FK_ID) || ' (восст.)' FC_FIO, fc_put, t2.fd_data1, t2.fd_data2,
             0 fn_opozd,
             GET_SUBVIDNAME(TKARTA.FK_KOD) as FC_SUBVID
        FROM tkarta, tsroky t1, tsroky t2
       WHERE tkarta.fk_id = t1.fk_pacid
         AND t1.fd_data1 BETWEEN pFD_DATA AND pFD_DATA+1-1/(24*60*60)
         AND t1.fk_pryb = 4
         AND t2.fk_pacid = t1.fk_pacid
         AND t2.fk_pryb = 1
         AND TRUNC(t1.fd_data1) <= TRUNC(t2.fd_data1)
         AND fk_puttype = nType
       ORDER BY 1;
    CURSOR cPrybKorp(pFD_DATA DATE,nType NUMBER)
     IS
      SELECT GET_PACFIO(TKARTA.FK_ID) FC_FIO, fc_put, t2.fd_data1, t2.fd_data2,
             TRUNC(t1.fd_data1) - TRUNC(t2.fd_data1) fn_opozd,
             GET_SUBVIDNAME(TKARTA.FK_KOD) as FC_SUBVID
        FROM tkarta, tsroky t1, tsroky t2
       WHERE tkarta.fk_id = t1.fk_pacid
         AND t1.fd_data1 BETWEEN pFD_DATA AND pFD_DATA+1-1/(24*60*60)
         AND t1.fk_pryb = 2
         AND t2.fk_pacid = t1.fk_pacid
         AND t2.fk_pryb = 1
         AND TRUNC(t1.fd_data1) > TRUNC(t2.fd_data1)
         AND fk_puttype = nType
         AND GET_PACKORPID(TKARTA.FK_ID,pFD_DATA) = pFK_KORPID
       UNION ALL
      SELECT GET_PACFIO(TKARTA.FK_ID) FC_FIO, fc_put, t2.fd_data1, t2.fd_data2,
             0 fn_opozd,
             GET_SUBVIDNAME(TKARTA.FK_KOD) as FC_SUBVID
        FROM tkarta, tsroky t1, tsroky t2
       WHERE tkarta.fk_id = t1.fk_pacid
         AND t1.fd_data1 BETWEEN pFD_DATA AND pFD_DATA+1-1/(24*60*60)
         AND t1.fk_pryb = 2
         AND t2.fk_pacid = t1.fk_pacid
         AND t2.fk_pryb = 1
         AND TRUNC(t1.fd_data1) <= TRUNC(t2.fd_data1)
         AND fk_puttype = nType
         AND GET_PACKORPID(TKARTA.FK_ID,pFD_DATA) = pFK_KORPID
       UNION ALL
      SELECT GET_PACFIO(TKARTA.FK_ID) || ' (восст.)' FC_FIO, fc_put, t2.fd_data1, t2.fd_data2,
             TRUNC(t3.fd_data1) - TRUNC(t2.fd_data1) fn_opozd,
             GET_SUBVIDNAME(TKARTA.FK_KOD) as FC_SUBVID
        FROM tkarta, tsroky t1, tsroky t2, tsroky t3
       WHERE tkarta.fk_id = t1.fk_pacid
         AND t1.fd_data1 BETWEEN pFD_DATA AND pFD_DATA+1-1/(24*60*60)
         AND t1.fk_pryb = 4
         AND t2.fk_pacid = t1.fk_pacid
         AND t1.fk_pacid = t3.fk_pacid
         AND t2.fk_pryb = 1
         AND t3.fk_vyb = 7
         AND TRUNC(t1.fd_data1) > TRUNC(t2.fd_data1)
         AND fk_puttype = nType
         AND GET_PACKORPID(TKARTA.FK_ID,pFD_DATA) = pFK_KORPID
       UNION ALL
      SELECT GET_PACFIO(TKARTA.FK_ID) || ' (восст.)' FC_FIO, fc_put, t2.fd_data1, t2.fd_data2,
             0 fn_opozd,
             GET_SUBVIDNAME(TKARTA.FK_KOD) as FC_SUBVID
        FROM tkarta, tsroky t1, tsroky t2
       WHERE tkarta.fk_id = t1.fk_pacid
         AND t1.fd_data1 BETWEEN pFD_DATA AND pFD_DATA+1-1/(24*60*60)
         AND t1.fk_pryb = 4
         AND t2.fk_pacid = t1.fk_pacid
         AND t2.fk_pryb = 1
         AND TRUNC(t1.fd_data1) <= TRUNC(t2.fd_data1)
         AND fk_puttype = nType
         AND GET_PACKORPID(TKARTA.FK_ID,pFD_DATA) = pFK_KORPID
       ORDER BY 1;
    CURSOR cVybAll(pFD_DATA DATE,nType NUMBER)
     IS
      SELECT GET_PACFIO(TKARTA.FK_ID) FC_FIO, fc_put, t2.fd_data1, t1.fd_data3,/*t2.fd_data2,*/
             TRUNC(t1.fd_data2) - TRUNC(t1.fd_data3) FN_VYBRANEE,
             GET_SUBVIDNAME(TKARTA.FK_KOD) as FC_SUBVID
        FROM tkarta, tsroky t1, tsroky t2
       WHERE tkarta.fk_id = t1.fk_pacid
         AND t1.fd_data3 BETWEEN pFD_DATA AND pFD_DATA+1-1/(24*60*60)
         AND t1.fk_vyb = 3
         AND t2.fk_pacid = t1.fk_pacid
         AND t2.fk_pryb = 1
         AND fk_puttype = nType
       UNION ALL
      SELECT GET_PACFIO(TKARTA.FK_ID) ||' (врем.)' FC_FIO, fc_put, t2.fd_data1, t1.fd_data3,/*t2.fd_data2,*/
             TRUNC(t1.fd_data2) - TRUNC(t1.fd_data3) FN_VYBRANEE,
             GET_SUBVIDNAME(TKARTA.FK_KOD) as FC_SUBVID
        FROM tkarta, tsroky t1, tsroky t2
       WHERE tkarta.fk_id = t1.fk_pacid
         AND t1.fd_data3 BETWEEN pFD_DATA AND pFD_DATA+1-1/(24*60*60)
         AND t1.fk_vyb = 7
         AND t2.fk_pacid = t1.fk_pacid
         AND t2.fk_pryb = 1
         AND fk_puttype = nType
       ORDER BY 1;
    CURSOR cVybKorp(pFD_DATA DATE,nType NUMBER)
     IS
      SELECT GET_PACFIO(TKARTA.FK_ID) FC_FIO, fc_put, t2.fd_data1, t1.fd_data3,/*t2.fd_data2,*/
             TRUNC(t1.fd_data2) - TRUNC(t1.fd_data3) FN_VYBRANEE,
             GET_SUBVIDNAME(TKARTA.FK_KOD) as FC_SUBVID
        FROM tkarta, tsroky t1, tsroky t2
       WHERE tkarta.fk_id = t1.fk_pacid
         AND t1.fd_data3 BETWEEN pFD_DATA AND pFD_DATA+1-1/(24*60*60)
         AND t1.fk_vyb = 3
         AND t2.fk_pacid = t1.fk_pacid
         AND t2.fk_pryb = 1
         AND fk_puttype = nType
         AND GET_PACKORPID(TKARTA.FK_ID,pFD_DATA) = pFK_KORPID
       UNION ALL
      SELECT GET_PACFIO(TKARTA.FK_ID) ||' (врем.)' FC_FIO, fc_put, t2.fd_data1, t1.fd_data3,/*t2.fd_data2,*/
             TRUNC(t1.fd_data2) - TRUNC(t1.fd_data3) FN_VYBRANEE,
             GET_SUBVIDNAME(TKARTA.FK_KOD) as FC_SUBVID
        FROM tkarta, tsroky t1, tsroky t2
       WHERE tkarta.fk_id = t1.fk_pacid
         AND t1.fd_data3 BETWEEN pFD_DATA AND pFD_DATA+1-1/(24*60*60)
         AND t1.fk_vyb = 7
         AND t2.fk_pacid = t1.fk_pacid
         AND t2.fk_pryb = 1
         AND fk_puttype = nType
         AND GET_PACKORPID(TKARTA.FK_ID,pFD_DATA) = pFK_KORPID
       ORDER BY 1;
    nC NUMBER;
    cC CLOB;
    str VARCHAR2 (32767);
    nTotal NUMBER;
    nShortTotal NUMBER;
    n1 NUMBER;
    n2 NUMBER;
  BEGIN
    INSERT INTO TCLOBS(FC_CLOB)
         VALUES (EMPTY_CLOB())
      RETURNING FK_ID,FC_CLOB INTO nC,cC;
    DBMS_LOB.OPEN(cC,DBMS_LOB.LOB_READWRITE);
    str := PKG_HTML.GET_HEAD('word','Рапортичка о движении больных (отдыхающих) по санаторию "' ||PKG_SMINI.READSTRING('CONFIG','S_NAME','Не известен')||'"',
                             null,'10.0',null,
                             null,null,null,
                             null,null,null,
                             null,null,null,
                             '10','10','20','20',
                             null,null,null,'left',
                             null,null,null,null,
                             null,null,null);
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    str:='<body><div class=user>'||
         '<table style=''border:none;mso-border-alt:none''><tr>'||
         '<td width="40%" valign=top style=''border:none;mso-border-alt:none''><p class=user>Санаторий «'|| PKG_SMINI.READSTRING ('CONFIG', 'S_NAME', 'Не известен') ||'»<BR>'||PKG_R_ALLFUNC.Return_Value ( GET_KORPNAME(pFK_KORPID) )||'</p></td>'||
         '<td width="60%" valign=top style=''border:none;mso-border-alt:none''><p class=user><b>РАПОРТИЧКА<BR>о движении отдыхающих по санаторию<BR>за '|| TO_CHAR(pFD_DATA,'dd.mm.yyyy') ||' г.</b></p></td></tr></table>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);

    str:='<table><tr>'||
         '<td width=3% rowspan=3><p class=user>№ п.п.</p></td>'||
         '<td width=40% rowspan=3><p class=user>Движение</p></td>'||
         '<td width=6% rowspan=3><p class=user>Человек</p></td>'||
         '<td width=12% colspan=2 rowspan=2><p class=user>Прибыло с опозданием</p></td>'||
         '<td width=12% colspan=2 rowspan=2><p class=user>Убыло ранее срока</p></td>'||
         '<td width=24% colspan=4><p class=user>В т.ч. прод. леч.</p></td></tr><tr>'||
         '<td width=12% colspan=2><p class=user>в счет опоздания</p></td>'||
         '<td width=12% colspan=2><p class=user>за нал. расчет</p></td></tr><tr>'||
         '<td width=6%><p class=user>чел.</p></td>'||
         '<td width=6%><p class=user>к/дн</p></td>'||
         '<td width=6%><p class=user>чел.</p></td>'||
         '<td width=6%><p class=user>к/дн</p></td>'||
         '<td width=6%><p class=user>чел.</p></td>'||
         '<td width=6%><p class=user>к/дн</p></td>'||
         '<td width=6%><p class=user>чел.</p></td>'||
         '<td width=6%><p class=user>к/дн</p></td></tr>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    str:='<tr><td width="3%"><p class=user>1.</p></td>'||
         '<td width="40%"><p class=user>Численность на 8:00</p></td>'||
         '<td width="6%"><p class=user>'|| PKG_R_ALLFUNC.GET_COUNT_MORNING_KORP(pFD_DATA + 8/24,pFK_KORPID) /*nTotal*/ ||'</p></td>'||
         '<td width="6%"><p class=user>&nbsp;</p></td>'||
         '<td width="6%"><p class=user>&nbsp;</p></td>'||
         '<td width="6%"><p class=user>&nbsp;</p></td>'||
         '<td width="6%"><p class=user>&nbsp;</p></td>'||
         '<td width="6%"><p class=user>&nbsp;</p></td>'||
         '<td width="6%"><p class=user>&nbsp;</p></td>'||
         '<td width="6%"><p class=user>&nbsp;</p></td>'||
         '<td width="6%"><p class=user>&nbsp;</p></td></tr>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    if pFK_KORPID > 0 then
      OPEN cPrybRanKorp;
      FETCH cPrybRanKorp INTO nTotal,nShortTotal;
      CLOSE cPrybRanKorp;
    else
      OPEN cPrybRanAll;
      FETCH cPrybRanAll INTO nTotal,nShortTotal;
      CLOSE cPrybRanAll;
    end if;
    str:='<tr><td width="3%"><p class=user>2.</p></td>'||
         '<td width="40%"><p class=user>Прибыло</p></td>'||
         '<td width="6%"><p class=user>'|| PKG_R_ALLFUNC.GET_COUNT_PRYB_KORP(pFD_DATA,pFK_KORPID) ||'</p></td>'||
         '<td width="6%"><p class=user>'|| nTotal ||'</p></td>'||
         '<td width="6%"><p class=user>'|| NVL(nShortTotal,0) ||'</p></td>'||
         '<td width="6%"><p class=user>&nbsp;</p></td>'||
         '<td width="6%"><p class=user>&nbsp;</p></td>'||
         '<td width="6%"><p class=user>&nbsp;</p></td>'||
         '<td width="6%"><p class=user>&nbsp;</p></td>'||
         '<td width="6%"><p class=user>&nbsp;</p></td>'||
         '<td width="6%"><p class=user>&nbsp;</p></td></tr>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    if pFK_KORPID > 0 then
      OPEN cVybRanKorp;
      FETCH cVybRanKorp INTO nTotal,nShortTotal;
      CLOSE cVybRanKorp;
    else
      OPEN cVybRanAll;
      FETCH cVybRanAll INTO nTotal,nShortTotal;
      CLOSE cVybRanAll;
    end if;
    str:='<tr><td width="3%"><p class=user>3.</p></td>'||
         '<td width="40%"><p class=user>Убыло</p></td>'||
         '<td width="6%"><p class=user>'|| PKG_R_ALLFUNC.GET_COUNT_VYB_KORP(pFD_DATA,pFK_KORPID) ||'</p></td>'||
         '<td width="6%"><p class=user>&nbsp;</p></td>'||
         '<td width="6%"><p class=user>&nbsp;</p></td>'||
         '<td width="6%"><p class=user>'|| nTotal ||'</p></td>'||
         '<td width="6%"><p class=user>'|| NVL(nShortTotal,0) ||'</p></td>'||
         '<td width="6%"><p class=user>&nbsp;</p></td>'||
         '<td width="6%"><p class=user>&nbsp;</p></td>'||
         '<td width="6%"><p class=user>&nbsp;</p></td>'||
         '<td width="6%"><p class=user>&nbsp;</p></td></tr>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    str:='<tr><td width="3%"><p class=user>4.</p></td>'||
         '<td width="40%"><p class=user>Численность на 8:00 следущего дня</p></td>'||
         '<td width="6%" align=center><p class=user>'|| PKG_R_ALLFUNC.GET_COUNT_MORNING_KORP(pFD_DATA + 1 + 8/24,pFK_KORPID) /*nTotal*/||'</p></td>'||
         '<td width="6%"><p class=user>&nbsp;</p></td>'||
         '<td width="6%"><p class=user>&nbsp;</p></td>'||
         '<td width="6%"><p class=user>&nbsp;</p></td>'||
         '<td width="6%"><p class=user>&nbsp;</p></td>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    if pFK_KORPID > 0 then
      OPEN cProdlKorp(6);
      FETCH cProdlKorp INTO nTotal,nShortTotal;
      CLOSE cProdlKorp;
    else
      OPEN cProdlAll(6);
      FETCH cProdlAll INTO nTotal,nShortTotal;
      CLOSE cProdlAll;
    end if;
    str:='<td width="6%" align=center><p class=user>'||nTotal||'</p></td>'||
         '<td width="6%" align=center><p class=user>'||NVL(nShortTotal,0)||'</p></td>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    if pFK_KORPID > 0 then
      OPEN cProdlKorp(5);
      FETCH cProdlKorp INTO nTotal,nShortTotal;
      CLOSE cProdlKorp;
    else
      OPEN cProdlAll(5);
      FETCH cProdlAll INTO nTotal,nShortTotal;
      CLOSE cProdlAll;
    end if;
    str:='<td width="6%" align=center><p class=user>'||nTotal||'</p></td>'||
         '<td width="6%" align=center><p class=user>'||NVL(nShortTotal,0)||'</p></td></tr></table>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    str:='<BR><p class=user align=center><b>A. СВЕДЕНИЯ</b><BR>на прибывших отдыхающих за '|| TO_CHAR(pFD_DATA,'dd.mm.yyyy') ||' г.</p><BR>'||
         '<table><tr>'||
         '<td width="3%" rowspan=2><p class=user>№ п.п.</p></td>'||
         '<td width="20%" rowspan=2><p class=user>Ф.И.О.</p></td>'||
         '<td width="8%" rowspan=2><p class=user>Номера путевок</p></td>'||
         '<td width="40%" colspan=2><p class=user>Срок путевки</p></td>'||
         '<td width="8%" rowspan=2><p class=user>Опоздание в к/днях</p></td>'||
         '<td width="20%" rowspan=2><p class=user>Подразделение</p></td></tr>'||
         '<tr><td width="20%"><p class=user>с</p></td>'||
         '<td width="20%"><p class=user>по</p></td></tr>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    n1:=1;
    n2:=0;
    for p IN cTypePut loop
      if p.FC_VID IS NOT NULL THEN
        str:='<TR><TD COLSPAN="7"><P class=user><U>'||p.FC_VID||'</U></P></TD></TR>';
      ELSE
        str:='<TR><TD COLSPAN="7"><P class=user>&nbsp;</P></TD></TR>';
      END IF;
      if pFK_KORPID > 0 then
        FOR n IN cPrybKorp(pFD_DATA,p.FK_ID) LOOP
          str:=str||'<tr><td width="3%"><p class=user>'||n1||'.</p></td>'||
                    '<td class=user width="20%"><p class=user>'||n.FC_FIO||'</p></td>'||
                    '<td width="8%"><p align=right class=user>'||PKG_R_ALLFUNC.RETURN_VALUE(n.FC_PUT)||'</p></td>'||
                    '<td width="20%"><p class=user>'||TO_CHAR(n.FD_DATA1,'dd.mm.yyyy hh24:mi')||'</p></td>'||
                    '<td width="20%"><p class=user>'||TO_CHAR(n.FD_DATA2,'dd.mm.yyyy hh24:mi')||'</p></td>'||
                    '<td width="8%"><p class=user>'||PKG_R_ALLFUNC.RETURN_VALUE(n.FN_OPOZD)||'</p></td>'||
                    '<td class=user width="20%"><p class=user>'||PKG_R_ALLFUNC.RETURN_VALUE( n.FC_SUBVID )||'</p></td></tr>';
          n2:=n2+n.FN_OPOZD;
          n1:=n1+1;
          DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
          str:='';
        end loop;
      else
        FOR n IN cPrybAll(pFD_DATA,p.FK_ID) LOOP
          str:=str||'<tr><td width="3%"><p class=user>'||n1||'.</p></td>'||
                    '<td class=user width="20%"><p class=user>'||n.FC_FIO||'</p></td>'||
                    '<td width="8%"><p align=right class=user>'||PKG_R_ALLFUNC.RETURN_VALUE(n.FC_PUT)||'</p></td>'||
                    '<td width="20%"><p class=user>'||TO_CHAR(n.FD_DATA1,'dd.mm.yyyy hh24:mi')||'</p></td>'||
                    '<td width="20%"><p class=user>'||TO_CHAR(n.FD_DATA2,'dd.mm.yyyy hh24:mi')||'</p></td>'||
                    '<td width="8%"><p class=user>'||PKG_R_ALLFUNC.RETURN_VALUE(n.FN_OPOZD)||'</p></td>'||
                    '<td class=user width="20%"><p class=user>'||PKG_R_ALLFUNC.RETURN_VALUE( n.FC_SUBVID )||'</p></td></tr>';
          n2:=n2+n.FN_OPOZD;
          n1:=n1+1;
          DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
          str:='';
        end loop;
      end if;
    end loop;
    str:='<tr><td width="3%" style=''border:none;mso-border-alt:none''><p class=user>&nbsp;</p></td>'||
         '<td width="20%" style=''border:none;mso-border-alt:none''><p class=user align=right>Всего прибыло</p></td>'||
         '<td width="8%"><p class=user>'||TO_CHAR(n1-1)||'</p></td>'||
         '<td width="20%"><p class=user>&nbsp;</p></td>'||
         '<td width="20%"><p class=user>&nbsp;</p></td>'||
         '<td width="8%"><p class=user>'||n2||'</p></td>'||
         '<td width="20"><p class=user>&nbsp;</p></td></tr></table>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    str:='<BR><p class=user>Путевки на прибывших отдыхающих в кол-ве '|| PKG_R_ALLFUNC.GET_COUNT_INC_PUT(pFD_DATA) /*nTotal*/||' штук прилагаются<BR>'||
         '<BR><B>Медрегистратор___________________ '|| DO_VRACHFIO (pFK_VRACHID)||'</B></p></div>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    str:='<br clear=all style=''page-break-before:always;mso-break-type:section-break''>'||
         '<div class=user><p class=user align=center><b>Б. СВЕДЕНИЯ</b><BR>на убывших отдыхающих за '|| TO_CHAR(pFD_DATA,'dd.mm.yyyy') ||' г.</p><BR>'||
         '<table><tr>'||
         '<td width="3%" rowspan=2><p class=user>№ п.п.</p></td>'||
         '<td width="20%" rowspan=2><p class=user>Ф.И.О.</p></td>'||
         '<td width="8%" rowspan=2><p class=user>Номера путевок</p></td>'||
         '<td width="40%" colspan=2><p class=user>Срок путевки с учетом продл.</p></td>'||
         '<td width="8%" rowspan=2><p class=user>Убытие ранее срока в к/днях</p></td>'||
         '<td width="20%" rowspan=2><p class=user>Подразделение</p></td></tr>'||
         '<tr><td width="20%"><p class=user>с</p></td>'||
         '<td width="20%"><p class=user>по</p></td></tr>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    str:='';
    n1:=1;
    n2:=0;
    for p IN cTypePut loop
      if p.FC_VID IS NOT NULL THEN
        str:='<TR><TD COLSPAN="7"><P class=user><U>'||p.FC_VID||'</U></P></TD></TR>';
      ELSE
        str:='<TR><TD COLSPAN="7"><P class=user>&nbsp;</P></TD></TR>';
      END IF;
      if pFK_KORPID > 0 then
        FOR n IN cVybKorp(pFD_DATA,p.FK_ID) LOOP
          str:=str||'<tr><td width="3%"><p class=user>'||n1||'.</p></td>'||
                    '<td class=user width="20%"><p class=user>'||n.FC_FIO||'</p></td>'||
                    '<td width="8%"><p align=right class=user>'||PKG_R_ALLFUNC.RETURN_VALUE(n.FC_PUT)||'</p></td>'||
                    '<td width="20%"><p class=user>'||TO_CHAR(n.FD_DATA1,'dd.mm.yyyy hh24:mi')||'</p></td>'||
                    '<td width="20%"><p class=user>'||TO_CHAR(n.FD_DATA3,'dd.mm.yyyy hh24:mi')||'</p></td>'||
                    '<td width="8%"><p class=user>'||PKG_R_ALLFUNC.RETURN_VALUE(n.FN_VYBRANEE)||'</p></td>'||
                    '<td class=user width="20%"><p class=user>'||PKG_R_ALLFUNC.RETURN_VALUE( n.FC_SUBVID )||'</p></td></tr>';
          n2:=n2+n.FN_VYBRANEE;
          n1:=n1+1;
          DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
          str:='';
        end loop;
      else
        FOR n IN cVybAll(pFD_DATA,p.FK_ID) LOOP
          str:=str||'<tr><td width="3%"><p class=user>'||n1||'.</p></td>'||
                    '<td class=user width="20%"><p class=user>'||n.FC_FIO||'</p></td>'||
                    '<td width="8%"><p align=right class=user>'||PKG_R_ALLFUNC.RETURN_VALUE(n.FC_PUT)||'</p></td>'||
                    '<td width="20%"><p class=user>'||TO_CHAR(n.FD_DATA1,'dd.mm.yyyy hh24:mi')||'</p></td>'||
                    '<td width="20%"><p class=user>'||TO_CHAR(n.FD_DATA3,'dd.mm.yyyy hh24:mi')||'</p></td>'||
                    '<td width="8%"><p class=user>'||PKG_R_ALLFUNC.RETURN_VALUE(n.FN_VYBRANEE)||'</p></td>'||
                    '<td class=user width="20%"><p class=user>'||PKG_R_ALLFUNC.RETURN_VALUE( n.FC_SUBVID )||'</p></td></tr>';
          n2:=n2+n.FN_VYBRANEE;
          n1:=n1+1;
          DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
          str:='';
        end loop;
      end if;
    end loop;
    str:='<tr><td width="3%" style=''border:none;mso-border-alt:none''><p class=user>&nbsp;</p></td>'||
         '<td width="20%" style=''border:none;mso-border-alt:none''><p class=user align=right>Всего убыло</p></td>'||
         '<td width="8%"><p class=user>'||TO_CHAR(n1-1)||'</p></td>'||
         '<td width="20%"><p class=user>&nbsp;</p></td>'||
         '<td width="20%"><p class=user>&nbsp;</p></td>'||
         '<td width="8%"><p class=user>'||n2||'</p></td>'||
         '<td width="20"><p class=user>&nbsp;</p></td></tr></table>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    str:='<BR><p class=user><B>Медрегистратор___________________ '|| DO_VRACHFIO (pFK_VRACHID)||'<BR>'||
         TO_CHAR(SYSDATE,'dd.mm.yyyy') ||' г.<BR>'||
         'Главный бухгалтер___________________ </b></p></div></body></html>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
    DBMS_LOB.CLOSE (cC);
    RETURN nC;
  END;
END;
/

SHOW ERRORS;


