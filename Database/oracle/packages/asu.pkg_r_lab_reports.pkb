DROP PACKAGE BODY ASU.PKG_R_LAB_REPORTS
/

--
-- PKG_R_LAB_REPORTS  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_R_LAB_REPORTS" IS

function get_cost(pFK_SMID IN NUMBER, pFD_DATE IN DATE) RETURN NUMBER IS
      -- Возвращает стоимость тарифа по коду на дату
    nRes NUMBER;
  BEGIN
    FOR C IN (SELECT MAX(FN_COST) CNT
                FROM ASU.THEAL_COST, ASU.THEAL_SMID
               WHERE THEAL_SMID.FK_SMID = pFK_SMID
                     AND THEAL_COST.FK_HEALID = ASU.THEAL_SMID.fk_heal
                     AND pFD_DATE BETWEEN THEAL_COST.FD_DATE1 AND NVL(THEAL_COST.FD_DATE2, SYSDATE))
    LOOP
      nRes := C.CNT;
    END LOOP;
    RETURN NVL(nRes, 0);
end;


function GetPacStrah(pFK_PACID IN NUMBER) RETURN NUMBER IS
cursor c is (select FK_COMPANYID
           FROM tpac_insurance, tinsurdocs
           WHERE tpac_insurance.FK_PACID = pFK_PACID
                 AND tpac_insurance.FK_INSURDOCID = tinsurdocs.FK_ID);
nRes NUMBER;
begin
  OPEN C;
   FETCH C INTO nRes;
  CLOSE C;
  RETURN nRes;
end;



 FUNCTION GET_REANIM(pFK_PACID NUMBER, pFD_DATE DATE, pFN_OTDEL NUMBER) RETURN NUMBER IS
 BEGIN
    FOR C IN (SELECT FK_ROOMID
              FROM tnazlech
              WHERE FK_PACID = pFK_PACID
                    AND ((FD_NAZ <= pFD_DATE and FD_RUN >= pFD_DATE) or (FD_NAZ <= pFD_DATE and (FD_RUN = FD_NAZ or FD_RUN = TRUNC(FD_RUN))))
                    AND FK_SMID = ASU.GET_REANIMID
                    AND FK_ROOMID IN (GET_REANIMKAB, GET_OARKAB)) LOOP

        if c.FK_ROOMID = GET_REANIMKAB THEN
            RETURN get_reanimotdel;
        else IF c.FK_ROOMID = GET_OARKAB THEN
            RETURN Get_Oarotdel;
        END IF;
        END IF;
    END LOOP;
    RETURN pFN_OTDEL;
 END;

 FUNCTION GET_OTDEL(pFK_PACID NUMBER, pFD_RUN DATE) RETURN NUMBER IS
    isFirst BOOLEAN := TRUE;
 BEGIN
    for c in (select TPERESEL.FK_ID, TPERESEL.FD_DATA1, TPERESEL.FD_DATA2, TPERESEL.FK_PALATAID
              FROM TPERESEL, TDOCOBSL
              WHERE FK_PACID = pFK_PACID
                    AND FK_DOCOBSLID = TDOCOBSL.FK_ID
                    AND TDOCOBSL.FK_VIDDOCID NOT IN (SELECT FK_ID
                                                     FROM TUSLVID
                                                     START WITH FK_ID NOT IN (SELECT FN_CONST
                                                                          FROM TCONST
                                                                          WHERE FC_FUNC = 'DOC_IBDS_STAC' OR FC_FUNC = 'DOC_IB_DS')
                                                     CONNECT BY PRIOR FK_ID = FK_OWNERID) ORDER BY FD_DATA2 DESC) LOOP


        if c.FD_DATA1 <= pFD_RUN and isFirst then
            RETURN c.FK_PALATAID;
        else if c.FD_DATA1 <= pFD_RUN AND c.FD_DATA2 >= pFD_RUN then
            RETURN c.FK_PALATAID;
        else if not isFirst then
            RETURN -1;
        END IF;
        END IF;
        END IF;
        isFirst := False;
    END LOOP;
    Return -1;
 END;

  FUNCTION GET_OTDEL_ID(pFK_PACID NUMBER, pFD_RUN DATE) RETURN NUMBER IS
  begin
     for c in (SELECT TROOM.FK_OTDELID
               FROM TROOM, TPERESEL
               WHERE TROOM.FK_ID = TPERESEL.FK_PALATAID
                      AND TPERESEL.FK_PACID = pFK_PACID
                      AND ((pFD_RUN BETWEEN TPERESEL.FD_DATA1 AND TPERESEL.FD_DATA2)
                           or (TPERESEL.FD_DATA1 <= pFD_RUN and TPERESEL.FK_ID = (select max(fk_id) from tperesel where fK_pacid = pFK_PACID)))) LOOP
        Return c.FK_OTDELID;
     END LOOP;
     Return -1;
  end;

  FUNCTION ConvertTimeStrToMinutes(pTimeStr IN TSMID.FC_TIME%TYPE)
    RETURN NUMBER IS
    Result NUMBER := 0;
  begin
    if pTimeStr is not null or pTimeStr <> '00:00:00' then
      Result := TO_CHAR(TO_DATE(pTimeStr,'hh24:mi:ss'),'hh24')*60 +
                TO_CHAR(TO_DATE(pTimeStr,'hh24:mi:ss'),'mi')+
                TO_CHAR(TO_DATE(pTimeStr,'hh24:mi:ss'),'ss')/60;
    end if;
    RETURN Result;
  end;

  FUNCTION GetRepByTEST(pFK_SOTRID IN BINARY_INTEGER, pFD_DATE1 IN DATE DEFAULT NULL, pFD_DATE2 IN DATE DEFAULT NULL)
    RETURN CLOB IS
  CURSOR cCountAll(pSmidID IN BINARY_INTEGER) IS
    SELECT /*+ rule*/COUNT(TRESAN.FK_SMID)
      FROM TRESAN, TNAZAN
     WHERE TRESAN.FK_SMID IN (SELECT FK_ID
                         FROM (SELECT FK_ID, FL_SHOWANAL
                                 FROM TSMID
                                START WITH FK_ID = pSmidID
                               CONNECT BY PRIOR FK_ID = FK_OWNER)
                        WHERE FL_SHOWANAL = 4)
      AND (TRESAN.FC_RES IS NOT NULL OR TRESAN.FK_BLOBID IS NOT NULL OR TRESAN.FN_RES IS NOT NULL)
      AND TNAZAN.FK_ID = FK_NAZID
      AND TNAZAN.FK_NAZSOSID = GET_VIPNAZ;
  CURSOR cCount(pSmidID IN BINARY_INTEGER) IS
    SELECT /*+ rule*/COUNT(TRESAN.FK_SMID)
      FROM TRESAN, TNAZAN
     WHERE TRESAN.FK_SMID IN (SELECT FK_ID
                         FROM (SELECT FK_ID, FL_SHOWANAL
                                 FROM TSMID
                                START WITH FK_ID = pSmidID
                               CONNECT BY PRIOR FK_ID = FK_OWNER)
                        WHERE FL_SHOWANAL = 4)
      AND (TRESAN.FC_RES IS NOT NULL OR TRESAN.FK_BLOBID IS NOT NULL OR TRESAN.FN_RES IS NOT NULL)
      AND TNAZAN.FK_ID = FK_NAZID
      AND TNAZAN.FK_NAZSOSID = GET_VIPNAZ
      AND TNAZAN.FD_RUN BETWEEN TRUNC(pFD_DATE1) AND TRUNC(pFD_DATE2)+1-1/(24*60*60);
    clTemp  CLOB;
    sHtml   LONG;
    nTemp   BINARY_INTEGER := 0;
    nSum    BINARY_INTEGER := 0;
  begin
    DBMS_LOB.CREATETEMPORARY(clTemp, FALSE);
    sHtml := PKG_HTML.GET_HEAD('word','GetTESTReport "' ||PKG_SMINI.READSTRING('CONFIG','S_NAME','Не известен')||'"',
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
    sHtml := sHtml||'<P align=center><B>' || Login.get_sotr_otdelname(pFK_SOTRID) ||  '.</P>'||CHR(13);

    if pFD_DATE1 is null or pFD_DATE2 is null then
      sHtml := sHtml||'<P align=center><B>Отчет о количестве выполненных тестов<BR>за весь период работы</P><BR>'||CHR(13);
    elsif pFD_DATE1 = pFD_DATE2 then
      sHtml := sHtml||'<P align=center><B>Отчет о количестве выполненных тестов<BR>за '||TO_CHAR(pFD_DATE1,'dd.mm.yyyy')||'</P><BR>'||CHR(13);
    else
      sHtml := sHtml||'<P align=center><B>Отчет о количестве выполненных тестов<BR>за период с '||TO_CHAR(pFD_DATE1,'dd.mm.yyyy')||' по '||TO_CHAR(pFD_DATE2,'dd.mm.yyyy')||'</P><BR>'||CHR(13);
    end if;
    sHtml := sHtml||
         '<TABLE>'||CHR(13)||
         ' <TR>'||CHR(13)||
         '  <TD>ID</TD>'||CHR(13)||
         '  <TD>Название</TD>'||CHR(13)||
         '  <TD>Кол-во, ед.</TD>'||CHR(13)||' </TR>'||CHR(13);
    DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);

    for p in (SELECT * FROM TMP_NUMBERS) loop
      DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(' <TR>'||CHR(13)||'  <TD><P class=user>'||TO_CHAR(p.FN_VALUE)||'</P></TD>'||CHR(13)),' <TR>'||CHR(13)||'  <TD><P class=user>'||TO_CHAR(p.FN_VALUE)||'</P></TD>'||CHR(13));
  --xside 29.12.07    --DBMS_LOB.WRITEAPPEND(clTemp, LENGTH('  <TD style=''text-align:left''><P class=user>'||GET_NAME_FROM_SMID(p.FN_VALUE)||'</P></TD>'||CHR(13)),'  <TD style=''text-align:left''><P class=user>'||GET_NAME_FROM_SMID(p.FN_VALUE)||'</P></TD>'||CHR(13));
      DBMS_LOB.WRITEAPPEND(clTemp, LENGTH('  <TD style=''text-align:left''><P class=user>'||GET_FULLPATH_SHA(p.FN_VALUE)||'</P></TD>'||CHR(13)),'  <TD style=''text-align:left''><P class=user>'||GET_FULLPATH_SHA(p.FN_VALUE)||'</P></TD>'||CHR(13));
      if pFD_DATE1 is null or pFD_DATE2 is null then
        open cCountAll(p.FN_VALUE);
        fetch cCountAll into nTemp;
        close cCountAll;
      else
        open cCount(p.FN_VALUE);
        fetch cCount into nTemp;
        close cCount;
      end if;
      if nTemp > 0 then
        nSum := nSum + nTemp;
      end if;
      DBMS_LOB.WRITEAPPEND(clTemp, LENGTH('  <TD class=user><P class=user>'||PKG_R_ALLFUNC.RETURN_VALUE(nTemp)||'</P></TD>'||CHR(13)||' </TR>'||CHR(13)),'  <TD class=user><P class=user>'||PKG_R_ALLFUNC.RETURN_VALUE(nTemp)||'</P></TD>'||CHR(13)||' </TR>'||CHR(13));
    end loop;

    sHtml := ' <TR>'||CHR(13)||'  <TD class=user colspan=2>ИТОГО:</TD>'||CHR(13);
    DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);
    DBMS_LOB.WRITEAPPEND(clTemp, LENGTH('  <TD class=user>'||TO_CHAR(nSum)||'</TD>'||CHR(13)||' </TR>'||CHR(13)),'  <TD class=user>'||TO_CHAR(nSum)||'</TD>'||CHR(13)||' </TR>'||CHR(13));

    sHtml := '</TABLE>'||CHR(13)||'<BR><P><B>Отчет составил: _________________________'||LOGIN.GET_SOTRNAME(pFK_SOTRID)||'</B></P>'||CHR(13)||'</DIV></BODY></HTML>';
    DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);
    RETURN clTemp;
  end;
/*********************************************************************************************************************/
/*********************************************************************************************************************/
/*********************************************************************************************************************/
  FUNCTION GetRepBySOTR1(pFK_SOTRID IN BINARY_INTEGER, pFD_DATE1 IN DATE DEFAULT NULL, pFD_DATE2 IN DATE DEFAULT NULL)
    RETURN CLOB IS
  CURSOR cNames IS
    SELECT -1 FK_ID, pFK_SOTRID FK_OWNER, 'Персонал' FC_NAME, 0 FL_DEL, 0 FL_CHECK FROM DUAL
    UNION
    SELECT 0 FK_ID, -1 FK_OWNER, 'Врач' FC_NAME, 0 FL_DEL, 0 FL_CHECK FROM DUAL
    UNION
    SELECT 1 FK_ID, -1 FK_OWNER, 'Лаборант' FC_NAME, 0 FL_DEL, 0 FL_CHECK FROM DUAL
    UNION
    SELECT 2 FK_ID, -1 FK_OWNER, 'Прочий' FC_NAME, 0 FL_DEL, 0 FL_CHECK FROM DUAL;
  CURSOR cCountAll(pSmidID IN BINARY_INTEGER) IS
    SELECT /*+ rule*/COUNT(FK_SMID), SUM(FN_TIME)
      FROM TNAZAN,(SELECT FK_ID, ConvertTimeStrToMinutes(FC_TIME) FN_TIME
                     FROM TSMID
                    WHERE EXISTS (SELECT FK_ID
                                    FROM TSMID_RIGHTS
                                   WHERE FK_SOTRID = pFK_SOTRID
                                     AND FK_SMID = TSMID.FK_ID)
                      AND FL_SHOWANAL = 2
                      AND FP_INOUT = pSmidID
                    START WITH FK_ID = GET_ANALID
                  CONNECT BY PRIOR FK_ID = FK_OWNER) TSMID
    WHERE FK_SMID = TSMID.FK_ID
      AND FK_NAZSOSID = GET_VIPNAZ;
  CURSOR cCount(pSmidID IN BINARY_INTEGER) IS
    SELECT /*+ rule*/COUNT(FK_SMID), SUM(FN_TIME)
      FROM TNAZAN,(SELECT FK_ID, ConvertTimeStrToMinutes(FC_TIME) FN_TIME
                     FROM TSMID
                    WHERE EXISTS (SELECT FK_ID
                                    FROM TSMID_RIGHTS
                                   WHERE FK_SOTRID = pFK_SOTRID
                                     AND FK_SMID = TSMID.FK_ID)
                      AND FL_SHOWANAL = 2
                      AND FP_INOUT = pSmidID
                    START WITH FK_ID = GET_ANALID
                  CONNECT BY PRIOR FK_ID = FK_OWNER) TSMID
    WHERE FK_SMID = TSMID.FK_ID
      AND FK_NAZSOSID = GET_VIPNAZ
      AND FD_RUN BETWEEN TRUNC(pFD_DATE1) AND TRUNC(pFD_DATE2)+1-1/(24*60*60);
    clTemp  CLOB;
    sHtml   LONG;
    nTemp   BINARY_INTEGER := 0;
    nTemp1  NUMBER := 0;
    nSum    BINARY_INTEGER := 0;
    nSum1   NUMBER := 0;
    nNum NUMBER;
  begin
    DBMS_LOB.CREATETEMPORARY(clTemp, FALSE);
    sHtml := PKG_HTML.GET_HEAD('word','GetRepBySOTR1 "' ||PKG_SMINI.READSTRING('CONFIG','S_NAME','Не известен')||'"',
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
    sHtml := sHtml||'<P align=center><B>' || Login.get_sotr_otdelname(pFK_SOTRID) ||  '.</P>'||CHR(13);

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
         '  <TD>№</TD>'||CHR(13)||
         '  <TD>Категория</TD>'||CHR(13)||
         '  <TD>Кол-во, ед.</TD>'||CHR(13)||
         '  <TD>Общ. вермя, мин.</TD>'||CHR(13)||' </TR>'||CHR(13);
    DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);
    nNum := 0;
    for p in (SELECT * FROM TMP_NUMBERS) loop
      for n in cNames loop
        if p.FN_VALUE = n.FK_ID then
        nNum := nNum + 1;
        DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(' <TR>'||CHR(13)||'  <TD><P class=user>'||TO_CHAR(nNum/*p.FN_VALUE*/)||'</P></TD>'||CHR(13)),' <TR>'||CHR(13)||'  <TD><P class=user>'||TO_CHAR(nNum)||'</P></TD>'||CHR(13));
        DBMS_LOB.WRITEAPPEND(clTemp, LENGTH('  <TD style=''text-align:left''><P class=user>'||n.FC_NAME||'</P></TD>'||CHR(13)),'  <TD style=''text-align:left''><P class=user>'||n.FC_NAME||'</P></TD>'||CHR(13));
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
        end if;
      end loop;
    end loop;

    sHtml := ' <TR>'||CHR(13)||'  <TD class=user colspan=2>ИТОГО:</TD>'||CHR(13);
    DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);
    DBMS_LOB.WRITEAPPEND(clTemp, LENGTH('  <TD class=user>'||TO_CHAR(nSum)||'</TD>'||CHR(13)),'  <TD class=user>'||TO_CHAR(nSum)||'</TD>'||CHR(13));
    DBMS_LOB.WRITEAPPEND(clTemp, LENGTH('  <TD class=user>'||TO_CHAR(nSum1)||'</TD>'||CHR(13)||' </TR>'||CHR(13)),'  <TD class=user>'||TO_CHAR(nSum1)||'</TD>'||CHR(13)||' </TR>'||CHR(13));

    sHtml := '</TABLE>'||CHR(13)||'<BR><P><B>Отчет составил: _________________________'||LOGIN.GET_SOTRNAME(pFK_SOTRID)||'</B></P>'||CHR(13)||'</DIV></BODY></HTML>';
    DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);
    RETURN clTemp;
  end;
/*********************************************************************************************************************/
/*********************************************************************************************************************/
/*********************************************************************************************************************/
  FUNCTION GetRepBySOTR2(pFK_SOTRID IN BINARY_INTEGER, pFD_DATE1 IN DATE DEFAULT NULL, pFD_DATE2 IN DATE DEFAULT NULL)
    RETURN CLOB IS
  CURSOR cCountAll(pSmidID IN BINARY_INTEGER) IS
     SELECT /*+ rule*/COUNT(TNAZAN.FK_SMID), SUM(asu.PKG_R_LAB_REPORTS.ConvertTimeStrToMinutes(TSMID.FC_TIME)) FN_TIME
      FROM TNAZAN, TSMID
    WHERE FK_NAZSOSID = GET_VIPNAZ
          AND FK_ISPOLID = pSmidID
          AND TNAZAN.FK_SMID = TSMID.FK_ID
          and exists (select FK_ID
                      FROM TSMID_RIGHTS
                      WHERE FK_SOTRID = pFK_SOTRID
                            AND FK_SMID = TSMID.FK_ID);

  CURSOR cCount(pSmidID IN BINARY_INTEGER) IS
    SELECT /*+ rule*/COUNT(TNAZAN.FK_SMID), SUM(asu.PKG_R_LAB_REPORTS.ConvertTimeStrToMinutes(TSMID.FC_TIME)) FN_TIME
      FROM TNAZAN, TSMID
    WHERE FK_NAZSOSID = GET_VIPNAZ
          AND FD_RUN BETWEEN TRUNC(pFD_DATE1) AND TRUNC(pFD_DATE2)+1-1/(24*60*60)
          AND FK_ISPOLID = pSmidID
          AND TNAZAN.FK_SMID = TSMID.FK_ID
          and exists (select FK_ID
                      FROM TSMID_RIGHTS
                      WHERE FK_SOTRID = pFK_SOTRID
                            AND FK_SMID = TSMID.FK_ID);


    clTemp  CLOB;
    sHtml   LONG;
    nTemp   BINARY_INTEGER := 0;
    nTemp1  NUMBER := 0;
    nSum    BINARY_INTEGER := 0;
    nSum1   NUMBER := 0;
    nNum NUMBER;
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
    sHtml := sHtml||'<P align=center><B>' || Login.get_sotr_otdelname(pFK_SOTRID) ||  '.</P>'||CHR(13);

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
         '  <TD>№</TD>'||CHR(13)||
         '  <TD>Сотрудник</TD>'||CHR(13)||
         '  <TD>Кол-во, ед.</TD>'||CHR(13)||
         '  <TD>Общ. время, мин.</TD>'||CHR(13)||' </TR>'||CHR(13);
    DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);
    nNum := 0;
    for p in (SELECT * FROM TMP_NUMBERS) loop
      --for n in cNames loop
        --if p.FN_VALUE = n.FK_ID then
        nNum := nNum + 1;
        DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(' <TR>'||CHR(13)||'  <TD><P class=user>'||TO_CHAR(nNum/*p.FN_VALUE*/)||'</P></TD>'||CHR(13)),' <TR>'||CHR(13)||'  <TD><P class=user>'||TO_CHAR(nNum)||'</P></TD>'||CHR(13));
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
/*********************************************************************************************************************/
/*********************************************************************************************************************/
/*********************************************************************************************************************/
  FUNCTION GetRepByGROUP1(pFK_SOTRID IN BINARY_INTEGER, pFD_DATE1 IN DATE DEFAULT NULL, pFD_DATE2 IN DATE DEFAULT NULL)
    RETURN CLOB IS

  CURSOR cNames IS
    SELECT 0 FK_ID, TO_NUMBER(NULL) FK_OWNER, 'Группы' FC_NAME, 0 FL_DEL, 0 FL_CHECK, 0 issledId
      FROM DUAL
    UNION
    SELECT SMID.FK_ID FK_ID, 0 FK_OWNER, FC_NAME, 0 FL_DEL, 0 FL_CHECK, SMID.FK_ID issledId
      FROM TSMID smid WHERE FK_OWNER IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = 'GROUP_ISSLED') AND FL_SHOWPRINT = 1
      and exists (SELECT fk_default
                    FROM TSMID
                  WHERE EXISTS (SELECT FK_ID
                                  FROM TSMID_RIGHTS
                                WHERE FK_SOTRID = pFK_SOTRID
                                  AND FK_SMID = TSMID.FK_ID)
                                  AND FL_SHOWANAL = 2
                                  AND FK_DEFAULT = SMID.FK_ID)  ;

  CURSOR cCountAll(pSmidID IN VARCHAR2) IS
    SELECT /*+ rule*/COUNT(FK_SMID), SUM(FN_TIME)
      FROM TNAZAN,(SELECT FK_ID, ConvertTimeStrToMinutes(FC_TIME) FN_TIME
                     FROM TSMID
                    WHERE EXISTS (SELECT FK_ID
                                    FROM TSMID_RIGHTS
                                   WHERE FK_SOTRID = pFK_SOTRID
                                     AND FK_SMID = TSMID.FK_ID)
                      AND FL_SHOWANAL = 2
                      AND TSMID.FC_REMARK = pSmidID
                    START WITH FK_ID = GET_ANALID
                  CONNECT BY PRIOR FK_ID = FK_OWNER) TSMID
    WHERE FK_SMID = TSMID.FK_ID
      AND FK_NAZSOSID = GET_VIPNAZ;

  CURSOR cCount IS                      --
  --  select -- FK_ID
   SELECT COUNT(*) FN_COUNT, SUM(PKG_R_LAB_REPORTS.ConvertTimeStrToMinutes(FC_TIME)) FN_MIN, fn_value
    FROM (SELECT  FC_TIME, tmp_numbers.fn_value, TNAZAN.FK_ID
    FROM TNAZAN, TSMID, tmp_numbers
    WHERE TSMID.fk_default = tmp_numbers.fn_value
      AND FK_SMID = TSMID.FK_ID
      AND FK_NAZSOSID = GET_VIPNAZ
      AND FD_RUN BETWEEN TRUNC(pFD_DATE1) AND TRUNC(pFD_DATE2)+1-1/(24*60*60)
      AND EXISTS (SELECT FK_ID
                    FROM TSMID_RIGHTS
                    WHERE FK_SOTRID = pFK_SOTRID
                          AND FK_SMID = TSMID.FK_ID))
      GROUP BY fn_value;
    clTemp  CLOB;
    sHtml   LONG;
    nTemp   BINARY_INTEGER := 0;
    nTemp1  NUMBER := 0;
    nSum    BINARY_INTEGER := 0;
    nSum1   NUMBER := 0;
    nNum NUMBER;
    nValues   TNUMBERS;
    nValues1  TNUMBERS;
    nSmids   TNUMBERS;
    i NUMBER;
  begin
    DBMS_LOB.CREATETEMPORARY(clTemp, FALSE);
    sHtml := PKG_HTML.GET_HEAD('word','GetRepByGROUP1 "' ||PKG_SMINI.READSTRING('CONFIG','S_NAME','Не известен')||'"',
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
    sHtml := sHtml||'<P align=center><B>' || Login.get_sotr_otdelname(pFK_SOTRID) ||  '.</P>'||CHR(13);

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
         '  <TD>№</TD>'||CHR(13)||
         '  <TD>Группа</TD>'||CHR(13)||
         '  <TD>Кол-во, ед.</TD>'||CHR(13)||
         '  <TD>Общ. время, мин.</TD>'||CHR(13)||' </TR>'||CHR(13);
    DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);
    nNum := 0;

    i := 1;

   for k in cCount LOOP
       nValues(i) := k.fn_count;
       nValues1(i) := k.FN_MIN;
       nSmids(i) :=  k.fn_value;
       i := i + 1;
    end loop;

