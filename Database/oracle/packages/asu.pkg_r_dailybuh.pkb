DROP PACKAGE BODY ASU.PKG_R_DAILYBUH
/

--
-- PKG_R_DAILYBUH  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_R_DAILYBUH" -- Modified by TimurLan
 IS
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
  FUNCTION DO_CALC_REPORT(pFD_DATA IN DATE,pFC_REMARK IN VARCHAR2,pFK_VRACHID IN NUMBER,pFK_KORPID IN NUMBER)
  RETURN NUMBER
   IS-- Used in rDailyBuh.dpr
    CURSOR c1All(pDATA IN DATE) IS
          select rownum,
                 GET_PACFIO(tkarta.fk_id) FC_FIO,
                 tkarta.fc_put,
                 GET_PACSUBVID(TKARTA.FK_KOD2,TKARTA.FK_KOD) FC_VID
            from tkarta,tsroky
           where tkarta.fk_id=tsroky.fk_pacid
             and tsroky.fk_pryb in (2,4)
--           and TRUNC(fd_data1) = pData;
             AND FD_DATA1 BETWEEN pDATA AND pDATA+1-1/(24*60*60);
    CURSOR c1Korp(pDATA IN DATE) IS
          select rownum,
                 GET_PACFIO(tkarta.fk_id) FC_FIO,
                 tkarta.fc_put,
                 GET_PACSUBVID(TKARTA.FK_KOD2,TKARTA.FK_KOD) FC_VID
            from tkarta,tsroky
           where tkarta.fk_id=tsroky.fk_pacid
             and tsroky.fk_pryb in (2,4)
--           and TRUNC(fd_data1) = pData;
             AND FD_DATA1 BETWEEN pDATA AND pDATA+1-1/(24*60*60)
             AND GET_PACKORPID(FK_PACID,pDATA)=pFK_KORPID;
    CURSOR c1cAll(pDATA IN DATE) IS
          select COUNT(TKARTA.FK_ID)
            from tkarta,tsroky
           where tkarta.fk_id=tsroky.fk_pacid
             and tsroky.fk_pryb in (2,4)
--           and TRUNC(fd_data1) = pData;
             AND FD_DATA1 BETWEEN pDATA AND pDATA+1-1/(24*60*60);
    CURSOR c1cKorp(pDATA IN DATE) IS
          select COUNT(TKARTA.FK_ID)
            from tkarta,tsroky
           where tkarta.fk_id=tsroky.fk_pacid
             and tsroky.fk_pryb in (2,4)
--           and TRUNC(fd_data1) = pData;
             AND FD_DATA1 BETWEEN pDATA AND pDATA+1-1/(24*60*60)
             AND GET_PACKORPID(FK_PACID,pDATA)=pFK_KORPID;
    CURSOR c2All(pDATA IN DATE) IS
          select rownum,
                 GET_PACFIO(tkarta.fk_id) FC_FIO,
                 tkarta.fc_put,
                 GET_PACSUBVID(TKARTA.FK_KOD2,TKARTA.FK_KOD) FC_VID
            from tkarta,tsroky
           where tkarta.fk_id=tsroky.fk_pacid
             and fk_pryb in (3,7)
--           and TRUNC(fd_data1) = pDATA;
             AND FD_DATA1 BETWEEN pDATA AND pDATA+1-1/(24*60*60);
    CURSOR c2Korp(pDATA IN DATE) IS
          select rownum,
                 GET_PACFIO(tkarta.fk_id) FC_FIO,
                 tkarta.fc_put,
                 GET_PACSUBVID(TKARTA.FK_KOD2,TKARTA.FK_KOD) FC_VID
            from tkarta,tsroky
           where tkarta.fk_id=tsroky.fk_pacid
             and fk_pryb in (3,7)
--           and TRUNC(fd_data1) = pDATA;
             AND FD_DATA1 BETWEEN pDATA AND pDATA+1-1/(24*60*60)
             AND GET_PACKORPID(FK_PACID,pDATA)=pFK_KORPID;
    CURSOR c2cAll(pDATA IN DATE) IS
          select COUNT(TKARTA.FK_ID)
            from tkarta,tsroky
           where tkarta.fk_id=tsroky.fk_pacid
             and fk_pryb in (3,7)
--           and TRUNC(fd_data1) = pDATA;
             AND FD_DATA1 BETWEEN pDATA AND pDATA+1-1/(24*60*60);
    CURSOR c2cKorp(pDATA IN DATE) IS
          select COUNT(TKARTA.FK_ID)
            from tkarta,tsroky
           where tkarta.fk_id=tsroky.fk_pacid
             and fk_pryb in (3,7)
