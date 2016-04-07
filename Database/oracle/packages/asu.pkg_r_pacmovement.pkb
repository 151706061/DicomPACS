DROP PACKAGE BODY ASU.PKG_R_PACMOVEMENT
/

--
-- PKG_R_PACMOVEMENT  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_R_PACMOVEMENT" -- Created by TimurLan
 IS
  FUNCTION GET_COUNT_INC_PALATA(pFD_DATAC IN DATE,pFK_TYPEID IN NUMBER)
  RETURN NUMBER
   IS
    CURSOR c IS
      select count(fk_id)
        from tsroky
       where fd_data1 between pFD_DATAC and pFD_DATAC+1-1/(24*60*60)
         and fk_pryb=2
         AND GET_PALATAVID(GET_PACPALATADATE(FK_PACID,pFD_DATAC),pFD_DATAC)=pFK_TYPEID;
    i NUMBER;
  BEGIN
    OPEN c;
    FETCH c INTO i;
    CLOSE c;
    RETURN i;
  END;
  FUNCTION GET_COUNT_INC_PUT(pFD_DATAC IN DATE,pFK_TYPEID IN NUMBER)
  RETURN NUMBER
   IS
    CURSOR c IS
      select count(*)
        from tsroky,tkarta
       where fd_data1 between pFD_DATAC and pFD_DATAC+1-1/(24*60*60)
         and fk_pryb=2
         AND TKARTA.FK_PUTTYPE=pFK_TYPEID
         AND TKARTA.FK_ID=FK_PACID;
    i NUMBER;
  BEGIN
    OPEN c;
    FETCH c INTO i;
    CLOSE c;
    RETURN i;
  END;
  FUNCTION GET_COUNT_RECOVER_PALATA(pFD_DATAC IN DATE,pFK_TYPEID IN NUMBER)
  RETURN NUMBER
   IS
    CURSOR c IS
      select count(fk_id)
        from tsroky
       where fd_data1 between pFD_DATAC and pFD_DATAC+1-1/(24*60*60)
         and fk_pryb=4
         AND GET_PALATAVID(GET_PACPALATADATE(FK_PACID,pFD_DATAC),pFD_DATAC)=pFK_TYPEID;
    i NUMBER;
  BEGIN
    OPEN c;
    FETCH c INTO i;
    CLOSE c;
    RETURN i;
  END;
  FUNCTION GET_COUNT_RECOVER_PUT(pFD_DATAC IN DATE,pFK_TYPEID IN NUMBER)
  RETURN NUMBER
   IS
    CURSOR c IS
      select count(*)
        from tsroky,tkarta
       where fd_data1 between pFD_DATAC and pFD_DATAC+1-1/(24*60*60)
         and fk_pryb=4
         AND TKARTA.FK_PUTTYPE=pFK_TYPEID
         AND TKARTA.FK_ID=FK_PACID;
    i NUMBER;
  BEGIN
    OPEN c;
    FETCH c INTO i;
    CLOSE c;
    RETURN i;
  END;
  FUNCTION GET_COUNT_PRYB_PERIOD_PALATA(pFD_DATA1 IN DATE, pFD_DATA2 IN DATE,pFK_TYPEID IN NUMBER)
  RETURN VARCHAR2
   IS
    i NUMBER;
    s1 NUMBER;
    s2 NUMBER;
  BEGIN
    S1:=0;
    S2:=0;
    FOR i IN 0..pFD_DATA2-pFD_DATA1 LOOP
      S1:=S1+GET_COUNT_INC_PALATA(pFD_DATA1+i,pFK_TYPEID);
      S2:=S2+GET_COUNT_RECOVER_PALATA(pFD_DATA1+i,pFK_TYPEID);
    END LOOP;
    if S2 > 0 then
      RETURN TO_CHAR(S1)||'+'||TO_CHAR(S2);
    else
      RETURN TO_CHAR(S1);
    end if;
  END;
  FUNCTION GET_COUNT_PRYB_PERIOD_PUT(pFD_DATA1 IN DATE, pFD_DATA2 IN DATE,pFK_TYPEID IN NUMBER)
  RETURN VARCHAR2
   IS
    i NUMBER;
    s1 NUMBER;
    s2 NUMBER;
  BEGIN
    S1:=0;
    S2:=0;
    FOR i IN 0..pFD_DATA2-pFD_DATA1 LOOP
      S1:=S1+GET_COUNT_INC_PUT(pFD_DATA1+i,pFK_TYPEID);
      S2:=S2+GET_COUNT_RECOVER_PUT(pFD_DATA1+i,pFK_TYPEID);
    END LOOP;
    if S2 > 0 then
      RETURN TO_CHAR(S1)||'+'||TO_CHAR(S2);
    else
      RETURN TO_CHAR(S1);
    end if;
  END;
  FUNCTION GET_COUNT_OUT_PALATA(pFD_DATAC IN DATE,pFK_TYPEID IN NUMBER)
  RETURN NUMBER
   IS
    Cursor c IS
      select count(fk_id)
        from tsroky
       where fd_data1 between pFD_DATAC and pFD_DATAC+1-1/(24*60*60)
         and fk_pryb=3
         AND GET_PALATAVID(GET_PACPALATADATE(FK_PACID,pFD_DATAC),pFD_DATAC)=pFK_TYPEID;
    i NUMBER;
  BEGIN
    OPEN c;
    FETCH c INTO i;
    CLOSE c;
    RETURN i;
  END;
  FUNCTION GET_COUNT_OUT_PUT(pFD_DATAC IN DATE,pFK_TYPEID IN NUMBER)
  RETURN NUMBER
   IS
    Cursor c IS
      select count(*)
        from tsroky,tkarta
       where fd_data1 between pFD_DATAC and pFD_DATAC+1-1/(24*60*60)
         and fk_pryb=3
         AND TKARTA.FK_PUTTYPE=pFK_TYPEID
         AND TKARTA.FK_ID=FK_PACID;
    i NUMBER;
  BEGIN
    OPEN c;
    FETCH c INTO i;
    CLOSE c;
    RETURN i;
  END;
  FUNCTION GET_COUNT_TEMPOUT_PALATA(pFD_DATAC IN DATE,pFK_TYPEID IN NUMBER)
  RETURN NUMBER
   IS
    CURSOR c IS
      select count(fk_id)
        from tsroky
       where fd_data1 between pFD_DATAC and pFD_DATAC+1-1/(24*60*60)
         and fk_pryb=7
         AND GET_PALATAVID(GET_PACPALATADATE(FK_PACID,pFD_DATAC),pFD_DATAC)=pFK_TYPEID;
    i NUMBER;
  BEGIN
    OPEN c;
    FETCH c INTO i;
    CLOSE c;
    RETURN i;
  END;
  FUNCTION GET_COUNT_TEMPOUT_PUT(pFD_DATAC IN DATE,pFK_TYPEID IN NUMBER)
  RETURN NUMBER
   IS
    CURSOR c IS
      select count(*)
        from tsroky,tkarta
       where fd_data1 between pFD_DATAC and pFD_DATAC+1-1/(24*60*60)
         and fk_pryb=7
         AND TKARTA.FK_PUTTYPE=pFK_TYPEID
         AND TKARTA.FK_ID=FK_PACID;
    i NUMBER;
  BEGIN
    OPEN c;
    FETCH c INTO i;
    CLOSE c;
    RETURN i;
  END;
  FUNCTION GET_COUNT_VYB_PERIOD_PALATA(pFD_DATA1 IN DATE, pFD_DATA2 IN DATE,pFK_TYPEID IN NUMBER)
  RETURN VARCHAR2
   IS
    i NUMBER;
    s1 NUMBER;
    s2 NUMBER;
  BEGIN
    S1:=0;
    S2:=0;
    FOR i IN 0..pFD_DATA2-pFD_DATA1 LOOP
      S1:=S1+GET_COUNT_OUT_PALATA(pFD_DATA1+i,pFK_TYPEID);
      S2:=S2+GET_COUNT_TEMPOUT_PALATA(pFD_DATA1+i,pFK_TYPEID);
    END LOOP;
    if S2 > 0 then
      RETURN TO_CHAR(S1)||'+'||TO_CHAR(S2);
    else
      RETURN TO_CHAR(S1);
    end if;
  END;
  FUNCTION GET_COUNT_VYB_PERIOD_PUT(pFD_DATA1 IN DATE, pFD_DATA2 IN DATE,pFK_TYPEID IN NUMBER)
  RETURN VARCHAR2
   IS
    i NUMBER;
    s1 NUMBER;
    s2 NUMBER;
  BEGIN
    S1:=0;
    S2:=0;
    FOR i IN 0..pFD_DATA2-pFD_DATA1 LOOP
      S1:=S1+GET_COUNT_OUT_PUT(pFD_DATA1+i,pFK_TYPEID);
      S2:=S2+GET_COUNT_TEMPOUT_PUT(pFD_DATA1+i,pFK_TYPEID);
    END LOOP;
    if S2 > 0 then
      RETURN TO_CHAR(S1)||'+'||TO_CHAR(S2);
    else
      RETURN TO_CHAR(S1);
    end if;
  END;
