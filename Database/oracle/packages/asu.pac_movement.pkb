DROP PACKAGE BODY ASU.PAC_MOVEMENT
/

--
-- PAC_MOVEMENT  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PAC_MOVEMENT" 
IS
  --Состояло на начало дня...
  FUNCTION GET_COUNT_MORNING_VID(pFD_DATAC IN DATE,pFK_KOD2 IN NUMBER)
  RETURN NUMBER
  IS
  Cursor c IS select count(*) as fn_count from
                     (select fk_ibid, fc_fam  from tsroky , TKARTA
                        where
                        fd_data1<pFD_DATAC
                        and fd_data3>=pFD_DATAC
                        and fk_pryb<>1
                        and fk_pryb<>3
                        and fk_pryb<>7
                        AND TKARTA.FK_KOD2=pFK_KOD2
                        AND TKARTA.FK_ID=FK_PACID
                        union
                        select /*+ rule */ fk_ibid, fc_fam  from tsroky , TKARTA
                        where
                        fd_data1=pFD_DATAC
                        and fd_data3>=pFD_DATAC
                        and (fk_pryb=5 or fk_pryb=6)
                        AND TKARTA.FK_KOD2=pFK_KOD2
                        AND TKARTA.FK_ID=FK_PACID);
   i NUMBER;
   BEGIN
     OPEN c;
     FETCH c INTO i;
     CLOSE c;
     RETURN i;
   END;

  FUNCTION GET_COUNT_MORNING_PRIZN(pFD_DATAC IN DATE,pFK_KOD2 IN NUMBER)
  RETURN NUMBER
  IS
  Cursor c IS select count(*) as fn_count from
                     (select fk_ibid, fc_fam  from tsroky , TKARTA
                        where
                        fd_data1<pFD_DATAC
                        and fd_data3>=pFD_DATAC
                        and fk_pryb<>1
                        and fk_pryb<>3
                        and fk_pryb<>7
                        AND TKARTA.FK_PRIZN=pFK_KOD2
                        AND TKARTA.FK_ID=FK_PACID
                        union
                        select /*+ rule */ fk_ibid, fc_fam  from tsroky , TKARTA
                        where
                        fd_data1=pFD_DATAC
                        and fd_data3>=pFD_DATAC
                        and (fk_pryb=5 or fk_pryb=6)
                        AND TKARTA.FK_PRIZN=pFK_KOD2
                        AND TKARTA.FK_ID=FK_PACID);
   i NUMBER;
   BEGIN
     OPEN c;
     FETCH c INTO i;
     CLOSE c;
     RETURN i;
   END;


  FUNCTION GET_COUNT_MORNING_SHORT_PRIZN(pFD_DATAC IN DATE,pFK_KOD2 IN NUMBER)
  RETURN NUMBER
  IS
  Cursor c IS select count(*) as fn_count from
                     (select fk_ibid, fc_fam  from tsroky , TKARTA
                        where
                        fd_data1<pFD_DATAC
                        and fd_data3>=pFD_DATAC
                        and fk_pryb<>1
                        and fk_pryb<>3
                        and fk_pryb<>7
                        AND TKARTA.FK_PRIZN=pFK_KOD2
                        AND TKARTA.FK_ID=FK_PACID
                        AND GET_PACDAYSPLAN(TKARTA.FK_ID)<PKG_SMINI.READSTRING('CONFIG','SHORT_SROK','5')
                        union
                        select /*+ rule */ fk_ibid, fc_fam  from tsroky , TKARTA
                        where
                        fd_data1=pFD_DATAC
                        and fd_data3>=pFD_DATAC
                        and (fk_pryb=5 or fk_pryb=6)
                        AND TKARTA.FK_PRIZN=pFK_KOD2
                        AND GET_PACDAYSPLAN(TKARTA.FK_ID)<PKG_SMINI.READSTRING('CONFIG','SHORT_SROK','5')
                        AND TKARTA.FK_ID=FK_PACID);
   i NUMBER;
   BEGIN
     OPEN c;
     FETCH c INTO i;
     CLOSE c;
     RETURN i;
   END;

 FUNCTION GET_COUNT_MORNING_PALATA(pFD_DATAC IN DATE,pFK_KOD2 IN NUMBER)
  RETURN NUMBER
  IS
  Cursor c IS select count(*) as fn_count from
                     (select fk_ibid, fc_fam  from tsroky , TKARTA
                        where
                        fd_data1<pFD_DATAC
                        and fd_data3>=pFD_DATAC
                        and fk_pryb<>1
                        and fk_pryb<>3
                        and fk_pryb<>7
                        AND GET_PALATAVID(GET_PACPALATADATE(TKARTA.FK_ID,pFD_DATAC),pFD_DATAC)=pFK_KOD2
                        AND TKARTA.FK_ID=FK_PACID
                        union
                        select /*+ rule */ fk_ibid, fc_fam  from tsroky , TKARTA
                        where
                        fd_data1=pFD_DATAC
                        and fd_data3>=pFD_DATAC
                        and (fk_pryb=5 or fk_pryb=6)
                        AND GET_PALATAVID(GET_PACPALATADATE(TKARTA.FK_ID,pFD_DATAC),pFD_DATAC)=pFK_KOD2
                        AND TKARTA.FK_ID=FK_PACID);
   i NUMBER;
   BEGIN
     OPEN c;
     FETCH c INTO i;
     CLOSE c;
     RETURN i;
   END;

  FUNCTION GET_COUNT_MORNING_SHORT(pFD_DATAC IN DATE)
  RETURN NUMBER
  IS
  Cursor c IS select count(*) as fn_count from
                     (select fk_ibid, fc_fam  from tsroky , TKARTA
                        where
                        fd_data1<pFD_DATAC
                        and fd_data3>=pFD_DATAC
                        and fk_pryb<>1
                        and fk_pryb<>3
                        and fk_pryb<>7
                        AND TKARTA.FK_ID=FK_PACID
                        AND GET_PACDAYSPLAN(TKARTA.FK_ID)<PKG_SMINI.READSTRING('CONFIG','SHORT_SROK','5')
                        union
                        select /*+ rule */ fk_ibid, fc_fam  from tsroky , TKARTA
                        where
                        fd_data1=pFD_DATAC
                        and fd_data3>=pFD_DATAC
                        and (fk_pryb=5 or fk_pryb=6)
                        AND GET_PACDAYSPLAN(TKARTA.FK_ID)<PKG_SMINI.READSTRING('CONFIG','SHORT_SROK','5')
                        AND TKARTA.FK_ID=FK_PACID);
   i NUMBER;
   BEGIN
     OPEN c;
     FETCH c INTO i;
     CLOSE c;
     RETURN i;
   END;

  FUNCTION GET_COUNT_MORNING(pFD_DATAC IN DATE)
  RETURN NUMBER
  IS
  Cursor c IS select count(*) as fn_count from
                     (select fk_ibid, fc_fam  from tsroky , TKARTA
                        where
                        fd_data1<pFD_DATAC
                        and fd_data3>=pFD_DATAC
                        and fk_pryb<>1
                        and fk_pryb<>3
                        and fk_pryb<>7
                        AND TKARTA.FK_ID=FK_PACID
                        union
                        select /*+ rule */ fk_ibid, fc_fam  from tsroky , TKARTA
                        where
                        fd_data1=pFD_DATAC
                        and fd_data3>=pFD_DATAC
                        and (fk_pryb=5 or fk_pryb=6)
                        AND TKARTA.FK_ID=FK_PACID);
   i NUMBER;
   BEGIN
     OPEN c;
     FETCH c INTO i;
     CLOSE c;
     RETURN i;
   END;

   --Прибыло...+восстановилось

  FUNCTION GET_COUNT_IN(pFD_DATAC IN DATE)
  RETURN NUMBER
  IS
  Cursor c IS select /* + rule */count(fk_id) from tsroky where
                   fd_data1=pFD_DATAC and fk_pryb=2;
   i NUMBER;
   BEGIN
     OPEN c;
     FETCH c INTO i;
     CLOSE c;
     RETURN i;
   END;

  FUNCTION GET_COUNT_RECOVER(pFD_DATAC IN DATE)
  RETURN NUMBER
  IS
  Cursor c IS select /* + rule */count(fk_id) from tsroky where
                   fd_data1=pFD_DATAC and fk_pryb=4;
   i NUMBER;
   BEGIN
     OPEN c;
     FETCH c INTO i;
     CLOSE c;
     RETURN i;
   END;

  FUNCTION GET_COUNT_PRYB(pFD_DATAC IN DATE)
  RETURN VARCHAR2
  IS
  i NUMBER;
  BEGIN
    i:=GET_COUNT_RECOVER(pFD_DATAC);
    if i>0 then
      RETURN TO_CHAR(GET_COUNT_IN(pFD_DATAC))||'+'||TO_CHAR(i);
    else
      RETURN TO_CHAR(GET_COUNT_IN(pFD_DATAC));
    end if;
  END;

