DROP PACKAGE BODY ASU.PKG_R_SOCSOSVALDAI
/

--
-- PKG_R_SOCSOSVALDAI  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_R_SOCSOSVALDAI" 
 is-- Created by TimurLan
  FUNCTION GET_COUNT_IN_COC_PRIZN (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_COC IN NUMBER, pFK_PRIZN IN NUMBER)
  RETURN NUMBER
   IS
    CURSOR c IS
      SELECT COUNT(fk_id) AS FN_COUNT
        FROM tkarta,
             (SELECT DISTINCT fk_pacid
                FROM tsroky
               WHERE fd_data1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
                 AND fk_pryb = 2)
       WHERE fk_id = fk_pacid
         AND fk_coc_polid = pFK_COC
         AND fk_prizn = pFK_PRIZN;
    i NUMBER;
  BEGIN
    OPEN c;
    FETCH c INTO i;
    CLOSE c;
    RETURN i;
  END;
  FUNCTION GET_COUNT_IN_COC (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_COC IN NUMBER)
  RETURN NUMBER
   IS
    CURSOR c IS
      SELECT COUNT (fk_id) AS FN_COUNT
        FROM tkarta,
             (SELECT DISTINCT fk_pacid
                FROM tsroky
               WHERE fd_data1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
                 AND fk_pryb = 2)
       WHERE fk_id = fk_pacid
         AND fk_coc_polid = pFK_COC;
    i NUMBER;
  BEGIN
    OPEN c;
    FETCH c INTO i;
    CLOSE c;
    RETURN i;
  END;
  FUNCTION GET_COUNT_IN_PRIZN (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_PRIZN IN NUMBER)
  RETURN NUMBER
   IS
    CURSOR c IS
      SELECT COUNT (fk_id) AS FN_COUNT
        FROM tkarta,
             (SELECT DISTINCT fk_pacid
                FROM tsroky
               WHERE fd_data1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
                 AND fk_pryb = 2)
       WHERE fk_id = fk_pacid
         AND fk_prizn = pFK_PRIZN;
    i NUMBER;
  BEGIN
    OPEN c;
    FETCH c INTO i;
    CLOSE c;
    RETURN i;
  END;
  FUNCTION DO_CALC_REPORT (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_VRACHID IN NUMBER)
  RETURN NUMBER
   IS-- Used in rSocCocValdai.dpr
    CURSOR cCoc IS SELECT fk_id, fc_name FROM tcoc_pol ORDER BY FK_ID;
    CURSOR cPrizn IS SELECT fk_id, fc_name FROM tprizn ORDER BY FC_NAME desc;
    TYPE TpCG IS TABLE OF cPrizn%ROWTYPE
              INDEX BY BINARY_INTEGER;
    pCG TpCG;
    nC NUMBER;
    cC CLOB;
    str VARCHAR2 (32767);
    z NUMBER;
  BEGIN
    FOR p IN cPrizn LOOP
      pCG (cPrizn%ROWCOUNT)  := p;
    END LOOP;
    SELECT COUNT(FK_ID) INTO z FROM tcoc_pol;
    z := (z + 1);
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
    str := '<BODY>'||
           '<P ALIGN="CENTER">СВЕДЕНИЯ<BR>о социальном составе лечившихся и отдыхающих в санатории "' || PKG_SMINI.READSTRING ('CONFIG', 'S_NAME', 'Не известен') || '" за период с ' || TO_CHAR (pFD_DATA1, 'dd.mm.yyyy') || ' по ' || TO_CHAR (pFD_DATA2, 'dd.mm.yyyy') || '</P>'||
           '<table>'||
           '<TR>'||
           '<TD>Наименование организаций и ведомств</TD>';
    FOR i IN 1 .. pCG.COUNT LOOP
      str  := str ||
           '<TD>' || pCG (i).FC_NAME || '</TD>';
    END LOOP;
    str := str ||
           ' <TD><B>Всего:</B></TD>'||
           '</TR>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    FOR p IN cCoc LOOP
      str  := '<TR><TD class=user>' || p.FC_NAME || '</TD>';
      PROGRESS_BAR.SETStrOut (p.FC_NAME);
      PROGRESS_BAR.STEPIT;
      FOR i IN 1 .. pCG.COUNT LOOP
        str  := str||'<TD>' || PKG_R_ALLFUNC.RETURN_VALUE(GET_COUNT_IN_COC_PRIZN (pFD_DATA1, pFD_DATA2, p.FK_ID, pCg (i).FK_ID)) || '</TD>';
      END LOOP;
      str  := str || '<TD><B> '|| PKG_R_ALLFUNC.RETURN_VALUE(GET_COUNT_IN_COC (pFD_DATA1, pFD_DATA2, p.FK_ID)) || '</B></TD></TR>';
      DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    END LOOP;
    PROGRESS_BAR.SETStrOut ('Итого');
    PROGRESS_BAR.STEPIT;
    str  := '<TR><TD class=user><B>Итого:</B></TD>';
    FOR i IN 1 .. pCG.COUNT LOOP
      str  := str||'<TD><B>' || GET_COUNT_IN_PRIZN (pFD_DATA1, pFD_DATA2, pCg (i).FK_ID) || '</B></TD>';
    END LOOP;
    str  := str||'<TD><B>' || PKG_R_ALLFUNC.GET_COUNT_INC (pFD_DATA1, pFD_DATA2) || '</B></TD></TR>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    str  := '</TABLE>'||
            '<BR><P><B>Отчет составил: _________________________ ' || DO_VRACHFIO (pFK_VRACHID) || '</B></body></html>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    DBMS_LOB.CLOSE (cC);
    RETURN nC;
  END;
end PKG_R_SOCSOSVALDAI;
/

SHOW ERRORS;