--    INSERT INTO asu.tttt2(id, FK_PACID, FK_SMID, fn_value ) VALUES (1, 2, 3, 4 );
--    insert into asu.tttt2(id) values (1);
/*     for k in cCount LOOP
        INSERT INTO asu.tttt(id, FK_PACID, FK_SMID, fn_value ) VALUES (k.FK_ID, 2, 3, 4 );
        commit;
      end loop;

    RETURN clTemp;
*/
    for p in (SELECT * FROM TMP_NUMBERS) loop
      for n in cNames loop
        if p.FN_VALUE = n.FK_ID then
        nTemp := 0;
        nTemp1 := 0;
        nNum := nNum + 1;
        DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(' <TR>'||CHR(13)||'  <TD><P class=user>'||TO_CHAR(nNum)||'</P></TD>'||CHR(13)),' <TR>'||CHR(13)||'  <TD><P class=user>'||TO_CHAR(nNum)||'</P></TD>'||CHR(13));
        DBMS_LOB.WRITEAPPEND(clTemp, LENGTH('  <TD style=''text-align:left''><P class=user>'||n.FC_NAME||'</P></TD>'||CHR(13)),'  <TD style=''text-align:left''><P class=user>'||n.FC_NAME||'</P></TD>'||CHR(13));

        for k in 1..nValues.count loop

           if nSmids(k) = n.issledId then
            null;
             nTemp := nValues(k);
             nTemp1:= nValues1(k);
             exit;
           end if;
        end loop;

        if nTemp > 0 then
          nSum := nSum + nTemp;
        end if;
        if nTemp1 > 0 then
          nSum1 := nSum1 + nTemp1;
        end if;

        DBMS_LOB.WRITEAPPEND(clTemp, LENGTH('  <TD class=user><P class=user>'||PKG_R_ALLFUNC.RETURN_VALUE(nTemp)||'</P></TD>'||CHR(13)),'  <TD class=user><P class=user>'||PKG_R_ALLFUNC.RETURN_VALUE(nTemp)||'</P></TD>'||CHR(13));

        DBMS_LOB.WRITEAPPEND(clTemp, LENGTH('  <TD class=user><P class=user>'||PKG_R_ALLFUNC.RETURN_VALUE(nTemp1)||'</P></TD>'||CHR(13)||' </TR>'||CHR(13)),'  <TD class=user><P class=user>'||PKG_R_ALLFUNC.RETURN_VALUE(nTemp1)||'</P></TD>'||CHR(13)||' </TR>'||CHR(13));

        end if;
      end loop;

    end loop;

    sHtml := ' <TR>'||CHR(13)||'  <TD class=user colspan=2>ИТОГО:</TD>'||CHR(13);
    DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);
    DBMS_LOB.WRITEAPPEND(clTemp, LENGTH('  <TD class=user>'||TO_CHAR(nSum)||'</TD>'||CHR(13)),'  <TD class=user>'||TO_CHAR(nSum)||'</TD>'||CHR(13));
    DBMS_LOB.WRITEAPPEND(clTemp, LENGTH('  <TD class=user>'||TO_CHAR(nSum1)||'</TD>'||CHR(13)||' </TR>'||CHR(13)),'  <TD class=user>'||TO_CHAR(nSum1)||'</TD>'||CHR(13)||' </TR>'||CHR(13));

    sHtml := '</TABLE>'||CHR(13)||'<BR><P><B>Отчет составил: _________________________'||LOGIN.GET_SOTRNAME(pFK_SOTRID)||'</B></P>'||CHR(13)||'</DIV></BODY></HTML>';
    DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);
    RETURN clTemp;
  end;
/*********************************************************************************************************************/
/*********************************************************************************************************************/
/*********************************************************************************************************************/
  FUNCTION GetRepByGROUP2(pFK_SOTRID IN BINARY_INTEGER, pFD_DATE1 IN DATE DEFAULT NULL, pFD_DATE2 IN DATE DEFAULT NULL)
    RETURN CLOB IS
  CURSOR IsReanim IS SELECT COUNT(*) FN_COUNT FROM ASU.tmp_numbers WHERE FN_VALUE IN (get_reanimotdel, Get_Oarotdel);
  CURSOR cSTAC IS (select FK_ID from login.totdel WHERE FK_ID NOT IN (SELECT FN_VALUE FROM ASU.tmp_numbers) start with fk_id = 21466 connect by prior fk_id = fk_ownerid );

  CURSOR cCountAll(pSmidID IN BINARY_INTEGER) IS
    SELECT COUNT(FK_SMID), SUM(FN_TIME)
      from (select FK_SMID, FN_TIME
      FROM TNAZAN,(SELECT FK_ID, ConvertTimeStrToMinutes(FC_TIME) FN_TIME
                     FROM TSMID
                    WHERE EXISTS (SELECT FK_ID
                                    FROM TSMID_RIGHTS
                                   WHERE FK_SOTRID = pFK_SOTRID
                                     AND FK_SMID = TSMID.FK_ID)
                      AND FL_SHOWANAL = 2
                    START WITH FK_ID = GET_ANALID
                  CONNECT BY PRIOR FK_ID = FK_OWNER) TSMID, TAMBULANCE
    WHERE FK_SMID = TSMID.FK_ID
      AND TAMBULANCE.FK_ID = TNAZAN.FK_PACID
      AND FK_NAZSOSID = GET_VIPNAZ
      AND EXISTS (SELECT FK_ID
                    FROM TSOTR
                   WHERE FK_OTDELID = pSmidID /*IN
                         (SELECT FK_ID
                            FROM TOTDEL
                           START WITH FK_ID = pSmidID
                         CONNECT BY PRIOR FK_ID = FK_OWNERID) */
                     AND FK_VRACHID = TSOTR.FK_ID)
    union all
    select FK_SMID, FN_TIME
      FROM TNAZAN,(SELECT FK_ID, ConvertTimeStrToMinutes(FC_TIME) FN_TIME
                     FROM TSMID
                    WHERE EXISTS (SELECT FK_ID
                                    FROM TSMID_RIGHTS
                                   WHERE FK_SOTRID = pFK_SOTRID
                                     AND FK_SMID = TSMID.FK_ID)
                      AND FL_SHOWANAL = 2
                    START WITH FK_ID = GET_ANALID
                  CONNECT BY PRIOR FK_ID = FK_OWNER) TSMID, TKARTA
    WHERE FK_SMID = TSMID.FK_ID
      AND TKARTA.FK_ID = TNAZAN.FK_PACID
      AND FK_NAZSOSID = GET_VIPNAZ
      AND EXISTS (SELECT FK_OTDELID
                  FROM TROOM
                  WHERE FK_ID IN (SELECT FK_PALATAID FROM TPERESEL WHERE FK_PACID=TKARTA.FK_ID)
                        and TROOM.FK_OTDELID = pSmidID));

  /*

  CURSOR cCount(pSmidID IN BINARY_INTEGER) IS
    SELECT COUNT(FK_SMID), SUM(FN_TIME)
    from (select FK_SMID, FN_TIME
      FROM TNAZAN,(SELECT FK_ID, ConvertTimeStrToMinutes(FC_TIME) FN_TIME
                     FROM TSMID
                    WHERE EXISTS (SELECT FK_ID
                                    FROM TSMID_RIGHTS
                                   WHERE FK_SOTRID = pFK_SOTRID
                                     AND FK_SMID = TSMID.FK_ID)
                      AND FL_SHOWANAL = 2
                    START WITH FK_ID = GET_ANALID
                  CONNECT BY PRIOR FK_ID = FK_OWNER) TSMID, TAMBULANCE
    WHERE FK_SMID = TSMID.FK_ID
      AND TAMBULANCE.FK_ID = TNAZAN.FK_PACID
      AND FK_NAZSOSID = GET_VIPNAZ
      AND FD_RUN BETWEEN TRUNC(pFD_DATE1) AND TRUNC(pFD_DATE2)+1-1/(24*60*60)
      AND EXISTS (SELECT FK_ID
                    FROM TSOTR
                   WHERE FK_OTDELID = pSmidID
                     AND FK_VRACHID = TSOTR.FK_ID)
    union all
    select FK_SMID, FN_TIME
      FROM TNAZAN,(SELECT FK_ID, ConvertTimeStrToMinutes(FC_TIME) FN_TIME
                     FROM TSMID
                    WHERE EXISTS (SELECT FK_ID
                                    FROM TSMID_RIGHTS
                                   WHERE FK_SOTRID = pFK_SOTRID
                                     AND FK_SMID = TSMID.FK_ID)
                      AND FL_SHOWANAL = 2
                    START WITH FK_ID = GET_ANALID
                  CONNECT BY PRIOR FK_ID = FK_OWNER) TSMID, TKARTA
    WHERE FK_SMID = TSMID.FK_ID
      AND TKARTA.FK_ID = TNAZAN.FK_PACID
      AND FK_NAZSOSID = GET_VIPNAZ
      AND FD_RUN BETWEEN TRUNC(pFD_DATE1) AND TRUNC(pFD_DATE2)+1-1/(24*60*60)
      AND EXISTS (SELECT FK_OTDELID
                  FROM TROOM
                  WHERE FK_ID IN (SELECT FK_PALATAID FROM TPERESEL WHERE FK_PACID=TKARTA.FK_ID)
                        and TROOM.FK_OTDELID = pSmidID)
       );*/



/*  CURSOR cCount IS
       --    SELECT COUNT(*) FN_COUNT, SUM(PKG_R_LAB_REPORTS.ConvertTimeStrToMinutes(FC_TIME)) FN_MIN, fn_value
    SELECT COUNT(FK_SMID) FN_COUNT, SUM(FN_TIME) FN_MIN, fn_value
    from (select TNAZAN.FK_ID, FK_SMID, FN_TIME, fn_value
      FROM TNAZAN, tmp_numbers, (SELECT FK_ID, ConvertTimeStrToMinutes(FC_TIME) FN_TIME
                     FROM TSMID
                    WHERE EXISTS (SELECT FK_ID
                                    FROM TSMID_RIGHTS
                                   WHERE FK_SOTRID = pFK_SOTRID
                                     AND FK_SMID = TSMID.FK_ID)
                      AND FL_SHOWANAL = 2
                    START WITH FK_ID = GET_ANALID
                  CONNECT BY PRIOR FK_ID = FK_OWNER) TSMID, TAMBULANCE
    WHERE FK_SMID = TSMID.FK_ID
      AND TAMBULANCE.FK_ID = TNAZAN.FK_PACID
      AND FK_NAZSOSID = GET_VIPNAZ
      AND FD_RUN BETWEEN TRUNC(pFD_DATE1) AND TRUNC(pFD_DATE2)+1-1/(24*60*60)
      AND EXISTS (SELECT FK_ID
                    FROM TSOTR
                   WHERE FK_OTDELID =  tmp_numbers.fn_value
                     AND FK_VRACHID = TSOTR.FK_ID)
    union
    select TNAZAN.FK_ID, FK_SMID, FN_TIME, fn_value
      FROM TNAZAN, tmp_numbers, (SELECT FK_ID, ConvertTimeStrToMinutes(FC_TIME) FN_TIME
                     FROM TSMID
                     WHERE EXISTS (SELECT FK_ID
                                    FROM TSMID_RIGHTS
                                   WHERE FK_SOTRID = pFK_SOTRID
                                     AND FK_SMID = TSMID.FK_ID)
                      AND FL_SHOWANAL = 2
                    START WITH FK_ID = GET_ANALID
                  CONNECT BY PRIOR FK_ID = FK_OWNER) TSMID, TKARTA
    WHERE FK_SMID = TSMID.FK_ID
      AND TKARTA.FK_ID = TNAZAN.FK_PACID
      AND FK_NAZSOSID = GET_VIPNAZ
      AND FD_RUN BETWEEN TRUNC(pFD_DATE1) AND TRUNC(pFD_DATE2)+1-1/(24*60*60)
      AND EXISTS (SELECT FK_OTDELID
                  FROM TROOM
                  WHERE FK_ID IN (SELECT FK_PALATAID FROM TPERESEL WHERE FK_PACID=TKARTA.FK_ID
                                                                         AND TPERESEL.FD_DATA1 <= TNAZAN.FD_RUN)
                        and TROOM.FK_OTDELID = tmp_numbers.fn_value))
      group by fn_value;
*/
    CURSOR cCount IS
  SELECT COUNT(*) fn_count, SUM(FN_TIME) FN_MIN, fn_value FROM
   (
   SELECT TNAZAN.FK_ID, TNAZAN.FK_PACID, TNAZAN.FK_SMID, tmp_numbers.fn_value, FN_TIME
    FROM TNAZAN, TAMBULANCE, TSOTR, tmp_numbers, (SELECT FK_ID, ConvertTimeStrToMinutes(FC_TIME) FN_TIME
                     FROM TSMID
                     WHERE EXISTS (SELECT FK_ID
                                    FROM TSMID_RIGHTS
                                   WHERE FK_SOTRID = pFK_SOTRID
                                     AND FK_SMID = TSMID.FK_ID)
                      AND FL_SHOWANAL = 2
                    START WITH FK_ID = GET_ANALID
                  CONNECT BY PRIOR FK_ID = FK_OWNER) TSMID
    WHERE TSMID.FK_ID = TNAZAN.FK_SMID
      AND FK_NAZSOSID = GET_VIPNAZ
      AND FD_RUN BETWEEN TRUNC(pFD_DATE1) AND TRUNC(pFD_DATE2)+1-1/(24*60*60)
      AND TAMBULANCE.FK_ID = TNAZAN.FK_PACID
      AND TNAZAN.FK_VRACHID = TSOTR.FK_ID
      AND FK_OTDELID = tmp_numbers.fn_value
   UNION All
   SELECT TNAZAN.FK_ID, TNAZAN.FK_PACID, TNAZAN.FK_SMID, GET_REANIM(TNAZAN.FK_PACID, TNAZAN.FD_RUN, tmp_numbers.fn_value) fn_value, FN_TIME
    FROM TNAZAN, TKARTA, tmp_numbers, (SELECT FK_ID, ConvertTimeStrToMinutes(FC_TIME) FN_TIME
                     FROM TSMID
                     WHERE EXISTS (SELECT FK_ID
                                    FROM TSMID_RIGHTS
                                   WHERE FK_SOTRID = pFK_SOTRID
                                     AND FK_SMID = TSMID.FK_ID)
                      AND FL_SHOWANAL = 2
                    START WITH FK_ID = GET_ANALID
                  CONNECT BY PRIOR FK_ID = FK_OWNER) TSMID , TPERESEL, TROOM
    WHERE TSMID.FK_ID = TNAZAN.FK_SMID
      AND FK_NAZSOSID = GET_VIPNAZ
      AND FD_RUN BETWEEN TRUNC(pFD_DATE1) AND TRUNC(pFD_DATE2)+1-1/(24*60*60)
      AND TKARTA.FK_ID = TNAZAN.FK_PACID
      AND TROOM.FK_OTDELID = tmp_numbers.fn_value
      AND TROOM.FK_ID = TPERESEL.FK_PALATAID
      AND TPERESEL.FK_PACID = TKARTA.FK_ID
      AND ((TNAZAN.FD_RUN BETWEEN TPERESEL.FD_DATA1 AND TPERESEL.FD_DATA2)
           or (TPERESEL.FD_DATA1 <= TNAZAN.FD_RUN and TPERESEL.FK_ID = (select max(fk_id) from tperesel where fK_pacid = TKARTA.FK_ID))))
           group by fN_value;

    clTemp  CLOB;
    sHtml   LONG;
    nTemp   BINARY_INTEGER := 0;
    nTemp1  NUMBER := 0;
    nSum    BINARY_INTEGER := 0;
    nSum1   NUMBER := 0;
    nNum NUMBER;
    nValues   TNUMBERS;
    nValues1  TNUMBERS;
    nSmids   TNUMBERS;
    i NUMBER;
  begin
    DBMS_LOB.CREATETEMPORARY(clTemp, FALSE);
    sHtml := PKG_HTML.GET_HEAD('word','GetRepByGROUP2 "' ||PKG_SMINI.READSTRING('CONFIG','S_NAME','Не известен')||'"',
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
    sHtml := sHtml||'<P align=center><B>' || Login.get_sotr_otdelname(pFK_SOTRID) ||  '.</P>'||CHR(13);

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
         '  <TD>№</TD>'||CHR(13)||
         '  <TD>Подразделение</TD>'||CHR(13)||
         '  <TD>Кол-во, ед.</TD>'||CHR(13)||
         '  <TD>Общ. время, мин.</TD>'||CHR(13)||' </TR>'||CHR(13);
    DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);
    nNum := 0;
    i := 1;

    FOR c IN IsReanim LOOP
        if c.FN_COUNT > 0 then
           for p in cSTAC loop
             INSERT INTO tmp_numbers(FN_VALUE) VALUES (p.FK_ID);
             INSERT INTO tmp_numbers2(FN_VALUE) VALUES (p.FK_ID);
           end loop;
        END IF;
        EXIT;
    END LOOP;

    for k in cCount LOOP
       nValues(i) := k.fn_count;
       nValues1(i) := k.FN_MIN;
       nSmids(i) :=  k.fn_value;
       i := i + 1;
    end loop;
    DELETE FROM tmp_numbers WHERE FN_VALUE IN (SELECT FN_VALUE FROM tmp_numbers2);
/*
    for k in cCount LOOP
     --    create table asu.tttt (id NUMBER, FK_PACID NUMBER, FK_SMID NUMBER, fn_value NUMBER)
       sHtml := sHtml||'<P align=center>tmp_numbers2222222 - '||to_char(k.FN_COUNT) ||'</P><BR>'||CHR(13);
 --       INSERT INTO asu.tttt(id, FK_PACID, FK_SMID, fn_value ) VALUES (k.FK_ID, k.FK_ID, k.FK_SMID, k.fn_value );
 --       commit;
    end loop;
sHtml := sHtml||'<P align=center>tmp_numbers - '||to_char(nValues.count) ||'</P><BR>'||CHR(13);


   for k in (select * from tmp_numbers) LOOP
     sHtml := sHtml||'<P align=center>tmp_numbers - '||to_char(k.FN_VALUE) ||'</P><BR>'||CHR(13);
   end loop;
   DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);

DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);
    for k in cCount LOOP
     --    create table asu.tttt (id NUMBER, FK_PACID NUMBER, FK_SMID NUMBER, fn_value NUMBER)
        INSERT INTO asu.tttt(id, FK_PACID, FK_SMID, fn_value ) VALUES (k.FK_ID, k.FK_ID, k.FK_SMID, k.fn_value );
        commit;
  --    sHtml := sHtml||'<P align=center>cCount - '||to_char() ||'</P><BR>'||CHR(13);
    end loop;
 */
    for p in (SELECT * FROM TMP_NUMBERS) loop
 --     for n in cNames loop
 --       if p.FN_VALUE = n.FK_ID then
        nNum := nNum + 1;
                nTemp := 0;
        nTemp1 := 0;
        DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(' <TR>'||CHR(13)||'  <TD><P class=user>'||TO_CHAR(nNum)||'</P></TD>'||CHR(13)),' <TR>'||CHR(13)||'  <TD><P class=user>'||TO_CHAR(nNum)||'</P></TD>'||CHR(13));
        DBMS_LOB.WRITEAPPEND(clTemp, LENGTH('  <TD style=''text-align:left''><P class=user>'||LOGIN.GET_OTDELNAME(p.FN_VALUE)||'</P></TD>'||CHR(13)),'  <TD style=''text-align:left''><P class=user>'||LOGIN.GET_OTDELNAME(p.FN_VALUE)||'</P></TD>'||CHR(13));
        for k in 1..nValues.count loop

           if nSmids(k) = p.FN_VALUE then
            null;
             nTemp := nValues(k);
             nTemp1:= nValues1(k);
             exit;
           end if;
        end loop;

        if nTemp > 0 then
          nSum := nSum + nTemp;
        end if;
        if nTemp1 > 0 then
          nSum1 := nSum1 + nTemp1;
        end if;
        DBMS_LOB.WRITEAPPEND(clTemp, LENGTH('  <TD class=user><P class=user>'||PKG_R_ALLFUNC.RETURN_VALUE(nTemp)||'</P></TD>'||CHR(13)),'  <TD class=user><P class=user>'||PKG_R_ALLFUNC.RETURN_VALUE(nTemp)||'</P></TD>'||CHR(13));
        DBMS_LOB.WRITEAPPEND(clTemp, LENGTH('  <TD class=user><P class=user>'||PKG_R_ALLFUNC.RETURN_VALUE(nTemp1)||'</P></TD>'||CHR(13)||' </TR>'||CHR(13)),'  <TD class=user><P class=user>'||PKG_R_ALLFUNC.RETURN_VALUE(nTemp1)||'</P></TD>'||CHR(13)||' </TR>'||CHR(13));
 --       end if;
 --     end loop;
    end loop;

    sHtml := ' <TR>'||CHR(13)||'  <TD class=user colspan=2>ИТОГО:</TD>'||CHR(13);
    DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);
    DBMS_LOB.WRITEAPPEND(clTemp, LENGTH('  <TD class=user>'||TO_CHAR(nSum)||'</TD>'||CHR(13)),'  <TD class=user>'||TO_CHAR(nSum)||'</TD>'||CHR(13));
    DBMS_LOB.WRITEAPPEND(clTemp, LENGTH('  <TD class=user>'||TO_CHAR(nSum1)||'</TD>'||CHR(13)||' </TR>'||CHR(13)),'  <TD class=user>'||TO_CHAR(nSum1)||'</TD>'||CHR(13)||' </TR>'||CHR(13));

    sHtml := '</TABLE>'||CHR(13)||'<BR><P><B>Отчет составил: _________________________'||LOGIN.GET_SOTRNAME(pFK_SOTRID)||'</B></P>'||CHR(13)||'</DIV></BODY></HTML>';
    DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);
    RETURN clTemp;
  end;
/*********************************************************************************************************************/
/*********************************************************************************************************************/
/*********************************************************************************************************************/
  FUNCTION GetRepByGROUP3(pFK_SOTRID IN BINARY_INTEGER, p1 IN TNUMBERS, p2 IN TNUMBERS, pFD_DATE1 IN DATE DEFAULT NULL, pFD_DATE2 IN DATE DEFAULT NULL)
    RETURN CLOB IS
  CURSOR cNames IS
    SELECT pFK_SOTRID FK_ID, TO_NUMBER(NULL) FK_OWNER, 'Группы' FC_NAME, 0 FL_DEL, 0 FL_CHECK
      FROM DUAL
    UNION
    SELECT ROWNUM FK_ID, pFK_SOTRID FK_OWNER, FC_REMARK FC_NAME, 0 FL_DEL, 0 FL_CHECK
      FROM(SELECT DISTINCT FC_REMARK
             FROM TSMID
            WHERE EXISTS (SELECT FK_ID
                            FROM TSMID_RIGHTS
                           WHERE FK_SOTRID = pFK_SOTRID
                             AND FK_SMID = TSMID.FK_ID)
              AND FL_SHOWANAL = 2
              AND FC_REMARK IS NOT NULL
            START WITH FK_ID = GET_ANALID
          CONNECT BY PRIOR FK_ID = FK_OWNER);
  CURSOR cCountAll(p1 IN BINARY_INTEGER, p2 IN VARCHAR2) IS
    SELECT /*+ rule*/COUNT(FK_SMID)--, SUM(FN_TIME)
      FROM TNAZAN,(SELECT FK_ID--, ConvertTimeStrToMinutes(FC_TIME) FN_TIME
                     FROM TSMID
                    WHERE EXISTS (SELECT FK_ID
                                    FROM TSMID_RIGHTS
                                   WHERE FK_SOTRID = pFK_SOTRID
                                     AND FK_SMID = TSMID.FK_ID)
                      AND FC_REMARK = p2
                      AND FL_SHOWANAL = 2
                    START WITH FK_ID = GET_ANALID
                  CONNECT BY PRIOR FK_ID = FK_OWNER) TSMID
    WHERE FK_SMID = TSMID.FK_ID
      AND FK_NAZSOSID = GET_VIPNAZ
      AND EXISTS (SELECT FK_ID
                    FROM TSOTR
                   WHERE FK_OTDELID IN
                         (SELECT FK_ID
                            FROM TOTDEL
                           START WITH FK_ID = p1
                         CONNECT BY PRIOR FK_ID = FK_OWNERID)
                     AND FK_VRACHID = TSOTR.FK_ID);
  CURSOR cCount(p1 IN BINARY_INTEGER, p2 IN VARCHAR2) IS
    SELECT /*+ rule*/COUNT(FK_SMID)--, SUM(FN_TIME)
      FROM TNAZAN,(SELECT FK_ID--, ConvertTimeStrToMinutes(FC_TIME) FN_TIME
                     FROM TSMID
                    WHERE EXISTS (SELECT FK_ID
                                    FROM TSMID_RIGHTS
                                   WHERE FK_SOTRID = pFK_SOTRID
                                     AND FK_SMID = TSMID.FK_ID)
                      AND FC_REMARK = p2
                      AND FL_SHOWANAL = 2
                    START WITH FK_ID = GET_ANALID
                  CONNECT BY PRIOR FK_ID = FK_OWNER) TSMID
    WHERE FK_SMID = TSMID.FK_ID
      AND FK_NAZSOSID = GET_VIPNAZ
      AND FD_RUN BETWEEN TRUNC(pFD_DATE1) AND TRUNC(pFD_DATE2)+1-1/(24*60*60)
      AND EXISTS (SELECT FK_ID
                    FROM TSOTR
                   WHERE FK_OTDELID IN
                         (SELECT FK_ID
                            FROM TOTDEL
                           START WITH FK_ID = p1
                         CONNECT BY PRIOR FK_ID = FK_OWNERID)
                     AND FK_VRACHID = TSOTR.FK_ID);

    clTemp  CLOB;
    sHtml   LONG;
    nTemp   BINARY_INTEGER := 0;
    --nTemp1  NUMBER := 0;
    nSum    BINARY_INTEGER := 0;
    nSum1   TNUMBERS;
    nNum NUMBER;
  begin
    DBMS_LOB.CREATETEMPORARY(clTemp, FALSE);
    sHtml := PKG_HTML.GET_HEAD('word','GetRepByGROUP3 "' ||PKG_SMINI.READSTRING('CONFIG','S_NAME','Не известен')||'"',
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
    sHtml := sHtml||'<P align=center><B>' || Login.get_sotr_otdelname(pFK_SOTRID) ||  '.</P>'||CHR(13);

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
         '  <TD>№</TD>'||CHR(13)||
         '  <TD>Подразделение\Группа</TD>'||CHR(13);
    for p in 1..p1.COUNT loop
      for k in cNames loop
        if p1(p) = k.FK_ID then
          sHtml := sHtml || '  <TD class=v>'||k.FC_NAME||'</TD>'||CHR(13);
          nSum1(p) := 0;
        end if;
      end loop;
    end loop;
    sHtml := sHtml || '  <TD class=v>Всего</TD>'||CHR(13)||' </TR>'||CHR(13);
    DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);
    nNum := 0;
    for p in 1..p2.COUNT loop
    --begin
      nNum := nNum + 1;
      sHtml := ' <TR>'||CHR(13)||'  <TD><P class=user>'||/*p2(p)*/ nNum||'</P></TD>'||CHR(13)||'  <TD style=''text-align:left''><P class=user>'||LOGIN.GET_OTDELNAME(p2(p))||'</P></TD>'||CHR(13);
      nSum := 0;

      for n in 1..p1.COUNT loop
        for k in cNames loop
          if p1(n) = k.FK_ID then
            if pFD_DATE1 is null or pFD_DATE2 is null then
              open cCountAll(p2(p),k.FC_NAME);
              fetch cCountAll into nTemp;--, nTemp1;
              close cCountAll;
            else
              open cCount(p2(p),k.FC_NAME);
              fetch cCount into nTemp;--, nTemp1;
              close cCount;
            end if;
            nSum := nSum + nTemp;
            nSum1(n) := nSum1(n) + nTemp;
            sHtml := sHtml ||'  <TD class=user><P class=user>'|| PKG_R_ALLFUNC.RETURN_VALUE(nTemp) ||'</P></TD>'||CHR(13);
          end if;
        end loop;
      end loop;
      sHtml := sHtml ||'  <TD class=user><P class=user>'|| PKG_R_ALLFUNC.RETURN_VALUE(nSum) ||'</P></TD>'||CHR(13);
      sHtml := sHtml ||' </TR>'||CHR(13);
      DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);
      /*for k in 0..p2.COUNT loop
        begin
          sHtml := CHR(13)||p2(k)||CHR(13);
          DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);
        exception
          when no_data_found then null;--exit;
        end;
      end loop;*/
    --exception
      --when no_data_found then null;--exit;
    --end;
    end loop;

    nSum := 0;
    sHtml := ' <TR>'||CHR(13)||'  <TD class=user colspan=2>ИТОГО:</TD>'||CHR(13);
    for n in 1..p1.COUNT loop
      sHtml := sHtml ||'  <TD class=user>'|| TO_CHAR(nSum1(n)) ||'</TD>'||CHR(13);
      nSum:=nSum + nSum1(n);
    end loop;
    sHtml := sHtml ||'  <TD class=user>'|| TO_CHAR(nSum) ||'</TD>'||CHR(13)||'</TR>'||CHR(13);
    DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);

    sHtml := '</TABLE>'||CHR(13)||'<BR><P><B>Отчет составил: _________________________'||LOGIN.GET_SOTRNAME(pFK_SOTRID)||'</B></P>'||CHR(13)||'</DIV></BODY></HTML>';
    DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);
    RETURN clTemp;
  end;



