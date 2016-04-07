DROP PACKAGE BODY ASU.PKG_DAILY_BUH_OLD
/

--
-- PKG_DAILY_BUH_OLD  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_DAILY_BUH_OLD" -- Modified by TimurLan
 IS
FUNCTION GET_COUNT_EARLY(pFD_DATA IN DATE) RETURN NUMBER IS
 CURSOR c(pDATA DATE) IS
        SELECT COUNT(ROWID)
          FROM TSROKY
         WHERE FK_PRYB=3
           AND FN_KOL>0
           AND TRUNC(FD_DATA1)=pDATA;
i NUMBER;
BEGIN
  OPEN c(pFD_DATA);
  FETCH c INTO i;
  CLOSE c;
  RETURN i;
END;
FUNCTION GET_COUNT_EARLY_TEMP(pFD_DATA IN DATE) RETURN NUMBER IS
 CURSOR c(pDATA DATE) IS
        SELECT COUNT(ROWID)
          FROM TSROKY
         WHERE FK_PRYB=7
           AND FN_KOL>0
           AND TRUNC(FD_DATA1)=pDATA;
i NUMBER;
BEGIN
  OPEN c(pFD_DATA);
  FETCH c INTO i;
  CLOSE c;
  RETURN i;
END;
FUNCTION DO_CALC_REPORT(pFD_DATA IN DATE,pFC_REMARK IN VARCHAR2,pFK_VRACHID IN NUMBER) RETURN NUMBER
 IS-- Used in rDailyBuh.dpr
 CURSOR c1(pDATA IN DATE) IS
        select rownum,
               GET_PACFIO(tkarta.fk_id) FC_FIO,
               tkarta.fc_put,
               GET_PACSUBVID(TKARTA.FK_KOD2,TKARTA.FK_KOD) FC_VID
          from tkarta,tsroky
         where tkarta.fk_id=tsroky.fk_pacid
           and (tsroky.fk_pryb in(2,4))
           and TRUNC(fd_data1) = pData;
 CURSOR c1c(pDATA IN DATE) IS
        select COUNT(TKARTA.FK_ID)
          from tkarta,tsroky
         where tkarta.fk_id=tsroky.fk_pacid
           and (tsroky.fk_pryb in(2,4))
           and TRUNC(fd_data1) = pData;
 CURSOR c2(pDATA IN DATE) IS
        select rownum,
               GET_PACFIO(tkarta.fk_id) FC_FIO,
               tkarta.fc_put,
               GET_PACSUBVID(TKARTA.FK_KOD2,TKARTA.FK_KOD) FC_VID
          from tkarta,tsroky
         where tkarta.fk_id=tsroky.fk_pacid
           and (tsroky.fk_pryb=3 or tsroky.fk_pryb=7)
           and TRUNC(fd_data1) = pDATA;
 CURSOR c2c(pDATA IN DATE) IS
        select COUNT(TKARTA.FK_ID)
          from tkarta,tsroky
         where tkarta.fk_id=tsroky.fk_pacid
           and (tsroky.fk_pryb=3 or tsroky.fk_pryb=7)
           and TRUNC(fd_data1) = pDATA;
 CURSOR c(dData DATE) IS
        select tkarta.rowid,
               GET_PACFIO(TKARTA.FK_ID) as FC_FIO,
               tkarta.fc_put,
               GET_COMPANY_NAME(TKARTA.FK_KOD) FC_SHORT
          from tkarta,tsroky/*,tpisma,tcompany*/
         where tkarta.fk_id=tsroky.fk_pacid
           and tsroky.fk_pryb=2
           and TRUNC(tsroky.fd_data1)=dDATA
           and tkarta.fk_kod2=1/* and tpisma.fk_id=tkarta.fk_kod and tcompany.fk_id=tpisma.fk_predid*/
         UNION
        select tkarta.rowid,
               GET_PACFIO(TKARTA.FK_ID) as FC_FIO,
               tkarta.fc_put,
               GET_COMPANY_NAME(TKARTA.FK_KOD) FC_SHORT
          from tkarta,tsroky/*,tdogovor,tcompany*/
         where tkarta.fk_id=tsroky.fk_pacid
           and tsroky.fk_pryb=2
           and TRUNC(tsroky.fd_data1)=dData
           and tkarta.fk_kod2=2; /*and tdogovor.fk_id=tkarta.fk_kod and tcompany.fk_id=tdogovor.fk_predid;*/
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
  INSERT INTO TCLOBS(FC_CLOB) VALUES(EMPTY_CLOB()) RETURNING FK_ID,FC_CLOB INTO rC,cl;
  DBMS_LOB.OPEN(cl,DBMS_LOB.LOB_READWRITE);
  str := PKG_HTML.GET_HEAD('word','ЕЖЕДНЕВНЫЕ СВЕДЕНИЯ о движении пациентов по медучреждению "'||PKG_SMINI.READSTRING('CONFIG','S_NAME','Не известен')||'" за '||TO_CHAR(pFD_DATA,'dd.mm.yyyy'),
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
       'о движении пациентов<BR>по медучреждению "'||PKG_SMINI.READSTRING('CONFIG','S_NAME','Не известен')||'" за '||TO_CHAR(pFD_DATA,'dd.mm.yyyy')||'</B></P>';
  DBMS_LOB.WRITEAPPEND(cl,LENGTH(str),str);
  str:='<BR><P style=''font-family:"Courier New"''>'||
       'Состояло на начало дня______________________ '||PAC_MOVEMENT.GET_COUNT_MORNING(pFD_DATA)||'<BR>'||
       'Прибыло_____________________________________ '||TO_CHAR(PAC_MOVEMENT.GET_COUNT_IN(pFD_DATA)+PAC_MOVEMENT.GET_COUNT_RECOVER(pFD_DATA))||'<BR>'||
       '&nbsp;&nbsp;в т.ч. восстановилось_____________________ '||PAC_MOVEMENT.GET_COUNT_RECOVER(pFD_DATA)||'<BR>'||
       'Выбыло______________________________________ '||TO_CHAR(PAC_MOVEMENT.GET_COUNT_OUT(pFD_DATA)+PAC_MOVEMENT.GET_COUNT_TEMPOUT(pFD_DATA))||'<BR>'||
       '&nbsp;&nbsp;в т.ч. временно___________________________ '||PAC_MOVEMENT.GET_COUNT_TEMPOUT(pFD_DATA)||'<BR>'||
       'Состоит на конец дня________________________ '||PAC_MOVEMENT.GET_COUNT_MORNING(pFD_DATA+1)||'<BR>'||
       'Проведено койко дней________________________ '||PAC_MOVEMENT.GET_KDN(pFD_DATA)||'<BR>'||
       'Примечание:'||pFC_REMARK||'<BR>'||
       'Продлено за наличный расчет_________________ '||GET_COUNTPRODLNALPAC(pFD_DATA)||'<BR>'||
       'Продлено в счет опоздания___________________ '||GET_COUNTPRODLOPOZDPAC(pFD_DATA)||'<BR>'||
       'Досрочно выбыло из числа прибывших__________ '||GET_COUNT_EARLY(pFD_DATA)||'<BR>'||
       '&nbsp;&nbsp;в т.ч. временно___________________________ '||GET_COUNT_EARLY_TEMP(pFD_DATA)||'<BR>'||
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
  FOR s IN c (pFD_DATA) LOOP
    str:=str||
         '<TR><TD class=user><P class=user>'||NVL(s.FC_FIO,'&nbsp;')||'</P></TD>'||
         '<TD><P class=user>'||NVL(s.FC_PUT,'&nbsp;')||'</P></TD>'||
         '<TD><P class=user>'||NVL(s.FC_SHORT,'&nbsp;')||'</P></TD></TR>';
  END LOOP;
  str:=str||'</table>';
  DBMS_LOB.WRITEAPPEND(cl,LENGTH(str),str);
--  str:='<br clear=all style=''mso-special-character:line-break;page-break-before:always''>';
--  DBMS_LOB.WRITEAPPEND(cl,LENGTH(str),str);
  str:='<BR><P ALIGN="CENTER"><B>Движение пациентов за '||TO_CHAR(pFD_DATA,'dd.mm.yyyy')||':</B></P><BR>';
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
  OPEN c1c(pFD_DATA);
  FETCH c1c INTO nc;
  CLOSE c1c;
  OPEN c2c(pFD_DATA);
  FETCH c2c INTO i;
  CLOSE c2c;
  if nc > i then
    OPEN c2(pFD_DATA);
    FOR n IN c1(pFD_DATA) LOOP
      str :=    '<TR><TD><P class=user>'||n.ROWNUM||'</P></TD>'||
                '<TD class=user><P class=user>'||NVL(n.FC_FIO,'&nbsp;')||'</P></TD>'||
                '<TD><P class=user>'||NVL(n.FC_VID,'&nbsp;')||'</P></TD>'||
                '<TD><P class=user>'||NVL(n.FC_PUT,'&nbsp;')||'</P></TD>';
      FETCH c2 INTO nROW,cFIO,cPUT,cVID;
      IF NOT c2%NOTFOUND THEN
        str:=str||'<TD><P class=user>'||nROW||'</P></TD>'||
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
    CLOSE c2;
  ELSE
    OPEN c1(pFD_DATA);
    FOR n IN c2(pFD_DATA) LOOP
      FETCH c1 INTO nROW,cFIO,cPUT,cVID;
      IF NOT c1%NOTFOUND THEN
        str:='<TR><TD><P class=user>'||nROW||'</P></TD>'||
             '<TD class=user><P class=user>'||NVL(cFIO,'&nbsp;')||'</P></TD>'||
             '<TD><P class=user>'||NVL(cVID,'&nbsp;')||'</P></TD>'||
             '<TD><P class=user>'||NVL(cPUT,'&nbsp;')||'</P></TD>';
      ELSE
        str:='<TR><TD><P class=user>&nbsp;</P></TD>'||
             '<TD><P class=user>&nbsp;</P></TD>'||
             '<TD><P class=user>&nbsp;</P></TD>'||
             '<TD><P class=user>&nbsp;</P></TD>';
      END IF;
      str:=str||'<TD><P class=user>'||n.ROWNUM||'</P></TD>'||
                '<TD class=user><P class=user>'||NVL(n.FC_FIO,'&nbsp;')||'</P></TD>'||
                '<TD><P class=user>'||NVL(n.FC_VID,'&nbsp;')||'</P></TD>'||
                '<TD><P class=user>'||NVL(n.FC_PUT,'&nbsp;')||'</P></TD></TR>';
      DBMS_LOB.WRITEAPPEND(cl,LENGTH(str),str);
    END LOOP;
    CLOSE c1;
  END IF;
  str:='</TABLE>'||
       '<BR><P><B>Отчет составил:_____________________'||DO_VRACHFIO(pFK_VRACHID)||'</B></P></DIV></BODY></HTML>';
  DBMS_LOB.WRITEAPPEND(cl,LENGTH(str),str);
  DBMS_LOB.CLOSE(cl);
  RETURN rc;
END;
END; -- Package Body PKG_DAILY_BUH
/

SHOW ERRORS;