-------------------------------------------------------------------------------------------------------------
-- Без разбивки ---------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------
  FUNCTION DO_CALC_REPORT_SIMPLE (pFD_DATA1 IN DATE,pFD_DATA2 IN DATE, pFK_VRACHID IN NUMBER)
  RETURN NUMBER
   IS-- Used in rPacMovement.dpr
    nDays NUMBER;
    i NUMBER;
    j NUMBER;
    k NUMBER;
    cid NUMBER;
    nCols NUMBER;
    nKont NUMBER;
    cName VARCHAR2(30);
    nTemp NUMBER;
    t TTable;
    cC CLOB;
    nC NUMBER;
    HTMLText VARCHAR2 (32767);
    cTmp VARCHAR2 (32767);
    nSUM_BEGIN NUMBER;
    nSUM_END NUMBER;
   BEGIN
    INSERT INTO TCLOBS(FC_CLOB)
         VALUES (EMPTY_CLOB())
      RETURNING FK_ID,FC_CLOB INTO nC,cC;
    DBMS_LOB.OPEN(cC,DBMS_LOB.LOB_READWRITE);

    HTMLText := PKG_HTML.GET_HEAD('excel','Движение пациентов за период с ' || TO_CHAR (pFD_DATA1, 'dd.mm.yyyy') || ' по ' || TO_CHAR (pFD_DATA2, 'dd.mm.yyyy'),
                             null,null,null,
                             null,null,null,
                             null,null,null,
                             null,null,null,
                             null,null,null,null,
                             null,null,null,'left',
                             null,null,null,null,
                             null,null,null);
    HTMLText := HTMLText || '<BODY><P ALIGN="CENTER"><B>Санаторий "'||PKG_SMINI.READSTRING('CONFIG','S_NAME','Не известен')||'"<BR>Движение пациентов за период с ' || TO_CHAR (pFD_DATA1, 'dd.mm.yyyy') || ' по ' || TO_CHAR (pFD_DATA2, 'dd.mm.yyyy') || '</B></P><BR>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(HTMLText),HTMLText);

    OPEN cKont;
    i:=1;
    LOOP
      FETCH cKont INTO j;
      EXIT WHEN cKont%NOTFOUND;
      t(i):=j;
      inc(i);
    END LOOP;
    CLOSE cKont;

    HTMLText := '<TABLE>'||
                '<TR><TD rowspan=2><B>Дата:</B></TD>'||
                '<TD rowspan=2><B>На начало дня:</B></TD>'||
                '<TD rowspan=2><B>Прибыло:</B></TD>'||
                '<TD rowspan=2><B>Выбыло:</B></TD>'||
                '<TD rowspan=2><B>На конец дня:</B></TD>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(HTMLText),HTMLText);

    i:=0;cTmp:='';
    IF cKontShort%ISOPEN THEN
      CLOSE cKontShort;
    END IF;
    OPEN cKontShort;
    LOOP
      FETCH cKontShort INTO cName;
      EXIT WHEN cKontShort%NOTFOUND;
      cTmp := cTmp ||'<TD class=v>'||cName||':</TD>';
      inc(i);
    END LOOP;
    CLOSE cKontShort;

    HTMLText := '<TD colspan='||TO_CHAR(i+1)||'><B>Койко-дней:</B></TD></TR>'||
                '<TR><TD><B>Всего:</B></TD>' || cTmp || '</TR>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(HTMLText),HTMLText);

    nDays:=pFD_DATA2-pFD_DATA1+1;

    nSUM_BEGIN:=0;
    nSUM_END:=0;
    FOR i IN 0..nDays-1 LOOP
      HTMLText:='<TR><TD>'||TO_CHAR(pFD_DATA1+i,'dd.mm.yyyy')||'</TD>';

      nTemp:=PKG_R_ALLFUNC.GET_COUNT_MORNING(pFD_DATA1+i);
      nSUM_BEGIN := nSUM_BEGIN + nTemp;

      HTMLText:=HTMLText ||'<TD>'||PKG_R_ALLFUNC.RETURN_VALUE(nTemp)||'</TD>'||
               '<TD>'||PKG_R_ALLFUNC.RETURN_VALUE(PKG_R_ALLFUNC.GET_COUNT_PRYB(pFD_DATA1+i))||'</TD>'||
               '<TD>'||PKG_R_ALLFUNC.RETURN_VALUE(PKG_R_ALLFUNC.GET_COUNT_VYB(pFD_DATA1+i))||'</TD>';

      nTemp:=PKG_R_ALLFUNC.GET_COUNT_MORNING(pFD_DATA1+i+1);
      nSUM_END := nSUM_END + nTemp;

      HTMLText:=HTMLText||'<TD>'||PKG_R_ALLFUNC.RETURN_VALUE(nTemp)||'</TD>'||
                '<TD>'||PKG_R_ALLFUNC.RETURN_VALUE(PKG_R_KDNFUNC.GET_KDN(pFD_DATA1+i))||'</TD>';

      FOR j IN 1..t.COUNT LOOP
        HTMLText:=HTMLText||'<TD>'||PKG_R_ALLFUNC.RETURN_VALUE(GET_KDN_PRIZN(pFD_DATA1+i,t(j)))||'</TD>';
      END LOOP;

      HTMLText := HTMLText||'</TR>';
      DBMS_LOB.WRITEAPPEND(cC,LENGTH(HTMLText),HTMLText);
    end LOOP;

    HTMLText := '<TR><TD><B>ИТОГО:</B></TD>'||
                '<TD><B>'||TO_CHAR(nSUM_BEGIN)||'</B></TD>'||
                '<TD><B>'||PKG_R_ALLFUNC.GET_COUNT_PRYB(pFD_DATA1,pFD_DATA2)||'</B></TD>'||
                '<TD><B>'||PKG_R_ALLFUNC.GET_COUNT_VYB(pFD_DATA1,pFD_DATA2)||'</B></TD>'||
                '<TD><B>'||TO_CHAR(nSUM_END)||'</B></TD>'||
                '<TD><B>'||PKG_R_KDNFUNC.GET_KDN(pFD_DATA1,pFD_DATA2)||'</B></TD>';

    FOR j IN 1..t.COUNT LOOP
      HTMLText:=HTMLText||'<TD><B>'||GET_KDN_PERIOD_PRIZN(pFD_DATA1,pFD_DATA2,t(j))||'</B></TD>';
    END LOOP;

    HTMLText := HTMLText||'</TR></TABLE><BR><P><B>Отчет составил: _________________________ ' || DO_VRACHFIO (pFK_VRACHID) || '</B></P></BODY></HTML>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(HTMLText),HTMLText);
    DBMS_LOB.CLOSE(cC);
    RETURN nC;
  END;