/*********************************************************************************************************************/
/*********************************************************************************************************************/
/*********************************************************************************************************************/
  FUNCTION GetRepByGROUP4(pFK_SOTRID IN BINARY_INTEGER, p1 IN TNUMBERS, p2 IN TNUMBERS, p3 IN NUMBER, p4 IN NUMBER, isTotalPatient IN INTEGER default 0, nCountColHead IN INTEGER DEFAULT OTDEL_COUNT_HEAD, pFD_DATE1 IN DATE DEFAULT NULL, pFD_DATE2 IN DATE DEFAULT NULL)
    RETURN CLOB IS

  CURSOR IsReanim IS SELECT COUNT(*) FN_COUNT FROM ASU.tmp_numbers WHERE FN_VALUE IN (get_reanimotdel, Get_Oarotdel);
  CURSOR cSTAC IS (select FK_ID from login.totdel WHERE FK_ID NOT IN (SELECT FN_VALUE FROM ASU.tmp_numbers) start with fk_id = 21466 connect by prior fk_id = fk_ownerid );

  CURSOR cNazanType(p3 IN NUMBER) IS
   SELECT FC_NAME FROM (
                  SELECT FK_ID, FC_NAME FROM TSMID
                    WHERE FK_OWNER IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = 'NAZN_TYPES')
                      AND FL_SHOWPRINT = 1
                  UNION
                  SELECT 0, 'Все' FROM DUAL
                  )
   WHERE FK_ID = p3;

   CURSOR cPacType(p4 IN NUMBER) IS
   SELECT FC_NAME FROM
   (
     SELECT 0 FK_ID, 'Амбулаторные' FC_NAME FROM DUAL
     UNION
     SELECT 1 FK_ID, 'Стационарные' FC_NAME FROM DUAL
     UNION
     SELECT 2 FK_ID, 'Все' FC_NAME FROM DUAL
   )
   WHERE FK_ID = p4;






   CURSOR cCountPatientAll IS
   SELECT  TRESAN.FK_ID, TNAZAN.FK_PACID, TRESAN.FK_SMID, tmp_numbers.fn_value
    FROM TNAZAN, TAMBULANCE, TSOTR, tmp_numbers, tmp_numbers2, TRESAN, (SELECT FK_ID FROM TSMID
                                     WHERE FK_OWNER IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = 'NAZN_TYPES')
                                           AND FL_SHOWPRINT = 1
                                           and (case when fk_id = p3 and p3 > 0 then 1 when p3 = 0 then 1 else 0 end) = 1) TTYPE
    WHERE TRESAN.FK_SMID  = tmp_numbers2.fn_value
      AND TRESAN.FK_NAZID =  TNAZAN.FK_ID
      AND TNAZAN.FK_NAZTYPEID = TTYPE.FK_ID
      AND FK_NAZSOSID = GET_VIPNAZ
      AND (TRESAN.FC_RES IS NOT NULL OR TRESAN.FK_BLOBID IS NOT NULL OR TRESAN.FN_RES IS NOT NULL)
      AND FD_RUN BETWEEN TRUNC(pFD_DATE1) AND TRUNC(pFD_DATE2)+1-1/(24*60*60)
      AND TAMBULANCE.FK_ID = TNAZAN.FK_PACID
      AND TNAZAN.FK_VRACHID = TSOTR.FK_ID
      AND FK_OTDELID = tmp_numbers.fn_value
   UNION all
   SELECT TRESAN.FK_ID, TNAZAN.FK_PACID, TRESAN.FK_SMID, GET_REANIM(TNAZAN.FK_PACID, TNAZAN.FD_RUN, tmp_numbers.fn_value) fn_value
    FROM TNAZAN, TKARTA, tmp_numbers2, tmp_numbers, TRESAN, (SELECT FK_ID FROM TSMID
                                        WHERE FK_OWNER IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = 'NAZN_TYPES')
                                           AND FL_SHOWPRINT = 1
                                           and (case when fk_id = p3 and p3 > 0 then 1 when p3 = 0 then 1 else 0 end) = 1) TTYPE
    WHERE TRESAN.FK_SMID  = tmp_numbers2.fn_value
      AND TRESAN.FK_NAZID =  TNAZAN.FK_ID
      AND TNAZAN.FK_NAZTYPEID = TTYPE.FK_ID
      AND FK_NAZSOSID = GET_VIPNAZ
      AND (TRESAN.FC_RES IS NOT NULL OR TRESAN.FK_BLOBID IS NOT NULL OR TRESAN.FN_RES IS NOT NULL)
      AND FD_RUN BETWEEN TRUNC(pFD_DATE1) AND TRUNC(pFD_DATE2)+1-1/(24*60*60)
      AND TKARTA.FK_ID = TNAZAN.FK_PACID
      AND  EXISTS (SELECT FK_PACID
                   FROM TPERESEL, TROOM
                   WHERE TROOM.FK_OTDELID = tmp_numbers.fn_value
                         AND TROOM.FK_ID = TPERESEL.FK_PALATAID
                         AND TPERESEL.FK_ID = (SELECT MAX(TPERESEL.FK_ID)
                                               FROM TPERESEL
                                               WHERE FK_PACID = TKARTA.FK_ID
                                                     AND TPERESEL.FD_DATA1 <= TNAZAN.FD_RUN));


  CURSOR cCountAll IS
       SELECT COUNT(*) fn_count, FK_SMID, fn_value FROM
   (
   SELECT tresan.FK_ID, TNAZAN.FK_PACID, tresan.FK_SMID, tmp_numbers.fn_value
    FROM TNAZAN, TAMBULANCE, TSOTR, tmp_numbers, tmp_numbers2, tresan,(SELECT FK_ID FROM TSMID
                                     WHERE FK_OWNER IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = 'NAZN_TYPES')
                                           AND FL_SHOWPRINT = 1
                                           and (case when fk_id = p3 and p3 > 0 then 1 when p3 = 0 then 1 else 0 end) = 1) TTYPE
    WHERE tresan.FK_SMID = tmp_numbers2.fn_value
      AND tresan.FK_NAZID = TNAZAN.FK_ID
      AND TNAZAN.FK_NAZTYPEID = TTYPE.FK_ID
      AND (TRESAN.FC_RES IS NOT NULL OR TRESAN.FK_BLOBID IS NOT NULL OR TRESAN.FN_RES IS NOT NULL)
      AND FK_NAZSOSID = GET_VIPNAZ
      AND FD_RUN BETWEEN TRUNC(pFD_DATE1) AND TRUNC(pFD_DATE2)+1-1/(24*60*60)
      AND TAMBULANCE.FK_ID = TNAZAN.FK_PACID
      AND TNAZAN.FK_VRACHID = TSOTR.FK_ID
      AND FK_OTDELID = tmp_numbers.fn_value
   UNION all
   SELECT tresan.FK_ID, TNAZAN.FK_PACID, tresan.FK_SMID, GET_REANIM(TNAZAN.FK_PACID, TNAZAN.FD_RUN, tmp_numbers.fn_value) fn_value
    FROM TNAZAN, TKARTA, tmp_numbers2, tmp_numbers, tresan, (SELECT FK_ID FROM TSMID
                                     WHERE FK_OWNER IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = 'NAZN_TYPES')
                                           AND FL_SHOWPRINT = 1
                                           and (case when fk_id = p3 and p3 > 0 then 1 when p3 = 0 then 1 else 0 end) = 1) TTYPE
    WHERE tresan.FK_SMID = tmp_numbers2.fn_value
      AND tresan.FK_NAZID = TNAZAN.FK_ID
      AND TNAZAN.FK_NAZTYPEID = TTYPE.FK_ID
      AND FK_NAZSOSID = GET_VIPNAZ
      AND (TRESAN.FC_RES IS NOT NULL OR TRESAN.FK_BLOBID IS NOT NULL OR TRESAN.FN_RES IS NOT NULL)
      AND FD_RUN BETWEEN TRUNC(pFD_DATE1) AND TRUNC(pFD_DATE2)+1-1/(24*60*60)
      AND TKARTA.FK_ID = TNAZAN.FK_PACID
      AND  EXISTS (SELECT FK_PACID
                   FROM TPERESEL, TROOM
                   WHERE TROOM.FK_OTDELID = tmp_numbers.fn_value
                         AND TROOM.FK_ID = TPERESEL.FK_PALATAID
                         AND TPERESEL.FK_ID = (SELECT MAX(TPERESEL.FK_ID)
                                               FROM TPERESEL
                                               WHERE FK_PACID = TKARTA.FK_ID
                                                     AND TPERESEL.FD_DATA1 <= TNAZAN.FD_RUN))
    ) group by FK_SMID, fn_value;
/*   SELECT COUNT(*) fn_count, FK_SMID, fn_value FROM
   (
   SELECT tresan.FK_ID, TNAZAN.FK_PACID, tresan.FK_SMID, tmp_numbers.fn_value
    FROM TNAZAN, TAMBULANCE, TSOTR, tmp_numbers, tmp_numbers2, tresan,(SELECT FK_ID FROM TSMID
                                     WHERE FK_OWNER IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = 'NAZN_TYPES')
                                           AND FL_SHOWPRINT = 1
                                           and (case when fk_id = p3 and p3 > 0 then 1 when p3 = 0 then 1 else 0 end) = 1) TTYPE
    WHERE tresan.FK_SMID = tmp_numbers2.fn_value
      AND tresan.FK_NAZID = TNAZAN.FK_ID
      AND TNAZAN.FK_NAZTYPEID = TTYPE.FK_ID
  --    AND (TRESAN.FC_RES IS NOT NULL OR TRESAN.FK_BLOBID IS NOT NULL OR TRESAN.FN_RES IS NOT NULL)
      AND FK_NAZSOSID = GET_VIPNAZ
   --   AND FD_RUN BETWEEN TRUNC(pFD_DATE1) AND TRUNC(pFD_DATE2)+1-1/(24*60*60)
      AND FD_RUN BETWEEN TRUNC(to_date('04.08.2009', 'dd.mm.yyyy')) AND TRUNC(to_date('07.08.2009', 'dd.mm.yyyy'))+1-1/(24*60*60)
      AND TAMBULANCE.FK_ID = TNAZAN.FK_PACID
      AND TNAZAN.FK_VRACHID = TSOTR.FK_ID
      AND FK_OTDELID = tmp_numbers.fn_value
   UNION all
   SELECT tresan.FK_ID, TNAZAN.FK_PACID, tresan.FK_SMID, tmp_numbers.fn_value
    FROM TNAZAN, TKARTA, tmp_numbers2, tmp_numbers, tresan, (SELECT FK_ID FROM TSMID
                                     WHERE FK_OWNER IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = 'NAZN_TYPES')
                                           AND FL_SHOWPRINT = 1
                                           and (case when fk_id = p3 and p3 > 0 then 1 when p3 = 0 then 1 else 0 end) = 1) TTYPE
    WHERE tresan.FK_SMID = tmp_numbers2.fn_value
      AND tresan.FK_NAZID = TNAZAN.FK_ID
      AND TNAZAN.FK_NAZTYPEID = TTYPE.FK_ID
      AND FK_NAZSOSID = GET_VIPNAZ
    --  AND (TRESAN.FC_RES IS NOT NULL OR TRESAN.FK_BLOBID IS NOT NULL OR TRESAN.FN_RES IS NOT NULL)
      AND FD_RUN BETWEEN TRUNC(to_date('04.08.2009', 'dd.mm.yyyy')) AND TRUNC(to_date('07.08.2009', 'dd.mm.yyyy'))+1-1/(24*60*60)
  --    AND FD_RUN BETWEEN TRUNC(pFD_DATE1) AND TRUNC(pFD_DATE2)+1-1/(24*60*60)
      AND TKARTA.FK_ID = TNAZAN.FK_PACID
      AND  EXISTS (SELECT FK_PACID
                   FROM TPERESEL, TROOM
                   WHERE TROOM.FK_OTDELID = tmp_numbers.fn_value
                         AND TROOM.FK_ID = TPERESEL.FK_PALATAID
                         AND TPERESEL.FK_ID = (SELECT MAX(TPERESEL.FK_ID)
                                               FROM TPERESEL, TDOCOBSL
                                               WHERE FK_PACID = TKARTA.FK_ID
                                                     AND TPERESEL.FD_DATA1 <= TNAZAN.FD_RUN))
   ) group by FK_SMID, fn_value;
*/
--******************************************************************************
   CURSOR cCountPatient IS
  SELECT COUNT(*) fn_count, FK_SMID, fn_value, FK_PACID FROM
   (
   SELECT tresan.FK_ID, TNAZAN.FK_PACID, tresan.FK_SMID, tmp_numbers.fn_value
    FROM TNAZAN, TSOTR, tmp_numbers, tmp_numbers2, tresan, (SELECT FK_ID FROM TSMID
                                     WHERE FK_OWNER IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = 'NAZN_TYPES')
                                           AND FL_SHOWPRINT = 1
                                           and (case when fk_id = p3 and p3 > 0 then 1 when p3 = 0 then 1 else 0 end) = 1) TTYPE,
                                           TAMBULANCE
     WHERE tresan.FK_SMID = tmp_numbers2.fn_value
      AND TNAZAN.FK_ID = tresan.FK_NAZID
      AND FK_NAZSOSID = GET_VIPNAZ
      AND FD_RUN BETWEEN TRUNC(pFD_DATE1) AND TRUNC(pFD_DATE2)+1-1/(24*60*60)
      AND TNAZAN.FK_NAZTYPEID = TTYPE.FK_ID
      AND TSOTR.FK_ID = TNAZAN.FK_VRACHID
      AND FK_OTDELID = tmp_numbers.fn_value
      AND TNAZAN.FK_PACID = TAMBULANCE.FK_ID
      AND (TRESAN.FC_RES IS NOT NULL OR TRESAN.FK_BLOBID IS NOT NULL OR TRESAN.FN_RES IS NOT NULL)
      AND (CASE WHEN p4 = 0 THEN 1 WHEN p4 = 2 THEN 1 ELSE 0 END) = 1
   UNION
   SELECT tresan.FK_ID, TNAZAN.FK_PACID, tresan.FK_SMID, GET_REANIM(TNAZAN.FK_PACID, TNAZAN.FD_RUN, tmp_numbers.fn_value) fn_value
    FROM TNAZAN, TKARTA, tmp_numbers2, tmp_numbers, tresan, TPERESEL, TROOM, TDOCOBSL, (SELECT FK_ID FROM TSMID
                                     WHERE FK_OWNER IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = 'NAZN_TYPES')
                                           AND FL_SHOWPRINT = 1
                                           and (case when fk_id = p3 and p3 > 0 then 1 when p3 = 0 then 1 else 0 end) = 1) TTYPE
    WHERE (CASE WHEN p4 = 0 THEN 1 WHEN p4 = 2 THEN 1 ELSE 0 END) = 1
      and tresan.FK_SMID = tmp_numbers2.fn_value
      AND TNAZAN.FK_ID = tresan.FK_NAZID
      AND FK_NAZSOSID = GET_VIPNAZ
      AND FD_RUN BETWEEN TRUNC(pFD_DATE1) AND TRUNC(pFD_DATE2)+1-1/(24*60*60)
      AND TKARTA.FK_ID = TNAZAN.FK_PACID
      AND TNAZAN.FK_NAZTYPEID = TTYPE.FK_ID
      AND TROOM.FK_OTDELID = tmp_numbers.fn_value
      AND TROOM.FK_ID = TPERESEL.FK_PALATAID
      AND TPERESEL.FK_PACID = TKARTA.FK_ID
      AND (TRESAN.FC_RES IS NOT NULL OR TRESAN.FK_BLOBID IS NOT NULL OR TRESAN.FN_RES IS NOT NULL)
      AND ((TNAZAN.FD_RUN BETWEEN TPERESEL.FD_DATA1 AND TPERESEL.FD_DATA2)
           or (TPERESEL.FD_DATA1 <= TNAZAN.FD_RUN and TPERESEL.FK_ID = (select max(fk_id) from tperesel where fK_pacid = TKARTA.FK_ID)))
      AND TPERESEL.FK_DOCOBSLID = TDOCOBSL.FK_ID
      AND TDOCOBSL.FK_VIDDOCID  IN (SELECT FK_ID
                                       FROM TUSLVID
                                       START WITH FK_ID IN (SELECT FN_CONST
                                                            FROM TCONST
                                                            WHERE FC_FUNC = 'DOC_IBDS_STAC' OR FC_FUNC = 'DOC_IB_DS')
                                       CONNECT BY PRIOR FK_ID = FK_OWNERID)
   UNION
   SELECT tresan.FK_ID, TNAZAN.FK_PACID, tresan.FK_SMID, GET_REANIM(TNAZAN.FK_PACID, TNAZAN.FD_RUN, tmp_numbers.fn_value) fn_value
    FROM TNAZAN, TKARTA, tmp_numbers2,  tmp_numbers, tresan, TPERESEL, TROOM, TDOCOBSL, (SELECT FK_ID FROM TSMID
                           WHERE FK_OWNER IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = 'NAZN_TYPES')
                                 AND FL_SHOWPRINT = 1
                                 and (case when fk_id = p3 and p3 > 0 then 1 when p3 = 0 then 1 else 0 end) = 1) TTYPE
     WHERE (CASE WHEN p4 = 1 THEN 1 WHEN p4 = 2 THEN 1 ELSE 0 END) = 1
      AND  tresan.FK_SMID = tmp_numbers2.fn_value
      AND  TNAZAN.FK_ID = tresan.FK_NAZID
      AND  FK_NAZSOSID = GET_VIPNAZ
      AND FD_RUN BETWEEN TRUNC(pFD_DATE1) AND TRUNC(pFD_DATE2)+1-1/(24*60*60)
      AND TKARTA.FK_ID = TNAZAN.FK_PACID
      AND TNAZAN.FK_NAZTYPEID = TTYPE.FK_ID
      AND TROOM.FK_OTDELID = tmp_numbers.fn_value
      AND TROOM.FK_ID = TPERESEL.FK_PALATAID
      AND TPERESEL.FK_PACID = TKARTA.FK_ID
      AND (TRESAN.FC_RES IS NOT NULL OR TRESAN.FK_BLOBID IS NOT NULL OR TRESAN.FN_RES IS NOT NULL)
      AND ((TNAZAN.FD_RUN BETWEEN TPERESEL.FD_DATA1 AND TPERESEL.FD_DATA2)
           or (TPERESEL.FD_DATA1 <= TNAZAN.FD_RUN and TPERESEL.FK_ID = (select max(fk_id) from tperesel where fK_pacid = TKARTA.FK_ID)))
      AND TPERESEL.FK_DOCOBSLID = TDOCOBSL.FK_ID
      AND TDOCOBSL.FK_VIDDOCID not IN (SELECT FK_ID
                                       FROM TUSLVID
                                       START WITH FK_ID IN (SELECT FN_CONST
                                                            FROM TCONST
                                                            WHERE FC_FUNC = 'DOC_IBDS_STAC' OR FC_FUNC = 'DOC_IB_DS')
                                       CONNECT BY PRIOR FK_ID = FK_OWNERID)
  ) group by FK_SMID, fn_value, FK_PACID;

  CURSOR cCount IS
   SELECT COUNT(*) fn_count, FK_SMID, fn_value FROM
   (
   SELECT tresan.FK_ID, TNAZAN.FK_PACID, tresan.FK_SMID, tmp_numbers.fn_value
    FROM TNAZAN, TSOTR, tmp_numbers, tmp_numbers2, tresan, (SELECT FK_ID FROM TSMID
                                     WHERE FK_OWNER IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = 'NAZN_TYPES')
                                           AND FL_SHOWPRINT = 1
                                           and (case when fk_id = p3 and p3 > 0 then 1 when p3 = 0 then 1 else 0 end) = 1) TTYPE,
                                           TAMBULANCE
     WHERE tresan.FK_SMID = tmp_numbers2.fn_value
      AND TNAZAN.FK_ID = tresan.FK_NAZID
      AND FK_NAZSOSID = GET_VIPNAZ
      AND FD_RUN BETWEEN TRUNC(pFD_DATE1) AND TRUNC(pFD_DATE2)+1-1/(24*60*60)
      AND TNAZAN.FK_NAZTYPEID = TTYPE.FK_ID
      AND TSOTR.FK_ID = TNAZAN.FK_VRACHID
      AND FK_OTDELID = tmp_numbers.fn_value
      AND TNAZAN.FK_PACID = TAMBULANCE.FK_ID
      AND (TRESAN.FC_RES IS NOT NULL OR TRESAN.FK_BLOBID IS NOT NULL OR TRESAN.FN_RES IS NOT NULL)
      AND (CASE WHEN p4 = 0 THEN 1 WHEN p4 = 2 THEN 1 ELSE 0 END) = 1
   UNION
   SELECT tresan.FK_ID, TNAZAN.FK_PACID, tresan.FK_SMID, GET_REANIM(TNAZAN.FK_PACID, TNAZAN.FD_RUN, tmp_numbers.fn_value) fn_value
    FROM TNAZAN, TKARTA, tmp_numbers2, tmp_numbers, tresan, TPERESEL, TROOM, TDOCOBSL, (SELECT FK_ID FROM TSMID
                                     WHERE FK_OWNER IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = 'NAZN_TYPES')
                                           AND FL_SHOWPRINT = 1
                                           and (case when fk_id = p3 and p3 > 0 then 1 when p3 = 0 then 1 else 0 end) = 1) TTYPE
    WHERE (CASE WHEN p4 = 0 THEN 1 WHEN p4 = 2 THEN 1 ELSE 0 END) = 1
      and tresan.FK_SMID = tmp_numbers2.fn_value
      AND TNAZAN.FK_ID = tresan.FK_NAZID
      AND FK_NAZSOSID = GET_VIPNAZ
      AND FD_RUN BETWEEN TRUNC(pFD_DATE1) AND TRUNC(pFD_DATE2)+1-1/(24*60*60)
      AND TKARTA.FK_ID = TNAZAN.FK_PACID
      AND TNAZAN.FK_NAZTYPEID = TTYPE.FK_ID
      AND TROOM.FK_OTDELID = tmp_numbers.fn_value
      AND TROOM.FK_ID = TPERESEL.FK_PALATAID
      AND TPERESEL.FK_PACID = TKARTA.FK_ID
      AND (TRESAN.FC_RES IS NOT NULL OR TRESAN.FK_BLOBID IS NOT NULL OR TRESAN.FN_RES IS NOT NULL)
      AND ((TNAZAN.FD_RUN BETWEEN TPERESEL.FD_DATA1 AND TPERESEL.FD_DATA2)
           or (TPERESEL.FD_DATA1 <= TNAZAN.FD_RUN and TPERESEL.FK_ID = (select max(fk_id) from tperesel where fK_pacid = TKARTA.FK_ID)))
      AND TPERESEL.FK_DOCOBSLID = TDOCOBSL.FK_ID
      AND TDOCOBSL.FK_VIDDOCID  IN (SELECT FK_ID
                                       FROM TUSLVID
                                       START WITH FK_ID IN (SELECT FN_CONST
                                                            FROM TCONST
                                                            WHERE FC_FUNC = 'DOC_IBDS_STAC' OR FC_FUNC = 'DOC_IB_DS')
                                       CONNECT BY PRIOR FK_ID = FK_OWNERID)
   UNION
   SELECT tresan.FK_ID, TNAZAN.FK_PACID, tresan.FK_SMID, GET_REANIM(TNAZAN.FK_PACID, TNAZAN.FD_RUN, tmp_numbers.fn_value) fn_value
    FROM TNAZAN, TKARTA, tmp_numbers2,  tmp_numbers, tresan, TPERESEL, TROOM, TDOCOBSL, (SELECT FK_ID FROM TSMID
                           WHERE FK_OWNER IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = 'NAZN_TYPES')
                                 AND FL_SHOWPRINT = 1
                                 and (case when fk_id = p3 and p3 > 0 then 1 when p3 = 0 then 1 else 0 end) = 1) TTYPE
     WHERE (CASE WHEN p4 = 1 THEN 1 WHEN p4 = 2 THEN 1 ELSE 0 END) = 1
      AND  tresan.FK_SMID = tmp_numbers2.fn_value
      AND  TNAZAN.FK_ID = tresan.FK_NAZID
      AND  FK_NAZSOSID = GET_VIPNAZ
      AND FD_RUN BETWEEN TRUNC(pFD_DATE1) AND TRUNC(pFD_DATE2)+1-1/(24*60*60)
      AND TKARTA.FK_ID = TNAZAN.FK_PACID
      AND TNAZAN.FK_NAZTYPEID = TTYPE.FK_ID
      AND TROOM.FK_OTDELID = tmp_numbers.fn_value
      AND TROOM.FK_ID = TPERESEL.FK_PALATAID
      AND TPERESEL.FK_PACID = TKARTA.FK_ID
      AND (TRESAN.FC_RES IS NOT NULL OR TRESAN.FK_BLOBID IS NOT NULL OR TRESAN.FN_RES IS NOT NULL)
      AND ((TNAZAN.FD_RUN BETWEEN TPERESEL.FD_DATA1 AND TPERESEL.FD_DATA2)
           or (TPERESEL.FD_DATA1 <= TNAZAN.FD_RUN and TPERESEL.FK_ID = (select max(fk_id) from tperesel where fK_pacid = TKARTA.FK_ID)))
      AND TPERESEL.FK_DOCOBSLID = TDOCOBSL.FK_ID
      AND TDOCOBSL.FK_VIDDOCID NOT IN (SELECT FK_ID
                                       FROM TUSLVID
                                       START WITH FK_ID IN (SELECT FN_CONST
                                                            FROM TCONST
                                                            WHERE FC_FUNC = 'DOC_IBDS_STAC' OR FC_FUNC = 'DOC_IB_DS')
                                       CONNECT BY PRIOR FK_ID = FK_OWNERID)
  ) group by FK_SMID, fn_value;

    clTemp  CLOB;
    sHtml   LONG;
    nTemp   BINARY_INTEGER := 0;
    nTSum   BINARY_INTEGER := 0;
    nSum    TNUMBERS;
    nSum1   TNUMBERS;
    nValues   TNUMBERS;
    nSmids   TNUMBERS;
    nOtdels   TNUMBERS;
    nPacIds TNUMBERS;
    nCountTestByOtdel TARRAYS;
    --nSum2   TNUMBERS;
    sTemp VARCHAR (50);
    nNum NUMBER := 0;
    sNazanType Varchar2(50);
    sPacType Varchar2(50);
    nCountPeople Number;
    nCountOtdel Number := nCountColHead;
    nStartOtdel Number := 1;
    bEmptyRow Boolean;
    i NUMBER;
    isResult BOOLEAN;
    TempP Number;
    TempN Number;
  begin
    DBMS_LOB.CREATETEMPORARY(clTemp, FALSE);
   sHtml := PKG_HTML.GET_HEAD('word','GetRepByGROUP3 "' ||PKG_SMINI.READSTRING('CONFIG','S_NAME','Не известен')||'"',
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
    sHtml := sHtml||'<P align=center><B>' || Login.get_sotr_otdelname(pFK_SOTRID) ||  '.</P>'||CHR(13);

    if pFD_DATE1 = pFD_DATE2 then
      sHtml := sHtml||'<P align=center><B>Отчет о количестве выполненных исследований<BR>за '||TO_CHAR(pFD_DATE1,'dd.mm.yyyy')||'</P>'||CHR(13);
    else
      sHtml := sHtml||'<P align=center><B>Отчет о количестве выполненных исследований<BR>за период с '||TO_CHAR(pFD_DATE1,'dd.mm.yyyy')||' по '||TO_CHAR(pFD_DATE2,'dd.mm.yyyy')||'</P>'||CHR(13);
    end if;

    if (p2.COUNT <= nCountOtdel) then
      nCountOtdel := p2.COUNT;
    end if;

    for p in 1..p2.COUNT loop
     nSum1(p) := 0;
    end loop;

    OPEN cNazanType(p3);
    FETCH cNazanType INTO sNazanType;
    CLOSE cNazanType;
      sHtml := sHtml||'<P align=center>Тип назначения - '||sNazanType||'</P>'||CHR(13);

    OPEN cPacType(p4);
    FETCH cPacType INTO sPacType;
    CLOSE cPacType;
      sHtml := sHtml||'<P align=center>Пациенты - '||sPacType||'</P><BR>'||CHR(13);

    DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);

    delete from tmp_numbers2;
    delete from tmp_numbers;

    for p in 1..p1.COUNT loop
        INSERT INTO tmp_numbers2(FN_VALUE) VALUES (p1(p));
    END LOOP;
    for p in 1..p2.COUNT loop
        INSERT INTO tmp_numbers(FN_VALUE) VALUES (p2(p));
    END LOOP;

    FOR c IN IsReanim LOOP
        if c.FN_COUNT > 0 then
           for p in cSTAC loop
             INSERT INTO tmp_numbers(FN_VALUE) VALUES (p.FK_ID);
           end loop;
        END IF;
        EXIT;
    END LOOP;


    i := 1;
