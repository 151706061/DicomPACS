DROP PACKAGE BODY ASU.PKG_R_SOCSOS
/

--
-- PKG_R_SOCSOS  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_R_SOCSOS" 
 is-- Created by TimurLan
  FUNCTION GET_COUNT_OUT_COC_GROUP (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_COC IN NUMBER, pFK_GROUP IN NUMBER)
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
         AND fk_groupid = pFK_GROUP;
    i NUMBER;
  BEGIN
    OPEN c;
    FETCH c INTO i;
    CLOSE c;
    RETURN i;
  END;
/*  FUNCTION GET_COUNT_OUT_COC_NKONT (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_COC IN NUMBER)
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
         AND fk_groupid = fk_vgroupid;
    i NUMBER;
  BEGIN
    OPEN c;
    FETCH c INTO i;
    CLOSE c;
    RETURN i;
  END;*/
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
  FUNCTION GET_COUNT_OUT_GROUP (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_COC IN NUMBER)
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
         AND fk_groupid = pFK_COC;
    i NUMBER;
  BEGIN
    OPEN c;
    FETCH c INTO i;
    CLOSE c;
    RETURN i;
  END;
/*  FUNCTION GET_COUNT_OUT_NKONT (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE)
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
         AND fk_groupid = fk_vgroupid;
    i NUMBER;
  BEGIN
    OPEN c;
    FETCH c INTO i;
    CLOSE c;
    RETURN i;
  END;*/
  FUNCTION DO_CALC_REPORT (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_VRACHID IN NUMBER)
  RETURN NUMBER
   IS-- Used in rSocCoc.dpr
    CURSOR cCoc IS SELECT fk_id, fc_name FROM tcoc_pol ORDER BY FC_NAME;
    CURSOR cGroup IS SELECT fk_id, /*FC_SHORT*/ fc_name FROM tgroup/*WHERE FL_KONT=1*/ ORDER BY FL_KONT DESC, fc_name;
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
    PROGRESS_BAR.SETSTROUT('Подготовка отчета..');
    nTemp:=0;
    FOR p IN cGroup LOOP
      pCG (cGroup%ROWCOUNT)  := p;
    END LOOP;
    OPEN cCountKont;
    FETCH cCountKont INTO nK;
    CLOSE cCountKont;
    SELECT COUNT(FK_ID) INTO z FROM TCOC_POL;
    z := (z + 1) * (pCG.COUNT + 2);
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
           ' <TD ROWSPAN="2">Состав лечившихся и отдыхающих:</TD>'||
           ' <TD COLSPAN="' || nTemp || '">Контингент поликлиник МЦ</TD>'||
           ' <TD COLSPAN="' || (pCG.COUNT - nK) ||'">Другие лечебные учреждения (не контингент)</TD>'||
           ' <TD ROWSPAN="2"><B>Всего:</B></TD>'||
           '</TR>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    if nK = 0 then
      str:='<TR><TD class=v>не найдено</TD>';
    else
      str:='<TR>';
    end if;
    FOR i IN 1 .. pCG.COUNT LOOP
      str  := str || '<TD class=v>' || pCG (i).FC_NAME || ' (осн.чл.сем.)</TD>';
    END LOOP;
    str  := STR || '</TR>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    FOR p IN cCoc LOOP
      str  := '<TR><TD class=user>' || p.FC_NAME || '</TD>';
      if nK = 0 then
        str:=str||'<TD>-</TD>';
      end if;
      FOR i IN 1 .. pCG.COUNT LOOP
        str  := str||'<TD>' || PKG_R_ALLFUNC.RETURN_VALUE(GET_COUNT_OUT_COC_GROUP (pFD_DATA1, pFD_DATA2, p.FK_ID, pCg (i).FK_ID)) || '</TD>';
        PROGRESS_BAR.SETStrOut (p.FC_NAME||' - '||pCG(i).FC_NAME);
        PROGRESS_BAR.STEPIT;
      END LOOP;
      str  :=/*'<TD>'||GET_COUNT_VYP_COC_NK(pFD_DATA1,pFD_DATA2,p.FK_ID)||'</TD>*/ str || '<TD><B>' ||
         PKG_R_ALLFUNC.RETURN_VALUE(GET_COUNT_OUT_COC (pFD_DATA1, pFD_DATA2, p.FK_ID)) || '</B></TD></TR>';
      DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
      PROGRESS_BAR.STEPIT (2);
    END LOOP;
    str  := '<TR><TD class=user><B>Итого:</B></TD>';
    if nK = 0 then
      str:=str||'<TD><B>-</B></TD>';
    end if;
    FOR i IN 1 .. pCG.COUNT LOOP
      str  := str||'<TD><B>' || GET_COUNT_OUT_GROUP (pFD_DATA1, pFD_DATA2, pCg (i).FK_ID) || '</B></TD>';
      PROGRESS_BAR.SETStrOut ('Итого - '||pCG(i).FC_NAME);
      PROGRESS_BAR.STEPIT;
    END LOOP;
    str  :=/*'<TD><B>'||GET_COUNT_VYP_NK(pFD_DATA1, pFD_DATA2)||'</B></TD>*/ str||'<TD><B>' ||
                       PKG_R_ALLFUNC.GET_COUNT_OUT (pFD_DATA1, pFD_DATA2) || '</B></TD></TR>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    PROGRESS_BAR.STEPIT (2);
    str  := '</TABLE>'||
            '<BR><P><B>Отчет составил: _________________________ ' || DO_VRACHFIO (pFK_VRACHID) || '</B></body></html>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    DBMS_LOB.CLOSE (cC);
    RETURN nC;
  END;
end PKG_R_SOCSOS;
/

SHOW ERRORS;