-------------------------------------------------------------------------------------------------------------
-- По типу прибытия -----------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------
  FUNCTION DO_CALC_REPORT_TYPES (pFD_DATA1 IN DATE,pFD_DATA2 IN DATE, pFK_VRACHID IN NUMBER)
  RETURN NUMBER
   IS-- Used in rPacMovement.dpr
    nDays NUMBER;
    i      NUMBER;
    cid  NUMBER;
    j NUMBER;
    nTemp NUMBER;
    t TTable;
    tv TTable;
    ts TSTable;
    cC CLOB;
    nC NUMBER;
    HTMLText VARCHAR2 (32767);
    k NUMBER;
    cTmp VARCHAR2 (32767);
    cName VARCHAR2 (30);
    TYPE TItogo IS TABLE OF VARCHAR2(100)
                INDEX BY BINARY_INTEGER;
    tI TItogo;
   BEGIN
    INSERT INTO TCLOBS(FC_CLOB)
         VALUES (EMPTY_CLOB())
      RETURNING FK_ID,FC_CLOB INTO nC,cC;
    DBMS_LOB.OPEN(cC,DBMS_LOB.LOB_READWRITE);

    HTMLText := PKG_HTML.GET_HEAD('excel','Движение пациентов за период с ' || TO_CHAR (pFD_DATA1, 'dd.mm.yyyy') || ' по ' || TO_CHAR (pFD_DATA2, 'dd.mm.yyyy'),
                             null,null,null,
                             null,null,null,
                             null,null,null,
                             null,null,null,
                             null,null,null,null,
                             null,null,null,'left',
                             null,null,null,null,
                             null,null,null);
    HTMLText := HTMLText || '<BODY><P ALIGN="CENTER"><B>Санаторий "'||PKG_SMINI.READSTRING('CONFIG','S_NAME','Не известен')||'"<BR>Движение пациентов за период с ' || TO_CHAR (pFD_DATA1, 'dd.mm.yyyy') || ' по ' || TO_CHAR (pFD_DATA2, 'dd.mm.yyyy') || '</B></P><BR>'||
                            '<TABLE>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(HTMLText),HTMLText);

    i:=1;
    FOR p in cKont LOOP
      t(i):=p.FK_ID;
      inc(i);
    END LOOP;

    i:=1;
    FOR p in cVid LOOP
      tv(i):=p.FK_ID;
      inc(i);
    END LOOP;

    i:=1;
    FOR p in cVidShort LOOP
      ts(i):=p.FC_NAME;
      inc(i);
    END LOOP;

    OPEN cVidCount;
    FETCH cVidCount into i;
    CLOSE cVidCount;

    OPEN cKontCount;
    FETCH cKontCount into j;
    CLOSE cKontCount;

    HTMLText := '<TR><TD rowspan=2><B>Дата:</B></TD>'||
                '<TD colspan='||TO_CHAR(i+1)||'><B>На начало дня:</B></TD>'||
                '<TD colspan='||TO_CHAR(i+1)||'><B>Прибыло:</B></TD>'||
                '<TD colspan='||TO_CHAR(i+1)||'><B>Выбыло:</B></TD>'||
                '<TD colspan='||TO_CHAR(i+1)||'><B>На конец дня:</B></TD>'||
                '<TD colspan='||TO_CHAR(j+1)||'><B>Койко-дней:</B></TD></TR>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(HTMLText),HTMLText);

    k:= 4*(i+1)+(j+1)+1;
    FOR i in 1..k LOOP
      tI(i):='0';
    END LOOP;

    HTMLText := '<TR><TD><B>Всего:</B></TD>';
    FOR i in 1..ts.Count LOOP
      HTMLText := HTMLText||'<TD class=v>'||ts(i)||':</TD>';
    END LOOP;

    HTMLText := HTMLText||'<TD><B>Всего:</B></TD>';
    FOR i in 1..ts.Count LOOP
      HTMLText := HTMLText||'<TD class=v>'||ts(i)||':</TD>';
    END LOOP;

    HTMLText := HTMLText||'<TD><B>Всего:</B></TD>';
    FOR i in 1..ts.Count LOOP
      HTMLText := HTMLText||'<TD class=v>'||ts(i)||':</TD>';
    END LOOP;

    HTMLText := HTMLText||'<TD><B>Всего:</B></TD>';
    FOR i in 1..ts.Count LOOP
      HTMLText := HTMLText||'<TD class=v>'||ts(i)||':</TD>';
    END LOOP;

    HTMLText := HTMLText||'<TD><B>Всего:</B></TD>';
    FOR p in cKontShort LOOP
      HTMLText := HTMLText||'<TD class=v>'||p.FC_SHORT||':</TD>';
    END LOOP;

    HTMLText := HTMLText||'</TR>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(HTMLText),HTMLText);

    nDays:=pFD_DATA2-pFD_DATA1+1;
    FOR i IN 0..nDays-1 LOOP
      HTMLText := '<TR><TD>'||TO_CHAR(pFD_DATA1+i,'dd.mm.yyyy')||'</TD>';

      k        := 1;
      nTemp    := PKG_R_ALLFUNC.GET_COUNT_MORNING(pFD_DATA1+i);
      tI(k)    := TO_CHAR(TO_NUMBER(tI(k)) + nTemp );
      HTMLText := HTMLText||'<TD>'||PKG_R_ALLFUNC.RETURN_VALUE(nTemp)||'</TD>';

      FOR j IN 1..tv.COUNT LOOP
        k        := k + 1;
        nTemp    := PKG_R_ALLFUNC.GET_COUNT_MORNING_VID(pFD_DATA1+i,tv(j));
        tI(k)    := TO_CHAR(TO_NUMBER(tI(k)) + nTemp );
        HTMLText := HTMLText||'<TD>'||PKG_R_ALLFUNC.RETURN_VALUE(nTemp)||'</TD>';
      END LOOP;

      k        := k + 1;
      HTMLText := HTMLText||'<TD>'||PKG_R_ALLFUNC.RETURN_VALUE(PKG_R_ALLFUNC.GET_COUNT_PRYB(pFD_DATA1+i))||'</TD>';

      FOR j IN 1..tv.COUNT LOOP
        k        := k + 1;
        HTMLText := HTMLText||'<TD>'||PKG_R_ALLFUNC.RETURN_VALUE(PKG_R_ALLFUNC.GET_COUNT_PRYB_VID(pFD_DATA1+i,tv(j)))||'</TD>';
      END LOOP;

      k        := k + 1;
      HTMLText := HTMLText||'<TD>'||PKG_R_ALLFUNC.RETURN_VALUE(PKG_R_ALLFUNC.GET_COUNT_VYB(pFD_DATA1+i))||'</TD>';

      FOR j IN 1..tv.COUNT LOOP
        k        := k + 1;
        HTMLText := HTMLText||'<TD>'||PKG_R_ALLFUNC.RETURN_VALUE(PKG_R_ALLFUNC.GET_COUNT_VYB_VID(pFD_DATA1+i,tv(j)))||'</TD>';
      END LOOP;

      k        := k + 1;
      nTemp    := PKG_R_ALLFUNC.GET_COUNT_MORNING(pFD_DATA1+i+1);
      tI(k)    := TO_CHAR(TO_NUMBER(tI(k)) + nTemp );
      HTMLText := HTMLText||'<TD>'||PKG_R_ALLFUNC.RETURN_VALUE(nTemp)||'</TD>';

      FOR j IN 1..tv.COUNT LOOP
        k        := k + 1;
        nTemp    := PKG_R_ALLFUNC.GET_COUNT_MORNING_VID(pFD_DATA1+i+1,tv(j));
        tI(k)    := TO_CHAR(TO_NUMBER(tI(k)) + nTemp );
        HTMLText := HTMLText||'<TD>'||PKG_R_ALLFUNC.RETURN_VALUE(nTemp)||'</TD>';
      END LOOP;

      k        := k + 1;
      nTemp    := PKG_R_KDNFUNC.GET_KDN(pFD_DATA1+i);
      tI(k)    := TO_CHAR(TO_NUMBER(tI(k)) + nTemp );
      HTMLText := HTMLText||'<TD>'||PKG_R_ALLFUNC.RETURN_VALUE(nTemp)||'</TD>';

      FOR j IN 1..t.COUNT LOOP
        k        := k + 1;
        nTemp    := GET_KDN_PRIZN(pFD_DATA1+i,t(j));
        tI(k)    := TO_CHAR(TO_NUMBER(tI(k)) + nTemp );
        HTMLText := HTMLText||'<TD>'||PKG_R_ALLFUNC.RETURN_VALUE(nTemp)||'</TD>';
      END LOOP;

      HTMLText := HTMLText||'</TR>';
      DBMS_LOB.WRITEAPPEND(cC,LENGTH(HTMLText),HTMLText);
    END LOOP;

    HTMLText := '<TR><TD><B>ИТОГО:</B></TD>';

    k        := 1;
    HTMLText := HTMLText||'<TD><B>'||tI(k)||'</B></TD>';

    FOR j IN 1..tv.COUNT LOOP
      k        := k + 1;
      HTMLText := HTMLText||'<TD><B>'||tI(k)||'</B></TD>';
    END LOOP;

    k        := k + 1;
    HTMLText := HTMLText||'<TD><B>'||PKG_R_ALLFUNC.GET_COUNT_PRYB(pFD_DATA1,pFD_DATA2)||'</B></TD>';

    FOR j IN 1..tv.COUNT LOOP
      k        := k + 1;
      HTMLText := HTMLText||'<TD><B>'||PKG_R_ALLFUNC.GET_COUNT_PRYB_VID(pFD_DATA1,pFD_DATA2,tv(j))||'</B></TD>';
    END LOOP;

    k        := k + 1;
    HTMLText := HTMLText||'<TD><B>'||PKG_R_ALLFUNC.GET_COUNT_VYB(pFD_DATA1,pFD_DATA2)||'</B></TD>';

    FOR j IN 1..tv.COUNT LOOP
      k        := k + 1;
      HTMLText := HTMLText||'<TD><B>'||PKG_R_ALLFUNC.GET_COUNT_VYB_VID(pFD_DATA1,pFD_DATA2,tv(j))||'</B></TD>';
    END LOOP;

    k        := k + 1;
    HTMLText := HTMLText||'<TD><B>'||tI(k)||'</B></TD>';

    FOR j IN 1..tv.COUNT LOOP
      k        := k + 1;
      HTMLText := HTMLText||'<TD><B>'||tI(k)||'</B></TD>';
    END LOOP;

    k        := k + 1;
    HTMLText := HTMLText||'<TD><B>'||tI(k)||'</B></TD>';

    FOR j IN 1..t.COUNT LOOP
      k        := k + 1;
      HTMLText := HTMLText||'<TD><B>'||tI(k)||'</B></TD>';
    END LOOP;

    HTMLText := HTMLText||'</TR></TABLE><BR><P><B>Отчет составил: _________________________ ' || DO_VRACHFIO (pFK_VRACHID) || '</B></P></BODY></HTML>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(HTMLText),HTMLText);
    DBMS_LOB.CLOSE(cC);
    RETURN nC;
  END;
