DROP PACKAGE BODY ASU.PKG_R_REGEDIT
/

--
-- PKG_R_REGEDIT  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_R_REGEDIT" 
 is-- Created by TimurLan

  FUNCTION GET_PEPL_ROJDYEAR(pFK_PEPLID IN BINARY_INTEGER)
  return VARCHAR2
   is
    CURSOR c
     IS
      SELECT /*+ rule*/TO_CHAR(FD_ROJD,'YYYY') FC_YEAR
        FROM TPEOPLES
       WHERE FK_ID = pFK_PEPLID;
    Result VARCHAR2(4);
  begin
    open c;
    fetch c into Result;
    close c;
    return(NVL(Result,''));
  end;
  FUNCTION GET_PAC_FCUSLVIDSHORT (pFK_VARID IN BINARY_INTEGER,pFN_VALUE IN BINARY_INTEGER DEFAULT 0)
  return VARCHAR2
   is
    CURSOR c
     IS
      SELECT FC_SHORT
        FROM TUSLVID
       WHERE FK_ID=pFK_VARID;
    CURSOR c1
     IS
      SELECT FC_SHORT
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
   IS-- Used in rRegedit.dpr
    CURSOR cMain (pFK_PRIZN in NUMBER) is
      SELECT --PKG_REGIST_PACFUNC.GET_PAC_IB(FK_IBID,FK_IBY) FC_IB,
             INITCAP(PKG_REGIST_PEPLFUNC.GET_PEPL_FULLFIO(FK_PEPLID)) FC_FIO,
             PKG_R_REGEDIT.GET_PEPL_ROJDYEAR(FK_PEPLID) FC_YEAR,
             PKG_REGIST_PEPLFUNC.GET_PEPL_INSURANCE(FK_PEPLID) FC_INSURANCE,
             PKG_REGIST_PEPLFUNC.GET_PEPL_FCGROUP(FK_GROUPID) FC_GROUP,
             PKG_R_REGEDIT.GET_PAC_FCUSLVIDSHORT(FK_USLVIDID) FC_USLVID,
             TKARTA.FN_SUM FC_SUM,
             TSROKY.FN_KOL FC_KOL,
             TO_CHAR(TSROKY.FD_DATA1,'dd.mm.yyyy') FC_DATA1,
             TO_CHAR(TSROKY.FD_DATA2,'dd.mm.yyyy') FC_DATA2,
             DO_MKBBYTYPE (TKARTA.FK_ID, 2, 1, -1, 0) FC_MKB
        FROM TKARTA,TSROKY
       WHERE TSROKY.FK_PRYB=1
         AND TSROKY.FD_DATA1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
         AND TKARTA.FK_ID=TSROKY.FK_PACID
         AND TKARTA.FK_PRIZN=pFK_PRIZN
         AND TKARTA.FL_DOR=0;
--       ORDER BY TKARTA.FK_ID;
--       ORDER BY FK_IBID;
    CURSOR cPrizn IS SELECT FK_ID, FC_NAME FROM TPRIZN ORDER BY FN_ORDER;
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

    str := PKG_HTML.GET_HEAD('excel','Реестр медицинских услуг по санаторию "'||PKG_SMINI.READSTRING('CONFIG','S_NAME','Не известен')||'" за период с '||TO_CHAR(pFD_DATA1,'dd.mm.yyyy')||' по '||TO_CHAR(pFD_DATA2,'dd.mm.yyyy'),
                             null,'8.0','Arial',
                             null,null,null,
                             null,null,null,
                             '297','210','landscape',
                             '.39','.39','.39','.39',
                             null,null,null,'left',
                             null,null,null,null,
                             null,null,null);
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    str :='<BODY>'||
--          '<P align="CENTER"><B>Реестр</B><P>'||
          '<P align="CENTER">Приложение № ____ к счету № ____ от "____"____________<P>'||
          '<P align="CENTER"><B>Реестр</B><P>'||
          '<P align="CENTER">медицинских услуг, оказанных отделением №1 санатория-профилактория ООО "' ||PKG_SMINI.READSTRING ('CONFIG', 'S_NAME', 'Не известен') ||'"<BR>лицам, застрахованным в ОАО "Газпроммедстрах" за период с ' || TO_CHAR (pFD_DATA1, 'dd.mm.yyyy') || ' по ' || TO_CHAR (pFD_DATA2, 'dd.mm.yyyy') || '</P>'||
          '<table>'||
          '<TR>'||
          ' <TD rowspan=2><p class=user>№ п/п</p></TD>'||
          ' <TD rowspan=2><p class=user>Ф.И.О.:</p></TD>'||
          ' <TD rowspan=2><p class=user>Год рождения:</p></TD>'||
          ' <TD rowspan=2><p class=user>Полис:</p></TD>'||
          ' <TD rowspan=2><p class=user>Место работы:</p></TD>'||
          ' <TD colspan=2><p class=user>Курс реабилитации</p></TD>'||
          ' <TD rowspan=2><p class=user>МКБ-10:</p></TD>'||
          ' <TD rowspan=2><p class=user>Код прейскуранта:</p></TD>'||
          ' <TD rowspan=2><p class=user>Кол-во дней:</p></TD>'||
          ' <TD rowspan=2><p class=user>Стоимость:</p></TD>'||
          '</TR>'||
          '<TR>'||
          ' <TD><p class=user>с:</p></TD>'||
          ' <TD><p class=user>по:</p></TD>'||
          '</TR>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);

    nCountAll:=0;
    nSumAll:=0;
    FOR p IN cPrizn LOOP
      str := '<TR><TD colspan=11><P class=user><B><U>'|| p.FC_NAME ||'</U></B></P></TD></TR>';
      nCount:=0;
      nSum:=0;
      DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
      FOR k IN cMain(p.FK_ID) LOOP
        str:='<TR>'||
