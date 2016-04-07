DROP PACKAGE BODY ASU.PKG_R_REGEDIT_PLUS
/

--
-- PKG_R_REGEDIT_PLUS  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_R_REGEDIT_PLUS" 
 is-- Created by TimurLan

  FUNCTION GET_PAC_FCUSLVID (pFK_VARID IN BINARY_INTEGER,pFN_VALUE IN BINARY_INTEGER DEFAULT 0)
  return VARCHAR2
   is
    CURSOR c
     IS
      SELECT FC_NAME
        FROM TUSLVID
       WHERE FK_ID=pFK_VARID;
    CURSOR c1
     IS
      SELECT FC_NAME
        FROM TUSLVID
       WHERE FK_ID=(SELECT FK_USLVIDID
                      FROM TKARTA
                     WHERE FK_ID=pFK_VARID);
    Result VARCHAR2(100);
  begin
    if pFN_VALUE=1 then
      open c1;
      fetch c1 into result;
      close c1;
    else
      open c;
      fetch c into result;
      close c;
    end if;
    return(NVL(Result,'Не определено'));
  end;

  FUNCTION DO_CALC_REPORT (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_VRACHID IN NUMBER)
  RETURN NUMBER
   IS-- Used in rRegeditPlus.dpr
    CURSOR cMain (pFK_KOD2 in NUMBER) is
      SELECT PKG_R_REGEDIT_PLUS.GET_PAC_FCUSLVID(FK_USLVIDID) FC_USLVID,
             TSROKY.FN_KOL FN_KOL,
             COUNT(FK_USLVIDID) FN_COUNT,
             SUM(TKARTA.FN_SUM) FN_SUM
        FROM TKARTA,TSROKY
       WHERE TSROKY.FK_PRYB=1
         AND TSROKY.FD_DATA1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
         AND TKARTA.FK_ID=TSROKY.FK_PACID
         AND TKARTA.FK_KOD2=pFK_KOD2
         AND TKARTA.FL_DOR=0
         GROUP BY FK_USLVIDID,FN_KOL;
    CURSOR cVid IS SELECT * FROM TVID ORDER BY FK_ID;
    nC NUMBER;
    cC CLOB;
    str VARCHAR2 (32767);
    nTemp NUMBER;
    nCount NUMBER;
    nCountAll NUMBER;
    nSum NUMBER;
    nSumAll NUMBER;
  BEGIN
    INSERT INTO TCLOBS (FC_CLOB)
         VALUES (EMPTY_CLOB () )
      RETURNING FK_ID, FC_CLOB INTO nC, cC;
    DBMS_LOB.OPEN (cC, DBMS_LOB.LOB_READWRITE);

    str := PKG_HTML.GET_HEAD('excel','Сведения по санаторию "'||PKG_SMINI.READSTRING('CONFIG','S_NAME','Не известен')||'" за период с '||TO_CHAR(pFD_DATA1,'dd.mm.yyyy')||' по '||TO_CHAR(pFD_DATA2,'dd.mm.yyyy'),
                             null,'10.0','Arial',
                             null,null,null,
                             null,null,null,
                             '297','210','landscape',
                             '.39','.39','.39','.78',
                             null,null,null,'left',
                             null,null,null,null,
                             null,null,null);
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    str :='<BODY>'||
--          '<P align="CENTER"><B>Реестр</B><P>'||
          '<P align="CENTER"><B>Сведения по санаторию "' ||PKG_SMINI.READSTRING ('CONFIG', 'S_NAME', 'Не известен') ||'"</B><BR> за период с ' || TO_CHAR (pFD_DATA1, 'dd.mm.yyyy') || ' по ' || TO_CHAR (pFD_DATA2, 'dd.mm.yyyy') || '</P>'||
          '<table>'||
          '<TR>'||
          ' <TD><p class=user>Тип:</p></TD>'||
          ' <TD><p class=user>Кол-во:</p></TD>'||
          ' <TD><p class=user>Сумма:</p></TD>'||
          '</TR>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);

    nCountAll:=0;
    nSumAll:=0;
    FOR p IN cVid LOOP
      str := '<TR><TD colspan=3 style=''text-align:left''><P class=user><U>'|| p.FC_NAME ||'</U></P></TD></TR>';
      nCount:=0;
      nSum:=0;
      FOR k IN cMain(p.FK_ID) LOOP
        str:=str||
          '<TR>'||
          ' <TD class=user style=''text-align:right''><p class=user>'||k.FC_USLVID||' ('||k.FN_KOL||' дн.)</p></TD>'||
          ' <TD style=''text-align:right''><p class=user>'||k.FN_COUNT||'</p></TD>'||
          ' <TD style=''text-align:right;mso-number-format:Standard''><p class=user>'||k.FN_SUM||'</p></TD>'||
          '</TR>';
        nCount:=nCount+k.FN_COUNT;
        nSum:=nSum+k.FN_SUM;
      END LOOP;
      str := str||'<TR>'||
             '<TD style=''text-align:right''><P class=user>Всего:</P></TD>'||
             '<TD style=''text-align:right''><P class=user>'||TO_CHAR(nCount)||'</P></TD>'||
             '<TD style=''text-align:right;mso-font-charset:204;mso-number-format:"\#\,\#\#0\.00\0022р\.\0022";''><P class=user>'||TO_CHAR(nSum)||'</P></TD>'||
             '</TR>';
      nCountAll:=nCountAll+nCount;
      nSumAll:=nSumAll+nSum;
      DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    END LOOP;

    str := '<TR><TD colspan=3><P class=user>&nbsp;</P></TD></TR>'||
           '<TR>'||
           '<TD style=''text-align:right''><P class=user><B>ИТОГО ПО САНАТОРИЮ:</B></P></TD>'||
           '<TD><P class=user><B>'||TO_CHAR(nCountAll)||'</B></P></TD>'||
           '<TD style=''mso-font-charset:204;mso-number-format:"\#\,\#\#0\.00\0022р\.\0022";''><P class=user><B>'||TO_CHAR(nSumAll)||'</B></P></TD>'||
           '</TR></TABLE>';
     DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);

    str  := '</TABLE><BR><P><B>Отчет составил_________________________' || DO_VRACHFIO (pFK_VRACHID)||
/*    str  := '<BR><BR><P><B>Главный врач_________________________' ||
            '<BR><BR>Экономист&nbsp;&nbsp;&nbsp;_________________________' ||
            '<BR>Вед. бухгалтер_________________________' ||*/
            '</B></P></BODY></HTML>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    DBMS_LOB.CLOSE (cC);
    RETURN nC;
  END;
end PKG_R_REGEDIT_PLUS;
/

SHOW ERRORS;


