DROP PACKAGE BODY ASU.PKG_LAB_STAT_FUNCS
/

--
-- PKG_LAB_STAT_FUNCS  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_LAB_STAT_FUNCS" IS
--Необходимо узнать по поводу повторно обследованных, если собирается вчера обсл челов. и седня он опять, то есть следующая вставка
--была позже он - повторный иль нет?
  nGoodDyn NUMBER:=0;
  PROCEDURE DO_REFRESH_VPOVTOR IS
  BEGIN
    DBMS_MVIEW.REFRESH ('VPOVTOR', 'A');
  END;
  PROCEDURE DO_REFRESH_VRESAN IS
  BEGIN
    DBMS_MVIEW.REFRESH ('VRESAN', 'A');
  END;
  PROCEDURE DO_REFRESH_VCONTROL IS
  BEGIN
    DBMS_MVIEW.REFRESH ('VCONTROL', 'A');
  END;
  PROCEDURE DO_REFRESH_VNAZAN IS
  strSQL VARCHAR2(2000);
  BEGIN
    DBMS_MVIEW.REFRESH ('VNAZAN', 'A');
  END;
  PROCEDURE DO_REFRESH_VRESPAT IS
  BEGIN
    DBMS_MVIEW.REFRESH ('VRESPAT', 'A');
  END;
  FUNCTION GET_COUNT_ISSL_FUCK_POVT_CONTR (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_SMID IN NUMBER, nType IN NUMBER,pFK_OTDELID IN NUMBER)
    RETURN NUMBER IS
    strSQl VARCHAR2 (32767);
    CURSOR c IS
      SELECT FK_ID
        FROM (SELECT GET_SYNID ('RAZ_ANAL') FK_ANALID, GET_SYNID ('RAZ_BIOHIM', 0) FK_BIOHIMID, GET_SYNID ('RAZ_IMMUN', 0) FK_IMMUNID, GET_SYNID ('RAZ_BAK', 0) FK_BAKID
                FROM DUAL), TSMID
       WHERE FK_OWNER = FK_ANALID
         AND FK_ID NOT IN (FK_IMMUNID, FK_BIOHIMID, FK_BAKID);
    i NUMBER;
    str VARCHAR2(4000);
  BEGIN
    IF nType = 1 THEN
      strSQL:=  'SELECT SUM (FN_SUM) '||
                '   FROM ('||
                'SELECT SUM (FN_COUNT)FN_SUM FROM '||
                 ' (SELECT FN_COUNT* GET_ED_FROM_SMID(FK_SMID)FN_COUNT FROM (SELECT COUNT (FK_SMID) FN_COUNT,FK_SMID '||
                 '    FROM (select distinct fk_smid,fk_nazid,fk_colid from VRESAN, '||
                 '       (SELECT :FD_DATA1 FD_DATA1, :FD_DATA2 FD_DATA2 '||
                 '          FROM DUAL) '||
                 ' WHERE '||
                 '   FD_INS BETWEEN FD_DATA1 AND FD_DATA2 '||
                 '   :FK_SMID) '||
                 'GROUP BY FK_SMID))'||
                ' UNION ALL '||
                'SELECT SUM(FN_COUNT*GET_ED_FROM_SMID(FK_SMID)) FROM (select COUNT(FK_SMID) FN_COUNT,FK_SMID from vcontrol,(SELECT :FD_DATA1 FD_DATA1,:FD_DATA2 FD_DATA2 FROM DUAL) WHERE FD_DATE BETWEEN FD_DATA1 AND FD_DATA2 :FK_SMID GROUP BY FK_SMID)  UNION ALL '||
                'SELECT SUM(FN_COUNT) FROM VPOVTOR,(SELECT :FD_DATA1 FD_DATA1,:FD_DATA2 FD_DATA2 FROM DUAL) WHERE FD_DATE BETWEEN FD_DATA1 AND FD_DATA2 :FK_SMID UNION ALL '||
                'SELECT SUM(FN_SAN) FROM VPOVTOR,(SELECT :FD_DATA1 FD_DATA1,:FD_DATA2 FD_DATA2 FROM DUAL) WHERE FD_DATE BETWEEN FD_DATA1 AND FD_DATA2 :FK_SMID)';
      --Всего исследований
    ELSIF nType = 2 THEN
      strSQL:='SELECT SUM (FN_COUNT)FN_SUM FROM '||
                 ' (SELECT FN_COUNT* GET_ED_FROM_SMID(FK_SMID)FN_COUNT FROM (SELECT COUNT (FK_SMID) FN_COUNT,FK_SMID '||
                 '    FROM (select distinct fk_smid,fk_nazid,fk_colid from VRESAN, '||
                 '       (SELECT :FD_DATA1 FD_DATA1, :FD_DATA2 FD_DATA2 '||
                 '          FROM DUAL) '||
                 ' WHERE '||
                 '   FD_INS BETWEEN FD_DATA1 AND FD_DATA2 '||
                 '   :FK_SMID) '||
                 'GROUP BY FK_SMID))';
       --Из них фактических
    ELSIF nType = 3 THEN
      strSQL  :=
        'SELECT 100*(PKG_LAB_STAT_FUNCS.GET_COUNT_ISSL_FUCK_POVT_CONTR(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',2,'||pFK_OTDELID||')/PKG_LAB_STAT_FUNCS.GET_COUNT_ISSL_FUCK_POVT_CONTR(:FD_DATA1,:FD_DATA2,' || pFK_SMID ||
          ',1,'||pFK_OTDELID||')) FROM DUAL ';
       --% фактических исследований
    ELSIF nType = 4 THEN
      strSQL:='SELECT SUM(FN_COUNT) FROM VPOVTOR,(SELECT :FD_DATA1 FD_DATA1,:FD_DATA2 FD_DATA2 FROM DUAL) WHERE FD_DATE BETWEEN FD_DATA1 AND FD_DATA2 :FK_SMID ';
       --Кол-во повторов
    ELSIF nType = 5 THEN
      strSQL  :=
        'SELECT 100*(PKG_LAB_STAT_FUNCS.GET_COUNT_ISSL_FUCK_POVT_CONTR(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',4,'||pFK_OTDELID||')/PKG_LAB_STAT_FUNCS.GET_COUNT_ISSL_FUCK_POVT_CONTR(:FD_DATA1,:FD_DATA2,' || pFK_SMID ||
          ',1,'||pFK_OTDELID||')) FROM DUAL ';
       --% повторов
    ELSIF nType = 6 THEN
      strSQL  := 'SELECT SUM(FN_COUNT*GET_ED_FROM_SMID(FK_SMID)) FROM (select COUNT(FK_SMID) FN_COUNT,FK_SMID from vcontrol,(SELECT :FD_DATA1 FD_DATA1,:FD_DATA2 FD_DATA2 FROM DUAL) WHERE FD_DATE BETWEEN FD_DATA1 AND FD_DATA2 :FK_SMID GROUP BY FK_SMID)';
      --Контролей
    ELSIF nType = 7 THEN
      strSQL  :=
        'SELECT 100*(PKG_LAB_STAT_FUNCS.GET_COUNT_ISSL_FUCK_POVT_CONTR(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',6,'||pFK_OTDELID||')/PKG_LAB_STAT_FUNCS.GET_COUNT_ISSL_FUCK_POVT_CONTR(:FD_DATA1,:FD_DATA2,' || pFK_SMID ||
          ',1,'||pFK_OTDELID||')) FROM DUAL ';
       --%Контролей
    ELSIF nType = 8 THEN
      strSQL:='SELECT SUM(FN_SAN) FROM VPOVTOR,(SELECT :FD_DATA1 FD_DATA1,:FD_DATA2 FD_DATA2 FROM DUAL) WHERE FD_DATE BETWEEN FD_DATA1 AND FD_DATA2 :FK_SMID';
      --Санитарно-гигиенических
    ELSIF nType = 9 THEN
      strSQL  :=
        'SELECT 100*(PKG_LAB_STAT_FUNCS.GET_COUNT_ISSL_FUCK_POVT_CONTR(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',8,'||pFK_OTDELID||')/PKG_LAB_STAT_FUNCS.GET_COUNT_ISSL_FUCK_POVT_CONTR(:FD_DATA1,:FD_DATA2,' || pFK_SMID ||
          ',1,'||pFK_OTDELID||')) FROM DUAL ';
       --%Санитарно-гигиенических
    ELSIF nType = 10 THEN
      strSQL:='SELECT SUM (FN_COUNT)FN_SUM FROM '||
                 ' (SELECT FN_COUNT* GET_ED_FROM_SMID(FK_SMID)FN_COUNT FROM (SELECT COUNT (FK_SMID) FN_COUNT,FK_SMID '||
                 '    FROM (select distinct fk_smid,fk_nazid,fk_colid from VRESAN, '||
                 '       (SELECT :FD_DATA1 FD_DATA1, :FD_DATA2 FD_DATA2 '||
                 '          FROM DUAL),TPATNAME '||
                 ' WHERE '||
                 '   FD_INS BETWEEN FD_DATA1 AND FD_DATA2 AND TPATNAME.FK_ID=FK_PATID AND FP_PRIOR>0 '||
                 '   :FK_SMID) '||
                 'GROUP BY FK_SMID))';
       --Патологических результатов
    ELSIF nType = 11 THEN
      strSQL  :=
        'SELECT 100*(PKG_LAB_STAT_FUNCS.GET_COUNT_ISSL_FUCK_POVT_CONTR(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',10,'||pFK_OTDELID||')/PKG_LAB_STAT_FUNCS.GET_COUNT_ISSL_FUCK_POVT_CONTR(:FD_DATA1,:FD_DATA2,' || pFK_SMID ||
          ',2,'||pFK_OTDELID||')) FROM DUAL ';
       --% Патологических результатов
    ELSIF nType = 12 THEN
      strSQL:='SELECT SUM (FN_COUNT)FN_SUM FROM '||
                 ' (SELECT FN_COUNT* GET_ED_FROM_SMID(FK_SMID)FN_COUNT FROM (SELECT COUNT (FK_SMID) FN_COUNT,FK_SMID '||
                 '    FROM (select distinct fk_smid,fk_nazid,fk_colid from VRESAN, '||
                 '       (SELECT :FD_DATA1 FD_DATA1, :FD_DATA2 FD_DATA2 '||
                 '          FROM DUAL),TPATNAME '||
                 ' WHERE '||
                 '   FD_INS BETWEEN FD_DATA1 AND FD_DATA2 AND TPATNAME.FK_ID=FK_PATID AND FP_PRIOR>0 AND FL_PATFIRST=1 '||
                 '   :FK_SMID) '||
                 'GROUP BY FK_SMID))';
       --Впервые выявленных патологий
    ELSIF nType = 13 THEN
      strSQL  :=
        'SELECT 100*(PKG_LAB_STAT_FUNCS.GET_COUNT_ISSL_FUCK_POVT_CONTR(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',12,'||pFK_OTDELID||')/PKG_LAB_STAT_FUNCS.GET_COUNT_ISSL_FUCK_POVT_CONTR(:FD_DATA1,:FD_DATA2,' || pFK_SMID ||
          ',10,'||pFK_OTDELID||')) FROM DUAL ';
       --% Впервые выявленных патологий
    END IF;
    strSQL  := REPLACE (strSQL, ':FD_DATA1', 'TO_DATE(''' || TO_CHAR (pFD_DATA1, 'dd.mm.yyyy') || ''',''dd.mm.yyyy'')');
    strSQL  := REPLACE (strSQL, ':FD_DATA2', 'TO_DATE(''' || TO_CHAR (pFD_DATA2, 'dd.mm.yyyy') || ''',''dd.mm.yyyy'')');
    IF pFK_SMID = -1 THEN
      strSQL  := REPLACE (strSQL, ':FK_SMID', '');
    ELSIF pFK_OTDELID<>-1 THEN
      strSQL  := REPLACE (strSQL, ':FK_SMID', ' AND FK_OTDELID=' || pFK_OTDELID || ' ');
    ELSE
      strSQL  := REPLACE (strSQL, ':FK_SMID', ' AND FK_RAZDID=' || pFK_SMID || ' ');
    END IF;
    BEGIN
      EXECUTE IMMEDIATE strSQL INTO i;
    EXCEPTION
      WHEN OTHERS THEN
        NULL;
    END;
    IF i IS NULL THEN
      i  := 0;
    END IF;
    RETURN i;
  END;
  FUNCTION GET_COUNT_LAB_POKAZ_DUB (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_SMID IN NUMBER, nType IN NUMBER,pFK_PRIZNID IN NUMBER:=-1)
    RETURN NUMBER IS
    strSQl VARCHAR2 (32767);
    i NUMBER;
    str VARCHAR2(4000);
  BEGIN
    IF nType = 2 THEN
      strSQL  := 'SELECT COUNT(DISTINCT FK_PACID) FROM VRESAN WHERE FL_AMB=0 AND FD_INS BETWEEN :FD_DATA1 AND :FD_DATA2 :FK_SMID :FK_PRIZNID ';
    ELSIF nType = 3 THEN
      strSQL  := 'SELECT 100*(PKG_LAB_STAT_FUNCS.GET_COUNT_LAB_POKAZ_DUB(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',2)/GET_COUNT_OUT_PERIOD(:FD_DATA1,:FD_DATA2)) FROM DUAL ';
    ELSIF nType = 4 THEN
        strSQL  := 'SELECT SUM (FN_COUNT) FROM '||
                   ' (SELECT FN_COUNT* GET_ED_FROM_SMID(FK_SMID)FN_COUNT FROM (SELECT COUNT (FK_SMID) FN_COUNT,FK_SMID '||
                   '    FROM (select distinct fk_colid,fk_smid,fk_nazid from VRESAN, '||
                   '       (SELECT :FD_DATA1 FD_DATA1, :FD_DATA2 FD_DATA2 '||
                   '          FROM DUAL) '||
                   ' WHERE '||
                   '   FD_INS BETWEEN FD_DATA1 AND FD_DATA2 '||
                   '   AND FL_AMB=0 :FK_SMID) '||
                   'GROUP BY FK_SMID))';
    ELSIF nType = 5 THEN
      strSQL  := 'SELECT PKG_LAB_STAT_FUNCS.GET_COUNT_LAB_POKAZ_DUB(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',4)/PKG_LAB_STAT_FUNCS.GET_COUNT_LAB_POKAZ_DUB(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',2) FROM DUAL ';
    ELSIF nType = 6 THEN
      strSQL  := 'SELECT PKG_LAB_STAT_FUNCS.GET_COUNT_LAB_POKAZ_DUB(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',4)/GET_COUNT_OUT_PERIOD(:FD_DATA1,:FD_DATA2) FROM DUAL ';
    ELSIF nType = 7 THEN
      strSQL  := 'SELECT COUNT(FK_PACID) FROM (SELECT DISTINCT FK_PACID,FK_NAPRID FROM VRESAN,TPATNAME,(SELECT :FD_DATA1 FD_DATA1,:FD_DATA2 FD_DATA2 FROM DUAL) WHERE FK_PATID=TPATNAME.FK_ID AND FP_PRIOR>0 AND fd_ins BETWEEN FD_DATA1 AND FD_DATA2 AND FL_AMB=0 :FK_SMID)';
    ELSIF nType = 8 THEN
      strSQL  := 'SELECT 100*(PKG_LAB_STAT_FUNCS.GET_COUNT_LAB_POKAZ_DUB(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',7)/PKG_LAB_STAT_FUNCS.GET_COUNT_LAB_POKAZ_DUB(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',2)) FROM DUAL ';
    ELSIF nType = 9 THEN
        strSQL  := 'SELECT SUM (FN_COUNT) FROM '||
                   ' (SELECT FN_COUNT* GET_ED_FROM_SMID(FK_SMID)FN_COUNT FROM (SELECT COUNT (FK_SMID) FN_COUNT,FK_SMID '||
                   '    FROM (select distinct fk_colid,fk_smid,fk_nazid from VRESAN, '||
                   '       (SELECT :FD_DATA1 FD_DATA1, :FD_DATA2 FD_DATA2 '||
                   '          FROM DUAL),TPATNAME '||
                   ' WHERE '||
                   '   TPATNAME.FK_ID=FK_PATID AND FP_PRIOR>0 AND FD_INS BETWEEN FD_DATA1 AND FD_DATA2 '||
                   '   AND FL_AMB=0 :FK_SMID) '||
                   'GROUP BY FK_SMID))';
    ELSIF nType = 10 THEN
      strSQL  := 'SELECT 100*(PKG_LAB_STAT_FUNCS.GET_COUNT_LAB_POKAZ_DUB(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',9)/PKG_LAB_STAT_FUNCS.GET_COUNT_LAB_POKAZ_DUB(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',4)) FROM DUAL ';
    ELSIF nType = 11 THEN
    strSQL  := 'select /*+ rule*/count(*) from (select distinct fk_pacid,fk_naprid '||
                 '    from ( '||
                 '           select count(fk_smid) fn_count,fk_pacid,fk_naprid,fk_smid,fk_colid '||
                 '              from vresan,( '||
                 '                select distinct fk_pacid fk_vpacid, fk_naprid fk_vnaprid '||
                 '                   from vresan,(SELECT :FD_DATA1 FD_DATA1,:FD_DATA2 FD_DATA2 FROM DUAL) '||
                 '                   where fd_ins between fd_data1 and fd_data2  and fl_amb=0 :FK_SMID ),(SELECT :FD_DATA1 FD_DATA1,:FD_DATA2 FD_DATA2 FROM DUAL) '||
                 '               where fk_pacid=fk_vpacid and fk_naprid=fk_vnaprid and fl_amb=0 :FK_SMID '||
                 '               group by fk_pacid,fk_naprid,fk_smid,fk_colid) '||
                 '    where '||
                 'fn_count>1)';
    ELSIF nType = 12 THEN
      strSQL  := 'SELECT 100*(PKG_LAB_STAT_FUNCS.GET_COUNT_LAB_POKAZ_DUB(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',11)/GET_COUNT_OUT_PERIOD(:FD_DATA1,:FD_DATA2)) FROM DUAL ';
    ELSIF nType = 13 THEN
      strSQL  := 'SELECT 100*(PKG_LAB_STAT_FUNCS.GET_COUNT_LAB_POKAZ_DUB(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',11)/PKG_LAB_STAT_FUNCS.GET_COUNT_LAB_POKAZ_DUB(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',2)) FROM DUAL ';
    ELSIF nType = 14 THEN
      strSQL  := 'select /*+ rule*/count(*) from (select distinct fk_pacid,fk_naprid '||
                 '    from ( '||
                 '           select count(fk_smid) fn_count,fk_pacid,fk_naprid,fk_smid,fk_colid '||
                 '              from vresan,tpatname,( '||
                 '                select distinct fk_pacid fk_vpacid, fk_naprid fk_vnaprid '||
                 '                   from vresan,(SELECT :FD_DATA1 FD_DATA1,:FD_DATA2 FD_DATA2 FROM DUAL) '||
                 '                   where fd_ins between fd_data1 and fd_data2 AND FL_AMB=0 :FK_SMID ),(SELECT :FD_DATA1 FD_DATA1,:FD_DATA2 FD_DATA2 FROM DUAL) '||
                 '               where tpatname.fk_id=fk_patid and fp_prior>0 and fk_pacid=fk_vpacid and fk_naprid=fk_vnaprid AND FL_AMB=0 :FK_SMID  '||
                 '               group by fk_pacid,fk_naprid,fk_smid,fk_colid) '||
                 '    where '||
                 'fn_count>1)';
    ELSIF nType = 15 THEN
      strSQL  := 'select /*+ rule*/count(*) from (select distinct fk_pacid,fk_naprid '||
                   '    from ( '||
                   '           select count(fk_smid) fn_count,fk_pacid,fk_naprid,fk_smid,fk_colid '||
                   '              from vresan,tpatname,( '||
                   '                select distinct fk_pacid fk_vpacid, fk_naprid fk_vnaprid '||
                   '                   from vresan,(SELECT :FD_DATA1 FD_DATA1,:FD_DATA2 FD_DATA2 FROM DUAL) '||
                   '                   where fd_ins between fd_data1 and fd_data2 AND FL_AMB=0 :FK_SMID ),'||
                   '                      (SELECT :FD_DATA1 FD_DATA1,:FD_DATA2 FD_DATA2 FROM DUAL) '||
                   '               where tpatname.fk_id=fk_patid and fp_prior>0 and fk_pacid=fk_vpacid and fk_naprid=fk_vnaprid AND FL_AMB=0 :FK_SMID '||
                   '               group by fk_pacid,fk_naprid,fk_smid,fk_colid) '||
                   '    where '||
                   'fn_count>1 and GET_GOOD_DINAMIC_UNIVERSAL (FK_PACID, FK_SMID, FK_COLID) = 1)';
    ELSIF nType = 16 THEN
      strSQL  := 'SELECT SUM(FN_COUNT*GET_ED_FROM_SMID(FK_SMID)) FROM (select COUNT(FK_SMID) FN_COUNT,FK_SMID from vcontrol,(SELECT :FD_DATA1 FD_DATA1,:FD_DATA2 FD_DATA2 FROM DUAL) WHERE FD_DATE BETWEEN FD_DATA1 AND FD_DATA2 :FK_SMID GROUP BY FK_SMID)';
    ELSIF nType = 17 THEN
        strSQL  := 'SELECT SUM(FN_COUNT) FROM VPOVTOR,(SELECT :FD_DATA1 FD_DATA1,:FD_DATA2 FD_DATA2 FROM DUAL) WHERE FD_DATE BETWEEN FD_DATA1 AND FD_DATA2 :FK_SMID';
    ELSIF nType = 18 THEN
      strSQL  := 'SELECT SUM(FN_SAN) FROM VPOVTOR,(SELECT :FD_DATA1 FD_DATA1,:FD_DATA2 FD_DATA2 FROM DUAL) WHERE FD_DATE BETWEEN FD_DATA1 AND FD_DATA2 :FK_SMID';
      --Санитарно-гигиенческих исследований
    END IF;
    strSQL  := REPLACE (strSQL, ':FD_DATA1', 'TO_DATE(''' || TO_CHAR (pFD_DATA1, 'dd.mm.yyyy') || ''',''dd.mm.yyyy'')');
    strSQL  := REPLACE (strSQL, ':FD_DATA2', 'TO_DATE(''' || TO_CHAR (pFD_DATA2, 'dd.mm.yyyy') || ''',''dd.mm.yyyy'')');
    strSQL  := REPLACE (strSQL, ':FK_SMID', ' AND FK_OTDELID=' || pFK_SMID || ' ');
    IF pFK_PRIZNID<>-1 THEN
      strSQL  := REPLACE (strSQL, ':FK_PRIZNID', ' AND GET_PAC_PRIZN_KODE(FK_PACID)=' || pFK_PRIZNID || ' ');
    ELSE
      strSQL  := REPLACE (strSQL, ':FK_PRIZNID', ' ');
    END IF;
    BEGIN
      EXECUTE IMMEDIATE strSQL INTO i;
    EXCEPTION
      WHEN OTHERS THEN
--        i:=-1;
        NULL;
    END;
    IF i IS NULL THEN
      i  := 0;
    END IF;
    RETURN i;
  END;
  FUNCTION GET_COUNT_LAB_PROIZV_DUB (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_SMID IN NUMBER, nType IN NUMBER,pFK_NAPRID IN NUMBER:=-1)
    RETURN NUMBER IS
    strSQl VARCHAR2 (32767);
    i NUMBER;
    str VARCHAR2(4000);
  BEGIN
    IF nType = 1 THEN
      strSQL  := 'SELECT COUNT(DISTINCT FK_PACID) FROM VRESAN,(SELECT :FD_DATA1 FD_DATA1,:FD_DATA2 FD_DATA2 FROM DUAL) WHERE FL_AMB=0 AND FD_INS BETWEEN FD_DATA1 AND FD_DATA2 :FK_SMID ';
    ELSIF nType = 2 THEN
      strSQL  := 'SELECT 100*(PKG_LAB_STAT_FUNCS.GET_COUNT_LAB_PROIZV_DUB(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',1)/GET_COUNT_OUT_PERIOD(:FD_DATA1,:FD_DATA2)) FROM DUAL ';
    ELSIF nType = 3 THEN
      strSQL  := 'SELECT SUM (FN_COUNT) FROM '||
                 ' (SELECT FN_COUNT* GET_ED_FROM_SMID(FK_SMID)FN_COUNT FROM (SELECT COUNT (FK_SMID) FN_COUNT,FK_SMID '||
                 '    FROM (select distinct fk_smid,fk_nazid,FK_COLID from VRESAN, '||
                 '       (SELECT :FD_DATA1 FD_DATA1, :FD_DATA2 FD_DATA2 '||
                 '          FROM DUAL) '||
                 ' WHERE '||
                 '   FD_INS BETWEEN FD_DATA1 AND FD_DATA2 '||
                 '   AND FL_AMB=0 :FK_SMID) '||
                 'GROUP BY FK_SMID))';
    ELSIF nType = 4 THEN
      strSQL  := 'SELECT PKG_LAB_STAT_FUNCS.GET_COUNT_LAB_PROIZV_DUB(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',3)/GET_COUNT_OUT_PERIOD(:FD_DATA1,:FD_DATA2) FROM DUAL ';
    ELSIF nType = 5 THEN
      strSQL  := 'SELECT PKG_LAB_STAT_FUNCS.GET_COUNT_LAB_PROIZV_DUB(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',3)/PKG_LAB_STAT_FUNCS.GET_COUNT_LAB_PROIZV_DUB(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',1) FROM DUAL ';
    ELSIF nType = 6 THEN
      strSQL:='SELECT COUNT (DISTINCT FK_PACID) FROM VRESAN,TPATNAME,(SELECT :FD_DATA1 FD_DATA1,:FD_DATA2 FD_DATA2 FROM DUAL) WHERE FL_AMB=0 AND FD_INS BETWEEN FD_DATA1 AND FD_DATA2 AND TPATNAME.FK_ID=FK_PATID AND FP_PRIOR>0 :FK_SMID';
    ELSIF nType = 7 THEN
      strSQL  := 'SELECT 100*(PKG_LAB_STAT_FUNCS.GET_COUNT_LAB_PROIZV_DUB(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',6)/GET_COUNT_OUT_PERIOD(:FD_DATA1,:FD_DATA2)) FROM DUAL ';
    ELSIF nType = 8 THEN
      strSQL  := 'SELECT 100*(PKG_LAB_STAT_FUNCS.GET_COUNT_LAB_PROIZV_DUB(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',6)/PKG_LAB_STAT_FUNCS.GET_COUNT_LAB_PROIZV_DUB(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',1)) FROM DUAL ';
    ELSIF nType = 9 THEN
    strSQL  := 'select /*+ rule*/count(*) from (select distinct fk_pacid,fk_naprid '||
                 '    from ( '||
                 '           select count(fk_smid) fn_count,fk_pacid,fk_naprid,fk_smid,fk_colid '||
                 '              from vresan,( '||
                 '                select distinct fk_pacid fk_vpacid, fk_naprid fk_vnaprid '||
                 '                   from vresan,(SELECT :FD_DATA1 FD_DATA1,:FD_DATA2 FD_DATA2 FROM DUAL) '||
                 '                   where fd_ins between fd_data1 and fd_data2 AND FL_AMB=0 :FK_SMID ),(SELECT :FD_DATA1 FD_DATA1,:FD_DATA2 FD_DATA2 FROM DUAL) '||
                 '               where fk_pacid=fk_vpacid and fk_naprid=fk_vnaprid AND FL_AMB=0 :FK_SMID '||
                 '               group by fk_pacid,fk_naprid,fk_smid,fk_colid) '||
                 '    where '||
                 'fn_count>1)';
      --Повторно обследовано лиц
    ELSIF nType = 10 THEN
      strSQL  := 'SELECT 100*(PKG_LAB_STAT_FUNCS.GET_COUNT_LAB_PROIZV_DUB(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',9)/GET_COUNT_OUT_PERIOD(:FD_DATA1,:FD_DATA2)) FROM DUAL ';
    ELSIF nType = 11 THEN
      strSQL  := 'SELECT 100*(PKG_LAB_STAT_FUNCS.GET_COUNT_LAB_PROIZV_DUB(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',9)/PKG_LAB_STAT_FUNCS.GET_COUNT_LAB_PROIZV_DUB(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',1)) FROM DUAL ';
    ELSIF nType = 12 THEN
    strSQL  := 'select /*+ rule*/count(*) from (select distinct fk_pacid,fk_naprid '||
                 '    from ( '||
                 '           select count(fk_smid) fn_count,fk_pacid,fk_naprid,fk_smid,fk_colid '||
                 '              from vresan,tpatname,( '||
                 '                select distinct fk_pacid fk_vpacid, fk_naprid fk_vnaprid '||
                 '                   from vresan,(SELECT :FD_DATA1 FD_DATA1,:FD_DATA2 FD_DATA2 FROM DUAL) '||
                 '                   where fd_ins between fd_data1 and fd_data2 AND FL_AMB=0 :FK_SMID ),(SELECT :FD_DATA1 FD_DATA1,:FD_DATA2 FD_DATA2 FROM DUAL) '||
                 '               where tpatname.fk_id=fk_patid and fp_prior>0 and fk_pacid=fk_vpacid and fk_naprid=fk_vnaprid AND FL_AMB=0 :FK_SMID'||
                 '               group by fk_pacid,fk_naprid,fk_smid,fk_colid) '||
                 '    where '||
                 'fn_count>1)';
      --Повторно обсл. с патологией
    ELSIF nType = 13 THEN
      strSQL  := 'SELECT 100*(PKG_LAB_STAT_FUNCS.GET_COUNT_LAB_PROIZV_DUB(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',12)/GET_COUNT_OUT_PERIOD(:FD_DATA1,:FD_DATA2)) FROM DUAL ';
    ELSIF nType = 14 THEN
      strSQL  := 'SELECT 100*(PKG_LAB_STAT_FUNCS.GET_COUNT_LAB_PROIZV_DUB(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',12)/PKG_LAB_STAT_FUNCS.GET_COUNT_LAB_PROIZV_DUB(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',6)) FROM DUAL ';
    ELSIF nType = 15 THEN
      strSQL  := 'SELECT SUM(FN_COUNT*GET_ED_FROM_SMID(FK_SMID)) FROM (select COUNT(FK_SMID) FN_COUNT,FK_SMID from vcontrol,(SELECT :FD_DATA1 FD_DATA1,:FD_DATA2 FD_DATA2 FROM DUAL) WHERE FD_DATE BETWEEN FD_DATA1 AND FD_DATA2 :FK_SMID GROUP BY FK_SMID)';
      --Кол-во контролей
    ELSIF nType = 16 THEN
      strSQL  := 'SELECT SUM(FN_COUNT) FROM VPOVTOR,(SELECT :FD_DATA1 FD_DATA1,:FD_DATA2 FD_DATA2 FROM DUAL) WHERE FD_DATE BETWEEN FD_DATA1 AND FD_DATA2 :FK_SMID';
      --Количество повторов
    ELSIF nType = 17 THEN
      strSQL  := 'SELECT SUM(FN_SAN) FROM VPOVTOR,(SELECT :FD_DATA1 FD_DATA1,:FD_DATA2 FD_DATA2 FROM DUAL) WHERE FD_DATE BETWEEN FD_DATA1 AND FD_DATA2 :FK_SMID';
      --Санитарно-гигиенческих исследований
    ELSIF nType = 18 THEN
      strSQL  := 'SELECT COUNT(DISTINCT FK_PACID) FROM VRESAN,(SELECT :FD_DATA1 FD_DATA1,:FD_DATA2 FD_DATA2 FROM DUAL) WHERE FL_AMB=1 AND FD_INS BETWEEN FD_DATA1 AND FD_DATA2 :FK_SMID :FK_NAPRID';
      --Амбулаторных
    ELSIF nType = 19 THEN
      strSQL  := 'SELECT SUM (FN_COUNT) FROM '||
                 ' (SELECT FN_COUNT* GET_ED_FROM_SMID(FK_SMID)FN_COUNT FROM (SELECT COUNT (FK_SMID) FN_COUNT,FK_SMID '||
                 '    FROM (select distinct fk_smid,fk_nazid,FK_COLID from VRESAN, '||
                 '       (SELECT :FD_DATA1 FD_DATA1, :FD_DATA2 FD_DATA2 '||
                 '          FROM DUAL) '||
                 ' WHERE '||
                 '   FD_INS BETWEEN FD_DATA1 AND FD_DATA2 '||
                 '   AND FL_AMB=1 :FK_SMID :FK_NAPRID) '||
                 'GROUP BY FK_SMID))';
       --Исследований для амбулаторных
    ELSIF nType = 20 THEN
      strSQL:=  'SELECT SUM (FN_SUM) '||
                '   FROM ('||
                'SELECT SUM (FN_COUNT)FN_SUM FROM '||
                 ' (SELECT FN_COUNT* GET_ED_FROM_SMID(FK_SMID)FN_COUNT FROM (SELECT COUNT (FK_SMID) FN_COUNT,FK_SMID '||
                 '    FROM (select distinct fk_smid,fk_nazid,fk_colid from VRESAN, '||
                 '       (SELECT :FD_DATA1 FD_DATA1, :FD_DATA2 FD_DATA2 '||
                 '          FROM DUAL) '||
                 ' WHERE '||
                 '   FD_INS BETWEEN FD_DATA1 AND FD_DATA2 '||
                 '   :FK_SMID) '||
                 'GROUP BY FK_SMID))'||
                ' UNION ALL '||
                'SELECT SUM(FN_COUNT*GET_ED_FROM_SMID(FK_SMID)) FROM (select COUNT(FK_SMID) FN_COUNT,FK_SMID from vcontrol,(SELECT :FD_DATA1 FD_DATA1,:FD_DATA2 FD_DATA2 FROM DUAL) WHERE FD_DATE BETWEEN FD_DATA1 AND FD_DATA2 :FK_SMID GROUP BY FK_SMID)  UNION ALL '||
                'SELECT SUM(FN_COUNT) FROM VPOVTOR,(SELECT :FD_DATA1 FD_DATA1,:FD_DATA2 FD_DATA2 FROM DUAL) WHERE FD_DATE BETWEEN FD_DATA1 AND FD_DATA2 :FK_SMID UNION ALL '||
                'SELECT SUM(FN_SAN) FROM VPOVTOR,(SELECT :FD_DATA1 FD_DATA1,:FD_DATA2 FD_DATA2 FROM DUAL) WHERE FD_DATE BETWEEN FD_DATA1 AND FD_DATA2 :FK_SMID)';
        --Общее кол-во исследований
    ELSIF nType = 21 THEN
      strSQL:=   'SELECT SUM (FN_COUNT)FN_SUM FROM '||
                 ' (SELECT FN_COUNT* GET_ED_FROM_SMID(FK_SMID)FN_COUNT FROM (SELECT COUNT (FK_SMID) FN_COUNT,FK_SMID '||
                 '    FROM (select distinct fk_smid,fk_nazid,fk_colid from VRESAN, '||
                 '       (SELECT :FD_DATA1 FD_DATA1, :FD_DATA2 FD_DATA2 '||
                 '          FROM DUAL) '||
                 ' WHERE '||
                 '   FD_INS BETWEEN FD_DATA1 AND FD_DATA2 '||
                 '   :FK_SMID) '||
                 'GROUP BY FK_SMID))';
        --Общее кол-во исследований для пациентов
    ELSIF nType = 22 THEN
      strSQL  :='SELECT SUM(FN_COUNT*GET_ED_FROM_SMID(FK_SMID)) FROM (select COUNT(FK_SMID) FN_COUNT,FK_SMID from vcontrol,(SELECT :FD_DATA1 FD_DATA1,:FD_DATA2 FD_DATA2 FROM DUAL) WHERE FD_DATE BETWEEN FD_DATA1 AND FD_DATA2 :FK_SMID GROUP BY FK_SMID)';
      --Контролей качества
    ELSIF nType = 23 THEN
      strSQL:='SELECT SUM(FN_COUNT) FROM VPOVTOR,(SELECT :FD_DATA1 FD_DATA1,:FD_DATA2 FD_DATA2 FROM DUAL) WHERE FD_DATE BETWEEN FD_DATA1 AND FD_DATA2 :FK_SMID';
      --Повторов
    ELSIF nType = 24 THEN
      strSQL:='SELECT SUM(FN_SAN) FROM VPOVTOR,(SELECT :FD_DATA1 FD_DATA1,:FD_DATA2 FD_DATA2 FROM DUAL) WHERE FD_DATE BETWEEN FD_DATA1 AND FD_DATA2 :FK_SMID';
      --Санитарно гигиенических
    ELSIF nType = 25 THEN
      strSQL  := 'SELECT COUNT(DISTINCT FK_PACID) FROM VRESAN,(SELECT :FD_DATA1 FD_DATA1,:FD_DATA2 FD_DATA2 FROM DUAL) WHERE FD_INS BETWEEN FD_DATA1 AND FD_DATA2 :FK_SMID ';
      --Пауиентов
    END IF;
    strSQL  := REPLACE (strSQL, ':FD_DATA1', 'TO_DATE(''' || TO_CHAR (pFD_DATA1, 'dd.mm.yyyy') || ''',''dd.mm.yyyy'')');
    strSQL  := REPLACE (strSQL, ':FD_DATA2', 'TO_DATE(''' || TO_CHAR (pFD_DATA2, 'dd.mm.yyyy') || ''',''dd.mm.yyyy'')');
    IF pFK_SMID = -1 THEN
      strSQL  := REPLACE (strSQL, ':FK_SMID', '');
    ELSE
      strSQL  := REPLACE (strSQL, ':FK_SMID', ' AND FK_OTDELID=' || pFK_SMID || ' ');
    END IF;
    IF pFK_NAPRID = -1 THEN
      strSQL  := REPLACE (strSQL, ':FK_NAPRID', '');
    ELSE
      strSQL  := REPLACE (strSQL, ':FK_NAPRID', ' AND FK_NAPRID=' || pFK_NAPRID || ' ');
    END IF;
    BEGIN
      EXECUTE IMMEDIATE strSQL INTO i;
    EXCEPTION
      WHEN OTHERS THEN
        NULL;
--        i:=-1;
    END;
    IF i IS NULL THEN
      i  := 0;
    END IF;
    RETURN i;
  END;
  FUNCTION GET_COUNT_LAB_PROV_ISSL_RAZD (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_SMID IN NUMBER, nType IN NUMBER,pFK_AMBID IN NUMBER:=-1,pFK_RAZDID IN NUMBER:=-1)
    RETURN NUMBER IS
    strSQl VARCHAR2 (32767);
    i NUMBER;
    str VARCHAR2(4000);
  BEGIN
    IF nType = 1 THEN
        strSQL  := 'SELECT SUM (FN_COUNT) FROM '||
                   ' (SELECT FN_COUNT* GET_ED_FROM_SMID(FK_SMID)FN_COUNT FROM (SELECT COUNT (FK_SMID) FN_COUNT,FK_SMID '||
                   '    FROM (select distinct fk_colid,fk_smid,fk_nazid from VRESAN, '||
                   '       (SELECT :FD_DATA1 FD_DATA1, :FD_DATA2 FD_DATA2 '||
                   '          FROM DUAL) '||
                   ' WHERE '||
                   '   FD_INS BETWEEN FD_DATA1 AND FD_DATA2 '||
                   '   AND FL_AMB=0 :FK_SMID) '||
                   'GROUP BY FK_SMID))';
      --Кол-во исследований для санаторных.
    ELSIF nType = 2 THEN
         strSQL  := 'SELECT SUM (FN_COUNT) FROM '||
                   ' (SELECT FN_COUNT* GET_ED_FROM_SMID(FK_SMID)FN_COUNT FROM (SELECT COUNT (FK_SMID) FN_COUNT,FK_SMID '||
                   '    FROM (select distinct fk_colid,fk_smid,fk_nazid from VRESAN, '||
                   '       (SELECT :FD_DATA1 FD_DATA1, :FD_DATA2 FD_DATA2 '||
                   '          FROM DUAL),TPATNAME '||
                   ' WHERE '||
                   '   TPATNAME.FK_ID=FK_PATID AND FP_PRIOR>0 AND FD_INS BETWEEN FD_DATA1 AND FD_DATA2 '||
                   '   AND FL_AMB=0 :FK_SMID) '||
                   'GROUP BY FK_SMID))';
     --Кол-во патологий для пациентов
    ELSIF nType = 3 THEN
         strSQL  := 'SELECT SUM (FN_COUNT) FROM '||
                   ' (SELECT FN_COUNT* GET_ED_FROM_SMID(FK_SMID)FN_COUNT FROM (SELECT COUNT (FK_SMID) FN_COUNT,FK_SMID '||
                   '    FROM (select distinct fk_colid,fk_smid,fk_nazid from VRESAN, '||
                   '       (SELECT :FD_DATA1 FD_DATA1, :FD_DATA2 FD_DATA2 '||
                   '          FROM DUAL),TPATNAME '||
                   ' WHERE '||
                   '   TPATNAME.FK_ID=FK_PATID AND FP_PRIOR>0 AND FD_INS BETWEEN FD_DATA1 AND FD_DATA2 '||
                   '   AND FL_AMB=0 AND FL_PATFIRST=1 :FK_SMID) '||
                   'GROUP BY FK_SMID))';
       --Кол-во впервые выявленных патологий
    ELSIF nType = 4 THEN
      strSQL  := 'SELECT (PKG_LAB_STAT_FUNCS.GET_COUNT_LAB_PROV_ISSL_RAZD(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',2,'||pFK_AMBID||','||pFK_RAZDID||')/PKG_LAB_STAT_FUNCS.GET_COUNT_LAB_PROV_ISSL_RAZD(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',1,'||pFK_AMBID||','||pFK_RAZDID||'))*100 FROM DUAL ';
      --процент патологий от общего числа
    ELSIF nType = 5 THEN
        strSQL  := 'SELECT SUM (FN_COUNT) FROM '||
                   ' (SELECT FN_COUNT* GET_ED_FROM_SMID(FK_SMID)FN_COUNT FROM (SELECT COUNT (FK_SMID) FN_COUNT,FK_SMID '||
                   '    FROM (select distinct fk_colid,fk_smid,fk_nazid from VRESAN, '||
                   '       (SELECT :FD_DATA1 FD_DATA1, :FD_DATA2 FD_DATA2 '||
                   '          FROM DUAL) '||
                   ' WHERE '||
                   '   FD_INS BETWEEN FD_DATA1 AND FD_DATA2 '||
                   '   AND FL_AMB=1 :FK_NAPRID :FK_SMID) '||
                   'GROUP BY FK_SMID))';
      --Кол-во исследований для амбулаторных.
    ELSIF nType = 6 THEN
         strSQL  := 'SELECT SUM (FN_COUNT) FROM '||
                   ' (SELECT FN_COUNT* GET_ED_FROM_SMID(FK_SMID)FN_COUNT FROM (SELECT COUNT (FK_SMID) FN_COUNT,FK_SMID '||
                   '    FROM (select distinct fk_colid,fk_smid,fk_nazid from VRESAN, '||
                   '       (SELECT :FD_DATA1 FD_DATA1, :FD_DATA2 FD_DATA2 '||
                   '          FROM DUAL),TPATNAME '||
                   ' WHERE '||
                   '   TPATNAME.FK_ID=FK_PATID AND FP_PRIOR>0 AND FD_INS BETWEEN FD_DATA1 AND FD_DATA2 '||
                   '   AND FL_AMB=1 :FK_NAPRID :FK_SMID) '||
                   'GROUP BY FK_SMID))';
      --Кол-во патологий для амбулаторных
    ELSIF nType = 7 THEN
        strSQL  := 'SELECT SUM (FN_COUNT) FROM '||
                   ' (SELECT FN_COUNT* GET_ED_FROM_SMID(FK_SMID)FN_COUNT FROM (SELECT COUNT (FK_SMID) FN_COUNT,FK_SMID '||
                   '    FROM (select distinct fk_colid,fk_smid,fk_nazid from VRESAN, '||
                   '       (SELECT :FD_DATA1 FD_DATA1, :FD_DATA2 FD_DATA2 '||
                   '          FROM DUAL) '||
                   ' WHERE '||
                   '   FD_INS BETWEEN FD_DATA1 AND FD_DATA2 '||
                   '   :FK_SMID) '||
                   'GROUP BY FK_SMID))';
      --Кол-во исследований Всего.
    ELSIF nType = 8 THEN
      strSQL:='SELECT SUM(FN_COUNT*GET_ED_FROM_SMID(FK_SMID)) FROM (select COUNT(FK_SMID) FN_COUNT,FK_SMID from vcontrol,(SELECT :FD_DATA1 FD_DATA1,:FD_DATA2 FD_DATA2 FROM DUAL) WHERE FD_DATE BETWEEN FD_DATA1 AND FD_DATA2 :FK_SMID GROUP BY FK_SMID) ';
      --Исследований по контролю качества
    ELSIF nType = 9 THEN
      strSQL:='SELECT SUM(FN_COUNT) FROM VPOVTOR,(SELECT :FD_DATA1 FD_DATA1,:FD_DATA2 FD_DATA2 FROM DUAL) WHERE FD_DATE BETWEEN FD_DATA1 AND FD_DATA2 :FK_SMID ';
      --Повторных исследований
    ELSIF nType = 10 THEN
      strSQL  := 'SELECT SUM(FN_SAN) FROM VPOVTOR,(SELECT :FD_DATA1 FD_DATA1,:FD_DATA2 FD_DATA2 FROM DUAL) WHERE FD_DATE BETWEEN FD_DATA1 AND FD_DATA2 :FK_SMID';
      --Санитарно-гигиенческих исследований
    ELSIF nType=11 THEN
        strSQL:=  'SELECT SUM (FN_SUM) '||
                  '   FROM ('||
                  'SELECT SUM (FN_COUNT)FN_SUM FROM '||
                   ' (SELECT FN_COUNT* GET_ED_FROM_SMID(FK_SMID)FN_COUNT FROM (SELECT COUNT (FK_SMID) FN_COUNT,FK_SMID '||
                   '    FROM (select distinct fk_smid,fk_nazid,fk_colid from VRESAN, '||
                   '       (SELECT :FD_DATA1 FD_DATA1, :FD_DATA2 FD_DATA2 '||
                   '          FROM DUAL) '||
                   ' WHERE '||
                   '   FD_INS BETWEEN FD_DATA1 AND FD_DATA2 '||
                   '   :FK_SMID) '||
                   'GROUP BY FK_SMID))'||
                  ' UNION ALL '||
                  'SELECT SUM(FN_COUNT*GET_ED_FROM_SMID(FK_SMID)) FROM (select COUNT(FK_SMID) FN_COUNT,FK_SMID from vcontrol,(SELECT :FD_DATA1 FD_DATA1,:FD_DATA2 FD_DATA2 FROM DUAL) WHERE FD_DATE BETWEEN FD_DATA1 AND FD_DATA2 :FK_SMID GROUP BY FK_SMID)  UNION ALL '||
                  'SELECT SUM(FN_COUNT) FROM VPOVTOR,(SELECT :FD_DATA1 FD_DATA1,:FD_DATA2 FD_DATA2 FROM DUAL) WHERE FD_DATE BETWEEN FD_DATA1 AND FD_DATA2 :FK_SMID UNION ALL '||
                  'SELECT SUM(FN_SAN) FROM VPOVTOR,(SELECT :FD_DATA1 FD_DATA1,:FD_DATA2 FD_DATA2 FROM DUAL) WHERE FD_DATE BETWEEN FD_DATA1 AND FD_DATA2 :FK_SMID)';
      --Всего исследований
    ELSIF nType=12 THEN
      strSQL  := 'SELECT SUM (FN_COUNT) FROM (SELECT FN_COUNT* GET_TIME_FROM_SMID(FK_SMID)FN_COUNT FROM '||
                 ' (SELECT COUNT (FK_SMID) FN_COUNT,FK_SMID '||
                 '    FROM (SELECT DISTINCT FK_NAZID,FK_SMID,FK_COLID FROM VRESAN, '||
                 '       (SELECT :FD_DATA1 FD_DATA1, :FD_DATA2 FD_DATA2 '||
                 '          FROM DUAL) '||
                 ' WHERE '||
                 '   FD_INS BETWEEN FD_DATA1 AND FD_DATA2 '||
                 '   :FK_SMID ) '||
                 'GROUP BY FK_SMID) UNION ALL'||
                 ' SELECT SUM(FN_COUNT*GET_TIME_FROM_SMID(FK_SMID)) FROM (select COUNT(FK_SMID) FN_COUNT,FK_SMID from vcontrol,(SELECT :FD_DATA1 FD_DATA1,:FD_DATA2 FD_DATA2 FROM DUAL) WHERE FD_DATE BETWEEN FD_DATA1 AND FD_DATA2 :FK_SMID GROUP BY FK_SMID) UNION ALL '||
                 'SELECT SUM(FN_COUNT*GET_TIME_FROM_SMID(FK_SMID)) FROM VPOVTOR,(SELECT :FD_DATA1 FD_DATA1,:FD_DATA2 FD_DATA2 FROM DUAL) WHERE FD_DATE BETWEEN FD_DATA1 AND FD_DATA2 :FK_SMID UNION ALL '||
                 'SELECT SUM(FN_SAN*GET_TIME_FROM_SMID(FK_SMID)) FROM VPOVTOR,(SELECT :FD_DATA1 FD_DATA1,:FD_DATA2 FD_DATA2 FROM DUAL) WHERE FD_DATE BETWEEN FD_DATA1 AND FD_DATA2 :FK_SMID )';
       --Время
    END IF;
    strSQL  := REPLACE (strSQL, ':FD_DATA1', 'TO_DATE(''' || TO_CHAR (pFD_DATA1, 'dd.mm.yyyy') || ''',''dd.mm.yyyy'')');
    strSQL  := REPLACE (strSQL, ':FD_DATA2', 'TO_DATE(''' || TO_CHAR (pFD_DATA2, 'dd.mm.yyyy') || ''',''dd.mm.yyyy'')');
    IF pFK_SMID<>-1 THEN
      strSQL  := REPLACE (strSQL, ':FK_SMID', ' AND FK_SMID IN (SELECT FK_SMID FROM TISSLRAZDDEPS WHERE FK_ROWID=' || pFK_SMID || ' )');
    ELSE
      strSQL  := REPLACE (strSQL, ':FK_SMID', ' AND FK_RAZDID='||pFK_RAZDID||' ');
    END IF;
    IF pFK_AMBID<>-1 THEN
      strSQL  := REPLACE (strSQL, ':FK_NAPRID', ' AND FK_NAPRID=' || pFK_AMBID || ' ');
    ELSE
      strSQL  := REPLACE (strSQL, ':FK_NAPRID', ' ');
    END IF;
    BEGIN
      EXECUTE IMMEDIATE strSQL INTO i;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        i:=0;
      WHEN OTHERS THEN
--        raise;
--        i:=-1;
        NULL;
    END;
    IF i IS NULL THEN
      i  := 0;
    END IF;
    RETURN i;
  END;
  FUNCTION GET_COUNT_LAB_PROV_PEOP_RAZD (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_SMID IN NUMBER, nType IN NUMBER,pFK_AMBID IN NUMBER:=-1,pFN_COUNT IN NUMBER:=0)
    RETURN NUMBER IS
    strSQl VARCHAR2 (32767);
    i NUMBER;
    str VARCHAR2(4000);
  BEGIN
    IF nType = 1 THEN--checkit (всю функцию)
     strSQL  := 'SELECT COUNT (fk_pacid) '||
                 '   FROM (SELECT FK_PACID, COUNT (fk_pacid) FN_COUNT '||
                 '           FROM ( (SELECT fk_pacid, COUNT (FD_INS) fn_count '||
                 '                     FROM VRESAN, '||
                 '                          (SELECT DISTINCT FK_PACID FK_VPACID, FD_INS FD_VRUN '||
                 '                             FROM VRESAN, '||
                 '                                  (SELECT :FD_DATA1 FD_DATA1, :FD_DATA2 FD_DATA2 '||
                 '                                     FROM DUAL) '||
                 '                            WHERE fd_INS BETWEEN FD_DATA1 AND FD_DATA2 '||
                 '                              :FK_SMID '||
                 '                              :FL_AMB) '||
                 '                    WHERE FK_PACID = FK_VPACID '||
                 '                          AND FD_INS <= FD_VRUN :FK_SMID '||
                 '                    GROUP BY fk_pacid, FD_INS) ) '||
                 '          GROUP BY fk_pacid) '||
                 '  :FN_COUNT ';
    ELSIF nType=2 THEN
     strSQL  := 'SELECT COUNT (fk_pacid) '||
                 '   FROM (SELECT FK_PACID, COUNT (fk_pacid) FN_COUNT '||
                 '           FROM ( (SELECT fk_pacid, COUNT (FD_INS) fn_count '||
                 '                     FROM VRESAN, '||
                 '                          (SELECT DISTINCT FK_PACID FK_VPACID, FD_INS FD_VRUN '||
                 '                             FROM VRESAN,TPATNAME, '||
                 '                                  (SELECT :FD_DATA1 FD_DATA1, :FD_DATA2 FD_DATA2 '||
                 '                                     FROM DUAL) '||
                 '                            WHERE fd_INS BETWEEN FD_DATA1 AND FD_DATA2 AND TPATNAME.FK_ID=FK_PATID AND FP_PRIOR>0  '||
                 '                              :FK_SMID '||
                 '                              :FL_AMB) '||
                 '                    WHERE FK_PACID = FK_VPACID '||
                 '                          AND FD_INS <= FD_VRUN :FK_SMID '||
                 '                    GROUP BY fk_pacid, FD_INS) ) '||
                 '          GROUP BY fk_pacid) '||
                 '  :FN_COUNT ';
    ELSIF nType=3 THEN
      strSQL:='SELECT (PKG_LAB_STAT_FUNCS.GET_COUNT_LAB_PROV_PEOP_RAZD(:FD_DATA1 , :FD_DATA2 , '||pFK_SMID||', '||2 ||','||pFK_AMBID||','||pFN_COUNT||')/'||
                      'PKG_LAB_STAT_FUNCS.GET_COUNT_LAB_PROV_PEOP_RAZD(:FD_DATA1 , :FD_DATA2 , '||pFK_SMID||', '||1 ||','||pFK_AMBID||','||pFN_COUNT||'))*100 FROM DUAL';
        --Процент патологий
    ELSIF nType=4 THEN
     strSQL  := 'SELECT COUNT (fk_pacid) '||
                 '   FROM (SELECT FK_PACID, COUNT (fk_pacid) FN_COUNT '||
                 '           FROM ( (SELECT fk_pacid, COUNT (FD_INS) fn_count '||
                 '                     FROM VRESAN, '||
                 '                          (SELECT DISTINCT FK_PACID FK_VPACID, FD_INS FD_VRUN '||
                 '                             FROM VRESAN, '||
                 '                                  (SELECT :FD_DATA1 FD_DATA1, :FD_DATA2 FD_DATA2 '||
                 '                                     FROM DUAL) '||
                 '                            WHERE fd_INS BETWEEN FD_DATA1 AND FD_DATA2 AND GET_GOOD_DINAMIC_DATE (FK_PACID, FK_SMID, FK_COLID,FD_INS) = 1 '||
                 '                              :FK_SMID '||
                 '                              :FL_AMB) '||
                 '                    WHERE FK_PACID = FK_VPACID '||
                 '                          AND FD_INS <= FD_VRUN  :FK_SMID '||
                 '                    GROUP BY fk_pacid, FD_INS) ) '||
                 '          GROUP BY fk_pacid) '||
                 '  :FN_COUNT ';
        --С положительной динамикой
    END IF;
    strSQL  := REPLACE (strSQL, ':FD_DATA1', 'TO_DATE(''' || TO_CHAR (pFD_DATA1, 'dd.mm.yyyy') || ''',''dd.mm.yyyy'')');
    strSQL  := REPLACE (strSQL, ':FD_DATA2', 'TO_DATE(''' || TO_CHAR (pFD_DATA2, 'dd.mm.yyyy') || ''',''dd.mm.yyyy'')');
    strSQL  := REPLACE (strSQL, ':FK_SMID', ' AND FK_RAZDID=' || pFK_SMID || ' ');
    IF pFN_COUNT=0 THEN
      strSQL  := REPLACE (strSQL, ':FN_COUNT', ' ');
    ELSIF pFN_COUNT IN (1,2) THEN
      strSQL  := REPLACE (strSQL, ':FN_COUNT', ' WHERE FN_COUNT='||pFN_COUNT||' ');
    ELSIF pFN_COUNT=3 THEN
      strSQL  := REPLACE (strSQL, ':FN_COUNT', ' WHERE FN_COUNT>='||pFN_COUNT||' ');
    END IF;
    IF pFK_AMBID=-1 THEN
      strSQL  := REPLACE (strSQL, ':FL_AMB',' AND FL_AMB=0 ');
    ELSIF pFK_AMBID=-2 THEN
      strSQL  := REPLACE (strSQL, ':FL_AMB',' ');
    ELSE
      strSQL  := REPLACE (strSQL, ':FL_AMB', ' AND FL_AMB=1 AND FK_NAPRID= '||pFK_AMBID||' ');
    END IF;
/*    IF nType=4 AND pFN_COUNT=1 THEN
      raise_application_error(-20002,strSQL);
      NULL;
    END IF;
*//*    IF pFN_COUNT IN (1) THEN
      raise_application_error(-20002,strSQL);
    END IF;
*/
    BEGIN
      EXECUTE IMMEDIATE strSQL INTO i;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        i:=0;
      WHEN OTHERS THEN
--        raise_application_error(-20002,strSQL);
--        i:=-1;
        NULL;
    END;
    IF i IS NULL THEN
      i  := 0;
    END IF;
    RETURN i;
  END;
  FUNCTION GET_COUNT_LAB_WORK_OTDEL_DUB (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_SMID IN NUMBER, nType IN NUMBER,pFK_NAPRID IN NUMBER:=-1,pFK_OTDELID IN NUMBER)
    RETURN NUMBER IS
    strSQl VARCHAR2 (32767);
    i NUMBER;
    str VARCHAR2(4000);
  BEGIN
    IF nType = 1 THEN
      IF pFK_NAPRID NOT IN (-6)  THEN
        RETURN NULL;
      END IF;
      strSQL  := 'SELECT GET_COUNT_OUT_PERIOD(:FD_DATA1,:FD_DATA2) FROM DUAL ';
      --Количество выписанных
    ELSIF nType = 2 THEN
      IF pFK_NAPRID NOT IN (-6,-5,-1) AND pFK_NAPRID<=0 THEN
        RETURN NULL;
      END IF;
      strSQL  := 'SELECT COUNT(fk_pacid) FROM(SELECT DISTINCT FK_PACID,FK_NAPRID FROM VRESAN,(SELECT :FD_DATA1 FD_DATA1,:FD_DATA2 FD_DATA2 FROM DUAL) WHERE FD_INS BETWEEN FD_DATA1 AND FD_DATA2 :FL_AMB :FK_SMID) ';
      --Количество обследованных
    ELSIF nType = 3 THEN
      IF pFK_NAPRID NOT IN (-6)  THEN
        RETURN NULL;
      END IF;
      strSQL  := 'SELECT (PKG_LAB_STAT_FUNCS.GET_COUNT_LAB_WORK_OTDEL_DUB(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',2,'||pFK_NAPRID||','||pFK_OTDELID||')/PKG_LAB_STAT_FUNCS.GET_COUNT_LAB_WORK_OTDEL_DUB(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',1,'||pFK_NAPRID||','||pFK_OTDELID||'))*100 FROM DUAL ';
      --Процент охвата
    ELSIF nType = 4 THEN
      IF pFK_NAPRID IN (-5,-6) OR pFK_NAPRID>0 THEN
        strSQL  := 'SELECT SUM (FN_COUNT) FROM '||
                   ' (SELECT FN_COUNT* GET_ED_FROM_SMID(FK_SMID)FN_COUNT FROM (SELECT COUNT (FK_SMID) FN_COUNT,FK_SMID '||
                   '    FROM (select distinct fk_colid,fk_smid,fk_nazid from VRESAN, '||
                   '       (SELECT :FD_DATA1 FD_DATA1, :FD_DATA2 FD_DATA2 '||
                   '          FROM DUAL) '||
                   ' WHERE '||
                   '   FD_INS BETWEEN FD_DATA1 AND FD_DATA2 '||
                   '   :FL_AMB :FK_SMID) '||
                   'GROUP BY FK_SMID))';
      --Количество исследований
      ELSIF pFK_NAPRID=-4 THEN
        strSQL  := 'SELECT SUM(FN_COUNT*GET_ED_FROM_SMID(FK_SMID)) FROM (select COUNT(FK_SMID) FN_COUNT,FK_SMID from vcontrol,(SELECT :FD_DATA1 FD_DATA1,:FD_DATA2 FD_DATA2 FROM DUAL) WHERE FD_DATE BETWEEN FD_DATA1 AND FD_DATA2 :FK_SMID GROUP BY FK_SMID)';
        --Количество контролей
      ELSIF pFK_NAPRID=-3 THEN
        strSQL  := 'SELECT SUM(FN_COUNT) FROM VPOVTOR,(SELECT :FD_DATA1 FD_DATA1,:FD_DATA2 FD_DATA2 FROM DUAL) WHERE FD_DATE BETWEEN FD_DATA1 AND FD_DATA2 :FK_SMID';
        --Количество повторов
      ELSIF pFK_NAPRID=-2 THEN
        strSQL  := 'SELECT SUM(FN_SAN) FROM VPOVTOR,(SELECT :FD_DATA1 FD_DATA1,:FD_DATA2 FD_DATA2 FROM DUAL) WHERE FD_DATE BETWEEN FD_DATA1 AND FD_DATA2 :FK_SMID';
        --Санитарно-гигиенческих исследований
      ELSIF pFK_NAPRID=-1 THEN
        strSQL:=  'SELECT SUM (FN_SUM) '||
                  '   FROM ('||
                  'SELECT SUM (FN_COUNT)FN_SUM FROM '||
                   ' (SELECT FN_COUNT* GET_ED_FROM_SMID(FK_SMID)FN_COUNT FROM (SELECT COUNT (FK_SMID) FN_COUNT,FK_SMID '||
                   '    FROM (select distinct fk_smid,fk_nazid,fk_colid from VRESAN, '||
                   '       (SELECT :FD_DATA1 FD_DATA1, :FD_DATA2 FD_DATA2 '||
                   '          FROM DUAL) '||
                   ' WHERE '||
                   '   FD_INS BETWEEN FD_DATA1 AND FD_DATA2 '||
                   '   :FL_AMB :FK_SMID) '||
                   'GROUP BY FK_SMID))'||
                  ' UNION ALL '||
                  'SELECT SUM(FN_COUNT*GET_ED_FROM_SMID(FK_SMID)) FROM (select COUNT(FK_SMID) FN_COUNT,FK_SMID from vcontrol,(SELECT :FD_DATA1 FD_DATA1,:FD_DATA2 FD_DATA2 FROM DUAL) WHERE FD_DATE BETWEEN FD_DATA1 AND FD_DATA2 :FK_SMID GROUP BY FK_SMID)  UNION ALL '||
                  'SELECT SUM(FN_COUNT) FROM VPOVTOR,(SELECT :FD_DATA1 FD_DATA1,:FD_DATA2 FD_DATA2 FROM DUAL) WHERE FD_DATE BETWEEN FD_DATA1 AND FD_DATA2 :FK_SMID UNION ALL '||
                  'SELECT SUM(FN_SAN) FROM VPOVTOR,(SELECT :FD_DATA1 FD_DATA1,:FD_DATA2 FD_DATA2 FROM DUAL) WHERE FD_DATE BETWEEN FD_DATA1 AND FD_DATA2 :FK_SMID)';
        --Общее кол-во исследований
      ELSIF pFK_NAPRID=0 THEN
      strSQL  := 'SELECT SUM (FN_COUNT) FROM (SELECT FN_COUNT* GET_TIME_FROM_SMID(FK_SMID)FN_COUNT FROM '||
                 ' (SELECT COUNT (FK_SMID) FN_COUNT,FK_SMID '||
                 '    FROM (SELECT DISTINCT FK_NAZID,FK_SMID,FK_COLID FROM VRESAN, '||
                 '       (SELECT :FD_DATA1 FD_DATA1, :FD_DATA2 FD_DATA2 '||
                 '          FROM DUAL) '||
                 ' WHERE '||
                 '   FD_INS BETWEEN FD_DATA1 AND FD_DATA2 '||
                 '   :FL_AMB :FK_SMID ) '||
                 'GROUP BY FK_SMID) UNION ALL'||
                 ' SELECT SUM(FN_COUNT*GET_TIME_FROM_SMID(FK_SMID)) FROM (select COUNT(FK_SMID) FN_COUNT,FK_SMID from vcontrol,(SELECT :FD_DATA1 FD_DATA1,:FD_DATA2 FD_DATA2 FROM DUAL) WHERE FD_DATE BETWEEN FD_DATA1 AND FD_DATA2 :FK_SMID GROUP BY FK_SMID) UNION ALL '||
                 'SELECT SUM(FN_COUNT*GET_TIME_FROM_SMID(FK_SMID)) FROM VPOVTOR,(SELECT :FD_DATA1 FD_DATA1,:FD_DATA2 FD_DATA2 FROM DUAL) WHERE FD_DATE BETWEEN FD_DATA1 AND FD_DATA2 :FK_SMID UNION ALL '||
                 'SELECT SUM(FN_SAN*GET_TIME_FROM_SMID(FK_SMID)) FROM VPOVTOR,(SELECT :FD_DATA1 FD_DATA1,:FD_DATA2 FD_DATA2 FROM DUAL) WHERE FD_DATE BETWEEN FD_DATA1 AND FD_DATA2 :FK_SMID )';
    --Время
    END IF;
    ELSIF nType = 5 THEN
      IF pFK_NAPRID IN (-4,-3,-2,0) THEN
        RETURN NULL;
      END IF;
      strSQL  := 'SELECT (PKG_LAB_STAT_FUNCS.GET_COUNT_LAB_WORK_OTDEL_DUB(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',4,'||pFK_NAPRID||','||pFK_OTDELID||')/PKG_LAB_STAT_FUNCS.GET_COUNT_LAB_WORK_OTDEL_DUB(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',2,'||pFK_NAPRID||','||pFK_OTDELID||')) FROM DUAL ';
      --Исследований на одного обследованного
    ELSIF nType = 6 THEN
      IF pFK_NAPRID <>-6 THEN
        RETURN NULL;
      END IF;
      strSQL  := 'SELECT (PKG_LAB_STAT_FUNCS.GET_COUNT_LAB_WORK_OTDEL_DUB(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',4,'||pFK_NAPRID||','||pFK_OTDELID||')/PKG_LAB_STAT_FUNCS.GET_COUNT_LAB_WORK_OTDEL_DUB(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',1,'||pFK_NAPRID||','||pFK_OTDELID||')) FROM DUAL ';
      --Исследований на выписанного
    ELSIF nType = 7 THEN
      IF pFK_NAPRID NOT IN (-6,-5,-1) AND pFK_NAPRID<=0 THEN
        RETURN NULL;
      END IF;
      strSQL  := 'SELECT COUNT(FK_PACID) FROM (SELECT DISTINCT FK_PACID,FK_NAPRID FROM VRESAN,TPATNAME,(SELECT :FD_DATA1 FD_DATA1,:FD_DATA2 FD_DATA2 FROM DUAL) WHERE FK_PATID=TPATNAME.FK_ID AND FP_PRIOR>0 AND fd_ins BETWEEN FD_DATA1 AND FD_DATA2 :FL_AMB :FK_SMID)';
      --Количество пациентов с патологией
    ELSIF nType = 8 THEN
      IF pFK_NAPRID NOT IN (-6,-5,-1) AND pFK_NAPRID<=0 THEN
        RETURN NULL;
      END IF;
      strSQL  := 'SELECT (PKG_LAB_STAT_FUNCS.GET_COUNT_LAB_WORK_OTDEL_DUB(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',7,'||pFK_NAPRID||','||pFK_OTDELID||')/PKG_LAB_STAT_FUNCS.GET_COUNT_LAB_WORK_OTDEL_DUB(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',2,'||pFK_NAPRID||','||pFK_OTDELID||'))*100 FROM DUAL ';
      --% патологий от обследованных
    ELSIF nType = 9 THEN
      IF pFK_NAPRID <>-6 THEN
        RETURN NULL;
      END IF;
      strSQL  := 'SELECT (PKG_LAB_STAT_FUNCS.GET_COUNT_LAB_WORK_OTDEL_DUB(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',7,'||pFK_NAPRID||','||pFK_OTDELID||')/PKG_LAB_STAT_FUNCS.GET_COUNT_LAB_WORK_OTDEL_DUB(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',1,'||pFK_NAPRID||','||pFK_OTDELID||'))*100 FROM DUAL ';
      --% патологий от выписанных
    ELSIF nType = 10 THEN
      IF pFK_NAPRID NOT IN (-6,-5,-1) AND pFK_NAPRID<=0 THEN
        RETURN NULL;
      END IF;--checkit
    strSQL  := 'select /*+ rule*/count(*) from (select distinct fk_pacid,fk_naprid '||
                 '    from ( '||
                 '           select count(fk_smid) fn_count,fk_pacid,fk_naprid,fk_smid,fk_colid '||
                 '              from vresan,( '||
                 '                select distinct fk_pacid fk_vpacid, fk_naprid fk_vnaprid '||
                 '                   from vresan,(SELECT :FD_DATA1 FD_DATA1,:FD_DATA2 FD_DATA2 FROM DUAL) '||
                 '                   where fd_ins between fd_data1 and fd_data2 :FK_SMID :FL_AMB ),(SELECT :FD_DATA1 FD_DATA1,:FD_DATA2 FD_DATA2 FROM DUAL) '||
                 '               where fk_pacid=fk_vpacid and fk_naprid=fk_vnaprid :FK_SMID :FL_AMB '||
                 '               group by fk_pacid,fk_naprid,fk_smid,fk_colid) '||
                 '    where '||
                 'fn_count>1)';
      --Повторно обследовано
    ELSIF nType = 11 THEN
      IF pFK_NAPRID NOT IN (-6,-5,-1) AND pFK_NAPRID<=0 THEN
        RETURN NULL;
      END IF;
      strSQL  := 'SELECT (PKG_LAB_STAT_FUNCS.GET_COUNT_LAB_WORK_OTDEL_DUB(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',10,'||pFK_NAPRID||','||pFK_OTDELID||')/PKG_LAB_STAT_FUNCS.GET_COUNT_LAB_WORK_OTDEL_DUB(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',2,'||pFK_NAPRID||','||pFK_OTDELID||'))*100 FROM DUAL ';
      --% повторно обсл. от обследованных
    ELSIF nType = 12 THEN
      IF pFK_NAPRID <>-6 THEN
        RETURN NULL;
      END IF;
      strSQL  := 'SELECT (PKG_LAB_STAT_FUNCS.GET_COUNT_LAB_WORK_OTDEL_DUB(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',10,'||pFK_NAPRID||','||pFK_OTDELID||')/PKG_LAB_STAT_FUNCS.GET_COUNT_LAB_WORK_OTDEL_DUB(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',1,'||pFK_NAPRID||','||pFK_OTDELID||'))*100 FROM DUAL ';
      --% повторно обсл. от выписанных
    ELSIF nType = 13 THEN
      IF pFK_NAPRID NOT IN (-6,-5,-1) AND pFK_NAPRID<=0 THEN
        RETURN NULL;
      END IF;--checkit
      strSQL  := 'select /*+ rule*/count(*) from (select distinct fk_pacid,fk_naprid '||
                 '    from ( '||
                 '           select count(fk_smid) fn_count,fk_pacid,fk_naprid,fk_smid,fk_colid '||
                 '              from vresan,tpatname,( '||
                 '                select distinct fk_pacid fk_vpacid, fk_naprid fk_vnaprid '||
                 '                   from vresan,(SELECT :FD_DATA1 FD_DATA1,:FD_DATA2 FD_DATA2 FROM DUAL) '||
                 '                   where fd_ins between fd_data1 and fd_data2 :FK_SMID :FL_AMB ),(SELECT :FD_DATA1 FD_DATA1,:FD_DATA2 FD_DATA2 FROM DUAL) '||
                 '               where tpatname.fk_id=fk_patid and fp_prior>0 and fk_pacid=fk_vpacid and fk_naprid=fk_vnaprid :FK_SMID :FL_AMB '||
                 '               group by fk_pacid,fk_naprid,fk_smid,fk_colid) '||
                 '    where '||
                 'fn_count>1)';
      --Повторно обсл. с патологией
    ELSIF nType = 14 THEN
      IF pFK_NAPRID NOT IN (-6,-5,-1) AND pFK_NAPRID<=0 THEN
        RETURN NULL;
      END IF;
      strSQL  := 'SELECT (PKG_LAB_STAT_FUNCS.GET_COUNT_LAB_WORK_OTDEL_DUB(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',13,'||pFK_NAPRID||','||pFK_OTDELID||')/PKG_LAB_STAT_FUNCS.GET_COUNT_LAB_WORK_OTDEL_DUB(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',7,'||pFK_NAPRID||','||pFK_OTDELID||'))*100 FROM DUAL ';
      --% повторно обсл. с патологией от лиц с патологией
    ELSIF nType = 15 THEN
      IF pFK_NAPRID <>-6 THEN
        RETURN NULL;
      END IF;
      strSQL  := 'SELECT (PKG_LAB_STAT_FUNCS.GET_COUNT_LAB_WORK_OTDEL_DUB(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',13,'||pFK_NAPRID||','||pFK_OTDELID||')/PKG_LAB_STAT_FUNCS.GET_COUNT_LAB_WORK_OTDEL_DUB(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',1,'||pFK_NAPRID||','||pFK_OTDELID||'))*100 FROM DUAL ';
      --% повторно обсл. с патологией от выписанных
    ELSIF nType = 16 THEN
      IF pFK_NAPRID NOT IN (-6,-5,-1) AND pFK_NAPRID<=0 THEN
        RETURN NULL;
      END IF;--checkit
    strSQL  := 'select /*+ rule*/count(*) from (select distinct fk_pacid,fk_naprid '||
                 '    from ( '||
                 '           select count(fk_smid) fn_count,fk_pacid,fk_naprid,fk_smid,fk_colid '||
                 '              from vresan,tpatname,( '||
                 '                select distinct fk_pacid fk_vpacid, fk_naprid fk_vnaprid '||
                 '                   from vresan,(SELECT :FD_DATA1 FD_DATA1,:FD_DATA2 FD_DATA2 FROM DUAL) '||
                 '                   where fd_ins between fd_data1 and fd_data2 :FK_SMID :FL_AMB ),'||
                 '                      (SELECT :FD_DATA1 FD_DATA1,:FD_DATA2 FD_DATA2 FROM DUAL) '||
                 '               where tpatname.fk_id=fk_patid and fp_prior>0 and fk_pacid=fk_vpacid and fk_naprid=fk_vnaprid :FK_SMID :FL_AMB '||
                 '               group by fk_pacid,fk_naprid,fk_smid,fk_colid) '||
                 '    where '||
                 'fn_count>1 and GET_GOOD_DINAMIC_UNIVERSAL (FK_PACID, FK_SMID, FK_COLID) = 1)';
      --Лиц с положительной динамикой
    ELSIF nType = 17 THEN
      IF pFK_NAPRID NOT IN (-6,-5,-1) AND pFK_NAPRID<=0 THEN
        RETURN NULL;
      END IF;
      strSQL  := 'SELECT (PKG_LAB_STAT_FUNCS.GET_COUNT_LAB_WORK_OTDEL_DUB(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',16,'||pFK_NAPRID||','||pFK_OTDELID||')/PKG_LAB_STAT_FUNCS.GET_COUNT_LAB_WORK_OTDEL_DUB(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',2,'||pFK_NAPRID||','||pFK_OTDELID||'))*100 FROM DUAL ';
      --% Лиц с положительной динамикой от обследованных
    ELSIF nType = 18 THEN
      IF pFK_NAPRID NOT IN (-6,-5,-1) AND pFK_NAPRID<=0 THEN
        RETURN NULL;
      END IF;
      strSQL  := 'SELECT (PKG_LAB_STAT_FUNCS.GET_COUNT_LAB_WORK_OTDEL_DUB(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',16,'||pFK_NAPRID||','||pFK_OTDELID||')/PKG_LAB_STAT_FUNCS.GET_COUNT_LAB_WORK_OTDEL_DUB(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',7,'||pFK_NAPRID||','||pFK_OTDELID||'))*100 FROM DUAL ';
      --% Лиц с положительной динамикой от лиц с динамикой
    ELSIF nType = 19 THEN
      IF pFK_NAPRID <>-6 THEN
        RETURN NULL;
      END IF;
      strSQL  := 'SELECT (PKG_LAB_STAT_FUNCS.GET_COUNT_LAB_WORK_OTDEL_DUB(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',16,'||pFK_NAPRID||','||pFK_OTDELID||')/PKG_LAB_STAT_FUNCS.GET_COUNT_LAB_WORK_OTDEL_DUB(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',1,'||pFK_NAPRID||','||pFK_OTDELID||'))*100 FROM DUAL ';
      --% Лиц с положительной динамикой от выписанных
    ELSIF nType = 20 THEN
      IF pFK_NAPRID NOT IN (-6,-5,-1) AND pFK_NAPRID<=0 THEN
        RETURN NULL;
      END IF;
      strSQL  := 'SELECT COUNT(FK_PACID) FROM (SELECT DISTINCT FK_PACID,FK_NAPRID FROM VRESAN,TPATNAME,(SELECT :FD_DATA1 FD_DATA1,:FD_DATA2 FD_DATA2 FROM DUAL) WHERE FK_PATID=TPATNAME.FK_ID AND FP_PRIOR>0 AND FL_PATFIRST=1 AND fd_ins BETWEEN FD_DATA1 AND FD_DATA2 :FL_AMB :FK_SMID)';
      --лиц с впервые выявленной патологией
    ELSIF nType = 21 THEN
      IF pFK_NAPRID NOT IN (-6,-5,-1) AND pFK_NAPRID<=0 THEN
        RETURN NULL;
      END IF;
      strSQL  := 'SELECT (PKG_LAB_STAT_FUNCS.GET_COUNT_LAB_WORK_OTDEL_DUB(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',20,'||pFK_NAPRID||','||pFK_OTDELID||')/PKG_LAB_STAT_FUNCS.GET_COUNT_LAB_WORK_OTDEL_DUB(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',2,'||pFK_NAPRID||','||pFK_OTDELID||'))*100 FROM DUAL ';
      --% лиц с впервые выявленной патологией от обследованных
    ELSIF nType = 22 THEN
      IF pFK_NAPRID NOT IN (-6,-5,-1) AND pFK_NAPRID<=0 THEN
        RETURN NULL;
      END IF;
      strSQL  := 'SELECT (PKG_LAB_STAT_FUNCS.GET_COUNT_LAB_WORK_OTDEL_DUB(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',20,'||pFK_NAPRID||','||pFK_OTDELID||')/PKG_LAB_STAT_FUNCS.GET_COUNT_LAB_WORK_OTDEL_DUB(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',7,'||pFK_NAPRID||','||pFK_OTDELID||'))*100 FROM DUAL ';
      --% лиц с впервые выявленной патологией от лиц с патологией
    ELSIF nType = 23 THEN
      IF pFK_NAPRID <>-6 THEN
        RETURN NULL;
      END IF;
      strSQL  := 'SELECT (PKG_LAB_STAT_FUNCS.GET_COUNT_LAB_WORK_OTDEL_DUB(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',20,'||pFK_NAPRID||','||pFK_OTDELID||')/PKG_LAB_STAT_FUNCS.GET_COUNT_LAB_WORK_OTDEL_DUB(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',1,'||pFK_NAPRID||','||pFK_OTDELID||'))*100 FROM DUAL ';
      --% лиц с впервые выявленной патологией от выписанных
    ELSIF nType = 24 THEN
      IF pFK_NAPRID NOT IN (-6,-5,-1) AND pFK_NAPRID<=0 THEN
        RETURN NULL;
      END IF;
      strSQL  :='SELECT SUM (fn_count * get_ed_from_SMID (FK_SMID) )FN_SUM FROM ' ||
                '(SELECT COUNT (fk_smid) fn_count, fk_smid FROM VRESAN,TPATNAME,(SELECT :FD_DATA1 FD_DATA1, :FD_DATA2 FD_DATA2 FROM DUAL) ' ||
                'WHERE fd_ins BETWEEN FD_DATA1 AND FD_DATA2 AND TPATNAME.FK_ID=FK_PATID AND FP_PRIOR>0 :FK_SMID :FL_AMB GROUP BY fk_smid) ';
       --Патологических результатов
    ELSIF nType = 25 THEN
      IF pFK_NAPRID NOT IN (-1,0) THEN
        RETURN NULL;
      END IF;
      IF pFK_NAPRID=-1 THEN
        strSQL  :='SELECT SUM (FN_PALEC) FROM TZABOR,(SELECT :FD_DATA1 FD_DATA1, :FD_DATA2 FD_DATA2 FROM DUAL) WHERE FD_DATE BETWEEN FD_DATA1 AND FD_DATA2 ';
      ELSE
        strSQL  :='SELECT SUM (FN_PALEC)*5 FROM TZABOR,(SELECT :FD_DATA1 FD_DATA1, :FD_DATA2 FD_DATA2 FROM DUAL) WHERE FD_DATE BETWEEN FD_DATA1 AND FD_DATA2 ';
      END IF;
       --Заборов из пальца
    ELSIF nType = 26 THEN
      IF pFK_NAPRID NOT IN (-1,0) THEN
        RETURN NULL;
      END IF;
      IF pFK_NAPRID=-1 THEN
        strSQL  :='SELECT SUM (FN_VENA) FROM TZABOR,(SELECT :FD_DATA1 FD_DATA1, :FD_DATA2 FD_DATA2 FROM DUAL) WHERE FD_DATE BETWEEN FD_DATA1 AND FD_DATA2 ';
      ELSE
       strSQL  :='SELECT SUM (FN_VENA)*10 FROM TZABOR,(SELECT :FD_DATA1 FD_DATA1, :FD_DATA2 FD_DATA2 FROM DUAL) WHERE FD_DATE BETWEEN FD_DATA1 AND FD_DATA2 ';
      END IF;
       --Заборов из вены
    ELSIF nType = 27 THEN
      IF pFK_NAPRID<>0 THEN
        RETURN NULL;
      END IF;
      IF GET_SYNBYID(pFK_OTDELID)='OTDEL_KLINIKA' THEN
        strSQL  := 'SELECT PKG_LAB_STAT_FUNCS.GET_COUNT_LAB_WORK_OTDEL_DUB(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',4,'||pFK_NAPRID||','||pFK_OTDELID||')+PKG_LAB_STAT_FUNCS.GET_COUNT_LAB_WORK_OTDEL_DUB(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',25,'||pFK_NAPRID||','||pFK_OTDELID||')+ '||
                   'PKG_LAB_STAT_FUNCS.GET_COUNT_LAB_WORK_OTDEL_DUB(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',26,'||pFK_NAPRID||','||pFK_OTDELID||') FROM DUAL';
      ELSE
        strSQL  := 'SELECT PKG_LAB_STAT_FUNCS.GET_COUNT_LAB_WORK_OTDEL_DUB(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',4,'||pFK_NAPRID||','||pFK_OTDELID||') FROM DUAL ';
      END IF;
       --Итого
    END IF;
    strSQL  := REPLACE (strSQL, ':FD_DATA1', 'TO_DATE(''' || TO_CHAR (pFD_DATA1, 'dd.mm.yyyy') || ''',''dd.mm.yyyy'')');
    strSQL  := REPLACE (strSQL, ':FD_DATA2', 'TO_DATE(''' || TO_CHAR (pFD_DATA2, 'dd.mm.yyyy') || ''',''dd.mm.yyyy'')');
    IF pFK_NAPRID=-6 THEN
--      strSQL  := REPLACE (strSQL, ':FL_AMB', ' AND (FL_AMB=0 AND FD_OUT BETWEEN FD_DATA1 AND FD_DATA2 ) ');
      strSQL  := REPLACE (strSQL, ':FL_AMB', ' AND (FL_AMB=0) ');
    ELSIF pFK_NAPRID IN (-5,-1,0) THEN
--      strSQL  := REPLACE (strSQL, ':FL_AMB', '  AND ( FL_AMB=1 OR FL_AMB=0 AND FD_OUT BETWEEN FD_DATA1 AND FD_DATA2 ) ');
      strSQL  := REPLACE (strSQL, ':FL_AMB', '   ');
    ELSIF pFK_NAPRID>0 THEN
      strSQL  := REPLACE (strSQL, ':FL_AMB', ' AND (FL_AMB=1 AND FK_NAPRID='||pFK_NAPRID||') ');
    END IF;
    IF pFK_SMID = -1 THEN
      strSQL  := REPLACE (strSQL, ':FK_SMID', ' AND FK_OTDELID='||pFK_OTDELID||' ');
    ELSE
      strSQL  := REPLACE (strSQL, ':FK_SMID', ' AND FK_RAZDID=' || pFK_SMID || ' ');
--      raise_application_error(-20002,strSQL||pFK_NAPRID);
    END IF;
/*    IF nType=4 THEN
      raise_application_error(-20002,strSQL);
    END IF;
*/
    BEGIN
      EXECUTE IMMEDIATE strSQL INTO i;
      IF nType=16 THEN
        nGoodDyn:=i;
      END IF;
      IF i IS NULL THEN
        i:=0;
      END IF;
    EXCEPTION
      WHEN ZERO_DIVIDE THEN
        i:=0;
      WHEN OTHERS THEN
        null;
  --     raise;
--        raise_application_error(-20002,strSQL);
--        i:=-1;
    END;
    RETURN i;
  END;
END;-- Package Body PKG_LAB_STAT_FUNCS
/

SHOW ERRORS;


