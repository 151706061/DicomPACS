DROP FUNCTION ASU.IS_MANDATORY_FILL
/

--
-- IS_MANDATORY_FILL  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSTANDARTDIAG (Table)
--   TIB (Table)
--   TVRACH (Table)
--   TDIAG (Table)
--   TPAC_INSURANCE (Table)
--   TDOZAPOL_SETUP (Table)
--   TSMID (Table)
--   PKG_REGIST_PACFUNC (Package)
--   PKG_REGIST_PEPLFUNC (Package)
--   GET_VIPNAZ (Function)
--   PKG_STATKART (Package)
--   PKG_STATUTIL (Package)
--   TKARTA (Table)
--   VNAZ (Table)
--
CREATE OR REPLACE FUNCTION ASU."IS_MANDATORY_FILL" (pid IN asu.tkarta.fk_id%TYPE) RETURN VARCHAR2 IS
 -- Created 20090727 by Linnikov
 -- Проверяет заполненность обязательных полей статкарты, возвращает 1 или название первого незаполненного поля
 -- 20090727 На данный момент проверяются только 4 основных поля (ZKD, DATAVYP, ISHODGOSP, LECHVRACH)
 -- 20090728 Добавлены (OPER, DOCSER, DOCNUM)

 -- Проверка для остальных полей должна быть выплнена позже

 lTmpI    NUMBER;
 lTmpV    VARCHAR2(100);
 lTmpD    DATE;
 pfldname VARCHAR2(100);

 FUNCTION IS_MANDATORY(psyn IN asu.tdozapol_setup.fc_synonym%TYPE) RETURN BOOLEAN IS
  lTmp INTEGER;
 BEGIN
  SELECT COUNT(1) cnt
    INTO lTmp
    FROM asu.tdozapol_setup s
   WHERE s.fc_synonym = psyn
     AND s.fl_required = 1;
  RETURN(lTmp > 0);
 END;