--           and TRUNC(fd_data1) = pDATA;
             AND FD_DATA1 BETWEEN pDATA AND pDATA+1-1/(24*60*60)
             AND GET_PACKORPID(FK_PACID,pDATA)=pFK_KORPID;
    CURSOR cAll(dData DATE) IS
          select tkarta.rowid,
                 GET_PACFIO(TKARTA.FK_ID) as FC_FIO,
                 tkarta.fc_put,
                 tcompany.FC_SHORT
            from tkarta,tsroky,tpisma,tcompany
           where tsroky.fk_pryb=2
             and FD_DATA1 BETWEEN dDATA AND dDATA+1-1/(24*60*60)
--           and TRUNC(tsroky.fd_data1)=dDATA
--             AND dDATA BETWEEN FD_DATA1 AND FD_DATA1+1-1/(24*60*60)
             AND tkarta.fk_id=tsroky.fk_pacid
             and tkarta.fk_kod2=1 and tpisma.fk_id=tkarta.fk_kod and tcompany.fk_id=tpisma.fk_predid
           UNION
          select tkarta.rowid,
                 GET_PACFIO(TKARTA.FK_ID) as FC_FIO,
                 tkarta.fc_put,
                 tcompany.FC_SHORT
            from tkarta,tsroky,tdogovor,tcompany
           where tsroky.fk_pryb=2
             and FD_DATA1 BETWEEN dDATA AND dDATA+1-1/(24*60*60)
--           and TRUNC(tsroky.fd_data1)=dData
--             AND dDATA BETWEEN FD_DATA1 AND FD_DATA1+1-1/(24*60*60)
             AND tkarta.fk_id=tsroky.fk_pacid
             and tkarta.fk_kod2=2 and tdogovor.fk_id=tkarta.fk_kod and tcompany.fk_id=tdogovor.fk_predid;
    CURSOR cKorp(dData DATE) IS
          select tkarta.rowid,
                 GET_PACFIO(TKARTA.FK_ID) as FC_FIO,
                 tkarta.fc_put,
                 tcompany.FC_SHORT
            from tkarta,tsroky,tpisma,tcompany
           where tsroky.fk_pryb=2
             and FD_DATA1 BETWEEN dDATA AND dDATA+1-1/(24*60*60)
--           and TRUNC(tsroky.fd_data1)=dDATA
--             AND dDATA BETWEEN FD_DATA1 AND FD_DATA1+1-1/(24*60*60)
             AND tkarta.fk_id=tsroky.fk_pacid
             and tkarta.fk_kod2=1 and tpisma.fk_id=tkarta.fk_kod and tcompany.fk_id=tpisma.fk_predid
             AND GET_PACKORPID(FK_PACID,dData)=pFK_KORPID
           UNION
          select tkarta.rowid,
                 GET_PACFIO(TKARTA.FK_ID) as FC_FIO,
                 tkarta.fc_put,
                 tcompany.FC_SHORT
            from tkarta,tsroky,tdogovor,tcompany
           where tsroky.fk_pryb=2
             and FD_DATA1 BETWEEN dDATA AND dDATA+1-1/(24*60*60)
