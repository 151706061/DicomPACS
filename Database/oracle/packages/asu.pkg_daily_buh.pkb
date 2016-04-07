DROP PACKAGE BODY ASU.PKG_DAILY_BUH
/

--
-- PKG_DAILY_BUH  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_DAILY_BUH" 
IS
FUNCTION GET_COUNT_EARLY(pFD_DATA IN DATE) RETURN NUMBER IS
CURSOR c(pDATA DATE) IS SELECT COUNT(ROWID) FROM TSROKY WHERE FK_PRYB=3 AND FN_KOL>0 AND FD_DATA1=pDATA;
i NUMBER;
BEGIN
  OPEN c(pFD_DATA);
  FETCH c INTO i;
  CLOSE c;
  RETURN i;
END;

FUNCTION GET_COUNT_EARLY_TEMP(pFD_DATA IN DATE) RETURN NUMBER IS
CURSOR c(pDATA DATE) IS SELECT COUNT(ROWID) FROM TSROKY WHERE FK_PRYB=7 AND FN_KOL>0 AND FD_DATA1=pDATA;
i NUMBER;
BEGIN
  OPEN c(pFD_DATA);
  FETCH c INTO i;
  CLOSE c;
  RETURN i;
END;

FUNCTION DO_CALC_REPORT(pFD_DATA IN DATE,pFC_REMARK IN VARCHAR2,pFK_VRACHID IN NUMBER) RETURN NUMBER IS
CURSOR c1(pDATA IN DATE) IS select rownum,
                                GET_PACFIO(tkarta.fk_id) FC_FIO,
                                tkarta.fc_put,get_PACSUBvid(TKARTA.FK_KOD2,TKARTA.FK_KOD) FC_VID
                                from tkarta,tsroky
                                where tkarta.fk_id=tsroky.fk_pacid and
                                (tsroky.fk_pryb in(2,4)) and
                                tsroky.fd_data1=pData;
CURSOR c1c(pDATA IN DATE) IS select COUNT(TKARTA.FK_ID)
                                from tkarta,tsroky
                                where tkarta.fk_id=tsroky.fk_pacid and
                                (tsroky.fk_pryb in(2,4)) and
                                tsroky.fd_data1=pData;

CURSOR c2(pDATA IN DATE) IS select rownum,
                                GET_PACFIO(tkarta.fk_id) FC_FIO,
                                tkarta.fc_put,get_PACSUBvid(TKARTA.FK_KOD2,TKARTA.FK_KOD) FC_VID
                                from tkarta,tsroky
                                where tkarta.fk_id=tsroky.fk_pacid and
                                (tsroky.fk_pryb=3 or tsroky.fk_pryb=7) and
                                tsroky.fd_data1=pDATA;

CURSOR c2c(pDATA IN DATE) IS select COUNT(TKARTA.FK_ID)
                                from tkarta,tsroky
                                where tkarta.fk_id=tsroky.fk_pacid and
                                (tsroky.fk_pryb=3 or tsroky.fk_pryb=7) and
                                tsroky.fd_data1=pDATA;

