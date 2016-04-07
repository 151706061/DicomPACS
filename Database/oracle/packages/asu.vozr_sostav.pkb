DROP PACKAGE BODY ASU.VOZR_SOSTAV
/

--
-- VOZR_SOSTAV  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."VOZR_SOSTAV" 
IS
--
-- Purpose: Возрастной состав
--
FUNCTION GET_TEMPTABLENAME(strBegin IN VARCHAR2) RETURN VARCHAR2
IS
BEGIN
  RETURN strBegin||TO_CHAR(SYSDATE,'DDMMYYYYHHMISS');
END;
FUNCTION DO_CALC_REPORT(pFD_DATA1 IN DATE,pFD_DATA2 IN DATE,pFK_VRACHID IN NUMBER) RETURN NUMBER
IS
nAll NUMBER;
aVozr TVOZRT;
aPrizn TTABLE;
strTable VARCHAR2(100);
nShortAll NUMBER;
nC NUMBER;
cC CLOB;
str VARCHAR2(2000);
nCols NUMBER;
n1 NUMBER;
n2 NUMBER;
n3 NUMBER;
n4 NUMBER;
nTotal NUMBER;
nShortTotal NUMBER;
nKontTotal NUMBER;
BEGIN
  --Заполним таблицу с возрастами
  if cVozrL%ISOPEN THEN
    CLOSE cVozrL;
  END IF;
  FOR p IN cVozrL LOOP
    aVozr(cVozrL%ROWCOUNT).n1:=p.FN_1;
    aVozr(cVozrL%ROWCOUNT).n2:=p.FN_2;
  END LOOP;
  --Заполним таблицу с признаками контингента
  FOR p IN cPrizn LOOP
    aPrizn(cPrizn%ROWCOUNT):=p.FK_ID;
  END LOOP;
  --Получим количество пациентов всего
  OPEN cCountAll(pFD_DATA1,pFD_DATA2);
  FETCH cCountAll INTO nAll;
  CLOSE cCountAll;
  --Получим количество пациентов всего c короткими сроками
  OPEN cShortCountAll(pFD_DATA1,pFD_DATA2);
  FETCH cShortCountAll INTO nShortAll;
  CLOSE cShortCountAll;
  INSERT INTO TCLOBS(FC_CLOB) VALUES(EMPTY_CLOB()) RETURNING FK_ID,FC_CLOB INTO nC,cC;
  DBMS_LOB.OPEN(cC,DBMS_LOB.LOB_READWRITE);
  str:='<html><head><meta http-equiv="Content-Type" content="text/html; charset=windows-1251"></head><P ALIGN="CENTER"><B>Возрастной состав лечившихся в санатории "'||PKG_SMINI.READSTRING('CONFIG','S_NAME','Не известен')||'"</B><BR>';
  str:=str||'<ALIGN="CENTER">за период с '||TO_CHAR(pFD_DATA1,'dd.mm.yyyy')||' по '||TO_CHAR(pFD_DATA2,'dd.mm.yyyy')||'</P>';
  DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
  str:='<table align="center" width="100%" border="1" bordercolorlight="#000000" bordercolordark="#FFFFFF" bordercolor="#FFFFFF" bgcolor="#FFFFFF" cellpadding="0" cellspacing="0">';
  DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
  nCols:=5+2*aPrizn.COUNT;
  str:='<TR align="center"><TD ROWSPAN="2"><B>Возраст:</B></TD><TD ROWSPAN="2"><B>Всего:</B></TD><TD ROWSPAN="2"><B>%от общего:</B></TD><TD COLSPAN="'||(2+3*aPrizn.COUNT)||'"><B>В том числе</B></TD></TR>';
  DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
  str:='<TR ALIGN="CENTER">';
  DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
  for p IN cPriznName LOOP
    str:='<TD><B>'||p.FC_SHORT||':</B></TD>'||'<TD><B>% '||p.FC_SHORT||':</B></TD>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
  end loop;
  str:='<TD><B>К.с. всего:</B></TD><TD><B>% К.с.:</B></TD>';
  DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
  for p IN cPriznName LOOP
    str:='<TD><B>'||p.FC_SHORT||' к.с.:</B></TD>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
  end loop;
  str:='</TR>';
  DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);

  OPEN cVozrL;
  FOR p IN cVozrName LOOP
    FETCH cVozrL INTO n1,n2;
    OPEN cTotal(pFD_DATA1,pFD_DATA2,n1,n2);
    FETCH cTotal INTO nTotal;
    CLOSE cTotal;
    OPEN cShortTotal(pFD_DATA1,pFD_DATA2,n1,n2);
    FETCH cShortTotal INTO nShortTotal;
    CLOSE cShortTotal;
    if nAll=0 then
      n3:=0;
      n4:=0;
    else
      n3:=Round(1000*nTotal/nAll)/10;
      if nShortAll=0 then
        n4:=0;
      else
        n4:=Round(1000*nShortTotal/nShortAll)/10;
      end if;
    end if;
    str:='<TR align="CENTER"><TD><B>'||p.FC_NAME||'</B></TD><TD>'||nTotal||'</TD><TD>'||TO_CHAR(n3,'90.99')||'%</TD>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
    FOR i in 1..aPrizn.COUNT LOOP
      OPEN cKontAll(pFD_DATA1,pFD_DATA2,aPrizn(i));
      FETCH cKontAll INTO nKontTotal;
      CLOSE cKontAll;
      OPEN cKont(pFD_DATA1,pFD_DATA2,n1,n2,aPrizn(i));
      FETCH cKont INTO nTotal;
      CLOSE cKont;
      str:='<TD>'||nTotal||'</TD><TD>'||TO_CHAR((Round(1000*nTotal/nkontTotal)/10),'90.99')||'%</TD>';
      DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
    END LOOP;
    str:='<TD>'||nShortTotal||'</TD><TD>'||TO_CHAR(n4,'90.99')||'%</TD>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
    FOR i in 1..aPrizn.COUNT LOOP
      OPEN cShortKont(pFD_DATA1,pFD_DATA2,n1,n2,aPrizn(i));
      FETCH cShortKont INTO nShortTotal;
      CLOSE cShortKont;
      str:='<TD>'||nShortTotal||'</TD>';
      DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
    END LOOP;
    str:='</TR>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
  END LOOP;
  CLOSE cVozrL;
  str:='<TR align="CENTER"><TD><B>Всего:</B></TD><TD><B>'||nAll||'</B></TD><TD><B>100.0%</B></TD>';
  DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
  FOR i in 1..aPrizn.COUNT LOOP
    OPEN cKontAll(pFD_DATA1,pFD_DATA2,aPrizn(i));
    FETCH cKontAll INTO nTotal;
    CLOSE cKontAll;
    str:='<TD><B>'||nTotal||'</B></TD><TD><B>100.0%</B></TD>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
  END LOOP;
  str:='<TD><B>'||nShortAll||'</B></TD><TD><B>100.0%</B></TD>';
  DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
  FOR i in 1..aPrizn.COUNT LOOP
    OPEN cShortKontAll(pFD_DATA1,pFD_DATA2,aPrizn(i));
    FETCH cShortKontAll INTO nShortTotal;
    CLOSE cShortKontAll;
    str:='<TD><B>'||nShortTotal||'</B></TD>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
  END LOOP;
  str:='</TR></table><BR><BR>';
  DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
