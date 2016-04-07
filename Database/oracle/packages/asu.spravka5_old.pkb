DROP PACKAGE BODY ASU.SPRAVKA5_OLD
/

--
-- SPRAVKA5_OLD  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."SPRAVKA5_OLD" 
 IS-- Modified by TimurLan
  FUNCTION RETURN_VALUE (nValue IN NUMBER) RETURN VARCHAR IS
    cValue VARCHAR(15);
  BEGIN
    if (nValue is NULL) or (nValue = 0) then cValue:='&nbsp;';
    else cValue:=TO_CHAR(nValue);
    end if;
    RETURN cValue;
  END;
  FUNCTION RETURN_VALUE (cValue IN VARCHAR) RETURN VARCHAR IS
  BEGIN
    if (cValue is NULL) or (cValue = '0')
    then
      RETURN '&nbsp;';
    else
      RETURN cValue;
    end if;
  END;
FUNCTION DO_CALC_REPORT (pFD_DATA1 IN DATE,pFK_VRACHID IN NUMBER)
RETURN NUMBER
 IS-- Used in rSpravka5.dpr
  nAll NUMBER;
  strTable VARCHAR2(100);
  nShortAll NUMBER;
  nC NUMBER;
  cC CLOB;
  str VARCHAR2(32767);
  nCols NUMBER;
  sp VARCHAR2(100);
  n1 NUMBER;
  n2 NUMBER;
  n3 NUMBER;
  n4 NUMBER;
  n5 NUMBER;
  n6 NUMBER;
  n7 NUMBER;
  n8 NUMBER;
  nTotal NUMBER;
  nShortTotal NUMBER;