/*   if(isTotalPatient = 1) then
        for k in cCountPatient LOOP
          nSmids(i) :=  k.FK_SMID;
          nOtdels(i) := k.FN_VALUE;
          nPacIds(i) := k.FK_PACID;
          i := i + 1;
        end loop;
    else
        for k in cCount LOOP
             nValues(i) := k.FN_COUNT;
             nSmids(i) :=  k.FK_SMID;
             nOtdels(i) := k.FN_VALUE;
             i := i + 1;
        end loop;
    end if;
*/
 -------------------------------------------------------------------------------
    for p in 1..p2.COUNT loop
     nSum1(p) := 0;
    end loop;

    for p in 1..p1.COUNT loop
     nSum(p) := 0;
     arrayCountPeople(p)(1) := 0;
    end loop;

    for p in 1..p1.COUNT loop
        for n in 1..p2.COUNT loop
             nCountTestByOtdel(p)(n) := 0;
        end loop;
    end loop;


    i := 1;

    if(isTotalPatient = 1) then
       for k in cCountPatient LOOP
            isResult := False;
            TempP := 0;
            TempN := 0;
            nTemp := 0;
            for p in 1..p1.COUNT loop
              for n in 1..p2.COUNT loop
                 if k.FK_SMID = p1(p) and k.FN_VALUE = p2(n) then
                   nTemp := k.FN_COUNT;
                   TempN := n;
                   IsResult := True;
                   EXIT;
                 end if;
              end loop;
              if IsResult then
                TempP := p;
                EXIT;
              end if;
            end loop;
            if TempP > 0 and TempN > 0 then
                nSum(TempP) := nSum(TempP) + nTemp;
                nSum1(TempN) := nSum1(TempN) + nTemp;
                nCountTestByOtdel(TempP)(TempN) := nCountTestByOtdel(TempP)(TempN) + nTemp;
                SetCountPacient(k.FK_PACID, TempP);
            end if;
        end loop;

    else
        for k in cCount LOOP
            isResult := False;
            TempP := 0;
            TempN := 0;
            nTemp := 0;
            for p in 1..p1.COUNT loop
              for n in 1..p2.COUNT loop
                 if k.FK_SMID = p1(p) and k.FN_VALUE = p2(n) then
                   nTemp := k.FN_COUNT;
                   TempN := n;
                   IsResult := True;
                   Exit;
                 end if;
              end loop;
              if IsResult then
                TempP := p;
                Exit;
              end if;
            end loop;
            if TempP > 0 and TempN > 0 then
                nSum(TempP) := nSum(TempP) + nTemp;
                nSum1(TempN) := nSum1(TempN) + nTemp;
                nCountTestByOtdel(TempP)(TempN) := nTemp;
            end if;
        end loop;
    end if;

/*
    for p in 1..p1.COUNT loop
     nSum(p) := 0;
     arrayCountPeople(p)(1) := 0;

      for n in 1..p2.COUNT loop
         nTemp := 0;
         if(isTotalPatient = 1) then
             for k in 1..nPACIDs.count loop
                 if nSmids(k) = p1(p) and nOtdels(k) = p2(n) then
                     nTemp := nTemp + 1;
                     SetCountPacient(nPACIDs(k), p);
                 end if;
              end loop;
         else
              for k in 1..nValues.count loop
                 if nSmids(k) = p1(p) and nOtdels(k) = p2(n) then
                  nTemp := nValues(k);
                 end if;
               end loop;
         end if;

         nSum(p) := nSum(p) + nTemp;
         nSum1(n) := nSum1(n) + nTemp;
         nCountTestByOtdel(p)(n) := nTemp;
       end loop;
     end loop;
*/
    LOOP

    sHtml :=
         '<TABLE>'||CHR(13)||
         ' <TR>'||CHR(13)||
         '  <TD><P class=user>№</P></TD>'||CHR(13)||
         '  <TD><P class=user>Название теста</P></TD>'||CHR(13);


    for p in nStartOtdel..nCountOtdel loop   --p2.COUNT loop
      sHtml := sHtml || '  <TD><P class=user>'||LOGIN.GET_OTDELNAME(p2(p))||'</P></TD>'||CHR(13);

    end loop;
    if (nCountOtdel >= p2.COUNT) then
    if(isTotalPatient = 1) then
      sHtml := sHtml || '  <TD><P class=user>Всего тестов</P></TD>'||CHR(13); --||'  </TR>'||CHR(13);
      sHtml := sHtml || '  <TD><P class=user>Всего пациентов</P></TD>'||CHR(13)||' </TR>'||CHR(13);
    else
      sHtml := sHtml || '  <TD><P class=user>Всего</P></TD>'||CHR(13)||'  </TR>'||CHR(13);
    end if;
    end if;
    DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);
    nNum := 0;
    arrayCountPeople(p1.COUNT+1)(1) := 0;


    for p in 1..p1.COUNT loop
      nCountPeople := 0;
      bEmptyRow := FALSE;
      nNum := nNum + 1;
      sHtml := ' <TR>'||CHR(13)|| '  <TD><P class=user>'||nNum||'</P></TD>'||CHR(13)|| '  <TD style=''text-align:left; width:30%''><P class=user>'||GET_SMIDNAME(p1(p))||' </P></TD>'||CHR(13);

      for n in nStartOtdel..nCountOtdel loop
        sHtml := sHtml ||'  <TD ><P class=user>'|| PKG_R_ALLFUNC.RETURN_VALUE(nCountTestByOtdel(p)(n))||'</P></TD>'||CHR(13);
      end loop;

      if(nSum(p) <= 0) then
        nNum := nNum - 1;
        sHtml := '';
        bEmptyRow := TRUE;
      end if;


     if(not bEmptyRow) then
     if (nCountOtdel >= p2.COUNT) then
        sHtml := sHtml ||'  <TD ><P class=user>'|| PKG_R_ALLFUNC.RETURN_VALUE(nSum(p)) ||'</P></TD>'||CHR(13);
      end if;
      if(isTotalPatient = 1) then
        for l in 1..arrayCountPeople(p).COUNT loop
           if(arrayCountPeople(p)(l) > 0) then
             nCountPeople := nCountPeople + 1;
             SetCountPacient(arrayCountPeople(p)(l), p1.COUNT+1);
           end if;
        end loop;
        if (nCountOtdel >= p2.COUNT) then
          sHtml := sHtml ||'  <TD><P class=user>'|| PKG_R_ALLFUNC.RETURN_VALUE(nCountPeople) ||'</P></TD>'||CHR(13)||'</TR>'||CHR(13);
        else
         sHtml := sHtml ||'</TR>'||CHR(13);
        end if;
      end if;
      sHtml := sHtml ||' </TR>'||CHR(13);
      DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);
    end if;
    end loop;

    sHtml := ' <TR>'||CHR(13)||'  <TD colspan=2 class=user>ИТОГО:</TD>'||CHR(13);
    for n in nStartOtdel..nCountOtdel loop
      sHtml := sHtml ||'  <TD >'|| TO_CHAR(nSum1(n)) ||'</TD>'||CHR(13);
      nTSum:=nTSum + nSum1(n);
    end loop;

    if (nCountOtdel >= p2.COUNT) then
    if(isTotalPatient = 1) then
      sHtml := sHtml ||'  <TD >'|| TO_CHAR(nTSum) ||'</TD>'||CHR(13);
      sHtml := sHtml ||'  <TD >'|| TO_CHAR(arrayCountPeople(p1.COUNT+1).COUNT - 1) ||'</TD>'||CHR(13)||'</TR>'||CHR(13);
    else
      sHtml := sHtml ||'  <TD >'|| TO_CHAR(nTSum) ||'</TD>'||CHR(13)||'</TR>'||CHR(13);
    end if;
    end if;
    sHtml := sHtml || '</TABLE>'||CHR(13)||'<BR><BR>';
    DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);

    EXIT WHEN (nCountOtdel >= p2.COUNT);
    nCountOtdel := nCountOtdel + nCountColHead;
    nStartOtdel := nStartOtdel + nCountColHead;
    if (nCountOtdel > p2.COUNT) then
      nCountOtdel := p2.COUNT;
    end if;
    end loop;

    sHtml := '<BR><P><B>Отчет составил: _________________________'||LOGIN.GET_SOTRNAME(pFK_SOTRID)||'</B></P>'||CHR(13)||'</DIV></BODY></HTML>';
    DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);
    arrayCountPeople := arrayEmpty_table;
    RETURN clTemp;
  end;

 PROCEDURE SetCountPacient(pacid IN NUMBER, num1 IN NUMBER, nCount IN NUMBER := 1) IS
 bFlag Boolean := TRUE;
 BEGIN
   for l in 1..arrayCountPeople(num1).COUNT loop
     if (arrayCountPeople(num1)(l) = pacid) then
       bFlag := FALSE;
       EXIT;
     end if;
   end loop;
   if (bFlag) then
     arrayCountPeople(num1)(arrayCountPeople(num1).COUNT + 1) := pacid;
   end if;
 END;

FUNCTION GetRepByColor(pFK_SOTRID IN BINARY_INTEGER, pFD_BEGIN IN DATE, pFD_END IN DATE) RETURN CLOB IS
    CURSOR cColor IS SELECT FK_ID,
                            FC_NAME
                     FROM TSMID
                     START WITH FK_OWNER = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = 'LAB_COLOR')
                     CONNECT BY PRIOR FK_ID = FK_OWNER
                     ORDER BY  FC_NAME;
    CURSOR cProbColor IS
           SELECT FC_NAME,
                  GET_SMIDNAME(FK_COLOR) FC_COLOR,
                  FK_COLOR,
                  COUNT(FK_COLOR)
           FROM (SELECT FK_COLOR,
                        FC_NAME
                 FROM (SELECT TRUNC(FD_REGIST) FD_REGIST,
                              FN_PROBE,
                              GET_NAZ_COLORID(TNAZAN.FK_SMID) FK_COLOR,
                              LOGIN.TOTDEL.FC_NAME FC_NAME
                       FROM TNAZAN, TLABREG, TSOTR, LOGIN.TOTDEL, TMP_NUMBERS
                       WHERE TNAZAN.FK_ID = TLABREG.FK_NAZID
                             AND TLABREG.FD_REGIST > TRUNC(pFD_BEGIN) AND TLABREG.FD_REGIST < TRUNC(pFD_END + 1)
                             AND TNAZAN.FK_VRACHID = TSOTR.FK_ID
                             AND LOGIN.TOTDEL.FK_ID = TSOTR.fk_otdelid
                             AND LOGIN.TOTDEL.FK_ID = TMP_NUMBERS.FN_VALUE
                             AND EXISTS (SELECT FK_ID
                                         FROM TSMID_RIGHTS
                                         WHERE FK_SOTRID = pFK_SOTRID
                                               AND FK_SMID = TNAZAN.FK_SMID)
                      )
                 WHERE FK_COLOR IS NOT NULL
                 GROUP BY FD_REGIST, FN_PROBE, FK_COLOR, FC_NAME
                 )
           GROUP BY FC_NAME, FK_COLOR
           ORDER BY FC_NAME, FC_COLOR;
    clTemp  CLOB;
    sHtml  CLOB;
    nCountOtdel Number := OTDEL_COUNT_HEAD;
--    p VARCHAR2(100);
    nSum    NUMBER := 0;
    nNum NUMBER;

    OtdelName Varchar2(500);
    ColorName VARCHAR2(50);
    ColorID NUMBER;
    ColorCnt NUMBER;
    ColorBaseID NUMBER;
    ColorBaseName Varchar2(50);
    OtdelID NUMBER;
    CurOtdelName Varchar2(500);
--    CutOtdelName NUMBER;
    nSumAll    TNUMBERS;
    i NUMBER;
BEGIN
    DBMS_LOB.CREATETEMPORARY(clTemp, FALSE);
    sHtml := PKG_HTML.GET_HEAD('word','GetRepByColor "' ||PKG_SMINI.READSTRING('CONFIG','S_NAME','Не известен')||'"',
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
    sHtml := sHtml||'<P align=center><B>' || Login.get_sotr_otdelname(pFK_SOTRID) ||  '.</P>'||CHR(13);

    if pFD_BEGIN = pFD_END then
      sHtml := sHtml||'<P align=center><B>Отчет о количестве использованных пробирок <BR>за '||TO_CHAR(pFD_BEGIN,'dd.mm.yyyy')||'</P>'||CHR(13);
    else
      sHtml := sHtml||'<P align=center><B>Отчет о количестве использованных пробирок <BR>за период с '||TO_CHAR(pFD_BEGIN,'dd.mm.yyyy')||' по '||TO_CHAR(pFD_END,'dd.mm.yyyy')||'</P>'||CHR(13);
    end if;

    DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);
    OPEN cProbColor;
    FETCH cProbColor INTO CurOtdelName, ColorName, ColorID, ColorCnt;
    if cProbColor%NOTFOUND then
        sHtml := '<BR><P><B>Нет данных для отображения</B></P>'||CHR(13)||'</DIV></BODY></HTML>';
        DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);

    ELSE

--    LOOP
    sHtml :=
         '<BR><BR><TABLE>'||CHR(13)||
         ' <TR>'||CHR(13)||
         '  <TD>№</TD>'||CHR(13)||
         '  <TD>Наименоение отделения</TD>'||CHR(13);
    i := 0;
    for p in cColor loop
        sHtml := sHtml || '  <TD>'||p.FC_NAME||'</TD>'||CHR(13);
        nSumAll(i) := 0;
        i := i + 1;
    end loop;

    sHtml := sHtml || '  <TD >Всего</TD>'||CHR(13)||'  </TR>'||CHR(13);

    DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);

    nNum := 0;

    LOOP
        nNum := nNum + 1;
        EXIT WHEN cProbColor%NOTFOUND;

        sHtml := ' <TR>'||CHR(13)|| '  <TD><P class=user>'||nNum||'</P></TD>'||CHR(13)|| '  <TD style=''text-align:left''><P class=user></P>'||CurOtdelName||' </TD>'||CHR(13);

        nSum := 0;
        OPEN cColor;
        i := 0;
        LOOP
            FETCH cColor INTO ColorBaseID, ColorBaseName;
            EXIT WHEN cColor%NOTFOUND;
            IF ColorName = ColorBaseName THEN
                sHtml := sHtml ||'  <TD ><P class=user></P>' || TO_CHAR(ColorCnt) ||' </P></TD>'||CHR(13);
                nSumAll(i) := nSumAll(i) + ColorCnt;
                nSum := nSum + ColorCnt;
                FETCH cProbColor INTO CurOtdelName, ColorName, ColorID, ColorCnt;
            ELSE
                sHtml := sHtml ||'  <TD ><P class=user></P></TD>'||CHR(13);
            END IF;
            i := i + 1;


        END LOOP;
        CLOSE cColor;

        sHtml := sHtml ||'  <TD ><P class=user></P>' || TO_CHAR(nSum) ||'</TD>  </TR>'||CHR(13);
        DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);
    END LOOP;

    CLOSE cProbColor;

    sHtml := ' <TR>'||CHR(13)|| '  <TD><P colspan=2  class=user></P> ' ||nNum || ' </TD>'||CHR(13)|| '  <TD style=''text-align:right''><P class=user></P>Итого: </TD>'||CHR(13);

    OPEN cColor;
    i := 0;
    nSum := 0;
    LOOP
        FETCH cColor INTO ColorBaseID, ColorBaseName;
        EXIT WHEN cColor%NOTFOUND;
        sHtml := sHtml ||'  <TD ><P class=user></P>'|| TO_CHAR(nSumAll(i)) ||'</TD>'||CHR(13);
        nSum := nSum +  nSumAll(i);
        i := i + 1;
    END LOOP;
    CLOSE cColor;

    sHtml := sHtml ||'  <TD ><P class=user></P>'|| TO_CHAR(nSum) ||'</TD>'||CHR(13);
    sHtml := sHtml || '</TABLE>'||CHR(13)||'<BR><BR>';
    DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);
    END IF;
    sHtml := '<BR><P><B>Отчет составил: _________________________'||LOGIN.GET_SOTRNAME(pFK_SOTRID)||'</B></P>'||CHR(13)||'</DIV></BODY></HTML>';
    DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);
    RETURN clTemp;
END;







