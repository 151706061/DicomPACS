DROP PACKAGE BODY ASU.PKG_R_PERESEL
/

--
-- PKG_R_PERESEL  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_R_PERESEL" 
 is-- Created by TimurLan

  FUNCTION DO_CALC_REPORT (pFD_DATA IN DATE, pFK_VRACHID IN NUMBER)
  RETURN NUMBER
   IS-- Used in rPeresel.dpr
    CURSOR cMain is
      SELECT FK_PACID
        FROM (SELECT FK_PACID,COUNT(FK_PACID) FN_COUNT
                FROM TPERESEL
               WHERE TRUNC(FD_DATA2) = pFD_DATA
                  OR TRUNC(FD_DATA1) = pFD_DATA
            GROUP BY FK_PACID)
       WHERE FN_COUNT > 1;
    CURSOR cList (pFK_PACID in NUMBER) is
      SELECT GET_SHOWN_PERESEL(FK_ID)||' ('||GET_PALATA_FCVID (GET_PALATAVID(FK_PALATAID,pFD_DATA))||')' FC_PALATA
        FROM TPERESEL
       WHERE FK_PACID = pFK_PACID
    ORDER BY FK_ID;
    nC NUMBER;
    cC CLOB;
    str VARCHAR2 (32767);
    str1 VARCHAR2 (32767);
    nTemp NUMBER;
  function REPLACE_SPACES (pFC_VALUE IN VARCHAR2)
  return VARCHAR2
   is
    Result VARCHAR2(32767);
    nTemp BINARY_INTEGER;
  begin
    Result := TRIM(' ' FROM pFC_VALUE);
    IF Result IS NULL THEN
      return Null;
    end if;
    LOOP
      EXIT WHEN INSTR (Result,'  ')=0;
      Result := REPLACE (Result,'  ',' ');
    END LOOP;
    return(Result);
  end;
  function GET_PAC_IB(pFK_PACID IN BINARY_INTEGER)
  return VARCHAR2
   is
    CURSOR c
     IS
      SELECT FK_IBID,FK_IBY FROM TKARTA WHERE FK_ID=pFK_PACID;
    id BINARY_INTEGER;
    y BINARY_INTEGER;
  begin
    open c;
    fetch c into id,y;
    close c;
    if (id is NULL) or (y is NULL) then
      return '';
    end if;
    return TO_CHAR(id)||'/'||TO_CHAR(y);
  end;
  function GET_PAC_FIO (pFK_PACID IN BINARY_INTEGER)
  return VARCHAR2
   is
    CURSOR c
     IS
      SELECT FC_FAM || ' ' || DECODE (VarcharIsNUll(FC_IM), 1, '', SUBSTR (FC_IM, 0, 1) || '. ' || DECODE (VarcharIsNUll(FC_OTCH), 1, '', SUBSTR (FC_OTCH, 0, 1) || '. '))
        FROM TPEOPLES
       WHERE FK_ID=(SELECT FK_PEPLID FROM TKARTA WHERE FK_ID=pFK_PACID);
    Result VARCHAR2(100);
  begin
    open c;
    fetch c into Result;
    close c;
    return(REPLACE_SPACES(Result));
  end;
  BEGIN
    INSERT INTO TCLOBS (FC_CLOB)
         VALUES (EMPTY_CLOB () )
      RETURNING FK_ID, FC_CLOB INTO nC, cC;
    DBMS_LOB.OPEN (cC, DBMS_LOB.LOB_READWRITE);

    str := PKG_HTML.GET_HEAD('excel','Данные о переселнеиях по санаторию "'||PKG_SMINI.READSTRING('CONFIG','S_NAME','Не известен')||'" на '||TO_CHAR(pFD_DATA,'dd.mm.yyyy'),
                             null,'10.0',null,
                             null,null,null,
                             null,null,null,
                             '297','210','landscape',
                             '.39','.39','.39','.78',
                             null,null,null,'left',
                             null,null,null,null,
                             null,null,null);
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    str :='<BODY>'||
          '<P align="CENTER"><B>Данные о переселнеиях по санаторию "' ||PKG_SMINI.READSTRING ('CONFIG', 'S_NAME', 'Не известен') ||'"</B><BR> на ' || TO_CHAR (pFD_DATA, 'dd.mm.yyyy') || '</P>'||
          '<table>'||
          '<TR>'||
          ' <TD><p class=user>№ ИБ:</p></TD>'||
          ' <TD><p class=user>Ф.И.О.:</p></TD>'||
          ' <TD><p class=user>Переселения:</p></TD>'||
          '</TR>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);

    FOR k IN cMain LOOP
      str:='';
      str1:='';
      FOR p IN cList(k.FK_PACID) LOOP
        str1:=str1||p.FC_PALATA||'<BR>';
      END LOOP;
      str:=str||
        '<TR>'||
        ' <TD class=user style=''text-align:right;mso-number-format:"\@";''><p class=user>'||GET_PAC_IB(k.FK_PACID)||'</p></TD>'||
        ' <TD class=user><p class=user>'||GET_PAC_FIO(k.FK_PACID)||'</p></TD>'||
        ' <TD class=user><p class=user>'||str1||'</p></TD>'||
        '</TR>';
      DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    END LOOP;

    str  := '</TABLE><BR><P><B>Отчет составил_________________________' || DO_VRACHFIO (pFK_VRACHID)||
            '</B></P></BODY></HTML>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    DBMS_LOB.CLOSE (cC);
    RETURN nC;
  END;
end PKG_R_PERESEL;
/

SHOW ERRORS;