CURSOR c(dData DATE) IS select GET_PACFIO(TKARTA.FK_ID) as FC_FIO
                  ,tkarta.fc_put,GET_COMPANY_NAME(TKARTA.FK_KOD) FC_SHORT from tkarta,tsroky/*,tpisma,tcompany*/ where
                  tkarta.fk_id=tsroky.fk_pacid and tsroky.fk_pryb=2 and
                  tsroky.fd_data1=dDATA and
                  tkarta.fk_kod2=1/* and tpisma.fk_id=tkarta.fk_kod and
                  tcompany.fk_id=tpisma.fk_predid*/
                  union
                  select GET_PACFIO(TKARTA.FK_ID) as FC_FIO
                  ,tkarta.fc_put,GET_COMPANY_NAME(TKARTA.FK_KOD) FC_SHORT from tkarta,tsroky/*,tdogovor,tcompany*/ where
                  tkarta.fk_id=tsroky.fk_pacid and tsroky.fk_pryb=2 and
                  tsroky.fd_data1=dData and
                  tkarta.fk_kod2=2; /*and tdogovor.fk_id=tkarta.fk_kod and
                  tcompany.fk_id=tdogovor.fk_predid;*/

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
--  DBMS_LOB.OPEN(cC,DBMS_LOB.LOB_READWRITE);
  --Шапкас...
  str:='<html><head><meta http-equiv="Content-Type" content="text/html; charset=windows-1251"></head><p ALIGN="CENTER"><b>ЕЖЕДНЕВНЫЕ СВЕДЕНИЯ</b></P><P ALIGN="CENTER"><B>о движении пациентов по медучреждению "'||PKG_SMINI.READSTRING('CONFIG','S_NAME','Не известен')||'"</B>';
  str:=str||'<ALIGN="CENTER"><B> за '||TO_CHAR(pFD_DATA,'dd.mm.yyyy')||'</B></P>';
  DBMS_LOB.WRITEAPPEND(cl,LENGTH(str),str);

  --
  str:='<P ALIGN="LEFT"><font face="Courier New, Courier, mono">Состояло на начало дня______________________ '||PAC_MOVEMENT.GET_COUNT_MORNING(pFD_DATA)||'<BR>';
  str:=str||'Прибыло_____________________________________ '||PAC_MOVEMENT.GET_COUNT_IN(pFD_DATA)||'<BR>';
  str:=str||'&nbsp;&nbsp;в т.ч. восстановилось_____________________ '||PAC_MOVEMENT.GET_COUNT_RECOVER(pFD_DATA)||'<BR>';
  str:=str||'Выбыло______________________________________ '||PAC_MOVEMENT.GET_COUNT_OUT(pFD_DATA)||'<BR>';
  str:=str||'&nbsp;&nbsp;в т.ч. временно___________________________ '||PAC_MOVEMENT.GET_COUNT_TEMPOUT(pFD_DATA)||'<BR>';
  str:=str||'Состоит на конец дня________________________ '||PAC_MOVEMENT.GET_COUNT_MORNING(pFD_DATA+1)||'<BR>';
  str:=str||'Проведено койко дней________________________ '||PAC_MOVEMENT.GET_KDN(pFD_DATA)||'<BR>';
  str:=str||'Примечание:'||pFC_REMARK||'<BR>';
  str:=str||'Продлено за наличный расчет_________________ '||GET_COUNTPRODLNALPAC(pFD_DATA)||'<BR>';
  str:=str||'Продлено в счет опоздания___________________ '||GET_COUNTPRODLOPOZDPAC(pFD_DATA)||'<BR>';
  str:=str||'Досрочно выбыло из числа прибывших__________ '||GET_COUNT_EARLY(pFD_DATA)||'<BR>';
  str:=str||'&nbsp;&nbsp;в т.ч. временно___________________________ '||GET_COUNT_EARLY_TEMP(pFD_DATA)||'<BR>';
  str:=str||'</FONT></P>';
  DBMS_LOB.WRITEAPPEND(cl,LENGTH(str),str);
--  str:='<table align="center" width="100%" border="1" bordercolorlight="#000000" bordercolordark="#FFFFFF" bordercolor="#FFFFFF" bgcolor="#FFFFFF" cellpadding="0" cellspacing="0">';
  str:='<P ALIGN="CENTER"><B>Прибыло по письмам или договорам с предприятиями</B></P>' ;
  DBMS_LOB.WRITEAPPEND(cl,LENGTH(str),str);

  str:='<table align="center" width="100%" border="1" bordercolorlight="#000000" bordercolordark="#FFFFFF" bordercolor="#FFFFFF" bgcolor="#FFFFFF" cellpadding="0" cellspacing="0">';
  str:=str||'<TR ALIGN="CENTER"><TD><B>Ф.И.О.:</B></TD><TD><B>№ путевки:</B></TD><TD><B>От предприятия:</B></TD></TR>';
  DBMS_LOB.WRITEAPPEND(cl,LENGTH(str),str);
  FOR s IN c (pFD_DATA) LOOP
    str:='<TR ALIGN="CENTER"><TD>&nbsp;'||s.FC_FIO||'</TD><TD>&nbsp;'||s.FC_PUT||'</TD><TD>&nbsp;'||s.FC_SHORT||'</TD></TR>';
    DBMS_LOB.WRITEAPPEND(cl,LENGTH(str),str);
  END LOOP;
  str:='</table>';
  DBMS_LOB.WRITEAPPEND(cl,LENGTH(str),str);