--Посчитаем мужчин
  OPEN cCountSex(pFD_DATA1,pFD_DATA2,1);
  FETCH cCountSex INTO nTotal;
  CLOSE cCountSex;
  str:='Мужчин: '||nTotal||' чел. из них: ';
  OPEN cPriznName;
  FOR i in 1..aPrizn.COUNT LOOP
    OPEN cCountSexKont(pFD_DATA1,pFD_DATA2,1,aPrizn(i));
    FETCH cCountSexKont INTO nTotal;
    CLOSE cCountSexKont;
    FETCH cPriznName INTO strTable;
    str:=str||strTable||': '||nTotal||' чел., ';
  END LOOP;
  CLOSE cPriznName;
  str:=SUBSTR(str,1,LENGTH(str)-2)||'<BR>';
  DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
--Посчитаем женщин
  OPEN cCountSex(pFD_DATA1,pFD_DATA2,0);
  FETCH cCountSex INTO nTotal;
  CLOSE cCountSex;
  str:='Женщин: '||nTotal||' чел. из них: ';
  OPEN cPriznName;
  FOR i in 1..aPrizn.COUNT LOOP
    OPEN cCountSexKont(pFD_DATA1,pFD_DATA2,0,aPrizn(i));
    FETCH cCountSexKont INTO nTotal;
    CLOSE cCountSexKont;
    FETCH cPriznName INTO strTable;
    str:=str||strTable||': '||nTotal||' чел., ';
  END LOOP;
  CLOSE cPriznName;
  str:=SUBSTR(str,1,LENGTH(str)-2)||'<BR><BR>';
  DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
  str:='<B>Отчет составил: _________________________ '||DO_VRACHFIO(pFK_VRACHID)||'</B></html>';
  DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
  DBMS_LOB.CLOSE(cC);
  RETURN nC;
END;
END; -- Package Body VOZR_SOSTAV
/

SHOW ERRORS;