--По типу прибытия
  FUNCTION GET_COUNT_IN_VID(pFD_DATAC IN DATE,pFK_KOD2 IN NUMBER)
  RETURN NUMBER
  IS
  Cursor c IS select count(fk_id) from tsroky where
                   fd_data1=pFD_DATAC and fk_pryb=2 AND GET_PAC_VID_KODE(FK_PACID)=pFK_KOD2;
   i NUMBER;
   BEGIN
     OPEN c;
     FETCH c INTO i;
     CLOSE c;
     RETURN i;
   END;

  FUNCTION GET_COUNT_RECOVER_VID(pFD_DATAC IN DATE,pFK_KOD2 IN NUMBER)
  RETURN NUMBER
  IS
  Cursor c IS select count(fk_id) from tsroky where
                   fd_data1=pFD_DATAC and fk_pryb=4 AND GET_PAC_VID_KODE(FK_PACID)=pFK_KOD2;
   i NUMBER;
   BEGIN
     OPEN c;
     FETCH c INTO i;
     CLOSE c;
     RETURN i;
   END;

  FUNCTION GET_COUNT_PRYB_VID(pFD_DATAC IN DATE,pFK_KOD2 IN NUMBER)
  RETURN VARCHAR2
  IS
  i NUMBER;
  BEGIN
    i:=GET_COUNT_RECOVER_VID(pFD_DATAC,pFK_KOD2);
    if i>0 then
      RETURN TO_CHAR(GET_COUNT_IN_VID(pFD_DATAC,pFK_KOD2))||'+'||TO_CHAR(i);
    else
      RETURN TO_CHAR(GET_COUNT_IN_VID(pFD_DATAC,pFK_KOD2));
    end if;
  END;

