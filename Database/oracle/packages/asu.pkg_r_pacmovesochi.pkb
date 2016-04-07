DROP PACKAGE BODY ASU.PKG_R_PACMOVESOCHI
/

--
-- PKG_R_PACMOVESOCHI  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_R_PACMOVESOCHI" 
 is-- Created by TimurLan
  FUNCTION GET_COUNT_RECOVER(pFD_DATA1 IN DATE, pFD_DATA2 IN DATE)
  RETURN NUMBER
   IS
    CURSOR c IS
      select count(fk_id)
        from tsroky
       where fd_data1 between pFD_DATA1 and pFD_DATA2+1-1/(24*60*60)
         and fk_pryb=4;
    i NUMBER;
  BEGIN
    OPEN c;
    FETCH c INTO i;
    CLOSE c;
    RETURN i;
  END;
  FUNCTION GET_COUNT_TEMPOUT(pFD_DATA1 IN DATE, pFD_DATA2 IN DATE)
  RETURN NUMBER
   IS
    CURSOR c IS
      select count(fk_id)
        from tsroky
       where fd_data1 between pFD_DATA1 and pFD_DATA2+1-1/(24*60*60)
         and fk_pryb=7;
    i NUMBER;
  BEGIN
    OPEN c;
    FETCH c INTO i;
    CLOSE c;
    RETURN i;
  END;
  FUNCTION DO_CALC_REPORT (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_VRACHID IN NUMBER)
  RETURN NUMBER
   IS-- Used in rPacMoveSochi.dpr
    CURSOR cKorp is SELECT * FROM TKORP ORDER BY FN_ORDER;
    cC CLOB;
    nC NUMBER;
    str VARCHAR2 (32767);
    nTemp NUMBER;
    n1 NUMBER;
    n2 NUMBER;
    n3 NUMBER;
    n4 NUMBER;
  BEGIN
    INSERT INTO TCLOBS (FC_CLOB)
         VALUES (EMPTY_CLOB () )
      RETURNING FK_ID, FC_CLOB INTO nC, cC;
    DBMS_LOB.OPEN (cC, DBMS_LOB.LOB_READWRITE);
    str := PKG_HTML.GET_HEAD('word','Отчет о движении пациентов по санаторию "' ||PKG_SMINI.READSTRING('CONFIG','S_NAME','Не известен')||'"',
                             null,null,null,
                             null,null,null,
                             null,null,null,
                             null,null,null,
                             null,null,null,null,
                             null,null,null,null,
                             null,null,null,null,
                             null,null,null);
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    str :='<BODY><P ALIGN="CENTER">Объединенный санаторий "'||PKG_SMINI.READSTRING('CONFIG','S_NAME','Не известен')||'"<BR>'||
          'Движение отдыхающих за период с ' || TO_CHAR (pFD_DATA1, 'dd.mm.yyyy') || ' по ' || TO_CHAR (pFD_DATA2, 'dd.mm.yyyy') || '</P><BR>'||
          '<table>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    str :='<TR>'||
          '<TD>Корпус:</TD>'||
          '<TD>Состояло на начало периода:</TD>'||
          '<TD>Поступило:</TD>'||
          '<TD>Выбыло:</TD>'||
          '<TD>Состоит на конец периода:</TD>'||
          '</TR>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);

    FOR p in cKorp LOOP
      n1 :=0;
      n2 :=0;
      n3 :=0;
      n4 :=0;
      n1 := PKG_R_ALLFUNC.GET_COUNT_MORNING_KORP (pFD_DATA1,p.FK_ID);
      n4 := PKG_R_ALLFUNC.GET_COUNT_MORNING_KORP (pFD_DATA2 + 1,p.FK_ID);
      FOR d IN 0 .. pFD_DATA2 - pFD_DATA1 LOOP
        n2 := n2 + PKG_R_ALLFUNC.GET_COUNT_INC_KORP (pFD_DATA1 + d,p.FK_ID) + PKG_R_ALLFUNC.GET_COUNT_RECOVER_KORP (pFD_DATA1 + d,p.FK_ID);
        n3 := n3 + PKG_R_ALLFUNC.GET_COUNT_OUT_KORP (pFD_DATA1 + d,p.FK_ID) + PKG_R_ALLFUNC.GET_COUNT_TEMPOUT_KORP (pFD_DATA1 + d,p.FK_ID);
      END LOOP;
      str  :=
      '<TR><TD>'|| p.FC_NAME ||'</TD>'||
      '<TD>'|| PKG_R_ALLFUNC.RETURN_VALUE( n1 ) ||'</TD>'||
      '<TD>'|| PKG_R_ALLFUNC.RETURN_VALUE( n2 ) ||'</TD>'||
      '<TD>'|| PKG_R_ALLFUNC.RETURN_VALUE( n3 ) ||'</TD>'||
      '<TD>'|| PKG_R_ALLFUNC.RETURN_VALUE( n4 ) ||'</TD></TR>';
      DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    END LOOP;

    str  :=
      '<TR><TD><B>Всего по санаторию:</B></TD>'||
      '<TD><B>' || PKG_R_ALLFUNC.GET_COUNT_MORNING (pFD_DATA1) || '</B></TD>'||
      '<TD><B>' || (PKG_R_ALLFUNC.GET_COUNT_INC (pFD_DATA1, pFD_DATA2)+GET_COUNT_RECOVER (pFD_DATA1, pFD_DATA2)) || '</B></TD>'||
      '<TD><B>' || (PKG_R_ALLFUNC.GET_COUNT_OUT (pFD_DATA1, pFD_DATA2)+GET_COUNT_TEMPOUT (pFD_DATA1, pFD_DATA2)) || '</B></TD>'||
      '<TD><B>' || PKG_R_ALLFUNC.GET_COUNT_MORNING (pFD_DATA2+1) || '</B></TD></TR>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);

    str  := '</TABLE>'||
            '<BR><P><B>Отчет составил: _________________________ ' || DO_VRACHFIO (pFK_VRACHID) || '</B></P></BODY></HTML>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    DBMS_LOB.CLOSE (cC);
    RETURN nC;
  END;
end PKG_R_PACMOVESOCHI;
/

SHOW ERRORS;