BEGIN
 -- DATAVYP Дата выписки
 IF IS_MANDATORY('DATAVYP') THEN
  SELECT MAX(i.FD_DATE)
    INTO lTmpD
    FROM asu.TIB i
   WHERE i.FK_SMID IN
         (SELECT s.FK_ID
            FROM asu.TSMID s
           WHERE s.FC_SYNONIM = 'EPIK_DATE'
             AND s.FK_OWNER IN
                 (SELECT sm.FK_ID FROM TSMID sm WHERE sm.FC_SYNONIM = 'EPIK_VYPISNOY'))
     AND i.fk_smeditid IN
         (SELECT sm.fk_id FROM asu.tsmid sm WHERE sm.fc_synonim = 'EPIK_VYPISNOY')
     AND i.fk_pacid = pid;
  IF lTmpD IS NULL THEN
   pfldname := 'Дата выписки';
   RETURN pfldname;
  END IF;
 END IF;

 -- ISHODGOSP Исход госпитализации
 IF IS_MANDATORY('ISHODGOSP') THEN
  IF NVL(STAT.PKG_STATKART.GET_PAC_ISHGOSP(pid), -1) < 1 THEN
   pfldname := '';
   RETURN pfldname;
  END IF;
 END IF;

 -- LECHVRACH Лечащий врач
 IF IS_MANDATORY('LECHVRACH') THEN
  SELECT MAX(FK_VRACHID)
    INTO lTmpI
    FROM asu.tvrach v
   WHERE v.fk_pacid = pid
     AND v.FL_VID = 'M';
  IF lTmpI IS NULL THEN
   pfldname := 'Исход госпитализации';
   RETURN pfldname;
  END IF;
 END IF;
 --------------------------------------------------------------------------------------
 -- DATANAPR Дата направления
 IF IS_MANDATORY('DATANAPR') THEN
  SELECT MAX(i.fd_date)
    INTO lTmpD
    FROM (SELECT MAX(s.fk_id) fk_id FROM tsmid s WHERE s.fc_synonim = 'PD_DATA') sm, tib i
   WHERE sm.fk_id = i.fk_smid
     AND i.fk_pacid = pid;
  IF lTmpD IS NULL THEN
   pfldname := 'Дата направления';
   RETURN pfldname;
  END IF;
 END IF;

 -- DATAROJD Дата рождения
 IF IS_MANDATORY('DATAROJD') THEN
  SELECT TO_CHAR(fd_rojd, 'DD.MM.YYYY') INTO lTmpD FROM tkarta WHERE fk_id = pid;
  IF lTmpD IS NULL THEN
   pfldname := 'Дата рождения';
   RETURN pfldname;
  END IF;
 END IF;

 -- DATAVYP Дата выписки
 IF IS_MANDATORY('DATAVYP') THEN
  SELECT MAX(FD_DATE)
    INTO lTmpD
    FROM TIB
   WHERE FK_SMID IN
         (SELECT FK_ID
            FROM TSMID
           WHERE FC_SYNONIM = 'EPIK_DATE'
             AND FK_OWNER IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = 'EPIK_VYPISNOY'))
     AND fk_smeditid IN (SELECT fk_id FROM tsmid WHERE fc_synonim = 'EPIK_VYPISNOY')
     AND fk_pacid = pid;
  IF lTmpD IS NULL THEN
   pfldname := 'Дата выписки';
   RETURN pfldname;
  END IF;
 END IF;

 -- DEFEKT Дефекты
 IF IS_MANDATORY('DEFEKT') THEN
  SELECT MAX(sm.fK_id)
    INTO lTmpI
    FROM (SELECT fk_id, fc_name
            FROM tsmid
          CONNECT BY PRIOR fk_id = fk_owner
           START WITH fc_synonim = 'SK_DEFECT') sm,
         tib
   WHERE sm.fk_id = tib.fk_smid
     AND tib.fk_pacid = pid;
  IF lTmpI IS NULL THEN
   pfldname := 'Дефекты';
   RETURN pfldname;
  END IF;
 END IF;

 -- DNU Диагноз направившего учреждения
 IF IS_MANDATORY('DNU') THEN
  SELECT MAX(TDIAG.FK_ID)
    INTO lTmpI
    FROM TSMID, TDIAG
   WHERE TDIAG.FK_PACID = pid
     AND TDIAG.FK_SMDIAGID = TSMID.FK_ID
     AND TDIAG.FP_TYPE = STAT.PKG_STATUTIL.GET_SMIDID('S_MESTA_OTBORA');
  IF lTmpI IS NULL THEN
   pfldname := 'Диагноз направившего учреждения';
   RETURN pfldname;
  END IF;
 END IF;

 -- DOCNAME Название документа
 IF IS_MANDATORY('DOCNAME') THEN
  SELECT MAX(fk_docvid) INTO lTmpI FROM TKARTA WHERE fk_id = pid;
  IF lTmpI IS NULL THEN
   pfldname := 'Название документа';
   RETURN pfldname;
  END IF;
 END IF;

 -- DOCNUM Номер документа
 IF IS_MANDATORY('DOCNUM') THEN
  SELECT MAX(k.fc_docser) INTO lTmpV FROM asu.TKARTA k WHERE k.fk_id = pid;
  IF lTmpV IS NULL THEN
   pfldname := 'Номер документа';
   RETURN pfldname;
  END IF;
 END IF;

 -- DOCSER Серия документа
 IF IS_MANDATORY('DOCSER') THEN
  SELECT MAX(k.fc_docser) INTO lTmpV FROM asu.TKARTA k WHERE k.fk_id = pid;
  IF lTmpV IS NULL THEN
   pfldname := 'Серия документа';
   RETURN pfldname;
  END IF;
 END IF;

 -- DOSTOTNACH Доставлен от начала заболевания
 IF IS_MANDATORY('DOSTOTNACH') THEN
  SELECT MAX(sm.fk_id)
    INTO lTmpI
    FROM (SELECT fk_id, fc_name
            FROM tsmid
          CONNECT BY PRIOR fk_id = fk_owner
           START WITH fc_synonim = 'PD_NACHTRAVM') sm,
         tib
   WHERE sm.fk_id = tib.fk_smid
     AND tib.fk_pacid = pid;
  IF lTmpI IS NULL THEN
   pfldname := 'Доставлен от начала заболевания';
   RETURN pfldname;
  END IF;
 END IF;

 -- DOSTPIAN Доставлен в состоянии опьянения
 IF IS_MANDATORY('DOSTPIAN') THEN
  SELECT MAX(sm.FK_ID)
    INTO lTmpI
    FROM (SELECT s.fk_id, s.fc_name
            FROM asu.tsmid s
          CONNECT BY PRIOR s.fk_id = s.fk_owner
           START WITH s.fc_synonim = 'PD_DOST_PIAN') sm,
         asu.tib i
   WHERE sm.fk_id = i.fk_smid
     AND i.fk_pacid = pid;
  IF lTmpI IS NULL THEN
   pfldname := 'Доставлен в состоянии опьянения';
   RETURN pfldname;
  END IF;
 END IF;

 -- DPO Диагноз приемного отделения
 IF IS_MANDATORY('DPO') THEN
  SELECT MAX(d.fk_id)
    INTO lTmpI
    FROM asu.tsmid s, asu.tdiag d
   WHERE d.fk_pacid = pid
     AND d.fk_smdiagid = s.fk_id
     AND d.fp_type = stat.PKG_STATUTIL.GET_SMIDID('PRI_POSTYPLENII');
  IF lTmpI IS NULL THEN
   pfldname := 'Диагноз приемного отделения';
   RETURN pfldname;
  END IF;
 END IF;

 -- EXTRPLAN Госпитализирован экстренно\планово
 IF IS_MANDATORY('EXTRPLAN') THEN
  SELECT MAX(sm.fk_id)
    INTO lTmpI
    FROM (SELECT s.fk_id, s.fc_name
            FROM asu.tsmid s
          CONNECT BY PRIOR s.fk_id = s.fk_owner
           START WITH s.fc_synonim = 'PD_REGOSPITAL') sm,
         tib i
   WHERE sm.fk_id = i.fk_smid
     AND i.fk_pacid = pid;
  IF lTmpI IS NULL THEN
   pfldname := 'Госпитализирован экстренно\планово';
   RETURN pfldname;
  END IF;
 END IF;

 -- ISHODGOSP Исход госпитализации
 IF IS_MANDATORY('ISHODGOSP') THEN
  IF NVL(STAT.PKG_STATKART.GET_PAC_ISHGOSP(pid), -1) < 1 THEN
   pfldname := 'Исход госпитализации';
   RETURN pfldname;
  END IF;
 END IF;

 -- JITEL Житель
 IF IS_MANDATORY('JITEL') THEN
  SELECT MAX(I.FK_SMID)
    INTO lTmpI
    FROM asu.TIB I
   WHERE i.FK_PACID = asu.PKG_REGIST_PEPLFUNC.GET_PEPL_ID(pid)
     AND i.FK_SMEDITID = (SELECT MAX(S.FK_ID) FROM TSMID S WHERE s.FC_SYNONIM = 'LD_LIVEIN');
  IF lTmpI IS NULL THEN
   pfldname := 'Житель';
   RETURN pfldname;
  END IF;
 END IF;

 -- KEMDOST Кем доставлен
 IF IS_MANDATORY('KEMDOST') THEN
  SELECT MAX(sm.FK_ID)
    INTO lTmpI
    FROM (SELECT s.fk_id, s.fc_name
            FROM asu.tsmid s
          CONNECT BY PRIOR s.fk_id = s.fk_owner
           START WITH s.fc_synonim = 'PD_DOST') sm,
         asu.tib i
   WHERE sm.fk_id = i.fk_smid
     AND i.fk_pacid = pid;
  IF lTmpI IS NULL THEN
   pfldname := 'Кем доставлен';
   RETURN pfldname;
  END IF;
 END IF;

 -- KEMNAPR Кем направлен
 IF IS_MANDATORY('KEMNAPR') THEN
  SELECT MAX(sm.fK_ID)
    INTO lTmpI
    FROM (SELECT s.fk_id
            FROM asu.tsmid s
          CONNECT BY PRIOR s.fk_id = s.fk_owner
           START WITH s.fc_synonim = 'PD_INKEM') sm,
         asu.tib i
   WHERE sm.fk_id = i.fk_smid
     AND i.fk_pacid = pid;
  IF lTmpI IS NULL THEN
   pfldname := 'Кем направлен';
   RETURN pfldname;
  END IF;
 END IF;

 -- KODPAC Код пациента
 IF IS_MANDATORY('KODPAC') THEN
  SELECT MAX(fk_ibid) INTO lTmpI FROM tkarta WHERE fk_id = pid;
  IF lTmpI IS NULL THEN
   pfldname := 'Код пациента';
   RETURN pfldname;
  END IF;
 END IF;

 -- KODPERICHSMERT Код причины смерти
 IF IS_MANDATORY('KODPERICHSMERT') THEN
  SELECT MAX(FC_CHAR)
    INTO lTmpV
    FROM asu.TIB i
   WHERE i.FK_PACID = pid
     AND i.FK_SMID = (SELECT MAX(s.FK_ID) FROM asu.TSMID s WHERE s.FC_SYNONIM = 'DIE_MKB');
  IF lTmpV IS NULL THEN
   pfldname := 'Код причины смерти';
   RETURN pfldname;
  END IF;
 END IF;

 -- LGOT Категория льготности
 IF IS_MANDATORY('KODPERICHSMERT') THEN
  SELECT MAX(i.FK_SMID)
    INTO lTmpI
    FROM asu.TIB i
   WHERE i.FK_PACID = asu.PKG_REGIST_PEPLFUNC.GET_PEPL_ID(pid)
     AND i.FK_SMID IN
         (SELECT s.FK_ID
            FROM asu.TSMID s
           WHERE s.FC_SYNONIM IN ('KL_INVVOV', 'KL_UCHVOV', 'KL_VOININTER', 'KL_RADIAZ',
                  'KL_RADIAZCHERN', 'KL_INV1GR', 'KL_INV2GR', 'KL_INV3GR',
                  'KL_INVCHILD', 'KL_INVSDET', 'KL_PROCH'));
  IF lTmpI IS NULL THEN
   pfldname := 'Категория льготности';
   RETURN pfldname;
  END IF;
 END IF;

 -- LISTNETR Листок нетрудоспособности ВНИМАНИЕ !!!! поле не должно проверяться !!!!

 -- MESTOJIT Место жительства
 IF IS_MANDATORY('MESTOJIT') THEN
  IF length(PKG_REGIST_PACFUNC.GET_PAC_ADRSHORT(pid)) = 0 THEN
   pfldname := 'Место жительства';
   RETURN pfldname;
  END IF;
 END IF;

 -- NACIONAL Национальность
 IF IS_MANDATORY('NACIONAL') THEN
  SELECT MAX(i.FK_SMID)
    INTO lTmpI
    FROM asu.TIB i
   WHERE i.FK_PACID = asu.PKG_REGIST_PEPLFUNC.GET_PEPL_ID(pid)
     AND i.FK_SMID IN
         (SELECT s.FK_ID
            FROM asu.TSMID s
           WHERE s.FK_OWNER =
                 (SELECT MAX(sm.FK_ID) FROM TSMID SM WHERE sm.FC_SYNONIM = 'LD_NAROD'));
  IF lTmpI IS NULL THEN
   pfldname := 'Национальность';
   RETURN pfldname;
  END IF;
 END IF;

 -- NARKOZ Анетсезия ВНИМАНИЕ !!!! поле не должно проверяться !!!!

 -- NOMERNAPR Номер направления
 IF IS_MANDATORY('NOMERNAPR') THEN
  SELECT MAX(i.fc_char)
    INTO lTmpV
    FROM (SELECT MAX(fk_id) fk_id FROM asu.tsmid s WHERE fc_synonim = 'PD_NOMER_NAPR') sm,
         asu.tib i
   WHERE sm.fk_id = i.fk_smid
     AND i.fk_pacid = pid;
  IF lTmpV IS NULL THEN
   pfldname := 'Номер направления';
   RETURN pfldname;
  END IF;
 END IF;
 --
 -- С этого момента перестал исправлять запросы
 --
 -- OOKD Осложнение основного клинического диагноза
 IF IS_MANDATORY('OOKD') THEN
  SELECT MAX(FK_ID) FK_ID
    INTO lTmpI
    FROM (SELECT ROWNUM RN, Q.*
            FROM (SELECT TDIAG.*
                    FROM TDIAG, TSMID
                   WHERE TSMID.FK_ID = TDIAG.FK_SMDIAGID
                     AND TDIAG.FK_PACID = pid
                     AND TDIAG.FL_MAIN = STAT.PKG_STATUTIL.GET_SMIDID('OSLOG_MAIN')
                     AND TDIAG.FP_TYPE = STAT.PKG_STATUTIL.GET_SMIDID('CLINIK')
                   ORDER BY TDIAG.FK_ID) Q)
   WHERE RN = 1;
  IF lTmpI IS NULL THEN
   pfldname := 'Осложнение основного клинического диагноза';
   RETURN pfldname;
  END IF;
 END IF;

 -- OOKD2 Осложнение основного клинического диагноза 2
 IF IS_MANDATORY('OOKD2') THEN
  SELECT MAX(FK_ID) FK_ID
    INTO lTmpI
    FROM (SELECT ROWNUM RN, Q.*
            FROM (SELECT TDIAG.*
                    FROM TDIAG, TSMID
                   WHERE TSMID.FK_ID = TDIAG.FK_SMDIAGID
                     AND TDIAG.FK_PACID = pid
                     AND TDIAG.FL_MAIN = STAT.PKG_STATUTIL.GET_SMIDID('OSLOG_MAIN')
                     AND TDIAG.FP_TYPE = STAT.PKG_STATUTIL.GET_SMIDID('CLINIK')
                   ORDER BY TDIAG.FK_ID) Q)
   WHERE RN = 2;
  IF lTmpI IS NULL THEN
   pfldname := 'Осложнение основного клинического диагноза 2';
   RETURN pfldname;
  END IF;
 END IF;

 -- OOKD3 Осложнение основного клинического диагноза 3
 IF IS_MANDATORY('OOKD3') THEN
  SELECT MAX(FK_ID) FK_ID
    INTO lTmpI
    FROM (SELECT ROWNUM RN, Q.*
            FROM (SELECT TDIAG.*
                    FROM TDIAG, TSMID
                   WHERE TSMID.FK_ID = TDIAG.FK_SMDIAGID
                     AND TDIAG.FK_PACID = pid
                     AND TDIAG.FL_MAIN = STAT.PKG_STATUTIL.GET_SMIDID('OSLOG_MAIN')
                     AND TDIAG.FP_TYPE = STAT.PKG_STATUTIL.GET_SMIDID('CLINIK')
                   ORDER BY TDIAG.FK_ID) Q)
   WHERE RN = 3;
  IF lTmpI IS NULL THEN
   pfldname := 'Осложнение основного клинического диагноза 3';
   RETURN pfldname;
  END IF;
 END IF;

 -- OOKDTEXT Текст осложнения основного клинического диагноза
 IF IS_MANDATORY('OOKDTEXT') THEN
  SELECT MAX(i.FC_CHAR)
    INTO lTmpV
    FROM asu.TIB I
   WHERE i.FK_PACID = pid
     AND i.FK_SMID = (SELECT MAX(FK_ID) FROM asu.TSMID s WHERE s.FC_SYNONIM = 'OSLOG_MAIN')
     AND i.FK_SMEDITID = (SELECT MAX(FK_ID) FROM asu.TSMID s WHERE s.FC_SYNONIM = 'CLINIK');
  IF lTmpV IS NULL THEN
   pfldname := 'Текст осложнения основного клинического диагноза';
   RETURN pfldname;
  END IF;
 END IF;

 -- OOPD Осложнение основоного паталогоанатомического диагноза
 IF IS_MANDATORY('OOPD') THEN
  SELECT MAX(FK_ID) FK_ID
    INTO lTmpI
    FROM (SELECT ROWNUM RN, Q.*
            FROM (SELECT TDIAG.*
                    FROM TDIAG, TSMID
                   WHERE TSMID.FK_ID = TDIAG.FK_SMDIAGID
                     AND TDIAG.FK_PACID = pid
                     AND TDIAG.FL_MAIN = STAT.PKG_STATUTIL.GET_SMIDID('OSLOG_MAIN')
                     AND TDIAG.FP_TYPE = STAT.PKG_STATUTIL.GET_SMIDID('CLINIK_ANATOM')
                   ORDER BY TDIAG.FK_ID) Q)
   WHERE RN = 1;
  IF lTmpI IS NULL THEN
   pfldname := 'Осложнение основоного паталогоанатомического диагноза';
   RETURN pfldname;
  END IF;
 END IF;

 -- OOPD2 Осложнение основоного паталогоанатомического диагноза 2
 IF IS_MANDATORY('OOPD2') THEN
  SELECT MAX(FK_ID) FK_ID
    INTO lTmpI
    FROM (SELECT ROWNUM RN, Q.*
            FROM (SELECT TDIAG.*
                    FROM TDIAG, TSMID
                   WHERE TSMID.FK_ID = TDIAG.FK_SMDIAGID
                     AND TDIAG.FK_PACID = pid
                     AND TDIAG.FL_MAIN = STAT.PKG_STATUTIL.GET_SMIDID('OSLOG_MAIN')
                     AND TDIAG.FP_TYPE = STAT.PKG_STATUTIL.GET_SMIDID('CLINIK_ANATOM')
                   ORDER BY TDIAG.FK_ID) Q)
   WHERE RN = 2;
  IF lTmpI IS NULL THEN
   pfldname := 'Осложнение основоного паталогоанатомического диагноза 2';
   RETURN pfldname;
  END IF;
 END IF;

 -- OOPD3 Осложнение основоного паталогоанатомического диагноза 3
 IF IS_MANDATORY('OOPD3') THEN
  SELECT MAX(FK_ID) FK_ID
    INTO lTmpI
    FROM (SELECT ROWNUM RN, Q.*
            FROM (SELECT TDIAG.*
                    FROM TDIAG, TSMID
                   WHERE TSMID.FK_ID = TDIAG.FK_SMDIAGID
                     AND TDIAG.FK_PACID = pid
                     AND TDIAG.FL_MAIN = STAT.PKG_STATUTIL.GET_SMIDID('OSLOG_MAIN')
                     AND TDIAG.FP_TYPE = STAT.PKG_STATUTIL.GET_SMIDID('CLINIK_ANATOM')
                   ORDER BY TDIAG.FK_ID) Q)
   WHERE RN = 3;
  IF lTmpI IS NULL THEN
   pfldname := 'Осложнение основоного паталогоанатомического диагноза 3';
   RETURN pfldname;
  END IF;
 END IF;

 -- OOPDTEXT Текст осложнения основного паталогоанатомического диагноза
 IF IS_MANDATORY('OOPDTEXT') THEN
  SELECT MAX(FC_CHAR)
    INTO lTmpV
    FROM TIB I
   WHERE FK_PACID = pid
     AND FK_SMID = (SELECT MAX(FK_ID) FROM TSMID WHERE FC_SYNONIM = 'OSLOG_MAIN')
     AND FK_SMEDITID = (SELECT MAX(FK_ID) FROM TSMID WHERE FC_SYNONIM = 'CLINIK_ANATOM');
  IF lTmpV IS NULL THEN
   pfldname := 'Текст осложнения основного паталогоанатомического диагноза';
   RETURN pfldname;
  END IF;
 END IF;

 -- OPD Основной паталогоанатомический диагноз
 IF IS_MANDATORY('OPD') THEN
  SELECT MAX(tdiag.fk_id)
    INTO lTmpI
    FROM tdiag, tsmid
   WHERE tsmid.fk_id = tdiag.fk_smdiagid
     AND tdiag.fk_pacid = pid
     AND tdiag.fl_main = STAT.PKG_STATUTIL.get_smidid('MAIN')
     AND tdiag.fp_type = STAT.PKG_STATUTIL.get_smidid('CLINIK_ANATOM');
  IF lTmpI IS NULL THEN
   pfldname := 'Основной паталогоанатомический диагноз';
   RETURN pfldname;
  END IF;
 END IF;

 -- OPER Операции
 IF IS_MANDATORY('OPER') THEN
  SELECT COUNT(FK_ID)
    INTO lTmpI
    FROM asu.vnaz n
   WHERE n.fk_smid IN (stat.pkg_statutil.get_smidid('KONS_PROTHOPER'),
          stat.pkg_statutil.get_smidid('RENTGENXIR_OPER'),
          STAT.PKG_STATUTIL.GET_SMIDID('ABORT'))
     AND n.fk_pacid = pid
     AND n.fk_nazsosid = asu.get_vipnaz;
  IF lTmpI IS NULL THEN
   pfldname := 'Операции';
   RETURN pfldname;
  END IF;
 END IF;

 -- POL Пол
 IF IS_MANDATORY('POL') THEN
  SELECT MAX(FP_SEX) INTO lTmpI FROM TKARTA WHERE FK_ID = pid;
  IF lTmpI IS NULL THEN
   pfldname := 'Пол';
   RETURN pfldname;
  END IF;
 END IF;

 -- POLIS Страховой полис
 IF IS_MANDATORY('POLIS') THEN
  SELECT MAX(FK_INSURDOCID)
    INTO lTmpI
    FROM TPAC_INSURANCE P
   WHERE P.FK_PACID = pid
     AND FK_INSURDOCID IS NOT NULL;
  IF lTmpI IS NULL THEN
   pfldname := 'Страховой полис';
   RETURN pfldname;
  END IF;
 END IF;

 -- PRICHSMERT Причина смерти
 IF IS_MANDATORY('PRICHSMERT') THEN
  SELECT MAX(FC_CHAR)
    INTO lTmpV
    FROM TIB
   WHERE FK_PACID = pid
     AND FK_SMID = (SELECT MAX(FK_ID) FROM TSMID WHERE FC_SYNONIM = 'DIE_PRICH');
  IF lTmpV IS NULL THEN
   pfldname := 'Причина смерти';
   RETURN pfldname;
  END IF;
 END IF;

 -- PRIZNAKVIYAV Признак выявления диагноза
 IF IS_MANDATORY('PRIZNAKVIYAV') THEN
  SELECT nvl(MAX(d.fl_first), 0)
    INTO lTmpI
    FROM asu.tdiag d, asu.tsmid s
   WHERE s.fk_id = d.fk_smdiagid
     AND d.fk_pacid = pid
     AND d.fl_main = STAT.PKG_STATUTIL.get_smidid('MAIN')
     AND d.fp_type = STAT.PKG_STATUTIL.get_smidid('PRI_VYPISKE');
  IF lTmpV < 1 THEN
   pfldname := 'Признак выявления диагноза';
   RETURN pfldname;
  END IF;
 END IF;

 -- RESGOSP Результат госпитализации
 IF IS_MANDATORY('RESGOSP') THEN
  IF nvl(STAT.PKG_STATKART.GET_PAC_RESGOSP(pid), 0) < 1 THEN
   pfldname := 'Результат госпитализации';
   RETURN pfldname;
  END IF;
 END IF;

 -- SKD Сопутствующий клинический диагноз
 IF IS_MANDATORY('SKD') THEN
  SELECT MAX(FK_ID) FK_ID
    INTO lTmpI
    FROM (SELECT ROWNUM RN, Q.*
            FROM (SELECT TDIAG.*
                    FROM TDIAG, TSMID
                   WHERE TSMID.FK_ID = TDIAG.FK_SMDIAGID
                     AND TDIAG.FK_PACID = pid
                     AND TDIAG.FL_MAIN = STAT.PKG_STATUTIL.GET_SMIDID('SOPUT')
                     AND TDIAG.FP_TYPE = STAT.PKG_STATUTIL.GET_SMIDID('CLINIK')
                   ORDER BY TDIAG.FK_ID) Q)
   WHERE RN = 1;
  IF lTmpI IS NULL THEN
   pfldname := 'Сопутствующий клинический диагноз';
   RETURN pfldname;
  END IF;
 END IF;

 -- SKD2 Сопутствующий клинический диагноз 2
 IF IS_MANDATORY('SKD2') THEN
  SELECT MAX(FK_ID) FK_ID
    INTO lTmpI
    FROM (SELECT ROWNUM RN, Q.*
            FROM (SELECT TDIAG.*
                    FROM TDIAG, TSMID
                   WHERE TSMID.FK_ID = TDIAG.FK_SMDIAGID
                     AND TDIAG.FK_PACID = pid
                     AND TDIAG.FL_MAIN = STAT.PKG_STATUTIL.GET_SMIDID('SOPUT')
                     AND TDIAG.FP_TYPE = STAT.PKG_STATUTIL.GET_SMIDID('CLINIK')
                   ORDER BY TDIAG.FK_ID) Q)
   WHERE RN = 2;
  IF lTmpI IS NULL THEN
   pfldname := 'Сопутствующий клинический диагноз 2';
   RETURN pfldname;
  END IF;
 END IF;

 -- SKD3 Сопутствующий клинический диагноз 3
 IF IS_MANDATORY('SKD3') THEN
  SELECT MAX(FK_ID) FK_ID
    INTO lTmpI
    FROM (SELECT ROWNUM RN, Q.*
            FROM (SELECT TDIAG.*
                    FROM TDIAG, TSMID
                   WHERE TSMID.FK_ID = TDIAG.FK_SMDIAGID
                     AND TDIAG.FK_PACID = pid
                     AND TDIAG.FL_MAIN = STAT.PKG_STATUTIL.GET_SMIDID('SOPUT')
                     AND TDIAG.FP_TYPE = STAT.PKG_STATUTIL.GET_SMIDID('CLINIK')
                   ORDER BY TDIAG.FK_ID) Q)
   WHERE RN = 3;
  IF lTmpI IS NULL THEN
   pfldname := 'Сопутствующий клинический диагноз 3';
   RETURN pfldname;
  END IF;
 END IF;

 -- SKDTEXT Текст сопутствующего клинического диагноза
 IF IS_MANDATORY('SKDTEXT') THEN
  SELECT MAX(FC_CHAR)
    INTO lTmpV
    FROM TIB I
   WHERE FK_PACID = pid
     AND FK_SMID = (SELECT MAX(FK_ID) FROM TSMID WHERE FC_SYNONIM = 'SOPUT')
     AND FK_SMEDITID = (SELECT MAX(FK_ID) FROM TSMID WHERE FC_SYNONIM = 'CLINIK');
  IF lTmpv IS NULL THEN
   pfldname := 'Текст сопутствующего клинического диагноза';
   RETURN pfldname;
  END IF;
 END IF;

 -- SOCSTATUS Социальный статус
 IF IS_MANDATORY('SOCSTATUS') THEN
  SELECT MAX(FK_SMID)
    INTO lTmpI
    FROM TIB
   WHERE FK_PACID = PKG_REGIST_PEPLFUNC.GET_PEPL_ID(pid)
     AND FK_SMID IN
         (SELECT FK_ID
            FROM TSMID
           WHERE FK_OWNER =
                 (SELECT NVL(MAX(FK_ID), 0) FROM TSMID WHERE FC_SYNONIM = 'LD_SOC_POL'));
  IF lTmpi IS NULL THEN
   pfldname := 'Социальный статус';
   RETURN pfldname;
  END IF;
 END IF;

 -- SPD Сопутствующий паталогоанатомический диагноз
 IF IS_MANDATORY('SPD') THEN
  SELECT MAX(FK_ID) FK_ID
    INTO lTmpI
    FROM (SELECT ROWNUM RN, Q.*
            FROM (SELECT TDIAG.*
                    FROM TDIAG, TSMID
                   WHERE TSMID.FK_ID = TDIAG.FK_SMDIAGID
                     AND TDIAG.FK_PACID = pid
                     AND TDIAG.FL_MAIN = STAT.PKG_STATUTIL.GET_SMIDID('SOPUT')
                     AND TDIAG.FP_TYPE = STAT.PKG_STATUTIL.GET_SMIDID('CLINIK_ANATOM')
                   ORDER BY TDIAG.FK_ID) Q)
   WHERE RN = 1;
  IF lTmpi IS NULL THEN
   pfldname := 'Сопутствующий паталогоанатомический диагноз';
   RETURN pfldname;
  END IF;
 END IF;

 -- SPD2 Сопутствующий паталогоанатомический диагноз 2
 IF IS_MANDATORY('SPD2') THEN
  SELECT MAX(FK_ID) FK_ID
    INTO lTmpI
    FROM (SELECT ROWNUM RN, Q.*
            FROM (SELECT TDIAG.*
                    FROM TDIAG, TSMID
                   WHERE TSMID.FK_ID = TDIAG.FK_SMDIAGID
                     AND TDIAG.FK_PACID = pid
                     AND TDIAG.FL_MAIN = STAT.PKG_STATUTIL.GET_SMIDID('SOPUT')
                     AND TDIAG.FP_TYPE = STAT.PKG_STATUTIL.GET_SMIDID('CLINIK_ANATOM')
                   ORDER BY TDIAG.FK_ID) Q)
   WHERE RN = 2;
  IF lTmpi IS NULL THEN
   pfldname := 'Сопутствующий паталогоанатомический диагноз 2';
   RETURN pfldname;
  END IF;
 END IF;

 -- SPD3 Сопутствующий паталогоанатомический диагноз 3
 IF IS_MANDATORY('SPD3') THEN
  SELECT MAX(FK_ID) FK_ID
    INTO lTmpI
    FROM (SELECT ROWNUM RN, Q.*
            FROM (SELECT TDIAG.*
                    FROM TDIAG, TSMID
                   WHERE TSMID.FK_ID = TDIAG.FK_SMDIAGID
                     AND TDIAG.FK_PACID = pid
                     AND TDIAG.FL_MAIN = STAT.PKG_STATUTIL.GET_SMIDID('SOPUT')
                     AND TDIAG.FP_TYPE = STAT.PKG_STATUTIL.GET_SMIDID('CLINIK_ANATOM')
                   ORDER BY TDIAG.FK_ID) Q)
   WHERE RN = 3;
  IF lTmpi IS NULL THEN
   pfldname := 'Сопутствующий паталогоанатомический диагноз 3';
   RETURN pfldname;
  END IF;
 END IF;

 -- SPDTEXT Текст сопутствующего паталогоанатомического диагноза
 IF IS_MANDATORY('SPDTEXT') THEN
  SELECT MAX(FC_CHAR)
    INTO lTmpV
    FROM TIB I
   WHERE FK_PACID = pid
     AND FK_SMID = (SELECT MAX(FK_ID) FROM TSMID WHERE FC_SYNONIM = 'SOPUT')
     AND FK_SMEDITID = (SELECT MAX(FK_ID) FROM TSMID WHERE FC_SYNONIM = 'CLINIK_ANATOM');
  IF lTmpV IS NULL THEN
   pfldname := 'Текст сопутствующего паталогоанатомического диагноза';
   RETURN pfldname;
  END IF;
 END IF;

 -- TOMPOSN ТОМП основной
 IF IS_MANDATORY('TOMPOSN') THEN
  SELECT MAX(SD.FK_STANDARTID)
    INTO lTmpI
    FROM TSTANDARTDIAG SD,
         (SELECT MAX(TDIAG.FK_SMDIAGID) FK_DIAG
            FROM TDIAG
           WHERE TDIAG.FK_PACID = pid
             AND tdiag.fl_main = STAT.PKG_STATUTIL.get_smidid('MAIN')
             AND tdiag.fp_type = STAT.PKG_STATUTIL.get_smidid('CLINIK')) D
   WHERE SD.fk_diagid = D.FK_DIAG
     AND FK_PACID = pid;
  IF lTmpI IS NULL THEN
   pfldname := 'ТОМП основной';
   RETURN pfldname;
  END IF;
 END IF;

 -- TOMPSOP ТОМП сопутствующий
 IF IS_MANDATORY('TOMPSOP') THEN
  SELECT MAX(SD.FK_STANDARTID)
    INTO lTmpI
    FROM TSTANDARTDIAG SD,
         (SELECT MAX(TDIAG.FK_SMDIAGID) FK_DIAG
            FROM TDIAG
           WHERE TDIAG.FK_PACID = pid
             AND tdiag.fl_main = STAT.PKG_STATUTIL.get_smidid('SOPUT')
             AND tdiag.fp_type = STAT.PKG_STATUTIL.get_smidid('CLINIK')) D
   WHERE SD.fk_diagid = D.FK_DIAG
     AND FK_PACID = pid;
  IF lTmpI IS NULL THEN
   pfldname := 'ТОМП сопутствующий';
   RETURN pfldname;
  END IF;
 END IF;

 -- TRAVM Травма
 IF IS_MANDATORY('TRAVM') THEN
  SELECT MAX(sm.fk_id)
    INTO lTmpI
    FROM (SELECT fk_id FK_ID
            FROM tsmid
          CONNECT BY PRIOR fk_id = fk_owner
           START WITH fc_synonim = 'PD_TRAVM') sm,
         tib
   WHERE sm.fk_id = tib.fk_smid
     AND tib.fk_pacid = pid;
  IF lTmpI IS NULL THEN
   pfldname := 'Травма';
   RETURN pfldname;
  END IF;
 END IF;

 -- VPERPOVT Госпитализирован впервые\повторно
 IF IS_MANDATORY('VPERPOVT') THEN
  SELECT MAX(sm.fk_id)
    INTO lTmpI
    FROM (SELECT fk_id, fc_name
            FROM tsmid
          CONNECT BY PRIOR fk_id = fk_owner
           START WITH fc_synonim = 'PD_OBR') sm,
         tib
   WHERE sm.fk_id = tib.fk_smid
     AND tib.fk_pacid = pid;
  IF lTmpI IS NULL THEN
   pfldname := 'Госпитализирован впервые\повторно';
   RETURN pfldname;
  END IF;
 END IF;

 -- VREMVUYP Время выписки ВНИМАНИЕ !!!! поле не должно проверяться !!!! Проверяется только наличие даты

 -- ZKD Заключительный клинический диагноз
 IF IS_MANDATORY('ZKD') THEN
  SELECT MAX(d.fk_id)
    INTO lTmpI
    FROM asu.tdiag d, asu.tsmid s
   WHERE s.fk_id = d.fk_smdiagid
     AND d.fk_pacid = pid
     AND d.fl_main = STAT.PKG_STATUTIL.get_smidid('MAIN')
     AND d.fp_type = STAT.PKG_STATUTIL.get_smidid('PRI_VYPISKE');
  IF lTmpI IS NULL THEN
   pfldname := 'Заключительный клинический диагноз';
   RETURN pfldname;
  END IF;
 END IF;

 RETURN('1');

END IS_MANDATORY_FILL;
/

SHOW ERRORS;