--По палатам
  FUNCTION GET_COUNT_IN_PALATA(pFD_DATAC IN DATE,pFK_KOD2 IN NUMBER)
  RETURN NUMBER
  IS
  Cursor c IS select /* + rule */count(fk_id) from tsroky where
                   fd_data1=pFD_DATAC and fk_pryb=2 AND GET_PALATAVID(GET_PACPALATADATE(FK_PACID,pFD_DATAC),pFD_DATAC)=pFK_KOD2;
   i NUMBER;
   BEGIN
     OPEN c;
     FETCH c INTO i;
     CLOSE c;
     RETURN i;
   END;

  FUNCTION GET_COUNT_RECOVER_PALATA(pFD_DATAC IN DATE,pFK_KOD2 IN NUMBER)
  RETURN NUMBER
  IS
  Cursor c IS select /* + rule */count(fk_id) from tsroky where
                   fd_data1=pFD_DATAC and fk_pryb=4 AND GET_PALATAVID(GET_PACPALATADATE(FK_PACID,pFD_DATAC),pFD_DATAC)=pFK_KOD2;
   i NUMBER;
   BEGIN
     OPEN c;
     FETCH c INTO i;
     CLOSE c;
     RETURN i;
   END;

  FUNCTION GET_COUNT_PRYB_PALATA(pFD_DATAC IN DATE,pFK_KOD2 IN NUMBER)
  RETURN VARCHAR2
  IS
  i NUMBER;
  BEGIN
    i:=GET_COUNT_RECOVER_PALATA(pFD_DATAC,pFK_KOD2);
    if i>0 then
      RETURN TO_CHAR(GET_COUNT_IN_PALATA(pFD_DATAC,pFK_KOD2))||'+'||TO_CHAR(i);
    else
      RETURN TO_CHAR(GET_COUNT_IN_PALATA(pFD_DATAC,pFK_KOD2));
    end if;
  END;

--Выбыло+временно

  FUNCTION GET_COUNT_OUT(pFD_DATAC IN DATE)
  RETURN NUMBER
  IS
  Cursor c IS select /* + rule */count(fk_id) from tsroky where
                   fd_data1=pFD_DATAC and fk_pryb=3;
   i NUMBER;
   BEGIN
     OPEN c;
     FETCH c INTO i;
     CLOSE c;
     RETURN i;
   END;

  FUNCTION GET_COUNT_TEMPOUT(pFD_DATAC IN DATE)
  RETURN NUMBER
  IS
  Cursor c IS select /* + rule */count(fk_id) from tsroky where
                   fd_data1=pFD_DATAC and fk_pryb=7;
   i NUMBER;
   BEGIN
     OPEN c;
     FETCH c INTO i;
     CLOSE c;
     RETURN i;
   END;
--По типу прибытия

  FUNCTION GET_COUNT_VYB(pFD_DATAC IN DATE)
  RETURN VARCHAR2
  IS
  i NUMBER;
  BEGIN
    i:=GET_COUNT_TEMPOUT(pFD_DATAC);
    if i>0 then
      RETURN TO_CHAR(GET_COUNT_OUT(pFD_DATAC))||'+'||TO_CHAR(i);
    else
      RETURN TO_CHAR(GET_COUNT_OUT(pFD_DATAC));
    end if;
  END;
