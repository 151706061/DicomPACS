DROP FUNCTION ASU.GET_COUNT_LAB_WORK_OTDEL_DUB
/

--
-- GET_COUNT_LAB_WORK_OTDEL_DUB  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   GET_SYNBYID (Function)
--
CREATE OR REPLACE FUNCTION ASU."GET_COUNT_LAB_WORK_OTDEL_DUB" (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_SMID IN NUMBER, nType IN NUMBER,pFK_NAPRID IN NUMBER:=-1,pFK_OTDELID IN NUMBER)
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
      -- оличество выписанных
    ELSIF nType = 2 THEN
      IF pFK_NAPRID NOT IN (-6,-5,-1) AND pFK_NAPRID<=0 THEN
        RETURN NULL;
      END IF;
      strSQL  := 'SELECT COUNT(fk_pacid) FROM(SELECT DISTINCT FK_PACID,FK_NAPRID FROM VRESAN,(SELECT :FD_DATA1 FD_DATA1,:FD_DATA2 FD_DATA2 FROM DUAL) WHERE FD_INS BETWEEN FD_DATA1 AND FD_DATA2 :FL_AMB :FK_SMID) ';
      -- оличество обследованных
    ELSIF nType = 3 THEN
      IF pFK_NAPRID NOT IN (-6)  THEN
        RETURN NULL;
      END IF;
      strSQL  := 'SELECT (GET_COUNT_LAB_WORK_OTDEL_DUB(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',2,'||pFK_NAPRID||','||pFK_OTDELID||')/GET_COUNT_LAB_WORK_OTDEL_DUB(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',1,'||pFK_NAPRID||','||pFK_OTDELID||'))*100 FROM DUAL ';
      --ѕроцент охвата
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
      -- оличество исследований
      ELSIF pFK_NAPRID=-4 THEN
        strSQL  := 'SELECT SUM(FN_COUNT*GET_ED_FROM_SMID(FK_SMID)) FROM (select COUNT(FK_SMID) FN_COUNT,FK_SMID from vcontrol,(SELECT :FD_DATA1 FD_DATA1,:FD_DATA2 FD_DATA2 FROM DUAL) WHERE FD_DATE BETWEEN FD_DATA1 AND FD_DATA2 :FK_SMID GROUP BY FK_SMID)';
        -- оличество контролей
      ELSIF pFK_NAPRID=-3 THEN
        strSQL  := 'SELECT SUM(FN_COUNT) FROM VPOVTOR,(SELECT :FD_DATA1 FD_DATA1,:FD_DATA2 FD_DATA2 FROM DUAL) WHERE FD_DATE BETWEEN FD_DATA1 AND FD_DATA2 :FK_SMID';
        -- оличество повторов
      ELSIF pFK_NAPRID=-2 THEN
        strSQL  := 'SELECT SUM(FN_SAN) FROM VPOVTOR,(SELECT :FD_DATA1 FD_DATA1,:FD_DATA2 FD_DATA2 FROM DUAL) WHERE FD_DATE BETWEEN FD_DATA1 AND FD_DATA2 :FK_SMID';
        --—анитарно-гигиенческих исследований
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
        --ќбщее кол-во исследований
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
    --¬рем€
    END IF;
    ELSIF nType = 5 THEN
      IF pFK_NAPRID IN (-4,-3,-2,0) THEN
        RETURN NULL;
      END IF;
      strSQL  := 'SELECT (GET_COUNT_LAB_WORK_OTDEL_DUB(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',4,'||pFK_NAPRID||','||pFK_OTDELID||')/GET_COUNT_LAB_WORK_OTDEL_DUB(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',2,'||pFK_NAPRID||','||pFK_OTDELID||')) FROM DUAL ';
      --»сследований на одного обследованного
    ELSIF nType = 6 THEN
      IF pFK_NAPRID <>-6 THEN
        RETURN NULL;
      END IF;
      strSQL  := 'SELECT (GET_COUNT_LAB_WORK_OTDEL_DUB(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',4,'||pFK_NAPRID||','||pFK_OTDELID||')/GET_COUNT_LAB_WORK_OTDEL_DUB(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',1,'||pFK_NAPRID||','||pFK_OTDELID||')) FROM DUAL ';
      --»сследований на выписанного
    ELSIF nType = 7 THEN
      IF pFK_NAPRID NOT IN (-6,-5,-1) AND pFK_NAPRID<=0 THEN
        RETURN NULL;
      END IF;
      strSQL  := 'SELECT COUNT(FK_PACID) FROM (SELECT DISTINCT FK_PACID,FK_NAPRID FROM VRESAN,TPATNAME,(SELECT :FD_DATA1 FD_DATA1,:FD_DATA2 FD_DATA2 FROM DUAL) WHERE FK_PATID=TPATNAME.FK_ID AND FP_PRIOR>0 AND fd_ins BETWEEN FD_DATA1 AND FD_DATA2 :FL_AMB :FK_SMID)';
      -- оличество пациентов с патологией
    ELSIF nType = 8 THEN
      IF pFK_NAPRID NOT IN (-6,-5,-1) AND pFK_NAPRID<=0 THEN
        RETURN NULL;
      END IF;
      strSQL  := 'SELECT (GET_COUNT_LAB_WORK_OTDEL_DUB(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',7,'||pFK_NAPRID||','||pFK_OTDELID||')/GET_COUNT_LAB_WORK_OTDEL_DUB(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',2,'||pFK_NAPRID||','||pFK_OTDELID||'))*100 FROM DUAL ';
      --% патологий от обследованных
    ELSIF nType = 9 THEN
      IF pFK_NAPRID <>-6 THEN
        RETURN NULL;
      END IF;
      strSQL  := 'SELECT (GET_COUNT_LAB_WORK_OTDEL_DUB(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',7,'||pFK_NAPRID||','||pFK_OTDELID||')/GET_COUNT_LAB_WORK_OTDEL_DUB(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',1,'||pFK_NAPRID||','||pFK_OTDELID||'))*100 FROM DUAL ';
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
      --ѕовторно обследовано
    ELSIF nType = 11 THEN
      IF pFK_NAPRID NOT IN (-6,-5,-1) AND pFK_NAPRID<=0 THEN
        RETURN NULL;
      END IF;
      strSQL  := 'SELECT (GET_COUNT_LAB_WORK_OTDEL_DUB(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',10,'||pFK_NAPRID||','||pFK_OTDELID||')/GET_COUNT_LAB_WORK_OTDEL_DUB(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',2,'||pFK_NAPRID||','||pFK_OTDELID||'))*100 FROM DUAL ';
      --% повторно обсл. от обследованных
    ELSIF nType = 12 THEN
      IF pFK_NAPRID <>-6 THEN
        RETURN NULL;
      END IF;
      strSQL  := 'SELECT (GET_COUNT_LAB_WORK_OTDEL_DUB(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',10,'||pFK_NAPRID||','||pFK_OTDELID||')/GET_COUNT_LAB_WORK_OTDEL_DUB(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',1,'||pFK_NAPRID||','||pFK_OTDELID||'))*100 FROM DUAL ';
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
      --ѕовторно обсл. с патологией
    ELSIF nType = 14 THEN
      IF pFK_NAPRID NOT IN (-6,-5,-1) AND pFK_NAPRID<=0 THEN
        RETURN NULL;
      END IF;
      strSQL  := 'SELECT (GET_COUNT_LAB_WORK_OTDEL_DUB(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',13,'||pFK_NAPRID||','||pFK_OTDELID||')/GET_COUNT_LAB_WORK_OTDEL_DUB(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',7,'||pFK_NAPRID||','||pFK_OTDELID||'))*100 FROM DUAL ';
      --% повторно обсл. с патологией от лиц с патологией
    ELSIF nType = 15 THEN
      IF pFK_NAPRID <>-6 THEN
        RETURN NULL;
      END IF;
      strSQL  := 'SELECT (GET_COUNT_LAB_WORK_OTDEL_DUB(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',13,'||pFK_NAPRID||','||pFK_OTDELID||')/GET_COUNT_LAB_WORK_OTDEL_DUB(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',1,'||pFK_NAPRID||','||pFK_OTDELID||'))*100 FROM DUAL ';
      --% повторно обсл. с патологией от выписанных
    ELSIF nType = 16 THEN
      IF pFK_NAPRID NOT IN (-6,-5,-1) AND pFK_NAPRID<=0 THEN
        RETURN NULL;
      END IF;--checkit
      strSQL  := 'select NULL from dual';
--    strSQL  := 'select /*+ rule*/count(*) from (select distinct fk_pacid,fk_naprid '||
--                 '    from ( '||
--                 '           select count(fk_smid) fn_count,fk_pacid,fk_naprid,fk_smid,fk_colid '||
--                 '              from vresan,tpatname,( '||
--                 '                select distinct fk_pacid fk_vpacid, fk_naprid fk_vnaprid '||
--                 '                   from vresan,(SELECT :FD_DATA1 FD_DATA1,:FD_DATA2 FD_DATA2 FROM DUAL) '||
--                 '                   where fd_ins between fd_data1 and fd_data2 :FK_SMID :FL_AMB ),'||
--                 '                      (SELECT :FD_DATA1 FD_DATA1,:FD_DATA2 FD_DATA2 FROM DUAL) '||
--                 '               where tpatname.fk_id=fk_patid and fp_prior>0 and fk_pacid=fk_vpacid and fk_naprid=fk_vnaprid :FK_SMID :FL_AMB '||
--                 '               group by fk_pacid,fk_naprid,fk_smid,fk_colid) '||
--                 '    where '||
--                 'fn_count>1 and GET_GOOD_DINAMIC_UNIVERSAL (FK_PACID, FK_SMID, FK_COLID) = 1)';
      --Ћиц с положительной динамикой
    ELSIF nType = 17 THEN
      IF pFK_NAPRID NOT IN (-6,-5,-1) AND pFK_NAPRID<=0 THEN
        RETURN NULL;
      END IF;
      strSQL  := 'SELECT (GET_COUNT_LAB_WORK_OTDEL_DUB(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',16,'||pFK_NAPRID||','||pFK_OTDELID||')/GET_COUNT_LAB_WORK_OTDEL_DUB(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',2,'||pFK_NAPRID||','||pFK_OTDELID||'))*100 FROM DUAL ';
      --% Ћиц с положительной динамикой от обследованных
    ELSIF nType = 18 THEN
      IF pFK_NAPRID NOT IN (-6,-5,-1) AND pFK_NAPRID<=0 THEN
        RETURN NULL;
      END IF;
      strSQL  := 'SELECT (GET_COUNT_LAB_WORK_OTDEL_DUB(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',16,'||pFK_NAPRID||','||pFK_OTDELID||')/GET_COUNT_LAB_WORK_OTDEL_DUB(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',7,'||pFK_NAPRID||','||pFK_OTDELID||'))*100 FROM DUAL ';
      --% Ћиц с положительной динамикой от лиц с динамикой
    ELSIF nType = 19 THEN
      IF pFK_NAPRID <>-6 THEN
        RETURN NULL;
      END IF;
      strSQL  := 'SELECT (GET_COUNT_LAB_WORK_OTDEL_DUB(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',16,'||pFK_NAPRID||','||pFK_OTDELID||')/GET_COUNT_LAB_WORK_OTDEL_DUB(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',1,'||pFK_NAPRID||','||pFK_OTDELID||'))*100 FROM DUAL ';
      --% Ћиц с положительной динамикой от выписанных
    ELSIF nType = 20 THEN
      IF pFK_NAPRID NOT IN (-6,-5,-1) AND pFK_NAPRID<=0 THEN
        RETURN NULL;
      END IF;
      strSQL  := 'SELECT COUNT(FK_PACID) FROM (SELECT DISTINCT FK_PACID,FK_NAPRID FROM VRESAN,TPATNAME,(SELECT :FD_DATA1 FD_DATA1,:FD_DATA2 FD_DATA2 FROM DUAL) WHERE FK_PATID=TPATNAME.FK_ID AND FP_PRIOR>0 AND FL_PATFIRST=1 AND fd_ins BETWEEN FD_DATA1 AND FD_DATA2 :FL_AMB :FK_SMID)';
      --лиц с впервые вы€вленной патологией
    ELSIF nType = 21 THEN
      IF pFK_NAPRID NOT IN (-6,-5,-1) AND pFK_NAPRID<=0 THEN
        RETURN NULL;
      END IF;
      strSQL  := 'SELECT (GET_COUNT_LAB_WORK_OTDEL_DUB(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',20,'||pFK_NAPRID||','||pFK_OTDELID||')/GET_COUNT_LAB_WORK_OTDEL_DUB(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',2,'||pFK_NAPRID||','||pFK_OTDELID||'))*100 FROM DUAL ';
      --% лиц с впервые вы€вленной патологией от обследованных
    ELSIF nType = 22 THEN
      IF pFK_NAPRID NOT IN (-6,-5,-1) AND pFK_NAPRID<=0 THEN
        RETURN NULL;
      END IF;
      strSQL  := 'SELECT (GET_COUNT_LAB_WORK_OTDEL_DUB(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',20,'||pFK_NAPRID||','||pFK_OTDELID||')/GET_COUNT_LAB_WORK_OTDEL_DUB(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',7,'||pFK_NAPRID||','||pFK_OTDELID||'))*100 FROM DUAL ';
      --% лиц с впервые вы€вленной патологией от лиц с патологией
    ELSIF nType = 23 THEN
      IF pFK_NAPRID <>-6 THEN
        RETURN NULL;
      END IF;
      strSQL  := 'SELECT (GET_COUNT_LAB_WORK_OTDEL_DUB(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',20,'||pFK_NAPRID||','||pFK_OTDELID||')/GET_COUNT_LAB_WORK_OTDEL_DUB(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',1,'||pFK_NAPRID||','||pFK_OTDELID||'))*100 FROM DUAL ';
      --% лиц с впервые вы€вленной патологией от выписанных
    ELSIF nType = 24 THEN
      IF pFK_NAPRID NOT IN (-6,-5,-1) AND pFK_NAPRID<=0 THEN
        RETURN NULL;
      END IF;
      strSQL  :='SELECT SUM (fn_count * get_ed_from_SMID (FK_SMID) )FN_SUM FROM ' ||
                '(SELECT COUNT (fk_smid) fn_count, fk_smid FROM VRESAN,TPATNAME,(SELECT :FD_DATA1 FD_DATA1, :FD_DATA2 FD_DATA2 FROM DUAL) ' ||
                'WHERE fd_ins BETWEEN FD_DATA1 AND FD_DATA2 AND TPATNAME.FK_ID=FK_PATID AND FP_PRIOR>0 :FK_SMID :FL_AMB GROUP BY fk_smid) ';
       --ѕатологических результатов
    ELSIF nType = 25 THEN
      IF pFK_NAPRID NOT IN (-1,0) THEN
        RETURN NULL;
      END IF;
      IF pFK_NAPRID=-1 THEN
        strSQL  :='SELECT SUM (FN_PALEC) FROM TZABOR,(SELECT :FD_DATA1 FD_DATA1, :FD_DATA2 FD_DATA2 FROM DUAL) WHERE FD_DATE BETWEEN FD_DATA1 AND FD_DATA2 ';
      ELSE
        strSQL  :='SELECT SUM (FN_PALEC)*5 FROM TZABOR,(SELECT :FD_DATA1 FD_DATA1, :FD_DATA2 FD_DATA2 FROM DUAL) WHERE FD_DATE BETWEEN FD_DATA1 AND FD_DATA2 ';
      END IF;
       --«аборов из пальца
    ELSIF nType = 26 THEN
      IF pFK_NAPRID NOT IN (-1,0) THEN
        RETURN NULL;
      END IF;
      IF pFK_NAPRID=-1 THEN
        strSQL  :='SELECT SUM (FN_VENA) FROM TZABOR,(SELECT :FD_DATA1 FD_DATA1, :FD_DATA2 FD_DATA2 FROM DUAL) WHERE FD_DATE BETWEEN FD_DATA1 AND FD_DATA2 ';
      ELSE
       strSQL  :='SELECT SUM (FN_VENA)*10 FROM TZABOR,(SELECT :FD_DATA1 FD_DATA1, :FD_DATA2 FD_DATA2 FROM DUAL) WHERE FD_DATE BETWEEN FD_DATA1 AND FD_DATA2 ';
      END IF;
       --«аборов из вены
    ELSIF nType = 27 THEN
      IF pFK_NAPRID<>0 THEN
        RETURN NULL;
      END IF;
      IF GET_SYNBYID(pFK_OTDELID)='OTDEL_KLINIKA' THEN
        strSQL  := 'SELECT GET_COUNT_LAB_WORK_OTDEL_DUB(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',4,'||pFK_NAPRID||','||pFK_OTDELID||')+GET_COUNT_LAB_WORK_OTDEL_DUB(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',25,'||pFK_NAPRID||','||pFK_OTDELID||')+ '||
                   'GET_COUNT_LAB_WORK_OTDEL_DUB(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',26,'||pFK_NAPRID||','||pFK_OTDELID||') FROM DUAL';
      ELSE
        strSQL  := 'SELECT GET_COUNT_LAB_WORK_OTDEL_DUB(:FD_DATA1,:FD_DATA2,' || pFK_SMID || ',4,'||pFK_NAPRID||','||pFK_OTDELID||') FROM DUAL ';
      END IF;
       --»того
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
/

SHOW ERRORS;


