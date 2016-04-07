DROP PACKAGE BODY ASU.PKG_R_KDNPERIODMASHUK
/

--
-- PKG_R_KDNPERIODMASHUK  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_R_KDNPERIODMASHUK" 
 is-- Created by TimurLan
  FUNCTION GET_COUNT_DIV_KDN (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE)
  RETURN NUMBER
   IS
    CURSOR c IS
      SELECT COUNT (DISTINCT FK_PACID), COUNT (DISTINCT FC_PUT)
        FROM (SELECT tputs.fc_put, tputs.fk_pacid, get_count_putputs (tputs.fk_pacid, pFD_DATA1, pFD_DATA2) FN_CPUT, get_count_pacputs (tputs.fc_put, pFD_DATA1, pFD_DATA2) FN_CPAC
                FROM tputs, tsroky
               WHERE FD_DATA1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
                 AND fk_pryb = 2
                 AND TPUTS.FK_PACID = TSROKY.FK_PACID)
       WHERE fn_cpac > 1
          OR fn_cput > 1
       ORDER BY FC_PUT;
    nPut NUMBER;
    nPac NUMBER;
    nSum NUMBER;
  BEGIN
    nSum  := 0;
    OPEN c;
    FETCH c INTO nPac, nPut;
    CLOSE c;
    BEGIN
      nSum  := (21 - TRUNC ( (nPut * 21) / nPac) + 1) * nPut;
      EXCEPTION WHEN OTHERS THEN NULL;
    END;
    RETURN nSum;
  END;
  FUNCTION DO_CALC_REPORT (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_VRACHID IN NUMBER)
  RETURN NUMBER
   IS-- Used in rKDNPerMashuk.dpr
    cC CLOB;
    nC NUMBER;
    str VARCHAR2 (32767);
  BEGIN
    INSERT INTO TCLOBS (FC_CLOB)
         VALUES (EMPTY_CLOB () )
      RETURNING FK_ID, FC_CLOB INTO nC, cC;
    DBMS_LOB.OPEN (cC, DBMS_LOB.LOB_READWRITE);
    str := PKG_HTML.GET_HEAD('word','Отчет о койко-днях по санаторию "' ||PKG_SMINI.READSTRING('CONFIG','S_NAME','Не известен')||'"',
                             null,null,'Courier New',
                             null,null,null,
                             null,null,null,
                             null,null,null,
                             null,null,null,null,
                             null,null,null,null,
                             null,null,null,null,
                             null,null,null);
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    str := '<BODY><P ALIGN="CENTER"><B>Отчет о койко-днях по санаторию "' || PKG_SMINI.READSTRING ('CONFIG', 'S_NAME', 'Не известен') || '"</B><BR>'||
           'за период с ' || TO_CHAR (pFD_DATA1, 'dd.mm.yyyy') || ' по ' || TO_CHAR (pFD_DATA2, 'dd.mm.yyyy') || '</P>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    PROGRESS_BAR.SETSTROUT ('Подсчет общего количества койко-дней');
    PROGRESS_BAR.STEPIT;
    str  := '<BR><P class=user>Койко-дней всего - <B>' || GET_KDN_PERIOD (pFD_DATA1, pFD_DATA2) || '</B> к/дн.';
    PROGRESS_BAR.SETSTROUT ('Подсчет общего количества прибывших');
    PROGRESS_BAR.STEPIT;
    str  := str || '<BR>Прибыло - <B>' || GET_COUNT_INCOME_PERIOD (pFD_DATA1, pFD_DATA2) || '</B> чел. (<B>' || PKG_R_ALLFUNC.GET_COUNT_INC_PUT (pFD_DATA1, pFD_DATA2) || '</B> пут.)';
    PROGRESS_BAR.SETSTROUT ('Подсчет общего количества досрочных отъездов');
    PROGRESS_BAR.STEPIT;
    str  := str || '<BR>Досрочный отъезд - <B>' || PKG_R_KDNFUNC.GET_KDNV_EARLY (pFD_DATA1, pFD_DATA2) || '</B> к/дн.';
    PROGRESS_BAR.SETSTROUT ('Подсчет общего количества переходячих путевок');
    PROGRESS_BAR.STEPIT;
    str  := str || '<BR>Переходящих - <B>' || PKG_R_ALLFUNC.GET_COUNT_PEREHOD_PUT (pFD_DATA2) || '</B> пут.';
    PROGRESS_BAR.SETSTROUT ('Подсчет общего количества переходящих койко-дней');
    PROGRESS_BAR.STEPIT;
    str  := str || '<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - <B>' ||  PKG_R_KDNFUNC.GET_KDN_PEREHOD (pFD_DATA2) || '</B> к/дн.';
--    PROGRESS_BAR.SETSTROUT ('Подсчет общего количества делящихся путевок');
--    PROGRESS_BAR.STEPIT;
--    str  := str || '<BR>Деление - <B>' || GET_COUNT_DIV_KDN (pFD_DATA1, pFD_DATA2) || '</B> к/дн.';
    str  := str || '</P><BR><P><B>Отчет составил: _________________________ ' || DO_VRACHFIO (pFK_VRACHID) || '</B></P></BODY></HTML>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    DBMS_LOB.CLOSE (cC);
    RETURN nC;
  END;
end PKG_R_KDNPERIODMASHUK;
/

SHOW ERRORS;