--По типу прибытия
  FUNCTION GET_COUNT_OUT_VID(pFD_DATAC IN DATE,pFK_KOD2 IN NUMBER)
  RETURN NUMBER
  IS
  Cursor c IS select count(fk_id) from tsroky where
                   fd_data1=pFD_DATAC and fk_pryb=3 AND GET_PAC_VID_KODE(FK_PACID)=pFK_KOD2;
   i NUMBER;
   BEGIN
     OPEN c;
     FETCH c INTO i;
     CLOSE c;
     RETURN i;
   END;

  FUNCTION GET_COUNT_TEMPOUT_VID(pFD_DATAC IN DATE,pFK_KOD2 IN NUMBER)
  RETURN NUMBER
  IS
  Cursor c IS select count(fk_id) from tsroky where
                   fd_data1=pFD_DATAC and fk_pryb=7 AND GET_PAC_VID_KODE(FK_PACID)=pFK_KOD2;
   i NUMBER;
   BEGIN
     OPEN c;
     FETCH c INTO i;
     CLOSE c;
     RETURN i;
   END;

  FUNCTION GET_COUNT_VYB_VID(pFD_DATAC IN DATE,pFK_KOD2 IN NUMBER)
  RETURN VARCHAR2
  IS
  i NUMBER;
  BEGIN
    i:=GET_COUNT_TEMPOUT_VID(pFD_DATAC,pFK_KOD2);
    if i>0 then
      RETURN TO_CHAR(GET_COUNT_OUT_VID(pFD_DATAC,pFK_KOD2))||'+'||TO_CHAR(i);
    else
      RETURN TO_CHAR(GET_COUNT_OUT_VID(pFD_DATAC,pFK_KOD2));
    end if;
  END;

 --По палатам
  FUNCTION GET_COUNT_VYB_PALATA(pFD_DATAC IN DATE,pFK_KOD2 IN NUMBER)
  RETURN VARCHAR2
  IS
  i NUMBER;
  BEGIN
    i:=GET_COUNT_TEMPOUT_PALATA(pFD_DATAC,pFK_KOD2);
    if i>0 then
      RETURN TO_CHAR(GET_COUNT_OUT_PALATA(pFD_DATAC,pFK_KOD2))||'+'||TO_CHAR(i);
    else
      RETURN TO_CHAR(GET_COUNT_OUT_PALATA(pFD_DATAC,pFK_KOD2));
    end if;
  END;

  FUNCTION GET_COUNT_OUT_PALATA(pFD_DATAC IN DATE,pFK_KOD2 IN NUMBER)
  RETURN NUMBER
  IS
  Cursor c IS select /* + rule */count(fk_id) from tsroky where
                   fd_data1=pFD_DATAC and fk_pryb=3 AND GET_PALATAVID(GET_PACPALATADATE(FK_PACID,pFD_DATAC),pFD_DATAC)=pFK_KOD2;
   i NUMBER;
   BEGIN
     OPEN c;
     FETCH c INTO i;
     CLOSE c;
     RETURN i;
   END;

  FUNCTION GET_COUNT_TEMPOUT_PALATA(pFD_DATAC IN DATE,pFK_KOD2 IN NUMBER)
  RETURN NUMBER
  IS
  Cursor c IS select /* + rule */count(fk_id) from tsroky where
                   fd_data1=pFD_DATAC and fk_pryb=7 AND GET_PALATAVID(GET_PACPALATADATE(FK_PACID,pFD_DATAC),pFD_DATAC)=pFK_KOD2;
   i NUMBER;
   BEGIN
     OPEN c;
     FETCH c INTO i;
     CLOSE c;
     RETURN i;
   END;