FUNCTION GetRepByGROUP5(pFK_SOTRID IN BINARY_INTEGER, p1 IN TNUMBERS, p2 IN TNUMBERS, p3 IN NUMBER, p4 IN NUMBER, isTotalPatient IN INTEGER default 0, nCountColHead IN INTEGER DEFAULT OTDEL_COUNT_HEAD, pFD_DATE1 IN DATE DEFAULT NULL, pFD_DATE2 IN DATE DEFAULT NULL)
    RETURN CLOB IS
  CURSOR IsReanim IS SELECT COUNT(*) FN_COUNT FROM ASU.tmp_numbers WHERE FN_VALUE IN (get_reanimotdel, Get_Oarotdel);
  CURSOR cSTAC IS (select FK_ID from login.totdel WHERE FK_ID NOT IN (SELECT FN_VALUE FROM ASU.tmp_numbers) start with fk_id = 21466 connect by prior fk_id = fk_ownerid );
  CURSOR cNazanType(p3 IN NUMBER) IS
   SELECT FC_NAME FROM (
                  SELECT FK_ID, FC_NAME FROM TSMID
                    WHERE FK_OWNER IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = 'NAZN_TYPES')
                      AND FL_SHOWPRINT = 1
                  UNION
                  SELECT 0, 'ВСЕ' FROM DUAL
                  )
   WHERE FK_ID = p3;

   CURSOR cPacType(p4 IN NUMBER) IS
   SELECT FC_NAME FROM
   (
     SELECT 0 FK_ID, 'Амбулаторные' FC_NAME FROM DUAL
     UNION
     SELECT 1 FK_ID, 'Стационарные' FC_NAME FROM DUAL
     UNION
     SELECT 2 FK_ID, 'ВСЕ' FC_NAME FROM DUAL
   )
   WHERE FK_ID = p4;

   CURSOR cCountPatientAll IS

   SELECT  TNAZAN.FK_ID, TNAZAN.FK_PACID, TNAZAN.FK_SMID, tmp_numbers.fn_value
    FROM TNAZAN, TAMBULANCE, TSOTR, tmp_numbers, tmp_numbers2,  (SELECT FK_ID FROM TSMID
                                     WHERE FK_OWNER IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = 'NAZN_TYPES')
                                           AND FL_SHOWPRINT = 1
                                           and (case when fk_id = p3 and p3 > 0 then 1 when p3 = 0 then 1 else 0 end) = 1) TTYPE
    WHERE TNAZAN.FK_SMID  = tmp_numbers2.fn_value
      AND TNAZAN.FK_NAZTYPEID = TTYPE.FK_ID
      AND FK_NAZSOSID = GET_VIPNAZ
      AND FD_RUN BETWEEN TRUNC(pFD_DATE1) AND TRUNC(pFD_DATE2)+1-1/(24*60*60)
      AND TAMBULANCE.FK_ID = TNAZAN.FK_PACID
      AND TNAZAN.FK_VRACHID = TSOTR.FK_ID
      AND FK_OTDELID = tmp_numbers.fn_value
   UNION all
   SELECT TNAZAN.FK_ID, TNAZAN.FK_PACID, TNAZAN.FK_SMID, GET_REANIM(TNAZAN.FK_PACID, TNAZAN.FD_RUN, tmp_numbers.fn_value) fn_value
    FROM TNAZAN, TKARTA, tmp_numbers2, tmp_numbers, (SELECT FK_ID FROM TSMID
                                        WHERE FK_OWNER IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = 'NAZN_TYPES')
                                           AND FL_SHOWPRINT = 1
                                           and (case when fk_id = p3 and p3 > 0 then 1 when p3 = 0 then 1 else 0 end) = 1) TTYPE
    WHERE TNAZAN.FK_SMID = tmp_numbers2.fn_value
      AND TNAZAN.FK_NAZTYPEID = TTYPE.FK_ID
      AND FK_NAZSOSID = GET_VIPNAZ
      AND FD_RUN BETWEEN TRUNC(pFD_DATE1) AND TRUNC(pFD_DATE2)+1-1/(24*60*60)
      AND TKARTA.FK_ID = TNAZAN.FK_PACID
      AND  EXISTS (SELECT FK_PACID
                   FROM TPERESEL, TROOM
                   WHERE TROOM.FK_OTDELID = tmp_numbers.fn_value
                         AND TROOM.FK_ID = TPERESEL.FK_PALATAID
                         AND TPERESEL.FK_ID = (SELECT MAX(TPERESEL.FK_ID)
                                               FROM TPERESEL
                                               WHERE FK_PACID = TKARTA.FK_ID
                                                     AND TPERESEL.FD_DATA1 <= TNAZAN.FD_RUN));
   --  ) group by FK_SMID, fn_value, FK_PACID;


  CURSOR cCountAll IS
   SELECT COUNT(*) fn_count, FK_SMID, fn_value FROM
   (
   SELECT TNAZAN.FK_ID, TNAZAN.FK_PACID, TNAZAN.FK_SMID, tmp_numbers.fn_value
    FROM TNAZAN, TAMBULANCE, TSOTR, tmp_numbers, tmp_numbers2, (SELECT FK_ID FROM TSMID
                                     WHERE FK_OWNER IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = 'NAZN_TYPES')
                                           AND FL_SHOWPRINT = 1
                                           and (case when fk_id = p3 and p3 > 0 then 1 when p3 = 0 then 1 else 0 end) = 1) TTYPE
    WHERE TNAZAN.FK_SMID = tmp_numbers2.fn_value
      AND TNAZAN.FK_NAZTYPEID = TTYPE.FK_ID
      AND FK_NAZSOSID = GET_VIPNAZ
      AND FD_RUN BETWEEN TRUNC(pFD_DATE1) AND TRUNC(pFD_DATE2)+1-1/(24*60*60)
      AND TAMBULANCE.FK_ID = TNAZAN.FK_PACID
      AND TNAZAN.FK_VRACHID = TSOTR.FK_ID
      AND FK_OTDELID = tmp_numbers.fn_value
   UNION all
   SELECT TNAZAN.FK_ID, TNAZAN.FK_PACID, TNAZAN.FK_SMID, tmp_numbers.fn_value --GET_REANIM(TNAZAN.FK_PACID, TNAZAN.FD_RUN, tmp_numbers.fn_value) fn_value
    FROM TNAZAN, TKARTA, tmp_numbers2, tmp_numbers, (SELECT FK_ID FROM TSMID
                                     WHERE FK_OWNER IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = 'NAZN_TYPES')
                                           AND FL_SHOWPRINT = 1
                                           and (case when fk_id = p3 and p3 > 0 then 1 when p3 = 0 then 1 else 0 end) = 1) TTYPE
    WHERE TNAZAN.FK_SMID = tmp_numbers2.fn_value
      AND TNAZAN.FK_NAZTYPEID = TTYPE.FK_ID
      AND FK_NAZSOSID = GET_VIPNAZ
      AND FD_RUN BETWEEN TRUNC(pFD_DATE1) AND TRUNC(pFD_DATE2)+1-1/(24*60*60)
      AND TKARTA.FK_ID = TNAZAN.FK_PACID
      AND  EXISTS (SELECT FK_PACID
                   FROM TPERESEL, TROOM
                   WHERE TROOM.FK_OTDELID = tmp_numbers.fn_value
                         AND TROOM.FK_ID = TPERESEL.FK_PALATAID
                         AND TPERESEL.FK_ID = (SELECT MAX(TPERESEL.FK_ID)
                                               FROM TPERESEL
                                               WHERE FK_PACID = TKARTA.FK_ID
                                                     AND TPERESEL.FD_DATA1 <= TNAZAN.FD_RUN))
   ) group by FK_SMID, fn_value;




   -- Aiaoeaoi?iua. Ioaaeaiea aa?aony ii a?a?o, auiieieaoaio iacia?aiea
 CURSOR cCountPatient IS
 SELECT COUNT(*) fn_count, FK_SMID, fn_value, FK_PACID FROM (

   SELECT TNAZAN.FK_ID, TNAZAN.FK_PACID, TNAZAN.FK_SMID, tmp_numbers.fn_value
    FROM TNAZAN, TAMBULANCE, TSOTR, tmp_numbers, tmp_numbers2, (SELECT FK_ID FROM TSMID
                                     WHERE FK_OWNER IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = 'NAZN_TYPES')
                                           AND FL_SHOWPRINT = 1
                                           and (case when fk_id = p3 and p3 > 0 then 1 when p3 = 0 then 1 else 0 end) = 1) TTYPE
    WHERE (CASE WHEN p4 = 0 THEN 1 WHEN p4 = 2 THEN 1 ELSE 0 END) = 1
      AND FK_NAZSOSID = GET_VIPNAZ
      AND FD_RUN BETWEEN TRUNC(pFD_DATE1) AND TRUNC(pFD_DATE2)+1-1/(24*60*60)
      AND TNAZAN.FK_SMID = tmp_numbers2.fn_value
      AND TAMBULANCE.FK_ID = TNAZAN.FK_PACID
      AND TNAZAN.FK_NAZTYPEID = TTYPE.FK_ID
      AND TNAZAN.FK_VRACHID = TSOTR.FK_ID
      AND FK_OTDELID = tmp_numbers.fn_value
   UNION ALL
   SELECT TNAZAN.FK_ID, TNAZAN.FK_PACID, TNAZAN.FK_SMID, GET_REANIM(TNAZAN.FK_PACID, TNAZAN.FD_RUN, tmp_numbers.fn_value) fn_value
    FROM TNAZAN, tmp_numbers2, TKARTA, TPERESEL, TROOM, TDOCOBSL, tmp_numbers,
         (SELECT FK_ID FROM TSMID
          WHERE FK_OWNER IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = 'NAZN_TYPES')
                            AND FL_SHOWPRINT = 1
                            and (case when fk_id = p3 and p3 > 0 then 1 when p3 = 0 then 1 else 0 end) = 1) TTYPE
    WHERE (CASE WHEN p4 = 0 THEN 1 WHEN p4 = 2 THEN 1 ELSE 0 END) = 1
      AND FK_NAZSOSID = GET_VIPNAZ
      AND FD_RUN BETWEEN TRUNC(pFD_DATE1) AND TRUNC(pFD_DATE2)+1-1/(24*60*60)
      AND TNAZAN.FK_SMID = tmp_numbers2.fn_value
      AND TKARTA.FK_ID = TNAZAN.FK_PACID
      AND TNAZAN.FK_NAZTYPEID = TTYPE.FK_ID
      AND TROOM.FK_OTDELID = tmp_numbers.fn_value
      AND TROOM.FK_ID = TPERESEL.FK_PALATAID
      AND TPERESEL.FK_PACID = TKARTA.FK_ID
      AND ((TNAZAN.FD_RUN BETWEEN TPERESEL.FD_DATA1 AND TPERESEL.FD_DATA2)
           or (TPERESEL.FD_DATA1 <= TNAZAN.FD_RUN and TPERESEL.FK_ID = (select max(fk_id) from tperesel where fK_pacid = TKARTA.FK_ID)))
      AND TPERESEL.FK_DOCOBSLID = TDOCOBSL.FK_ID
      AND TDOCOBSL.FK_VIDDOCID IN (SELECT FK_ID
                                       FROM TUSLVID
                                       START WITH FK_ID IN (SELECT FN_CONST
                                                            FROM TCONST
                                                            WHERE FC_FUNC = 'DOC_IBDS_STAC' OR FC_FUNC = 'DOC_IB_DS')
                                       CONNECT BY PRIOR FK_ID = FK_OWNERID)
   UNION ALL
   SELECT TNAZAN.FK_ID, TNAZAN.FK_PACID, TNAZAN.FK_SMID, GET_REANIM(TNAZAN.FK_PACID, TNAZAN.FD_RUN, tmp_numbers.fn_value) fn_value
    FROM TNAZAN, tmp_numbers2, TKARTA, TPERESEL, TROOM, TDOCOBSL, tmp_numbers,
         (SELECT FK_ID FROM TSMID
          WHERE FK_OWNER IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = 'NAZN_TYPES')
                            AND FL_SHOWPRINT = 1
                            and (case when fk_id = p3 and p3 > 0 then 1 when p3 = 0 then 1 else 0 end) = 1) TTYPE
    WHERE (CASE WHEN p4 = 1 THEN 1 WHEN p4 = 2 THEN 1 ELSE 0 END) = 1
      AND FK_NAZSOSID = GET_VIPNAZ
      AND FD_RUN BETWEEN TRUNC(pFD_DATE1) AND TRUNC(pFD_DATE2)+1-1/(24*60*60)
      AND TNAZAN.FK_SMID = tmp_numbers2.fn_value
      AND TKARTA.FK_ID = TNAZAN.FK_PACID
      AND TNAZAN.FK_NAZTYPEID = TTYPE.FK_ID
      AND TROOM.FK_OTDELID = tmp_numbers.fn_value
      AND TROOM.FK_ID = TPERESEL.FK_PALATAID
      AND TPERESEL.FK_PACID = TKARTA.FK_ID
      AND ((TNAZAN.FD_RUN BETWEEN TPERESEL.FD_DATA1 AND TPERESEL.FD_DATA2)
           or (TPERESEL.FD_DATA1 <= TNAZAN.FD_RUN and TPERESEL.FK_ID = (select max(fk_id) from tperesel where fK_pacid = TKARTA.FK_ID)))
      AND TPERESEL.FK_DOCOBSLID = TDOCOBSL.FK_ID
      AND TDOCOBSL.FK_VIDDOCID not IN (SELECT FK_ID
                                   FROM TUSLVID
                                   START WITH FK_ID IN (SELECT FN_CONST
                                                        FROM TCONST
                                                        WHERE FC_FUNC = 'DOC_IBDS_STAC' OR FC_FUNC = 'DOC_IB_DS')
                                   CONNECT BY PRIOR FK_ID = FK_OWNERID)
    ) group by FK_SMID, fn_value, FK_PACID;


  CURSOR cCount IS
   SELECT COUNT(*) fn_count, FK_SMID, fn_value FROM
   (
   SELECT TNAZAN.FK_ID, TNAZAN.FK_PACID, TNAZAN.FK_SMID, tmp_numbers.fn_value
    FROM TNAZAN, TAMBULANCE, TSOTR, tmp_numbers, tmp_numbers2, (SELECT FK_ID FROM TSMID
                                     WHERE FK_OWNER IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = 'NAZN_TYPES')
                                           AND FL_SHOWPRINT = 1
                                           and (case when fk_id = p3 and p3 > 0 then 1 when p3 = 0 then 1 else 0 end) = 1) TTYPE
    WHERE (CASE WHEN p4 = 0 THEN 1 WHEN p4 = 2 THEN 1 ELSE 0 END) = 1
      AND FK_NAZSOSID = GET_VIPNAZ
      AND FD_RUN BETWEEN TRUNC(pFD_DATE1) AND TRUNC(pFD_DATE2)+1-1/(24*60*60)
      AND TNAZAN.FK_SMID = tmp_numbers2.fn_value
      AND TAMBULANCE.FK_ID = TNAZAN.FK_PACID
      AND TNAZAN.FK_NAZTYPEID = TTYPE.FK_ID
      AND TNAZAN.FK_VRACHID = TSOTR.FK_ID
      AND FK_OTDELID = tmp_numbers.fn_value
   UNION ALL
   SELECT TNAZAN.FK_ID, TNAZAN.FK_PACID, TNAZAN.FK_SMID, GET_REANIM(TNAZAN.FK_PACID, TNAZAN.FD_RUN, tmp_numbers.fn_value) fn_value
    FROM TNAZAN, tmp_numbers2, TKARTA, TPERESEL, TROOM, TDOCOBSL, tmp_numbers,
         (SELECT FK_ID FROM TSMID
          WHERE FK_OWNER IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = 'NAZN_TYPES')
                            AND FL_SHOWPRINT = 1
                            and (case when fk_id = p3 and p3 > 0 then 1 when p3 = 0 then 1 else 0 end) = 1) TTYPE
    WHERE (CASE WHEN p4 = 0 THEN 1 WHEN p4 = 2 THEN 1 ELSE 0 END) = 1
      AND FK_NAZSOSID = GET_VIPNAZ
      AND FD_RUN BETWEEN TRUNC(pFD_DATE1) AND TRUNC(pFD_DATE2)+1-1/(24*60*60)
      AND TNAZAN.FK_SMID = tmp_numbers2.fn_value
      AND TKARTA.FK_ID = TNAZAN.FK_PACID
      AND TNAZAN.FK_NAZTYPEID = TTYPE.FK_ID
      AND TROOM.FK_OTDELID = tmp_numbers.fn_value
      AND TROOM.FK_ID = TPERESEL.FK_PALATAID
      AND TPERESEL.FK_PACID = TKARTA.FK_ID
      AND ((TNAZAN.FD_RUN BETWEEN TPERESEL.FD_DATA1 AND TPERESEL.FD_DATA2)
           or (TPERESEL.FD_DATA1 <= TNAZAN.FD_RUN and TPERESEL.FK_ID = (select max(fk_id) from tperesel where fK_pacid = TKARTA.FK_ID)))
      AND TPERESEL.FK_DOCOBSLID = TDOCOBSL.FK_ID
      AND TDOCOBSL.FK_VIDDOCID  IN (SELECT FK_ID
                                       FROM TUSLVID
                                       START WITH FK_ID IN (SELECT FN_CONST
                                                            FROM TCONST
                                                            WHERE FC_FUNC = 'DOC_IBDS_STAC' OR FC_FUNC = 'DOC_IB_DS')
                                       CONNECT BY PRIOR FK_ID = FK_OWNERID)
   UNION ALL
   SELECT TNAZAN.FK_ID, TNAZAN.FK_PACID, TNAZAN.FK_SMID, GET_REANIM(TNAZAN.FK_PACID, TNAZAN.FD_RUN, tmp_numbers.fn_value) fn_value
    FROM TNAZAN, tmp_numbers2, TKARTA, TPERESEL, TROOM, TDOCOBSL, tmp_numbers,
         (SELECT FK_ID FROM TSMID
          WHERE FK_OWNER IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = 'NAZN_TYPES')
                            AND FL_SHOWPRINT = 1
                            and (case when fk_id = p3 and p3 > 0 then 1 when p3 = 0 then 1 else 0 end) = 1) TTYPE
    WHERE (CASE WHEN p4 = 1 THEN 1 WHEN p4 = 2 THEN 1 ELSE 0 END) = 1
      AND FK_NAZSOSID = GET_VIPNAZ
      AND FD_RUN BETWEEN TRUNC(pFD_DATE1) AND TRUNC(pFD_DATE2)+1-1/(24*60*60)
      AND TNAZAN.FK_SMID = tmp_numbers2.fn_value
      AND TKARTA.FK_ID = TNAZAN.FK_PACID
      AND TNAZAN.FK_NAZTYPEID = TTYPE.FK_ID
      AND TROOM.FK_OTDELID = tmp_numbers.fn_value
      AND TROOM.FK_ID = TPERESEL.FK_PALATAID
      AND TPERESEL.FK_PACID = TKARTA.FK_ID
      AND ((TNAZAN.FD_RUN BETWEEN TPERESEL.FD_DATA1 AND TPERESEL.FD_DATA2)
           or (TPERESEL.FD_DATA1 <= TNAZAN.FD_RUN and TPERESEL.FK_ID = (select max(fk_id) from tperesel where fK_pacid = TKARTA.FK_ID)))
      AND TPERESEL.FK_DOCOBSLID = TDOCOBSL.FK_ID
      AND TDOCOBSL.FK_VIDDOCID NOT IN (SELECT FK_ID
                                   FROM TUSLVID
                                   START WITH FK_ID IN (SELECT FN_CONST
                                                        FROM TCONST
                                                        WHERE FC_FUNC = 'DOC_IBDS_STAC' OR FC_FUNC = 'DOC_IB_DS')
                                   CONNECT BY PRIOR FK_ID = FK_OWNERID)



   ) group by FK_SMID, fn_value; --, fk_id;



     clTemp  CLOB;
    sHtml   LONG;
    nTemp   BINARY_INTEGER := 0;
    nTSum   BINARY_INTEGER := 0;
    nSum    TNUMBERS;
    nSum1   TNUMBERS;
    nValues   TNUMBERS;
    nSmids   TNUMBERS;
    nOtdels   TNUMBERS;
    nPacIds TNUMBERS;
    i number;
    nCountNazanByOtdel TARRAYS;
    sTemp VARCHAR (50);
    nNum NUMBER;
    sNazanType Varchar2(50);
    sPacType Varchar2(50);
    nCountPeople Number;
    nCountOtdel Number := nCountColHead;
    nStartOtdel Number := 1;
    bEmptyRow Boolean;
    nSmid NUMBER;
    nOtdel NUMBER;
    nCount NUMBER;
    isFind Boolean;
  begin
    DBMS_LOB.CREATETEMPORARY(clTemp, FALSE);
    sHtml := PKG_HTML.GET_HEAD('word','GetRepByGROUP5 "' ||PKG_SMINI.READSTRING('CONFIG','S_NAME','Не известен')||'"',
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
    sHtml := sHtml||'<P align=center><B>' || Login.get_sotr_otdelname(pFK_SOTRID) ||  '.</P>'||CHR(13);

    if pFD_DATE1 = pFD_DATE2 then
      sHtml := sHtml||'<P align=center><B>Отчет о количестве выполненных исследований<BR>за '||TO_CHAR(pFD_DATE1,'dd.mm.yyyy')||'</P>'||CHR(13);
    else
      sHtml := sHtml||'<P align=center><B>Отчет о количестве выполненных исследований<BR>за период с '||TO_CHAR(pFD_DATE1,'dd.mm.yyyy')||' по '||TO_CHAR(pFD_DATE2,'dd.mm.yyyy')||'</P>'||CHR(13);
    end if;

    if (p2.COUNT <= nCountOtdel) then
      nCountOtdel := p2.COUNT;
    end if;

    for p in 1..p2.COUNT loop
     nSum1(p) := 0;
    end loop;

    OPEN cNazanType(p3);
    FETCH cNazanType INTO sNazanType;
    CLOSE cNazanType;
      sHtml := sHtml||'<P align=center>Тип назначения - '||sNazanType||'</P>'||CHR(13);

    OPEN cPacType(p4);
    FETCH cPacType INTO sPacType;
    CLOSE cPacType;


    sHtml := sHtml||'<P align=center>Пациенты - '||sPacType||'</P><BR>'||CHR(13);

    DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);

    delete from tmp_numbers2;
    delete from tmp_numbers;

    for p in 1..p1.COUNT loop
        INSERT INTO tmp_numbers2(FN_VALUE) VALUES (p1(p));
    END LOOP;
    for p in 1..p2.COUNT loop
        INSERT INTO tmp_numbers(FN_VALUE) VALUES (p2(p));
    END LOOP;

    FOR c IN IsReanim LOOP
        if c.FN_COUNT > 0 then
           for p in cSTAC loop
             INSERT INTO tmp_numbers(FN_VALUE) VALUES (p.FK_ID);
           end loop;
        END IF;
        EXIT;
    END LOOP;

    i := 1;
    isFind := False;
    if(isTotalPatient = 1) then
      for k in cCountPatient LOOP
        nSmids(i) :=  k.FK_SMID;
        nOtdels(i) := k.FN_VALUE;
        nPacIds(i) := k.FK_PACID;
        nValues(i) := k.FN_COUNT;
        i := i + 1;
      end loop;
    else
      for k in cCount LOOP
        nSmids(i) :=  k.FK_SMID;
        nOtdels(i) := k.FN_VALUE;
        nValues(i) := k.FN_COUNT;
         i := i + 1;
      end loop;
    end if;

    for p in 1..p1.COUNT loop
     nSum(p) := 0;
     arrayCountPeople(p)(1) := 0;

      for n in 1..p2.COUNT loop
         nTemp := 0;
         if(isTotalPatient = 1) then
           for k in 1..nPACIDs.count loop
               if nSmids(k) = p1(p) and nOtdels(k) = p2(n) then
                nTemp := nTemp + nValues(k);
                SetCountPacient(nPACIDs(k), p);
               end if;
           end loop;
         else
            for k in 1..nValues.count loop
               if nSmids(k) = p1(p) and nOtdels(k) = p2(n) then
                nTemp := nTemp + nValues(k);
               end if;
            end loop;
         end if;

         nSum(p) := nSum(p) + nTemp;
         nSum1(n) := nSum1(n) + nTemp;
         nCountNazanByOtdel(p)(n) := nTemp;

      end loop;

    end loop;
--    Close cCount;
    LOOP

    sHtml :=
         '<TABLE >'||CHR(13)||
         ' <TR>'||CHR(13)||
         '  <TD><P class=user>№</P></TD>'||CHR(13)||
         '  <TD> <P class=user>Название назначения</P></TD>'||CHR(13);

    for p in nStartOtdel..nCountOtdel loop
       sHtml := sHtml || '  <TD><P class=user>'||LOGIN.GET_OTDELNAME(p2(p))||'</P></TD>'||CHR(13);
    end loop;
    if (nCountOtdel >= p2.COUNT) then
    if(isTotalPatient = 1) then
      sHtml := sHtml || '  <TD ><P class=user>Всего назначений</P></TD>'||CHR(13);
      sHtml := sHtml || '  <TD ><P class=user>Всего пациентов</TD>'||CHR(13)||'</P></TR>'||CHR(13);
    else
      sHtml := sHtml || '  <TD ><P class=user>Всего</P></TD>'||CHR(13)||'  </TR>'||CHR(13);
    end if;
    end if;
    DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);
    nNum := 0;
    arrayCountPeople(p1.COUNT+1)(1) := 0;
    for p in 1..p1.COUNT loop
      nCountPeople := 0;
      bEmptyRow := FALSE;
      nNum := nNum + 1;
      sHtml := ' <TR>'||CHR(13)|| '  <TD><P class=user>'||nNum||'</P></TD>'||CHR(13)|| '  <TD style=''text-align:left; width:30%''><P class=user>'||GET_SMIDNAME(p1(p))||' </P></TD>'||CHR(13);

      for n in nStartOtdel..nCountOtdel loop
        sHtml := sHtml ||'  <TD ><P class=user>'|| PKG_R_ALLFUNC.RETURN_VALUE(nCountNazanByOtdel(p)(n))||'</P></TD>'||CHR(13);
      end loop;

      if(nSum(p) <= 0) then
        nNum := nNum - 1;
        sHtml := '';
        bEmptyRow := TRUE;
      end if;

    if(not bEmptyRow) then
    if (nCountOtdel >= p2.COUNT) then
    sHtml := sHtml ||'  <TD ><P class=user>'|| PKG_R_ALLFUNC.RETURN_VALUE(nSum(p)) ||'</P></TD>'||CHR(13);
    end if;
    if(isTotalPatient = 1) then
      for l in 1..arrayCountPeople(p).COUNT loop
         if(arrayCountPeople(p)(l) > 0) then
           nCountPeople := nCountPeople + 1;
           SetCountPacient(arrayCountPeople(p)(l), p1.COUNT+1);
         end if;
      end loop;
      if (nCountOtdel >= p2.COUNT) then
      sHtml := sHtml ||'  <TD><P class=user>'|| PKG_R_ALLFUNC.RETURN_VALUE(nCountPeople) ||'</P></TD>'||CHR(13)||'</TR>'||CHR(13);
      else
       sHtml := sHtml ||'</TR>'||CHR(13);
      end if;
    end if;
    sHtml := sHtml ||' </TR>'||CHR(13);
    DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);
    end if;
    end loop;

    sHtml := ' <TR>'||CHR(13)||'  <TD colspan=2 class=user>ИТОГО:</TD>'||CHR(13);
    for n in nStartOtdel..nCountOtdel loop
      sHtml := sHtml ||'  <TD >'|| TO_CHAR(nSum1(n)) ||'</TD>'||CHR(13);
      nTSum:=nTSum + nSum1(n);
    end loop;

    if (nCountOtdel >= p2.COUNT) then
    if(isTotalPatient = 1) then
      sHtml := sHtml ||'  <TD >'|| TO_CHAR(nTSum) ||'</TD>'||CHR(13);
      sHtml := sHtml ||'  <TD >'|| TO_CHAR(arrayCountPeople(p1.COUNT+1).COUNT - 1) ||'</TD>'||CHR(13)||'</TR>'||CHR(13);
    else
      sHtml := sHtml ||'  <TD >'|| TO_CHAR(nTSum) ||'</TD>'||CHR(13)||'</TR>'||CHR(13);
    end if;
    end if;
    sHtml := sHtml || '</TABLE>'||CHR(13)||'<BR><BR>';
    DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);

    EXIT WHEN (nCountOtdel >= p2.COUNT);
    nCountOtdel := nCountOtdel + nCountColHead;
    nStartOtdel := nStartOtdel + nCountColHead;
    if (nCountOtdel > p2.COUNT) then
      nCountOtdel := p2.COUNT;
    end if;
    end loop;

    sHtml := '<BR><P><B>Отчет составил: _________________________'||LOGIN.GET_SOTRNAME(pFK_SOTRID)||'</B></P>'||CHR(13)||'</DIV></BODY></HTML>';
    DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);
    arrayCountPeople := arrayEmpty_table;
    RETURN clTemp;
  end;

/*******************************************************************************
*******************************************************************************
*******************************************************************************
*******************************************************************************
*******************************************************************************
******************************************************************************/

FUNCTION GetRepByGROUP54(pFK_SOTRID IN BINARY_INTEGER, p1 IN TNUMBERS, p2 IN TNUMBERS, p3 IN NUMBER, p4 IN NUMBER, isTotalPatient IN INTEGER default 0, nCountColHead IN INTEGER DEFAULT OTDEL_COUNT_HEAD, pFD_DATE1 IN DATE DEFAULT NULL, pFD_DATE2 IN DATE DEFAULT NULL)
    RETURN CLOB IS

  CURSOR cNazanType(p3 IN NUMBER) IS
   SELECT FC_NAME FROM (
                  SELECT FK_ID, FC_NAME FROM TSMID
                    WHERE FK_OWNER IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = 'NAZN_TYPES')
                      AND FL_SHOWPRINT = 1
                  UNION
                  SELECT 0, 'ВСЕ' FROM DUAL
                  )
   WHERE FK_ID = p3;

   CURSOR cPacType(p4 IN NUMBER) IS
   SELECT FC_NAME FROM
   (
     SELECT 0 FK_ID, 'Амбулаторные' FC_NAME FROM DUAL
     UNION
     SELECT 1 FK_ID, 'Стационарные' FC_NAME FROM DUAL
     UNION
     SELECT 2 FK_ID, 'ВСЕ' FC_NAME FROM DUAL
   )
   WHERE FK_ID = p4;

