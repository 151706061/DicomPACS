DROP PACKAGE BODY ASU.PKG_R_SOCSOSSOCHI
/

--
-- PKG_R_SOCSOSSOCHI  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_R_SOCSOSSOCHI" 
 is-- Created by TimurLan

  FUNCTION GET_COUNT_OUT_COC_GROUP_PRIZN (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_COC IN NUMBER, pFK_GROUP IN NUMBER, pFK_PRIZN IN NUMBER)
  RETURN NUMBER
   IS
    CURSOR c IS
      SELECT COUNT (fk_id) AS FN_COUNT
        FROM tkarta,
             (SELECT DISTINCT fk_pacid
                FROM tsroky
               WHERE fd_data1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
                 AND fk_pryb = 3)
       WHERE fk_id = fk_pacid
         AND fk_coc_polid = pFK_COC
         AND fk_groupid = pFK_GROUP
         AND fk_prizn = pFK_PRIZN;
    i NUMBER;
  BEGIN
    OPEN c;
    FETCH c INTO i;
    CLOSE c;
    RETURN i;
  END;
  FUNCTION GET_COUNT_OUT_COC_GROUP_NKONT (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_COC IN NUMBER, pFK_GROUP IN NUMBER)
  RETURN NUMBER
   IS
    CURSOR c IS
      SELECT COUNT (fk_id) AS FN_COUNT
        FROM tkarta,
             (SELECT DISTINCT fk_pacid
                FROM tsroky
               WHERE fd_data1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
                 AND fk_pryb = 3),
             (SELECT fk_id fk_vgroupid
                FROM tgroup
               WHERE fl_Kont = 0)
       WHERE fk_id = fk_pacid
         AND fk_coc_polid = pFK_COC
         AND fk_groupid = pFK_GROUP
         AND fk_groupid = fk_vgroupid;
    i NUMBER;
  BEGIN
    OPEN c;
    FETCH c INTO i;
    CLOSE c;
    RETURN i;
  END;
  FUNCTION GET_COUNT_OUT_COC (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_COC IN NUMBER)
  RETURN NUMBER
   IS
    CURSOR c IS
      SELECT COUNT (fk_id) AS FN_COUNT
        FROM tkarta,
             (SELECT DISTINCT fk_pacid
                FROM tsroky
               WHERE fd_data1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
                 AND fk_pryb = 3)
       WHERE fk_id = fk_pacid
         AND fk_coc_polid = pFK_COC;
    i NUMBER;
  BEGIN
    OPEN c;
    FETCH c INTO i;
    CLOSE c;
    RETURN i;
  END;
  FUNCTION GET_COUNT_OUT_GROUP_PRIZN (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_GROUP IN NUMBER, pFK_PRIZN IN NUMBER)
  RETURN NUMBER
   IS
    CURSOR c IS
      SELECT COUNT (fk_id) AS FN_COUNT
        FROM tkarta,
             (SELECT DISTINCT fk_pacid
                FROM tsroky
               WHERE fd_data1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
                 AND fk_pryb = 3)
       WHERE fk_id = fk_pacid
         AND fk_groupid = pFK_GROUP
         AND fk_prizn = pFK_PRIZN;
    i NUMBER;
  BEGIN
    OPEN c;
    FETCH c INTO i;
    CLOSE c;
    RETURN i;
  END;
  FUNCTION GET_COUNT_OUT_GROUP_NKONT (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_GROUP IN NUMBER)
  RETURN NUMBER
   IS
    CURSOR c IS
      SELECT COUNT (fk_id) AS FN_COUNT
        FROM tkarta,
             (SELECT DISTINCT fk_pacid
                FROM tsroky
               WHERE fd_data1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
                 AND fk_pryb = 3),
             (SELECT fk_id fk_vgroupid
                FROM tgroup
               WHERE fl_Kont = 0)
       WHERE fk_id = fk_pacid
         AND fk_groupid = pFK_GROUP
         AND fk_groupid = fk_vgroupid;
    i NUMBER;
  BEGIN
    OPEN c;
    FETCH c INTO i;
    CLOSE c;
    RETURN i;
  END;
  FUNCTION GET_COUNT_OUT_WITHOUT (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE)
  RETURN NUMBER
   IS
    CURSOR c IS
      SELECT COUNT (fk_id) AS FN_COUNT
        FROM tkarta,
             (SELECT DISTINCT fk_pacid
                FROM tsroky
               WHERE fd_data1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
                 AND fk_pryb = 3)
       WHERE fk_id = fk_pacid
         AND fk_coc_polid not in (98,99);
    i NUMBER;
  BEGIN
    OPEN c;
    FETCH c INTO i;
    CLOSE c;
    RETURN i;
  END;
  FUNCTION GET_COUNT_OUT_GRP_PRZN_CHLD (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_GROUP IN NUMBER, pFK_PRIZN IN NUMBER)
  RETURN NUMBER
   IS
    CURSOR c IS
      SELECT COUNT (fk_id) AS FN_COUNT
        FROM tkarta,
             (SELECT DISTINCT fk_pacid
                FROM tsroky
               WHERE fd_data1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
                 AND fk_pryb = 3)
       WHERE fk_id = fk_pacid
         AND fk_groupid = pFK_GROUP
         AND fk_prizn = pFK_PRIZN
         AND PKG_REGIST_PACFUNC.GET_PAC_AGE_DATE(FK_PACID,GET_PACINCOME(FK_PACID)) <= 14;
    i NUMBER;
  BEGIN
    OPEN c;
    FETCH c INTO i;
    CLOSE c;
    RETURN i;
  END;
  FUNCTION GET_COUNT_OUT_GRP_PRZN_CHLD_NK (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_GROUP IN NUMBER)
  RETURN NUMBER
   IS
    CURSOR c IS
      SELECT COUNT (fk_id) AS FN_COUNT
        FROM tkarta,
             (SELECT DISTINCT fk_pacid
                FROM tsroky
               WHERE fd_data1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
                 AND fk_pryb = 3),
             (SELECT fk_id fk_vgroupid
                FROM tgroup
               WHERE fl_Kont = 0)
       WHERE fk_id = fk_pacid
         AND fk_groupid = pFK_GROUP
         AND fk_groupid = fk_vgroupid
         AND PKG_REGIST_PACFUNC.GET_PAC_AGE_DATE(FK_PACID,GET_PACINCOME(FK_PACID)) <= 14;
    i NUMBER;
  BEGIN
    OPEN c;
    FETCH c INTO i;
    CLOSE c;
    RETURN i;
  END;
  FUNCTION DO_CALC_REPORT (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_VRACHID IN NUMBER)
  RETURN NUMBER
   IS-- Used in rSocCoc.dpr
    CURSOR cCoc1 IS SELECT fk_id, fc_name FROM tpacvid WHERE FK_ID NOT IN (22,33) ORDER BY 1;
    CURSOR cCoc2 IS SELECT fk_id, fc_name FROM tpacvid WHERE FK_ID IN (22,33) ORDER BY 1;
    CURSOR cGroup IS SELECT fk_id, FC_SHORT /*fc_name*/ FROM tgroup/*WHERE FL_KONT=1*/ ORDER BY FL_KONT DESC, FK_ID;
    CURSOR cCountKont IS SELECT COUNT (FK_ID) FROM TGROUP WHERE FL_KONT = 1;
    TYPE TpCG IS TABLE OF cGroup%ROWTYPE
              INDEX BY BINARY_INTEGER;
    nC NUMBER;
    cC CLOB;
    str VARCHAR2 (32767);
    pCG TpCG;
    nK NUMBER;
    z NUMBER;
    nTemp NUMBER;
  BEGIN
    nTemp:=0;
    FOR p IN cGroup LOOP
      pCG (cGroup%ROWCOUNT)  := p;
    END LOOP;
    OPEN cCountKont;
    FETCH cCountKont INTO nK;
    CLOSE cCountKont;
    SELECT COUNT(FK_ID) INTO z FROM TCOC_POL;
    z := (z + 3);
    PROGRESS_BAR.SETMAXValue (z);
    PROGRESS_BAR.SETSTEPVALUE (1);

    INSERT INTO TCLOBS (FC_CLOB)
         VALUES (EMPTY_CLOB () )
      RETURNING FK_ID, FC_CLOB INTO nC, cC;
    DBMS_LOB.OPEN (cC, DBMS_LOB.LOB_READWRITE);
    str := PKG_HTML.GET_HEAD('excel','Социальный состав лечившихся в санатории "'||PKG_SMINI.READSTRING('CONFIG','S_NAME','Не известен')||'" за период с '||TO_CHAR(pFD_DATA1,'dd.mm.yyyy')||' по '||TO_CHAR(pFD_DATA2,'dd.mm.yyyy'),
                             null,null,null,
                             null,null,null,
                             null,null,null,
                             null,null,'landscape',
                             null,null,null,null,
                             null,null,null,'left',
                             null,null,null,null,
                             null,null,null);
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    if nK = 0 then
      nTemp := 1;
    else
      nTemp := nK;
    end if;
    str := '<BODY>'||
           '<P ALIGN="CENTER"><B>Социальный состав лечившихся в санатории "' || PKG_SMINI.READSTRING ('CONFIG', 'S_NAME', 'Не известен') || '"</B><BR>'||'за период с ' || TO_CHAR (pFD_DATA1, 'dd.mm.yyyy') || ' по ' || TO_CHAR (pFD_DATA2, 'dd.mm.yyyy') || '</P>'||
           '<table>'||
           '<TR>'||
           ' <TD ROWSPAN="3">Состав лечившихся и отдыхающих:</TD>'||
           ' <TD COLSPAN="' || nTemp*2 || '">Контингент поликлиник МЦ</TD>';

    if (pCG.COUNT - nK) <> 0 then
      str := str || ' <TD COLSPAN="' || (pCG.COUNT - nK) ||'">Другие лечебные учреждения</TD>';
    else
      null;
    end if;

    str := str || ' <TD ROWSPAN="3"><B>Всего:</B></TD></TR>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);

    if nK = 0 then
      str:='<TR><TD COLSPAN="2">не найдено</TD>';
    else
      str:='<TR>';
    end if;

    FOR i IN 1 .. pCG.COUNT LOOP
      if i <= nTemp and nK <> 0 then
        str  := str || '<TD COLSPAN="2">' || pCG (i).FC_SHORT || '</TD>';
      else
        str  := str || '<TD ROWSPAN="2">' || pCG (i).FC_SHORT || '</TD>';
      end if;
    END LOOP;
    str  := STR || '</TR>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);

    str := '';
    FOR i IN 1 .. pCG.COUNT LOOP
      if i <= nTemp then
        str  := str || '<TD>осн.</TD><TD>чл.сем.</TD>';
      else
        null;
      end if;
    END LOOP;
    str  := STR || '</TR>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);

    FOR p IN cCoc1 LOOP
      PROGRESS_BAR.SETStrOut (p.FC_NAME);
      PROGRESS_BAR.STEPIT;
      str  := '<TR><TD class=user>' || p.FC_NAME || '</TD>';
      if nK = 0 then
        str:=str||'<TD>-</TD><TD>-</TD>';
      end if;

      FOR i IN 1 .. pCG.COUNT LOOP
        if i <= nTemp and nK <> 0 then
          str  := str||'<TD>' || PKG_R_ALLFUNC.RETURN_VALUE(GET_COUNT_OUT_COC_GROUP_PRIZN (pFD_DATA1, pFD_DATA2, p.FK_ID, pCg (i).FK_ID,1)) || '</TD>'||
                       '<TD>' || PKG_R_ALLFUNC.RETURN_VALUE(GET_COUNT_OUT_COC_GROUP_PRIZN (pFD_DATA1, pFD_DATA2, p.FK_ID, pCg (i).FK_ID,67)) || '</TD>';
        else
          str  := str||'<TD>' || PKG_R_ALLFUNC.RETURN_VALUE(GET_COUNT_OUT_COC_GROUP_NKONT (pFD_DATA1, pFD_DATA2, p.FK_ID, pCg (i).FK_ID)) || '</TD>';
        end if;
      END LOOP;

      str  := str || '<TD><B>' || PKG_R_ALLFUNC.RETURN_VALUE(GET_COUNT_OUT_COC (pFD_DATA1, pFD_DATA2, p.FK_ID)) || '</B></TD></TR>';
      DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    END LOOP;

    str  := '<TR><TD class=user><B>Итого:</B></TD>';
    if nK = 0 then
      str:=str||'<TD><B>-</B></TD><TD><B>-</B></TD>';
    end if;

    PROGRESS_BAR.SETStrOut ('Итого');
    PROGRESS_BAR.STEPIT;
    FOR i IN 1 .. pCG.COUNT LOOP
        if i <= nTemp and nK <> 0 then
          str  := str||'<TD><B>' || GET_COUNT_OUT_GROUP_PRIZN (pFD_DATA1, pFD_DATA2, pCg (i).FK_ID,1) || '</B></TD>'||
                       '<TD><B>' || GET_COUNT_OUT_GROUP_PRIZN (pFD_DATA1, pFD_DATA2, pCg (i).FK_ID,67) || '</B></TD>';
        else
          str  := str||'<TD><B>' || GET_COUNT_OUT_GROUP_NKONT (pFD_DATA1, pFD_DATA2, pCg (i).FK_ID) || '</B></TD>';
        end if;
    END LOOP;

    str  :=  str||'<TD><B>' || GET_COUNT_OUT_WITHOUT (pFD_DATA1, pFD_DATA2) || '</B></TD></TR>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);

    FOR p IN cCoc2 LOOP
      PROGRESS_BAR.SETStrOut (p.FC_NAME);
      PROGRESS_BAR.STEPIT;
      str  := '<TR><TD class=user>' || p.FC_NAME || '</TD>';
      if nK = 0 then
        str:=str||'<TD>-</TD><TD>-</TD>';
      end if;

      FOR i IN 1 .. pCG.COUNT LOOP
        if i <= nTemp and nK <> 0 then
          str  := str||'<TD>' || PKG_R_ALLFUNC.RETURN_VALUE(GET_COUNT_OUT_COC_GROUP_PRIZN (pFD_DATA1, pFD_DATA2, p.FK_ID, pCg (i).FK_ID,1)) || '</TD>'||
                       '<TD>' || PKG_R_ALLFUNC.RETURN_VALUE(GET_COUNT_OUT_COC_GROUP_PRIZN (pFD_DATA1, pFD_DATA2, p.FK_ID, pCg (i).FK_ID,67)) || '</TD>';
        else
          str  := str||'<TD>' || PKG_R_ALLFUNC.RETURN_VALUE(GET_COUNT_OUT_COC_GROUP_NKONT (pFD_DATA1, pFD_DATA2, p.FK_ID, pCg (i).FK_ID)) || '</TD>';
        end if;
      END LOOP;

      str  :=  str || '<TD><B>' || PKG_R_ALLFUNC.RETURN_VALUE(GET_COUNT_OUT_COC (pFD_DATA1, pFD_DATA2, p.FK_ID)) || '</B></TD></TR>';
      DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    END LOOP;

    str  := '<TR><TD class=user><B>Всего:</B></TD>';
    if nK = 0 then
      str:=str||'<TD><B>-</B></TD><TD><B>-</B></TD>';
    end if;

    PROGRESS_BAR.SETStrOut ('Всего');
    PROGRESS_BAR.STEPIT;
    FOR i IN 1 .. pCG.COUNT LOOP
        if i <= nTemp and nK <> 0 then
          str  := str||'<TD><B>' || GET_COUNT_OUT_GROUP_PRIZN (pFD_DATA1, pFD_DATA2, pCg (i).FK_ID,1) || '</B></TD>'||
                       '<TD><B>' || GET_COUNT_OUT_GROUP_PRIZN (pFD_DATA1, pFD_DATA2, pCg (i).FK_ID,67) || '</B></TD>';
        else
          str  := str||'<TD><B>' || GET_COUNT_OUT_GROUP_NKONT (pFD_DATA1, pFD_DATA2, pCg (i).FK_ID) || '</B></TD>';
        end if;
    END LOOP;

    str  :=  str||'<TD><B>' || PKG_R_ALLFUNC.GET_COUNT_OUT (pFD_DATA1, pFD_DATA2) || '</B></TD></TR>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);

    PROGRESS_BAR.SETStrOut ('Дети...');
    PROGRESS_BAR.STEPIT;
    str  := '<TR><TD class=user><B>в т.ч. дети до 14:</B></TD>';
    if nK = 0 then
      str:=str||'<TD><B>-</B></TD><TD><B>-</B></TD>';
    end if;

    FOR i IN 1 .. pCG.COUNT LOOP
        if i <= nTemp and nK <> 0 then
          str  := str||'<TD><B>' || GET_COUNT_OUT_GRP_PRZN_CHLD (pFD_DATA1, pFD_DATA2, pCg (i).FK_ID,1) || '</B></TD>'||
                       '<TD><B>' || GET_COUNT_OUT_GRP_PRZN_CHLD (pFD_DATA1, pFD_DATA2, pCg (i).FK_ID,67) || '</B></TD>';
        else
          str  := str||'<TD><B>' || GET_COUNT_OUT_GRP_PRZN_CHLD_NK (pFD_DATA1, pFD_DATA2, pCg (i).FK_ID) || '</B></TD>';
        end if;
    END LOOP;

   SELECT COUNT(FK_PACID) into nTemp
     FROM TSROKY
    WHERE FD_DATA1 BETWEEN pFD_DATA1 and pFD_DATA2+1-1/(24*60*60)
      AND FK_PRYB = 3
      AND PKG_REGIST_PACFUNC.GET_PAC_AGE_DATE(FK_PACID,GET_PACINCOME(FK_PACID)) <= 14;

    str  := str||'<TD><B>' || nTemp || '</B></TD></TR>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);

    str  := '</TABLE>'||
            '<BR><P><B>Отчет составил: _________________________ ' || DO_VRACHFIO (pFK_VRACHID) || '</B></body></html>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    DBMS_LOB.CLOSE (cC);
    RETURN nC;
  END;
end PKG_R_SOCSOSSOCHI;
/

SHOW ERRORS;