--Койко-дни
  FUNCTION GET_KDN(pFD_DATAC IN DATE)
  RETURN NUMBER
  IS
  Cursor c IS select/*+ first_row */count(*) as fn_count
                    from
                    (select fk_ibid, fc_fam  from tsroky , TKARTA
                    where
                                  fd_data1<=pFD_DATAC
                                  and fd_data3>=pFD_DATAC
                                  and fk_pryb<>1
                                  and fk_pryb<>3
                                  and fk_pryb<>7
                    AND TKARTA.FK_ID=FK_PACID
                    union
                    select /*+ rule */ fk_ibid, fc_fam  from tsroky , TKARTA
                    where
                                  fd_data1=pFD_DATAC
                                  and fd_data3>=pFD_DATAC
                                  and (fk_pryb=5 or fk_pryb=6)
                    AND TKARTA.FK_ID=FK_PACID);

   i NUMBER;
   BEGIN
     OPEN c;
     FETCH c INTO i;
     CLOSE c;
     RETURN i;
   END;

  FUNCTION GET_KDN_PRIZN(pFD_DATAC IN DATE,pFK_PRIZN IN NUMBER)
  RETURN NUMBER
  IS
  Cursor c IS select/*+ first_row */count(*) as fn_count
                    from
                    (select fk_ibid, fc_fam  from tsroky , TKARTA
                    where
                                  fd_data1<=pFD_DATAC
                                  and fd_data3>=pFD_DATAC
                                  and fk_pryb<>1
                                  and fk_pryb<>3
                                  and fk_pryb<>7
                    AND TKARTA.FK_ID=FK_PACID and tkarta.fk_prizn=pfk_prizn
                    union
                    select /*+ rule */ fk_ibid, fc_fam  from tsroky , TKARTA
                    where
                                  fd_data1=pFD_DATAC
                                  and fd_data3>=pFD_DATAC
                                  and (fk_pryb=5 or fk_pryb=6)
                    AND TKARTA.FK_ID=FK_PACID and tkarta.fk_prizn=pfk_prizn );

   i NUMBER;
   BEGIN
     OPEN c;
     FETCH c INTO i;
     CLOSE c;
     RETURN i;
   END;

  PROCEDURE DO_CALC_REPORT_SIMPLE (pFD_DATA1 IN DATE,pFD_DATA2 IN DATE, pFC_TABLE OUT VARCHAR2)
  IS
  nDays NUMBER;
  i      NUMBER;
  cid  NUMBER;
  nCols NUMBER;
  nKont NUMBER;
  j NUMBER;
  SQLText VARCHAR2(32767);
  SQLText1 VARCHAR2(32767);
  nTemp NUMBER;
  t TTable;
  BEGIN
  --Filling pl/sql table with kont codes...
    OPEN cKont;
    i:=1;
    LOOP
      FETCH cKont INTO j;
      EXIT WHEN cKont%NOTFOUND;
      t(i):=j;
      i:=i+1;
    END LOOP;
    CLOSE cKont;
  --Create an temporary table
    cid:=DBMS_SQL.OPEN_CURSOR;
    OPEN cKontCount;
    FETCH cKontCount INTO nKont;
    CLOSE cKontCount;
    pFC_TABLE:='TPACMOVE_'||TO_CHAR(SYSDATE,'DDMMYYYYHHMMSS');
    SQLText:='CREATE TABLE '||pFC_TABLE||' ( ';
    nCols:=6+nKont;
    SQLText:=SQLText||' FC_FIELD'||TO_CHAR(1)||'  VARCHAR(10),';
    FOR i IN 2..nCols-1 LOOP
      SQLText:=SQLText||' FC_FIELD'||TO_CHAR(i)||'  VARCHAR(10),';
    end LOOP;
    SQLText:=SQLText||' FC_FIELD'||TO_CHAR(nCols)||'  VARCHAR(10))';
    DBMS_SQL.PARSE(cid,SQLText,DBMS_SQL.NATIVE);
    j:=DBMS_SQL.EXECUTE(cid);
  --End
  --Set comments...
    SQLText:='COMMENT ON COLUMN '||pFC_TABLE||'.FC_FIELD';
    DBMS_SQL.PARSE(cid,SQLText||'1 IS '' Дата: ''',DBMS_SQL.NATIVE);
    DBMS_SQL.PARSE(cid,SQLText||'2 IS '' На начало дня || Всего: ''',DBMS_SQL.NATIVE);
    DBMS_SQL.PARSE(cid,SQLText||'3 IS ''  Прибыло  || Всего: ''',DBMS_SQL.NATIVE);
    DBMS_SQL.PARSE(cid,SQLText||'4 IS '' Выбыло || Всего: ''',DBMS_SQL.NATIVE);
    DBMS_SQL.PARSE(cid,SQLText||'5 IS '' На конец дня || Всего: ''',DBMS_SQL.NATIVE);
    DBMS_SQL.PARSE(cid,SQLText||'6 IS '' Койко-дней || Всего: ''',DBMS_SQL.NATIVE);
    i:=0;
    IF cKontShort%ISOPEN THEN
      CLOSE cKontShort;
    END IF;
    OPEN cKontShort;
    LOOP
      FETCH cKontShort INTO SQLText1;
      EXIT WHEN cKontShort%NOTFOUND;
      DBMS_SQL.PARSE(cid,SQLText||TO_CHAR(7+i)||' IS '' Койко-дней ||'||SQLText1||' : ''',DBMS_SQL.NATIVE);
      i:=i+1;
    END LOOP;
    CLOSE cKontShort;

  --
  --Build Table...
    nDays:=pFD_DATA2-pFD_DATA1+1;
    SQLText1:='INSERT INTO '||pFC_TABLE||' (';

    FOR i IN 1..nCols-1 LOOP
      SQLText1:=SQLText1||' FC_FIELD'||TO_CHAR(i)||',';
    end LOOP;
    SQLText1:=SQLText1||' FC_FIELD'||TO_CHAR(nCols)||') VALUES (';

    FOR i IN 0..nDays-1 LOOP
      SQLText:=SQLText1||''''||TO_CHAR(pFD_DATA1+i,'dd.mm.yyyy')||''''||','||''''||TO_CHAR(PAC_MOVEMENT.GET_COUNT_MORNING(pFD_DATA1+i))||''''||','||
               ''''||PAC_MOVEMENT.GET_COUNT_PRYB(pFD_DATA1+i)||''''||','||''''||PAC_MOVEMENT.GET_COUNT_VYB(pFD_DATA1+i)||''''||','||
               ''''||TO_CHAR(PAC_MOVEMENT.GET_COUNT_MORNING(pFD_DATA1+i+1))||''''||','||''''||TO_CHAR(PAC_MOVEMENT.GET_KDN(pFD_DATA1+i))||'''';
      FOR j IN 1..t.COUNT LOOP
        SQLText:=SQLText||','||''''||TO_CHAR(PAC_MOVEMENT.GET_KDN_PRIZN(pFD_DATA1+i,t(j)))||'''';
      END LOOP;
      SQLText:=SQLText||')';
      DBMS_SQL.PARSE(cid,SQLText,DBMS_SQL.NATIVE);
      j:=DBMS_SQL.Execute(cid);
    end LOOP;
    COMMIT;
    DBMS_SQL.CLOSE_CURSOR(cid);
  END;

  PROCEDURE DO_CALC_REPORT_TYPES (pFD_DATA1 IN DATE,pFD_DATA2 IN DATE, pFC_TABLE OUT VARCHAR2)
  IS
  nDays NUMBER;
  i      NUMBER;
  cid  NUMBER;
  nCols NUMBER;
  nKont NUMBER;
  s    Varchar2(100);
  j NUMBER;
  SQLText VARCHAR2(32767);
  SQLText1 VARCHAR2(32767);
  nTemp NUMBER;
  t TTable;
  tv TTable;
  ts TSTable;
  BEGIN
  --Filling pl/sql table with kont codes...
    OPEN cKont;
    i:=1;
    LOOP
      FETCH cKont INTO j;
      EXIT WHEN cKont%NOTFOUND;
      t(i):=j;
      i:=i+1;
    END LOOP;
    CLOSE cKont;

    OPEN cVid;
    i:=1;
    LOOP
      FETCH cVid INTO j;
      EXIT WHEN cVid%NOTFOUND;
      tv(i):=j;
      i:=i+1;
    END LOOP;
    CLOSE cVid;

    if cVidShort%ISOPEN then
      CLOSE cVidShort;
    end if;
    OPEN cVidShort;
    i:=1;
    LOOP
      FETCH cVidShort INTO s;
      EXIT WHEN cVidShort%NOTFOUND;
      ts(i):=s;
      i:=i+1;
    END LOOP;
    CLOSE cVidShort;