/*   CURSOR cCountPatient(p1 IN BINARY_INTEGER, p2 IN BINARY_INTEGER, p3 IN NUMBER, p4 IN NUMBER) IS
   SELECT TNAZAN.FK_PACID
    FROM TNAZAN
    WHERE TNAZAN.FK_SMID = p2
      AND TNAZAN.FK_NAZTYPEID in (SELECT FK_ID FROM TSMID
                                    WHERE FK_OWNER IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = 'NAZN_TYPES')
                                      AND FL_SHOWPRINT = 1
                                      and case when fk_id = p3 and p3 > 0 then 1 when p3 = 0 then 1 else 0 end = 1
                                  )
      AND FK_NAZSOSID = GET_VIPNAZ
      AND FD_RUN BETWEEN TRUNC(pFD_DATE1) AND TRUNC(pFD_DATE2)+1-1/(24*60*60)

      AND EXISTS (SELECT FK_ID
                       FROM TAMBULANCE
                     WHERE FK_ID = TNAZAN.FK_PACID
                       AND CASE WHEN p4 = 0 THEN 1 WHEN p4 = 2 THEN 1 ELSE 0 END = 1
                       AND EXISTS (SELECT FK_ID
                    FROM TSOTR
                   WHERE FK_OTDELID = p1
                     AND TNAZAN.FK_VRACHID = TSOTR.FK_ID)
                  union
                  SELECT FK_ID
                  FROM TKARTA
                  WHERE FK_ID = TNAZAN.FK_PACID
                      and  tkarta.fk_id = (select fk_pacid
                                           from tperesel, troom
                                           where TROOM.FK_OTDELID = p1
                                                  AND TROOM.fk_id = tperesel.FK_PALATAID
                                                  AND tperesel.fk_id = (select max(tperesel.FK_ID)
                                                          from tperesel, TDOCOBSl
                                                          where fk_pacid = tkarta.fk_id
                                                                AND FK_DOCOBSLID = TDOCOBSl.FK_ID
                                                                AND TDOCOBSl.fk_viddocid  in (select FK_ID

                                                                                                 from tuslvid
                                                                                                 start with fk_id in (SELECT FN_CONST
                                                                                                                      FROM TCONST
                                                                                                                      WHERE FC_FUNC = 'DOC_IBDS_STAC' OR FC_FUNC = 'DOC_IB_DS')
                                                                                                  CONNECT BY PRIOR FK_ID = FK_OWNERID)))
                   )
   UNION ALL
   SELECT TNAZAN.FK_PACID
    FROM TNAZAN
    WHERE TNAZAN.FK_SMID = p2
      AND TNAZAN.FK_NAZTYPEID in (SELECT FK_ID FROM TSMID
                                    WHERE FK_OWNER IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = 'NAZN_TYPES')
                                      AND FL_SHOWPRINT = 1
                                      and case when fk_id = p3 and p3 > 0 then 1 when p3 = 0 then 1 else 0 end = 1
                                  )
      AND FK_NAZSOSID = GET_VIPNAZ
      AND FD_RUN BETWEEN TRUNC(pFD_DATE1) AND TRUNC(pFD_DATE2)+1-1/(24*60*60)

       AND EXISTS (SELECT FK_ID
                  FROM TKARTA
                  WHERE FK_ID = TNAZAN.FK_PACID
                      and  tkarta.fk_id = (select fk_pacid
                                           from tperesel, troom
                                           where TROOM.FK_OTDELID = p1
                                                  AND TROOM.fk_id = tperesel.FK_PALATAID
                                                  AND tperesel.fk_id = (select max(tperesel.FK_ID)
                                                          from tperesel, TDOCOBSl
                                                          where fk_pacid = tkarta.fk_id
                                                                AND FK_DOCOBSLID = TDOCOBSl.FK_ID
                                                                AND TDOCOBSl.fk_viddocid not in (select FK_ID

                                                                                                 from tuslvid
                                                                                                 start with fk_id in (SELECT FN_CONST
                                                                                                                      FROM TCONST
                                                                                                                      WHERE FC_FUNC = 'DOC_IBDS_STAC' OR FC_FUNC = 'DOC_IB_DS')
                                                                                                  CONNECT BY PRIOR FK_ID = FK_OWNERID)))
                   );
*/
   CURSOR cCountPatient(p1 IN BINARY_INTEGER, p2 IN BINARY_INTEGER, p3 IN NUMBER, p4 IN NUMBER) IS

   -- Aiaoeaoi?iua. Ioaaeaiea aa?aony ii a?a?o, auiieieaoaio iacia?aiea
   SELECT TNAZAN.FK_PACID
    FROM TNAZAN, TAMBULANCE, TSOTR, (SELECT FK_ID FROM TSMID
                                     WHERE FK_OWNER IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = 'NAZN_TYPES')
                                           AND FL_SHOWPRINT = 1
                                           and (case when fk_id = p3 and p3 > 0 then 1 when p3 = 0 then 1 else 0 end) = 1) TTYPE
    WHERE TNAZAN.FK_SMID IN (p2)
      AND TNAZAN.FK_NAZTYPEID = TTYPE.FK_ID
      AND FK_NAZSOSID = GET_VIPNAZ
      AND FD_RUN BETWEEN TRUNC(pFD_DATE1) AND TRUNC(pFD_DATE2)+1-1/(24*60*60)
      AND TAMBULANCE.FK_ID = TNAZAN.FK_PACID
      AND (CASE WHEN p4 = 0 THEN 1 WHEN p4 = 2 THEN 1 ELSE 0 END) = 1
      AND TNAZAN.FK_VRACHID = TSOTR.FK_ID
      AND FK_OTDELID in (p1)
   UNION ALL
   SELECT TNAZAN.FK_PACID
    FROM TNAZAN, TKARTA, (SELECT FK_ID FROM TSMID
                                     WHERE FK_OWNER IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = 'NAZN_TYPES')
                                           AND FL_SHOWPRINT = 1
                                           and (case when fk_id = p3 and p3 > 0 then 1 when p3 = 0 then 1 else 0 end) = 1) TTYPE
    WHERE TNAZAN.FK_SMID IN (p2)
      AND TNAZAN.FK_NAZTYPEID = TTYPE.FK_ID
      AND FK_NAZSOSID = GET_VIPNAZ
      AND FD_RUN BETWEEN TRUNC(pFD_DATE1) AND TRUNC(pFD_DATE2)+1-1/(24*60*60)
      AND TKARTA.FK_ID = TNAZAN.FK_PACID
      AND (CASE WHEN p4 = 0 THEN 1 WHEN p4 = 2 THEN 1 ELSE 0 END) = 1
      AND  EXISTS (SELECT FK_PACID
                   FROM TPERESEL, TROOM
                   WHERE TROOM.FK_OTDELID IN (p1)
                         AND TROOM.FK_ID = TPERESEL.FK_PALATAID
                         AND TPERESEL.FK_ID = (SELECT MAX(TPERESEL.FK_ID)
                                               FROM TPERESEL, TDOCOBSL
                                               WHERE FK_PACID = TKARTA.FK_ID
                                                     AND FK_DOCOBSLID = TDOCOBSL.FK_ID
                                                     AND TDOCOBSL.FK_VIDDOCID IN (SELECT FK_ID
                                                                                  FROM TUSLVID
                                                                                  START WITH FK_ID IN (SELECT FN_CONST
                                                                                                       FROM TCONST
                                                                                                       WHERE FC_FUNC = 'DOC_IBDS_STAC' OR FC_FUNC = 'DOC_IB_DS')
                                                                                  CONNECT BY PRIOR FK_ID = FK_OWNERID)))
   UNION ALL
   SELECT TNAZAN.FK_PACID
    FROM TNAZAN, TKARTA,  (SELECT FK_ID FROM TSMID
                           WHERE FK_OWNER IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = 'NAZN_TYPES')
                                 AND FL_SHOWPRINT = 1
                                 and (case when fk_id = p3 and p3 > 0 then 1 when p3 = 0 then 1 else 0 end) = 1) TTYPE
    WHERE TNAZAN.FK_SMID in (p2)
      AND TNAZAN.FK_NAZTYPEID = TTYPE.FK_ID
      AND FK_NAZSOSID = GET_VIPNAZ
      AND FD_RUN BETWEEN TRUNC(pFD_DATE1) AND TRUNC(pFD_DATE2)+1-1/(24*60*60)
      AND TKARTA.FK_ID = TNAZAN.FK_PACID
      AND (CASE WHEN p4 = 1 THEN 1 WHEN p4 = 2 THEN 1 ELSE 0 END) = 1
      AND  EXISTS (SELECT FK_PACID
                   FROM TPERESEL, TROOM
                   WHERE TROOM.FK_OTDELID IN (p1)
                         AND TROOM.FK_ID = TPERESEL.FK_PALATAID
                         AND TPERESEL.FK_ID = (SELECT MAX(TPERESEL.FK_ID)
                                               FROM TPERESEL, TDOCOBSL
                                               WHERE FK_PACID = TKARTA.FK_ID
                                                     AND FK_DOCOBSLID = TDOCOBSL.FK_ID
                                                     AND TDOCOBSL.FK_VIDDOCID NOT IN (SELECT FK_ID
                                                                                      FROM TUSLVID
                                                                                      START WITH FK_ID IN (SELECT FN_CONST
                                                                                                           FROM TCONST
                                                                                                           WHERE FC_FUNC = 'DOC_IBDS_STAC' OR FC_FUNC = 'DOC_IB_DS')
                                                                                      CONNECT BY PRIOR FK_ID = FK_OWNERID)));


  CURSOR cCount(p1 IN BINARY_INTEGER, p2 IN BINARY_INTEGER, p3 IN NUMBER, p4 IN NUMBER) IS
   SELECT COUNT(FK_SMID) FROM
   (
   SELECT TNAZAN.FK_SMID
    FROM TNAZAN
    WHERE TNAZAN.FK_SMID = p2
      AND TNAZAN.FK_NAZTYPEID in (SELECT FK_ID FROM TSMID
                                    WHERE FK_OWNER IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = 'NAZN_TYPES')
                                      AND FL_SHOWPRINT = 1
                                      and case when fk_id = p3 and p3 > 0 then 1 when p3 = 0 then 1 else 0 end = 1
                                  )
      AND FK_NAZSOSID = GET_VIPNAZ
      AND FD_RUN BETWEEN TRUNC(pFD_DATE1) AND TRUNC(pFD_DATE2)+1-1/(24*60*60)
/*      AND EXISTS (SELECT FK_ID
                    FROM TSOTR
                   WHERE FK_OTDELID = p1
                     AND TNAZAN.FK_VRACHID = TSOTR.FK_ID)
*/
      AND EXISTS (SELECT FK_ID
                       FROM TAMBULANCE
                     WHERE FK_ID = TNAZAN.FK_PACID
                       AND CASE WHEN p4 = 0 THEN 1 WHEN p4 = 2 THEN 1 ELSE 0 END = 1
                       AND EXISTS (SELECT FK_ID
                    FROM TSOTR
                   WHERE FK_OTDELID = p1
                     AND TNAZAN.FK_VRACHID = TSOTR.FK_ID)
                  union
                  SELECT FK_ID
                  FROM TKARTA
                  WHERE FK_ID = TNAZAN.FK_PACID
                      and  tkarta.fk_id = (select fk_pacid
                                           from tperesel, troom
                                           where TROOM.FK_OTDELID = p1
                                                  AND TROOM.fk_id = tperesel.FK_PALATAID
                                                  AND tperesel.fk_id = (select max(tperesel.FK_ID)
                                                          from tperesel, TDOCOBSl
                                                          where fk_pacid = tkarta.fk_id
                                                                AND FK_DOCOBSLID = TDOCOBSl.FK_ID
                                                                AND TDOCOBSl.fk_viddocid in (select FK_ID

                                                                                                 from tuslvid
                                                                                                 start with fk_id in (SELECT FN_CONST
                                                                                                                      FROM TCONST
                                                                                                                      WHERE FC_FUNC = 'DOC_IBDS_STAC' OR FC_FUNC = 'DOC_IB_DS')
                                                                                                  CONNECT BY PRIOR FK_ID = FK_OWNERID)))
                   )
   UNION ALL
   SELECT TNAZAN.FK_SMID
    FROM TNAZAN
    WHERE TNAZAN.FK_SMID = p2
      AND TNAZAN.FK_NAZTYPEID in (SELECT FK_ID FROM TSMID
                                    WHERE FK_OWNER IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = 'NAZN_TYPES')
                                      AND FL_SHOWPRINT = 1
                                      and case when fk_id = p3 and p3 > 0 then 1 when p3 = 0 then 1 else 0 end = 1
                                  )
      AND FK_NAZSOSID = GET_VIPNAZ
      AND FD_RUN BETWEEN TRUNC(pFD_DATE1) AND TRUNC(pFD_DATE2)+1-1/(24*60*60)
/*      AND EXISTS (SELECT FK_ID
                    FROM TSOTR
                   WHERE FK_OTDELID = p1
                     AND TNAZAN.FK_VRACHID = TSOTR.FK_ID)
*/
       AND EXISTS (SELECT FK_ID
                  FROM TKARTA
                  WHERE FK_ID = TNAZAN.FK_PACID
                      and  tkarta.fk_id = (select fk_pacid
                                           from tperesel, troom
                                           where TROOM.FK_OTDELID = p1
                                                  AND TROOM.fk_id = tperesel.FK_PALATAID
                                                  AND tperesel.fk_id = (select max(tperesel.FK_ID)
                                                          from tperesel, TDOCOBSl
                                                          where fk_pacid = tkarta.fk_id
                                                                AND FK_DOCOBSLID = TDOCOBSl.FK_ID
                                                                AND TDOCOBSl.fk_viddocid not in (select FK_ID

                                                                                                 from tuslvid
                                                                                                 start with fk_id in (SELECT FN_CONST
                                                                                                                      FROM TCONST
                                                                                                                      WHERE FC_FUNC = 'DOC_IBDS_STAC' OR FC_FUNC = 'DOC_IB_DS')
                                                                                                  CONNECT BY PRIOR FK_ID = FK_OWNERID)))
                   )

   );

   /*SELECT COUNT(TNAZAN.FK_SMID)
    FROM TNAZAN
    WHERE TNAZAN.FK_SMID = p2
      AND TNAZAN.FK_NAZTYPEID in (SELECT FK_ID FROM TSMID
                                    WHERE FK_OWNER IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = 'NAZN_TYPES')
                                      AND FL_SHOWPRINT = 1
                                      and case when fk_id = p3 and p3 > 0 then 1 when p3 = 0 then 1 else 0 end = 1
                                  )
      AND FK_NAZSOSID = GET_VIPNAZ
      AND FD_RUN BETWEEN TRUNC(pFD_DATE1) AND TRUNC(pFD_DATE2)+1-1/(24*60*60)
      AND EXISTS (SELECT FK_ID
                    FROM TSOTR
                   WHERE FK_OTDELID IN
                         (SELECT FK_ID
                            FROM TOTDEL
                           START WITH FK_ID = p1
                         CONNECT BY PRIOR FK_ID = FK_OWNERID)
                     AND TNAZAN.FK_VRACHID = TSOTR.FK_ID);*/

    clTemp  CLOB;
    sHtml   LONG;
    nTemp   BINARY_INTEGER := 0;
    nTSum   BINARY_INTEGER := 0;
    nSum    TNUMBERS;
    nSum1   TNUMBERS;
    nCountNazanByOtdel TARRAYS;
    sTemp VARCHAR (50);
    nNum NUMBER;
    sNazanType Varchar2(50);
    sPacType Varchar2(50);
    nCountPeople Number;
    nCountOtdel Number := nCountColHead;
    nStartOtdel Number := 1;
    bEmptyRow Boolean;
  begin
    DBMS_LOB.CREATETEMPORARY(clTemp, FALSE);
    sHtml := PKG_HTML.GET_HEAD('word','GetRepByGROUP3 "' ||PKG_SMINI.READSTRING('CONFIG','S_NAME','Не известен')||'"',
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
    sHtml := sHtml||'<P align=center><B>' || Login.get_sotr_otdelname(pFK_SOTRID) ||  '.</P>'||CHR(13);

    if pFD_DATE1 = pFD_DATE2 then
      sHtml := sHtml||'<P align=center><B>Отчет о количестве выполненных исследований<BR>за '||TO_CHAR(pFD_DATE1,'dd.mm.yyyy')||'</P>'||CHR(13);
    else
      sHtml := sHtml||'<P align=center><B>Отчет о количестве выполненных исследований<BR>за период с '||TO_CHAR(pFD_DATE1,'dd.mm.yyyy')||' по '||TO_CHAR(pFD_DATE2,'dd.mm.yyyy')||'</P>'||CHR(13);
    end if;

    if (p2.COUNT <= nCountOtdel) then
      nCountOtdel := p2.COUNT;
    end if;

    for p in 1..p2.COUNT loop
     nSum1(p) := 0;
    end loop;

    OPEN cNazanType(p3);
    FETCH cNazanType INTO sNazanType;
    CLOSE cNazanType;
      sHtml := sHtml||'<P align=center>Тип назначения - '||sNazanType||'</P>'||CHR(13);

    OPEN cPacType(p4);
    FETCH cPacType INTO sPacType;
    CLOSE cPacType;
      sHtml := sHtml||'<P align=center>Пациенты - '||sPacType||'</P><BR>'||CHR(13);

    DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);

    for p in 1..p1.COUNT loop
     nSum(p) := 0;
     arrayCountPeople(p)(1) := 0;

      for n in 1..p2.COUNT loop
         nTemp := 0;
         if(isTotalPatient = 1) then
           for c in cCountPatient(p2(n),p1(p),p3,p4) loop
             nTemp := nTemp + 1;
             SetCountPacient(c.FK_PACID, p);
           end loop;
         else
           open cCount(p2(n),p1(p),p3,p4);
           fetch cCount into nTemp;
           close cCount;
         end if;

         nSum(p) := nSum(p) + nTemp;
         nSum1(n) := nSum1(n) + nTemp;
         nCountNazanByOtdel(p)(n) := nTemp;

      end loop;

    end loop;

    LOOP

    sHtml :=
         '<TABLE >'||CHR(13)||
         ' <TR>'||CHR(13)||
         '  <TD><P class=user>№</P></TD>'||CHR(13)||
         '  <TD> <P class=user>Название назначения</P></TD>'||CHR(13);

    for p in nStartOtdel..nCountOtdel loop
       sHtml := sHtml || '  <TD><P class=user>'||LOGIN.GET_OTDELNAME(p2(p))||'</P></TD>'||CHR(13);
    end loop;
    if (nCountOtdel >= p2.COUNT) then
    if(isTotalPatient = 1) then
      sHtml := sHtml || '  <TD ><P class=user>Всего назначений</P></TD>'||CHR(13);
      sHtml := sHtml || '  <TD ><P class=user>Всего пациентов</TD>'||CHR(13)||'</P></TR>'||CHR(13);
    else
      sHtml := sHtml || '  <TD ><P class=user>Всего</P></TD>'||CHR(13)||'  </TR>'||CHR(13);
    end if;
    end if;
    DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);
    nNum := 0;
    arrayCountPeople(p1.COUNT+1)(1) := 0;
    for p in 1..p1.COUNT loop
      nCountPeople := 0;
      bEmptyRow := FALSE;
      nNum := nNum + 1;
      sHtml := ' <TR>'||CHR(13)|| '  <TD><P class=user>'||nNum||'</P></TD>'||CHR(13)|| '  <TD style=''text-align:left; width:30%''><P class=user>'||GET_SMIDNAME(p1(p))||' </P></TD>'||CHR(13);

      for n in nStartOtdel..nCountOtdel loop
        sHtml := sHtml ||'  <TD ><P class=user>'|| PKG_R_ALLFUNC.RETURN_VALUE(nCountNazanByOtdel(p)(n))||'</P></TD>'||CHR(13);
      end loop;

      if(nSum(p) <= 0) then
        nNum := nNum - 1;
        sHtml := '';
        bEmptyRow := TRUE;
      end if;

    if(not bEmptyRow) then
    if (nCountOtdel >= p2.COUNT) then
    sHtml := sHtml ||'  <TD ><P class=user>'|| PKG_R_ALLFUNC.RETURN_VALUE(nSum(p)) ||'</P></TD>'||CHR(13);
    end if;
    if(isTotalPatient = 1) then
      for l in 1..arrayCountPeople(p).COUNT loop
         if(arrayCountPeople(p)(l) > 0) then
           nCountPeople := nCountPeople + 1;
           SetCountPacient(arrayCountPeople(p)(l), p1.COUNT+1);
         end if;
      end loop;
      if (nCountOtdel >= p2.COUNT) then
      sHtml := sHtml ||'  <TD><P class=user>'|| PKG_R_ALLFUNC.RETURN_VALUE(nCountPeople) ||'</P></TD>'||CHR(13)||'</TR>'||CHR(13);
      else
       sHtml := sHtml ||'</TR>'||CHR(13);
      end if;
    end if;
    sHtml := sHtml ||' </TR>'||CHR(13);
    DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);
    end if;
    end loop;

    sHtml := ' <TR>'||CHR(13)||'  <TD colspan=2 class=user>ИТОГО:</TD>'||CHR(13);
    for n in nStartOtdel..nCountOtdel loop
      sHtml := sHtml ||'  <TD >'|| TO_CHAR(nSum1(n)) ||'</TD>'||CHR(13);
      nTSum:=nTSum + nSum1(n);
    end loop;

    if (nCountOtdel >= p2.COUNT) then
    if(isTotalPatient = 1) then
      sHtml := sHtml ||'  <TD >'|| TO_CHAR(nTSum) ||'</TD>'||CHR(13);
      sHtml := sHtml ||'  <TD >'|| TO_CHAR(arrayCountPeople(p1.COUNT+1).COUNT - 1) ||'</TD>'||CHR(13)||'</TR>'||CHR(13);
    else
      sHtml := sHtml ||'  <TD >'|| TO_CHAR(nTSum) ||'</TD>'||CHR(13)||'</TR>'||CHR(13);
    end if;
    end if;
    sHtml := sHtml || '</TABLE>'||CHR(13)||'<BR><BR>';
    DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);

    EXIT WHEN (nCountOtdel >= p2.COUNT);
    nCountOtdel := nCountOtdel + nCountColHead;
    nStartOtdel := nStartOtdel + nCountColHead;
    if (nCountOtdel > p2.COUNT) then
      nCountOtdel := p2.COUNT;
    end if;
    end loop;
    sHtml := '<BR><P><B>Отчет составил: _________________________'||LOGIN.GET_SOTRNAME(pFK_SOTRID)||'</B></P>'||CHR(13)||'</DIV></BODY></HTML>';
    DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);
    arrayCountPeople := arrayEmpty_table;
    RETURN clTemp;
  end;


FUNCTION GetRepByGROUP6(pFK_SOTRID IN BINARY_INTEGER, p1 IN TNUMBERS, p2 IN TNUMBERS, p3 IN NUMBER, p4 IN NUMBER, isTotalPatient IN INTEGER default 0, nCountColHead IN INTEGER DEFAULT OTDEL_COUNT_HEAD, nBrakId IN NUMBER, pFD_DATE1 IN DATE DEFAULT NULL, pFD_DATE2 IN DATE DEFAULT NULL, pNazOplType IN NUMBER, pFK_USE_SOTRID IN NUMBER) RETURN CLOB
is
  CURSOR cNazName(p IN NUMBER) Is SELECT FC_NAME FROM tlab_report_smid WHERE FK_ID = p;
  cursor cOplType is  select get_smidname(pNazOplType) from dual;
  cursor cSotr is select login.get_sotrname(pFK_USE_SOTRID) from dual;
  CURSOR IsReanim IS SELECT COUNT(*) FN_COUNT FROM ASU.tmp_numbers WHERE FN_VALUE IN (get_reanimotdel, Get_Oarotdel);
  CURSOR cSTAC IS (select FK_ID from login.totdel WHERE FK_ID NOT IN (SELECT FN_VALUE FROM ASU.tmp_numbers) start with fk_id = 21466 connect by prior fk_id = fk_ownerid );
  CURSOR cNazanType(p3 IN NUMBER) IS
   SELECT FC_NAME FROM (
                  SELECT FK_ID, FC_NAME FROM TSMID
                    WHERE FK_OWNER IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = 'NAZN_TYPES')
                      AND FL_SHOWPRINT = 1
                  UNION
                  SELECT 0, 'Все' FROM DUAL
                  )
   WHERE FK_ID = p3;

   CURSOR cPacType(p4 IN NUMBER) IS
   SELECT FC_NAME FROM
   (
     SELECT 0 FK_ID, 'Все' FC_NAME FROM DUAL
     UNION
     SELECT 1 FK_ID, 'Амбулаторные' FC_NAME FROM DUAL
     UNION
     SELECT 2 FK_ID, 'Стационарные' FC_NAME FROM DUAL

   )
   WHERE FK_ID = p4;


 CURSOR cCountPatient IS
  SELECT COUNT(*) fn_count, FK_SMID, fn_value,FK_PACID FROM
   (
   SELECT distinct TNAZAN.FK_ID, TNAZAN.FK_PACID, tmp_numbers2.FN_VALUE FK_SMID, tmp_numbers.fn_value
    FROM TNAZAN, TAMBULANCE, TSOTR, tmp_numbers, tmp_numbers2, TNAZOPL,
         (SELECT FK_ID FROM TSMID
          WHERE FK_OWNER IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = 'NAZN_TYPES')
                             AND FL_SHOWPRINT = 1
                             and (case when fk_id = p3 and p3 > 0 then 1 when p3 = 0 then 1 else 0 end) = 1) TTYPE

    WHERE (CASE WHEN p4 = 1 THEN 1 WHEN p4 = 0 THEN 1 ELSE 0 END) = 1
      AND (case when pFK_USE_SOTRID = 0 then 1 when pFK_USE_SOTRID = FK_VRACHID then 1 else 0 end) = 1

--      AND FK_NAZSOSID = GET_VIPNAZ
      AND TNAZAN.FK_ID = TNAZOPL.FK_NAZID
      AND (CASE WHEN pNazOplType = 0 THEN 1 WHEN pNazOplType = FK_SMID_TAL_OPL THEN 1 ELSE 0 END) = 1
      AND (CASE WHEN pNazOplType = 0 THEN 1 WHEN pNazOplType = FK_SMID_TAL_OPL THEN 1 ELSE 0 END) = 1
      AND FD_RUN BETWEEN TRUNC(pFD_DATE1) AND TRUNC(pFD_DATE2)+1-1/(24*60*60)
      AND TNAZAN.FK_SMID IN (SELECT FK_SMID FROM asu.TLAB_REPORT_SMID START WITH FK_ID = tmp_numbers2.FN_VALUE CONNECT BY PRIOR FK_ID = FK_OWNER)
--      AND tresan.FK_SMID = TSELSMID.FK_SMID
      AND TAMBULANCE.FK_ID = TNAZAN.FK_PACID
      AND TNAZAN.FK_NAZTYPEID = TTYPE.FK_ID
      AND TNAZAN.FK_VRACHID = TSOTR.FK_ID
      AND FK_OTDELID IN (SELECT FK_ID FROM LOGIN.TOTDEL START WITH FK_ID = tmp_numbers.FN_VALUE CONNECT BY PRIOR FK_ID = FK_OWNERID)
   UNION ALL
   SELECT distinct TNAZAN.FK_ID, TNAZAN.FK_PACID, tmp_numbers2.fn_value FK_SMID, GET_REANIM(TNAZAN.FK_PACID, TNAZAN.FD_RUN, tmp_numbers.fn_value) fn_value
    FROM TNAZAN, TKARTA, TPERESEL, TROOM, TDOCOBSL, tmp_numbers, tmp_numbers2, TNAZOPL,
         (SELECT FK_ID FROM TSMID
          WHERE FK_OWNER IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = 'NAZN_TYPES')
                            AND FL_SHOWPRINT = 1
                            and (case when fk_id = p3 and p3 > 0 then 1 when p3 = 0 then 1 else 0 end) = 1) TTYPE
    WHERE (CASE WHEN p4 = 0 THEN 1 WHEN p4 = 1 THEN 1 ELSE 0 END) = 1
      AND (case when nBrakId = -1 and FK_NAZSOSID = GET_VIPNAZ then 1 when nBrakId = 0 and FK_NAZSOSID = get_naz_cancel then 1 when nBrakId > 0 and FK_NAZCAUSEID = nBrakId then 1 else 0 end) = 1
      AND TNAZAN.FK_ID = TNAZOPL.FK_NAZID
      AND (CASE WHEN pNazOplType = 0 THEN 1 WHEN pNazOplType = FK_SMID_TAL_OPL THEN 1 ELSE 0 END) = 1
      AND (case when pFK_USE_SOTRID = 0 then 1 when pFK_USE_SOTRID = TNAZAN.FK_VRACHID then 1 else 0 end) = 1