--  str:='<span lang=EN-US style=''font-size:12.0pt;font-family:"Times New Roman"mso-fareast-font-family:"Times New Roman";mso-ansi-language:EN-US;mso-fareast-language:RU;mso-bidi-language:AR-SA''><br clear=all style=''mso-special-character:line-break;page-break-before:always''></span>';
  DBMS_LOB.WRITEAPPEND(cl,LENGTH(str),str);

  str:='<P ALIGN="CENTER"><B>Движение пациентов за '||TO_CHAR(pFD_DATA,'dd.mm.yyyy')||'</B></P>';
  DBMS_LOB.WRITEAPPEND(cl,LENGTH(str),str);
  str:='<table align="center" width="100%" border="1" bordercolorlight="#000000" bordercolordark="#FFFFFF" bordercolor="#FFFFFF" bgcolor="#FFFFFF" cellpadding="0" cellspacing="0">';
  str:=str||'<TR ALIGN="CENTER"><TD><B>№:</B></TD><TD><B>Ф.И.О.(Прибыли):</B></TD><TD><B>Тип:</B></TD><TD><B>№ путевки:</B></TD><TD><B>№:</B></TD><TD><B>Ф.И.О.(Выбыли):</B></TD><TD><B>Тип:</B></TD><TD><B>№ путевки:</B></TD></TR>';
  DBMS_LOB.WRITEAPPEND(cl,LENGTH(str),str);

  OPEN c1c(pFD_DATA);
  FETCH c1c INTO nc;
  CLOSE c1c;
  OPEN c2c(pFD_DATA);
  FETCH c2c INTO i;
  CLOSE c2c;
  if nc>i then
    OPEN c2(pFD_DATA);
    FOR n IN c1(pFD_DATA) LOOP
      str:='<TR ALIGN="CENTER"><TD>&nbsp;'||n.ROWNUM||'</TD><TD>&nbsp;<FONT SIZE="-1">'||n.FC_FIO||'</FONT></TD><TD>&nbsp;<FONT SIZE="-1">'||n.FC_VID||'</FONT></TD><TD>&nbsp;'||n.FC_PUT||'</TD>';
      FETCH c2 INTO nROW,cFIO,cPUT,cVID;
      IF NOT c2%NOTFOUND THEN
        str:=str||'<TD>&nbsp;'||nROW||'</TD><TD>&nbsp;<FONT SIZE="-1">'||cFIO||'</FONT></TD><TD>&nbsp;<FONT SIZE="-1">'||cVID||'</FONT></TD><TD>&nbsp;'||cPUT||'</TD></TR>';
      ELSE
        str:=str||'<TD>&nbsp;</TD><TD>&nbsp;</TD><TD>&nbsp;</TD><TD>&nbsp;</TD></TR>';
      END IF;
      DBMS_LOB.WRITEAPPEND(cl,LENGTH(str),str);
    END LOOP;
    CLOSE c2;
  ELSE
    OPEN c1(pFD_DATA);
    FOR n IN c2(pFD_DATA) LOOP
      FETCH c1 INTO nROW,cFIO,cPUT,cVID;
      IF NOT c1%NOTFOUND THEN
        str:='<TR ALIGN="CENTER"><TD>&nbsp;'||nROW||'</TD><TD>&nbsp;<FONT SIZE="-1">'||cFIO||'</FONT></TD><TD>&nbsp;<FONT SIZE="-1">'||cVID||'</FONT></TD><TD>&nbsp;'||cPUT||'</TD>';
      ELSE
        str:='<TR ALIGN="CENTER"><TD>&nbsp;</TD><TD>&nbsp;</TD><TD>&nbsp;</TD><TD>&nbsp;</TD>';
      END IF;
      str:=str||'<TD>&nbsp;'||n.ROWNUM||'</TD><TD>&nbsp;<FONT SIZE="-1">'||n.FC_FIO||'</FONT></TD><TD>&nbsp;<FONT SIZE="-1">'||n.FC_VID||'</FONT></TD><TD>&nbsp;'||n.FC_PUT||'</TD></TR>';
      DBMS_LOB.WRITEAPPEND(cl,LENGTH(str),str);
    END LOOP;
    CLOSE c1;
  END IF;
  str:='</TABLE>';
  DBMS_LOB.WRITEAPPEND(cl,LENGTH(str),str);
  str:='<P><B>Отчет составил:_____________________'||DO_VRACHFIO(pFK_VRACHID)||'</B></P>'  ;
  DBMS_LOB.WRITEAPPEND(cl,LENGTH(str),str);
  DBMS_LOB.CLOSE(cl);
  RETURN rc;
END;

END; -- Package Body PKG_DAILY_BUH
/

SHOW ERRORS;