--Create an temporary table
    cid:=DBMS_SQL.OPEN_CURSOR;
    OPEN cKontCount;
    FETCH cKontCount INTO nKont;
    CLOSE cKontCount;
    pFC_TABLE:='TPACMOVE_'||TO_CHAR(SYSDATE,'DDMMYYYYHHMMSS');
    SQLText:='CREATE TABLE '||pFC_TABLE||' ( ';
    nCols:=6+nKont;
    OPEN cVidCount;
    FETCH cVidCount INTO nKont;
    CLOSE cVidCount;
    nCols:=nCols+4*nKont;
    SQLText:=SQLText||' FC_FIELD1 VARCHAR(10),';
    FOR i IN 2..nCols-1 LOOP
      SQLText:=SQLText||' FC_FIELD'||TO_CHAR(i)||'  VARCHAR2(10),';
    end LOOP;
    SQLText:=SQLText||' FC_FIELD'||TO_CHAR(nCols)||'  VARCHAR2(10))';
    DBMS_SQL.PARSE(cid,SQLText,DBMS_SQL.NATIVE);
    j:=DBMS_SQL.EXECUTE(cid);
  --End
  --Set comments...
    SQLText:='COMMENT ON COLUMN '||pFC_TABLE||'.FC_FIELD';
    DBMS_SQL.PARSE(cid,SQLText||'1 IS ''Дата:''',DBMS_SQL.NATIVE);
    DBMS_SQL.PARSE(cid,SQLText||'2 IS ''На начало дня||Всего''',DBMS_SQL.NATIVE);

    FOR i in 3..ts.Count+2 LOOP
      DBMS_SQL.PARSE(cid,SQLText||TO_CHAR(i)||' IS ''На начало дня||'||ts(i-2)||'''',DBMS_SQL.NATIVE);
    END LOOP;
    j:=ts.Count+3;
    DBMS_SQL.PARSE(cid,SQLText||TO_CHAR(j)||' IS ''Прибыло||Всего''',DBMS_SQL.NATIVE);
    FOR i in j+1..ts.Count+j LOOP
      DBMS_SQL.PARSE(cid,SQLText||TO_CHAR(i)||' IS ''Прибыло||'||ts(i-j)||'''',DBMS_SQL.NATIVE);
    END LOOP;
    j:=j+ts.Count+1;
    DBMS_SQL.PARSE(cid,SQLText||TO_CHAR(j)||' IS ''Выбыло||Всего''',DBMS_SQL.NATIVE);
    FOR i in j+1..ts.Count+j LOOP
      DBMS_SQL.PARSE(cid,SQLText||TO_CHAR(i)||' IS ''Выбыло||'||ts(i-j)||'''',DBMS_SQL.NATIVE);
    END LOOP;
    j:=j+ts.Count+1;
    DBMS_SQL.PARSE(cid,SQLText||TO_CHAR(j)||' IS ''На конец дня||Всего''',DBMS_SQL.NATIVE);
    FOR i in j+1..ts.Count+j LOOP
      DBMS_SQL.PARSE(cid,SQLText||TO_CHAR(i)||' IS ''На конец дня||'||ts(i-j)||'''',DBMS_SQL.NATIVE);
    END LOOP;
    j:=j+ts.Count+1;
    DBMS_SQL.PARSE(cid,SQLText||TO_CHAR(j)||' IS ''Койко-дней||Всего''',DBMS_SQL.NATIVE);
    i:=1;
    IF cKontShort%ISOPEN THEN
      CLOSE cKontShort;
    END IF;
    OPEN cKontShort;
    LOOP
      FETCH cKontShort INTO SQLText1;
      EXIT WHEN cKontShort%NOTFOUND;
      DBMS_SQL.PARSE(cid,SQLText||TO_CHAR(j+i)||' IS ''Койко-дней||'||SQLText1||'''',DBMS_SQL.NATIVE);
      i:=i+1;
    END LOOP;
    CLOSE cKontShort;

  --Build Table...
    nDays:=pFD_DATA2-pFD_DATA1+1;
    SQLText1:='INSERT INTO '||pFC_TABLE||' (';

    FOR i IN 1..nCols-1 LOOP
      SQLText1:=SQLText1||' FC_FIELD'||TO_CHAR(i)||',';
    end LOOP;
    SQLText1:=SQLText1||' FC_FIELD'||TO_CHAR(nCols)||') VALUES (';

    FOR i IN 0..nDays-1 LOOP
      SQLText:=SQLText1||''''||TO_CHAR(pFD_DATA1+i,'dd.mm.yyyy')||''''||','||''''||TO_CHAR(PAC_MOVEMENT.GET_COUNT_MORNING(pFD_DATA1+i))||'''';
      FOR j IN 1..tv.COUNT LOOP
        SQLText:=SQLText||','||''''||TO_CHAR(PAC_MOVEMENT.GET_COUNT_MORNING_VID(pFD_DATA1+i,tv(j)))||'''';
      END LOOP;

      SQLText:=SQLText||','||''''||PAC_MOVEMENT.GET_COUNT_PRYB(pFD_DATA1+i)||'''';
      FOR j IN 1..tv.COUNT LOOP
        SQLText:=SQLText||','||''''||PAC_MOVEMENT.GET_COUNT_PRYB_VID(pFD_DATA1+i,tv(j))||'''';
      END LOOP;


      SQLText:=SQLText||','||''''||PAC_MOVEMENT.GET_COUNT_VYB(pFD_DATA1+i)||'''';
      FOR j IN 1..tv.COUNT LOOP
        SQLText:=SQLText||','||''''||PAC_MOVEMENT.GET_COUNT_VYB_VID(pFD_DATA1+i,tv(j))||'''';
      END LOOP;

      SQLText:=SQLText||','||''''||TO_CHAR(PAC_MOVEMENT.GET_COUNT_MORNING(pFD_DATA1+i+1))||'''';
      FOR j IN 1..tv.COUNT LOOP
        SQLText:=SQLText||','||''''||TO_CHAR(PAC_MOVEMENT.GET_COUNT_MORNING_VID(pFD_DATA1+i+1,tv(j)))||'''';
      END LOOP;


      SQLText:=SQLText||','||''''||TO_CHAR(PAC_MOVEMENT.GET_KDN(pFD_DATA1+i))||'''';

      FOR j IN 1..t.COUNT LOOP
        SQLText:=SQLText||','||''''||TO_CHAR(PAC_MOVEMENT.GET_KDN_PRIZN(pFD_DATA1+i,t(j)))||'''';
      END LOOP;
      SQLText:=SQLText||')';
      DBMS_SQL.PARSE(cid,SQLText,DBMS_SQL.NATIVE);
      j:=DBMS_SQL.Execute(cid);
    end LOOP;
    COMMIT;
    DBMS_SQL.CLOSE_CURSOR(cid);

  END;
--По палатам
  PROCEDURE DO_CALC_REPORT_PALATS (pFD_DATA1 IN DATE,pFD_DATA2 IN DATE, pFC_TABLE OUT VARCHAR2)
  IS
  nDays NUMBER;
  i      NUMBER;
  cid  NUMBER;
  nCols NUMBER;
  nKont NUMBER;
  s    Varchar2(100);
  j NUMBER;
  SQLText VARCHAR2(32767);
  SQLText1 VARCHAR2(32767);
  nTemp NUMBER;
  t TTable;
  tv TTable;
  ts TSTable;
  BEGIN
  --Filling pl/sql table with kont codes...
--    PROGRESS_BAR.INIT;
    OPEN cKont;
    i:=1;
    LOOP
      FETCH cKont INTO j;
      EXIT WHEN cKont%NOTFOUND;
      t(i):=j;
      i:=i+1;
    END LOOP;
    CLOSE cKont;

    OPEN cPalata;
    i:=1;
    LOOP
      FETCH cPalata INTO j;
      EXIT WHEN cPalata%NOTFOUND;
      tv(i):=j;
      i:=i+1;
    END LOOP;
    CLOSE cPalata;

    if cPalataShort%ISOPEN then
      CLOSE cPalataShort;
    end if;
    OPEN cPalataShort;
    i:=1;
    LOOP
      FETCH cPalataShort INTO s;
      EXIT WHEN cPalataShort%NOTFOUND;
      ts(i):=s;
      i:=i+1;
    END LOOP;
    CLOSE cPalataShort;
--Create an temporary table
    cid:=DBMS_SQL.OPEN_CURSOR;
    OPEN cKontCount;
    FETCH cKontCount INTO nKont;
    CLOSE cKontCount;
    pFC_TABLE:='TPACMOVE_'||TO_CHAR(SYSDATE,'DDMMYYYYHHMISS');
    SQLText:='CREATE TABLE '||pFC_TABLE||' ( ';
    nCols:=6+nKont;
    OPEN cPalataCount;
    FETCH cPalataCount INTO nKont;
    CLOSE cPalataCount;
    nCols:=nCols+4*nKont;
    SQLText:=SQLText||' FC_FIELD1 VARCHAR(10),';
    FOR i IN 2..nCols-1 LOOP
      SQLText:=SQLText||' FC_FIELD'||TO_CHAR(i)||'  VARCHAR2(10),';
    end LOOP;
    SQLText:=SQLText||' FC_FIELD'||TO_CHAR(nCols)||'  VARCHAR2(10))';
    DBMS_SQL.PARSE(cid,SQLText,DBMS_SQL.NATIVE);
    j:=DBMS_SQL.EXECUTE(cid);
  --End
  --Set comments...
    SQLText:='COMMENT ON COLUMN '||pFC_TABLE||'.FC_FIELD';
    DBMS_SQL.PARSE(cid,SQLText||'1 IS ''Дата:''',DBMS_SQL.NATIVE);
    DBMS_SQL.PARSE(cid,SQLText||'2 IS ''На начало дня||Всего''',DBMS_SQL.NATIVE);

    FOR i in 3..ts.Count+2 LOOP
      DBMS_SQL.PARSE(cid,SQLText||TO_CHAR(i)||' IS ''На начало дня||'||ts(i-2)||'''',DBMS_SQL.NATIVE);
    END LOOP;
    j:=ts.Count+3;
    DBMS_SQL.PARSE(cid,SQLText||TO_CHAR(j)||' IS ''Прибыло||Всего''',DBMS_SQL.NATIVE);
    FOR i in j+1..ts.Count+j LOOP
      DBMS_SQL.PARSE(cid,SQLText||TO_CHAR(i)||' IS ''Прибыло||'||ts(i-j)||'''',DBMS_SQL.NATIVE);
    END LOOP;
    j:=j+ts.Count+1;
    DBMS_SQL.PARSE(cid,SQLText||TO_CHAR(j)||' IS ''Выбыло||Всего''',DBMS_SQL.NATIVE);
    FOR i in j+1..ts.Count+j LOOP
      DBMS_SQL.PARSE(cid,SQLText||TO_CHAR(i)||' IS ''Выбыло||'||ts(i-j)||'''',DBMS_SQL.NATIVE);
    END LOOP;
    j:=j+ts.Count+1;
    DBMS_SQL.PARSE(cid,SQLText||TO_CHAR(j)||' IS ''На конец дня||Всего''',DBMS_SQL.NATIVE);
    FOR i in j+1..ts.Count+j LOOP
      DBMS_SQL.PARSE(cid,SQLText||TO_CHAR(i)||' IS ''На конец дня||'||ts(i-j)||'''',DBMS_SQL.NATIVE);
    END LOOP;
    j:=j+ts.Count+1;
    DBMS_SQL.PARSE(cid,SQLText||TO_CHAR(j)||' IS ''Койко-дней||Всего''',DBMS_SQL.NATIVE);
    i:=1;
    IF cKontShort%ISOPEN THEN
      CLOSE cKontShort;
    END IF;
    OPEN cKontShort;
    LOOP
      FETCH cKontShort INTO SQLText1;
      EXIT WHEN cKontShort%NOTFOUND;
      DBMS_SQL.PARSE(cid,SQLText||TO_CHAR(j+i)||' IS ''Койко-дней||'||SQLText1||'''',DBMS_SQL.NATIVE);
      i:=i+1;
    END LOOP;
    CLOSE cKontShort;

  --Build Table...
    nDays:=pFD_DATA2-pFD_DATA1+1;
    SQLText1:='INSERT INTO '||pFC_TABLE||' (';

    FOR i IN 1..nCols-1 LOOP
      SQLText1:=SQLText1||' FC_FIELD'||TO_CHAR(i)||',';
    end LOOP;
    SQLText1:=SQLText1||' FC_FIELD'||TO_CHAR(nCols)||') VALUES (';

    FOR i IN 0..nDays-1 LOOP
      SQLText:=SQLText1||''''||TO_CHAR(pFD_DATA1+i,'dd.mm.yyyy')||''''||','||''''||TO_CHAR(PAC_MOVEMENT.GET_COUNT_MORNING(pFD_DATA1+i))||'''';

      FOR j IN 1..tv.COUNT LOOP
        SQLText:=SQLText||','||''''||TO_CHAR(PAC_MOVEMENT.GET_COUNT_MORNING_PALATA(pFD_DATA1+i,tv(j)))||'''';
      END LOOP;

      SQLText:=SQLText||','||''''||PAC_MOVEMENT.GET_COUNT_PRYB(pFD_DATA1+i)||'''';
      FOR j IN 1..tv.COUNT LOOP
        SQLText:=SQLText||','||''''||PAC_MOVEMENT.GET_COUNT_PRYB_PALATA(pFD_DATA1+i,tv(j))||'''';
      END LOOP;


      SQLText:=SQLText||','||''''||PAC_MOVEMENT.GET_COUNT_VYB(pFD_DATA1+i)||'''';
      FOR j IN 1..tv.COUNT LOOP
        SQLText:=SQLText||','||''''||PAC_MOVEMENT.GET_COUNT_VYB_PALATA(pFD_DATA1+i,tv(j))||'''';
      END LOOP;

      SQLText:=SQLText||','||''''||TO_CHAR(PAC_MOVEMENT.GET_COUNT_MORNING(pFD_DATA1+i+1))||'''';
      FOR j IN 1..tv.COUNT LOOP
        SQLText:=SQLText||','||''''||TO_CHAR(PAC_MOVEMENT.GET_COUNT_MORNING_PALATA(pFD_DATA1+i+1,tv(j)))||'''';
      END LOOP;


      SQLText:=SQLText||','||''''||TO_CHAR(PAC_MOVEMENT.GET_KDN(pFD_DATA1+i))||'''';

      FOR j IN 1..t.COUNT LOOP
        SQLText:=SQLText||','||''''||TO_CHAR(PAC_MOVEMENT.GET_KDN_PRIZN(pFD_DATA1+i,t(j)))||'''';
      END LOOP;
      SQLText:=SQLText||')';
      DBMS_SQL.PARSE(cid,SQLText,DBMS_SQL.NATIVE);
      j:=DBMS_SQL.Execute(cid);
--      PROGRESS_BAR.STEPIT;
    end LOOP;
    COMMIT;
    DBMS_SQL.CLOSE_CURSOR(cid);
--    PROGRESS_BAR.RESETPROGRESS;

  END;
END;
/

SHOW ERRORS;