--      AND FK_NAZSOSID = GET_VIPNAZ
      AND FD_RUN BETWEEN TRUNC(pFD_DATE1) AND TRUNC(pFD_DATE2)+1-1/(24*60*60)
      AND TNAZAN.FK_SMID IN (SELECT FK_SMID FROM asu.TLAB_REPORT_SMID START WITH FK_ID = tmp_numbers2.FN_VALUE CONNECT BY PRIOR FK_ID = FK_OWNER)
      AND TKARTA.FK_ID = TNAZAN.FK_PACID
      AND TNAZAN.FK_NAZTYPEID = TTYPE.FK_ID
      AND TROOM.FK_OTDELID IN (SELECT FK_ID FROM LOGIN.TOTDEL START WITH FK_ID = tmp_numbers.FN_VALUE CONNECT BY PRIOR FK_ID = FK_OWNERID)
      AND TROOM.FK_ID = TPERESEL.FK_PALATAID
      AND TPERESEL.FK_PACID = TKARTA.FK_ID
      AND ((TNAZAN.FD_RUN BETWEEN TPERESEL.FD_DATA1 AND TPERESEL.FD_DATA2)
           or (TPERESEL.FD_DATA1 <= TNAZAN.FD_RUN and TPERESEL.FK_ID = (select max(fk_id) from tperesel where fK_pacid = TKARTA.FK_ID)))
      AND TPERESEL.FK_DOCOBSLID = TDOCOBSL.FK_ID
      AND TDOCOBSL.FK_VIDDOCID  IN (SELECT FK_ID
                                       FROM TUSLVID
                                       START WITH FK_ID IN (SELECT FN_CONST
                                                            FROM TCONST
                                                            WHERE FC_FUNC = 'DOC_IBDS_STAC' OR FC_FUNC = 'DOC_IB_DS')
                                       CONNECT BY PRIOR FK_ID = FK_OWNERID)
   UNION ALL
   SELECT distinct TNAZAN.FK_ID, TNAZAN.FK_PACID, tmp_numbers2.fn_value FK_SMID, GET_REANIM(TNAZAN.FK_PACID, TNAZAN.FD_RUN, tmp_numbers.fn_value) fn_value
    FROM TNAZAN, TKARTA, TPERESEL, TROOM, TDOCOBSL, tmp_numbers, tmp_numbers2, TNAZOPL,
         (SELECT FK_ID FROM TSMID
          WHERE FK_OWNER IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = 'NAZN_TYPES')
                            AND FL_SHOWPRINT = 1
                            and (case when fk_id = p3 and p3 > 0 then 1 when p3 = 0 then 1 else 0 end) = 1) TTYPE
    WHERE (CASE WHEN p4 = 0 THEN 1 WHEN p4 = 2 THEN 1 ELSE 0 END) = 1
      AND (case when nBrakId = -1 and FK_NAZSOSID = GET_VIPNAZ then 1 when nBrakId = 0 and FK_NAZSOSID = get_naz_cancel then 1 when nBrakId > 0 and FK_NAZCAUSEID = nBrakId then 1 else 0 end) = 1
      AND TNAZAN.FK_ID = TNAZOPL.FK_NAZID
      AND (CASE WHEN pNazOplType = 0 THEN 1 WHEN pNazOplType = FK_SMID_TAL_OPL THEN 1 ELSE 0 END) = 1
--      AND FK_NAZSOSID = GET_VIPNAZ
      AND (case when pFK_USE_SOTRID = 0 then 1 when pFK_USE_SOTRID = TNAZAN.FK_VRACHID then 1 else 0 end) = 1
      AND FD_RUN BETWEEN TRUNC(pFD_DATE1) AND TRUNC(pFD_DATE2)+1-1/(24*60*60)
      AND TNAZAN.FK_SMID IN (SELECT FK_SMID FROM asu.TLAB_REPORT_SMID START WITH FK_ID = tmp_numbers2.FN_VALUE CONNECT BY PRIOR FK_ID = FK_OWNER)
      AND TKARTA.FK_ID = TNAZAN.FK_PACID
      AND TNAZAN.FK_NAZTYPEID = TTYPE.FK_ID
      AND TROOM.FK_OTDELID IN (SELECT FK_ID FROM LOGIN.TOTDEL START WITH FK_ID = tmp_numbers.FN_VALUE CONNECT BY PRIOR FK_ID = FK_OWNERID)
      AND TROOM.FK_ID = TPERESEL.FK_PALATAID
      AND TPERESEL.FK_PACID = TKARTA.FK_ID
      AND ((TNAZAN.FD_RUN BETWEEN TPERESEL.FD_DATA1 AND TPERESEL.FD_DATA2)
           or (TPERESEL.FD_DATA1 <= TNAZAN.FD_RUN and TPERESEL.FK_ID = (select max(fk_id) from tperesel where fK_pacid = TKARTA.FK_ID)))
      AND TPERESEL.FK_DOCOBSLID = TDOCOBSL.FK_ID
      AND TDOCOBSL.FK_VIDDOCID NOT IN (SELECT FK_ID
                                   FROM TUSLVID
                                   START WITH FK_ID IN (SELECT FN_CONST
                                                        FROM TCONST
                                                        WHERE FC_FUNC = 'DOC_IBDS_STAC' OR FC_FUNC = 'DOC_IB_DS')
                                   CONNECT BY PRIOR FK_ID = FK_OWNERID)



   ) group by FK_SMID, fn_value, FK_PACID; --, fk_id;



  CURSOR cCount IS
   SELECT COUNT(*) fn_count, FK_SMID, fn_value FROM
   (
   SELECT distinct TNAZAN.FK_ID, TNAZAN.FK_PACID, tmp_numbers2.FN_VALUE FK_SMID, tmp_numbers.fn_value
    FROM TNAZAN, TAMBULANCE, TSOTR, tmp_numbers, tmp_numbers2, tnazopl,
         (SELECT FK_ID FROM TSMID
          WHERE FK_OWNER IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = 'NAZN_TYPES')
                             AND FL_SHOWPRINT = 1
                             and (case when fk_id = p3 and p3 > 0 then 1 when p3 = 0 then 1 else 0 end) = 1) TTYPE

    WHERE (CASE WHEN p4 = 0 THEN 1 WHEN p4 = 1 THEN 1 ELSE 0 END) = 1
      AND (case when nBrakId = -1 and FK_NAZSOSID = GET_VIPNAZ then 1 when nBrakId = 0 and FK_NAZSOSID = get_naz_cancel then 1 when nBrakId > 0 and FK_NAZCAUSEID = nBrakId then 1 else 0 end) = 1
      AND TNAZAN.FK_ID = TNAZOPL.FK_NAZID
      AND (case when pFK_USE_SOTRID = 0 then 1 when pFK_USE_SOTRID = TNAZAN.FK_VRACHID then 1 else 0 end) = 1
      AND (CASE WHEN pNazOplType = 0 THEN 1 WHEN pNazOplType = FK_SMID_TAL_OPL THEN 1 ELSE 0 END) = 1
--      AND FK_NAZSOSID = GET_VIPNAZ
      AND FD_RUN BETWEEN TRUNC(pFD_DATE1) AND TRUNC(pFD_DATE2)+1-1/(24*60*60)
      AND TNAZAN.FK_SMID IN (SELECT FK_SMID FROM asu.TLAB_REPORT_SMID START WITH FK_ID = tmp_numbers2.FN_VALUE CONNECT BY PRIOR FK_ID = FK_OWNER)
--      AND tresan.FK_SMID = TSELSMID.FK_SMID
      AND TAMBULANCE.FK_ID = TNAZAN.FK_PACID
      AND TNAZAN.FK_NAZTYPEID = TTYPE.FK_ID
      AND TNAZAN.FK_VRACHID = TSOTR.FK_ID
      AND FK_OTDELID IN (SELECT FK_ID FROM LOGIN.TOTDEL START WITH FK_ID = tmp_numbers.FN_VALUE CONNECT BY PRIOR FK_ID = FK_OWNERID)
   UNION ALL
   SELECT distinct TNAZAN.FK_ID, TNAZAN.FK_PACID, tmp_numbers2.fn_value FK_SMID, GET_REANIM(TNAZAN.FK_PACID, TNAZAN.FD_RUN, tmp_numbers.fn_value) fn_value
    FROM TNAZAN, TKARTA, TPERESEL, TROOM, TDOCOBSL, tmp_numbers, tmp_numbers2, TNAZOPL,
         (SELECT FK_ID FROM TSMID
          WHERE FK_OWNER IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = 'NAZN_TYPES')
                            AND FL_SHOWPRINT = 1
                            and (case when fk_id = p3 and p3 > 0 then 1 when p3 = 0 then 1 else 0 end) = 1) TTYPE
    WHERE (CASE WHEN p4 = 0 THEN 1 WHEN p4 = 1 THEN 1 ELSE 0 END) = 1
      AND (case when nBrakId = -1 and FK_NAZSOSID = GET_VIPNAZ then 1 when nBrakId = 0 and FK_NAZSOSID = get_naz_cancel then 1 when nBrakId > 0 and FK_NAZCAUSEID = nBrakId then 1 else 0 end) = 1
      AND TNAZAN.FK_ID = TNAZOPL.FK_NAZID
      AND (case when pFK_USE_SOTRID = 0 then 1 when pFK_USE_SOTRID = TNAZAN.FK_VRACHID then 1 else 0 end) = 1
      AND (CASE WHEN pNazOplType = 0 THEN 1 WHEN pNazOplType = FK_SMID_TAL_OPL THEN 1 ELSE 0 END) = 1
--      AND FK_NAZSOSID = GET_VIPNAZ
      AND FD_RUN BETWEEN TRUNC(pFD_DATE1) AND TRUNC(pFD_DATE2)+1-1/(24*60*60)
      AND TNAZAN.FK_SMID IN (SELECT FK_SMID FROM asu.TLAB_REPORT_SMID START WITH FK_ID = tmp_numbers2.FN_VALUE CONNECT BY PRIOR FK_ID = FK_OWNER)
      AND TKARTA.FK_ID = TNAZAN.FK_PACID
      AND TNAZAN.FK_NAZTYPEID = TTYPE.FK_ID
      AND TROOM.FK_OTDELID IN (SELECT FK_ID FROM LOGIN.TOTDEL START WITH FK_ID = tmp_numbers.FN_VALUE CONNECT BY PRIOR FK_ID = FK_OWNERID)
      AND TROOM.FK_ID = TPERESEL.FK_PALATAID
      AND TPERESEL.FK_PACID = TKARTA.FK_ID
      AND ((TNAZAN.FD_RUN BETWEEN TPERESEL.FD_DATA1 AND TPERESEL.FD_DATA2)
           or (TPERESEL.FD_DATA1 <= TNAZAN.FD_RUN and TPERESEL.FK_ID = (select max(fk_id) from tperesel where fK_pacid = TKARTA.FK_ID)))
      AND TPERESEL.FK_DOCOBSLID = TDOCOBSL.FK_ID
      AND TDOCOBSL.FK_VIDDOCID  IN (SELECT FK_ID
                                       FROM TUSLVID
                                       START WITH FK_ID IN (SELECT FN_CONST
                                                            FROM TCONST
                                                            WHERE FC_FUNC = 'DOC_IBDS_STAC' OR FC_FUNC = 'DOC_IB_DS')
                                       CONNECT BY PRIOR FK_ID = FK_OWNERID)
   UNION ALL
   SELECT distinct TNAZAN.FK_ID, TNAZAN.FK_PACID, tmp_numbers2.fn_value FK_SMID, GET_REANIM(TNAZAN.FK_PACID, TNAZAN.FD_RUN, tmp_numbers.fn_value) fn_value
    FROM TNAZAN, TKARTA, TPERESEL, TROOM, TDOCOBSL, tmp_numbers, tmp_numbers2, tnazopl,
         (SELECT FK_ID FROM TSMID
          WHERE FK_OWNER IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = 'NAZN_TYPES')
                            AND FL_SHOWPRINT = 1
                            and (case when fk_id = p3 and p3 > 0 then 1 when p3 = 0 then 1 else 0 end) = 1) TTYPE
    WHERE (CASE WHEN p4 = 0 THEN 1 WHEN p4 = 2 THEN 1 ELSE 0 END) = 1
      AND (case when nBrakId = -1 and FK_NAZSOSID = GET_VIPNAZ then 1 when nBrakId = 0 and FK_NAZSOSID = get_naz_cancel then 1 when nBrakId > 0 and FK_NAZCAUSEID = nBrakId then 1 else 0 end) = 1
      AND TNAZAN.FK_ID = TNAZOPL.FK_NAZID
      AND (case when pFK_USE_SOTRID = 0 then 1 when pFK_USE_SOTRID = TNAZAN.FK_VRACHID then 1 else 0 end) = 1
      AND (CASE WHEN pNazOplType = 0 THEN 1 WHEN pNazOplType = FK_SMID_TAL_OPL THEN 1 ELSE 0 END) = 1
--      AND FK_NAZSOSID = GET_VIPNAZ
      AND FD_RUN BETWEEN TRUNC(pFD_DATE1) AND TRUNC(pFD_DATE2)+1-1/(24*60*60)
      AND TNAZAN.FK_SMID IN (SELECT FK_SMID FROM asu.TLAB_REPORT_SMID START WITH FK_ID = tmp_numbers2.FN_VALUE CONNECT BY PRIOR FK_ID = FK_OWNER)
      AND TKARTA.FK_ID = TNAZAN.FK_PACID
      AND TNAZAN.FK_NAZTYPEID = TTYPE.FK_ID
      AND TROOM.FK_OTDELID IN (SELECT FK_ID FROM LOGIN.TOTDEL START WITH FK_ID = tmp_numbers.FN_VALUE CONNECT BY PRIOR FK_ID = FK_OWNERID)
      AND TROOM.FK_ID = TPERESEL.FK_PALATAID
      AND TPERESEL.FK_PACID = TKARTA.FK_ID
      AND ((TNAZAN.FD_RUN BETWEEN TPERESEL.FD_DATA1 AND TPERESEL.FD_DATA2)
           or (TPERESEL.FD_DATA1 <= TNAZAN.FD_RUN and TPERESEL.FK_ID = (select max(fk_id) from tperesel where fK_pacid = TKARTA.FK_ID)))
      AND TPERESEL.FK_DOCOBSLID = TDOCOBSL.FK_ID
      AND TDOCOBSL.FK_VIDDOCID NOT IN (SELECT FK_ID
                                   FROM TUSLVID
                                   START WITH FK_ID IN (SELECT FN_CONST
                                                        FROM TCONST
                                                        WHERE FC_FUNC = 'DOC_IBDS_STAC' OR FC_FUNC = 'DOC_IB_DS')
                                   CONNECT BY PRIOR FK_ID = FK_OWNERID)



   ) group by FK_SMID, fn_value; --, fk_id;

    clTemp  CLOB;
    sHtml   LONG;
    nTemp   BINARY_INTEGER := 0;
    nTSum   BINARY_INTEGER := 0;
    nSum    TNUMBERS;
    nSum1   TNUMBERS;
    nValues   TNUMBERS;
    nSmids   TNUMBERS;
    nOtdels   TNUMBERS;
    nPacIds TNUMBERS;
    i number;
    nCountNazanByOtdel TARRAYS;
    sTemp VARCHAR (50);
    nNum NUMBER;
    sNazanType Varchar2(50);
    sPacType Varchar2(50);
    nCountPeople Number;
    nCountOtdel Number := nCountColHead;
    nStartOtdel Number := 1;
    bEmptyRow Boolean;
    nSmid NUMBER;
    nOtdel NUMBER;
    nCount NUMBER;
    isFind Boolean;
    pNazName VARCHAR2(100);
    sOplType VARCHAR2(100);
    sSotrFio VARCHAR2(255);

  begin
    DBMS_LOB.CREATETEMPORARY(clTemp, FALSE);
    sHtml := PKG_HTML.GET_HEAD('word','GetRepByGROUP5 "' ||PKG_SMINI.READSTRING('CONFIG','S_NAME','Не известен')||'"',
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
    sHtml := sHtml||'<P align=center><B>' || Login.get_sotr_otdelname(pFK_SOTRID) ||  '</P>'||CHR(13);

    if pFD_DATE1 = pFD_DATE2 then
      sHtml := sHtml||'<P align=center><B>Отчет о количестве выполненных исследований<BR>за '||TO_CHAR(pFD_DATE1,'dd.mm.yyyy')||'</P>'||CHR(13);
    else
      sHtml := sHtml||'<P align=center><B>Отчет о количестве выполненных исследований<BR>за период с '||TO_CHAR(pFD_DATE1,'dd.mm.yyyy')||' по '||TO_CHAR(pFD_DATE2,'dd.mm.yyyy')||'</P>'||CHR(13);
    end if;

    if (p2.COUNT <= nCountOtdel) then
      nCountOtdel := p2.COUNT;
    end if;

    for p in 1..p2.COUNT loop
     nSum1(p) := 0;
    end loop;

    OPEN cNazanType(p3);
    FETCH cNazanType INTO sNazanType;
    CLOSE cNazanType;
      sHtml := sHtml||'<P align=center>Тип назначения - '||sNazanType||'</P>'||CHR(13);

    OPEN cPacType(p4);
    FETCH cPacType INTO sPacType;
    CLOSE cPacType;


    sHtml := sHtml||'<P align=center>Пациенты - '||sPacType||'</P>'||CHR(13);

   if pNazOplType > 0 then
        OPEN cOplType;
        FETCH cOplType INTO sOplType;
        CLOSE cOplType;
        sHtml := sHtml||'<P align=center>Тип оплаты - '||sOplType||'</P>'||CHR(13);
    end if;

   if pFK_USE_SOTRID > 0 then
        OPEN cSotr;
        FETCH cSotr INTO sSotrFio;
        CLOSE cSotr;
        sHtml := sHtml||'<P align=center>Назначенные сотрудником - '||sSotrFio||'</P>'||CHR(13);
    end if;
    sHtml := sHtml||'<BR>'||chr(13);

    DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);

    delete from tmp_numbers2;
    delete from tmp_numbers;

    for p in 1..p1.COUNT loop
        INSERT INTO tmp_numbers2(FN_VALUE) VALUES (p1(p));
    END LOOP;
    for p in 1..p2.COUNT loop
        if p2(p) = 20000 then
            delete from tmp_numbers;
            -- Begin Kashira для подсчета Всех отделений
            -- insert into tmp_numbers select fk_id from login.totdel;
            insert into tmp_numbers SELECT FK_ID
                                    FROM LOGIN.TOTDEL, ASU.tlab_report_otdel
                                    WHERE LOGIN.TOTDEL.FK_ID = ASU.tlab_report_otdel.FK_OTDELID
                                          AND FK_ID <> 20000
                                          AND FL_DEL = 0;
            -- End Кashira для подсчета Всех отделений                              
            exit;
        end if;
        INSERT INTO tmp_numbers(FN_VALUE) VALUES (p2(p));
    END LOOP;

--    sHtml := sHtml||'<P align=center>COUNT - '||p1(1) || ' - ' || p2(1) ||'</P><BR>'||CHR(13);

--    DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);
--    RETURN clTemp;
-- Begin Kashira для подсчета Всех отделений
/*
    FOR c IN IsReanim LOOP
        if c.FN_COUNT > 0 then
           for p in cSTAC loop
             INSERT INTO tmp_numbers(FN_VALUE) VALUES (p.FK_ID);
           end loop;
        END IF;
        EXIT;
    END LOOP;
*/    
-- End Kashira для подсчета Всех отделений    
    i := 1;
    isFind := False;
    if(isTotalPatient = 1) then
      for k in cCountPatient LOOP
        nSmids(i) :=  k.FK_SMID;
        nOtdels(i) := k.FN_VALUE;
        nPacIds(i) := k.FK_PACID;
        nValues(i) := k.FN_COUNT;
        i := i + 1;
      end loop;
    else
      for k in cCount LOOP
        nSmids(i) :=  k.FK_SMID;
        nOtdels(i) := k.FN_VALUE;
        nValues(i) := k.FN_COUNT;
        i := i + 1;
      end loop;
    end if;

    for p in 1..p1.COUNT loop
     nSum(p) := 0;
     arrayCountPeople(p)(1) := 0;

      for n in 1..p2.COUNT loop
         nTemp := 0;
         if(isTotalPatient = 1) then
           for k in 1..nPACIDs.count loop
               if nSmids(k) = p1(p) and (nOtdels(k) = p2(n) or (p2(n) = 20000 )) then
                nTemp := nTemp + nValues(k);
                SetCountPacient(nPACIDs(k), p);
               end if;
           end loop;
         else
            for k in 1..nValues.count loop
               if nSmids(k) = p1(p) and (nOtdels(k) = p2(n) or (p2(n) = 20000 )) then
                nTemp := nTemp + nValues(k);
               end if;
            end loop;
         end if;

         nSum(p) := nSum(p) + nTemp;
         nSum1(n) := nSum1(n) + nTemp;
         nCountNazanByOtdel(p)(n) := nTemp;

      end loop;

    end loop;
--    Close cCount;
    LOOP

    sHtml :=
         '<TABLE >'||CHR(13)||
         ' <TR>'||CHR(13)||
         '  <TD><P class=user>№</P></TD>'||CHR(13)||
         '  <TD> <P class=user>Название назначения</P></TD>'||CHR(13);

    for p in nStartOtdel..nCountOtdel loop
       sHtml := sHtml || '  <TD><P class=user>'||LOGIN.GET_OTDELNAME(p2(p))||'</P></TD>'||CHR(13);
    end loop;
    if (nCountOtdel >= p2.COUNT) then
    if(isTotalPatient = 1) then
      sHtml := sHtml || '  <TD ><P class=user>Всего назначений</P></TD>'||CHR(13);
      sHtml := sHtml || '  <TD ><P class=user>Всего пациентов</TD>'||CHR(13)||'</P></TR>'||CHR(13);
    else
      sHtml := sHtml || '  <TD ><P class=user>Всего</P></TD>'||CHR(13)||'  </TR>'||CHR(13);
    end if;
    end if;
    DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);
    nNum := 0;
    arrayCountPeople(p1.COUNT+1)(1) := 0;
    for p in 1..p1.COUNT loop
      nCountPeople := 0;
      bEmptyRow := FALSE;
      nNum := nNum + 1;
      open cNazName  (p1(p));
      fetch cNazName into pNazName;
      close cNazName;

      sHtml := ' <TR>'||CHR(13)|| '  <TD><P class=user>'||nNum||'</P></TD>'||CHR(13)|| '  <TD style=''text-align:left; width:30%''><P class=user>'||pNazName||' </P></TD>'||CHR(13);

      for n in nStartOtdel..nCountOtdel loop
        sHtml := sHtml ||'  <TD ><P class=user>'|| PKG_R_ALLFUNC.RETURN_VALUE(nCountNazanByOtdel(p)(n))||'</P></TD>'||CHR(13);
      end loop;

      if(nSum(p) <= 0) then
        nNum := nNum - 1;
        sHtml := '';
        bEmptyRow := TRUE;
      end if;

    if(not bEmptyRow) then
    if (nCountOtdel >= p2.COUNT) then
    sHtml := sHtml ||'  <TD ><P class=user>'|| PKG_R_ALLFUNC.RETURN_VALUE(nSum(p)) ||'</P></TD>'||CHR(13);
    end if;
    if(isTotalPatient = 1) then
      for l in 1..arrayCountPeople(p).COUNT loop
         if(arrayCountPeople(p)(l) > 0) then
           nCountPeople := nCountPeople + 1;
           SetCountPacient(arrayCountPeople(p)(l), p1.COUNT+1);
         end if;
      end loop;
      if (nCountOtdel >= p2.COUNT) then
      sHtml := sHtml ||'  <TD><P class=user>'|| PKG_R_ALLFUNC.RETURN_VALUE(nCountPeople) ||'</P></TD>'||CHR(13)||'</TR>'||CHR(13);
      else
       sHtml := sHtml ||'</TR>'||CHR(13);
      end if;
    end if;
    sHtml := sHtml ||' </TR>'||CHR(13);
    DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);
    end if;
    end loop;

    sHtml := ' <TR>'||CHR(13)||'  <TD colspan=2 class=user>ИТОГО:</TD>'||CHR(13);
    for n in nStartOtdel..nCountOtdel loop
      sHtml := sHtml ||'  <TD >'|| TO_CHAR(nSum1(n)) ||'</TD>'||CHR(13);
      nTSum:=nTSum + nSum1(n);
    end loop;

    if (nCountOtdel >= p2.COUNT) then
    if(isTotalPatient = 1) then
      sHtml := sHtml ||'  <TD >'|| TO_CHAR(nTSum) ||'</TD>'||CHR(13);
      sHtml := sHtml ||'  <TD >'|| TO_CHAR(arrayCountPeople(p1.COUNT+1).COUNT - 1) ||'</TD>'||CHR(13)||'</TR>'||CHR(13);
    else
      sHtml := sHtml ||'  <TD >'|| TO_CHAR(nTSum) ||'</TD>'||CHR(13)||'</TR>'||CHR(13);
    end if;
    end if;
    sHtml := sHtml || '</TABLE>'||CHR(13)||'<BR><BR>';
    DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);

    EXIT WHEN (nCountOtdel >= p2.COUNT);
    nCountOtdel := nCountOtdel + nCountColHead;
    nStartOtdel := nStartOtdel + nCountColHead;
    if (nCountOtdel > p2.COUNT) then
      nCountOtdel := p2.COUNT;
    end if;
    end loop;

    sHtml := '<BR><P><B>Отчет составил: _________________________'||LOGIN.GET_SOTRNAME(pFK_SOTRID)||'</B></P>'||CHR(13)||'</DIV></BODY></HTML>';
    DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);
    arrayCountPeople := arrayEmpty_table;
    RETURN clTemp;
  end;