--          ' <TD style=''text-align:right;mso-number-format:"\@";''><p class=user>'||k.FC_IB||'</p></TD>'||
          ' <TD style=''text-align:right''><p class=user>'||TO_CHAR(nCount+1)||'</p></TD>'||
          ' <TD class=user><p class=user>'||k.FC_FIO||'</p></TD>'||
          ' <TD><p class=user>'||k.FC_YEAR||'</p></TD>'||
          ' <TD style=''text-align:right;white-space:nowrap''><p class=user>'||k.FC_INSURANCE||'</p></TD>'||
          ' <TD class=user><p class=user>'||k.FC_GROUP||'</p></TD>'||
          ' <TD><p class=user>'||k.FC_DATA1||'</p></TD>'||
          ' <TD><p class=user>'||k.FC_DATA2||'</p></TD>'||
          ' <TD><p class=user>'||k.FC_MKB||'</p></TD>'||
--          ' <TD class=user><p class=user>'||k.FC_USLVID||'</p></TD>'||
          ' <TD><p class=user>'||k.FC_USLVID||'</p></TD>'||
          ' <TD><p class=user>'||k.FC_KOL||'</p></TD>'||
          ' <TD style=''text-align:right;mso-number-format:Standard''><p class=user>'||k.FC_SUM||'</p></TD>'||
          '</TR>';
        nCount:=nCount+1;
        nSum:=nSum+k.FC_SUM;
        DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
      END LOOP;
      str := '<TR>'||
             '<TD colspan=7 style=''text-align:right''><P class=user><B>Кол-во: '||TO_CHAR(nCount)||'</B></P></TD>'||
             '<TD colspan=3 style=''text-align:right''><P class=user><B>Сумма:</B></P></TD>'||
             '<TD style=''mso-font-charset:204;mso-number-format:"\#\,\#\#0\.00\0022р\.\0022";''><P class=user><B>'||TO_CHAR(nSum)||'</B></P></TD>'||
             '</TR>';
      nCountAll:=nCountAll+nCount;
      nSumAll:=nSumAll+nSum;
      DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    END LOOP;

    str := '<TR><TD colspan=11><P class=user><B>ИТОГО ПО САНАТОРИЮ:</B></P></TD></TR>'||
           '<TR>'||
           '<TD colspan=7 style=''text-align:right''><P class=user><B>Кол-во: '||TO_CHAR(nCountAll)||'</B></P></TD>'||
           '<TD colspan=3 style=''text-align:right''><P class=user><B>Сумма:</B></P></TD>'||
           '<TD style=''mso-font-charset:204;mso-number-format:"\#\,\#\#0\.00\0022р\.\0022";''><P class=user><B>'||TO_CHAR(nSumAll)||'</B></P></TD>'||
           '</TR></TABLE>';
     DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);

--    str  := '</TABLE><BR><P><B>Отчет составил_________________________' || DO_VRACHFIO (pFK_VRACHID);
    str  := '<BR><BR><P><B>Главный врач_________________________' ||
            '<BR><BR>Экономист&nbsp;&nbsp;&nbsp;_________________________' ||
            '<BR>Вед. бухгалтер_________________________' ||
            '</B></P></BODY></HTML>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    DBMS_LOB.CLOSE (cC);
    RETURN nC;
  END;
end PKG_R_REGEDIT;
/

SHOW ERRORS;


