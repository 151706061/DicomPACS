DROP PACKAGE BODY ASU.PKG_R_PACOUTMASH
/

--
-- PKG_R_PACOUTMASH  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_R_PACOUTMASH" 
 is-- Created by TimurLan
  FUNCTION DO_CALC_REPORT (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_VRACHID IN NUMBER)
  RETURN NUMBER
   IS-- Used in rPacOutMash.dpr
    CURSOR c IS
      SELECT DISTINCT FK_IBID, FK_IBY, GET_IB (FK_PACID) FK_IB, GET_PACFIO (FK_PACID) FC_FIO, DO_VRACHFIO (GET_PACVRACH (FK_PACID) ) FC_VFIO
        FROM TSROKY T1, TKARTA
       WHERE FD_DATA3 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
         AND TKARTA.FK_ID = FK_PACID
         AND T1.FK_ID = (SELECT MAX (FK_ID)
                           FROM TSROKY
                          WHERE FK_PRYB IN (2, 4, 5, 6)
                            AND FK_VYB = 3 -- << Modified by TimurLan
                            AND FK_PACID = t1.FK_PACID)
    ORDER BY FK_IBY, FK_IBID;
    cC CLOB;
    nC NUMBER;
    str VARCHAR2 (32767);
  BEGIN
    INSERT INTO TCLOBS (FC_CLOB)
         VALUES (EMPTY_CLOB () )
      RETURNING FK_ID, FC_CLOB INTO nC, cC;
    DBMS_LOB.OPEN (cC, DBMS_LOB.LOB_READWRITE);
    str := PKG_HTML.GET_HEAD('word','Список выписанных пациентов по санаторию "' ||PKG_SMINI.READSTRING('CONFIG','S_NAME','Не известен')||'"',
                             null,null,null,
                             null,null,null,
                             null,null,null,
                             '297','210','landscape',
                             '20','10','20','20',
                             null,null,null,'right',
                             null,null,null,null,
                             null,null,null);
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    str  :=
      '<BODY><div class=user><P ALIGN="CENTER"><B>Список выписанных пациентов по санаторию "' || PKG_SMINI.READSTRING ('CONFIG', 'S_NAME', 'Не известен') || '"</B><BR>'||
      'за период с ' || TO_CHAR (pFD_DATA1, 'dd.mm.yyyy') || ' по ' || TO_CHAR (pFD_DATA2, 'dd.mm.yyyy') || '</P><BR>'||
      '<table>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    str  := '<TR>'||
            '<TD><B>№ п/п:</B></TD>'||
            '<TD><B>№ И.Б.:</B></TD>'||
            '<TD><B>Ф.И.О.:</B></TD>'||
            '<TD><B>Врач:</B></TD>';
    FOR i IN 1 .. 20 LOOP
      str  := str || '<TD>&nbsp;</TD>';
    END LOOP;
    str  := str || '</TR>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    FOR p IN c LOOP
      str  := '<TR><TD>' || c%ROWCOUNT || '</TD>'||
              '<TD class=user>' || p.FK_IB || '</TD>'||
              '<TD style=''text-align:left''>' || p.FC_FIO || '</TD>'||
              '<TD class=user>' || p.FC_VFIO || '</TD>';
      FOR i IN 1 .. 20 LOOP
        str  := str || '<TD>&nbsp;</TD>';
      END LOOP;
      str  := str || '</TR>';
      DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    END LOOP;
    str  := '</TABLE>'||
            '<BR><P><B>Отчет составил: _________________________ ' || DO_VRACHFIO (pFK_VRACHID) || '</B></P></div></BODY></HTML>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    DBMS_LOB.CLOSE (cC);
    RETURN nC;
  END;
end PKG_R_PACOUTMASH;
/

SHOW ERRORS;