/*  CURSOR cNazanType(p3 IN NUMBER) IS
   SELECT FC_NAME FROM (
                  SELECT FK_ID, FC_NAME FROM TSMID
                    WHERE FK_OWNER IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = 'NAZN_TYPES')
                      AND FL_SHOWPRINT = 1
                  UNION
                  SELECT 0, 'ВСЕ' FROM DUAL
                  )
   WHERE FK_ID = p3;

   CURSOR cPacType(p4 IN NUMBER) IS
   SELECT FC_NAME FROM
   (
     SELECT 0 FK_ID, 'Амбулаторные' FC_NAME FROM DUAL
     UNION
     SELECT 1 FK_ID, 'Стационарные' FC_NAME FROM DUAL
     UNION
     SELECT 2 FK_ID, 'ВСЕ' FC_NAME FROM DUAL
   )dbms_output.put_line('');
   WHERE FK_ID = p4;
    CURSOR cNazName(p IN NUMBER) Is SELECT FC_NAME FROM tlab_report_smid WHERE FK_ID = p;
   CURSOR cCountPatient(p1 IN BINARY_INTEGER, p2 IN BINARY_INTEGER, p3 IN NUMBER, p4 IN NUMBER) IS

   -- Aiaoeaoi?iua. Ioaaeaiea aa?aony ii a?a?o, auiieieaoaio iacia?aiea
   SELECT TNAZAN.FK_PACID
    FROM TNAZAN, TAMBULANCE, TSOTR, (SELECT FK_ID FROM TSMID
                                     WHERE FK_OWNER IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = 'NAZN_TYPES')
                                           AND FL_SHOWPRINT = 1
                                           and (case when fk_id = p3 and p3 > 0 then 1 when p3 = 0 then 1 else 0 end) = 1) TTYPE
    WHERE TNAZAN.FK_SMID IN (p2)
      AND TNAZAN.FK_NAZTYPEID = TTYPE.FK_ID
      AND FK_NAZSOSID = GET_VIPNAZ
      AND FD_RUN BETWEEN TRUNC(pFD_DATE1) AND TRUNC(pFD_DATE2)+1-1/(24*60*60)
      AND TAMBULANCE.FK_ID = TNAZAN.FK_PACID
      AND (CASE WHEN p4 = 0 THEN 1 WHEN p4 = 2 THEN 1 ELSE 0 END) = 1
      AND TNAZAN.FK_VRACHID = TSOTR.FK_ID
      AND FK_OTDELID in (p1)
   UNION ALL
   SELECT TNAZAN.FK_PACID
    FROM TNAZAN, TKARTA, (SELECT FK_ID FROM TSMID
                                     WHERE FK_OWNER IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = 'NAZN_TYPES')
                                           AND FL_SHOWPRINT = 1
                                           and (case when fk_id = p3 and p3 > 0 then 1 when p3 = 0 then 1 else 0 end) = 1) TTYPE
    WHERE TNAZAN.FK_SMID IN (p2)
      AND TNAZAN.FK_NAZTYPEID = TTYPE.FK_ID
      AND FK_NAZSOSID = GET_VIPNAZ
      AND FD_RUN BETWEEN TRUNC(pFD_DATE1) AND TRUNC(pFD_DATE2)+1-1/(24*60*60)
      AND TKARTA.FK_ID = TNAZAN.FK_PACID
      AND (CASE WHEN p4 = 0 THEN 1 WHEN p4 = 2 THEN 1 ELSE 0 END) = 1
      AND  EXISTS (SELECT FK_PACID
                   FROM TPERESEL, TROOM
                   WHERE TROOM.FK_OTDELID IN (p1)
                         AND TROOM.FK_ID = TPERESEL.FK_PALATAID
                         AND TPERESEL.FK_ID = (SELECT MAX(TPERESEL.FK_ID)
                                               FROM TPERESEL, TDOCOBSL
                                               WHERE FK_PACID = TKARTA.FK_ID
                                                     AND FK_DOCOBSLID = TDOCOBSL.FK_ID
                                                     AND TDOCOBSL.FK_VIDDOCID IN (SELECT FK_ID
                                                                                  FROM TUSLVID
                                                                                  START WITH FK_ID IN (SELECT FN_CONST
                                                                                                       FROM TCONST
                                                                                                       WHERE FC_FUNC = 'DOC_IBDS_STAC' OR FC_FUNC = 'DOC_IB_DS')
                                                                                  CONNECT BY PRIOR FK_ID = FK_OWNERID)))
   UNION ALL
   SELECT TNAZAN.FK_PACID
    FROM TNAZAN, TKARTA,  (SELECT FK_ID FROM TSMID
                           WHERE FK_OWNER IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = 'NAZN_TYPES')
                                 AND FL_SHOWPRINT = 1
                                 and (case when fk_id = p3 and p3 > 0 then 1 when p3 = 0 then 1 else 0 end) = 1) TTYPE
    WHERE TNAZAN.FK_SMID in (p2)
      AND TNAZAN.FK_NAZTYPEID = TTYPE.FK_ID
      AND FK_NAZSOSID = GET_VIPNAZ
      AND FD_RUN BETWEEN TRUNC(pFD_DATE1) AND TRUNC(pFD_DATE2)+1-1/(24*60*60)
      AND TKARTA.FK_ID = TNAZAN.FK_PACID
      AND (CASE WHEN p4 = 1 THEN 1 WHEN p4 = 2 THEN 1 ELSE 0 END) = 1
      AND  EXISTS (SELECT FK_PACID
                   FROM TPERESEL, TROOM
                   WHERE TROOM.FK_OTDELID IN (p1)
                         AND TROOM.FK_ID = TPERESEL.FK_PALATAID
                         AND TPERESEL.FK_ID = (SELECT MAX(TPERESEL.FK_ID)
                                               FROM TPERESEL, TDOCOBSL
                                               WHERE FK_PACID = TKARTA.FK_ID
                                                     AND FK_DOCOBSLID = TDOCOBSL.FK_ID
                                                     AND TDOCOBSL.FK_VIDDOCID NOT IN (SELECT FK_ID
                                                                                      FROM TUSLVID
                                                                                      START WITH FK_ID IN (SELECT FN_CONST
                                                                                                           FROM TCONST
                                                                                                           WHERE FC_FUNC = 'DOC_IBDS_STAC' OR FC_FUNC = 'DOC_IB_DS')
                                                                                      CONNECT BY PRIOR FK_ID = FK_OWNERID)));


  CURSOR cCount(p1 IN BINARY_INTEGER, p2 IN BINARY_INTEGER, p3 IN NUMBER, p4 IN NUMBER) IS
  select count(*) FROM
  (SELECT TNAZAN.FK_ID
    FROM TNAZAN, TAMBULANCE, TSOTR, tresan, (SELECT FK_ID FROM TSMID
                                     WHERE FK_OWNER IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = 'NAZN_TYPES')
                                           AND FL_SHOWPRINT = 1
                                           and (case when fk_id = p3 and p3 > 0 then 1 when p3 = 0 then 1 else 0 end) = 1) TTYPE
    WHERE (CASE WHEN p4 = 0 THEN 1 WHEN p4 = 2 THEN 1 ELSE 0 END) = 1
      AND FK_NAZSOSID = GET_VIPNAZ
      AND FD_RUN BETWEEN TRUNC(pFD_DATE1) AND TRUNC(pFD_DATE2)+1-1/(24*60*60)
      AND tresan.FK_NAZID = tnazan.fk_id
      AND tresan.FK_SMID in (SELECT FK_SMID FROM asu.TLAB_REPORT_SMID START WITH FK_ID = p2 CONNECT BY PRIOR FK_ID = FK_OWNER)
      AND TAMBULANCE.FK_ID = TNAZAN.FK_PACID
      AND TNAZAN.FK_NAZTYPEID = TTYPE.FK_ID
      AND TNAZAN.FK_VRACHID = TSOTR.FK_ID
      AND FK_OTDELID in (SELECT FK_ID FROM LOGIN.TOTDEL START WITH FK_ID = p1 CONNECT BY PRIOR FK_ID = FK_OWNERID)
   UNION ALL
   SELECT TNAZAN.FK_ID --, TNAZAN.FK_PACID, TNAZAN.FK_SMID --, GET_REANIM(TNAZAN.FK_PACID, TNAZAN.FD_RUN, tmp_numbers.fn_value) fn_value
    FROM TNAZAN, TKARTA, TPERESEL, TROOM, TDOCOBSL, tresan,
         (SELECT FK_ID FROM TSMID
          WHERE FK_OWNER IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = 'NAZN_TYPES')
                            AND FL_SHOWPRINT = 1
                            and (case when fk_id = p3 and p3 > 0 then 1 when p3 = 0 then 1 else 0 end) = 1) TTYPE
    WHERE (CASE WHEN p4 = 0 THEN 1 WHEN p4 = 2 THEN 1 ELSE 0 END) = 1
      AND FK_NAZSOSID = GET_VIPNAZ
      AND FD_RUN BETWEEN TRUNC(pFD_DATE1) AND TRUNC(pFD_DATE2)+1-1/(24*60*60)
      AND tresan.FK_NAZID = tnazan.fk_id
      AND tresan.FK_SMID in (SELECT FK_SMID FROM asu.TLAB_REPORT_SMID START WITH FK_ID = p2 CONNECT BY PRIOR FK_ID = FK_OWNER)
      AND TKARTA.FK_ID = TNAZAN.FK_PACID
      AND TNAZAN.FK_NAZTYPEID = TTYPE.FK_ID
      AND TROOM.FK_OTDELID in (SELECT FK_ID FROM LOGIN.TOTDEL START WITH FK_ID = p1 CONNECT BY PRIOR FK_ID = FK_OWNERID)
      AND TROOM.FK_ID = TPERESEL.FK_PALATAID
      AND TPERESEL.FK_PACID = TKARTA.FK_ID
      AND ((TNAZAN.FD_RUN BETWEEN TPERESEL.FD_DATA1 AND TPERESEL.FD_DATA2)
           or (TPERESEL.FD_DATA1 <= TNAZAN.FD_RUN and TPERESEL.FK_ID = (select max(fk_id) from tperesel where fK_pacid = TKARTA.FK_ID)))
      AND TPERESEL.FK_DOCOBSLID = TDOCOBSL.FK_ID
      AND TDOCOBSL.FK_VIDDOCID  IN (SELECT FK_ID
                                       FROM TUSLVID
                                       START WITH FK_ID IN (SELECT FN_CONST
                                                            FROM TCONST
                                                            WHERE FC_FUNC = 'DOC_IBDS_STAC' OR FC_FUNC = 'DOC_IB_DS')
                                       CONNECT BY PRIOR FK_ID = FK_OWNERID)
   UNION ALL
   SELECT TNAZAN.FK_ID --, TNAZAN.FK_PACID, TNAZAN.FK_SMID --, GET_REANIM(TNAZAN.FK_PACID, TNAZAN.FD_RUN, tmp_numbers.fn_value) fn_value
    FROM TNAZAN, TKARTA, TPERESEL, TROOM, TDOCOBSL, tresan,
         (SELECT FK_ID FROM TSMID
          WHERE FK_OWNER IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = 'NAZN_TYPES')
                            AND FL_SHOWPRINT = 1
                            and (case when fk_id = p3 and p3 > 0 then 1 when p3 = 0 then 1 else 0 end) = 1) TTYPE
    WHERE (CASE WHEN p4 = 1 THEN 1 WHEN p4 = 2 THEN 1 ELSE 0 END) = 1
      AND FK_NAZSOSID = GET_VIPNAZ
      AND FD_RUN BETWEEN TRUNC(pFD_DATE1) AND TRUNC(pFD_DATE2)+1-1/(24*60*60)
      AND tresan.FK_NAZID = tnazan.fk_id
      AND tresan.FK_SMID in (SELECT FK_SMID FROM asu.TLAB_REPORT_SMID START WITH FK_ID = p2 CONNECT BY PRIOR FK_ID = FK_OWNER)
      AND TKARTA.FK_ID = TNAZAN.FK_PACID
      AND TNAZAN.FK_NAZTYPEID = TTYPE.FK_ID
      AND TROOM.FK_OTDELID in (SELECT FK_ID FROM LOGIN.TOTDEL START WITH FK_ID = p1 CONNECT BY PRIOR FK_ID = FK_OWNERID)
      AND TROOM.FK_ID = TPERESEL.FK_PALATAID
      AND TPERESEL.FK_PACID = TKARTA.FK_ID
      AND ((TNAZAN.FD_RUN BETWEEN TPERESEL.FD_DATA1 AND TPERESEL.FD_DATA2)
           or (TPERESEL.FD_DATA1 <= TNAZAN.FD_RUN and TPERESEL.FK_ID = (select max(fk_id) from tperesel where fK_pacid = TKARTA.FK_ID)))
      AND TPERESEL.FK_DOCOBSLID = TDOCOBSL.FK_ID
      AND TDOCOBSL.FK_VIDDOCID NOT IN (SELECT FK_ID
                                   FROM TUSLVID
                                   START WITH FK_ID IN (SELECT FN_CONST
                                                        FROM TCONST
                                                        WHERE FC_FUNC = 'DOC_IBDS_STAC' OR FC_FUNC = 'DOC_IB_DS')
                                   CONNECT BY PRIOR FK_ID = FK_OWNERID));
   -- group by FK_SMID; --, fn_value; --, fk_id;


    clTemp  CLOB;
    sHtml   LONG;
    nTemp   BINARY_INTEGER := 0;
    nTSum   BINARY_INTEGER := 0;
    nSum    TNUMBERS;
    nSum1   TNUMBERS;
    nCountNazanByOtdel TARRAYS;
    sTemp VARCHAR (50);
    nNum NUMBER;
    sNazanType Varchar2(50);
    sPacType Varchar2(50);
    nCountPeople Number;
    nCountOtdel Number := nCountColHead;
    nStartOtdel Number := 1;
    bEmptyRow Boolean;
    pNazName varchar2(100);
  begin
    DBMS_LOB.CREATETEMPORARY(clTemp, FALSE);
    sHtml := PKG_HTML.GET_HEAD('word','GetRepByGROUP6 "' ||PKG_SMINI.READSTRING('CONFIG','S_NAME','Не известен')||'"',
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
    sHtml := sHtml||'<P align=center><B>' || Login.get_sotr_otdelname(pFK_SOTRID) ||  '.</P>'||CHR(13);

    if pFD_DATE1 = pFD_DATE2 then
      sHtml := sHtml||'<P align=center><B>Отчет о количестве выполненных исследований<BR>за '||TO_CHAR(pFD_DATE1,'dd.mm.yyyy')||'</P>'||CHR(13);
    else
      sHtml := sHtml||'<P align=center><B>Отчет о количестве выполненных исследований<BR>за период с '||TO_CHAR(pFD_DATE1,'dd.mm.yyyy')||' по '||TO_CHAR(pFD_DATE2,'dd.mm.yyyy')||'</P>'||CHR(13);
    end if;

    if (p2.COUNT <= nCountOtdel) then
      nCountOtdel := p2.COUNT;
    end if;

    for p in 1..p2.COUNT loop
     nSum1(p) := 0;
    end loop;

    OPEN cNazanType(p3);
    FETCH cNazanType INTO sNazanType;
    CLOSE cNazanType;
      sHtml := sHtml||'<P align=center>Тип назначения - '||sNazanType||'</P>'||CHR(13);

    OPEN cPacType(p4);
    FETCH cPacType INTO sPacType;
    CLOSE cPacType;
      sHtml := sHtml||'<P align=center>Пациенты - '||sPacType||'</P><BR>'||CHR(13);

    DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);

    for p in 1..p1.COUNT loop
     nSum(p) := 0;
     arrayCountPeople(p)(1) := 0;

      for n in 1..p2.COUNT loop
         nTemp := 0;
         if(isTotalPatient = 1) then
           for c in cCountPatient(p2(n),p1(p),p3,p4) loop
             nTemp := nTemp + 1;
             SetCountPacient(c.FK_PACID, p);
           end loop;
         else
       --      sHtml := '<P align=center>Iaoeaiou - '||to_char(p2(n)) || ' '|| to_char(p1(p))||'</P><BR>'||CHR(13);
       --      DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);
       --      return clTemp ;

           open cCount(p2(n),p1(p),p3,p4);
           fetch cCount into nTemp;
           close cCount;

         end if;

         nSum(p) := nSum(p) + nTemp;
         nSum1(n) := nSum1(n) + nTemp;
         nCountNazanByOtdel(p)(n) := nTemp;


    --     sHtml := '<P align=center>Iaoeaiou - '||to_char(nSum(p)) || ' '|| to_char(nSum1(n)) || ' '|| to_char(nCountNazanByOtdel(p)(n))||'</P><BR>'||CHR(13);
    --     DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);
    --     return clTemp ;
      end loop;

    end loop;

    LOOP

    sHtml :=
         '<TABLE >'||CHR(13)||
         ' <TR>'||CHR(13)||
         '  <TD><P class=user>№</P></TD>'||CHR(13)||
         '  <TD> <P class=user>Название назначения</P></TD>'||CHR(13);

    for p in nStartOtdel..nCountOtdel loop
       sHtml := sHtml || '  <TD><P class=user>'||LOGIN.GET_OTDELNAME(p2(p))||'</P></TD>'||CHR(13);
    end loop;
    if (nCountOtdel >= p2.COUNT) then
    if(isTotalPatient = 1) then
      sHtml := sHtml || '  <TD ><P class=user>Всего назначений</P></TD>'||CHR(13);
      sHtml := sHtml || '  <TD ><P class=user>Всего пациентов</TD>'||CHR(13)||'</P></TR>'||CHR(13);
    else
      sHtml := sHtml || '  <TD ><P class=user>Всего</P></TD>'||CHR(13)||'  </TR>'||CHR(13);
    end if;
    end if;
    DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);
    nNum := 0;
    arrayCountPeople(p1.COUNT+1)(1) := 0;
    for p in 1..p1.COUNT loop
      nCountPeople := 0;
      bEmptyRow := FALSE;
      nNum := nNum + 1;
      open cNazName  (p1(p));
      fetch cNazName into pNazName;
      close cNazName;
      sHtml := ' <TR>'||CHR(13)|| '  <TD><P class=user>'||nNum||'</P></TD>'||CHR(13)|| '  <TD style=''text-align:left; width:30%''><P class=user>'||pNazName||' </P></TD>'||CHR(13);

      for n in nStartOtdel..nCountOtdel loop
        sHtml := sHtml ||'  <TD ><P class=user>'|| PKG_R_ALLFUNC.RETURN_VALUE(nCountNazanByOtdel(p)(n))||'</P></TD>'||CHR(13);
      end loop;

      if(nSum(p) <= 0) then
        nNum := nNum - 1;
        sHtml := '';
        bEmptyRow := TRUE;
      end if;

    if(not bEmptyRow) then
    if (nCountOtdel >= p2.COUNT) then
    sHtml := sHtml ||'  <TD ><P class=user>'|| PKG_R_ALLFUNC.RETURN_VALUE(nSum(p)) ||'</P></TD>'||CHR(13);
    end if;
    if(isTotalPatient = 1) then
      for l in 1..arrayCountPeople(p).COUNT loop
         if(arrayCountPeople(p)(l) > 0) then
           nCountPeople := nCountPeople + 1;
           SetCountPacient(arrayCountPeople(p)(l), p1.COUNT+1);
         end if;
      end loop;
      if (nCountOtdel >= p2.COUNT) then
      sHtml := sHtml ||'  <TD><P class=user>'|| PKG_R_ALLFUNC.RETURN_VALUE(nCountPeople) ||'</P></TD>'||CHR(13)||'</TR>'||CHR(13);
      else
       sHtml := sHtml ||'</TR>'||CHR(13);
      end if;
    end if;
    sHtml := sHtml ||' </TR>'||CHR(13);
    DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);
    end if;
    end loop;

    sHtml := ' <TR>'||CHR(13)||'  <TD colspan=2 class=user>ИТОГО:</TD>'||CHR(13);
    for n in nStartOtdel..nCountOtdel loop
      sHtml := sHtml ||'  <TD >'|| TO_CHAR(nSum1(n)) ||'</TD>'||CHR(13);
      nTSum:=nTSum + nSum1(n);
    end loop;

    if (nCountOtdel >= p2.COUNT) then
    if(isTotalPatient = 1) then
      sHtml := sHtml ||'  <TD >'|| TO_CHAR(nTSum) ||'</TD>'||CHR(13);
      sHtml := sHtml ||'  <TD >'|| TO_CHAR(arrayCountPeople(p1.COUNT+1).COUNT - 1) ||'</TD>'||CHR(13)||'</TR>'||CHR(13);
    else
      sHtml := sHtml ||'  <TD >'|| TO_CHAR(nTSum) ||'</TD>'||CHR(13)||'</TR>'||CHR(13);
    end if;
    end if;
    sHtml := sHtml || '</TABLE>'||CHR(13)||'<BR><BR>';
    DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);

    EXIT WHEN (nCountOtdel >= p2.COUNT);
    nCountOtdel := nCountOtdel + nCountColHead;
    nStartOtdel := nStartOtdel + nCountColHead;
    if (nCountOtdel > p2.COUNT) then
      nCountOtdel := p2.COUNT;
    end if;
    end loop;
    sHtml := '<BR><P><B>Отчет составил: _________________________'||LOGIN.GET_SOTRNAME(pFK_SOTRID)||'</B></P>'||CHR(13)||'</DIV></BODY></HTML>';
    DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);
    arrayCountPeople := arrayEmpty_table;
    RETURN clTemp;
 end;
 */
FUNCTION GetRepByGROUP7(pFK_OPLTYPE IN NUMBER, pFK_LPU IN NUMBER, pFK_SRTAH IN NUMBER, pFK_SOTRID IN BINARY_INTEGER, pFD_BEGIN IN DATE, pFD_END IN DATE) RETURN CLOB IS
    cursor cCount(pFK_SMID IN NUMBER) IS
        SELECT count(*), round(sum(get_cost(TNAZAN.FK_SMID, TNAZAN.FD_NAZ)), 2) FN_COST
        FROM ASU.TNAZAN, ASU.TNAZOPL
        WHERE FK_NAZSOSID = ASU.GET_VIPNAZ
              AND FD_RUN BETWEEN TRUNC(pFD_BEGIN) AND TRUNC(pFD_END)+1-1/(24*60*60)
              AND TNAZAN.FK_ID = TNAZOPL.FK_NAZID

              AND (CASE WHEN pFK_SRTAH = 0 THEN 1 WHEN GetPacStrah(FK_PACID) = pFK_SRTAH THEN 1 ELSE 0 END) = 1
              AND (CASE WHEN pFK_OPLTYPE = 0 THEN 1 WHEN FK_SMID_TAL_OPL = pFK_OPLTYPE THEN 1 ELSE 0 END) = 1
              AND (CASE WHEN pFK_LPU = 0 THEN 1 WHEN ASU.GET_NAPR_UCHR_ID(FK_PACID) = pFK_LPU THEN 1 ELSE 0 END) = 1
              AND (CASE WHEN pFK_SOTRID = 0 THEN 1 WHEN FK_ISPOLID = pFK_SOTRID THEN 1 ELSE 0 END) = 1
              AND EXISTS (SELECT FK_ID
                          FROM ASU.TSMID
                          WHERE TNAZAN.FK_SMID = TSMID.FK_ID
                          START WITH FK_ID = pFK_SMID
                          CONNECT BY PRIOR FK_ID = FK_OWNER);
    cursor cOtdel(pFK_SMID IN NUMBER) IS
        select FC_NAME
        FROM TSMID
        WHERE FK_OWNER = 1321
        START WITH FK_ID = pFK_SMID
        CONNECT BY PRIOR FK_OWNER = FK_ID;
    clTemp  CLOB;
    sHtml   LONG;
    p NUMBER;
    pSum TNUMBERS;
    pSumCost TNUMBERS;
    pOtdelName TSTRINGS;
    nSum NUMBER;
    nSumCost NUMBER(15);

    nSmid TNUMBERS;
    nNum NUMBER;
    bEmptyRow BOOLEAN;
  begin
    DBMS_LOB.CREATETEMPORARY(clTemp, FALSE);
    sHtml := PKG_HTML.GET_HEAD('word','GetRepByGROUP7 "' ||PKG_SMINI.READSTRING('CONFIG','S_NAME','Не известен')||'"',
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
    sHtml := sHtml||'<P align=center><B>' || Login.get_sotr_otdelname(pFK_SOTRID) ||  '.</P>'||CHR(13);

    if pFD_BEGIN = pFD_END then
      sHtml := sHtml||'<P align=center><B>Отчет о количестве выполненных исследований<BR>за '||TO_CHAR(pFD_BEGIN,'dd.mm.yyyy')||'</P>'||CHR(13);
    else
      sHtml := sHtml||'<P align=center><B>Отчет о количестве выполненных исследований<BR>за период с '||TO_CHAR(pFD_BEGIN,'dd.mm.yyyy')||' по '||TO_CHAR(pFD_END,'dd.mm.yyyy')||'</P>'||CHR(13);
    end if;


    DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);
    p := 1;
    nSum := 0;
    nSumCost := 0;
    for c in (select fn_value from asu.tmp_numbers) loop
         pSum(p) := 0;
         pSumCost(p) := 0;
         nSmid(p) := c.fn_value;
         open cCount(c.fn_value);
         FETCH cCount INTO pSum(p), pSumCost(p);
         close cCount;

         open cOtdel(c.fn_value);
         FETCH cOtdel INTO pOtdelName(p);
         close cOtdel;

         if pSum(p) is not null then
         nSum := nSum + pSum(p);
         end if;

         if pSumCost(p) is not null then
         nSumCost := nSumCost + pSumCost(p);
         end if;
         p := p + 1;
    end loop;
    sHtml :=
         '<TABLE >'||CHR(13)||
         ' <TR>'||CHR(13)||
         '  <TD><P class=user>№</P></TD>'||CHR(13)||
         '  <TD> <P class=user>Отделение</P></TD>'||CHR(13)||
         '  <TD> <P class=user>Название назначения</P></TD>'||CHR(13)||
         '  <TD> <P class=user>Количество</P></TD>'||CHR(13)||
         '  <TD> <P class=user>Стоимость</P></TD>'||CHR(13);

    DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);
    nNum := 0;

    for p in 1..nSmid.COUNT loop
      --bEmptyRow := FALSE;
      nNum := nNum + 1;
      sHtml := ' <TR>'||CHR(13)|| '  <TD><P class=user>'||nNum||'</P></TD>'||CHR(13)|| '  <TD style=''text-align:left; width:30%''><P class=user>'||pOtdelName(p)||' </P></TD>'||CHR(13) ||
               ' <TD style=''text-align:left; width:30%''><P class=user>'||GET_SMIDNAME(nSmid(p))||' </P></TD>'||CHR(13);

  /*    if(pSum(p) <= 0) then
        nNum := nNum - 1;
        sHtml := '';
 --       bEmptyRow := TRUE;
      end if;
*/
  --  if(not bEmptyRow) then
    sHtml := sHtml ||'  <TD ><P class=user>'|| PKG_R_ALLFUNC.RETURN_VALUE(pSum(p)) ||'</P></TD>'||CHR(13);
    sHtml := sHtml ||'  <TD ><P class=user>'|| PKG_R_ALLFUNC.RETURN_VALUE(pSumCost(p)) ||'</P></TD>'||CHR(13);
    sHtml := sHtml ||' </TR>'||CHR(13);
    DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);
 --   end if;
    end loop;

    sHtml := ' <TR>'||CHR(13)||'  <TD colspan=3 class=user>ИТОГО:</TD>'||CHR(13);
    sHtml := sHtml || '  <TD class=user>'||TO_CHAR(nSum)||'</TD>'||CHR(13);
    sHtml := sHtml || '  <TD class=user>'||TO_CHAR(nSumCost)||'</TD>'||CHR(13)||' </TR>'||CHR(13);
    sHtml := sHtml || '</TABLE>'||CHR(13)||'<BR><BR>';
    DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);
    sHtml := '<BR><P><B>Отчет составил: _________________________'||LOGIN.GET_SOTRNAME(pFK_SOTRID)||'</B></P>'||CHR(13)||'</DIV></BODY></HTML>';
    DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);
    arrayCountPeople := arrayEmpty_table;
    RETURN clTemp;
end;
END;
/

SHOW ERRORS;