--           and TRUNC(tsroky.fd_data1)=dData
--             AND dDATA BETWEEN FD_DATA1 AND FD_DATA1+1-1/(24*60*60)
             AND tkarta.fk_id=tsroky.fk_pacid
             and tkarta.fk_kod2=2 and tdogovor.fk_id=tkarta.fk_kod and tcompany.fk_id=tdogovor.fk_predid
             AND GET_PACKORPID(FK_PACID,dData)=pFK_KORPID;
    cl CLOB;
    str VARCHAR2(32767);
    nc NUMBER;
    rc NUMBER;
    i NUMBER;
    nRow NUMBER;
    cFIO VARCHAR2(200);
    cVID VARCHAR2(200);
    cPUT VARCHAR2(200);
  BEGIN
    INSERT INTO TCLOBS(FC_CLOB)
         VALUES (EMPTY_CLOB())
      RETURNING FK_ID,FC_CLOB INTO rC,cl;
    DBMS_LOB.OPEN(cl,DBMS_LOB.LOB_READWRITE);

    str := PKG_HTML.GET_HEAD('word','ЕЖЕДНЕВНЫЕ СВЕДЕНИЯ о движении санаторных больных по санаторию "'||PKG_SMINI.READSTRING('CONFIG','S_NAME','Не известен')||'" за '||TO_CHAR(pFD_DATA,'dd.mm.yyyy'),
                             null,'10.0',null,
                             null,null,null,
                             null,null,null,
                             null,null,null,
                             null,'10',null,'20',
                             null,null,null,'left',
                             null,null,null,null,
                             null,null,null);
    DBMS_LOB.WRITEAPPEND(cl,LENGTH(str),str);

    str:='<BODY><DIV class=user><P ALIGN="CENTER"><b>ЕЖЕДНЕВНЫЕ СВЕДЕНИЯ<BR>'||
         'о движении санаторных больных<BR>по санаторию "'||PKG_SMINI.READSTRING('CONFIG','S_NAME','Не известен')||'" за '||TO_CHAR(pFD_DATA,'dd.mm.yyyy')||'</B><BR>'||PKG_R_ALLFUNC.Return_Value ( GET_KORPNAME(pFK_KORPID) )||'</P>';
    DBMS_LOB.WRITEAPPEND(cl,LENGTH(str),str);

    str:='<BR><P style=''font-family:"Courier New"''>'||
         'Состояло на начало дня______________________ '|| PKG_R_ALLFUNC.GET_COUNT_MORNING_KORP (pFD_DATA,pFK_KORPID) ||'<BR>'||
         'Прибыло_____________________________________ '|| TO_CHAR(PKG_R_ALLFUNC.GET_COUNT_INC_KORP(pFD_DATA,pFK_KORPID)+PKG_R_ALLFUNC.GET_COUNT_RECOVER_KORP(pFD_DATA,pFK_KORPID)) ||'<BR>'||
         '&nbsp;&nbsp;в т.ч. восстановилось_____________________ '|| PKG_R_ALLFUNC.GET_COUNT_RECOVER_KORP(pFD_DATA,pFK_KORPID) ||'<BR>'||
         'Выбыло______________________________________ '|| TO_CHAR(PKG_R_ALLFUNC.GET_COUNT_OUT_KORP(pFD_DATA,pFK_KORPID)+PKG_R_ALLFUNC.GET_COUNT_TEMPOUT_KORP(pFD_DATA,pFK_KORPID)) ||'<BR>'||
         '&nbsp;&nbsp;в т.ч. временно___________________________ '|| PKG_R_ALLFUNC.GET_COUNT_TEMPOUT_KORP(pFD_DATA,pFK_KORPID) ||'<BR>'||
         'Состоит на конец дня________________________ '|| PKG_R_ALLFUNC.GET_COUNT_MORNING_KORP(pFD_DATA+1,pFK_KORPID) ||'<BR>'||
         'Проведено койко дней________________________ '|| PKG_R_KDNFUNC.GET_KDN_KORP(pFD_DATA,pFK_KORPID) ||'<BR>'||
         'Примечание:'||pFC_REMARK||'<BR>'||
         'Продлено за наличный расчет_________________ '|| PKG_R_ALLFUNC.GET_COUNT_PRODL_NAL_KORP(pFD_DATA,pFK_KORPID) ||'<BR>'||
         'Продлено в счет опоздания___________________ '|| PKG_R_ALLFUNC.GET_COUNT_PRODL_OPOZD_KORP(pFD_DATA,pFK_KORPID) ||'<BR>'||
         'Досрочно выбыло из числа прибывших__________ '|| PKG_R_ALLFUNC.GET_COUNTV_EARLY_KORP(pFD_DATA,pFK_KORPID) ||'<BR>'||
         '&nbsp;&nbsp;в т.ч. временно___________________________ '|| PKG_R_ALLFUNC.GET_COUNTV_EARLY_TEMP_KORP(pFD_DATA,pFK_KORPID) ||'<BR>'||
         '</P><BR>';
    DBMS_LOB.WRITEAPPEND(cl,LENGTH(str),str);

    str:='<P ALIGN="CENTER"><B>Прибыло по письмам или договорам с предприятиями:</B></P><BR>';
    DBMS_LOB.WRITEAPPEND(cl,LENGTH(str),str);

    str:='<table>'||
         '<TR><TD><B>Ф.И.О.:</B></TD>'||
         '<TD><B>№ путевки:</B></TD>'||
         '<TD><B>От предприятия:</B></TD></TR>';
    DBMS_LOB.WRITEAPPEND(cl,LENGTH(str),str);

    str:='';
    if pFK_KORPID > 0 then
      FOR s IN cAll (pFD_DATA) LOOP
        str:=str||
             '<TR><TD class=user><P class=user>'||NVL(s.FC_FIO,'&nbsp;')||'</P></TD>'||
             '<TD><P class=user>'||NVL(s.FC_PUT,'&nbsp;')||'</P></TD>'||
             '<TD><P class=user>'||NVL(s.FC_SHORT,'&nbsp;')||'</P></TD></TR>';
      END LOOP;
    else
      FOR s IN cKorp (pFD_DATA) LOOP
        str:=str||
             '<TR><TD class=user><P class=user>'||NVL(s.FC_FIO,'&nbsp;')||'</P></TD>'||
             '<TD><P class=user>'||NVL(s.FC_PUT,'&nbsp;')||'</P></TD>'||
             '<TD><P class=user>'||NVL(s.FC_SHORT,'&nbsp;')||'</P></TD></TR>';
      END LOOP;
    end if;
    str:=str||'</table>';
    DBMS_LOB.WRITEAPPEND(cl,LENGTH(str),str);

  --  str:='<br clear=all style=''mso-special-character:line-break;page-break-before:always''>';
  --  DBMS_LOB.WRITEAPPEND(cl,LENGTH(str),str);

    str:='<BR><P ALIGN="CENTER"><B>Движение санаторных больных за '||TO_CHAR(pFD_DATA,'dd.mm.yyyy')||':</B></P><BR>';
    DBMS_LOB.WRITEAPPEND(cl,LENGTH(str),str);

    str:='<table>'||
         '<TR><TD><P class=user><B>№:</B></P></TD>'||
         '<TD><P class=user><B>Ф.И.О.(Прибыли):</B></P></TD>'||
         '<TD><P class=user><B>Тип:</B></P></TD>'||
         '<TD><P class=user><B>№ путевки:</B></P></TD>'||
         '<TD><P class=user><B>№:</B></P></TD>'||
         '<TD><P class=user><B>Ф.И.О.(Выбыли):</B></P></TD>'||
         '<TD><P class=user><B>Тип:</B></P></TD>'||
         '<TD><P class=user><B>№ путевки:</B></P></TD></TR>';
    DBMS_LOB.WRITEAPPEND(cl,LENGTH(str),str);
    IF pFK_KORPID > 0 THEN
      OPEN c1cKorp(pFD_DATA);
      FETCH c1cKorp INTO nc;
      CLOSE c1cKorp;

      OPEN c2cKorp(pFD_DATA);
      FETCH c2cKorp INTO i;
      CLOSE c2cKorp;

      if nc > i then
        OPEN c2Korp(pFD_DATA);
        FOR n IN c1Korp(pFD_DATA) LOOP
          str :=    '<TR><TD><P class=user>'||n.ROWNUM||'.</P></TD>'||
                    '<TD class=user><P class=user>'||NVL(n.FC_FIO,'&nbsp;')||'</P></TD>'||
                    '<TD><P class=user>'||NVL(n.FC_VID,'&nbsp;')||'</P></TD>'||
                    '<TD><P class=user>'||NVL(n.FC_PUT,'&nbsp;')||'</P></TD>';
          FETCH c2Korp INTO nROW,cFIO,cPUT,cVID;
          IF NOT c2Korp%NOTFOUND THEN
            str:=str||'<TD><P class=user>'||nROW||'.</P></TD>'||
                      '<TD class=user><P class=user>'||NVL(cFIO,'&nbsp;')||'</P></TD>'||
                      '<TD><P class=user>'||NVL(cVID,'&nbsp;')||'</P></TD>'||
                      '<TD><P class=user>'||NVL(cPUT,'&nbsp;')||'</P></TD></TR>';
          ELSE
            str:=str||'<TD><P class=user>&nbsp;</P></TD>'||
                      '<TD><P class=user>&nbsp;</P></TD>'||
                      '<TD><P class=user>&nbsp;</P></TD>'||
                      '<TD><P class=user>&nbsp;</P></TD></TR>';
          END IF;
          DBMS_LOB.WRITEAPPEND(cl,LENGTH(str),str);
        END LOOP;
        CLOSE c2Korp;
      ELSE
        OPEN c1Korp(pFD_DATA);
        FOR n IN c2Korp(pFD_DATA) LOOP
          FETCH c1Korp INTO nROW,cFIO,cPUT,cVID;
          IF NOT c1Korp%NOTFOUND THEN
            str:='<TR><TD><P class=user>'||nROW||'.</P></TD>'||
                 '<TD class=user><P class=user>'||NVL(cFIO,'&nbsp;')||'</P></TD>'||
                 '<TD><P class=user>'||NVL(cVID,'&nbsp;')||'</P></TD>'||
                 '<TD><P class=user>'||NVL(cPUT,'&nbsp;')||'</P></TD>';
          ELSE
            str:='<TR><TD><P class=user>&nbsp;</P></TD>'||
                 '<TD><P class=user>&nbsp;</P></TD>'||
                 '<TD><P class=user>&nbsp;</P></TD>'||
                 '<TD><P class=user>&nbsp;</P></TD>';
          END IF;
          str:=str||'<TD><P class=user>'||n.ROWNUM||'.</P></TD>'||
                    '<TD class=user><P class=user>'||NVL(n.FC_FIO,'&nbsp;')||'</P></TD>'||
                    '<TD><P class=user>'||NVL(n.FC_VID,'&nbsp;')||'</P></TD>'||
                    '<TD><P class=user>'||NVL(n.FC_PUT,'&nbsp;')||'</P></TD></TR>';
          DBMS_LOB.WRITEAPPEND(cl,LENGTH(str),str);
        END LOOP;
        CLOSE c1Korp;
      END IF;
    ELSE
      OPEN c1cAll(pFD_DATA);
      FETCH c1cAll INTO nc;
      CLOSE c1cAll;

      OPEN c2cAll(pFD_DATA);
      FETCH c2cAll INTO i;
      CLOSE c2cAll;

      if nc > i then
        OPEN c2All(pFD_DATA);
        FOR n IN c1All(pFD_DATA) LOOP
          str :=    '<TR><TD><P class=user>'||n.ROWNUM||'.</P></TD>'||
                    '<TD class=user><P class=user>'||NVL(n.FC_FIO,'&nbsp;')||'</P></TD>'||
                    '<TD><P class=user>'||NVL(n.FC_VID,'&nbsp;')||'</P></TD>'||
                    '<TD><P class=user>'||NVL(n.FC_PUT,'&nbsp;')||'</P></TD>';
          FETCH c2All INTO nROW,cFIO,cPUT,cVID;
          IF NOT c2All%NOTFOUND THEN
            str:=str||'<TD><P class=user>'||nROW||'.</P></TD>'||
                      '<TD class=user><P class=user>'||NVL(cFIO,'&nbsp;')||'</P></TD>'||
                      '<TD><P class=user>'||NVL(cVID,'&nbsp;')||'</P></TD>'||
                      '<TD><P class=user>'||NVL(cPUT,'&nbsp;')||'</P></TD></TR>';
          ELSE
            str:=str||'<TD><P class=user>&nbsp;</P></TD>'||
                      '<TD><P class=user>&nbsp;</P></TD>'||
                      '<TD><P class=user>&nbsp;</P></TD>'||
                      '<TD><P class=user>&nbsp;</P></TD></TR>';
          END IF;
          DBMS_LOB.WRITEAPPEND(cl,LENGTH(str),str);
        END LOOP;
        CLOSE c2All;
      ELSE
        OPEN c1All(pFD_DATA);
        FOR n IN c2All(pFD_DATA) LOOP
          FETCH c1All INTO nROW,cFIO,cPUT,cVID;
          IF NOT c1All%NOTFOUND THEN
            str:='<TR><TD><P class=user>'||nROW||'.</P></TD>'||
                 '<TD class=user><P class=user>'||NVL(cFIO,'&nbsp;')||'</P></TD>'||
                 '<TD><P class=user>'||NVL(cVID,'&nbsp;')||'</P></TD>'||
                 '<TD><P class=user>'||NVL(cPUT,'&nbsp;')||'</P></TD>';
          ELSE
            str:='<TR><TD><P class=user>&nbsp;</P></TD>'||
                 '<TD><P class=user>&nbsp;</P></TD>'||
                 '<TD><P class=user>&nbsp;</P></TD>'||
                 '<TD><P class=user>&nbsp;</P></TD>';
          END IF;
          str:=str||'<TD><P class=user>'||n.ROWNUM||'.</P></TD>'||
                    '<TD class=user><P class=user>'||NVL(n.FC_FIO,'&nbsp;')||'</P></TD>'||
                    '<TD><P class=user>'||NVL(n.FC_VID,'&nbsp;')||'</P></TD>'||
                    '<TD><P class=user>'||NVL(n.FC_PUT,'&nbsp;')||'</P></TD></TR>';
          DBMS_LOB.WRITEAPPEND(cl,LENGTH(str),str);
        END LOOP;
        CLOSE c1All;
      END IF;
    END IF;
    str:='</TABLE>'||
         '<BR><P><B>Отчет составил:_____________________'||DO_VRACHFIO(pFK_VRACHID)||'</B></P></DIV></BODY></HTML>';
    DBMS_LOB.WRITEAPPEND(cl,LENGTH(str),str);
    DBMS_LOB.CLOSE(cl);
    RETURN rc;
  END;
END;
/

SHOW ERRORS;


