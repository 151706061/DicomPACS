DROP PACKAGE BODY ASU.PKG_R_FREEROOM
/

--
-- PKG_R_FREEROOM  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_R_FREEROOM" 
 is-- Created by TimurLan
  FUNCTION DO_CALC_REPORT(pTAB_NAME IN VARCHAR2, pFD_DATE IN DATE, pFK_VRACHID IN NUMBER)
  RETURN NUMBER
   IS-- Created by TimurLan (4 'Данные о свободных местах' - rFreeRoom.dpr)
  TYPE RefCurType IS REF CURSOR;
   c RefCurType;
   cC CLOB;
   nC NUMBER;
   str VARCHAR2 (4000);
   pFC_FIELD1 VARCHAR2(100);
   pFC_FIELD2 VARCHAR2(100);
   pFC_FIELD3 VARCHAR2(100);
  BEGIN
    INSERT INTO TCLOBS (FC_CLOB)
           VALUES (EMPTY_CLOB () )
           RETURNING FK_ID, FC_CLOB
           INTO nC, cC;

    DBMS_LOB.OPEN (cC, DBMS_LOB.LOB_READWRITE);
    str := PKG_HTML.GET_HEAD('word','Данные о свободных местах на '||TO_CHAR(pFD_DATE,'dd.mm.yyyy')||' по санаторию "'||PKG_SMINI.READSTRING('CONFIG','S_NAME','Не известен')||'"',
                             null,'10.0',null,
                             null,null,null,
                             null,null,null,
                             null,null,null,
                             null,null,null,null,
                             null,null,null,null,
                             null,null,null,null,
                             null,null,null);
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);

    str := '<BODY>'||
           '<div class=user>'||
           '<P ALIGN="CENTER"><B>Данные о свободных местах на ' || TO_CHAR (pFD_DATE, 'dd.mm.yyyy') || '<BR>по санаторию "' || PKG_SMINI.READSTRING ('CONFIG', 'S_NAME', 'Не известен') || '"</B></P>'||
           '<BR>'||
           '<table>'||
           '<TR>'||
           '<TD WIDTH="25%"><B>Этаж:</B></TD>'||
           '<TD WIDTH="50%"><B>Виды свободных мест:</B></TD>'||
           '<TD WIDTH="25%"><B>Кол-во мест:</B></TD>'||
           '</TR>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);

    OPEN c FOR 'SELECT * FROM ' || pTAB_NAME;
    LOOP
      FETCH c INTO  pFC_FIELD1,  pFC_FIELD2,  pFC_FIELD3;
      EXIT WHEN c%NOTFOUND;

      str  := '<TR><TD><P class=user>' || NVL(pFC_FIELD1,'&nbsp') || '</P></TD><TD><P class=user>' || NVL(pFC_FIELD2,'&nbsp') || '</P></TD><TD><P class=user>' || NVL(pFC_FIELD3,'&nbsp') || '</P></TD>';
      str  := str || '</TR>';
      DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);

    END LOOP;
    CLOSE c;

    str  := '</TABLE><BR>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);

    str  := '<P><B>Отчет составил: _________________________ ' || DO_VRACHFIO (pFK_VRACHID) || '</B></P>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);

    str  := '</DIV></BODY></HTML>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    DBMS_LOB.CLOSE (cC);
    RETURN nC;
  END;
end PKG_R_FREEROOM;
/

SHOW ERRORS;


