DROP PACKAGE BODY ASU.PKG_R_ISSL_REPORTS
/

--
-- PKG_R_ISSL_REPORTS  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_R_ISSL_REPORTS" IS

  FUNCTION GetRepBySOTR2(pFK_SOTRID IN BINARY_INTEGER, pFD_DATE1 IN DATE DEFAULT NULL, pFD_DATE2 IN DATE DEFAULT NULL)
    RETURN CLOB IS
  CURSOR cCountAll(pSmidID IN BINARY_INTEGER) IS
         SELECT COUNT(*), SUM(STAT.PKG_HANT.GET_TIME_ISSL(TN.FK_ID, TN.FK_SMID))
           FROM /*(SELECT FK_ID,FK_OWNER,FC_NAME
                   FROM TSMID
	             CONNECT BY PRIOR FK_ID=FK_OWNER
	             START WITH FK_ID IN (SELECT FK_ID FROM TSMID WHERE FK_OWNER=GET_RG_ISSL)) SM,*/ TNAZIS TN
          WHERE /*TN.FK_SMID = SM.FK_ID
            AND*/ TN.FK_ISPOLID = pSmidID
            AND TN.FK_NAZSOSID = GET_VIPNAZ;

  CURSOR cCount(pSmidID IN BINARY_INTEGER) IS
         SELECT COUNT(*), SUM(STAT.PKG_HANT.GET_TIME_ISSL(TN.FK_ID, TN.FK_SMID))
           FROM /*(SELECT FK_ID,FK_OWNER,FC_NAME
                   FROM TSMID
	             CONNECT BY PRIOR FK_ID=FK_OWNER
	             START WITH FK_ID IN (SELECT FK_ID FROM TSMID WHERE FK_OWNER=GET_RG_ISSL)) SM,*/ TNAZIS TN
          WHERE /*TN.FK_SMID = SM.FK_ID
            AND*/ TN.FK_ISPOLID = pSmidID
            AND TN.FD_RUN BETWEEN TRUNC(pFD_DATE1) AND TRUNC(pFD_DATE2)+1-1/(24*60*60)
            AND TN.FK_NAZSOSID = GET_VIPNAZ;

    clTemp  CLOB;
    sHtml   LONG;
    nTemp   BINARY_INTEGER := 0;
    nTemp1  NUMBER := 0;
    nSum    BINARY_INTEGER := 0;
    nSum1   NUMBER := 0;
  begin
    DBMS_LOB.CREATETEMPORARY(clTemp, FALSE);
    sHtml := PKG_HTML.GET_HEAD('word','GetRepBySOTR2 "' ||PKG_SMINI.READSTRING('CONFIG','S_NAME','Не известен')||'"',
                             null,'10.0',null,
                             null,null,null,
                             null,null,null,
                             null,null,null,
                             '20','10','20','20',
                             null,null,null,'right',
                             null,null,null,null,
                             null,null,null);
    DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);

    sHtml := CHR(13)||'<BODY><DIV class=user>'||CHR(13);
    if pFD_DATE1 is null or pFD_DATE2 is null then
      sHtml := sHtml||'<P align=center><B>Отчет о количестве выполненных исследований<BR>за весь период работы</P><BR>'||CHR(13);
    elsif pFD_DATE1 = pFD_DATE2 then
      sHtml := sHtml||'<P align=center><B>Отчет о количестве выполненных исследований<BR>за '||TO_CHAR(pFD_DATE1,'dd.mm.yyyy')||'</P><BR>'||CHR(13);
    else
      sHtml := sHtml||'<P align=center><B>Отчет о количестве выполненных исследований<BR>за период с '||TO_CHAR(pFD_DATE1,'dd.mm.yyyy')||' по '||TO_CHAR(pFD_DATE2,'dd.mm.yyyy')||'</P><BR>'||CHR(13);
    end if;
    sHtml := sHtml||
         '<TABLE>'||CHR(13)||
         ' <TR>'||CHR(13)||
         '  <TD>ID</TD>'||CHR(13)||
         '  <TD>Сотрудник</TD>'||CHR(13)||
         '  <TD>Кол-во, ед.</TD>'||CHR(13)||
         '  <TD>Общ. время, мин.</TD>'||CHR(13)||' </TR>'||CHR(13);
    DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);

    for p in (SELECT * FROM TMP_NUMBERS) loop
      --for n in cNames loop
        --if p.FN_VALUE = n.FK_ID then
        DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(' <TR>'||CHR(13)||'  <TD><P class=user>'||TO_CHAR(p.FN_VALUE)||'</P></TD>'||CHR(13)),' <TR>'||CHR(13)||'  <TD><P class=user>'||TO_CHAR(p.FN_VALUE)||'</P></TD>'||CHR(13));
        DBMS_LOB.WRITEAPPEND(clTemp, LENGTH('  <TD style=''text-align:left''><P class=user>'||LOGIN.GET_SOTRNAME(p.FN_VALUE)||'</P></TD>'||CHR(13)),'  <TD style=''text-align:left''><P class=user>'||LOGIN.GET_SOTRNAME(p.FN_VALUE)||'</P></TD>'||CHR(13));
        if pFD_DATE1 is null or pFD_DATE2 is null then
          open cCountAll(p.FN_VALUE);
          fetch cCountAll into nTemp, nTemp1;
          close cCountAll;
        else
          open cCount(p.FN_VALUE);
          fetch cCount into nTemp, nTemp1;
          close cCount;
        end if;
        if nTemp > 0 then
          nSum := nSum + nTemp;
        end if;
        if nTemp1 > 0 then
          nSum1 := nSum1 + nTemp1;
        end if;
        DBMS_LOB.WRITEAPPEND(clTemp, LENGTH('  <TD class=user><P class=user>'||PKG_R_ALLFUNC.RETURN_VALUE(nTemp)||'</P></TD>'||CHR(13)),'  <TD class=user><P class=user>'||PKG_R_ALLFUNC.RETURN_VALUE(nTemp)||'</P></TD>'||CHR(13));
        DBMS_LOB.WRITEAPPEND(clTemp, LENGTH('  <TD class=user><P class=user>'||PKG_R_ALLFUNC.RETURN_VALUE(nTemp1)||'</P></TD>'||CHR(13)||' </TR>'||CHR(13)),'  <TD class=user><P class=user>'||PKG_R_ALLFUNC.RETURN_VALUE(nTemp1)||'</P></TD>'||CHR(13)||' </TR>'||CHR(13));
        --end if;
      --end loop;
    end loop;

    sHtml := ' <TR>'||CHR(13)||'  <TD class=user colspan=2>ИТОГО:</TD>'||CHR(13);
    DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);
    DBMS_LOB.WRITEAPPEND(clTemp, LENGTH('  <TD class=user>'||TO_CHAR(nSum)||'</TD>'||CHR(13)),'  <TD class=user>'||TO_CHAR(nSum)||'</TD>'||CHR(13));
    DBMS_LOB.WRITEAPPEND(clTemp, LENGTH('  <TD class=user>'||TO_CHAR(nSum1)||'</TD>'||CHR(13)||' </TR>'||CHR(13)),'  <TD class=user>'||TO_CHAR(nSum1)||'</TD>'||CHR(13)||' </TR>'||CHR(13));

    sHtml := '</TABLE>'||CHR(13)||'<BR><P><B>Отчет составил: _________________________'||LOGIN.GET_SOTRNAME(pFK_SOTRID)||'</B></P>'||CHR(13)||'</DIV></BODY></HTML>';
    DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);
    RETURN clTemp;
  end;
END;
/

SHOW ERRORS;