-------------------------------------------------------------------------------------------------------------
-- По палатам -----------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------
  FUNCTION DO_CALC_REPORT_PALATS (pFD_DATA1 IN DATE,pFD_DATA2 IN DATE, pFK_VRACHID IN NUMBER)
  RETURN NUMBER
   IS-- Used in rPacMovement.dpr
    nDays NUMBER;
    i NUMBER;
    cid NUMBER;
    j NUMBER;
    nTemp NUMBER;
    t TTable;
    tv TTable;
    ts TSTable;
    cC CLOB;
    nC NUMBER;
    HTMLText VARCHAR2 (32767);
    k NUMBER;
    cTmp VARCHAR2 (32767);
    cName VARCHAR2 (30);
    TYPE TItogo IS TABLE OF VARCHAR2(100)
                INDEX BY BINARY_INTEGER;
    tI TItogo;
   BEGIN
    INSERT INTO TCLOBS(FC_CLOB)
         VALUES (EMPTY_CLOB())
      RETURNING FK_ID,FC_CLOB INTO nC,cC;
    DBMS_LOB.OPEN(cC,DBMS_LOB.LOB_READWRITE);

    HTMLText := PKG_HTML.GET_HEAD('excel','Движение пациентов за период с ' || TO_CHAR (pFD_DATA1, 'dd.mm.yyyy') || ' по ' || TO_CHAR (pFD_DATA2, 'dd.mm.yyyy'),
                             null,null,null,
                             null,null,null,
                             null,null,null,
                             null,null,null,
                             null,null,null,null,
                             null,null,null,'left',
                             null,null,null,null,
                             null,null,null);
    HTMLText := HTMLText || '<BODY><P ALIGN="CENTER"><B>Санаторий "'||PKG_SMINI.READSTRING('CONFIG','S_NAME','Не известен')||'"<BR>Движение пациентов за период с ' || TO_CHAR (pFD_DATA1, 'dd.mm.yyyy') || ' по ' || TO_CHAR (pFD_DATA2, 'dd.mm.yyyy') || '</B></P><BR>'||
                            '<TABLE>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(HTMLText),HTMLText);

    i:=1;
    FOR p in cKont LOOP
      t(i):=p.FK_ID;
      inc(i);
    END LOOP;

    i:=1;
    FOR p in cPalata LOOP
      tv(i):=p.FK_ID;
      inc(i);
    END LOOP;

    i:=1;
    FOR p in cPalataShort LOOP
      ts(i):=p.FC_VID;
      inc(i);
    END LOOP;

    OPEN cPalataCount;
    FETCH cPalataCount into i;
    CLOSE cPalataCount;

    OPEN cKontCount;
    FETCH cKontCount into j;
    CLOSE cKontCount;

    HTMLText := '<TR><TD rowspan=2><B>Дата:</B></TD>'||
                '<TD colspan='||TO_CHAR(i+1)||'><B>На начало дня:</B></TD>'||
                '<TD colspan='||TO_CHAR(i+1)||'><B>Прибыло:</B></TD>'||
                '<TD colspan='||TO_CHAR(i+1)||'><B>Выбыло:</B></TD>'||
                '<TD colspan='||TO_CHAR(i+1)||'><B>На конец дня:</B></TD>'||
                '<TD colspan='||TO_CHAR(j+1)||'><B>Койко-дней:</B></TD></TR>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(HTMLText),HTMLText);

    k:= 4*(i+1)+(j+1)+1;
    FOR i in 1..k LOOP
      tI(i):='0';
    END LOOP;

    HTMLText := '<TR><TD><B>Всего:</B></TD>';
    FOR i in 1..ts.Count LOOP
      HTMLText := HTMLText||'<TD class=v>'||ts(i)||':</TD>';
    END LOOP;

    HTMLText := HTMLText||'<TD><B>Всего:</B></TD>';
    FOR i in 1..ts.Count LOOP
      HTMLText := HTMLText||'<TD class=v>'||ts(i)||':</TD>';
    END LOOP;

    HTMLText := HTMLText||'<TD><B>Всего:</B></TD>';
    FOR i in 1..ts.Count LOOP
      HTMLText := HTMLText||'<TD class=v>'||ts(i)||':</TD>';
    END LOOP;

    HTMLText := HTMLText||'<TD><B>Всего:</B></TD>';
    FOR i in 1..ts.Count LOOP
      HTMLText := HTMLText||'<TD class=v>'||ts(i)||':</TD>';
    END LOOP;

    HTMLText := HTMLText||'<TD><B>Всего:</B></TD>';
    FOR p in cKontShort LOOP
      HTMLText := HTMLText||'<TD class=v>'||p.FC_SHORT||':</TD>';
    END LOOP;

    HTMLText := HTMLText||'</TR>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(HTMLText),HTMLText);


    nDays:=pFD_DATA2-pFD_DATA1+1;
    FOR i IN 0..nDays-1 LOOP
      HTMLText := '<TR><TD>'||TO_CHAR(pFD_DATA1+i,'dd.mm.yyyy')||'</TD>';

      k        := 1;
      nTemp    := PKG_R_ALLFUNC.GET_COUNT_MORNING(pFD_DATA1+i);
      tI(k)    := TO_CHAR(TO_NUMBER(tI(k)) + nTemp );
      HTMLText := HTMLText||'<TD>'||PKG_R_ALLFUNC.RETURN_VALUE(nTemp)||'</TD>';

      FOR j IN 1..tv.COUNT LOOP
        k        := k + 1;
        nTemp    := PKG_R_ALLFUNC.GET_COUNT_MORNING_PALATA(pFD_DATA1+i,tv(j));
        tI(k)    := TO_CHAR(TO_NUMBER(tI(k)) + nTemp );
        HTMLText := HTMLText||'<TD>'||PKG_R_ALLFUNC.RETURN_VALUE(nTemp)||'</TD>';
      END LOOP;

      k        := k + 1;
      HTMLText := HTMLText||'<TD>'||PKG_R_ALLFUNC.RETURN_VALUE(PKG_R_ALLFUNC.GET_COUNT_PRYB(pFD_DATA1+i))||'</TD>';

      FOR j IN 1..tv.COUNT LOOP
        k        := k + 1;
        HTMLText := HTMLText||'<TD>'||PKG_R_ALLFUNC.RETURN_VALUE(PKG_R_ALLFUNC.GET_COUNT_PRYB_PALATA(pFD_DATA1+i,tv(j)))||'</TD>';
      END LOOP;

      k        := k + 1;
      HTMLText := HTMLText||'<TD>'||PKG_R_ALLFUNC.RETURN_VALUE(PKG_R_ALLFUNC.GET_COUNT_VYB(pFD_DATA1+i))||'</TD>';

      FOR j IN 1..tv.COUNT LOOP
        k        := k + 1;
        HTMLText := HTMLText||'<TD>'||PKG_R_ALLFUNC.RETURN_VALUE(PKG_R_ALLFUNC.GET_COUNT_VYB_PALATA(pFD_DATA1+i,tv(j)))||'</TD>';
      END LOOP;

      k        := k + 1;
      nTemp    := PKG_R_ALLFUNC.GET_COUNT_MORNING(pFD_DATA1+i+1);
      tI(k)    := TO_CHAR(TO_NUMBER(tI(k)) + nTemp );
      HTMLText := HTMLText||'<TD>'||PKG_R_ALLFUNC.RETURN_VALUE(nTemp)||'</TD>';

      FOR j IN 1..tv.COUNT LOOP
        k        := k + 1;
        nTemp    := PKG_R_ALLFUNC.GET_COUNT_MORNING_PALATA(pFD_DATA1+i+1,tv(j));
        tI(k)    := TO_CHAR(TO_NUMBER(tI(k)) + nTemp );
        HTMLText := HTMLText||'<TD>'||PKG_R_ALLFUNC.RETURN_VALUE(nTemp)||'</TD>';
      END LOOP;

      k        := k + 1;
      nTemp    := PKG_R_KDNFUNC.GET_KDN(pFD_DATA1+i);
      tI(k)    := TO_CHAR(TO_NUMBER(tI(k)) + nTemp );
      HTMLText := HTMLText||'<TD>'||PKG_R_ALLFUNC.RETURN_VALUE(nTemp)||'</TD>';

      FOR j IN 1..t.COUNT LOOP
        k        := k + 1;
        nTemp    := GET_KDN_PRIZN(pFD_DATA1+i,t(j));
        tI(k)    := TO_CHAR(TO_NUMBER(tI(k)) + nTemp );
        HTMLText := HTMLText||'<TD>'||PKG_R_ALLFUNC.RETURN_VALUE(nTemp)||'</TD>';
      END LOOP;

      HTMLText := HTMLText||'</TR>';
      DBMS_LOB.WRITEAPPEND(cC,LENGTH(HTMLText),HTMLText);
    END LOOP;

    HTMLText := '<TR><TD><B>ИТОГО:</B></TD>';

    k        := 1;
    HTMLText := HTMLText||'<TD><B>'||tI(k)||'</B></TD>';

    FOR j IN 1..tv.COUNT LOOP
      k        := k + 1;
      HTMLText := HTMLText||'<TD><B>'||tI(k)||'</B></TD>';
    END LOOP;

    k        := k + 1;
    HTMLText := HTMLText||'<TD><B>'||PKG_R_ALLFUNC.GET_COUNT_PRYB(pFD_DATA1,pFD_DATA2)||'</B></TD>';

    FOR j IN 1..tv.COUNT LOOP
      k        := k + 1;
      HTMLText := HTMLText||'<TD><B>'||GET_COUNT_PRYB_PERIOD_PALATA(pFD_DATA1,pFD_DATA2,tv(j))||'</B></TD>';
    END LOOP;

    k        := k + 1;
    HTMLText := HTMLText||'<TD><B>'||PKG_R_ALLFUNC.GET_COUNT_VYB(pFD_DATA1,pFD_DATA2)||'</B></TD>';

    FOR j IN 1..tv.COUNT LOOP
      k        := k + 1;
      HTMLText := HTMLText||'<TD><B>'||GET_COUNT_VYB_PERIOD_PALATA(pFD_DATA1,pFD_DATA2,tv(j))||'</B></TD>';
    END LOOP;

    k        := k + 1;
    HTMLText := HTMLText||'<TD><B>'||tI(k)||'</B></TD>';

    FOR j IN 1..tv.COUNT LOOP
      k        := k + 1;
      HTMLText := HTMLText||'<TD><B>'||tI(k)||'</B></TD>';
    END LOOP;

    k        := k + 1;
    HTMLText := HTMLText||'<TD><B>'||tI(k)||'</B></TD>';

    FOR j IN 1..t.COUNT LOOP
      k        := k + 1;
      HTMLText := HTMLText||'<TD><B>'||tI(k)||'</B></TD>';
    END LOOP;

    HTMLText := HTMLText||'</TR></TABLE><BR><P><B>Отчет составил: _________________________ ' || DO_VRACHFIO (pFK_VRACHID) || '</B></P></BODY></HTML>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(HTMLText),HTMLText);
    DBMS_LOB.CLOSE(cC);
    RETURN nC;
  END;