BEGIN
  INSERT INTO TCLOBS(FC_CLOB)
       VALUES (EMPTY_CLOB())
    RETURNING FK_ID,FC_CLOB INTO nC,cC;
  DBMS_LOB.OPEN(cC,DBMS_LOB.LOB_READWRITE);
  str := PKG_HTML.GET_HEAD('word','Справка о движении больных (отдыхающих) по санаторию "' ||PKG_SMINI.READSTRING('CONFIG','S_NAME','Не известен')||'"',
                           null,'10.0',null,
                           null,null,null,
                           null,null,null,
                           '297','210','landscape',
                           '20','10','20','20',
                           null,null,null,'left',
                           null,null,null,null,
                           null,null,null);
  DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
  str:='<BODY><DIV class=user>'||
       '<p class=user ALIGN="RIGHT"><b>Форма №5</b></P>'||
       '<P ALIGN="CENTER"><B>Справка о движении больных (отдыхающих) по санаторию "'||PKG_SMINI.READSTRING('CONFIG','S_NAME','Не известен')||'"<BR>'||
       'на '||TO_CHAR(pFD_DATA1,'dd.mm.yyyy')||'</B></P>';
  DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
  str:='<table>'||
       '<TR><TD width=3% ROWSPAN="2"><P class=user>&nbsp;</P></TD>'||
       '<TD width=25% ROWSPAN="2"><P class=user>&nbsp;</P></TD>'||
       '<TD ROWSPAN="2"><P class=user>Человек</P></TD>'||
       '<TD COLSPAN="2"><P class=user>Прибыло с опозд.</P></TD>'||
       '<TD COLSPAN="2"><P class=user>Убыло ранее</P></TD>'||
       '<TD COLSPAN="2"><P class=user>Продл. за опозд.</P></TD>'||
       '<TD COLSPAN="2"><P class=user>Продл. за нал.</P></TD>'||
       '</TR>'||
       '<TR><TD><P class=user>чел.</P></TD>'||
       '<td><P class=user>кдн.</P></TD>'||
       '<td><P class=user>чел.</P></TD>'||
       '<td><P class=user>кдн.</P></TD>'||
       '<td><P class=user>чел.</P></TD>'||
       '<td><P class=user>кдн.</P></TD>'||
       '<td><P class=user>чел.</P></TD>'||
       '<td><P class=user>кдн.</P></TD></tr>';
  DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
  OPEN cBegin(pFD_DATA1);
  FETCH cBegin INTO nTotal;
  CLOSE cBegin;
  str:='<TR><TD><P class=user>1.</P></TD>'||
       '<TD class=user><P class=user>Состояло на начало дня</P></TD>'||
       '<TD><P class=user>'||nTotal||'</P></TD>'||
       '<TD><P class=user>&nbsp</P></TD>'||
       '<TD><P class=user>&nbsp</P></TD>'||
       '<TD><P class=user>&nbsp</P></TD>'||
       '<TD><P class=user>&nbsp</P></TD>'||
       '<TD><P class=user>&nbsp</P></TD>'||
       '<TD><P class=user>&nbsp</P></TD>'||
       '<TD><P class=user>&nbsp</P></TD>'||
       '<TD><P class=user>&nbsp</P></TD>';
  DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
  OPEN cPrybRan(pFD_DATA1);
  FETCH cPrybRan INTO nTotal,nShortTotal;
  CLOSE cPrybRan;
  if nShortTotal IS NULL THEN
    nShortTotal:=0;
  END IF;
  str:='<TR><TD><P class=user>2.</P></TD>'||
       '<TD class=user><P class=user>Прибыло за день</P></TD>'||
       '<TD><P class=user>'||GET_COUNT_PRYB(pFD_DATA1)||'</P></TD>'||
       '<TD><P class=user>'||nTotal||'</P></TD>'||
       '<TD><P class=user>'||nShortTotal||'</P></TD>'||
       '<TD><P class=user>&nbsp</P></TD>'||
       '<TD><P class=user>&nbsp</P></TD>'||
       '<TD><P class=user>&nbsp</P></TD>'||
       '<TD><P class=user>&nbsp</P></TD>'||
       '<TD><P class=user>&nbsp</P></TD>'||
       '<TD><P class=user>&nbsp</P></TD>';
  DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
  OPEN cVybRan(pFD_DATA1);
  FETCH cVybRan INTO nTotal,nShortTotal;
  CLOSE cVybRan;
  if nShortTotal IS NULL THEN
    nShortTotal:=0;
  END IF;
  str:='<TR><TD><P class=user>3.</P></TD>'||
       '<TD class=user><P class=user>Выбыло за день</P></TD>'||
       '<TD><P class=user>'||GET_COUNT_VYB(pFD_DATA1)||'</P></TD>'||
       '<TD><P class=user>&nbsp</P></TD>'||
       '<TD><P class=user>&nbsp</P></TD>'||
       '<TD><P class=user>'||nTotal||'</P></TD>'||
       '<TD><P class=user>'||nShortTotal||'</P></TD>'||
       '<TD><P class=user>&nbsp</P></TD>'||
       '<TD><P class=user>&nbsp</P></TD>'||
       '<TD><P class=user>&nbsp</P></TD>'||
       '<TD><P class=user>&nbsp</P></TD>';
  DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
  OPEN cBegin(pFD_DATA1+1);
  FETCH cBegin INTO nTotal;
  CLOSE cBegin;
  str:='<TR><TD><P class=user>4.</P></TD>'||
       '<TD class=user><P class=user>На конец дня</P></TD>'||
       '<TD><P class=user>'||nTotal||'</P></TD>'||
       '<TD><P class=user>&nbsp</P></TD>'||
       '<TD><P class=user>&nbsp</P></TD>'||
       '<TD><P class=user>&nbsp</P></TD>'||
       '<TD><P class=user>&nbsp</P></TD>'||
       '<TD><P class=user>';
  OPEN cProdl(pFD_DATA1,6);
  FETCH cProdl INTO nTotal,nShortTotal;
  CLOSE cProdl;
  if nShortTotal IS NULL THEN
    nShortTotal:=0;
  END IF;
  str:=str||nTotal||'</P></TD>'||
       '<TD><P class=user>'||nShortTotal||'</P></TD>'||
       '<TD><P class=user>';
  OPEN cProdl(pFD_DATA1,5);
  FETCH cProdl INTO nTotal,nShortTotal;
  CLOSE cProdl;
  if nShortTotal IS NULL THEN
    nShortTotal:=0;
  END IF;
  str:=str||nTotal||'</P></TD>'||
       '<TD><P class=user>'||nShortTotal||'</P></TD></TR></TABLE>';
  DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
  str:='<BR><BR><P ALIGN="CENTER">А. Сведения на прибывших больных (отдыхающих) за '||TO_CHAR(pFD_DATA1,'dd.mm.yyyy')||'</P><BR>'||
       '<table>';
  DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
  str:='<TR><td width=3% rowspan="2"><P class=user>№ п/п</P></TD>'||
       '<td width=25% rowspan="2"><P class=user>Ф.И.О.</P></TD>'||
       '<td colspan="3"><P class=user>Путевка</P></TD>'||
       '<td colspan="2"><P class=user>Прибытие</P></TD></tr>'||
       '<tr><td><P class=user>№</P></TD>'||
       '<td><P class=user>с</P></TD>'||
       '<td><P class=user>по</P></TD>'||
       '<TD><P class=user>ранее</P></TD>'||
       '<TD><P class=user>опозд.</P></TD></tr>';
  DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
  n1:=1;
  n2:=0;
  n3:=0;
  for p IN cTypePut loop
    if p.FC_VID IS NOT NULL THEN
      str:='<TR><TD COLSPAN="7"><P class=user><U>'||p.FC_VID||'</U></P></TD></TR>';
    ELSE
      str:='<TR><TD COLSPAN="7"><P class=user>&nbsp;</P></TD></TR>';
    END IF;
    FOR n IN cPryb(pFD_DATA1,p.FK_ID) LOOP
      str:=str||'<TR><TD><P class=user>'||n1||'.</P></TD>'||
                '<TD class=user><P class=user>'||n.FC_FIO||'</P></TD>'||
                '<TD><P class=user>'||RETURN_VALUE(n.FC_PUT)||'</P></TD>'||
                '<TD><P class=user>'||TO_CHAR(n.FD_DATA1,'dd.mm.yyyy')||'</P></TD>'||
                '<TD><P class=user>'||TO_CHAR(n.FD_DATA2,'dd.mm.yyyy')||'</P></TD>'||
                '<TD><P class=user>'||RETURN_VALUE(n.FN_RANEE)||'</P></TD>'||
                '<TD><P class=user>'||RETURN_VALUE(n.FN_OPOZD)||'</P></TD></TR>';
      n2:=n2+n.FN_RANEE;
      n3:=n3+n.FN_OPOZD;
      n1:=n1+1;
      DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
      str:='';
    end loop;
  end loop;
  OPEN cCountPut(pFD_DATA1);
  FETCH cCountPut INTO nTotal;
  CLOSE cCountPut;
  str:='<TR><TD><P class=user>&nbsp;</P></TD>'||
       '<TD class=user><P class=user>Всего прибыло: '||TO_CHAR(n1-1)||'</P></TD>'||
       '<TD><P class=user>&nbsp;</P></TD>'||
       '<TD><P class=user>&nbsp;</P></TD>'||
       '<TD><P class=user>&nbsp;</P></TD>'||
       '<TD><P class=user>'||n2||'</P></TD>'||
       '<TD><P class=user>'||n3||'</P></TD></TR>'||
       '</TABLE>'||
       '<BR><P>Путевки на прибывших в количестве '||NVL(nTotal,'0')||' штук прилагаются.</P></DIV>';
  DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
  str:='<br clear=all style=''mso-special-character:line-break;page-break-before:always''>';
  DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
  str:='<DIV class=user><P ALIGN="CENTER">Б. Сведения на убывших больных (отдыхающих) за '||TO_CHAR(pFD_DATA1,'dd.mm.yyyy')||'</P><BR>'||
       '<table>';
  DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
  str:='<tr><td width=3% rowspan="2"><P class=user>№ п/п</P></TD>'||
       '<td width=25% rowspan="2"><P class=user>Ф.И.О.</P></TD>'||
       '<td colspan="3"><P class=user>Путевка</P></TD>'||
       '<td rowspan="2"><P class=user>Прибытие</P></TD>'||
       '<td colspan="3"><P class=user>Количество дней</P></TD>'||
       '<td colspan="2"><P class=user>Дни продления</P></TD>'||
       '<td colspan="2"><P class=user>Койко-дни</P></TD></tr>'||
       '<tr><TD><P class=user>№</P></TD>'||
       '<TD><P class=user>с</P></TD>'||
       '<TD><P class=user>по</P></TD>'||
       '<TD><P class=user>ранее</P></TD>'||
       '<TD><P class=user>опозд.</P></TD>'||
       '<TD><P class=user>доср.выб.</P></TD>'||
       '<TD><P class=user>за опозд.</P></TD>'||
       '<TD><P class=user>за н/р.</P></TD>'||
       '<TD><P class=user>прошед. месяца</P></TD>'||
       '<TD><P class=user>отчет. месяца</P></TD></tr>';
  DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
  n1:=1;
  n2:=0;
  n3:=0;
  n4:=0;
  n5:=0;
  n6:=0;
  n7:=0;
  n8:=0;
  for p IN cTypePut loop
    if p.FC_VID IS NOT NULL THEN
      str:='<TR><TD COLSPAN="13"><P class=user><U>'||p.FC_VID||'</U></P></TD></TR>';
    ELSE
      str:='<TR><TD COLSPAN="13"><P class=user>&nbsp;</P></TD></TR>';
    END IF;
    FOR n IN cVyb(pFD_DATA1,p.FK_ID) LOOP
      str:=str||'<TR><TD><P class=user>'||n1||'.</P></TD>'||
                '<TD class=user><P class=user>'||n.FC_FIO||'</P></TD>'||
                '<TD><P class=user>'||RETURN_VALUE(n.FC_PUT)||'</P></TD>'||
                '<TD><P class=user>'||TO_CHAR(n.FD_DATA1,'dd.mm.yyyy')||'</P></TD>'||
                '<TD><P class=user>'||TO_CHAR(n.FD_DATA2,'dd.mm.yyyy')||'</P></TD>'||
                '<TD><P class=user>'||TO_CHAR(n.FD_PRYB,'dd.mm.yyyy')||'</P></TD>'||
                '<TD><P class=user>'||RETURN_VALUE(n.FN_RANEE)||'</P></TD>'||
                '<TD><P class=user>'||RETURN_VALUE(n.FN_OPOZD)||'</P></TD>'||
                '<TD><P class=user>'||RETURN_VALUE(n.FN_VYBRANEE)||'</P></TD>'||
                '<TD><P class=user>'||RETURN_VALUE(n.FN_PRODLOP)||'</P></TD>'||
                '<TD><P class=user>'||RETURN_VALUE(n.FN_PRODLNAL)||'</P></TD>'||
                '<TD><P class=user>'||RETURN_VALUE(n.FN_PROSHL)||'</P></TD>'||
                '<TD><P class=user>'||RETURN_VALUE(n.FN_TEKUSH)||'</P></TD></TR>';
      n2:=n2+n.FN_RANEE;
      n3:=n3+n.FN_OPOZD;
      n4:=n4+n.FN_VYBRANEE ;
      n5:=n5+n.FN_PRODLOP;
      n6:=n6+n.FN_PRODLNAL;
      n7:=n7+n.FN_PROSHL;
      n8:=n8+n.FN_TEKUSH;
      n1:=n1+1;
      DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
      str:='';
    end loop;
  end loop;
  str:='<TR><TD><P class=user>&nbsp;</P></TD>'||
       '<TD class=user><P class=user>Всего убыло: '||TO_CHAR(n1-1)||'</P></TD>'||
       '<TD><P class=user>&nbsp;</P></TD>'||
       '<TD><P class=user>&nbsp;</P></TD>'||
       '<TD><P class=user>&nbsp;</P></TD>'||
       '<TD><P class=user>&nbsp;</P></TD>'||
       '<TD><P class=user>'||n2||'</P></TD>'||
       '<TD><P class=user>'||n3||'</P></TD>'||
       '<TD><P class=user>'||n4||'</P></TD>'||
       '<TD><P class=user>'||n5||'</P></TD>'||
       '<TD><P class=user>'||n6||'</P></TD>'||
       '<TD><P class=user>'||n7||'</P></TD>'||
       '<TD><P class=user>'||n8||'</P></TD></TR></TABLE>';
  DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
  str:='<BR><P>Справки и другие документы на выбывших в количестве ___________ штук прилагаются.<P><BR>'||
       '<P><B>Отчет составил: _________________________'||DO_VRACHFIO(pFK_VRACHID)||'<BR><BR>'||
       'Главный бухгалтер _________________________</B></P></DIV></BODY></html>';
  DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
  DBMS_LOB.CLOSE(cC);
  RETURN nC;
END;
END;
/

SHOW ERRORS;