-------------------------------------------------------------------------------------------------------------
-- По типам путевок -----------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------
  FUNCTION DO_CALC_REPORT_PUTS (pFD_DATA1 IN DATE,pFD_DATA2 IN DATE, pFK_VRACHID IN NUMBER)
  RETURN NUMBER
   IS-- Used in rPacMovement.dpr
    nDays NUMBER;
    i NUMBER;
    cid NUMBER;
    j NUMBER;
    nTemp NUMBER;
    t TTable;
    tv TTable;
    ts TSTable;
    cC CLOB;
    nC NUMBER;
    HTMLText VARCHAR2 (32767);
    k NUMBER;
    cTmp VARCHAR2 (32767);
    cName VARCHAR2 (30);
    TYPE TItogo IS TABLE OF VARCHAR2(100)
                INDEX BY BINARY_INTEGER;
    tI TItogo;
   BEGIN
    INSERT INTO TCLOBS(FC_CLOB)
         VALUES (EMPTY_CLOB())
      RETURNING FK_ID,FC_CLOB INTO nC,cC;
    DBMS_LOB.OPEN(cC,DBMS_LOB.LOB_READWRITE);

    HTMLText := PKG_HTML.GET_HEAD('excel','Движение пациентов за период с ' || TO_CHAR (pFD_DATA1, 'dd.mm.yyyy') || ' по ' || TO_CHAR (pFD_DATA2, 'dd.mm.yyyy'),
                             null,null,null,
                             null,null,null,
                             null,null,null,
                             null,null,null,
                             null,null,null,null,
                             null,null,null,'left',
                             null,null,null,null,
                             null,null,null);
    HTMLText := HTMLText || '<BODY><P ALIGN="CENTER"><B>Санаторий "'||PKG_SMINI.READSTRING('CONFIG','S_NAME','Не известен')||'"<BR>Движение пациентов за период с ' || TO_CHAR (pFD_DATA1, 'dd.mm.yyyy') || ' по ' || TO_CHAR (pFD_DATA2, 'dd.mm.yyyy') || '</B></P><BR>'||
                            '<TABLE>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(HTMLText),HTMLText);

    i:=1;
    FOR p in cKont LOOP
      t(i):=p.FK_ID;
      inc(i);
    END LOOP;

    i:=1;
    FOR p in cPalata LOOP
      tv(i):=p.FK_ID;
      inc(i);
    END LOOP;

    i:=1;
    FOR p in cPalataShort LOOP
      ts(i):=p.FC_VID;
      inc(i);
    END LOOP;

    OPEN cPalataCount;
    FETCH cPalataCount into i;
    CLOSE cPalataCount;

    OPEN cKontCount;
    FETCH cKontCount into j;
    CLOSE cKontCount;

    HTMLText := '<TR><TD rowspan=2><B>Дата:</B></TD>'||
                '<TD colspan='||TO_CHAR(i+1)||'><B>На начало дня:</B></TD>'||
                '<TD colspan='||TO_CHAR(i+1)||'><B>Прибыло:</B></TD>'||
                '<TD colspan='||TO_CHAR(i+1)||'><B>Выбыло:</B></TD>'||
                '<TD colspan='||TO_CHAR(i+1)||'><B>На конец дня:</B></TD>'||
                '<TD colspan='||TO_CHAR(j+1)||'><B>Койко-дней:</B></TD></TR>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(HTMLText),HTMLText);

    k:= 4*(i+1)+(j+1)+1;
    FOR i in 1..k LOOP
      tI(i):='0';
    END LOOP;

    HTMLText := '<TR><TD><B>Всего:</B></TD>';
    FOR i in 1..ts.Count LOOP
      HTMLText := HTMLText||'<TD class=v>'||ts(i)||':</TD>';
    END LOOP;

    HTMLText := HTMLText||'<TD><B>Всего:</B></TD>';
    FOR i in 1..ts.Count LOOP
      HTMLText := HTMLText||'<TD class=v>'||ts(i)||':</TD>';
    END LOOP;

    HTMLText := HTMLText||'<TD><B>Всего:</B></TD>';
    FOR i in 1..ts.Count LOOP
      HTMLText := HTMLText||'<TD class=v>'||ts(i)||':</TD>';
    END LOOP;

    HTMLText := HTMLText||'<TD><B>Всего:</B></TD>';
    FOR i in 1..ts.Count LOOP
      HTMLText := HTMLText||'<TD class=v>'||ts(i)||':</TD>';
    END LOOP;

    HTMLText := HTMLText||'<TD><B>Всего:</B></TD>';
    FOR p in cKontShort LOOP
      HTMLText := HTMLText||'<TD class=v>'||p.FC_SHORT||':</TD>';
    END LOOP;

    HTMLText := HTMLText||'</TR>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(HTMLText),HTMLText);


    nDays:=pFD_DATA2-pFD_DATA1+1;
    FOR i IN 0..nDays-1 LOOP
      HTMLText := '<TR><TD>'||TO_CHAR(pFD_DATA1+i,'dd.mm.yyyy')||'</TD>';

      k        := 1;
      nTemp    := PKG_R_ALLFUNC.GET_COUNT_MORNING(pFD_DATA1+i);
      tI(k)    := TO_CHAR(TO_NUMBER(tI(k)) + nTemp );
      HTMLText := HTMLText||'<TD>'||PKG_R_ALLFUNC.RETURN_VALUE(nTemp)||'</TD>';

      FOR j IN 1..tv.COUNT LOOP
        k        := k + 1;
        nTemp    := PKG_R_ALLFUNC.GET_COUNT_MORNING_PUT(pFD_DATA1+i,tv(j));
        tI(k)    := TO_CHAR(TO_NUMBER(tI(k)) + nTemp );
        HTMLText := HTMLText||'<TD>'||PKG_R_ALLFUNC.RETURN_VALUE(nTemp)||'</TD>';
      END LOOP;

      k        := k + 1;
      HTMLText := HTMLText||'<TD>'||PKG_R_ALLFUNC.RETURN_VALUE(PKG_R_ALLFUNC.GET_COUNT_PRYB(pFD_DATA1+i))||'</TD>';

      FOR j IN 1..tv.COUNT LOOP
        k        := k + 1;
        HTMLText := HTMLText||'<TD>'||PKG_R_ALLFUNC.RETURN_VALUE(PKG_R_ALLFUNC.GET_COUNT_PRYB_PUT(pFD_DATA1+i,tv(j)))||'</TD>';
      END LOOP;

      k        := k + 1;
      HTMLText := HTMLText||'<TD>'||PKG_R_ALLFUNC.RETURN_VALUE(PKG_R_ALLFUNC.GET_COUNT_VYB(pFD_DATA1+i))||'</TD>';

      FOR j IN 1..tv.COUNT LOOP
        k        := k + 1;
        HTMLText := HTMLText||'<TD>'||PKG_R_ALLFUNC.RETURN_VALUE(PKG_R_ALLFUNC.GET_COUNT_VYB_PUT(pFD_DATA1+i,tv(j)))||'</TD>';
      END LOOP;

      k        := k + 1;
      nTemp    := PKG_R_ALLFUNC.GET_COUNT_MORNING(pFD_DATA1+i+1);
      tI(k)    := TO_CHAR(TO_NUMBER(tI(k)) + nTemp );
      HTMLText := HTMLText||'<TD>'||PKG_R_ALLFUNC.RETURN_VALUE(nTemp)||'</TD>';

      FOR j IN 1..tv.COUNT LOOP
        k        := k + 1;
        nTemp    := PKG_R_ALLFUNC.GET_COUNT_MORNING_PUT(pFD_DATA1+i+1,tv(j));
        tI(k)    := TO_CHAR(TO_NUMBER(tI(k)) + nTemp );
        HTMLText := HTMLText||'<TD>'||PKG_R_ALLFUNC.RETURN_VALUE(nTemp)||'</TD>';
      END LOOP;

      k        := k + 1;
      nTemp    := PKG_R_KDNFUNC.GET_KDN(pFD_DATA1+i);
      tI(k)    := TO_CHAR(TO_NUMBER(tI(k)) + nTemp );
      HTMLText := HTMLText||'<TD>'||PKG_R_ALLFUNC.RETURN_VALUE(nTemp)||'</TD>';

      FOR j IN 1..t.COUNT LOOP
        k        := k + 1;
        nTemp    := GET_KDN_PRIZN(pFD_DATA1+i,t(j));
        tI(k)    := TO_CHAR(TO_NUMBER(tI(k)) + nTemp );
        HTMLText := HTMLText||'<TD>'||PKG_R_ALLFUNC.RETURN_VALUE(nTemp)||'</TD>';
      END LOOP;

      HTMLText := HTMLText||'</TR>';
      DBMS_LOB.WRITEAPPEND(cC,LENGTH(HTMLText),HTMLText);
    END LOOP;

    HTMLText := '<TR><TD><B>ИТОГО:</B></TD>';

    k        := 1;
    HTMLText := HTMLText||'<TD><B>'||tI(k)||'</B></TD>';

    FOR j IN 1..tv.COUNT LOOP
      k        := k + 1;
      HTMLText := HTMLText||'<TD><B>'||tI(k)||'</B></TD>';
    END LOOP;

    k        := k + 1;
    HTMLText := HTMLText||'<TD><B>'||PKG_R_ALLFUNC.GET_COUNT_PRYB(pFD_DATA1,pFD_DATA2)||'</B></TD>';

    FOR j IN 1..tv.COUNT LOOP
      k        := k + 1;
      HTMLText := HTMLText||'<TD><B>'||GET_COUNT_PRYB_PERIOD_PUT(pFD_DATA1,pFD_DATA2,tv(j))||'</B></TD>';
    END LOOP;

    k        := k + 1;
    HTMLText := HTMLText||'<TD><B>'||PKG_R_ALLFUNC.GET_COUNT_VYB(pFD_DATA1,pFD_DATA2)||'</B></TD>';

    FOR j IN 1..tv.COUNT LOOP
      k        := k + 1;
      HTMLText := HTMLText||'<TD><B>'||GET_COUNT_VYB_PERIOD_PUT(pFD_DATA1,pFD_DATA2,tv(j))||'</B></TD>';
    END LOOP;

    k        := k + 1;
    HTMLText := HTMLText||'<TD><B>'||tI(k)||'</B></TD>';

    FOR j IN 1..tv.COUNT LOOP
      k        := k + 1;
      HTMLText := HTMLText||'<TD><B>'||tI(k)||'</B></TD>';
    END LOOP;

    k        := k + 1;
    HTMLText := HTMLText||'<TD><B>'||tI(k)||'</B></TD>';

    FOR j IN 1..t.COUNT LOOP
      k        := k + 1;
      HTMLText := HTMLText||'<TD><B>'||tI(k)||'</B></TD>';
    END LOOP;

    HTMLText := HTMLText||'</TR></TABLE><BR><P><B>Отчет составил: _________________________ ' || DO_VRACHFIO (pFK_VRACHID) || '</B></P></BODY></HTML>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(HTMLText),HTMLText);
    DBMS_LOB.CLOSE(cC);
    RETURN nC;
  END;
END;
/

SHOW ERRORS;


