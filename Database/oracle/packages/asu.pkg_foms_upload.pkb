DROP PACKAGE BODY ASU.PKG_FOMS_UPLOAD
/

--
-- PKG_FOMS_UPLOAD  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_FOMS_UPLOAD" IS

 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 PROCEDURE FILL_STAC(pOMS_ONLY NUMBER default 1, pOWN NUMBER default 0) IS
 BEGIN
   ASU.PKG_STAT_COST.Calculate(pOMS_ONLY, pOWN);

   -- Если в выгрузку попала карта и один из переводов этой карты, начался и закончился до начала отчётного периода,
   -- то все переводы этого случая будут иметь одинаковый ID_ILL, но разные P_ID_ILL
   for c in (SELECT s.id_ill,
                    first_VALUE(s.id_ill) OVER(PARTITION BY s.fk_pacid ORDER BY s.fd_date2, s.fd_date1, s.Id_Ill ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) id_ill_new,
                    s.p_id_ill,
                    ROW_NUMBER() OVER(PARTITION BY s.fk_pacid ORDER BY s.fd_date2, s.fd_date1, s.Id_Ill DESC) p_id_ill_new
               FROM (SELECT t.fk_pacid, MIN(t.fd_date2) fd_date2, COUNT(*) fn_count
                       FROM asu.tsluch_dbf_calc t
                      GROUP BY t.fk_pacid
                     HAVING COUNT(*) > 1) t
              INNER JOIN asu.tsluch_dbf_calc s ON s.fk_pacid = t.fk_pacid
              WHERE t.fd_date2 <
                    to_date('01.' || to_char(vMONTH) || '.' || to_char(vYEAR), 'dd.mm.yyyy')
              ORDER BY s.fk_pacid, s.fd_date2, s.fd_date1, s.Id_Ill
            )
    loop
      update asu.tsluch_dbf_calc t
         set t.id_ill = c.id_ill_new, t.p_id_ill = c.p_id_ill_new
       where t.id_ill = c.id_ill
         and nvl(t.p_id_ill, -1) = nvl(c.p_id_ill, -1);
    end loop;
 END;
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 PROCEDURE FILL_STAC_USL is
 begin
  INSERT INTO asu.tusl_dbf d
    (YEAR,
     MONTH,
     OWN,
     LPU_ID,
     LPU_INTR,
     PERSON_IDL,
     ID_ILL,
     P_ID_ILL,
     ID_ILL_U,
     TYPE_USL,
     DATE_B_U,
     DATE_E_U,
     DATE_B_U_TIME,
     DATE_E_U_TIME,
     V_MU,
     PR_MP,
     KOD_MU,
     KOL_MU,
     TYPE_EO,
     KOD_EO,
     KOL_EO,
     COST_EO,
     SUM_EO,
     N_QU, -- Номер сегмента (квадранта),
     N_TOOTH, -- Номер зуба (справочник ZF),
     P_TOOTH, -- поверхность зуба (справочник PZ),
     N_QU2, -- Номер сегмента (квадранта),
     N_TOOTH2, -- Номер зуба (справочник ZF),
     P_TOOTH2, -- поверхность зуба (справочник PZ),
     N_QU3, -- Номер сегмента (квадранта),
     N_TOOTH3, -- Номер зуба (справочник ZF),
     P_TOOTH3, -- поверхность зуба (справочник PZ),
     N_QU4, -- Номер сегмента (квадранта),
     N_TOOTH4, -- Номер зуба (справочник ZF),
     P_TOOTH4, -- поверхность зуба (справочник PZ),
     N_QU5, -- Номер сегмента (квадранта),
     N_TOOTH5, -- Номер зуба (справочник ZF),
     P_TOOTH5, -- поверхность зуба (справочник PZ),
     N_QU6, -- Номер сегмента (квадранта),
     N_TOOTH6, -- Номер зуба (справочник ZF),
     P_TOOTH6, -- поверхность зуба (справочник PZ),
     N_QU7, -- Номер сегмента (квадранта),
     N_TOOTH7, -- Номер зуба (справочник ZF),
     P_TOOTH7, -- поверхность зуба (справочник PZ),
     N_QU8, -- Номер сегмента (квадранта),
     N_TOOTH8, -- Номер зуба (справочник ZF),
     P_TOOTH8,
     DOC_CD_U,
     PRVSM_U,

     Z$NAZ_ID,
     Z$FL_POLY,
     FK_SOTRID,
     FK_ID,
     FK_SLUCHID,
     FK_KOYKAVIDID,
     FK_PACID)

    SELECT vYEAR year,
           vMONTH month,
           t.own,
           lpu_code lpu_id,
           null LPU_INTR,
           t.person_idl,
           t.ID_ILL,
           decode(t.p_id_ill,
                  null,
                  decode(db_name.fc_name,
                         'X',
                         null,
                         decode(trunc(t.fd_date2),
                                null,
                                TRUNC(MONTHS_BETWEEN(SYSDATE, trunc(t.fd_date2))) + 1,
                                decode(TRUNC(MONTHS_BETWEEN(trunc(t.fd_date2), trunc(t.fd_date1))), 0, null, TRUNC(MONTHS_BETWEEN(SYSDATE, trunc(t.fd_date1))) + 1))),
                  t.p_id_ill) P_ID_ILL,
           t.fk_pereselid ID_ILL_U,

  -- ЗНАЧЕНИЯ ПОЛЯ Q_U:
  --   1 - СТАЦИОНАР
  --   2 - ПОЛИКЛИНИКА
  --   3 - ДНЕВНОЙ СТАЦИОНАР
  --   4 - СТАЦИОНАР ПЛАНОВЫЙ (НЕ ИСПОЛЬЗУЕТСЯ HTTP://192.168.1.2:15000/REDMINE/ISSUES/SHOW/9306)
  --   5 - СТАМОТОЛОГИЧЕСКАЯ
  --   6 - ЦЕНТРЫ ЗДОРОВЬЯ (ДОБАВЛЕН HTTP://192.168.1.9/REDMINE/ISSUES/13592)
  --   7 - СКОРАЯ МЕДИЦИНСКАЯ ПОМОЩЬ ВНЕ МЕДИЦИНСКОЙ ОРГАНИЗАЦИИ
           CASE WHEN THC.FK_ID IS NOT NULL THEN 6
                ELSE decode(t.fl_isds, 1, 3, 1)
            END TYPE_USL,

           trunc(t.fd_date1) DATE_B_U,
           trunc(t.fd_date2) DATE_E_U,
           t.fd_date1 DATE_B_U_TIME,
           t.fd_date2 DATE_E_U_TIME,
           exch43.pkg_exchcache.GET_THEIR_ID_ELSELOG(asu.GET_HOMS_COMPANYID, 'PMSP', 'THELP_TYPE', tht.fk_id, 'asu.tusl_dbf', asu.seq_tusl_dbf.nextval, 'V_MU') V_MU,
           -- 20110207 Значение поля PR_MP будет изменено в SYNC_DATA в случаях подачи “Диагностических услуг” (TYPE_EO=1) на значение 401 (по предложению Маши Коваленко)
           -- 20121002 Efimov V.A. тип койки опеределяется по последнему переводу (прежде брался из данных палаты и мог не совпадать с данными перемещения) Изменение согласовал с Машек Коваленко
           decode(decode(t.fl_isds, 1, 3, 1),
                  3,
                  decode(db_name.fc_name,
                         'SK',
                         exch43.pkg_exchcache.GET_THEIR_ID_ELSELOG(asu.GET_HOMS_COMPANYID,
                                                                   'PROFMP_DS',
                                                                   'TSOTR_SPEC',
                                                                   tss.fk_id,
                                                                   'asu.tusl_dbf',
                                                                   asu.seq_tusl_dbf.NEXTVAL,
                                                                   'PR_MP'),
                         exch43.pkg_exchcache.GET_THEIR_ID_ELSELOG(asu.GET_HOMS_COMPANYID,
                                                                   'PROFMP_DS',
                                                                   'TTIPROOM',
                                                                   LAST_VALUE(t.fk_koykavidid)
                                                                   OVER(PARTITION BY t.fk_pacid ORDER BY t.fd_date1,
                                                                        t.fk_pereselid ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING),
                                                                   'asu.tusl_dbf',
                                                                   asu.seq_tusl_dbf.NEXTVAL,
                                                                   'PR_MP')),
                  exch43.pkg_exchcache.GET_THEIR_ID_ELSELOG(asu.GET_HOMS_COMPANYID,
                                                            'PROFMP_S',
                                                            'TTIPROOM',
                                                            LAST_VALUE(T.FK_KOYKAVIDID) OVER(PARTITION BY T.FK_PACID ORDER BY T.FD_DATE1,
                                                                 T.FK_ID ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING),
                                                            'ASU.TUSL_DBF',
                                                            ASU.SEQ_TUSL_DBF.NEXTVAL,
                                                            'PR_MP')) PR_MP,
           decode(t.fl_isds, 1, 2, 3) KOD_MU, -- 3 - стационар, 2 - дневной стационар
           decode(decode(t.fl_isds, 0, trunc(t.fd_date2) - trunc(t.fd_date1), ASU.PKG_WORKDAYS.workdays_between(trunc(t.fd_date1), trunc(t.fd_date2) + 1)),
                  0,
                  1,
                  decode(t.fl_isds, 0, trunc(t.fd_date2) - trunc(t.fd_date1), ASU.PKG_WORKDAYS.workdays_between(trunc(t.fd_date1), trunc(t.fd_date2) + 1))) KOL_MU,
           7 TYPE_EO, -- Тарифы оказания МП по КСГ
           t.FC_CODE KOD_EO,
           1 KOL_EO,
           t.fn_cost COST_EO,
           t.fn_cost SUM_EO,

           null, null, null, -- N_QU - P_TOOTH8
           null, null, null,
           null, null, null,
           null, null, null,
           null, null, null,
           null, null, null,
           null, null, null,
           null, null, null,
           decode(length(to_char(tst.FN_INN)), 11, '0' || to_char(tst.FN_INN), to_char(tst.FN_INN)) DOC_CD_U,
           exch43.pkg_exchcache.GET_THEIR_ID_ELSELOG(asu.GET_HOMS_COMPANYID,
                                                     'VSO_VSD_SSO',
                                                     'TSOTR_SPEC',
                                                     tss.fk_id,
                                                     'asu.tusl_dbf',
                                                     asu.seq_tusl_dbf.nextval,
                                                     'PRVSM_U') PRVSM_U,
           t.fk_pereselid Z$NAZ_ID,
           0 Z$FL_POLY,
           tst.fk_id FK_SOTRID,
           asu.seq_tusl_dbf.nextval FK_ID,
           ASU.SEQ_TSLUCH_DBF.NEXTVAL FK_SLUCHID,
           t.fk_koykavidid,
           t.fk_pacid

    -- Efimov V.A. 20110826 Результатом следующего запроса является замена всех реаницаций на профили предыдущего и последующего,
    -- а ткак же группировка подряд идущих перемещений с одинаковым профилем (остаются только начала и концы, которые будут дополнительно сгруппированы в GROUP_AMB_SLUCH)
      from (select t.id_ill fk_id,
                   t.pr_own own,
                   t.fk_peplid person_idl,
                   t.id_ill id_ill,
                   t.p_id_ill,
                   t.fc_ser policyser,
                   t.fc_num policynum,
                   t.fk_uslvidid,
                   t.id_ill_u fk_pereselid,
                   t.fk_pacid,
                   nvl(lead(decode(i.fk_vrachid, 0, null, -1, null, i.fk_vrachid), 1, asu.GET_PACVRACH(t.fk_pacid))
                       over(partition by t.fk_pacid order by t.fd_date1, t.id_ill),
                       r.fk_vrachid) fk_vrachid,
                   t.FD_DATE1,
                   t.FD_DATE2,
                   t.fk_koykavidid,
                   nvl(t.fc_code, t.fc_icd) fc_code,
                   t.fl_under18,
                   t.fl_isds,
                   t.fn_cost
              from asu.tsluch_dbf_calc t
             inner join asu.troom r on r.fk_id = t.fk_palataid
              left join asu.TIB i on i.fk_pacid = t.fk_pacid and i.fn_num = t.id_ill
             where t.fl_fromstor = 0
               and t.fl_poly = 0
               and t.fn_step = 3) t
     inner join (select 1 fk_id, ASU.PKG_SMINI.READSTRING('CONFIG', 'DB_NAME', 'H') fc_name from dual) db_name on db_name.fk_id > 0
      left join login.tsotr tst on tst.fk_id = t.fk_vrachid
      left join asu.thelp_type tht on tht.fk_id = tst.fk_helptype
      left join asu.TSOTR_SPEC tss on tss.fk_id = tst.fk_medspec
      left join asu.tpac_insurance tpi on tpi.fk_pacid = t.fk_pacid
     inner join asu.tkarta tk on tk.fk_id = t.fk_pacid
      LEFT JOIN (SELECT TUV.FK_ID
                   FROM ASU.TUSLVID TUV
                 CONNECT BY PRIOR TUV.FK_ID = TUV.FK_OWNERID
                  START WITH TUV.FK_ID IN (ASU.DOC_IBHCENTER)) THC ON THC.FK_ID = TK.FK_USLVIDID; -- центр здоровья

  -- Несопоставленные диагнозы джолжны попадать в выгрузку, но не выгружаться в DBF, поэтому добавляю их в список отсутствующих соответствий
  insert into asu.TUSLNOCOMPARE
    (FK_USLID, FK_SMID, FK_TIPROOM)
    select t.fk_id, tdc.fk_smid, null
      from asu.tusl_dbf t
     inner join asu.tsluch_dbf_calc tdc on tdc.ID_ILL = t.id_ill_u
     where t.z$fl_poly = 0
       and t.kod_eo is not null
       and t.cost_eo is null;
 END;
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 PROCEDURE FILL_STAC_SLUCH is
  vSMID_PD_NOMER_NAPR NUMBER;
  vSMID_PD_DATA NUMBER;
  vSMID_REGOSPITAL_EXTR NUMBER;
  vSMID_TYPE_V_MU NUMBER;
  vSMID_DOP_ISHOD_PARENT_S NUMBER;
 begin
  select max(t.fk_id) into vSMID_PD_NOMER_NAPR from asu.tsmid t where fc_synonim = 'PD_NOMER_NAPR';
  select max(t.fk_id) into vSMID_PD_DATA from asu.tsmid t where fc_synonim = 'PD_DATA';
  select max(t.fk_id) into vSMID_REGOSPITAL_EXTR from asu.tsmid t where fc_synonim = 'REGOSPITAL_EXTR';
  select max(t.fk_id) into vSMID_TYPE_V_MU from asu.tsmid t where fc_synonim = 'TYPE_V_MU';
  select max(t.fk_id) into vSMID_DOP_ISHOD_PARENT_S from asu.tsmid t where fc_synonim = 'DOP_ISHOD_PARENT_S';

  insert into asu.tsluch_dbf
  ( YEAR,
    MONTH,
    OWN,
    TER_OKATO,
    LPU_ID,
    LPU_NAPR,
    LPU_INTR,
    PERSON_IDL,
    ID_ILL,
    P_ID_ILL,
    POLICYSER,
    POLICYNUM,
    VID_P,
    FAM,
    IM,
    OTCH,
    DATE_B_DAY,
    POL,
    DIA_SD,
    DIA_O,
    DIA_C,
    DIA_E,
    DATE_S,
    DATE_E,
    N_MAP,
    N_MAP_AMB,
    N_NAPR,
    DATE_NAPR,
    Q_U,
    V_MU,
    PR_MP,
    TYPE_MP,
    TYPE_V_MU,
    DESTROY,
    OPER_ID,
    NARKOZ_ID,
    Q_Z,
    PRVS,
    RES_G,
    RESG_DOP,
    DISP,
    NOVOR,
    FAMP,
    IMP,
    OTP,
    POLP,
    DRP,
    C_DOC,
    S_DOC,
    N_DOC,
    Q_OGRN,
    MR,
    SNILS,
    OKATOG,
    OKATOP,
    AMB_PR,
    Z$FL_POLY,
    FK_ID,
    FK_PACID,
    fk_uslvidid)
  SELECT tu.YEAR,
         tu.MONTH,
         tu.OWN,

         -- GET_THEIR_ID_ELSELOG вовращает числовой код TER_OKATO, если код меньше 5, то он дополняется нулями слева
         LPAD(to_char(exch43.pkg_exchcache.GET_THEIR_ID_ELSELOG(GET_HOMS_COMPANYID, 'TER_OKATO', 'TREGION', c.fk_regionid,
                                                                'asu.tsluch_dbf', tu.fk_sluchid, 'TER_OKATO')), 5, '0') TER_OKATO,
         tu.LPU_ID,

         null LPU_NAPR,

         tu.lpu_intr LPU_INTR,
         tu.PERSON_IDL,
         tu.ID_ILL,
         tu.P_ID_ILL,
         substr(c.fc_ser, 1, 10) POLICYSER,
         decode(asu.EXCH_DBF_EPN_TO_POLICYNUM,
                0, substr(c.fc_num, 1, 20),
                decode(exch43.pkg_exchcache.GET_THEIR_ID(asu.GET_HOMS_COMPANYID, 'OMS_DOC_TYPE', 'TSMID', c.fk_typeoms),
                       3, decode(c.fc_enp, null, substr(c.fc_num, 1, 20), substr(c.fc_enp, 1, 20)),
                       substr(c.fc_num, 1, 20))) POLICYNUM, -- http://192.168.1.9/redmine/issues/23924 15.Необходимо для случаев, у которых тип полиса "нового образца" (exch43.pkg_exchcache.GET_THEIR_ID(asu.GET_HOMS_COMPANYID, 'OMS_DOC_TYPE', 'TSMID', c.fk_typeoms) = 3) в поле POLICYNUM выводить не номер полиса, а значение из поля ЕНП
         exch43.pkg_exchcache.GET_THEIR_ID_ELSELOG(asu.GET_HOMS_COMPANYID, 'OMS_DOC_TYPE', 'TSMID', c.fk_typeoms,
                                                   'asu.tsluch_dbf', tu.fk_sluchid, 'VID_P') VID_P,

         substr(decode(nvl(length(ti.fc_fam), 0) + nvl(length(ti.fc_im), 0) + nvl(length(ti.fc_otch), 0), 0, tp.fc_fam, ti.fc_fam), 1, 25) FAM,
         substr(decode(nvl(length(ti.fc_fam), 0) + nvl(length(ti.fc_im), 0) + nvl(length(ti.fc_otch), 0), 0, tp.fc_im, ti.fc_im), 1, 25) IM,
         substr(nvl(decode(nvl(length(ti.fc_fam), 0) + nvl(length(ti.fc_im), 0) + nvl(length(ti.fc_otch), 0), 0, tp.fc_otch, ti.fc_otch), ' '), 1, 25) OTCH,
         trunc(tp.fd_rojd) DATE_B_DAY,
         DECODE(tp.FP_SEX, 0, 'Ж', 'М') POL,

         nvl(decode((select MAX(ti.fk_smid) from asu.tib ti
                      where ti.fk_smeditid = asu.GET_SMID_PD_NAPRAVIV_YCH
                        and ti.fk_pacid = c.fk_pacid),
                     null,
                     asu.GET_DIAG_BY_TYPE(c.fk_pacid, 'NA_OSMOTRE', 'MAIN'),
                     asu.GET_DIAG_BY_TYPE(c.fk_pacid, 'S_MESTA_OTBORA', 'MAIN')),
             c.fc_icd)DIA_SD,
         asu.GET_DIAG_BY_TYPE(c.fk_pacid, 'PRI_VYPISKE', 'OSLOG_MAIN') DIA_O,
         nvl(asu.GET_DIAG_BY_TYPE(c.fk_pacid, 'PRI_VYPISKE', 'SOPUT'), asu.GET_DIAG_BY_TYPE(c.fk_pacid, 'CLINIK', 'SOPUT')) DIA_C,
         c.fc_icd DIA_E,

         tu.date_b_u DATE_S,
         tu.date_e_u DATE_E,

         tk.fk_ibid N_MAP,
         null N_MAP_AMB,

         null N_NAPR,
         null DATE_NAPR,

  -- ЗНАЧЕНИЯ ПОЛЯ Q_U:
  --   1 - СТАЦИОНАР
  --   2 - ПОЛИКЛИНИКА
  --   3 - ДНЕВНОЙ СТАЦИОНАР
  --   4 - СТАЦИОНАР ПЛАНОВЫЙ (НЕ ИСПОЛЬЗУЕТСЯ HTTP://192.168.1.2:15000/REDMINE/ISSUES/SHOW/9306)
  --   5 - СТАМОТОЛОГИЧЕСКАЯ
  --   6 - ЦЕНТРЫ ЗДОРОВЬЯ (ДОБАВЛЕН HTTP://192.168.1.9/REDMINE/ISSUES/13592)
         tu.TYPE_USL Q_U,

         tu.V_MU,
         tu.PR_MP,

         null TYPE_MP,
         null TYPE_V_MU,
         null DESTROY,

         0 OPER_ID, -- тут только иницуиализируется нулём
         null NARKOZ_ID,

         EXCH43.pkg_exchcache.GET_THEIR_ID_ELSELOG(GET_HOMS_COMPANYID, 'KH_ZABOL', 'TSMID', c.FL_FIRST, 'asu.tsluch_dbf', tu.fk_sluchid, 'Q_Z') Q_Z, -- позже
         tu.prvsm_u PRVS,
         EXCH43.pkg_exchcache.GET_THEIR_ID_ELSELOG(asu.GET_HOMS_COMPANYID, decode(c.fl_isds, 1, 'REZOBR_DS', 'REZOBR_S'), 'TSMID', STAT.Pkg_Statkart.GET_PAC_RESGOSP(c.fk_pacid), 'asu.tsluch_dbf', tu.fk_sluchid, 'RES_G') RES_G,

         null RESG_DOP,

         4 DISP, -- Для стационара всегда выбирается пункт 4- не состоял, не поставлен
         0 NOVOR,
         null FAMP,
         null IMP,
         null OTP,
         null POLP,
         null DRP,
         decode(c.pr_own,
                2,
                exch43.pkg_exchcache.GET_THEIR_ID_ELSELOG(asu.GET_HOMS_COMPANYID, 'MTRVDK', 'TVIDDOC', tk.fk_docvid, 'asu.tsluch_dbf', tu.fk_sluchid, 'C_DOC'),
                null) C_DOC,
         substr(tp.fc_docser, 1, 9) S_DOC,
         substr(tp.fc_docnum, 1, 8) N_DOC,
         decode(c.pr_own, 2, c.fc_ogrn, null) Q_OGRN,
         substr(tp.fc_rojdplace, 1, 100) MR,
         decode(substr(tp.fc_snils, 1, 14), '   -   -      ', '', substr(tp.fc_snils, 1, 14)) SNILS,

         null OKATOG,
         null OKATOP,

         null AMB_PR,
         0 Z$FL_POLY,
         tu.fk_sluchid FK_ID,

         tu.fk_pacid FK_PACID,
         c.fk_uslvidid
    FROM asu.tusl_dbf tu
   inner join asu.tsluch_dbf_calc C on c.id_ill = tu.id_ill
                                   AND (c.p_id_ill is null or tu.p_id_ill is null or nvl(c.p_id_ill, -1) = nvl(tu.p_id_ill, -1)) -- Если p_id_ill задан и в таблице услуг и в таблице предварительного расчёта, то они должны совпадать, если хотя бы один из них не задан, то совпадение не обязательно
   inner join asu.tpeoples tp on tp.fk_id = c.fk_peplid
   inner join asu.tkarta tk on tk.fk_id = c.fk_pacid
    left join ASU.TOFOMS_INFO ti on ti.fk_insuranceid = c.FK_INSURDOCID;

  for c in (
    select c.fk_id,
           ti_lpu_napr.fk_smid ti_lpu_napr_smid,
           ti_N_NAPR.fc_char ti_N_NAPR_char,
           ti_DATE_NAPR.fd_date ti_DATE_NAPR_date,
           ti_TYPE_MP.fc_synonim ti_TYPE_MP_synonim ,
           ti_TYPE_V_MU.fk_smid ti_TYPE_V_MU_smid,
           ti_DESTROY.fk_smid ti_DESTROY_smid,
           ti_dopishod.fk_smid ti_dopishod_smid
      from asu.tsluch_dbf c
      left join (select ti.fk_pacid, ti.fk_smid from asu.tib ti where ti.fk_smeditid = asu.GET_SMID_PD_NAPRAVIV_YCH) ti_lpu_napr on ti_lpu_napr.fk_pacid = c.fk_pacid
      left join (select ti.fk_pacid, ti.fc_char from asu.tib ti where ti.fk_smeditid = vSMID_PD_NOMER_NAPR) ti_N_NAPR on ti_N_NAPR.fk_pacid = c.fk_pacid
      left join (select ti.fk_pacid, ti.fd_date from asu.tib ti where ti.fk_smeditid = vSMID_PD_DATA) ti_DATE_NAPR on ti_DATE_NAPR.fk_pacid = c.fk_pacid
      left join (select ti.fk_pacid, ts.fc_synonim
                   from asu.tib ti
                  inner join asu.tsmid ts on ts.fk_id = ti.fk_smid
                  where ti.fk_smeditid = vSMID_REGOSPITAL_EXTR) ti_TYPE_MP on ti_TYPE_MP.fk_pacid = c.fk_pacid
      left join (select ti.fk_pacid, ti.fk_smid from asu.tib ti where ti.fk_smeditid = vSMID_TYPE_V_MU) ti_TYPE_V_MU on ti_TYPE_V_MU.fk_pacid = c.fk_pacid
      left join (select ti.fk_pacid, ti.fk_smid
                   from asu.tib ti
                  inner join asu.TSMID_PD_TRAVM ts on ts.fk_id = ti.fk_smid) ti_DESTROY on ti_DESTROY.fk_pacid = c.fk_pacid
      left join (select fk_pacid, fk_smid from asu.tib where fk_smeditid = vSMID_DOP_ISHOD_PARENT_S) ti_dopishod on ti_dopishod.fk_pacid = c.fk_pacid
     where c.Z$FL_POLY = 0
--     group by c.fk_id, ti_lpu_napr.fk_smid, ti_N_NAPR.fc_char, ti_DATE_NAPR.fd_date, ti_TYPE_MP.fc_synonim, ti_TYPE_V_MU.fk_smid, ti_DESTROY.fk_smid, ti_dopishod.fk_smid
  )
  loop
    update asu.tsluch_dbf t set (LPU_NAPR, N_NAPR, DATE_NAPR, TYPE_MP, TYPE_V_MU, DESTROY, RESG_DOP) =
      (SELECT EXCH43.pkg_exchcache.GET_THEIR_ID_ELSELOG(GET_HOMS_COMPANYID, 'LPU', 'TSMID', c.ti_lpu_napr_smid, 'asu.tsluch_dbf', t.fk_id, 'LPU_NAPR') LPU_NAPR,
              decode(c.ti_lpu_napr_smid, null, null, nvl(substr(c.ti_n_napr_char, 1, asu.GET_COLUMN_LEN('ASU', 'TSLUCH_DBF', 'N_NAPR')), 'СОГЛ')) N_NAPR,
              decode(c.ti_lpu_napr_smid, null, null, nvl(trunc(c.ti_DATE_NAPR_date), t.date_s)) DATE_NAPR,
              decode(c.ti_TYPE_MP_synonim, 'REGOSPITAL_EXTR', 2, 1) TYPE_MP,
              exch43.pkg_exchcache.GET_THEIR_ID_ELSELOG(asu.GET_HOMS_COMPANYID, 'TYPE_PMSP', 'TSMID', c.ti_TYPE_V_MU_smid, 'asu.tsluch_dbf', t.fk_id, 'TYPE_V_MU') TYPE_V_MU,
              EXCH43.pkg_exchcache.GET_THEIR_ID_ELSELOG(asu.GET_HOMS_COMPANYID, 'DESTROY', 'TSMID', c.ti_DESTROY_smid, 'asu.tsluch_dbf', t.fk_id, 'DESTROY') DESTROY,
              EXCH43.pkg_exchcache.GET_THEIR_ID_ELSELOG(asu.GET_HOMS_COMPANYID, decode(Q_U, 3, 'REZOBR_DOP_DS', 'REZOBR_DOP_S'), 'TSMID', c.ti_dopishod_smid, 'asu.tsluch_dbf', t.fk_id, 'RESG_DOP') RESG_DOP -- Q_U = 3 - дневной стационар
         from dual)
     where t.fk_id = c.fk_id;
  end loop;

  -- http://192.168.1.9/redmine/issues/22218 пункт 10 По предложению Маши Коваленко для всех переводов, кроме последнего, относящихся к одной карте, всегда RES_G = 104 и RESG_DOP = 104, для последнего значения остаются как в статкарте
/*
  for c in (select c.fk_id
              from (select c.fk_id,
                           LAST_VALUE(c.fk_id) OVER(PARTITION BY c.fk_pacid ORDER BY c.date_e, c.fk_id ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) fk_id_last
                      from asu.tsluch_dbf c
                     where c.Z$FL_POLY = 0) c
              where c.fk_id < c.fk_id_last)
*/
-- 20130607 по предложению Маши Коваленко последний период (тот для которого RES_G и RESG_DOP берутся из статкарты),
-- определяется не тольког на основе периодов попавших в текущую выгрузку. но на основе всех периоов карты
  for c in (select c.fk_id, c.q_u
              from (select c.fk_id,
                           c.id_ill,
                           tp.fk_id fk_pereselid,
                           c.fk_pacid,
                           c.q_u,
                           LAST_VALUE(tp.fk_id) OVER(PARTITION BY tp.fk_pacid ORDER BY tp.fd_data2, tp.fk_id ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) fk_pereselid_last
                      from asu.tsluch_dbf c
                     inner join asu.tperesel tp on tp.fk_pacid = c.fk_pacid
                     where c.Z$FL_POLY = 0) c
             where c.id_ill = c.fk_pereselid and c.fk_pereselid <> c.fk_pereselid_last)
  loop
    if c.q_u = 3 then -- дневной стационар
      update asu.tsluch_dbf t set t.RES_G = 204, t.RESG_DOP = 204 where t.fk_id = c.fk_id; -- Для дневного стационара
    else
      update asu.tsluch_dbf t set t.RES_G = 104, t.RESG_DOP = 104 where t.fk_id = c.fk_id;
    end if;
  end loop;

  -- Для гемодиализа кол-во зависит от назначений
  for c in (
      select tu.fk_id, count(*) kol_eo
        FROM ASU.TUSL_DBF TU
       INNER JOIN ASU.TSLUCH_DBF TS ON TS.FK_ID = TU.FK_SLUCHID
       INNER JOIN ASU.TPERESEL TP ON TP.FK_ID = TS.ID_ILL
       INNER JOIN ASU.VNAZ N ON N.Fk_Pacid = tp.fk_pacid
       WHERE TU.Z$FL_POLY = 0
         AND TS.DIA_E = 'N18.0'
         AND TU.TYPE_USL = 3
         and N.FK_NAZSOSID = ASU.GET_VYPNAZSOSID
         AND N.FK_SMID in (asu.get_smid_hemodial, asu.get_smid_hemodial_pr) -- на хантах get_smid_hemodial = 1004176
       group by tu.fk_id)
  loop
    update asu.tusl_dbf t set t.kol_eo = c.kol_eo, t.sum_eo = t.cost_eo * c.kol_eo where t.fk_id = c.fk_id;
  end loop;
 end;

 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 procedure ClearLog is
 pragma autonomous_transaction;
 begin
   delete from ASU.TDBFEXCH_LOG;
   commit;
 end;
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 procedure AddLog(pSTART DATE, pACTION varchar2, pFUNCTION varchar2) is
 pragma autonomous_transaction;
 begin
   insert into ASU.TDBFEXCH_LOG(FD_START, FC_ACTION, FC_FUNCTION) values(pSTART, pACTION, pFUNCTION);
   commit;
 end;
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 FUNCTION GET_IS_POLY(pSluchID IN asu.tsluch_dbf.fk_id%TYPE) RETURN NUMBER IS
   vIS_POLY NUMBER;
 BEGIN
   select max(t.z$fl_poly) into vIS_POLY from asu.tsluch_dbf t where t.fk_id = pSluchID;
   return vIS_POLY;
 END;
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 FUNCTION GET_IS_POLY_BY_NAZ(pUslId IN asu.tusl_dbf.fk_id%TYPE) RETURN NUMBER IS
   vIS_POLY NUMBER;
 BEGIN
   select max(tu.z$fl_poly) into vIS_POLY from asu.tusl_dbf tu
    where tu.fk_id = pUslId;
   return vIS_POLY;
 END;
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 FUNCTION GET_ID_ILL(pSluchID IN asu.tsluch_dbf.fk_id%TYPE) RETURN NUMBER IS
   vID_ILL NUMBER;
 BEGIN
   select max(t.ID_ILL) into vID_ILL from asu.tsluch_dbf t where t.fk_id = pSluchID;
   return vID_ILL;
 END;
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 FUNCTION GET_ID_ILL_BY_NAZ(pUslId IN asu.tusl_dbf.fk_id%TYPE) RETURN NUMBER IS
   vID_ILL NUMBER;
 BEGIN
   select max(tu.ID_ILL) into vID_ILL from asu.tusl_dbf tu
    where tu.fk_id = pUslId;
   return vID_ILL;
 END;
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 function  GetDIA_E(aSluchID asu.tsluch_dbf.fk_id%type) return VARCHAR2 is
   vDIA_E asu.tsluch_dbf.dia_e%TYPE;
 begin
   select Max(DIA_E) into vDIA_E from asu.tsluch_dbf where fk_id = aSluchID;

   return vDIA_E;
 end;
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 PROCEDURE CLEAR_TABLES IS
  -- Очищаем временные таблицы, заполняем переменные
 BEGIN
  EXECUTE IMMEDIATE('truncate table asu.TUSLNOCOMPARE');
  EXECUTE IMMEDIATE('truncate table asu.texchange_elselog');
  EXECUTE IMMEDIATE('truncate table asu.tsluch_dbf');
  EXECUTE IMMEDIATE('truncate table asu.tusl_dbf');
  DELETE FROM asu.TEXSLUCH_ERR t where t.fn_is_load <> 1;
 END;
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 PROCEDURE FILL_CACHE IS
 pragma autonomous_transaction;
 BEGIN
  SELECT MAX(FC_VALUE)
    INTO lpu_code
    FROM asu.tsmini
   WHERE fc_section = 'EXCHANGE'
     AND fc_key = 'FOMS_LPU_CODE';

  EXCH43.PKG_ExchCache.ReFillExchCache;

  -- Efimov V.A. 20120411 http://192.168.1.9/redmine/issues/20803 К физиопроцедурам теперь относятся услуги не только из ветки 'PROC_FIZTER', но и из 'GIPER_OXYGEN'
  delete from asu.tsmid_fizter;
  insert into asu.tsmid_fizter
  select ts.fk_id
    from asu.tsmid ts
   where ts.fl_del = 0
  connect by prior ts.fk_id = ts.fk_owner
   start with ts.fc_synonim in ('PROC_FIZTER', 'GIPER_OXYGEN');

  -- Efimov V.A. 20120411 http://192.168.1.9/redmine/issues/20803 К стоматологическим теперь относятся услуги не только из ветки 'PROC_STOM_USL', но и из 'STOM_KONS'
  delete from asu.tsmid_dent;
  insert into asu.tsmid_dent(FK_ID, FN_EDCHILD, FN_ED)
  select ts.FK_ID, ts.FN_EDCHILD, ts.FN_ED
    from asu.tsmid ts
   where ts.fl_del = 0
  connect by prior ts.fk_id = ts.fk_owner
   start with ts.fc_synonim in ('PROC_STOM_USL', 'STOM_KONS');

  delete from ASU.TSMID_KONS_SPEC;
  insert into ASU.TSMID_KONS_SPEC(FK_ID, FC_SYNONIM, FN_DISP_STAGE)
  SELECT ns.fk_id, NS.FC_SYNONIM, decode(substr(NS.FC_SYNONIM, 1, 11), 'KONS_DISP_1', 1, 'KONS_DISP_2', 2, 0) KONS_DISP
      FROM ASU.TSMID NS
     WHERE NS.FK_OWNER = (SELECT TS.FK_ID FROM ASU.TSMID TS WHERE TS.FC_SYNONIM = 'KONS_SPEC');
--  SELECT ns.fk_id, NS.FC_SYNONIM, DECODE(NS.FC_SYNONIM, 'KONS_DISP_1', 1, 'KONS_DISP_2', 1, 0) KONS_DISP
--    FROM ASU.TSMID NS
--   WHERE NS.FK_OWNER = (SELECT TS.FK_ID FROM ASU.TSMID TS WHERE TS.FC_SYNONIM = 'KONS_SPEC');

  delete from ASU.TSMID_PD_TRAVM;
  insert into ASU.TSMID_PD_TRAVM(FK_ID, FC_NAME)
  SELECT FK_ID, FC_NAME FROM asu.TSMID CONNECT BY PRIOR FK_ID = FK_OWNER START WITH FC_SYNONIM = 'PD_TRAVM';

  delete from ASU.TSMID_OPER;
  insert into ASU.TSMID_OPER(FK_ID)
  Select ts.fk_id
    from asu.tsmid ts
   where (fl_del <> 1 or fl_del is null)
     and ts.fc_synonim in ('KONS_PROTHOPER', 'RENTGENXIR_OPER', 'ABORT', 'UROLOG_OPER');

  delete from ASU.TSMID_NARCOSIS;
  insert into ASU.TSMID_NARCOSIS(FK_ID)
  SELECT fk_id FROM asu.tsmid WHERE fk_owner = stat.pkg_statutil.get_smidid('PROTHOPER_OBEZBOL');

  delete from asu.tsmid_nodbfexch;
  insert into asu.tsmid_nodbfexch
  select ts.fk_id
    from asu.tsmid ts
   where ts.fl_del = 0
  connect by prior ts.fk_id = ts.fk_owner
   start with ts.fk_id in (select FC_ASKID
                             from asu.treplytable
                            where FC_ASK = 'ASU.TSMID'
                              and FC_ASKFIELD = 'FK_ID'
                              and FC_REPLY = 'DBF_EXCH_NO_EXCH_SMID'
                              and FC_REPLYFIELD = 'FL_CHECK');

  delete from asu.tsmid_tooth;
  insert into asu.tsmid_tooth
  SELECT s.fk_id, s.fk_owner, s.fc_name, LEVEL fn_level
    FROM asu.tsmid s
 CONNECT BY PRIOR fk_id = fk_owner
   START WITH s.fc_synonim = 'TOOTH_FORMULA';

  delete from asu.ticd10_dbf_exch;
  insert into asu.ticd10_dbf_exch(fc_key, fc_kod)
  select 'S00-T98' fc_key, fc_kod
          from asu.ticd10 t
        connect by prior t.fk_id = t.fk_parent
         start with t.fc_KOD = 'S00-T98'
  union all
  select 'Z00_Z01_Z02' fc_key, fc_kod
          from asu.ticd10 t
        connect by prior t.fk_id = t.fk_parent
         start with t.fc_KOD in ('Z00', 'Z01', 'Z02')
  union all
  select 'Z34_Z35' fc_key, fc_kod
          from asu.ticd10 t
        connect by prior t.fk_id = t.fk_parent
         start with t.fc_KOD in ('Z34', 'Z35');

  commit;
 END;

 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 -- pUseStorage - 1- загружать данные из хранилища, 0 - все данные будут перещитаны, вне зависимости от того есть они в хранилище или нет
 -- pFillMode - 0 - данные берутся из базы на основании параметров + обязательно добавляюся все отмеченные для перерасчёта,
 --             1 - только данные полученные из базы на основании параметров
 --             2 - только данные отмеченные для перерасчёта (select c.id_ill from asu.tsluch_dbf_calc c where c.fn_action = 2)

 procedure FILL_SLUCH_DBF_CALC(pBeg DATE, pEnd DATE, pAddUnExSluch NUMBER, pAddSluchByYear NUMBER default 1,
                               pSluchType NUMBER default 0,
                               pUseStorage integer default 0,
                               pUseTDBFEXCH_TYPE_V_MU integer default 1) IS
   v_TYPE_V_MU_count Number;
   vID_ILL Number;
 BEGIN
   vYEAR := to_char(pBeg, 'YYYY');
   vMONTH := to_char(pBeg, 'MM');

  -- Заполняется таблица ID_ILL случаев, определяется какие случаи будут взяты из хранилица, а какие рассчитаны заново
  delete from asu.tsluch_dbf_calc;

  if pSluchType in (0, 2) then -- стационарные случаи
    insert into asu.tsluch_dbf_calc (id_ill, p_id_ill, fl_fromstor, fl_poly, fk_pacid, fd_date1, fd_date2)
    select tp.fk_id id_ill, p_id_ill, 0 fl_fromstor, 0 fl_poly, tp.fk_pacid, tp.fd_data1, tp.fd_data2
      from (SELECT tp.fk_id, tp.fd_data1, tp.fd_data2, tp.fk_pacid, tp.p_id_ill
              from (SELECT tpa.fk_id, tpa.fd_data1, tpa.fd_data2, tpa.fk_pacid, tes.p_id_ill
                      FROM ASU.TSROKY S
                     inner join asu.tperesel tp on tp.fk_pacid = s.fk_pacid
                     inner JOIN (select tes.ID_ILL, tes.p_id_ill, tes.fd_opened, tes.fd_closed
                                  from asu.texsluch tes
                                 where tes.fl_cancel = 1
                                   and pAddUnExSluch = 1) tes on tes.id_ill = tp.FK_ID
                      left join asu.tperesel tpa on tpa.fk_pacid = tp.fk_pacid
                                                and TRUNC(tpa.fd_data1) BETWEEN TRUNC(tes.fd_opened) AND TRUNC(tes.fd_closed)
                                                and TRUNC(tpa.fd_data2) BETWEEN TRUNC(tes.fd_opened) AND TRUNC(tes.fd_closed)
                     WHERE S.FK_PRYB IN (3, 7)

                    union
                    SELECT tp.fk_id, tp.fd_data1, tp.fd_data2, tp.fk_pacid, tes.p_id_ill
                     FROM ASU.TSROKY S
                    inner join asu.tperesel tp on tp.fk_pacid = s.fk_pacid
                    inner JOIN (select tes.ID_ILL, tes.p_id_ill
                                 from asu.texsluch tes
                                where tes.fl_cancel = 1
                                  and pAddUnExSluch = 1) tes on tes.id_ill = s.fk_pacid
                    WHERE S.FK_PRYB IN (3, 7)

                    union
                    SELECT tp.fk_id, tp.fd_data1, tp.fd_data2, tp.fk_pacid, null p_id_ill
                      FROM ASU.TSROKY S
                     inner join asu.tperesel tp on tp.fk_pacid = s.fk_pacid
                     WHERE S.FK_PRYB IN (3, 7)
                       AND TRUNC(S.FD_DATA1) BETWEEN TRUNC(pBeg) AND TRUNC(pEnd)

                    union
                    SELECT tp.fk_id, tp.fd_data1, tp.fd_data2, tp.fk_pacid, null p_id_ill
                      FROM (SELECT tp.fk_id,
                                   tp.fd_data1,
                                   tp.fd_data2,
                                   tp.fk_pacid,
                                   MAX(CASE
                                         WHEN te.id_ill IS NOT NULL AND trunc(tp.fd_data1) BETWEEN te.fd_opened AND te.fd_closed THEN
                                          1
                                         ELSE
                                          0
                                       END) is_exch
                              FROM ASU.TSROKY S
                             INNER JOIN asu.tperesel tp ON tp.fk_pacid = s.fk_pacid
                              LEFT JOIN asu.texsluch tes ON tes.id_ill = tp.FK_ID
                              LEFT JOIN asu.tperesel tpk ON tpk.fk_pacid = tp.fk_pacid
                                                        AND tpk.fk_id <> tp.fk_id
                              LEFT JOIN asu.texsluch te ON te.id_ill = tpk.FK_ID
                             WHERE S.FK_PRYB IN (3, 7)
                               AND tes.id_ill IS NULL
                               AND pAddSluchByYear = 1
                               AND TRUNC(S.FD_DATA1) BETWEEN TRUNC(to_date('01.01.' || to_char(pEnd, 'YYYY'), 'dd.mm.yyyy')) AND TRUNC(pBeg - 1)
                             GROUP BY tp.fk_id, tp.fd_data1, tp.fd_data2, tp.fk_pacid) tp
                     WHERE is_exch = 0
                   ) tp
             group by tp.fk_id, tp.fd_data1, tp.fd_data2, tp.fk_pacid, tp.p_id_ill) tp
     left join asu.tperesel_diag tpd on tpd.fk_peresel = tp.fk_id
    where ASU.PKG_SMINI.READSTRING('CONFIG', 'DB_NAME', 'H') = 'SK' or tpd.fk_peresel is not null;
  end if;

  if pSluchType in (0, 1) then -- амбулаторные случаи
    insert into asu.TSLUCH_DBF_CALC (id_ill, p_id_ill, fl_fromstor, fd_date1, fd_date2, fc_icd, fk_pacid, fl_poly,
                                     PR_OWN, FC_CODE, FN_COST, FK_KOYKAVIDID, FK_PALATAID, FK_REGIONID, FC_TYPEDOC_SYN, FK_USLVIDID,
                                     fc_ser, fc_num, fk_companyid, fc_ogrn,
                                     fk_peplid, FK_INSURDOCID, fk_typeoms, fl_under18, fl_isds, fl_first, fk_otdelid, fk_smid)
    select t.fk_id id_ill, max(t.p_id_ill) p_id_ill, 0 fl_fromstor, max(t.fd_opened) fd_date1, max(t.fd_closed) fd_date2, null fc_icd, t.fk_id fk_pacid, 1 fl_poly,
           null PR_OWN, null FC_CODE, null FN_COST, null FK_KOYKAVIDID, null FK_PALATAID, null FK_REGIONID, null FC_TYPEDOC_SYN, null FK_USLVIDID,
           null fc_ser, null fc_num, null fk_companyid, null fc_ogrn,
           null fk_peplid, null FK_INSURDOCID, null fk_typeoms, null fl_under18, null fl_isds, null fl_first, null fk_otdelid, null fk_smid
      from (SELECT t.FK_ID, t.fd_opened, t.fd_closed, tes.p_id_ill, t.FK_REASON
              FROM asu.TAMBTALON t
             inner JOIN (select tes.ID_ILL, tes.p_id_ill
                           from asu.texsluch tes_pr
                          inner join asu.texsluch tes on (tes.ID_ILL = tes_pr.ID_ILL and nvl(tes.p_id_ill, -1) = nvl(tes_pr.p_id_ill, -1))
                                                      or (tes.ID_ILL_GR = tes_pr.ID_ILL and nvl(tes.p_id_ill_GR, -1) = nvl(tes_pr.p_id_ill, -1))
                          where tes_pr.fl_cancel = 1 and pAddUnExSluch = 1) tes on tes.id_ill = t.FK_ID
             WHERE T.FN_SOS = 1

            union all
            SELECT t.FK_ID, t.fd_opened, t.fd_closed, null p_id_ill, t.FK_REASON
              FROM asu.TAMBTALON t
             WHERE T.FN_SOS = 1
               AND TRUNC(T.FD_CLOSED) BETWEEN TRUNC(pBeg) AND TRUNC(pEnd)

            union all
            SELECT t.FK_ID, t.fd_opened, t.fd_closed, null p_id_ill, t.FK_REASON
              FROM asu.TAMBTALON t
              left JOIN (select tes.ID_ILL, tes.p_id_ill
                           from asu.texsluch tes_pr
                          inner join asu.texsluch tes on (tes.ID_ILL = tes_pr.ID_ILL and nvl(tes.p_id_ill, -1) = nvl(tes_pr.p_id_ill, -1))
                                                      or (tes.ID_ILL_GR = tes_pr.ID_ILL and nvl(tes.p_id_ill_GR, -1) = nvl(tes_pr.p_id_ill, -1))
                          where
                            to_date('01.' || tes_pr.month || '.' || tes_pr.year, 'dd.mm.yyyy') < TRUNC(pBeg)) tes on tes.id_ill = t.FK_ID
             WHERE T.FN_SOS = 1
               and tes.id_ill is null
               AND pAddSluchByYear = 1
               and TRUNC(T.FD_CLOSED) BETWEEN
                   TRUNC(to_date('01.01.' || to_char(pEnd, 'YYYY'), 'dd.mm.yyyy')) AND TRUNC(pBeg - 1)) t
     left JOIN (SELECT r.FC_ASKID FK_REASON
                  FROM asu.treplytable r
                 WHERE r.FC_ASK = 'ASU.TSMID'
                   AND r.FC_ASKFIELD = 'FK_ID'
                   AND r.FC_REPLY = 'DBF_EXCH_NO_EXCH_AMBTALON_REASON'
                   AND r.FC_REPLYFIELD = 'FL_CHECK'
                 group by r.FC_ASKID) r ON r.FK_REASON = t.FK_REASON
     where r.FK_REASON  is null
     group by t.fk_id;

    if asu.GET_USLVID_ER > 0 then
      for t in (
        select t.fk_id id_ill, max(t.p_id_ill) p_id_ill, 0 fl_fromstor, max(t.fd_opened) fd_date1, max(t.fd_opened) fd_date2, null fc_icd, t.fk_id fk_pacid, 1 fl_poly,
               null PR_OWN, null FC_CODE, null FN_COST, null FK_KOYKAVIDID, null FK_PALATAID, null FK_REGIONID, null FC_TYPEDOC_SYN, null FK_USLVIDID,
               null fc_ser, null fc_num, null fk_companyid, null fc_ogrn,
               null fk_peplid, null FK_INSURDOCID, null fk_typeoms, null fl_under18, null fl_isds, null fl_first, null fk_otdelid, null fk_smid
          from (SELECT t.FK_ID, t.fd_opened, tes.p_id_ill
                  FROM asu.TAMBTALON t
                 inner join asu.tambulance tam on tam.fk_id = t.fk_ambid
                 inner join asu.tdocobsl td on td.fk_id = tam.fk_docobsl
                 inner JOIN (select tes.ID_ILL, tes.p_id_ill
                              from asu.texsluch tes
                             where (tes.fl_cancel = 1 and pAddUnExSluch = 1)) tes on tes.id_ill = t.FK_ID
                 where td.fk_viddocid = asu.GET_USLVID_ER
                   and T.FN_SOS = 1

                union all
                SELECT t.FK_ID, t.fd_opened, null p_id_ill
                  FROM asu.TAMBTALON t
                 inner join asu.tambulance tam on tam.fk_id = t.fk_ambid
                 inner join asu.tdocobsl td on td.fk_id = tam.fk_docobsl
                 WHERE td.fk_viddocid = asu.GET_USLVID_ER
                   and T.FN_SOS = 1
                   AND TRUNC(t.fd_opened) BETWEEN TRUNC(pBeg) AND TRUNC(pEnd)

                union all
                SELECT t.FK_ID, t.fd_opened, null p_id_ill
                  FROM asu.TAMBTALON t
                 inner join asu.tambulance tam on tam.fk_id = t.fk_ambid
                 inner join asu.tdocobsl td on td.fk_id = tam.fk_docobsl
                  left JOIN (select tes.id_ill from asu.texsluch tes where to_date('01.' || tes.month || '.' || tes.year, 'dd.mm.yyyy') < TRUNC(pBeg)) tes on tes.id_ill = t.FK_ID
                 WHERE td.fk_viddocid = asu.GET_USLVID_ER
                   and T.FN_SOS = 1
                   and tes.id_ill is null
                   AND pAddSluchByYear = 1
                   and TRUNC(t.fd_opened) BETWEEN
                       TRUNC(to_date('01.01.' || to_char(pEnd, 'YYYY'), 'dd.mm.yyyy')) AND TRUNC(pBeg - 1)
        ) t group by t.fk_id)
      loop
        select max(id_ill) into vID_ILL from asu.TSLUCH_DBF_CALC where id_ill = t.id_ill;

        if vid_ill is not null then
          update asu.TSLUCH_DBF_CALC set fd_date1 = t.fd_date2, fd_date2 = t.fd_date2 where id_ill = t.id_ill; -- Если талон уже был добалвен в выборку, но оказалось что  это скорая помощь, то дата его закрытия приравнивается к таде открытия (в t.fd_date2 это уже устено)
        else
          insert into asu.TSLUCH_DBF_CALC (id_ill, p_id_ill, fl_fromstor, fd_date1, fd_date2, fc_icd, fk_pacid, fl_poly,
                                           PR_OWN, FC_CODE, FN_COST, FK_KOYKAVIDID, FK_PALATAID, FK_REGIONID, FC_TYPEDOC_SYN, FK_USLVIDID,
                                           fc_ser, fc_num, fk_companyid, fc_ogrn,
                                           fk_peplid, FK_INSURDOCID, fk_typeoms, fl_under18, fl_isds, fl_first, fk_otdelid, fk_smid)
          select t.id_ill, t.p_id_ill, 0 fl_fromstor, t.fd_date1, t.fd_date2, null fc_icd, t.fk_pacid, 1 fl_poly,
                 null PR_OWN, null FC_CODE, null FN_COST, null FK_KOYKAVIDID, null FK_PALATAID, null FK_REGIONID, null FC_TYPEDOC_SYN, null FK_USLVIDID,
                 null fc_ser, null fc_num, null fk_companyid, null fc_ogrn,
                 null fk_peplid, null FK_INSURDOCID, null fk_typeoms, null fl_under18, null fl_isds, null fl_first, null fk_otdelid, null fk_smid
            from dual;
        end if;
      end loop;
    end if;
  end if;

  asu.EDIT_TSLUCH_DBF_CALC_EXTERNAL(pBeg, pEnd, pAddUnExSluch, pAddSluchByYear, pSluchType, pUseStorage, pUseTDBFEXCH_TYPE_V_MU);

  select count(*) into v_TYPE_V_MU_count from ASU.TDBFEXCH_TYPE_V_MU;

 -- Efimov V.A. 20120731 http://192.168.1.9/redmine/issues/19616 выгружаются только случаи, относящиеся к типу помощи "Специализированная медицинская помощь"
  if (v_TYPE_V_MU_count > 0) and (pUseTDBFEXCH_TYPE_V_MU > 0) then
    delete from asu.tsluch_dbf_calc t
     where not exists (select ts.fk_id
                         from asu.tsmid ts
                        inner join asu.tib ti on ti.fk_smid = ts.fk_id
                        inner join ASU.TDBFEXCH_TYPE_V_MU l on l.fk_id = ts.fk_id
                        where ti.fk_pacid = t.fk_pacid);
  end if;

   -- Если включено использование хранилища, для рассчитанных ранее записей устанавливаем соответсвующий признак
  if pUseStorage = 1 then
    update asu.tsluch_dbf_calc
       set fl_fromstor = 1
     where id_ill in (select id_ill from asu.tsluch_dbf_stor);
  end if;
 END;

 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 PROCEDURE FILL_FIRST_TABLE_DBF(pOMS_ONLY NUMBER default 1, pSluchType NUMBER default 0, pOWN NUMBER default 0) is
  -- Заполняем временную таблицу
 BEGIN
   -- формируется список сучаев (с дополнительными данными) соответствующих дополнетельным условиям
   DELETE FROM asu.TEXCHUPLOAD_TMP_DBF;

   if pSluchType in (0, 2) then -- стационарные случаи
     FILL_STAC(pOMS_ONLY, pOWN);
   end if;

   if pSluchType in (0, 1) then -- амбулаторные случаи
     INSERT INTO asu.TEXCHUPLOAD_TMP_DBF
     (FK_PACID,
      FK_TALONID,
      FK_PEPLID,
      FP_POLY,
      FN_YEAR,
      FN_MONTH,
      P_ID_ILL,
      OWN,
      POLICYSER,
      POLICYNUM,
      TFOMS_ID,
      SMK_ID,
      Q_OGRN,
      VID_P,
      fk_insurdocs,
      DATE_S,
      DATE_E,
      fk_uslvidid)
      SELECT --distinct
             K.FK_ID FK_PACID,
             c.FK_TALONID,
             K.FK_PEPLID FK_PEPLID,
             1 FP_POLY,
             vYEAR FN_YEAR,
             vMONTH FN_MONTH,
             null P_ID_ILL,
             decode(d.fc_synonim,
                    'OMS',
                    DECODE(cm.fk_regionid, ASU.GET_NATIVE_REGION, 1, 2),
                    'BUDZHET', 5,
                    3) own,
             substr(i.fc_ser, 1, 10) POLICYSER,
             decode(asu.EXCH_DBF_EPN_TO_POLICYNUM,
                    0, substr(i.fc_num, 1, 20),
                    decode(exch43.pkg_exchcache.GET_THEIR_ID(asu.GET_HOMS_COMPANYID, 'OMS_DOC_TYPE', 'TSMID', i.fk_typeoms),
                           3, decode(i.fc_enp, null, substr(i.fc_num, 1, 20), substr(i.fc_enp, 1, 20)),
                           substr(i.fc_num, 1, 20))) POLICYNUM, -- http://192.168.1.9/redmine/issues/23924 15.Необходимо для случаев, у которых тип полиса "нового образца" (exch43.pkg_exchcache.GET_THEIR_ID(asu.GET_HOMS_COMPANYID, 'OMS_DOC_TYPE', 'TSMID', c.fk_typeoms) = 3) в поле POLICYNUM выводить не номер полиса, а значение из поля ЕНП
             Cm.fk_regionid TFOMS_ID,
             Cm.fk_id SMK_ID,
             Cm.fc_ogrn Q_OGRN,
             i.fk_typeoms VID_P, --
             i.fk_id fk_insurdocs,
             TRUNC(c.FD_DATE1) DATE_S,
             TRUNC(c.FD_DATE2) DATE_E,
             k.fk_uslvidid
        FROM (select T.FK_ID FK_TALONID, c.id_ill, c.FD_DATE1, c.FD_DATE2, c.fl_poly, c.fk_regionid, PI.FK_PACID, max(PI.FK_INSURDOCID) FK_INSURDOCID, T.FK_AMBID, T.FK_INSURANCEID FK_INSURANCEID_TALON, t.fn_sos
                from asu.tsluch_dbf_calc c
               inner join asu.TAMBTALON t on t.fk_id = c.id_ill
                left join ASU.TPAC_INSURANCE pi on PI.FK_PACID = T.FK_AMBID
               where t.fn_sos = 1
                 and c.fl_poly = 1
               group by T.FK_ID, c.id_ill, c.FD_DATE1, c.FD_DATE2, c.fl_poly, c.fk_regionid, PI.FK_PACID, T.FK_AMBID, T.FK_INSURANCEID, t.fn_sos) c
       inner join ( -- Из TKARTA выбираются отказы в госпитализации
                   SELECT TKARTA.FK_ID, FK_PEPLID, fk_uslvidid
                     FROM asu.TKARTA
                   UNION ALL
                   SELECT A.FK_ID, A.FK_PEPLID, d.FK_VIDDOCID fk_uslvidid
                     FROM asu.TAMBULANCE A, asu.TDOCOBSL D
                    WHERE A.FK_DOCOBSL = D.FK_ID
                      ) K on K.FK_ID = c.FK_AMBID
        left join ASU.TINSURDOCS I on I.FK_ID = decode(c.FK_INSURANCEID_TALON, -1, c.FK_INSURDOCID, 0, c.FK_INSURDOCID, null, c.FK_INSURDOCID, c.FK_INSURANCEID_TALON)
        left join (select * from asu.TCOMPANY where fl_del = 0) Cm on Cm.FK_ID = I.FK_COMPANYID
        left join asu.ttypedoc d on d.fk_id = i.fk_typedocid --nvl(t.fk_oplata, i.fk_typedocid) Efimov V.A. 20110602 Стал использовать fk_oplata по предложению Насти Ковалёвой, но по предложению Маши КОваленко меняю обратно
       WHERE (pOMS_ONLY = 0 or (pOMS_ONLY = 1 and (d.fc_synonim = 'OMS'))) -- or (vDB_NAME = 'SK' and d.fc_synonim = 'BUDZHET')))) http://84.51.195.172:15000/redmine/issues/11844 пункт 6 условие,которое делали для кардио: если выбран бюджет но есть полис ОМС , то все равно случаи должны идти в выгрузку как по оМС - должно работать только для стационарных случаев.Т.е. если в амб талоне выбран бюджет, но есть поис - в выгрузку попадать не должно
         and (pOWN = 0 -- Efimov V.A. 20111103, добавлена возможность выбирать только местных или только не местных (http://192.168.1.9/redmine/issues/14015)
             or (pOWN = 1 and c.fk_regionid = ASU.GET_NATIVE_REGION)
             or (pOWN = 2 and (c.fk_regionid <> ASU.GET_NATIVE_REGION or c.fk_regionid is null)))
         and not exists (SELECT tsi.fc_value
                           FROM asu.TSMINI tsi
                           left join asu.tsmid ts on ts.fk_id = tsi.fc_value
                          WHERE tsi.FC_SECTION = 'EXCHANGE'
                            AND tsi.FC_KEY like 'NO_EXCH_USLVID_' || to_char(k.fk_uslvidid));

     -- Если включён режим только ОМС, то удалить все не ОМС (это удаление добавлено для кардио, т.е. только на Кардио часть бюджетов может выгружаться как ОМС. а часть нет)
     if pOMS_ONLY = 1 then
       delete from asu.TEXCHUPLOAD_TMP_DBF where own not in (1, 2);
     end if;
   end if;
 END;

 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 PROCEDURE DELETE_FROM_SLUCH_DBF_CALC IS
 BEGIN
   -- Из списка идентификаторов удаляются все строки, которых нет во временной таблице (т.е. те, что не прошли отбор по дополнитлеьным условиям)
--   delete from asu.tsluch_dbf_calc
--    where id_ill not in (select decode(FP_POLY, 1, fk_talonid, fk_pacid)
--                           from asu.TEXCHUPLOAD_TMP_DBF);
   delete from asu.tsluch_dbf_calc
       where fl_poly = 1 and not exists (select 1 from asu.TEXCHUPLOAD_TMP_DBF where decode(FP_POLY, 1, fk_talonid, fk_pacid) = id_ill);
 END;

 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 PROCEDURE ADD_MAIN_DATA IS
 BEGIN
  -- В список случаев, которые будут перерасчитаны попадают только случаи с соответствующей осеткой в tsluch_dbf_calc
  INSERT INTO asu.tsluch_dbf
    (FK_ID,
     id_ill,
     person_idl,
     YEAR,
     MONTH,
     lpu_id,
     Z$FL_POLY,
     DATE_S,
     DATE_E,
     OWN,
     POLICYSER,
     POLICYNUM,
     TER_OKATO,
--     SMO,
     Q_OGRN,
     VID_P,
     NOVOR,
     P_ID_ILL,
     fam,
     im,
     otch,
     date_b_day,
     pol,
     S_DOC,
     N_DOC,
     C_DOC,
     OPER_ID,
     fk_uslvidid
     )
    SELECT asu.seq_tsluch_dbf.nextval FK_ID,
           c.id_ill,
           f.fk_peplid,
           FN_YEAR,
           FN_MONTH,
           lpu_code,
           FP_POLY,
           DATE_S,
           DATE_E,
           OWN,
           substr(POLICYSER, 1, 10) POLICYSER,
           substr(POLICYNUM, 1, 20) POLICYNUM,
           LPAD(to_char(exch43.pkg_exchcache.GET_THEIR_ID_ELSELOG(GET_HOMS_COMPANYID, 'TER_OKATO', 'TREGION', TFOMS_ID,
                                                                  'asu.tsluch_dbf', asu.seq_tsluch_dbf.nextval, 'TER_OKATO')), 5, '0') TER_OKATO,
--           exch43.pkg_exchcache.GET_THEIR_ID_ELSELOG(asu.GET_HOMS_COMPANYID, 'SMO', 'TCOMPANY', SMK_ID,
--                                                     'asu.tsluch_dbf', asu.seq_tsluch_dbf.nextval, 'SMO') SMO,
           substr(decode(OWN, 2, Q_OGRN, null), 1, 15) Q_OGRN,
           exch43.pkg_exchcache.GET_THEIR_ID_ELSELOG(asu.GET_HOMS_COMPANYID, 'OMS_DOC_TYPE', 'TSMID', VID_P,
                                                     'asu.tsluch_dbf', asu.seq_tsluch_dbf.nextval, 'VID_P') VID_P,
           0,
           case when nvl(length(decode(ASU.PKG_SMINI.READSTRING('CONFIG', 'DB_NAME', 'H'),
                            'X',
                            null,
                            decode(c.P_ID_ILL,
                                   null,
                                   decode(DATE_E,
                                          null,
                                          TRUNC(MONTHS_BETWEEN(SYSDATE, DATE_S)) + 1,
                                          decode(TRUNC(MONTHS_BETWEEN(DATE_E, DATE_S)),
                                                 0,
                                                 null,
                                                 TRUNC(MONTHS_BETWEEN(SYSDATE, DATE_S)) + 1)),
                                   c.P_ID_ILL))), 0) > 2 then '99'
                else decode(ASU.PKG_SMINI.READSTRING('CONFIG', 'DB_NAME', 'H'),
                            'X',
                            null,
                            decode(c.P_ID_ILL,
                                   null,
                                   decode(DATE_E,
                                          null,
                                          TRUNC(MONTHS_BETWEEN(SYSDATE, DATE_S)) + 1,
                                          decode(TRUNC(MONTHS_BETWEEN(DATE_E, DATE_S)),
                                                 0,
                                                 null,
                                                 TRUNC(MONTHS_BETWEEN(SYSDATE, DATE_S)) + 1)),
                                   c.P_ID_ILL)) end P_ID_ILL,
           substr(decode(nvl(length(ti.fc_fam), 0) + nvl(length(ti.fc_im), 0) + nvl(length(ti.fc_otch), 0), 0, tp.fc_fam, ti.fc_fam), 1, 25) FAM,
           substr(decode(nvl(length(ti.fc_fam), 0) + nvl(length(ti.fc_im), 0) + nvl(length(ti.fc_otch), 0), 0, tp.fc_im, ti.fc_im), 1, 25) IM,
           substr(nvl(decode(nvl(length(ti.fc_fam), 0) + nvl(length(ti.fc_im), 0) + nvl(length(ti.fc_otch), 0), 0, tp.fc_otch, ti.fc_otch), ' '), 1, 25) OTCH,
           trunc(tp.fd_rojd) DATE_B_DAY,
           DECODE(tp.FP_SEX, 0, 'Ж', 'М') POL,
           substr(tp.fc_docser, 1, 9) S_DOC,
           substr(tp.fc_docnum, 1, 8) N_DOC,
           decode(OWN,
                  2,
                  exch43.pkg_exchcache.GET_THEIR_ID_ELSELOG(asu.GET_HOMS_COMPANYID, 'MTRVDK', 'TVIDDOC', tp.fk_docvid,
                                                            'asu.tsluch_dbf', asu.seq_tsluch_dbf.nextval, 'C_DOC'),
                  null) C_DOC,
           0 OPER_ID, -- тут только иницуиализируется нулём
           F.fk_uslvidid
      FROM asu.TEXCHUPLOAD_TMP_DBF F
     inner join asu.tsluch_dbf_calc C on c.id_ill = decode(f.FP_POLY, 1, f.fk_talonid, f.fk_pacid)
      left join asu.tpeoples tp on tp.fk_id = f.fk_peplid
      left join ASU.TOFOMS_INFO ti on ti.fk_insuranceid = f.Fk_Insurdocs
     where c.fl_fromstor = 0;

--  UPDATE asu.tsluch_dbf ts set ts.TER_OKATO = '0' || ts.TER_OKATO where length(ts.TER_OKATO) = 4;
 END;
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 PROCEDURE ADD_INSUR_AND_ALIEN_DATA(pSluchID IN asu.tsluch_dbf.fk_id%TYPE) IS
  -- Заполняем временную таблицу
  v_own       asu.tsluch_dbf.own%TYPE;

  vPeopleID asu.tpeoples.fk_id%TYPE;

  vOKATOG asu.tsluch_dbf.TFOMS_REG%TYPE;
  vOKATOP asu.tsluch_dbf.TFOMS_REG%TYPE;
  vTYPE_MP asu.tsluch_dbf.TYPE_MP%TYPE;

  vFK_KLADR ASU.TADRESS.FK_KLADR%TYPE;
  vFK_REGIONID NUMBER;
  vPacID asu.tkarta.fk_id%TYPE;

  vMR asu.tsluch_dbf.MR%TYPE;
  vSNILS asu.tsluch_dbf.SNILS%TYPE;

  vID_ILL number;
  vDB_NAME varchar(10);
  v_LPU_NAPR Number;
BEGIN
  vDB_NAME := ASU.PKG_SMINI.READSTRING('CONFIG', 'DB_NAME', 'H');

  vID_ILL := GET_ID_ILL(pSluchID);

  select max(tat.fk_ambid) into vPacID from asu.tambtalon tat where tat.fk_id = vID_ILL;

  select max(ta.fk_peplid) into vPeopleID from asu.tambulance ta where ta.fk_id = vPacID;
  if vPeopleID is null then
    select max(t.fk_peplid) into vPeopleID from asu.tkarta t where t.fk_id = vPacID;
  end if;

  select ts.own
    into v_own
    from asu.tsluch_dbf ts
   where ts.fk_id = pSluchID;

  IF v_OWN = 2 THEN
   select substr(Max(fc_rojdplace), 1, 100) fc_rojdplace, decode(substr(Max(fc_snils), 1, 14), '   -   -      ', '', substr(Max(fc_snils), 1, 14)) fc_snils
     into vMR, vSNILS
     from asu.tpeoples
    where fk_id = vPeopleID;

   SELECT NVL(Max(FK_KLADR), 0), Max(FK_REGIONID)
     INTO vFK_KLADR, vFK_REGIONID
     FROM asu.TADRESS tadr
    WHERE fk_pacid = vPeopleID and fk_type = ASU.GET_PROPISKAID;

   if vFK_KLADR < 1 then
     select exch43.pkg_exchcache.GET_THEIR_ID_ELSELOG(asu.GET_HOMS_COMPANYID, 'TFOMS', 'TREGION', vFK_REGIONID,
            'asu.tsluch_dbf', pSluchID, 'TFOMS_REG') into vOKATOG from dual;
   else
     SELECT substr(t.fc_okato, 1, 5) INTO vOKATOG FROM (SELECT TK.FK_ID, TK.FN_LEVEL, tk.fc_okato FROM ASU.TKLADR TK WHERE TK.FL_DEL = 0 CONNECT BY TK.FK_ID = PRIOR TK.FK_OWNER START WITH TK.FK_ID = vFK_KLADR) t
      WHERE t.FN_LEVEL = 1;
   end if;

   -- OKATOP
   SELECT NVL(Max(FK_KLADR), 0), Max(FK_REGIONID)
     INTO vFK_KLADR, vFK_REGIONID
     FROM asu.TADRESS tadr
    WHERE fk_pacid = vPeopleID and fk_type = ASU.GET_REGISTID;

   if vFK_KLADR < 1 then
     select exch43.pkg_exchcache.GET_THEIR_ID_ELSELOG(asu.GET_HOMS_COMPANYID, 'TFOMS', 'TREGION', vFK_REGIONID,
            'asu.tsluch_dbf', pSluchID, 'TFOMS_REG') into vOKATOP from dual;
   else
     SELECT substr(t.fc_okato, 1, 5) INTO vOKATOP FROM (SELECT TK.FK_ID, TK.FN_LEVEL, tk.fc_okato FROM ASU.TKLADR TK WHERE TK.FL_DEL = 0 CONNECT BY TK.FK_ID = PRIOR TK.FK_OWNER START WITH TK.FK_ID = vFK_KLADR) t
      WHERE t.FN_LEVEL = 1;
   end if;
  END IF;

  Select decode(max(FK_SMID), asu.GET_TALON_TYPE_CREATE_EXTRN, 2, 1) into vTYPE_MP
    from ASU.TIB
   where FK_SMEDITID = ASU.GET_TALON_TYPE_CREATE
     and FK_PACID = vID_ILL;

  if vTYPE_MP = 1 and vDB_NAME = 'X' then
    select MAX(ti.fk_smid) into v_LPU_NAPR from asu.tib ti
     where ti.fk_smeditid = asu.GET_SMID_PD_NAPRAVIV_YCH
       and ti.fk_pacid = vID_ILL;

    if v_LPU_NAPR is null then
      select decode(max(tat.fk_id), null, 1, 2)
        into vTYPE_MP
        from asu.tambtalon tat
       inner join asu.tkarta tk on tk.fk_id = tat.fk_ambid
       where tat.fk_id = vID_ILL;
    end if;
  end if;

  UPDATE asu.tsluch_dbf d
     SET TYPE_MP  = vTYPE_MP,
         OKATOG = vOKATOG,
         OKATOP = vOKATOP,
         MR = vMR,
         SNILS = vSNILS
   WHERE d.fk_id = pSluchId;
 END;

 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 PROCEDURE ADD_ALL_INSUR_AND_ALIEN_DATA IS
 BEGIN
    FOR C IN (SELECT TS.FK_ID,
                     exch43.pkg_exchcache.GET_THEIR_ID_ELSELOG(asu.GET_HOMS_COMPANYID, 'TYPE_PMSP', 'TSMID', fk_smid,
                                                  'asu.tsluch_dbf', TS.FK_ID, 'TYPE_V_MU') TYPE_V_MU
                FROM ASU.TSLUCH_DBF TS
                LEFT JOIN (SELECT FK_PACID, MAX(fk_smid) fk_smid
                             FROM ASU.TIB
                            WHERE FK_SMEDITID = STAT.PKG_STATUTIL.GET_SMIDID('TYPE_V_MU')
                            GROUP BY FK_PACID) TI_TYPE_V_MU ON TI_TYPE_V_MU.FK_PACID = TS.ID_ILL
               where ts.z$fl_poly = 1)
   LOOP
     UPDATE ASU.TSLUCH_DBF T
        SET T.TYPE_V_MU = C.TYPE_V_MU
      WHERE T.FK_ID = C.FK_ID;
   END LOOP;

-- ЗНАЧЕНИЯ ПОЛЯ Q_U:
--   1 - СТАЦИОНАР
--   2 - ПОЛИКЛИНИКА
--   3 - ДНЕВНОЙ СТАЦИОНАР
--   4 - СТАЦИОНАР ПЛАНОВЫЙ (НЕ ИСПОЛЬЗУЕТСЯ HTTP://192.168.1.2:15000/REDMINE/ISSUES/SHOW/9306)
--   5 - СТАМОТОЛОГИЧЕСКАЯ
--   6 - ЦЕНТРЫ ЗДОРОВЬЯ (ДОБАВЛЕН HTTP://192.168.1.9/REDMINE/ISSUES/13592)
    -- ПОЛИКЛИНИКА
    FOR C IN (SELECT TS.FK_ID , DECODE(THC.FK_ID, NULL, 2, 6) Q_U
                FROM ASU.TSLUCH_DBF TS
               INNER JOIN ASU.TAMBTALON TA ON TA.FK_ID = TS.ID_ILL
               INNER JOIN (SELECT TK.FK_ID, TK.FK_USLVIDID
                             FROM ASU.TKARTA TK
                           UNION ALL
                           SELECT K.FK_ID, TDO.FK_VIDDOCID FK_USLVIDID
                             FROM ASU.TAMBULANCE K
                            INNER JOIN ASU.TDOCOBSL TDO ON TDO.FK_ID = K.FK_DOCOBSL) TK ON TK.FK_ID = TA.FK_AMBID
                LEFT JOIN (SELECT TUV.FK_ID
                             FROM ASU.TUSLVID TUV
                           CONNECT BY PRIOR TUV.FK_ID = TUV.FK_OWNERID
                            START WITH TUV.FK_ID IN (ASU.DOC_IBHCENTER)) THC ON THC.FK_ID = TK.FK_USLVIDID
               WHERE TS.Z$FL_POLY = 1)
   LOOP UPDATE ASU.TSLUCH_DBF T SET T.Q_U = C.Q_U WHERE T.FK_ID = C.FK_ID; END LOOP;

    FOR C IN (SELECT TS.ID_ILL, TS.Q_U, TS.FK_ID
                FROM ASU.TSLUCH_DBF TS
               WHERE TS.Z$FL_POLY = 1
                 AND TS.Q_U <> 6
                 AND NOT (ts.fk_uslvidid in (SELECT t.fk_id FROM asu.tuslvid t CONNECT BY PRIOR t.fk_id = t.fk_ownerid START WITH t.fk_id = asu.get_uslvid_disp)) -- http://192.168.1.9/redmine/issues/25135 Если при диспансеризации была выполнена стоматологичесная услуга, это всё равно диспансеризация, а не стоматология
                 AND NOT (ts.fk_uslvidid = asu.get_uslvid_child)) -- http://192.168.1.9/redmine/issues/25135 Если при диспансеризации была выполнена стоматологичесная услуга, это всё равно диспансеризация, а не стоматология
    LOOP
      UPDATE ASU.TSLUCH_DBF TS
         SET TS.Q_U = (SELECT DECODE(MAX(TSD.FK_ID), NULL, C.Q_U, 5) Q_U
                         FROM ASU.TAMBTALON_NAZ TN
                        INNER JOIN ASU.VNAZ VN ON VN.FK_ID = TN.FK_NAZID
                        INNER JOIN ASU.TSMID_DENT TSD ON TSD.FK_ID = VN.FK_SMID
                        WHERE TN.FK_TALONID = C.ID_ILL
                          AND VN.FK_NAZSOSID = ASU.GET_VYPNAZSOSID)
       WHERE TS.FK_ID = C.FK_ID;
    END LOOP;

  FOR C IN (SELECT t.fk_id FROM asu.tsluch_dbf t) LOOP ADD_INSUR_AND_ALIEN_DATA(c.fk_id); END LOOP;

  for c in (select ts.fk_id,
                   exch43.pkg_exchcache.GET_THEIR_ID_ELSELOG(asu.GET_HOMS_COMPANYID, 'DISP_KAT', 'TSMID', tai.FK_CITIZEN_KAT, 'asu.tsluch_dbf', TS.FK_ID, 'DISP_KAT') DISP_KAT,
                   exch43.pkg_exchcache.GET_THEIR_ID_ELSELOG(asu.GET_HOMS_COMPANYID, 'DISP_RES', 'TSMID', tai.FK_SECOND_DISP, 'asu.tsluch_dbf', TS.FK_ID, 'DISP_RES') DISP_RES
              from asu.tsluch_dbf ts
             inner join asu.tambtalon_info tai on tai.fk_talonid = ts.id_ill
             where ts.z$fl_poly = 1
               and ts.fk_uslvidid in (SELECT t.fk_id FROM asu.tuslvid t CONNECT BY PRIOR t.fk_id = t.fk_ownerid START WITH t.fk_id = asu.get_uslvid_disp))
   LOOP
     update asu.tsluch_dbf t
        set t.DISP_KAT = c.DISP_KAT,
            t.DISP_RES = c.DISP_RES
      WHERE T.FK_ID = C.FK_ID;
   end LOOP;

  for c in (select s.fk_id, vn.fk_id FN_DISP_FSTAGE_NAZ
              from asu.tsmid_kons_spec ts
             inner join asu.vnaz VN ON VN.FK_SMID = TS.FK_ID
             inner join asu.tambtalon_naz tan on tan.fk_nazid = vn.fk_id
             inner join asu.tsluch_dbf s on s.id_ill = tan.fk_talonid
             where VN.FK_NAZSOSID = ASU.GET_VYPNAZSOSID
               and ts.fn_disp_stage = 1
               and s.z$fl_poly = 1
               and s.fk_uslvidid in (SELECT t.fk_id FROM asu.tuslvid t CONNECT BY PRIOR t.fk_id = t.fk_ownerid START WITH t.fk_id = asu.get_uslvid_disp))
  loop
     update asu.tsluch_dbf t
        set t.FN_DISP_FSTAGE_NAZ = c.FN_DISP_FSTAGE_NAZ
      WHERE T.FK_ID = C.FK_ID;
  end loop;

 END;

 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
PROCEDURE ADD_DIAG_DATA(pSluchID IN asu.tsluch_dbf.fk_id%TYPE) IS
  vDia_SD asu.tsluch_dbf.dia_sd%TYPE; -- Предварительный
  vDia_O  asu.tsluch_dbf.dia_o%TYPE; -- Осложнение
  vDia_C  asu.tsluch_dbf.dia_c%TYPE; -- Сопутствующий
  vDia_E  asu.tsluch_dbf.dia_e%TYPE; -- Заключительный
  vGZ_SMID_E Number;
  vGZ_SMID_SD Number;

  vID_ILL NUMBER;
BEGIN
  vID_ILL := GET_ID_ILL(pSluchId);

  SELECT MAX(S.FK_MKB10), max(dd.fk_grupid)
    INTO vDia_E, vGZ_SMID_E
    FROM asu.TAMBTALON TT
   inner join ASU.TDIAG d on d.FK_ID = TT.Fk_Diagmain
   inner join asu.TSMID S on S.FK_ID = d.FK_MKB_10
    left join asu.tdiagdetail dd on dd.fk_diagid = d.fk_id
   WHERE TT.FK_ID = vID_ILL;

  SELECT MAX(S.FK_MKB10)
    INTO vDia_C
    FROM asu.TAMBTALON TT
   inner join ASU.TDIAG d on d.FK_ID = TT.FK_DIAGSUB
   inner join asu.TSMID S on S.FK_ID = d.FK_MKB_10
   WHERE TT.FK_ID = vID_ILL;

  SELECT MAX(S.FK_MKB10), max(dd.fk_grupid)
    INTO vDia_SD, vGZ_SMID_SD
    FROM asu.TAMBTALON TT
   inner join ASU.TDIAG d on d.FK_ID = TT.FK_DIAGMAINPRED
   inner join asu.TSMID S on S.FK_ID = d.FK_MKB_10
    left join asu.tdiagdetail dd on dd.fk_diagid = d.fk_id
   WHERE TT.FK_ID = vID_ILL;

  if vDia_SD is null then
    vDia_SD := vDIA_E;
  end if;

  if vDia_E is null then
    vDia_E := vDia_SD;
    vGZ_SMID_E := vGZ_SMID_SD;
  end if;

  UPDATE asu.tsluch_dbf d
     SET dia_sd   = vDia_SD,
         dia_o    = vDia_O,
         dia_c    = vDia_C,
         dia_e    = vDia_E,
         GZ       = EXCH43.pkg_exchcache.GET_THEIR_ID_ELSELOG(GET_HOMS_COMPANYID, 'GZ', 'TSMID', vGZ_SMID_E,
                      'asu.tsluch_dbf', pSluchID, 'GZ')
   WHERE d.fk_id = pSluchId;
 END;

 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 PROCEDURE ADD_ALL_DIAG_DATA IS
 begin
   FOR C IN (SELECT t.fk_id FROM asu.tsluch_dbf t where t.z$fl_poly = 1) LOOP ADD_DIAG_DATA(c.fk_id); END LOOP;
 end;
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 PROCEDURE ADD_SLUCH_DATA(pSluchID IN asu.tsluch_dbf.fk_id%TYPE) IS
  -- Заполняем временную таблицу
  v_LPU_NAPR  asu.tsluch_dbf.lpu_napr%TYPE;
  v_N_NAPR    asu.tsluch_dbf.N_NAPR%TYPE;
  v_DATE_NAPR asu.tsluch_dbf.DATE_NAPR%TYPE;
  v_DESTROY   asu.tsluch_dbf.destroy%TYPE;
  v_Q_Z       asu.tsluch_dbf.q_z%TYPE;
  v_RES_G     asu.tsluch_dbf.res_g%TYPE;
  v_RESG_DOP  asu.tsluch_dbf.resg_dop%TYPE;
  v_DISP      asu.tsluch_dbf.disp%TYPE;
  v_N_MAP     asu.tsluch_dbf.n_map%TYPE;
  v_N_MAP_AMB asu.tsluch_dbf.n_map_amb%TYPE;
  v_DATE_S    asu.tsluch_dbf.date_s%TYPE;

  vID_ILL NUMBER;

  vPacID asu.tkarta.fk_id%TYPE;
  vPeopleID NUMBER;
BEGIN
  vID_ILL := GET_ID_ILL(pSluchID);

  select max(tat.fk_ambid) into vPacID from asu.tambtalon tat where tat.fk_id = vID_ILL;
  select Max(tsd.DATE_S) into v_DATE_S from asu.tsluch_dbf tsd where tsd.fk_id = pSluchID;
  select Max(tsd.person_idl) into vPeopleID from asu.tsluch_dbf tsd where tsd.fk_id = pSluchID;

  select MAX(ti.fk_smid) into v_LPU_NAPR from asu.tib ti
   where ti.fk_pacid = vID_ILL
     and ti.fk_smeditid = asu.GET_SMID_PD_NAPRAVIV_YCH;

  v_LPU_NAPR := EXCH43.pkg_exchcache.GET_THEIR_ID_ELSELOG(GET_HOMS_COMPANYID, 'LPU', 'TSMID', v_LPU_NAPR,
                       'asu.tsluch_dbf', pSluchID, 'LPU_NAPR');

  if v_LPU_NAPR is not null then
    select nvl(substr(MAX(tat.fc_naprnum),
                      1,
                      asu.GET_COLUMN_LEN('ASU', 'TSLUCH_DBF', 'N_NAPR')),
               'СОГЛ'),
           nvl(trunc(MAX(tat.fd_naprdate)), v_DATE_S)
      into v_N_NAPR, v_DATE_NAPR
      from asu.tambtalon tat
     where tat.fk_id = vID_ILL;
  else
    v_N_NAPR := null;
    v_DATE_NAPR := null;
  end if;

 SELECT EXCH43.pkg_exchcache.GET_THEIR_ID_ELSELOG(GET_HOMS_COMPANYID, 'DESTROY', 'TSMID', max(t.FK_TRAVMA),
               'asu.tsluch_dbf', pSluchID, 'DESTROY')
   INTO v_DESTROY
   FROM asu.tambtalon t
  WHERE t.fk_id = vID_ILL;
 --
 SELECT EXCH43.pkg_exchcache.GET_THEIR_ID_ELSELOG(GET_HOMS_COMPANYID, 'KH_ZABOL', 'TSMID', MAX(D.FL_FIRST),
               'asu.tsluch_dbf', pSluchID, 'Q_Z')
   INTO v_Q_Z
   FROM TDIAG D, TAMBTALON TT
  WHERE D.FK_ID = TT.FK_DIAGMAIN
    AND TT.FK_ID = vID_ILL;

 SELECT NVL(EXCH43.pkg_exchcache.GET_THEIR_ID_ELSELOG(GET_HOMS_COMPANYID, 'REZOBR_P', 'TSMID', max(TT.FK_RESULT),
                       'asu.tsluch_dbf', pSluchID, 'RES_G'),
            0)
   INTO v_RES_G
   FROM TAMBTALON TT
  WHERE tt.FK_ID = vID_ILL;
 -- RESG_DOP дописход
 -- N_MAP номер карты выбытия
 SELECT EXCH43.pkg_exchcache.GET_THEIR_ID_ELSELOG(GET_HOMS_COMPANYID, 'REZOBR_DOP_P', 'TSMID', MAX(tt.fk_dopishodid),
               'asu.tsluch_dbf', pSluchID, 'RESG_DOP'),
        nvl(MAX(ta.fk_ibid), MAX(tk.fk_ibid))
   INTO v_RESG_DOP, v_N_MAP_AMB
   FROM asu.tambtalon tt
   left join asu.tambulance ta on ta.fk_id = tt.fk_ambid
   left join asu.tkarta tk on tk.fk_id = tt.fk_ambid
  WHERE tt.fk_id = vID_ILL;

 select max(decode(tdc.fp_cardstatus,   0, 2,   1, 1,   2, 3,   4))
   into v_DISP
   from asu.tambtalon tat
   left join asu.tdispcard tdc on tdc.fk_id = tat.fk_dispcardid
  where tat.fk_id = vID_ILL;

  UPDATE asu.tsluch_dbf d
     SET LPU_NAPR  = v_LPU_NAPR,
         N_NAPR    = v_N_NAPR,
         DATE_NAPR = v_DATE_NAPR,
         DESTROY   = v_DESTROY,
         Q_Z       = v_Q_Z,
         RES_G     = v_RES_G,
         RESG_DOP  = v_RESG_DOP,
         DISP      = v_DISP,
         N_MAP     = v_N_MAP,
         N_MAP_AMB = v_N_MAP_AMB
   WHERE d.fk_id = pSluchId;
 END;

 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
PROCEDURE ADD_ALL_SLUCH_DATA IS
BEGIN
 FOR C IN (SELECT t.fk_id FROM asu.tsluch_dbf t where t.z$fl_poly = 1) LOOP ADD_SLUCH_DATA(c.fk_id); END LOOP;

 -- Оказалось на кардио и на других объектах это поле заполняется по разному.
 if ASU.PKG_SMINI.READSTRING('CONFIG', 'DB_NAME', 'H') = 'SK' then
   update asu.tsluch_dbf t
      set t.amb_pr = (SELECT EXCH43.pkg_exchcache.GET_THEIR_ID_ELSELOG(
                               GET_HOMS_COMPANYID, 'AMB_PR', 'TSMID', max(i.FK_VISITVID), 'asu.tsluch_dbf', t.fk_id, 'AMB_PR')
                        FROM asu.TAMBTALON TT
                       inner join asu.tambtalon_info i on i.fk_talonid = tt.fk_id
                       WHERE tt.FK_ID = t.ID_ILL)
    where t.z$fl_poly = 1;
  else
   update asu.tsluch_dbf t
      set t.amb_pr = (SELECT EXCH43.pkg_exchcache.GET_THEIR_ID_ELSELOG(
                               GET_HOMS_COMPANYID, 'AMB_PR', 'TSMID', max(TT.FK_REASON), 'asu.tsluch_dbf', t.fk_id, 'AMB_PR')
                        FROM asu.TAMBTALON TT
                       WHERE tt.FK_ID = t.ID_ILL)
    where t.z$fl_poly = 1;
  end if;
END;

 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
-- Efimov V.A. 20110909 оптимизировано добавление стационарных услуг (перемещений)
PROCEDURE FILL_AMB_USL IS
BEGIN
  -- ПОЛИКЛИНИКА
   INSERT INTO asu.tusl_dbf d
    (Z$NAZ_ID,
     Z$FL_POLY,
     OWN,
     GLOBAL_ID,
     YEAR,
     MONTH,
     LPU_ID,
     LPU_INTR,
     LPU_NAPR,
     PERSON_IDL,
     ID_ILL,
     ID_ILL_U,
     POLICYSER,
     POLICYNUM,
     TYPE_USL,
     DATE_B_U,
     DATE_E_U,
     DATE_B_U_TIME,
     DATE_E_U_TIME,
     V_MU,
     KOD_MU,
     KOL_MU,
     N_QU, -- Номер сегмента (квадранта),
     N_TOOTH, -- Номер зуба (справочник ZF),
     P_TOOTH, -- поверхность зуба (справочник PZ),
     N_QU2, -- Номер сегмента (квадранта),
     N_TOOTH2, -- Номер зуба (справочник ZF),
     P_TOOTH2, -- поверхность зуба (справочник PZ),
     N_QU3, -- Номер сегмента (квадранта),
     N_TOOTH3, -- Номер зуба (справочник ZF),
     P_TOOTH3, -- поверхность зуба (справочник PZ),
     N_QU4, -- Номер сегмента (квадранта),
     N_TOOTH4, -- Номер зуба (справочник ZF),
     P_TOOTH4, -- поверхность зуба (справочник PZ),
     N_QU5, -- Номер сегмента (квадранта),
     N_TOOTH5, -- Номер зуба (справочник ZF),
     P_TOOTH5, -- поверхность зуба (справочник PZ),
     N_QU6, -- Номер сегмента (квадранта),
     N_TOOTH6, -- Номер зуба (справочник ZF),
     P_TOOTH6, -- поверхность зуба (справочник PZ),
     N_QU7, -- Номер сегмента (квадранта),
     N_TOOTH7, -- Номер зуба (справочник ZF),
     P_TOOTH7, -- поверхность зуба (справочник PZ),
     N_QU8, -- Номер сегмента (квадранта),
     N_TOOTH8, -- Номер зуба (справочник ZF),
     P_TOOTH8,
     DOC_CD_U,
     PRVSM_U,
     PR_MP,
     P_ID_ILL,
     FK_SOTRID,
     FK_ID,
     FK_SLUCHID,
     FK_PACID)
    SELECT n.FK_ID Z$NAZ_ID,
           1 Z$FL_POLY,
           ts.own,
           ts.global_id,
           ts.year,
           ts.month,
           ts.lpu_id,
           ts.LPU_INTR,
           ts.lpu_napr,
           ts.person_idl,
           ts.id_ill,
           nvl(tnh.fk_id, n.FK_ID) ID_ILL_U,
           ts.policyser,
           ts.policynum,
           ts.q_u TYPE_USL,
           decode(db_name.fc_name,
                  'SK', nvl((select trunc(max(trl.fd_ins))
                               from asu.tnazlech tnl
                               left join asu.treslech trl on trl.fk_nazid = tnl.fk_id
                              where tnl.fk_id = an.fk_nazid), trunc(n.fd_run)),
                        trunc(n.fd_run)) DATE_B_U,
           decode(db_name.fc_name,
                  'SK', nvl((select trunc(max(trl.fd_ins))
                               from asu.tnazlech tnl
                               left join asu.treslech trl on trl.fk_nazid = tnl.fk_id
                              where tnl.fk_id = an.fk_nazid), trunc(n.fd_run)),
                        trunc(n.fd_run)) DATE_E_U,
           decode(db_name.fc_name,
                  'SK', nvl((select max(trl.fd_ins)
                               from asu.tnazlech tnl
                               left join asu.treslech trl on trl.fk_nazid = tnl.fk_id
                              where tnl.fk_id = an.fk_nazid), n.fd_run),
                        n.fd_run) DATE_B_U_TIME,
           decode(db_name.fc_name,
                  'SK', nvl((select max(trl.fd_ins)
                               from asu.tnazlech tnl
                               left join asu.treslech trl on trl.fk_nazid = tnl.fk_id
                              where tnl.fk_id = an.fk_nazid), n.fd_run),
                        n.fd_run) DATE_E_U_TIME,
           null V_MU,

           5 KOD_MU, -- Всегда диагностическая услуга
           1 KOL_MU,

           null, null, null,
           null, null, null,
           null, null, null,
           null, null, null,
           null, null, null,
           null, null, null,
           null, null, null,
           null, null, null,

           null DOC_CD_U,
           null PRVSM_U,

           null PR_MP,
           ts.P_ID_ILL,
           nvl(decode(n.fk_ispolid, 0, null, n.fk_ispolid), n.fk_vrachid) FK_SOTRID,
           asu.seq_tusl_dbf.nextval FK_ID,
           ts.fk_id FK_SLUCHID,
           ts.fk_pacid

      from asu.tsluch_dbf ts
     inner join asu.tambtalon tat on tat.fk_id = ts.Id_Ill
--      LEFT JOIN asu.TAMBULANCE ta on ta.fk_id = tat.fk_ambid
--      LEFT JOIN asu.TDOCOBSL D ON d.fk_id = TA.FK_DOCOBSL
     inner join asu.tambtalon_naz an on an.fk_talonid = tat.fk_id
     inner join asu.vnaz n on n.fk_id = an.fk_nazid

      left join asu.tnazheal tnh on tnh.fk_nazid = n.fk_id

      left join (select 1 fk_id, ASU.PKG_SMINI.READSTRING('CONFIG', 'DB_NAME', 'H') fc_name from dual) db_name on db_name.fk_id = 1
      left join asu.tsmid_nodbfexch ne on ne.fk_id = n.fk_smid
     where ts.z$fl_poly = 1
       and ts.fk_uslvidid not in (asu.GET_USLVID_ER, asu.GET_USLVID_CHILD)
--       AND d.fk_viddocid <> asu.GET_USLVID_ER
       and ts.FN_DISP_FSTAGE_NAZ = 0 -- Для случаев связанных с первым этапом диспансеризации (ts.DISP_RES = 0) услуги добавляются в ADD_DISP_USL, для второго этапа диспансеризации обычным образом (ts.DISP_RES = 1)
       and ne.fk_id is null -- Efimov V.A. 20120924 http://192.168.1.9/redmine/issues/20160 Часть назначений может быть запрещена для выгрузки
       AND (N.FK_NAZSOSID = ASU.GET_VYPNAZSOSID OR
            exists(select trl.fk_id
                     from asu.vnaz vn
                     left join asu.tnazlech tnl on tnl.fk_id = vn.fk_id
                     left join asu.TRESLECH trl on trl.fk_nazid = tnl.fk_id
                    where decode(trl.fk_sos, null, vn.fk_nazsosid, trl.fk_sos) = ASU.GET_VYPNAZSOSID
                      and vn.fk_id = n.fk_id));

    -- СТОМАТОЛОГИЯ
    UPDATE asu.tusl_dbf t SET ( N_QU, N_TOOTH, P_TOOTH,
                                N_QU2, N_TOOTH2, P_TOOTH2,
                                N_QU3, N_TOOTH3, P_TOOTH3,
                                N_QU4, N_TOOTH4, P_TOOTH4,
                                N_QU5, N_TOOTH5, P_TOOTH5,
                                N_QU6, N_TOOTH6, P_TOOTH6,
                                N_QU7, N_TOOTH7, P_TOOTH7,
                                N_QU8, N_TOOTH8, P_TOOTH8 ) =
     (select ttooth.N_QU1, -- Номер сегмента (квадранта),
             ttooth.N_TOOTH1, -- Номер зуба (справочник ZF),
             upper(substr(ttooth.P_TOOTH1, 1, 1)) P_TOOTH1, -- поверхность зуба (справочник PZ),
             ttooth.N_QU2, -- Номер сегмента (квадранта),
             ttooth.N_TOOTH2, -- Номер зуба (справочник ZF),
             upper(substr(ttooth.P_TOOTH2, 1, 1)) P_TOOTH2, -- поверхность зуба (справочник PZ),
             ttooth.N_QU3, -- Номер сегмента (квадранта),
             ttooth.N_TOOTH3, -- Номер зуба (справочник ZF),
             upper(substr(ttooth.P_TOOTH3, 1, 1)) P_TOOTH3, -- поверхность зуба (справочник PZ),
             ttooth.N_QU4, -- Номер сегмента (квадранта),
             ttooth.N_TOOTH4, -- Номер зуба (справочник ZF),
             upper(substr(ttooth.P_TOOTH4, 1, 1)) P_TOOTH4, -- поверхность зуба (справочник PZ),
             ttooth.N_QU5, -- Номер сегмента (квадранта),
             ttooth.N_TOOTH5, -- Номер зуба (справочник ZF),
             upper(substr(ttooth.P_TOOTH5, 1, 1)) P_TOOTH5, -- поверхность зуба (справочник PZ),
             ttooth.N_QU6, -- Номер сегмента (квадранта),
             ttooth.N_TOOTH6, -- Номер зуба (справочник ZF),
             upper(substr(ttooth.P_TOOTH6, 1, 1)) P_TOOTH6, -- поверхность зуба (справочник PZ),
             ttooth.N_QU7, -- Номер сегмента (квадранта),
             ttooth.N_TOOTH7, -- Номер зуба (справочник ZF),
             upper(substr(ttooth.P_TOOTH7, 1, 1)) P_TOOTH7, -- поверхность зуба (справочник PZ),
             ttooth.N_QU8, -- Номер сегмента (квадранта),
             ttooth.N_TOOTH8, -- Номер зуба (справочник ZF),
             upper(substr(ttooth.P_TOOTH8, 1, 1)) P_TOOTH8
        from (select t.NAZID,
                     t.N_QU1,
                     t.N_TOOTH1,
                     t.P_TOOTH1,
                     t.N_QU2,
                     t.N_TOOTH2,
                     t.P_TOOTH2,
                     t.N_QU3,
                     t.N_TOOTH3,
                     t.P_TOOTH3,
                     t.N_QU4,
                     t.N_TOOTH4,
                     t.P_TOOTH4,
                     t.N_QU5,
                     t.N_TOOTH5,
                     t.P_TOOTH5,
                     t.N_QU6,
                     t.N_TOOTH6,
                     t.P_TOOTH6,
                     t.N_QU7,
                     t.N_TOOTH7,
                     t.P_TOOTH7,
                     t.N_QU8,
                     t.N_TOOTH8,
                     t.P_TOOTH8
                from (select t.N_QU N_QU1,
                             lead(t.N_QU, 1, null) over(partition by t.NAZID ORDER BY t.TOOTH_NUM) N_QU2,
                             lead(t.N_QU, 2, null) over(partition by t.NAZID ORDER BY t.TOOTH_NUM) N_QU3,
                             lead(t.N_QU, 3, null) over(partition by t.NAZID ORDER BY t.TOOTH_NUM) N_QU4,
                             lead(t.N_QU, 4, null) over(partition by t.NAZID ORDER BY t.TOOTH_NUM) N_QU5,
                             lead(t.N_QU, 5, null) over(partition by t.NAZID ORDER BY t.TOOTH_NUM) N_QU6,
                             lead(t.N_QU, 6, null) over(partition by t.NAZID ORDER BY t.TOOTH_NUM) N_QU7,
                             lead(t.N_QU, 7, null) over(partition by t.NAZID ORDER BY t.TOOTH_NUM) N_QU8,
                             t.N_TOOTH N_TOOTH1,
                             lead(t.N_TOOTH, 1, null) over(partition by t.NAZID ORDER BY t.TOOTH_NUM) N_TOOTH2,
                             lead(t.N_TOOTH, 2, null) over(partition by t.NAZID ORDER BY t.TOOTH_NUM) N_TOOTH3,
                             lead(t.N_TOOTH, 3, null) over(partition by t.NAZID ORDER BY t.TOOTH_NUM) N_TOOTH4,
                             lead(t.N_TOOTH, 4, null) over(partition by t.NAZID ORDER BY t.TOOTH_NUM) N_TOOTH5,
                             lead(t.N_TOOTH, 5, null) over(partition by t.NAZID ORDER BY t.TOOTH_NUM) N_TOOTH6,
                             lead(t.N_TOOTH, 6, null) over(partition by t.NAZID ORDER BY t.TOOTH_NUM) N_TOOTH7,
                             lead(t.N_TOOTH, 7, null) over(partition by t.NAZID ORDER BY t.TOOTH_NUM) N_TOOTH8,
                             t.P_TOOTH P_TOOTH1,
                             lead(t.P_TOOTH, 1, null) over(partition by t.NAZID ORDER BY t.TOOTH_NUM) P_TOOTH2,
                             lead(t.P_TOOTH, 2, null) over(partition by t.NAZID ORDER BY t.TOOTH_NUM) P_TOOTH3,
                             lead(t.P_TOOTH, 3, null) over(partition by t.NAZID ORDER BY t.TOOTH_NUM) P_TOOTH4,
                             lead(t.P_TOOTH, 4, null) over(partition by t.NAZID ORDER BY t.TOOTH_NUM) P_TOOTH5,
                             lead(t.P_TOOTH, 5, null) over(partition by t.NAZID ORDER BY t.TOOTH_NUM) P_TOOTH6,
                             lead(t.P_TOOTH, 6, null) over(partition by t.NAZID ORDER BY t.TOOTH_NUM) P_TOOTH7,
                             lead(t.P_TOOTH, 7, null) over(partition by t.NAZID ORDER BY t.TOOTH_NUM) P_TOOTH8,
                             t.TOOTH_NUM,
                             t.NAZID
                        from (SELECT i_sn.fk_pacid NAZID, -- 20121004 Efimov V.A. Доработал "зубной" запрос с учётом того, что поверхность может быть не заполнена
                                     ts_sn.fc_name N_QU,
                                     ts_zn.fc_name N_TOOTH,
                                     ts_pn.fc_name P_TOOTH,
                                     ROW_NUMBER() OVER(PARTITION BY i_sn.fk_pacid ORDER BY ts_sn.fc_name, ts_zn.fc_name) TOOTH_NUM
                                FROM (select * from asu.tsmid_tooth where fn_level = 2) ts_sn -- номера сегментов
                               inner join asu.tib i_sn on i_sn.fk_smid = ts_sn.fk_id -- сегменты, они должны быть заполнены обязательно
                               INNER JOIN asu.tusl_dbf u ON u.Id_Ill_u = i_sn.fk_pacid
                                left join (select i.fk_pacid, s.fc_name, ts.fk_owner fk_owner2, s.fk_id
                                             from (select * from asu.tsmid_tooth where fn_level = 4) s -- номера зубов
                                            inner join asu.tib i on i.fk_smid = s.fk_id
                                            inner join asu.tsmid ts on ts.fk_id = s.fk_owner
                                            INNER JOIN asu.tusl_dbf u ON u.Id_Ill_u = i.fk_pacid
                                            WHERE u.type_usl = 5) ts_zn on ts_zn.fk_pacid = i_sn.fk_pacid and ts_zn.fk_owner2 = ts_sn.fk_id -- сегменты, они должны быть заполнены обязательно
                                left join (select i.fk_pacid, s.fc_name, ts.fk_owner fk_owner2, s.fk_id
                                             from (select * from asu.tsmid_tooth where fn_level = 6) s -- поверхности
                                            inner join asu.tib i on i.fk_smid = s.fk_id
                                            inner join asu.tsmid ts on ts.fk_id = s.fk_owner
                                            INNER JOIN asu.tusl_dbf u ON u.Id_Ill_u = i.fk_pacid
                                            WHERE u.type_usl = 5) ts_pn on ts_pn.fk_pacid = i_sn.fk_pacid and ts_pn.fk_owner2 = ts_zn.fk_id
                               WHERE u.type_usl = 5
                               group by i_sn.fk_pacid, ts_sn.fc_name, ts_zn.fc_name, ts_pn.fc_name) t) t
               where t.TOOTH_NUM = 1) ttooth WHERE ttooth.NAZID = t.id_ill_u)
     WHERE t.type_usl = 5;

   ADD_DISP_USL;
   ADD_CHILD_USL;

   -- Если в амбулаторном случае есть названчения из списка toper_smid, такой случай считается оперативным http://192.168.1.9/redmine/issues/23604
   for c in (select tu.fk_sluchid from asu.tusl_dbf tu
              inner join asu.vnaz vn on vn.fk_id = tu.id_ill_u
              inner join asu.toper_smid tos on tos.fk_smidid = vn.fk_smid
              group by tu.fk_sluchid)
   loop
     update asu.tsluch_dbf ts
        set ts.oper_id = 1,
            ts.narkoz_id = 10
      where ts.fk_id = c.fk_sluchid;
   end loop;

   ADD_ER; -- услуга скорой помощи добавляется сразу с ценой.
 end;

 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 PROCEDURE ADD_DISP_USL is
 begin
   INSERT INTO asu.tusl_dbf d
    (FK_ID,
     Z$NAZ_ID,
     Z$FL_POLY,
     OWN,
     GLOBAL_ID,
     YEAR,
     MONTH,
     LPU_ID,
     LPU_INTR,
     LPU_NAPR,
     PERSON_IDL,
     ID_ILL,
     ID_ILL_U,
     POLICYSER,
     POLICYNUM,
     TYPE_USL,
     DATE_B_U,
     DATE_E_U,
     DATE_B_U_TIME,
     DATE_E_U_TIME,
     V_MU,
     KOD_MU,
     KOL_MU,
     N_QU, -- Номер сегмента (квадранта),
     N_TOOTH, -- Номер зуба (справочник ZF),
     P_TOOTH, -- поверхность зуба (справочник PZ),
     N_QU2, -- Номер сегмента (квадранта),
     N_TOOTH2, -- Номер зуба (справочник ZF),
     P_TOOTH2, -- поверхность зуба (справочник PZ),
     N_QU3, -- Номер сегмента (квадранта),
     N_TOOTH3, -- Номер зуба (справочник ZF),
     P_TOOTH3, -- поверхность зуба (справочник PZ),
     N_QU4, -- Номер сегмента (квадранта),
     N_TOOTH4, -- Номер зуба (справочник ZF),
     P_TOOTH4, -- поверхность зуба (справочник PZ),
     N_QU5, -- Номер сегмента (квадранта),
     N_TOOTH5, -- Номер зуба (справочник ZF),
     P_TOOTH5, -- поверхность зуба (справочник PZ),
     N_QU6, -- Номер сегмента (квадранта),
     N_TOOTH6, -- Номер зуба (справочник ZF),
     P_TOOTH6, -- поверхность зуба (справочник PZ),
     N_QU7, -- Номер сегмента (квадранта),
     N_TOOTH7, -- Номер зуба (справочник ZF),
     P_TOOTH7, -- поверхность зуба (справочник PZ),
     N_QU8, -- Номер сегмента (квадранта),
     N_TOOTH8, -- Номер зуба (справочник ZF),
     P_TOOTH8,
     DOC_CD_U,
     PRVSM_U,
     PR_MP,
     P_ID_ILL,
     FK_SOTRID,
     FK_SLUCHID,
     KOD_EO,
     TYPE_EO,
     KOL_EO,
     COST_EO,
     SUM_EO,
     fk_pacid)
  SELECT asu.seq_tusl_dbf.NEXTVAL FK_ID,
         ts.ID_ILL_U Z$NAZ_ID,
         1 Z$FL_POLY,
         ts.own,
         ts.global_id,
         ts.YEAR,
         ts.MONTH,
         ts.lpu_id,
         ts.LPU_INTR,
         ts.lpu_napr,
         ts.person_idl,
         ts.id_ill,
         ts.ID_ILL_U,
         ts.policyser,
         ts.policynum,
         ts.TYPE_USL,
         ts.DATE_B_U,
         ts.DATE_E_U,
         ts.DATE_B_U_TIME,
         ts.DATE_E_U_TIME,
         NULL V_MU,

         1 KOD_MU, -- диспансеризация
         ts.KOL_MU,

         null, null, null,
         null, null, null,
         null, null, null,
         null, null, null,
         null, null, null,
         null, null, null,
         null, null, null,
         null, null, null,

         NULL DOC_CD_U,
         NULL PRVSM_U,

         NULL PR_MP,
         ts.P_ID_ILL,
         ts.FK_SOTRID,
         ts.FK_SLUCHID,

         decode(tdt.fk_id, NULL, '', H.CODE) KOD_EO,
--         9 TYPE_EO, -- диспансеризация
         decode (AMB_PR,  9, 11,
                         12, 10,
                         13, 13,
                         14, 14,
                         15, 12,
                              9) TYPE_EO, -- Доработано в связи с задачей http://192.168.1.9/redmine/issues/25020
         1 KOL_EO,
         decode(tdt.fk_id, NULL, NULL, C.FN_COST) COST_EO,
         decode(tdt.fk_id, NULL, NULL, C.FN_COST) SUM_EO,
         ts.fk_pacid
  FROM (SELECT n.FK_ID ID_ILL_U,
               ts.own,
               ts.global_id,
               ts.YEAR,
               ts.MONTH,
               ts.lpu_id,
               ts.LPU_INTR,
               ts.lpu_napr,
               ts.person_idl,
               ts.id_ill,
               ts.policyser,
               ts.policynum,
               TS.Q_U TYPE_USL,
               TS.AMB_PR,
               TS.DATE_S DATE_B_U,
               TS.DATE_E DATE_E_U,
               ts.P_ID_ILL,
               ts.FK_ID FK_SLUCHID,
               nvl(decode(n.fk_ispolid, 0, NULL, n.fk_ispolid), n.fk_vrachid) FK_SOTRID,
               COUNT(*) KOL_MU,
               'TD%' || decode(NS.FC_SYNONIM,
                               'KONS_DISP_1_D',
                               decode(ts.pol, 'Ж', 'G.1', 'B.1'),
                               'KONS_DISP_1_DO',
                               decode(ts.pol, 'Ж', 'G.2', 'B.2'),
                               decode(ts.pol, 'Ж', 'W', 'M')) || '%' KOD_EO_MASK,
               ts.date_e,
               TRUNC(MONTHS_BETWEEN(ts.date_e, ts.date_b_day) / 12) fn_age,
               TS.DATE_S DATE_B_U_TIME,
               TS.DATE_E DATE_E_U_TIME,
               ts.fk_pacid
          FROM ASU.TSLUCH_DBF ts
         INNER JOIN ASU.TAMBTALON TAT ON TAT.FK_ID = TS.ID_ILL
         INNER JOIN ASU.TAMBULANCE TA ON TA.FK_ID = TAT.FK_AMBID
         INNER JOIN ASU.TAMBTALON_NAZ AN ON AN.FK_TALONID = TAT.FK_ID
         INNER JOIN ASU.VNAZ VN ON VN.FK_ID = AN.FK_NAZID
         INNER JOIN ASU.VNAZ N ON N.FK_ID = ts.fn_disp_fstage_naz
         INNER JOIN asu.tsmid_KONS_SPEC NS ON NS.FK_ID = N.FK_SMID
         where ts.fn_disp_fstage_naz > 0
           and VN.FK_NAZSOSID = ASU.GET_VYPNAZSOSID
         group by n.FK_ID,
                  ts.own,
                  ts.global_id,
                  ts.YEAR,
                  ts.MONTH,
                  ts.lpu_id,
                  ts.LPU_INTR,
                  ts.lpu_napr,
                  ts.person_idl,
                  ts.id_ill,
                  ts.policyser,
                  ts.policynum,
                  TS.Q_U,
                  TS.AMB_PR,
                  TS.DATE_S,
                  TS.DATE_E,
                  ts.P_ID_ILL,
                  ts.FK_ID,
                  n.fk_ispolid,
                  n.fk_vrachid,
                  NS.FC_SYNONIM,
                  ts.pol,
                  ts.date_b_day,
                  ts.fk_pacid) ts
 inner JOIN (SELECT r.FC_ASKID fc_code, r.fc_replyid fn_age
               FROM asu.treplytable r
              WHERE r.FC_ASK = 'THEAL_DISP'
                AND r.FC_ASKFIELD = 'CODE'
                AND r.FC_REPLY = 'NUMBERS'
                AND r.FC_REPLYFIELD = 'RN'
              group by r.FC_ASKID, r.fc_replyid) r ON r.fn_age = ts.fn_age
                                             AND r.fc_code LIKE ts.KOD_EO_MASK
 inner JOIN ASU.THEAL H ON H.CODE = r.fc_code
 inner JOIN ASU.THEAL_COST C ON C.FK_HEALID = H.FK_ID
                            AND ts.date_e BETWEEN C.FD_DATE1 AND NVL(C.FD_DATE2, ts.date_e) -- По предложению По предложению По предложению По предложению
  LEFT JOIN (SELECT MAX(tdt.fk_id) fk_id FROM asu.ttypedoc tdt WHERE tdt.fc_synonim = 'OMS') tdt ON tdt.fk_id = h.fk_doctypeid;
 end;

 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 PROCEDURE ADD_CHILD_USL is
 begin
   INSERT INTO asu.tusl_dbf d
    (FK_ID,
     Z$NAZ_ID,
     Z$FL_POLY,
     OWN,
     GLOBAL_ID,
     YEAR,
     MONTH,
     LPU_ID,
     LPU_INTR,
     LPU_NAPR,
     PERSON_IDL,
     ID_ILL,
     ID_ILL_U,
     POLICYSER,
     POLICYNUM,
     TYPE_USL,
     DATE_B_U,
     DATE_E_U,
     DATE_B_U_TIME,
     DATE_E_U_TIME,
     V_MU,
     KOD_MU,
     KOL_MU,
     N_QU, -- Номер сегмента (квадранта),
     N_TOOTH, -- Номер зуба (справочник ZF),
     P_TOOTH, -- поверхность зуба (справочник PZ),
     N_QU2, -- Номер сегмента (квадранта),
     N_TOOTH2, -- Номер зуба (справочник ZF),
     P_TOOTH2, -- поверхность зуба (справочник PZ),
     N_QU3, -- Номер сегмента (квадранта),
     N_TOOTH3, -- Номер зуба (справочник ZF),
     P_TOOTH3, -- поверхность зуба (справочник PZ),
     N_QU4, -- Номер сегмента (квадранта),
     N_TOOTH4, -- Номер зуба (справочник ZF),
     P_TOOTH4, -- поверхность зуба (справочник PZ),
     N_QU5, -- Номер сегмента (квадранта),
     N_TOOTH5, -- Номер зуба (справочник ZF),
     P_TOOTH5, -- поверхность зуба (справочник PZ),
     N_QU6, -- Номер сегмента (квадранта),
     N_TOOTH6, -- Номер зуба (справочник ZF),
     P_TOOTH6, -- поверхность зуба (справочник PZ),
     N_QU7, -- Номер сегмента (квадранта),
     N_TOOTH7, -- Номер зуба (справочник ZF),
     P_TOOTH7, -- поверхность зуба (справочник PZ),
     N_QU8, -- Номер сегмента (квадранта),
     N_TOOTH8, -- Номер зуба (справочник ZF),
     P_TOOTH8,
     DOC_CD_U,
     PRVSM_U,
     PR_MP,
     P_ID_ILL,
     FK_SOTRID,
     FK_SLUCHID,
     KOD_EO,
     TYPE_EO,
     KOL_EO,
     COST_EO,
     SUM_EO,
     fk_pacid)
  SELECT asu.seq_tusl_dbf.NEXTVAL FK_ID,
         ts.ID_ILL_U Z$NAZ_ID,
         1 Z$FL_POLY,
         ts.own,
         ts.global_id,
         ts.YEAR,
         ts.MONTH,
         ts.lpu_id,
         ts.LPU_INTR,
         ts.lpu_napr,
         ts.person_idl,
         ts.id_ill,
         ts.ID_ILL_U,
         ts.policyser,
         ts.policynum,
         ts.TYPE_USL,
         ts.DATE_B_U,
         ts.DATE_E_U,
         ts.DATE_B_U_TIME,
         ts.DATE_E_U_TIME,
         NULL V_MU,

         1 KOD_MU, -- посещение
         ts.KOL_MU,

         null, null, null,
         null, null, null,
         null, null, null,
         null, null, null,
         null, null, null,
         null, null, null,
         null, null, null,
         null, null, null,

         NULL DOC_CD_U,
         NULL PRVSM_U,

         NULL PR_MP,
         ts.P_ID_ILL,
         ts.FK_SOTRID,
         ts.FK_SLUCHID,

         decode(tdt.fk_id, NULL, '', H.CODE) KOD_EO,
         ts.TYPE_EO, -- медосмотр несовершеннолетних
         1 KOL_EO,
         decode(tdt.fk_id, NULL, NULL, C.FN_COST) COST_EO,
         decode(tdt.fk_id, NULL, NULL, C.FN_COST) SUM_EO,
         ts.fk_pacid
    FROM (select ts.* from (
            SELECT LAST_VALUE(n.FK_ID) OVER(PARTITION BY ts.id_ill ORDER BY decode(substr(NS.FC_SYNONIM, 1, 10), 'KONS_CHILD', 1, 0), n.fd_run ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) id_ill_u_last,
                   n.FK_ID id_ill_u,
                   ROW_NUMBER() OVER(PARTITION BY ts.id_ill ORDER BY decode(substr(NS.FC_SYNONIM, 1, 10), 'KONS_CHILD', 1, 0), n.fd_run) KOL_MU, -- в выборку попадают только консультации, поэтому номер последней консультации и будет их кол-вом
                   ts.own,
                   ts.global_id,
                   ts.YEAR,
                   ts.MONTH,
                   ts.lpu_id,
                   ts.LPU_INTR,
                   ts.lpu_napr,
                   ts.person_idl,
                   ts.id_ill,
                   ts.policyser,
                   ts.policynum,
                   TS.Q_U TYPE_USL,
                   TS.AMB_PR,
                   TS.DATE_S DATE_B_U,
                   TS.DATE_E DATE_E_U,
                   ts.P_ID_ILL,
                   ts.FK_ID FK_SLUCHID,
                   nvl(decode(n.fk_ispolid, 0, NULL, n.fk_ispolid), n.fk_vrachid) FK_SOTRID,
                   decode(NS.FC_SYNONIM,
                                   'KONS_CHILD_PERIOD_DOSH',
                                   'TPN.3.01',
                                   'KONS_CHILD_PERIOD_NOS',
                                   'TPN.3.02',
                                   'KONS_CHILD_PERIOD_DS',
                                   'TPN.3.03',
                                   'KONS_CHILD_PROF_I',
                                   decode(ts.pol, 'Ж', 'TPG.1', 'TPB.1') || '.' || asu.GET_HEAL_CHILD_AGE_POSTF(MONTHS_BETWEEN(ts.date_e, ts.date_b_day)),
                                   'KONS_CHILD_PREV_I',
                                   decode(ts.pol, 'Ж', 'TPG.2', 'TPB.2') || '.' || asu.GET_HEAL_CHILD_AGE_POSTF(MONTHS_BETWEEN(ts.date_e, ts.date_b_day)),
                                   '') KOD_EO_MASK,
                   decode(NS.FC_SYNONIM,
                                   'KONS_CHILD_PERIOD_DOSH',
                                   14,
                                   'KONS_CHILD_PERIOD_NOS',
                                   14,
                                   'KONS_CHILD_PERIOD_DS',
                                   14,
                                   'KONS_CHILD_PROF_I',
                                   10,
                                   'KONS_CHILD_PREV_I',
                                   13,
                                   10) TYPE_EO,
                   ts.date_e,
                   TS.DATE_S DATE_B_U_TIME,
                   TS.DATE_E DATE_E_U_TIME,
                   ts.fk_pacid
              FROM ASU.TSLUCH_DBF ts
             INNER JOIN ASU.TAMBTALON TAT ON TAT.FK_ID = TS.ID_ILL
             INNER JOIN ASU.TAMBTALON_NAZ AN ON AN.FK_TALONID = TAT.FK_ID
             INNER JOIN ASU.VNAZ N ON N.FK_ID = AN.FK_NAZID
             INNER JOIN asu.tsmid_KONS_SPEC NS ON NS.FK_ID = N.FK_SMID
             where ts.fk_uslvidid = asu.GET_USLVID_CHILD
  --             and ts.id_ill = 139527767
               and N.FK_NAZSOSID = ASU.GET_VYPNAZSOSID) ts
           where ts.id_ill_u = ts.id_ill_u_last) ts

  INNER JOIN ASU.THEAL H ON H.CODE = ts.KOD_EO_MASK -- Для TPG и TPB берётся по возрасту (т.е. из r.fc_code), для остальных по назнчению (ts.KOD_EO_MASK совпадает с кодом)
  INNER JOIN ASU.THEAL_COST C ON C.FK_HEALID = H.FK_ID
                              AND ts.date_e BETWEEN C.FD_DATE1 AND NVL(C.FD_DATE2, ts.date_e) -- По предложению По предложению По предложению По предложению
   LEFT JOIN (SELECT MAX(tdt.fk_id) fk_id FROM asu.ttypedoc tdt WHERE tdt.fc_synonim = 'OMS') tdt ON tdt.fk_id = h.fk_doctypeid;
 end;

 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 PROCEDURE ADD_STAC_OPER is
   vSMID_PROTHOPER_START Number;
   vSMID_PROTHOPER_OKON Number;
   vSMID_OPER_KOD Number;
 begin
   if ASU.PKG_SMINI.READSTRING('CONFIG', 'DB_NAME', 'H') = 'SK' then
     ADD_STAC_OPER_SK;
   else
     Select max(ts.fk_id)
       into vSMID_PROTHOPER_START
       from asu.tsmid ts
      where (fl_del <> 1 or fl_del is null)
        and ts.fc_synonim in ('PROTHOPER_START');

      Select max(ts.fk_id)
       into vSMID_PROTHOPER_OKON
        from asu.tsmid ts
       where (fl_del <> 1 or fl_del is null)
         and ts.fc_synonim in ('PROTHOPER_OKON');

     vSMID_OPER_KOD := STAT.PKG_STATUTIL.GET_SMIDID('OPER_KOD');

     -- http://192.168.1.9/redmine/issues/21836
     INSERT INTO asu.tusl_dbf d
      (Z$NAZ_ID,
       Z$FL_POLY,
       OWN,
       GLOBAL_ID,
       YEAR,
       MONTH,
       LPU_ID,
       LPU_INTR,
       LPU_NAPR,
       PERSON_IDL,
       ID_ILL,
       ID_ILL_U,
       POLICYSER,
       POLICYNUM,
       TYPE_USL,
       DATE_B_U,
       DATE_E_U,
       DATE_B_U_time,
       DATE_E_U_time,
       V_MU,
       KOD_MU,
       KOL_MU,
       N_QU, -- Номер сегмента (квадранта),
       N_TOOTH, -- Номер зуба (справочник ZF),
       P_TOOTH, -- поверхность зуба (справочник PZ),
       N_QU2, -- Номер сегмента (квадранта),
       N_TOOTH2, -- Номер зуба (справочник ZF),
       P_TOOTH2, -- поверхность зуба (справочник PZ),
       N_QU3, -- Номер сегмента (квадранта),
       N_TOOTH3, -- Номер зуба (справочник ZF),
       P_TOOTH3, -- поверхность зуба (справочник PZ),
       N_QU4, -- Номер сегмента (квадранта),
       N_TOOTH4, -- Номер зуба (справочник ZF),
       P_TOOTH4, -- поверхность зуба (справочник PZ),
       N_QU5, -- Номер сегмента (квадранта),
       N_TOOTH5, -- Номер зуба (справочник ZF),
       P_TOOTH5, -- поверхность зуба (справочник PZ),
       N_QU6, -- Номер сегмента (квадранта),
       N_TOOTH6, -- Номер зуба (справочник ZF),
       P_TOOTH6, -- поверхность зуба (справочник PZ),
       N_QU7, -- Номер сегмента (квадранта),
       N_TOOTH7, -- Номер зуба (справочник ZF),
       P_TOOTH7, -- поверхность зуба (справочник PZ),
       N_QU8, -- Номер сегмента (квадранта),
       N_TOOTH8, -- Номер зуба (справочник ZF),
       P_TOOTH8,
       DOC_CD_U,
       PRVSM_U,
       PR_MP,
       P_ID_ILL,
       FK_SOTRID,
       FK_SLUCHID,
       FK_KOYKAVIDID,
       KOD_EO,
       TYPE_EO,
       KOL_EO,
       fk_pacid)
      SELECT tu.Z$NAZ_ID,
             0 Z$FL_POLY,
             tu.own,
             tu.global_id,
             tu.year,
             tu.month,
             tu.lpu_id,
             tu.LPU_INTR,
             tu.lpu_napr,
             tu.person_idl,
             tu.id_ill,
             tu.ID_ILL_U,
             tu.policyser,
             tu.policynum,
             tu.TYPE_USL,

             tu.DATE_B_U,
             tu.DATE_E_U,
             tu.DATE_B_U_time,
             tu.DATE_E_U_time,

             null V_MU,

             9 KOD_MU, -- Медицинская услуга оперативного лечения при оплате по тарифам КСГ в стационаре и дневном стационаре
             1 KOL_MU,

             null,
             null,
             null,
             null,
             null,
             null,
             null,
             null,
             null,
             null,
             null,
             null,
             null,
             null,
             null,
             null,
             null,
             null,
             null,
             null,
             null,
             null,
             null,
             null,

             null DOC_CD_U,
             null PRVSM_U,

             tu.PR_MP,
             tu.P_ID_ILL,
             tu.FK_SOTRID,
             tu.FK_SLUCHID,
             -5 FK_KOYKAVIDID, -- -OPER_KOYKAVIDID - признак того, что это не перевод, а операция в стационаре
             tu.KOD_EO,
             8 TYPE_EO, -- Медицинская услуга оперативного лечения при тарифах КСГ
             1 KOL_EO,
             tu.fk_pacid
        from (SELECT n.FK_ID Z$NAZ_ID,
                     0 Z$FL_POLY,
                     tu.own,
                     tu.global_id,
                     tu.year,
                     tu.month,
                     tu.lpu_id,
                     tu.LPU_INTR,
                     tu.lpu_napr,
                     tu.person_idl,
                     tu.id_ill,
                     n.FK_ID ID_ILL_U,
                     tu.policyser,
                     tu.policynum,
                     tu.TYPE_USL,
                     tu.PR_MP,

                     trunc((SELECT max(I.FD_DATE) -- decode(max(I.FD_DATE), NULL, to_date(max(i.FC_CHAR), 'DD.MM.YYYY HH24:MI:SS'), max(I.FD_DATE))
                             FROM ASU.TIB I
                            WHERE I.FK_SMID = vSMID_PROTHOPER_START
                              AND I.FK_PACID = N.FK_ID)) DATE_B_U,
                     trunc((SELECT decode(max(I.FD_DATE), NULL, to_date(max(i.FC_CHAR), 'DD.MM.YYYY HH24:MI:SS'), max(I.FD_DATE))
                             FROM ASU.TIB I
                            WHERE I.FK_SMID = vSMID_PROTHOPER_OKON
                              AND I.FK_PACID = N.FK_ID)) DATE_E_U,
                     (SELECT max(I.FD_DATE) -- decode(max(I.FD_DATE), NULL, to_date(max(i.FC_CHAR), 'DD.MM.YYYY HH24:MI:SS'), max(I.FD_DATE))
                             FROM ASU.TIB I
                            WHERE I.FK_SMID = vSMID_PROTHOPER_OKON
                              AND I.FK_PACID = N.FK_ID) DATEtime_E_U,
                     tu.date_b_u_time,
                     tu.date_e_u_time,
                     tu.P_ID_ILL,
                     n.fk_ispolid FK_SOTRID,
                     tu.FK_SLUCHID,
--                     nvl(th.code,
                         (SELECT replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(max(I.FC_CHAR), 'А', 'A'), 'С', 'C'), 'В', 'B'), 'Е', 'E'), 'Н', 'H'), '|', 'I'), 'О', 'O'), 'М', 'M'), 'К', 'K'), 'Р', 'P'), 'Т', 'T') FC_KOD
                            FROM asu.TIB I
                           WHERE I.FK_SMID = vSMID_OPER_KOD
                             AND I.FK_PACID = n.fk_id--)
                             ) KOD_EO,
                     tu.fk_pacid
                from asu.tusl_dbf tu
--               inner join asu.tperesel tp on tp.fk_id = tu.id_ill_u
               inner join ASU.VNAZ N on n.fk_pacid = tu.fk_pacid
               inner join asu.tsmid_oper tsm on tsm.fk_id = n.fk_smid
--                left join asu.theal_smid ths on ths.fk_smid = n.fk_smid
--                left join (select th.fk_id, th.code from asu.theal th where th.fk_parent = asu.get_oper_healid -- ветка операций, 41221 для кардио
--                          ) th on th.fk_id = ths.fk_heal
               WHERE tu.z$fl_poly = 0
                 AND N.FK_NAZSOSID = ASU.GET_VIPNAZ) tu
       where tu.DATEtime_E_U between tu.date_b_u_time and tu.date_e_u_time;
   end if;

   -- Наркоз + отметка в случае о том, что он является операционным
   for c in (select exch43.pkg_exchcache.GET_THEIR_ID_ELSELOG(asu.GET_HOMS_COMPANYID,
                                                        'MORPHEY',
                                                        'TSMID',
                                                        (SELECT MAX(ti.fk_smid)
                                                           from ASU.tib ti
                                                          where ti.fk_id =
                                                                (SELECT MAX(i.fk_id)
                                                                   FROM ASU.tib i inner join ASU.TSMID_NARCOSIS s on s.fk_id = i.fk_smid
                                                                  WHERE i.fk_pacid = tu.z$naz_id)),
                                                        'asu.tsluch_dbf',
                                                        tu.fk_sluchid,
                                                        'NARKOZ_ID') narkoz_id,
                    tu.fk_sluchid
               from asu.tusl_dbf tu
              where tu.z$fl_poly = 0
                and tu.fk_koykavidid = OPER_KOYKAVIDID)
     loop
       update asu.tsluch_dbf ts set ts.oper_id = 1, ts.narkoz_id = c.narkoz_id where ts.fk_id = c.fk_sluchid;
     end loop;
 end;

 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 PROCEDURE ADD_STAC_OPER_SK is
   vSMID_PROTHOPER_START Number;
   vSMID_PROTHOPER_OKON Number;
 begin
  Select max(ts.fk_id)
    into vSMID_PROTHOPER_START
    from asu.tsmid ts
   where (fl_del <> 1 or fl_del is null)
     and ts.fc_synonim in ('PROTHOPER_START');

  Select max(ts.fk_id)
    into vSMID_PROTHOPER_OKON
    from asu.tsmid ts
   where (fl_del <> 1 or fl_del is null)
     and ts.fc_synonim in ('PROTHOPER_OKON');

   -- http://192.168.1.9/redmine/issues/21836
   INSERT INTO asu.tusl_dbf d
    (Z$NAZ_ID,
     Z$FL_POLY,
     OWN,
     GLOBAL_ID,
     YEAR,
     MONTH,
     LPU_ID,
     LPU_INTR,
     LPU_NAPR,
     PERSON_IDL,
     ID_ILL,
     ID_ILL_U,
     POLICYSER,
     POLICYNUM,
     TYPE_USL,
     DATE_B_U,
     DATE_E_U,
     DATE_B_U_TIME,
     DATE_E_U_TIME,
     V_MU,
     KOD_MU,
     KOL_MU,
     N_QU, -- Номер сегмента (квадранта),
     N_TOOTH, -- Номер зуба (справочник ZF),
     P_TOOTH, -- поверхность зуба (справочник PZ),
     N_QU2, -- Номер сегмента (квадранта),
     N_TOOTH2, -- Номер зуба (справочник ZF),
     P_TOOTH2, -- поверхность зуба (справочник PZ),
     N_QU3, -- Номер сегмента (квадранта),
     N_TOOTH3, -- Номер зуба (справочник ZF),
     P_TOOTH3, -- поверхность зуба (справочник PZ),
     N_QU4, -- Номер сегмента (квадранта),
     N_TOOTH4, -- Номер зуба (справочник ZF),
     P_TOOTH4, -- поверхность зуба (справочник PZ),
     N_QU5, -- Номер сегмента (квадранта),
     N_TOOTH5, -- Номер зуба (справочник ZF),
     P_TOOTH5, -- поверхность зуба (справочник PZ),
     N_QU6, -- Номер сегмента (квадранта),
     N_TOOTH6, -- Номер зуба (справочник ZF),
     P_TOOTH6, -- поверхность зуба (справочник PZ),
     N_QU7, -- Номер сегмента (квадранта),
     N_TOOTH7, -- Номер зуба (справочник ZF),
     P_TOOTH7, -- поверхность зуба (справочник PZ),
     N_QU8, -- Номер сегмента (квадранта),
     N_TOOTH8, -- Номер зуба (справочник ZF),
     P_TOOTH8,
     DOC_CD_U,
     PRVSM_U,
     PR_MP,
     P_ID_ILL,
     FK_SOTRID,
     FK_SLUCHID,
     FK_KOYKAVIDID,
     KOD_EO,
     TYPE_EO,
     KOL_EO,
     fk_pacid)
    SELECT tu.Z$NAZ_ID,
           0 Z$FL_POLY,
           tu.own,
           tu.global_id,
           tu.year,
           tu.month,
           tu.lpu_id,
           tu.LPU_INTR,
           tu.lpu_napr,
           tu.person_idl,
           tu.id_ill,
           tu.ID_ILL_U,
           tu.policyser,
           tu.policynum,
           tu.TYPE_USL,

           tu.DATE_B_U,
           tu.DATE_E_U,
           tu.DATE_B_U_TIME,
           tu.DATE_E_U_TIME,

           null V_MU,

           9 KOD_MU, -- Медицинская услуга оперативного лечения при оплате по тарифам КСГ в стационаре и дневном стационаре
           1 KOL_MU,

           null,
           null,
           null,
           null,
           null,
           null,
           null,
           null,
           null,
           null,
           null,
           null,
           null,
           null,
           null,
           null,
           null,
           null,
           null,
           null,
           null,
           null,
           null,
           null,

           null DOC_CD_U,
           null PRVSM_U,

           321 PR_MP,
           tu.P_ID_ILL,
           tu.FK_SOTRID,
           tu.FK_SLUCHID,
           -5 FK_KOYKAVIDID, -- -OPER_KOYKAVIDID - признак того, что это не перевод, а операция в стационаре
           tu.KOD_EO,
           8 TYPE_EO, -- Медицинская услуга оперативного лечения при тарифах КСГ
           1 KOL_EO,
           tu.fk_pacid
      from (SELECT n.FK_ID Z$NAZ_ID, 0 Z$FL_POLY, tu.own, tu.global_id, tu.year, tu.month, tu.lpu_id,  tu.LPU_INTR,  tu.lpu_napr, tu.person_idl, tu.id_ill,
                   decode(ts.fc_name, null, ti.fk_id, N.FK_ID) ID_ILL_U,
                   tu.policyser, tu.policynum, tu.TYPE_USL,

                   trunc((SELECT I.FD_DATE -- NVL(I.FD_DATE, to_date(FC_CHAR, 'DD.MM.YYYY HH24:MI:SS'))
                           FROM ASU.TIB I
                          WHERE I.FK_SMID = vSMID_PROTHOPER_START
                            AND I.FK_PACID = N.FK_ID)) DATE_B_U,
                   trunc((SELECT I.FD_DATE -- NVL(I.FD_DATE, to_date(FC_CHAR, 'DD.MM.YYYY HH24:MI:SS'))
                           FROM ASU.TIB I
                          WHERE I.FK_SMID = vSMID_PROTHOPER_OKON
                            AND I.FK_PACID = N.FK_ID)) DATE_E_U,
                   tu.P_ID_ILL,
                   tpn.fk_sotrid FK_SOTRID,
                   tu.FK_sluchid,
                   th.code KOD_EO,
                   tu.DATE_B_U_TIME,
                   tu.DATE_E_U_TIME,
                   tu.fk_pacid
          FROM asu.tusl_dbf tu
         inner join asu.vnaz N on n.fk_pacid = tu.fk_pacid
          left join ASU.TPODPISNAZ tpn on tpn.fk_nazid = N.FK_ID
         inner join ( Select ts.fk_id, '' fc_name from ASU.TSMID_OPER ts
                      union all
                      SELECT FK_ID, fc_name
                        FROM ASU.TSMID
                      CONNECT BY PRIOR fk_id = fk_owner
                       START WITH FC_SYNONIM = 'RENTGENXIR_ISSLED'
                     ) ts on ts.fk_id = n.fk_smid
         left join ASU.TIB tI on tI.FK_PACID = N.FK_ID
                             and tI.FK_SMEDITID IN (Select ts.fk_id from asu.tsmid ts where (fl_del <> 1 or fl_del is null) connect by prior ts.fk_id = ts.fk_owner start with ts.fc_synonim in ('PROC_OPER_NAZ_OPER'))
                             and ts.fc_name is null
         left join asu.tsmid tsi on tsi.fk_id = ti.fk_smid

         left join asu.theal_smid ths on ths.fk_smid = decode(ts.fc_name, null, tsi.fk_id, ts.fk_id)
         left join (select th.fk_id, th.code from asu.theal th where th.fk_parent = asu.get_oper_healid -- ветка операций, 41221 для кардио
                   ) th on th.fk_id = ths.fk_heal
         WHERE N.FK_NAZSOSID = ASU.GET_VIPNAZ
           and th.fk_id is not null
           and tu.fk_koykavidid <> OPER_KOYKAVIDID) tu;
 end;

 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 PROCEDURE ADD_AMB_USL_AND_OPER_DOC_DATA is
 begin
  -- Исправляются данные врача ТОЛЬКО ДЛЯ ПОЛИКЛИНИКИ!
  FOR C IN (SELECT tu.fk_id,
                   LAST_VALUE(vr.fk_vrachid) OVER(PARTITION BY vr.fk_nazid ORDER BY vr.fk_id ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) fk_vrachid_last
              FROM asu.tusl_dbf tu
             INNER JOIN asu.TRESLECH vr ON vr.fk_nazid = tu.z$naz_id
             WHERE vr.fk_vrachid > 0
               and tu.z$fl_poly = 1)
  LOOP
    update asu.tusl_dbf d set d.fk_sotrid = c.fk_vrachid_last where d.fk_id = c.fk_id;
  END LOOP;

  -- заполняются данные врача
  FOR C IN (SELECT tu.fk_id,
                   DECODE(TVKN.FK_PMSP, NULL,
                   EXCH43.PKG_EXCHCACHE.GET_THEIR_ID_ELSELOG(ASU.GET_HOMS_COMPANYID, 'PMSP', 'THELP_TYPE', THT.FK_ID, 'ASU.TUSL_DBF', TU.Fk_Id, 'V_MU'),
                   TVKN.FK_PMSP) V_MU,

                   DECODE(LENGTH(TO_CHAR(TST.FN_INN)), 11, '0' || TO_CHAR(TST.FN_INN), TO_CHAR(TST.FN_INN)) DOC_CD_U,

                   DECODE(TVKN.FK_VSO_VSD_SSO, NULL,
                          EXCH43.PKG_EXCHCACHE.GET_THEIR_ID_ELSELOG(ASU.GET_HOMS_COMPANYID, 'VSO_VSD_SSO', 'TSOTR_SPEC', TSS.FK_ID, 'ASU.TUSL_DBF', TU.Fk_Id, 'PRVSM_U'),
                          TVKN.FK_VSO_VSD_SSO) PRVSM_U,

                   decode(tu.z$fl_poly, 0, tu.PR_MP, -- Для стационара профиль не меняется и остаётся таким же как в цслуге к КСГ
                     EXCH43.PKG_EXCHCACHE.GET_THEIR_ID_ELSELOG (ASU.GET_HOMS_COMPANYID, 'PROFMP_P', 'TSOTR_SPEC',
                       EXCH43.PKG_EXCHCACHE.GET_OUR_ID(ASU.GET_HOMS_COMPANYID, 'VSO_VSD_SSO','TSOTR_SPEC',
                         DECODE(TVKN.FK_VSO_VSD_SSO, NULL,
                                EXCH43.PKG_EXCHCACHE.GET_THEIR_ID(ASU.GET_HOMS_COMPANYID, 'VSO_VSD_SSO', 'TSOTR_SPEC', TSS.FK_ID),
                                TVKN.FK_VSO_VSD_SSO) ),
                         'ASU.TUSL_DBF', TU.Fk_Id, 'PR_MP' )) PR_MP
              FROM ASU.TUSL_DBF TU
             INNER JOIN LOGIN.TSOTR TST ON TST.FK_ID = TU.FK_SOTRID

              LEFT JOIN ASU.THELP_TYPE THT ON THT.FK_ID = TST.FK_HELPTYPE
              LEFT JOIN ASU.TSOTR_SPEC TSS ON TSS.FK_ID = TST.FK_MEDSPEC

              left JOIN ASU.VNAZ N ON N.FK_ID = TU.Z$NAZ_ID
              LEFT JOIN ASU.TVRACHKAB TVK ON TVK.FK_SOTRID = TU.FK_SOTRID
              LEFT JOIN ASU.TVRACHKAB_NAZ TVKN ON TVKN.FK_SOTRKABID = TVK.FK_ID AND TVKN.FK_SMID = N.FK_SMID
             WHERE tu.z$fl_poly = 1
                or (tu.z$fl_poly = 0 and tu.fk_koykavidid = OPER_KOYKAVIDID)
 )
  LOOP
    update asu.tusl_dbf d
       set d.V_MU = c.V_MU,
           d.DOC_CD_U = c.DOC_CD_U,
           d.PRVSM_U = c.PRVSM_U,
           d.PR_MP = c.PR_MP
     where d.fk_id = c.fk_id;
  END LOOP;
 end;

 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
/*
 PROCEDURE ADD_SUM_DATA(pUslId IN asu.tusl_dbf.fk_id%TYPE) IS
  -- Заполняем временную таблицу
  is_osmotr NUMBER;
  is_fizter NUMBER;
  is_dent NUMBER;
  vIS_KOD_MU_IS_1 NUMBER;
  vfn_edchild NUMBER;
  vfn_ed NUMBER;

  v_smid    asu.tsmid.fk_id%TYPE;
  v_heal    asu.theal.fk_id%TYPE;
  v_vrach   asu.vnaz.fk_vrachid%TYPE;
  v_run     asu.vnaz.fd_run%TYPE;
  --
  v_KOD_MU  asu.tusl_dbf.kod_mu%TYPE;
  v_KOL_MU  asu.tusl_dbf.kol_mu%TYPE;
  v_TYPE_EO asu.tusl_dbf.type_eo%TYPE;
  v_COST_EO asu.tusl_dbf.cost_eo%TYPE;
  v_SUM_EO  asu.tusl_dbf.sum_eo%TYPE;
  v_KOD_EO  asu.tusl_dbf.kod_eo%TYPE;
  v_KOL_EO  asu.tusl_dbf.kol_eo%TYPE;
  v_DATE_B_U asu.tusl_dbf.date_b_u%type;
  v_DATE_E_U asu.tusl_dbf.date_e_u%type;
  V_MU asu.tusl_dbf.V_MU%type;

  vID_ILL_U NUMBER;

  vTompCostDT Date;
  vYears Number;
  vCODE varchar(4);

  vSluchId asu.tusl_dbf.fk_sluchid%TYPE;
  vIsNazAsTest Number;

  vTIPROOM Number;
  vOWN Number;
  vAMB_PR Number;
  vPol varchar(1);
BEGIN
  vCODE := null;
  v_smid := null;
  v_heal := null;

  v_KOL_MU := 1;
  v_KOL_EO := 1;

  -- Efimov V.A. 20100104 Значение DATE_B_U, DATE_E_U изменяется только для физиопроцедур (и вообще для процедур для которых опередлён параметр кол-во)
  select ts.date_e, t.v_Mu, t.fk_sluchid, t.DATE_B_U, t.DATE_E_U, t.own, ts.amb_pr, ts.pol
    into vTompCostDT, V_MU, vSluchId, v_DATE_B_U, v_DATE_E_U, vOWN, vAMB_PR, vPol
    FROM asu.tusl_dbf t
    left join asu.tsluch_dbf ts on ts.fk_id = t.fk_sluchid
   WHERE t.FK_ID = pUslId;

--  IF vis_poly = 1 THEN
    SELECT nvl(TRUNC(MONTHS_BETWEEN(tu.date_e_u, ts.date_b_day)/12), 0) into vYears
      FROM ASU.tsluch_dbf ts inner join asu.tusl_dbf tu on tu.fk_sluchid = ts.fk_id WHERE tu.fk_id = pUslId;

    if vYears >= 18 then
      vCODE := 'TPV%';
    else
      -- Коды TPN, TPG, TPB добавлены в связи с http://192.168.1.9/redmine/issues/24630 по просьбе Насти Яровой
      if vAMB_PR = 14 then
        vCODE := 'TPN%'; -- Период. мед. осмотры несовершеннолетних
      else
        if (vAMB_PR = 12) or (vAMB_PR = 13) then
          if vPol = 'Ж' then
            vCODE := 'TPG'; -- девочки
          else
            vCODE := 'TPB'; -- мальчики
          end if;
          if vAMB_PR = 12 then
            vCODE := vCODE || '.1%'; -- Проф. мед. осмотры несовершеннолетних
          else
            vCODE := vCODE || '.2%'; -- Предв. мед. осмотры несовершеннолетних
          end if;
        else
          vCODE := 'TPD%';
        end if;
      end if;
    end if;

    select tu.id_ill_u into vID_ILL_U from asu.tusl_dbf tu where tu.fk_id = pUslId;

    select Max(vn.fk_smid), Max(vn.fk_vrachid), TRUNC(Max(vn.fd_run)), max(tnh.fk_healid) fk_healid
      INTO v_smid, v_vrach, v_run, v_heal
      from asu.tambtalon tat
     inner join asu.tambtalon_naz tatn on tatn.fk_talonid = tat.fk_id
     inner join asu.vnaz vn on vn.fk_id = tatn.fk_nazid
     inner join asu.tnazheal tnh on tnh.fk_nazid = vn.fk_id
     where tnh.fk_id = vID_ILL_U;

    if v_heal is not null then
      select max(t.code) code, max(t.fn_cost), decode(substr(max(t.CODE), 1, 1), 'T', 1, null) is_osmotr
        INTO v_KOD_EO, v_COST_EO, is_osmotr
        FROM (SELECT h.code,
                     LAST_VALUE(c.fn_cost) OVER(PARTITION BY own2.fk_id, s.fk_smid, h.code, c.fd_date1, c.fd_date2, dt.fd_date1, dt.fd_date2 ORDER BY C.FD_DATE1, C.FD_DATE2, c.fk_id ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) fn_cost
                FROM ASU.THEAL H
               INNER JOIN ASU.THEAL_COST C ON C.FK_HEALID = H.FK_ID
               INNER JOIN ASU.THEAL_SMID S ON S.FK_HEAL = H.FK_ID
                LEFT JOIN asu.theal_smid_dt dt ON dt.fk_heal_smid = s.fk_id
               INNER JOIN (SELECT MAX(tdt.fk_id) fk_id FROM asu.ttypedoc tdt WHERE tdt.fc_synonim = 'OMS') tdt ON tdt.fk_id = h.fk_doctypeid
                LEFT JOIN (SELECT tho.fk_id FROM asu.theal tho WHERE tho.code LIKE 'OWN2%') own2 ON own2.fk_id = h.fk_parent
               WHERE (dt.fk_id IS NULL OR vTompCostDT BETWEEN dt.FD_DATE1 AND NVL(dt.FD_DATE2, vTompCostDT))
                 AND FN_COST IS NOT NULL
                 AND CODE IS NOT NULL
                 AND h.fp_healtype = 1
                 AND vTompCostDT BETWEEN C.FD_DATE1 AND NVL(C.FD_DATE2, vTompCostDT)
                 and h.fk_id = v_heal
                 AND (substr(h.CODE, 1, 1) <> 'T' OR h.CODE LIKE  vCODE)
                 and ((own2.fk_id is null and vown = 1) or (own2.fk_id is not null and vown = 2))
                 ) t
      where rownum = 1;
    else
      select Max(vn.fk_smid), Max(vn.fk_vrachid), TRUNC(Max(vn.fd_run))
        INTO v_smid, v_vrach, v_run
        from asu.tambtalon tat
       inner join asu.tambtalon_naz tatn on tatn.fk_talonid = tat.fk_id
       inner join asu.vnaz vn on vn.fk_id = tatn.fk_nazid
       where vn.fk_id = vID_ILL_U;

       -- Efimov V.A. 20111227 Если усслугу не относится к осмотру, то в is_osmotr устанавляается в null, это так же относится к случаю, когда соответствующая услуга вообще не найдена
      select max(t.code) code, max(t.fn_cost), decode(substr(max(t.CODE), 1, 1), 'T', 1, null) is_osmotr
        INTO v_KOD_EO, v_COST_EO, is_osmotr
        FROM (SELECT h.code,
                     LAST_VALUE(c.fn_cost) OVER(PARTITION BY own2.fk_id, s.fk_smid, h.code, c.fd_date1, c.fd_date2, dt.fd_date1, dt.fd_date2 ORDER BY C.FD_DATE1, C.FD_DATE2, c.fk_id ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) fn_cost
                FROM ASU.THEAL H
               INNER JOIN ASU.THEAL_COST C ON C.FK_HEALID = H.FK_ID
               INNER JOIN ASU.THEAL_SMID S ON S.FK_HEAL = H.FK_ID
                LEFT JOIN asu.theal_smid_dt dt ON dt.fk_heal_smid = s.fk_id
               INNER JOIN (SELECT MAX(tdt.fk_id) fk_id FROM asu.ttypedoc tdt WHERE tdt.fc_synonim = 'OMS') tdt ON tdt.fk_id = h.fk_doctypeid
                LEFT JOIN (SELECT tho.fk_id FROM asu.theal tho WHERE tho.code LIKE 'OWN2%') own2 ON own2.fk_id = h.fk_parent
               WHERE (dt.fk_id IS NULL OR vTompCostDT BETWEEN dt.FD_DATE1 AND NVL(dt.FD_DATE2, vTompCostDT))
                 AND FN_COST IS NOT NULL
                 AND CODE IS NOT NULL
                 AND h.fp_healtype = 1
                 AND vTompCostDT BETWEEN C.FD_DATE1 AND NVL(C.FD_DATE2, vTompCostDT)
                 and s.fk_smid = v_smid
                 AND (substr(h.CODE, 1, 1) <> 'T' OR h.CODE LIKE vCODE)
                 and ((own2.fk_id is null and vown = 1) or (own2.fk_id is not null and vown = 2))
                 ) t
      where rownum = 1;
    end if;

    IF is_osmotr IS NOT NULL THEN
       -- Осмотр
       v_KOD_MU  := 1;
       if (vCODE = 'TPV%') or (vCODE = 'TPD%') then
         v_TYPE_EO := 4; --  Тарифы посещение врачей при оказании амбулаторной МП
       else
         v_TYPE_EO := 10; -- медосмотр несовершеннолетних
       end if;
    ELSE
       -- диагностическая или физиотерапевтическая услуга
       SELECT MAX(s.fk_id)
         INTO is_fizter
         FROM asu.tsmid_fizter S
        WHERE S.FK_ID = v_smid;

       vIsNazAsTest := 0;
       if is_fizter IS NULL then
         -- Efimov V.A. 20120315 http://192.168.1.9/redmine/issues/17385 Настройка назначения, как тесты, перенесена в aTomp, для возможности указывать сроки действия соответствия с помощью механизма, уже реализованного для соответствия назначения и услуги
         -- Efimov V.A. 20120404 http://192.168.1.9/redmine/issues/12835 То, является назначение тестом или нет теперь оценивается не по двте закрытия талона, а по дате выполнения услуги
         SELECT count(*)
           into vIsNazAsTest
           FROM ASU.THEAL H
          inner join ASU.THEAL_SMID S on S.FK_HEAL = H.FK_ID
           left join asu.theal_smid_dt dt on dt.fk_heal_smid = s.fk_id
          WHERE h.CODE = 'NAZ_AS_TEST_H'
            and (dt.fk_id is null or v_DATE_E_U BETWEEN dt.FD_DATE1 AND NVL(dt.FD_DATE2, v_DATE_E_U))
--            and (v_heal is null) or (h.fk_id = v_heal)
            and S.FK_SMID = v_smid;
       end if;

       if is_fizter IS NULL and vIsNazAsTest = 0 then
         select nvl(max(count(*)), 0) fn_count
           into v_KOL_EO
           from asu.vnaz vn
          where vn.fk_nazsosid = ASU.GET_VYPNAZSOSID
            and vn.fk_id = vID_ILL_U
          group by vn.fk_id;

         if v_KOL_EO > 0 then
           select nvl(Max(ti.fn_num), 1)
             into v_KOL_EO
             from (select ts.fk_id
                     from asu.tsmid ts
                    where ts.fc_synonim = 'KOL_VO'
                   connect by prior ts.fk_id = ts.fk_owner
                    start with ts.fk_id = v_smid) ts
            inner join asu.tib ti on ti.fk_smeditid = ts.fk_id
            where ti.fk_pacid = vID_ILL_U; -- Efimov V.A. http://192.168.1.9/redmine/issues/13592 По предложению Насти Ковалёвой переделал запрос в древовидный, т.к. Кол-ао может быть вложено не в саму услугу, а в подветки

           select trunc(Min(vn.fd_run)),
                  trunc(Max(vn.fd_run))
             into v_DATE_B_U, v_DATE_E_U
             from asu.vnaz vn
            where vn.fk_nazsosid = ASU.GET_VYPNAZSOSID
              and vn.fk_id = vID_ILL_U
            group by vn.fk_id;
         end if;
       else
         if is_fizter IS NOT NULL then
           select nvl(max(count(*)), 0) fn_count
             into v_KOL_EO
             from asu.vnaz vn
             left join asu.tnazlech tnl on tnl.fk_id = vn.fk_id
             left join TRESLECH trl on trl.fk_nazid = tnl.fk_id
            where decode(trl.fk_sos, null, vn.fk_nazsosid, trl.fk_sos) = ASU.GET_VYPNAZSOSID
              and vn.fk_id = vID_ILL_U
            group by vn.fk_id;

           if v_KOL_EO > 0 then
             select trunc(Min(decode(trl.fd_ins, null, vn.fd_run, trl.fd_ins))),
                    trunc(Max(decode(trl.fd_ins, null, vn.fd_run, trl.fd_ins)))
               into v_DATE_B_U, v_DATE_E_U
               from asu.vnaz vn
               left join asu.tnazlech tnl on tnl.fk_id = vn.fk_id
               left join TRESLECH trl on trl.fk_nazid = tnl.fk_id
              where decode(trl.fk_sos, null, vn.fk_nazsosid, trl.fk_sos) = ASU.GET_VYPNAZSOSID
                and vn.fk_id = vID_ILL_U
              group by vn.fk_id;
           end if;
         else
  -- Efimov V.A. 20110523 Для некоторых лабораторных тестов (список настраивается в параметрах Eachange43.exe) считается кол-во тестов http://192.168.1.9/redmine/issues/11629
           select nvl(max(count(*)), 0) fn_count
             into v_KOL_EO
             from asu.vnaz vn
             left join asu.tresan tra on tra.fk_nazid = vn.fk_id
            where (tra.fl_zakl = 0 and (tra.fc_res is not null or tra.fn_res is not null or tra.fk_blobid is not null)) -- добавил or tra.fk_blobid is not null по предложению Андрея Неронова в связи http://192.168.1.9/redmine/issues/21973
              and vn.fk_id = vID_ILL_U
            group by vn.fk_id;

           if v_KOL_EO > 0 then
             select trunc(Min(decode(tra.fd_ins, null, vn.fd_run, tra.fd_ins))),
                    trunc(Max(decode(tra.fd_ins, null, vn.fd_run, tra.fd_ins)))
               into v_DATE_B_U, v_DATE_E_U
               from asu.vnaz vn
               left join asu.tresan tra on tra.fk_nazid = vn.fk_id
              where tra.fl_zakl = 1 -- Efimov V.A. 20120703 Исправил по предложению Насти Ковалёвой (при поддержке Димы Кульбацкого)
--              where (tra.fl_zakl = 0 and (tra.fc_res is not null or tra.fn_res is not null))
                and vn.fk_id = vID_ILL_U
              group by vn.fk_id;
           end if;
         end if;
       end if;

       if v_KOL_EO = 0 then -- Efimov V.A. 20110602 0 присваевается v_COST_EO, т.к. ниже делается проверк на v_KOD_EO = 0
         v_COST_EO := 0;
       end if;

       if is_osmotr is null then -- Efimov V.A. 20111021 kol_mu = kol_eo для всех амбулаторных случаев, кроме осмотров, по предложению Насти Ковалёвой http://192.168.1.9/redmine/issues/14015
         v_KOL_MU := v_KOL_EO;
       end if;

       if is_fizter IS NOT NULL THEN
         -- физиотерапевтическая
         v_KOD_MU  := 6;
         v_TYPE_EO := 5;
       ELSE
         -- диагностическая
         SELECT MAX(s.fk_id), nvl(MAX(s.fn_edchild), 1), nvl(MAX(s.fn_ed), 1)
           INTO is_dent, vfn_edchild, vfn_ed
           FROM asu.tsmid_dent S
          WHERE S.FK_ID = v_smid;

         if is_dent is not null then
           v_TYPE_EO := 2;

           select decode(max(FC_ASKID), null, 0, 1)
             into vIS_KOD_MU_IS_1
             from asu.treplytable
            where FC_ASK = 'ASU.THEAL'
              and FC_ASKFIELD = 'CODE'
              and FC_REPLY = 'DBF_KOD_MU_IS_1_BY_DANTHEAL'
              and FC_REPLYFIELD = 'FL_CHECK'
              and FC_REPLYID = '1'
              AND FC_ASKID = v_KOD_EO;
           if vIS_KOD_MU_IS_1 = 1 then
             v_KOD_MU := 1; -- Efimov V.A. 20120607 http://192.168.1.9/redmine/issues/18905 По просьбе Пыть-ях для одной услуги изменил KOD_MU
           else
             v_KOD_MU := 4; -- Efimov V.A. 20120605 http://192.168.1.9/redmine/issues/18905 Для стаматологии KOD_MU = 4 по просьбе Пыть-ях
             if vYears < 18 then
               v_KOL_MU := vFN_EDCHILD;
             else
               v_KOL_MU := vFN_ED;
             end if;

             -- По просьбе Маши Коваленко добавил проверку v_KOL_MU = 0
             if v_KOL_MU = 0 then
               v_KOL_MU := 1;
             end if;
           end if;
         else
           v_KOD_MU := 5;
           v_TYPE_EO := 1;
         end if;
       END IF;
    END IF;

  if v_KOL_EO < 1 THEN
    v_SUM_EO := v_COST_EO;
  ELSE
    v_SUM_EO := v_KOL_EO * v_COST_EO;
  END IF;

  delete from asu.tuslnocompare where FK_USLID = pUslId;
  if v_kod_eo is null then
    insert into asu.TUSLNOCOMPARE(FK_USLID, FK_SMID, FK_TIPROOM) values(pUslId, v_smid, vTIPROOM);
  end if;

  UPDATE asu.tusl_dbf
     SET KOD_MU   = v_KOD_MU,
         KOL_MU   = v_KOL_MU,
         TYPE_EO  = v_TYPE_EO,
         KOD_EO   = v_kod_eo,
         KOL_EO   = v_KOL_EO,
         COST_EO  = v_COST_EO,
         SUM_EO   = v_SUM_EO,
         DATE_B_U = v_DATE_B_U,
         DATE_E_U = v_DATE_E_U
   WHERE fk_id = pUslId;
 END;
*/

 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
-- aAmbGroupMode
-- 0 - Обычный расчёт по всем записям
-- 1 - Расчёт только по сгруппированным талонам (для группировкb/разгруппировки амб. талонов)
 PROCEDURE ADD_AMB_SUM_DATA(aAmbGroupMode Integer default 0) IS
 BEGIN
  -- заполнение таблицы цен
  EXECUTE IMMEDIATE('truncate table asu.vnaz_cost_limit');
  insert into ASU.VNAZ_COST_LIMIT(fk_nazid, FD_CALC)
  SELECT t.Z$NAZ_ID, ts.date_e
    FROM asu.tusl_dbf t
   inner join asu.tsluch_dbf ts on ts.fk_id = t.fk_sluchid
   where t.z$fl_poly = 1
     and ts.FN_DISP_FSTAGE_NAZ = 0 -- не диспансеризация или второй этап диспансеризации
     and ts.q_u <> 7 -- не скорая помощь
     and ts.fk_uslvidid <> ASU.GET_USLVID_CHILD -- не осмотры детей
     and (aAmbGroupMode = 0 or (aAmbGroupMode = 1 and t.fk_pregroupsluchid > 0));
  EXECUTE IMMEDIATE('analyze table asu.vnaz_cost_limit compute statistics for table for all indexes for all columns size 100'); -- Добавил по совету Паши Кашкарова, для ускорения работы

  EXECUTE IMMEDIATE('truncate table ASU.Vnaz_Cost_Heal_Cut');
  insert into ASU.Vnaz_Cost_Heal_Cut(TYPEDOC_SYN) select t.FC_SYNONIM from asu.ttypedoc t where t.FC_SYNONIM <> 'OMS';

  asu.pkg_vnaz_cost .Calculate;

  -- амулаторные услуги
  FOR C IN (SELECT t.fk_id,
                   case when substr(c.heal_code_oms, 1, 1) = 'T' then 1 -- осмотр
                        when sf.fk_id is not null then 6 -- физиопроцедуры
                        when sd.fk_id is not null then decode(is1.IS_KOD_MU_IS_1, 1, 1, 4) -- стоматология
                        else 5
                   end KOD_MU,

                   case when substr(c.heal_code_oms, 1, 1) = 'T' then 1 -- осмотр
                        when sd.fk_id is not null then -- стоматология
                             case when is1.IS_KOD_MU_IS_1 = 1 then 1
                             else case when nvl(TRUNC(MONTHS_BETWEEN(t.date_e_u, ts.date_b_day)/12), 0) < 18 then sd.fn_edchild
                                  else sd.fn_ed
                                  end
                             end
                        else case when nvl(c.heal_count, 1) > 100 then 100 else nvl(c.heal_count, 1) end
                   end KOL_MU,

                   case when substr(c.heal_code_oms, 1, 1) = 'T' then
                             case when (substr(c.heal_code_oms, 1, 3) = 'TPV') or (substr(c.heal_code_oms, 1, 3) = 'TPD') then 4 --  Тарифы посещение врачей при оказании амбулаторной МП
                                  else 10 -- медосмотр несовершеннолетних
                             end
                        when sf.fk_id is not null then 5 -- физиопроцедуры
                        when sd.fk_id is not null then 2 -- стоматология
                        else 1
                   end TYPE_EO,

                   c.heal_code_oms KOD_EO,
                   c.heal_count KOL_EO,
                   decode(c.heal_code_oms, NULL, 0, decode(C.cost_type_oms, 3, c.fn_cost_oms, NULL)) COST_EO,
                   decode(c.heal_code_oms, NULL, 0, decode(C.cost_type_oms, 3, c.heal_count * c.fn_cost_oms, NULL)) SUM_EO,
                   c.date_b_u DATE_B_U,
                   c.date_e_u DATE_E_U
              FROM asu.tusl_dbf t
             inner join asu.tsluch_dbf ts on ts.fk_id = t.fk_sluchid
             inner join ASU.VNAZ_COST c on c.id_ill_u = t.id_ill_u
             inner join asu.vnaz v on v.fk_id = t.z$naz_id
              left join asu.tsmid_fizter sf on sf.fk_id = v.fk_smid
              left join asu.tsmid_dent sd on sd.fk_id = v.fk_smid
              left join (select FC_ASKID KOD_EO, decode(max(FC_ASKID), null, 0, 1) IS_KOD_MU_IS_1 -- Efimov V.A. 20120607 http://192.168.1.9/redmine/issues/18905 По просьбе Пыть-ях для одной услуги изменил KOD_MU
                           from asu.treplytable
                          where FC_ASK = 'ASU.THEAL'
                            and FC_ASKFIELD = 'CODE'
                            and FC_REPLY = 'DBF_KOD_MU_IS_1_BY_DANTHEAL'
                            and FC_REPLYFIELD = 'FL_CHECK'
                            and FC_REPLYID = '1'
                          group by FC_ASKID) is1 on is1.KOD_EO = c.heal_code_oms
             where t.z$fl_poly = 1
               and ts.FN_DISP_FSTAGE_NAZ = 0 -- не диспансеризация или второй этап диспансеризации
               and ts.q_u <> 7 -- и не скорая помощь
               and ts.fk_uslvidid <> ASU.GET_USLVID_CHILD) -- и не осмотры детей
   LOOP
    UPDATE asu.tusl_dbf
       SET KOD_MU   = c.KOD_MU,
           KOL_MU   = c.KOL_MU,
           TYPE_EO  = c.TYPE_EO,
           KOD_EO   = c.kod_eo,
           KOL_EO   = c.KOL_EO,
           COST_EO  = c.COST_EO,
           SUM_EO   = c.SUM_EO,
           DATE_B_U = c.DATE_B_U,
           DATE_E_U = c.DATE_E_U
     WHERE fk_id = c.fk_id;
   END LOOP;

  UPDATE asu.tusl_dbf SET COST_EO = 0, SUM_EO = 0 WHERE KOD_EO IS NULL;

  -- Несопоставленные услуги джолжны попадать в выгрузку, но не выгружаться в DBF, поэтому добавляю их в список отсутствующих соответствий
  insert into asu.TUSLNOCOMPARE
    (FK_USLID, FK_SMID, FK_TIPROOM)
    select t.fk_id, vn.fk_smid, NULL
      from asu.tusl_dbf t
    INNER JOIN asu.vnaz vn ON vn.fk_id = t.Z$NAZ_ID
     where t.z$fl_poly = 1
       and t.kod_eo is not null
       and t.cost_eo is null;
 END;

 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 PROCEDURE ADD_ER IS
  vER_IBID number;
  vER_EMA_RESULT number;
  vER_CALL_RESULT number;
 BEGIN
  select max(fk_id) into vER_IBID from asu.tsmid t where fc_synonim = 'ER_IBID';
  select max(fk_id) into vER_EMA_RESULT from asu.tsmid t where fc_synonim = 'ER_EMA_RESULT';
  select max(fk_id) into vER_CALL_RESULT from asu.tsmid t where fc_synonim = 'ER_CALL_RESULT';

  -- добавление случаев
  for c in (
    select ts.fk_id,
           ti_ER_IBID.fn_num ER_IBID, ti_ER_EMA_RESULT.fk_smid ER_EMA_RESULT, ti_ER_CALL_RESULT.fk_smid ER_CALL_RESULT,
           tst.fk_medspec
      from asu.tsluch_dbf ts
     inner join asu.tambtalon ta on ta.fk_id = ts.id_ill
     inner join asu.tambulance t on t.fk_id = ta.fk_ambid
     inner join asu.tdocobsl td on td.fk_id = t.fk_docobsl
      left join (select ti.fk_pacid, ti.fn_num from asu.tib ti where ti.fk_smid = vER_IBID) ti_ER_IBID on ti_ER_IBID.fk_pacid = ta.fk_id
      left join (select ti.fk_pacid, ti.fk_smid from asu.tib ti where ti.fk_smeditid = vER_EMA_RESULT) ti_ER_EMA_RESULT on ti_ER_EMA_RESULT.fk_pacid = ta.fk_id
      left join (select ti.fk_pacid, ti.fk_smid from asu.tib ti where ti.fk_smeditid = vER_CALL_RESULT) ti_ER_CALL_RESULT on ti_ER_CALL_RESULT.fk_pacid = ta.fk_id
      left join login.tsotr tst on tst.fk_id = ta.fk_sotrclosed
     where td.fk_viddocid = asu.GET_USLVID_ER)

  loop
    update asu.tsluch_dbf ts
       set ts.Dia_o     = null,
           ts.Dia_c     = null,
           ts.N_MAP     = null,
           ts.N_MAP_AMB = c.ER_IBID,
           ts.N_NAPR    = null,
           ts.DATE_NAPR = null,
           ts.Q_U       = 7, -- по этому полю можно узнать скорую помощь
           ts.pr_mp     = exch43.pkg_exchcache.GET_THEIR_ID_ELSELOG(asu.GET_HOMS_COMPANYID, 'PROFMP_SMP', 'TSOTR_SPEC', c.fk_medspec,
                                                                    'asu.tsluch_dbf', ts.fk_id, 'PR_MP'),
           ts.TYPE_MP   = 3,
           ts.TYPE_V_MU = 5,
           ts.RES_G     = exch43.pkg_exchcache.GET_THEIR_ID_ELSELOG(asu.GET_HOMS_COMPANYID, 'REZOBR_SMP', 'TSMID', c.ER_EMA_RESULT,
                                                                    'asu.tsluch_dbf', ts.fk_id, 'RES_G'),
           ts.RESG_DOP  = exch43.pkg_exchcache.GET_THEIR_ID_ELSELOG(asu.GET_HOMS_COMPANYID, 'REZOBR_DOP_SMP', 'TSMID', c.ER_CALL_RESULT,
                                                                    'asu.tsluch_dbf', ts.fk_id, 'RESG_DOP'),
           ts.AMB_PR    = null
     where ts.fk_id = c.fk_id;
  end loop;

  -- добавление услуг
   INSERT INTO asu.tusl_dbf d
    (Z$NAZ_ID,
     Z$FL_POLY,
     OWN,
     GLOBAL_ID,
     YEAR,
     MONTH,
     LPU_ID,
     LPU_INTR,
     LPU_NAPR,
     PERSON_IDL,
     ID_ILL,
     ID_ILL_U,
     POLICYSER,
     POLICYNUM,
     TYPE_USL,
     DATE_B_U,
     DATE_E_U,
     V_MU,
     KOD_MU,
     KOL_MU,
     TYPE_EO,
     KOD_EO,
     KOL_EO,
     COST_EO,
     SUM_EO,
     N_QU, -- Номер сегмента (квадранта),
     N_TOOTH, -- Номер зуба (справочник ZF),
     P_TOOTH, -- поверхность зуба (справочник PZ),
     N_QU2, -- Номер сегмента (квадранта),
     N_TOOTH2, -- Номер зуба (справочник ZF),
     P_TOOTH2, -- поверхность зуба (справочник PZ),
     N_QU3, -- Номер сегмента (квадранта),
     N_TOOTH3, -- Номер зуба (справочник ZF),
     P_TOOTH3, -- поверхность зуба (справочник PZ),
     N_QU4, -- Номер сегмента (квадранта),
     N_TOOTH4, -- Номер зуба (справочник ZF),
     P_TOOTH4, -- поверхность зуба (справочник PZ),
     N_QU5, -- Номер сегмента (квадранта),
     N_TOOTH5, -- Номер зуба (справочник ZF),
     P_TOOTH5, -- поверхность зуба (справочник PZ),
     N_QU6, -- Номер сегмента (квадранта),
     N_TOOTH6, -- Номер зуба (справочник ZF),
     P_TOOTH6, -- поверхность зуба (справочник PZ),
     N_QU7, -- Номер сегмента (квадранта),
     N_TOOTH7, -- Номер зуба (справочник ZF),
     P_TOOTH7, -- поверхность зуба (справочник PZ),
     N_QU8, -- Номер сегмента (квадранта),
     N_TOOTH8, -- Номер зуба (справочник ZF),
     P_TOOTH8,
     DOC_CD_U,
     PRVSM_U,
     PR_MP,
     P_ID_ILL,
     FK_SOTRID,
     FK_ID,
     FK_SLUCHID)
    SELECT ts.id_ill Z$NAZ_ID,
           1 Z$FL_POLY,
           ts.own,
           ts.global_id,
           ts.year,
           ts.month,
           ts.lpu_id,
           ts.LPU_INTR,
           ts.lpu_napr,
           ts.person_idl,
           ts.id_ill,
           ts.id_ill ID_ILL_U,
           ts.policyser,
           ts.policynum,
           ts.q_u TYPE_USL,
           ts.Date_s DATE_B_U,
           ts.Date_e DATE_E_U,
           ts.v_mu V_MU,
           8 KOD_MU,
           1 KOL_MU,
           6 TYPE_EO,
           decode(ts.own, 2, 'SMP02', 'SMP01') KOD_EO,
           1 KOL_EO,
           decode(ts.own, 2, hc.fn_cost, 0) COST_EO,
           decode(ts.own, 2, hc.fn_cost, 0) SUM_EO,

           null, null, null,
           null, null, null,
           null, null, null,
           null, null, null,
           null, null, null,
           null, null, null,
           null, null, null,
           null, null, null,

           DECODE(LENGTH(TO_CHAR(TST.FN_INN)), 11, '0' || TO_CHAR(TST.FN_INN), TO_CHAR(TST.FN_INN)) DOC_CD_U,
           ts.prvs PRVSM_U,

           ts.pr_mp PR_MP,
           ts.P_ID_ILL,
           tat.fk_sotrclosed FK_SOTRID,
           asu.seq_tusl_dbf.nextval FK_ID,
           ts.fk_id FK_SLUCHID

      from asu.tsluch_dbf ts
     inner join asu.tambtalon tat on tat.fk_id = ts.Id_Ill
      left JOIN LOGIN.TSOTR TST ON TST.FK_ID = tat.fk_sotrclosed
      left join (SELECT c.fn_cost, c.fd_date1, c.fd_date2
                   FROM ASU.THEAL H
                  INNER JOIN ASU.THEAL_COST C ON C.FK_HEALID = H.FK_ID
                  WHERE FN_COST IS NOT NULL
                    AND h.CODE = 'SMP02'
                  GROUP BY c.fn_cost, c.fd_date1, c.fd_date2) hc ON ts.Date_s BETWEEN hc.fd_date1 AND NVL(hc.fd_date2, ts.Date_s)
     where ts.z$fl_poly = 1
       and ts.q_u = 7;
 END;

 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 PROCEDURE DELETE_ZERO_COST_USL IS
  -- Синхронизируются данные стандартов и услуг, удаляются случаи без услуг
--   vdate date;
 BEGIN
 -- Efimov V.A. 20111102 Добавена возможность задать список услуг, исключаемых из выгрузки, по предложению Насти Ковалёвой http://192.168.1.9/redmine/issues/14015 "1. Из реестров ОМС и модернизации для стационара исключить попадание случаев с операциями A.16.12.025, A.16.12.027"
  delete from asu.tusl_dbf tu
   where tu.kod_eo in (select fc_askid
                         from asu.treplytable tr
                        where tr.fc_ask = 'ASU.THEAL'
                          and tr.fc_askfield = 'CODE'
                          and tr.fc_reply = 'DO_NOT_EXCH_TO_DBF'
                          and tr.fc_replyfield = 'FL_CHECK');

--   select sysdate into vdate from dual;
  -- см. http://84.51.195.172:15000/redmine/issues/11861
  delete from asu.tusl_dbf tu where tu.z$fl_poly = 1 and tu.cost_eo = 0 and tu.TYPE_USL <> 7; -- tu.TYPE_USL <> 7 - скорая помощь модет быть и с нулевой ценой

  -- Удаляются все случаи, без услуг
  delete from asu.tsluch_dbf ts
   where (select count(*)
            from asu.tusl_dbf tu
           where tu.fk_sluchid = ts.fk_id) = 0;
 END;
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
PROCEDURE GROUP_AMB_SLUCH IS
begin
  delete from asu.tsluch_dbf ts where ts.fk_groupsluchid = 0;

  -- Добавляются случаи-группы
  insert into asu.tsluch_dbf
    (OWN,
     TER_OKATO,
--     TYPE_FIN,
--     TFOMS_ID,
     YEAR,
     MONTH,
     LPU_ID,
     LPU_NAPR,
     LPU_INTR,
     GLOBAL_ID,
     PERSON_IDL,
     ID_ILL,
     POLICYSER,
     POLICYNUM,
     FAM,
     IM,
     OTCH,
     DATE_B_DAY,
     POL,
     DIA_SD,
     DIA_O,
     DIA_C,
     DIA_E,
     DATE_S,
     DATE_E,
     DATE_NAPR,
     Q_U,
     V_MU,
     PR_MP,
     TYPE_MP,
     DESTROY,
     Q_Z,
     RES_G,
     RESG_DOP,
     DISP,
     TOTAL,
     N_NAPR,
     N_MAP,
     N_MAP_AMB,
     OPER_ID,
     NARKOZ_ID,
--     SMK_NAME,
     SMO,
--     SN_PASP,
--     D_TYPE,
     P_ID_ILL,
--     TFOMS_REG,
--     DATE_NPOL,
     DATE_EPOL,
--     STAT_P,
     NOVOR,
     FAMP,
     IMP,
     OTP,
--     C_OKSM,
     C_DOC,
     S_DOC,
     N_DOC,
--     R_NAME,
--     C_NAME,
--     Q_NP,
--     NP_NAME,
--     Q_UL,
--     UL_NAME,
--     DOM,
--     KOR,
--     KV,
--     STAT_Z,
     PRVS,
     VID_P,
     Q_OGRN,
--     STANDARD,
     MR,
     SNILS,
     POLP,
     DRP,
     TYPE_V_MU,
     MODERN,
     SUM_MODERN,
     OKATOG,
     OKATOP,
     Z$FL_POLY,
     AMB_PR,
     FK_PACID,
--     FN_ROWNUM,
     FK_GROUPSLUCHID)
    select ts.OWN,
           ts.TER_OKATO,
--           ts.TYPE_FIN,
--           ts.TFOMS_ID,
           ts.YEAR,
           ts.MONTH,
           ts.LPU_ID,
           ts.LPU_NAPR,
           ts.LPU_INTR,
           ts.GLOBAL_ID,
           ts.PERSON_IDL,
           ts.ID_ILL,
           ts.POLICYSER,
           ts.POLICYNUM,
           ts.FAM,
           ts.IM,
           ts.OTCH,
           ts.DATE_B_DAY,
           ts.POL,
           ts.DIA_SD,
           ts.DIA_O,
           ts.DIA_C,
           ts.DIA_E,
           tsl.DATE_S,
           tsl.DATE_E,
           ts.DATE_NAPR,
           ts.Q_U,
           null, --ts.V_MU,
           ts.PR_MP,
           ts.TYPE_MP,
           ts.DESTROY,
           ts.Q_Z,
           ts.RES_G,
           ts.RESG_DOP,
           ts.DISP,
           ts.TOTAL,
           ts.N_NAPR,
           ts.N_MAP,
           ts.N_MAP_AMB,
           ts.OPER_ID,
           ts.NARKOZ_ID,
--           ts.SMK_NAME,
           ts.SMO,
--           ts.SN_PASP,
--           ts.D_TYPE,
           ts.P_ID_ILL,
--           ts.TFOMS_REG,
--           ts.DATE_NPOL,
           ts.DATE_EPOL,
--           ts.STAT_P,
           ts.NOVOR,
           ts.FAMP,
           ts.IMP,
           ts.OTP,
--           ts.C_OKSM,
           ts.C_DOC,
           ts.S_DOC,
           ts.N_DOC,
--           ts.R_NAME,
--           ts.C_NAME,
--           ts.Q_NP,
--           ts.NP_NAME,
--           ts.Q_UL,
--           ts.UL_NAME,
--           ts.DOM,
--           ts.KOR,
--           ts.KV,
--           ts.STAT_Z,
           null, --ts.PRVS,
           ts.VID_P,
           ts.Q_OGRN,
--           ts.STANDARD,
           ts.MR,
           ts.SNILS,
           ts.POLP,
           ts.DRP,
           ts.TYPE_V_MU,
           ts.MODERN,
           ts.SUM_MODERN,
           ts.OKATOG,
           ts.OKATOP,
           ts.Z$FL_POLY,
           ts.AMB_PR,
           ts.fk_pacid,
--           ts.FN_ROWNUM,
           0 FK_GROUPSLUCHID--Задаётся 0, чтобы можно было норамально добавить не нарушив уникальности по I_SLUCH_DBF_BY_KEY и I_SLUCH_DBF_ROWNUM у исходных случаев (до группировки) FK_GROUPSLUCHID = null
      from asu.tsluch_dbf ts
     inner join (select t.fk_id, t.date_s, t.date_e, t.person_idl, t.dia_sd, t.fc_ym
                   from (select LAST_VALUE(ts.fk_id) OVER(PARTITION BY ts.person_idl, ts.dia_sd, to_char(ts.date_e, 'yyyymm') ORDER BY ts.date_e, ts.id_ill ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) fk_id,
                                FIRST_VALUE(ts.date_s) OVER(PARTITION BY ts.person_idl, ts.dia_sd, to_char(ts.date_e, 'yyyymm') ORDER BY ts.date_e, ts.id_ill ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) date_s,
                                LAST_VALUE(ts.date_e) OVER(PARTITION BY ts.person_idl, ts.dia_sd, to_char(ts.date_e, 'yyyymm') ORDER BY ts.date_e, ts.id_ill ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) date_e,
                                ts.person_idl,
                                ts.dia_sd,
                                to_char(ts.date_e, 'yyyymm') fc_ym
                           from asu.tsluch_dbf ts
                          inner join (select tu.fk_sluchid
                                       from asu.tusl_dbf tu
                                       left join asu.tuslnocompare tuc on tu.fk_id = tuc.fk_uslid
                                      where tuc.fk_id is null
                                      group by tu.fk_sluchid) tu on tu.fk_sluchid = ts.fk_id
                          where (ts.OWN = 1 or ts.OWN = 2)
                            and ts.total is not null
                            and ts.z$fl_poly = 1) t
                  group by t.fk_id, t.date_s, t.date_e, t.person_idl, t.dia_sd, t.fc_ym
                 having count(*) > 1) tsl on tsl.fk_id = ts.fk_id;

  -- Случаи входящие в группы, привязываются к случаям-группам
  update asu.tsluch_dbf ts
     set ts.fk_groupsluchid = (select tsg.fk_id
                                 from asu.tsluch_dbf tsg
                                where tsg.fk_groupsluchid = 0
                                  and tsg.person_idl = ts.person_idl
                                  and tsg.dia_sd = ts.dia_sd
                                  and to_char(tsg.date_e, 'yyyymm') = to_char(ts.date_e, 'yyyymm'))
   where ts.fk_groupsluchid is null
     and ts.z$fl_poly = 1;

  -- Услуги, относящиеся к сгруппированным случаям присоединяются к соответствующим случаям-группам, информация о случае, к которому относилась услуга прежде, сохраняется в fk_pregroupsluchid
  update asu.tusl_dbf tu
     set tu.fk_pregroupsluchid = tu.fk_sluchid,
         tu.fk_sluchid = (select ts.fk_groupsluchid
                             from asu.tsluch_dbf ts
                            where ts.fk_id = tu.fk_sluchid)
   where tu.fk_sluchid in (select ts.fk_id
                             from asu.tsluch_dbf ts
                            where ts.fk_groupsluchid > 0);
  -- Для услуг присоединённых к новым случаям соответственно меняется ID_ILL
  update asu.tusl_dbf tu
     set (tu.ID_ILL, tu.P_ID_ILL) = (select ts.ID_ILL, ts.P_ID_ILL from asu.tsluch_dbf ts where ts.fk_id = tu.fk_sluchid)
   where tu.fk_pregroupsluchid > 0;
   -- Для таллонов, относящихся к случаям-группам обновляются цены
   ADD_AMB_SUM_DATA(1);
--   FOR C IN (SELECT tu.fk_id FROM asu.tusl_dbf tu where tu.fk_pregroupsluchid > 0) LOOP
--     ADD_SUM_DATA(c.fk_id);
--   END LOOP;

  -- Данные о несопоставленных полях переключаются так же как данные об услугах
  update asu.texchange_elselog te
     set te.fk_pregroupowner = te.fk_owner,
         te.fk_owner = (select ts.fk_groupsluchid
                          from asu.tsluch_dbf ts
                         where ts.fk_id = te.fk_owner)
   where te.fc_table = 'asu.tsluch_dbf'
     and te.fk_owner in (select ts.fk_id
                           from asu.tsluch_dbf ts
                          where ts.fk_groupsluchid > 0);

--   ADD_MDA_DATA(1); -- временное решение только для кардио
end;

 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
PROCEDURE UNGROUP_AMB_SLUCH IS
begin
  update asu.texchange_elselog te
     set te.fk_owner = te.fk_pregroupowner,
         te.fk_pregroupowner = null
   where te.fk_pregroupowner > 0;

  -- Для услуг, которыениже будут присоединены к исходным случаям соответственно меняется ID_ILL
  update asu.tusl_dbf tu
     set tu.ID_ILL = (select ts.ID_ILL
                             from asu.tsluch_dbf ts
                            where ts.fk_id = tu.fk_pregroupsluchid)
   where tu.fk_pregroupsluchid > 0;
   -- Для таллонов, которые относились к случаям-группам обновляются цены, но сначала возвращаются привязки к исходным случаям
  update asu.tusl_dbf tu
     set tu.fk_sluchid = tu.fk_pregroupsluchid
   where tu.fk_pregroupsluchid > 0;
   ADD_AMB_SUM_DATA(1);
--  FOR C IN (SELECT tu.fk_id FROM asu.tusl_dbf tu where tu.fk_pregroupsluchid > 0) LOOP
--    ADD_SUM_DATA(c.fk_id);
--  END LOOP;
  update asu.tusl_dbf tu
     set tu.fk_pregroupsluchid = null
   where tu.fk_pregroupsluchid > 0;

  update asu.tsluch_dbf ts
     set ts.fk_groupsluchid = null
   where ts.fk_groupsluchid > 0;

  delete from asu.tsluch_dbf ts where ts.fk_groupsluchid = 0;
end;

 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 PROCEDURE ADD_TOTAL IS
 BEGIN
  UPDATE asu.tsluch_dbf t
     SET (total) = (SELECT SUM(tu.SUM_EO)
                      FROM asu.tusl_dbf tu
                     WHERE tu.fk_sluchid = t.fk_id);
 END;

 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 PROCEDURE SYNC_AMB_DATA IS
  -- Синхронизируются данные стандартов и услуг, удаляются случаи без услуг
 BEGIN
--Раньше поле PR_MP , которое для диагностический услуг раньше могло выгуржаться как 401 автоматически. Так теперь не должно быть, справочники изменились, 401 - значение теперь скорая помощь
--Для случаев по центрам здоровья поле PR_MP должно быть равно 119 всегда (соответствие проставить не можем, т.к. соответствие ставим на специальность, а в центрах здоровья работают такие же специалисты как и все)
-- 20110207 Значение поля PR_MP будет изменено в SYNC_DATA в случаях подачи “Диагностических услуг” (TYPE_EO=1) на значение 401 (по предложению Маши Коваленко)
--  update asu.tusl_dbf tu set tu.PR_MP = 401 where tu.type_eo = 1;
  update asu.tusl_dbf tu set tu.PR_MP = 119 where tu.type_usl = 6;

  FOR C IN (select t.fk_sluchid, tu.prvsm_u, tu.v_mu, tu.PR_MP
       from (select t.fk_sluchid, max(t.fk_id) fk_id
               from (select nvl(t4.fk_sluchid, tn4.fk_sluchid) fk_sluchid, nvl(t4.fk_id, tn4.fk_id) fk_id
                       from (select tu.fk_sluchid,
                                    tu.type_eo,
                                    LAST_VALUE(tu.fk_id) OVER(PARTITION BY tu.fk_sluchid, tu.type_eo ORDER BY tu.date_e_u ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) fk_id
                               from asu.tusl_dbf tu
                               left join asu.tuslnocompare tnu on tnu.fk_uslid = tu.fk_id
                              where tu.type_eo <> 4
                                and tnu.fk_uslid is null
                                and tu.z$fl_poly = 1) tn4
                       full join (select tu.fk_sluchid,
                                        tu.type_eo,
                                        LAST_VALUE(tu.fk_id) OVER(PARTITION BY tu.fk_sluchid, tu.type_eo ORDER BY tu.date_e_u ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) fk_id
                                   from asu.tusl_dbf tu
                                   left join asu.tuslnocompare tnu on tnu.fk_uslid = tu.fk_id
                                  where tu.type_eo = 4
                                    and tnu.fk_uslid is null
                                    and tu.z$fl_poly = 1) t4 on t4.fk_sluchid = tn4.fk_sluchid) t
              group by t.fk_sluchid) t
      inner join asu.tusl_dbf tu on tu.fk_id = t.fk_id)
  LOOP
    update asu.tsluch_dbf ts set ts.prvs = c.prvsm_u, ts.v_mu = c.v_mu, ts.pr_mp = c.pr_mp where ts.fk_id = c.fk_sluchid;
  END LOOP;

  -- 20120905 Так как часть случаев удаляется на разных этапах выгрузки, когда выгрузка сформирована необходимо удалить не найденные соотвтетсвия, для которых нет случаев
  delete from asu.texchange_elselog
   where fk_id not in
         (select t.fk_id
            from asu.texchange_elselog t
           where (t.fc_table = 'asu.tsluch_dbf' and
                 t.fk_owner in (select fk_id from asu.tsluch_dbf))
              or (t.fc_table = 'asu.tusl_dbf' and
                 t.fk_owner in (select fk_id from asu.tusl_dbf)));

  -- http://192.168.1.9/redmine/issues/21836 По предложению Маши Коваленко из диагнозов удаляются сиволы '+' и '*'
  update asu.tsluch_dbf t set t.Dia_SD = substr(t.Dia_SD, 1, length(t.Dia_SD) - 1) where t.Dia_SD like '%+%' or t.Dia_SD like '%*%';
  update asu.tsluch_dbf t set t.dia_o = substr(t.dia_o, 1, length(t.dia_o) - 1) where t.dia_o like '%+%' or t.dia_o like '%*%';
  update asu.tsluch_dbf t set t.dia_c = substr(t.dia_c, 1, length(t.dia_c) - 1) where t.dia_c like '%+%' or t.dia_c like '%*%';
  update asu.tsluch_dbf t set t.dia_e = substr(t.dia_e, 1, length(t.dia_e) - 1) where t.dia_e like '%+%' or t.dia_e like '%*%';
 END;

 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 PROCEDURE FILL_BY_PERSON IS
   -- Добавляются данные определяемые по пиплу, для этих данных мехинизм хранения не отличается для стационара и амбулатории
   -- поэтому добавляются они в общей для всех типов процедуре
 BEGIN
  -- https://tg.samozapis.ru:15001/redmine/issues/29146
  -- Данные опекуна заполняются в случае новогожденного, новорожденным считается ребенок до одного месяца включительно (на момент закрытия талона),
  -- у которого не задан документ удостоверяющий личность (по просьбе Тани Чепурко)
  for c in (select t.fk_id, t.FAMP, t.IMP, t.OTP, t.POLP, t.DRP,
                   t.NOVOR ||
                   lpad(to_char(ROW_NUMBER() OVER(PARTITION BY t.FAMP, t.IMP, t.OTP, t.POLP, t.DRP, t.NOVOR ORDER BY t.PERSON_IDL)), 2, '0') NOVOR
              from (SELECT t.fk_id,
                           t.PERSON_IDL,
                           MAX(t.AGENT_SUR_NAME) FAMP,
                           MAX(t.AGENT_FIRST_NAME) IMP,
                           MAX(t.AGENT_PATR_NAME) OTP,
                           MAX(t.AGENT_POL) POLP,
                           nvl(MAX(t.AGENT_DATA_ROGD), MAX(t.AGENT_BIRTHDAY)) DRP,
                           t.NOVOR
                      FROM (SELECT t.fk_id,
                                   t.PERSON_IDL,
                                   t.fc_synonim,
                                   decode(t.fc_synonim, 'AGENT_SUR_NAME', t.FC_CHAR) AGENT_SUR_NAME,
                                   decode(t.fc_synonim, 'AGENT_FIRST_NAME', t.FC_CHAR) AGENT_FIRST_NAME,
                                   decode(t.fc_synonim, 'AGENT_PATR_NAME', t.FC_CHAR) AGENT_PATR_NAME,
                                   decode(t.fc_synonim, 'AGENT_POL', t.FC_CHAR) AGENT_POL,
                                   decode(t.fc_synonim, 'AGENT_BIRTHDAY', t.FD_DATE) AGENT_BIRTHDAY,
                                   decode(t.fc_synonim, 'AGENT_DATA_ROGD', t.FD_DATE) AGENT_DATA_ROGD,
                                   t.NOVOR
                              FROM (SELECT ts.fk_id,
                                           TS.PERSON_IDL,
                                           t.fc_synonim,
                                           MAX(i.FC_CHAR) FC_CHAR,
                                           trunc(MAX(i.FD_DATE)) FD_DATE,
                                           MAX(i.FK_SMID) FK_SMID,
                                           ts.POL,
                                           DECODE(ts.POL, 'М', 1, 'Ж', 2) ||
                                           to_char(ts.date_b_day, 'ddmmyy') NOVOR
                                      FROM ASU.TSMID T
                                     INNER JOIN asu.tib i ON i.fk_smid = t.fk_id
                                     INNER JOIN ASU.TSLUCH_DBF TS ON TS.PERSON_IDL = i.FK_PACID
                                     inner join asu.tpeoples tp on tp.fk_id = TS.PERSON_IDL
                                     WHERE FC_SYNONIM IN ('AGENT_SUR_NAME', 'AGENT_FIRST_NAME', 'AGENT_PATR_NAME', 'AGENT_POL', 'AGENT_BIRTHDAY', 'AGENT_DATA_ROGD')
                                       AND (nvl(tp.fk_docvid, -1) = -1 or tp.fk_docvid = asu.GET_VIDDOC_NODOC) -- Документ удостоверяющий личность может быть не задан вообще или может быть задан документ "Без документа"
                                       AND MONTHS_BETWEEN(ts.date_e, ts.date_b_day) < 1
                                     GROUP BY ts.fk_id, TS.PERSON_IDL, ts.POL, ts.date_b_day, t.fc_synonim) t) t
                     GROUP BY t.fk_id, t.PERSON_IDL, t.NOVOR) t)
   loop
     update TSLUCH_DBF set
       NOVOR = c.NOVOR,
       FAMP = c.FAMP,
       IMP = c.IMP,
       OTP = c.OTP,
       POLP = c.POLP,
       DRP = c.DRP
      where fk_id = c.fk_id;
   end loop;
 END;

 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 FUNCTION GET_TOTAL_RSA RETURN NUMBER IS
  v_result NUMBER;
 BEGIN
  SELECT SUM(TOTAL) INTO v_result FROM asu.tsluch_dbf s where s.Own in (1,2);

  RETURN v_result;
 END;

 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 FUNCTION GET_TOTAL_USA RETURN NUMBER IS
  v_result NUMBER;
 BEGIN
  SELECT SUM(SUM_EO) INTO v_result FROM asu.tusl_dbf s where s.Own in (1,2);

  RETURN v_result;
 END;

 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 PROCEDURE ADD_LOAD_ERR(pYEAR       asu.texsluch_err.YEAR%TYPE,
                        pMONTH      asu.texsluch_err.MONTH%TYPE,
                        pLPU_ID     asu.texsluch_err.LPU_ID%TYPE,
                        pPERSON_IDL asu.texsluch_err.PERSON_IDL%TYPE,
                        pID_ILL     asu.texsluch_err.ID_ILL%TYPE,
                        pID_ILL_U   ASU.texsluch_err.ID_ILL_U%TYPE,
                        pP_ID_ILL   asu.texsluch_err.P_ID_ILL%TYPE,
                        pFC_CODE    asu.texsluch_err.FC_CODE%TYPE,
                        pFC_MSG_ERR asu.texsluch_err.FC_MSG_ERR%TYPE,
                        pFC_FIELDS  asu.texsluch_err.FC_FIELDS%TYPE) is
 begin
   insert into asu.texsluch_err(YEAR, MONTH, LPU_ID, PERSON_IDL, ID_ILL, ID_ILL_U, P_ID_ILL, FC_CODE, FC_MSG_ERR, FC_FIELDS, FK_SLUCHID, FK_USLID, FN_IS_LOAD)
   values(pYEAR, pMONTH, pLPU_ID, pPERSON_IDL, pID_ILL, pID_ILL_U, pP_ID_ILL, pFC_CODE, pFC_MSG_ERR, pFC_FIELDS, null, null, 1);
 end;

 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 PROCEDURE ADD_SLUCH_ERR(pSluchID IN asu.tsluch_dbf.fk_id%TYPE,
                         pFC_CODE asu.texsluch_err.fc_code%TYPE,
                         pFC_MSG_ERR asu.texsluch_err.FC_MSG_ERR%TYPE,
                         pFC_FIELDS asu.texsluch_err.FC_FIELDS%TYPE
                         ) is
   vFC_MSG_ERR asu.texsluch_err.FC_MSG_ERR%TYPE;
   vFC_FIELDS asu.texsluch_err.FC_FIELDS%TYPE;
 begin
   select max(t.fc_comment), max(t.fc_fields) into vFC_MSG_ERR, vFC_FIELDS from asu.texch_dbf_err t where t.fc_code = pFC_CODE;

   if vFC_MSG_ERR is null then
     vFC_MSG_ERR := pFC_MSG_ERR;
   end if;

   if vFC_FIELDS is null then
     vFC_FIELDS := pFC_FIELDS;
   end if;

   insert into asu.texsluch_err(YEAR, MONTH, LPU_ID, PERSON_IDL, ID_ILL, P_ID_ILL, FC_CODE, FC_MSG_ERR, FC_FIELDS, FK_SLUCHID, FK_USLID, FN_IS_LOAD)
          select max(t.YEAR), max(t.MONTH), max(t.LPU_ID), max(t.PERSON_IDL), max(t.ID_ILL), max(t.P_ID_ILL),
                 pFC_CODE, vFC_MSG_ERR, vFC_FIELDS, pSluchID, null, 0
            from asu.tsluch_dbf t where t.fk_id = pSluchID;
 end;
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 PROCEDURE FILL_EXSLUCH_ERR_SLUCH(pSluchID IN asu.tsluch_dbf.fk_id%TYPE,
           pYear IN asu.tsluch_dbf.year%TYPE,
           pMonth IN asu.tsluch_dbf.month%TYPE) IS
  vCount NUMBER;
  vCheck NUMBER;
  vSluch asu.tsluch_dbf%ROWTYPE;
  vDia_e_name asu.ticd10.fc_name%TYPE;
  vIsOSTR NUMBER;
  vIsHRON NUMBER;
  vIsZorO NUMBER;
  vIs_Z00_Z01_Z02 NUMBER;
  vIs_Z34_Z35 NUMBER;
  v_LPU_NAPR NUMBER;
 BEGIN
  select count(*) into vCount from asu.tsluch_dbf t where t.fk_id = pSluchID;
  if vCount = 1 then
    select t.* into vSluch from asu.tsluch_dbf t where t.fk_id = pSluchID;
    if vSluch.Own in (1, 2) then
  -- RSA-0002 +
      if vSluch.LPU_ID Is Null then
        ADD_SLUCH_ERR(pSluchID,
                      'RSA-0002',
                      'Неверный код МУ или МУ не входит в систему ОМС ХМАО',
                      'LPU_ID');
      end if;
  --RSA-0003 +
      if (vSluch.YEAR <> pYear) or (vSluch.MONTH <> pMonth) then
        ADD_SLUCH_ERR(pSluchID,
                      'RSA-0003',
                      'Неверный период, указанный в реестре (год и/или месяц не соответствуют отчетному периоду в имени файла) ',
                      'YEAR, MONTH');
      end if;
  -- RSA-0004 Efimov
      select count(*) fn_count into vCount
        from asu.tsluch_dbf t
        left join asu.tusl_dbf tu on tu.id_ill = t.id_ill
                                 and ((tu.p_id_ill = t.p_id_ill) or
                                     (t.p_id_ill is null and tu.p_id_ill is null))
       where t.id_ill = vSluch.ID_ILL
         and nvl(t.p_id_ill, -1) = nvl(vSluch.P_ID_ILL, -1);

      if vCount < 1 then
        ADD_SLUCH_ERR(pSluchID,
                      'RSA-0004',
                      'Отсутствие соответствия записи в  RSA записи в USA по набору ключевых полей (идентификаторов уникальности) ',
                      'ID_ILL, P_ID_ILL, LPU_ID, PERSON_IDL');
      end if;
  -- RSA-0005 Efimov
      select count(*) fn_count into vCount
        from asu.tsluch_dbf t
       where t.id_ill = vSluch.ID_ILL and nvl(t.p_id_ill, -1) = nvl(vSluch.P_ID_ILL, -1)
         and t.lpu_id = vSluch.LPU_ID and t.person_idl = vSluch.PERSON_IDL and t.Fk_Groupsluchid = vSluch.Fk_Groupsluchid;
      if vCount > 1 then
        ADD_SLUCH_ERR(pSluchID,
                      'RSA-0005',
                      'Более одной записи в RSA по набору ключевых полей (идентификаторов уникальности) ',
                      'ID_ILL, P_ID_ILL, LPU_ID, PERSON_IDL');
      end if;
  -- RSA-0006 Efimov
      if vSluch.TOTAL Is Null then
        ADD_SLUCH_ERR(pSluchID,
                      'RSA-0006',
                      'Сумма законченного случая предъявленного МУ в RSA не соответствует предъявленной сумме оплаты из USA ',
                      'TOTAL, SUM_EO(USA)');
      else
        select sum(nvl(t.TOTAL, 0)) -
               (select sum(nvl(tu.SUM_EO, 0)) from asu.tusl_dbf tu where tu.fk_sluchid = t.fk_id) fn_dif
          into vCheck
          from asu.tsluch_dbf t
         where t.fk_id = pSluchID
         group by t.fk_id;
        if vCheck <> 0 then
          ADD_SLUCH_ERR(pSluchID,
                        'RSA-0006',
                        'Сумма законченного случая предъявленного МУ в RSA не соответствует предъявленной сумме оплаты из USA ',
                        'TOTAL, SUM_EO(USA)');
        end if;
      end if;
  -- RSA-0007 +
      if vSluch.POLICYNUM is null then
         ADD_SLUCH_ERR(pSluchID,
                       'RSA-0007',
                       'Отсутствуют/некорректные данные по серии и/или номеру полиса застрахованных',
                       'POLICYSER, POLICYNUM');
      end if;

  -- RSA-0011 +
      if vSluch.FAM Is Null or vSluch.IM Is Null or
         vSluch.OTCH Is Null or vSluch.POL Is Null or vSluch.DATE_B_DAY Is Null or
         (INSTR(vSluch.FAM, '/', 1)>0) or (INSTR(vSluch.IM, '/', 1)>0) or (INSTR(vSluch.OTCH, '/', 1)>0) or (INSTR(vSluch.POL,'/', 1)>0) or
         (INSTR(vSluch.FAM, '.', 1)>0) or (INSTR(vSluch.IM, '.', 1)>0) or (INSTR(vSluch.OTCH, '.', 1)>0) or (INSTR(vSluch.POL, '.', 1)>0) or
         (INSTR(vSluch.FAM, ',', 1)>0) or (INSTR(vSluch.IM, ',', 1)>0) or (INSTR(vSluch.OTCH, ',', 1)>0) or (INSTR(vSluch.POL, ',', 1)>0) or
         (INSTR(vSluch.FAM, '<', 1)>0) or (INSTR(vSluch.IM, '<', 1)>0) or (INSTR(vSluch.OTCH, '<', 1)>0) or (INSTR(vSluch.POL, '<', 1)>0) or
         (INSTR(vSluch.FAM, '>', 1)>0) or (INSTR(vSluch.IM, '>', 1)>0) or (INSTR(vSluch.OTCH, '>', 1)>0) or (INSTR(vSluch.POL, '>', 1)>0) or
         (INSTR(vSluch.FAM, '?', 1)>0) or (INSTR(vSluch.IM, '?', 1)>0) or (INSTR(vSluch.OTCH, '?', 1)>0) or (INSTR(vSluch.POL, '?', 1)>0) or
         (INSTR(vSluch.FAM, '!', 1)>0) or (INSTR(vSluch.IM, '!', 1)>0) or (INSTR(vSluch.OTCH, '!', 1)>0) or (INSTR(vSluch.POL, '!', 1)>0) or
         (INSTR(vSluch.FAM, '@', 1)>0) or (INSTR(vSluch.IM, '@', 1)>0) or (INSTR(vSluch.OTCH, '@', 1)>0) or (INSTR(vSluch.POL, '@', 1)>0) or
         (INSTR(vSluch.FAM, '#', 1)>0) or (INSTR(vSluch.IM, '#', 1)>0) or (INSTR(vSluch.OTCH, '#', 1)>0) or (INSTR(vSluch.POL, '#', 1)>0) or
         (INSTR(vSluch.FAM, '$', 1)>0) or (INSTR(vSluch.IM, '$', 1)>0) or (INSTR(vSluch.OTCH, '$', 1)>0) or (INSTR(vSluch.POL, '$', 1)>0) or
         (INSTR(vSluch.FAM, '%', 1)>0) or (INSTR(vSluch.IM, '%', 1)>0) or (INSTR(vSluch.OTCH, '%', 1)>0) or (INSTR(vSluch.POL, '%', 1)>0) or
         (INSTR(vSluch.FAM, '^', 1)>0) or (INSTR(vSluch.IM, '^', 1)>0) or (INSTR(vSluch.OTCH, '^', 1)>0) or (INSTR(vSluch.POL, '^', 1)>0) or
         (INSTR(vSluch.FAM, '&', 1)>0) or (INSTR(vSluch.IM, '&', 1)>0) or (INSTR(vSluch.OTCH, '&', 1)>0) or (INSTR(vSluch.POL, '&', 1)>0) or
         (INSTR(vSluch.FAM, '*', 1)>0) or (INSTR(vSluch.IM, '*', 1)>0) or (INSTR(vSluch.OTCH, '*', 1)>0) or (INSTR(vSluch.POL, '*', 1)>0) or
         (INSTR(vSluch.FAM, '(', 1)>0) or (INSTR(vSluch.IM, '(', 1)>0) or (INSTR(vSluch.OTCH, '(', 1)>0) or (INSTR(vSluch.POL, '(', 1)>0) or
         (INSTR(vSluch.FAM, ')', 1)>0) or (INSTR(vSluch.IM, ')', 1)>0) or (INSTR(vSluch.OTCH, ')', 1)>0) or (INSTR(vSluch.POL, ')', 1)>0) or
         (INSTR(vSluch.FAM, '+', 1)>0) or (INSTR(vSluch.IM, '+', 1)>0) or (INSTR(vSluch.OTCH, '+', 1)>0) or (INSTR(vSluch.POL, '+', 1)>0) or
         (INSTR(vSluch.FAM, '=', 1)>0) or (INSTR(vSluch.IM, '=', 1)>0) or (INSTR(vSluch.OTCH, '=', 1)>0) or (INSTR(vSluch.POL, '=', 1)>0) or
         (INSTR(vSluch.FAM, '`', 1)>0) or (INSTR(vSluch.IM, '`', 1)>0) or (INSTR(vSluch.OTCH, '`', 1)>0) or (INSTR(vSluch.POL, '`', 1)>0) or
         (INSTR(vSluch.FAM, '|', 1)>0) or (INSTR(vSluch.IM, '|', 1)>0) or (INSTR(vSluch.OTCH, '|', 1)>0) or (INSTR(vSluch.POL, '|', 1)>0) or
         (INSTR(vSluch.FAM, '\', 1)>0) or (INSTR(vSluch.IM, '\', 1)>0) or (INSTR(vSluch.OTCH, '\', 1)>0) or (INSTR(vSluch.POL, '\', 1)>0) or
         (INSTR(vSluch.FAM, '[', 1)>0) or (INSTR(vSluch.IM, '[', 1)>0) or (INSTR(vSluch.OTCH, '[', 1)>0) or (INSTR(vSluch.POL, '[', 1)>0) or
         (INSTR(vSluch.FAM, ']', 1)>0) or (INSTR(vSluch.IM, ']', 1)>0) or (INSTR(vSluch.OTCH, ']', 1)>0) or (INSTR(vSluch.POL, ']', 1)>0) or
         (INSTR(vSluch.FAM, '{', 1)>0) or (INSTR(vSluch.IM, '{', 1)>0) or (INSTR(vSluch.OTCH, '{', 1)>0) or (INSTR(vSluch.POL, '{', 1)>0) or
         (INSTR(vSluch.FAM, '}', 1)>0) or (INSTR(vSluch.IM, '}', 1)>0) or (INSTR(vSluch.OTCH, '}', 1)>0) or (INSTR(vSluch.POL, '}', 1)>0) or
         (INSTR(vSluch.FAM, ';', 1)>0) or (INSTR(vSluch.IM, ';', 1)>0) or (INSTR(vSluch.OTCH, ';', 1)>0) or (INSTR(vSluch.POL, ';', 1)>0) or
         (INSTR(vSluch.FAM, ':', 1)>0) or (INSTR(vSluch.IM, ':', 1)>0) or (INSTR(vSluch.OTCH, ':', 1)>0) or (INSTR(vSluch.POL, ':', 1)>0) or
         (INSTR(vSluch.FAM, '"', 1)>0) or (INSTR(vSluch.IM, '"', 1)>0) or (INSTR(vSluch.OTCH, '"', 1)>0) or (INSTR(vSluch.POL, '"', 1)>0) or
         (INSTR(vSluch.FAM, '''', 1)>0)or (INSTR(vSluch.IM, '''', 1)>0)or (INSTR(vSluch.OTCH, '''', 1)>0)or (INSTR(vSluch.POL, '''', 1)>0) or
         (INSTR(vSluch.FAM, '№', 1)>0) or (INSTR(vSluch.IM, '№', 1)>0) or (INSTR(vSluch.OTCH, '№', 1)>0) or (INSTR(vSluch.POL, '№', 1)>0)
      then
        ADD_SLUCH_ERR(pSluchID,
                      'RSA-0011',
                      'Использование служебных и/или недопустимых символов в фамилии, имени, отчестве, поле пациента',
                      'FAM, IM, OTCH, POL');
      end if;

  -- RSA-0013 +
      if vSluch.DATE_S Is Null or vSluch.DATE_E Is Null or
         (vSluch.DATE_S > vSluch.DATE_E)
      then
        ADD_SLUCH_ERR(pSluchID,
                      'RSA-0013',
                      'Несоответствие даты начала и даты конца заболевания (дата начала позже даты окончания; дата окончания и/или дата начала находятся в будущем по отношению к отчетному периоду)',
                      'DATE_E, DATE_S');
      end if;

  -- RSA-0015 +
      if vSluch.DIA_SD is null or vSluch.DIA_E is null then
        ADD_SLUCH_ERR(pSluchID,
                      'RSA-0015',
                      'Отсутствуют данные по предварительному и/или окончательному диагнозу',
                      'DIA_SD, DIA_E');
      end if;
  -- RSA-0016 Efimov
      select count(*)
        into vCount
        from asu.ticd10_dbf_exch t
       where t.fc_key = 'S00-T98'
         and fc_kod = vSluch.DIA_E;
      if (vCount > 0) and vSluch.DESTROY Is Null then
        ADD_SLUCH_ERR(pSluchID,
                      'RSA-0016',
                      'Неверный код травмы или отсутствует соответствие',
                      'DESTROY');
      end if;
  -- RSA-0017 +
      select Max(fc_name) into vDia_e_name from asu.ticd10 ti where ti.fc_kod = vSluch.Dia_e;
      select decode(max(ti.fk_id), null, 0, 1) into vIsOSTR from asu.ticd10 ti where Upper(vDia_e_name) like '%ОСТР%';
      select decode(max(ti.fk_id), null, 0, 1) into vIsHRON from asu.ticd10 ti where Upper(vDia_e_name) like '%ХРОНИЧЕСК%';
      select decode(max(ti.fk_id), null, 0, 1) into vIsZorO from asu.ticd10 ti where vSluch.Dia_e like 'Z%' or vSluch.Dia_e like 'O%';

      -- Efimov V.V. 20121127 http://192.168.1.9/redmine/issues/20983
      select count(*)
        into vIs_Z00_Z01_Z02
        from asu.ticd10_dbf_exch t
       where t.fc_key = 'Z00_Z01_Z02'
         and fc_kod = vSluch.DIA_E;

      select count(*)
        into vIs_Z34_Z35
        from asu.ticd10_dbf_exch t
       where t.fc_key = 'Z34_Z35'
         and fc_kod = vSluch.DIA_E;

      if vSluch.Q_Z Is Null or
         (vIsOSTR = 1 and vSluch.Q_Z in (2, 3 ,5, 6)) or
         (vIsHRON = 1 and vSluch.Q_Z in (1 ,5, 6)) or
         (vIsZorO = 0 and vSluch.Q_Z = 5) or
         (vIs_Z00_Z01_Z02 > 0 and vSluch.Q_Z <> 5) or
         (vIs_Z34_Z35 > 0 and vSluch.Q_Z <> 6)
      then
        ADD_SLUCH_ERR(pSluchID,
                      'RSA-0017',
                      'Неверный код характера заболевания или отсутствует соответствие',
                      'Q_Z');
      end if;
  -- RSA-0018 +
      if vSluch.RES_G Is Null or
         (vSluch.Q_Z = 5 and vSluch.Res_g in (1, 2, 4, 5))
      then
        ADD_SLUCH_ERR(pSluchID,
                      'RSA-0018',
                      'Неверный код результата обращения или отсутствует соответствие',
                      'RES_G');
      end if;
  -- RSA-0019 +
      if vSluch.RESG_DOP Is Null then
        ADD_SLUCH_ERR(pSluchID,
                      'RSA-0019',
                      'Неверный код дополнения к исходу состояния или отсутствует соответствие',
                      'REGS_DOP');
      end if;
  -- RSA-0021 +
      if vSluch.OPER_ID = 1 and vSluch.NARKOZ_ID Is Null then
        ADD_SLUCH_ERR(pSluchID,
                      'RSA-0021',
                      'Неверный код анестезии или отсутствует соответствие',
                      'NARKOZ_ID');
      end if;
  -- RSA-0022 +
      if (not vSluch.Z$fl_Poly = 1) and vSluch.N_MAP is null then
        ADD_SLUCH_ERR(pSluchID,
                      'RSA-0022',
                      'Отсутствует номер карты выбытия из стационара',
                      'N_MAP');
      end if;
  -- RSA-0023 +
      if vSluch.Z$fl_Poly = 1 and vSluch.N_MAP_AMB is null then
        ADD_SLUCH_ERR(pSluchID,
                      'RSA-0023',
                      'Отсутствует номер карты амбулаторного приема',
                      'N_MAP_AMB');
      end if;

  -- RSA-0029
      if (not vSluch.OPER_ID in (0, 1)) or
         (vSluch.Narkoz_Id is not null and vSluch.OPER_ID = 0) or
         (vSluch.Narkoz_Id is null and vSluch.OPER_ID = 1)
      then
        ADD_SLUCH_ERR(pSluchID,
                      'RSA-0029',
                      'Неверные данные по признаку оперативное вмешательство',
                      'OPER_ID');
      end if;

  -- RSA-0030 Efimov Будет проверена позже, после реализации подсистемы повторной выгрузки
      if vSluch.ID_ILL is null or vSluch.PERSON_IDL Is Null then
        ADD_SLUCH_ERR(pSluchID,
                      'RSA-0030',
                      'Повторно поданный случай, раннее оплаченный СМК',
                      'ID_ILL, PERSON_IDL');
      end if;

    -- RSA-0032 Efimov
      if vSluch.OWN = 2 and (vSluch.C_DOC is Null or vSluch.S_DOC is Null or vSluch.N_DOC is Null) then
        ADD_SLUCH_ERR(pSluchID,
                      'RSA-0032',
                      'Межтерриториальные расчеты. Код типа документа, серия и номер документа не корректны и/или не заполнены',
                      'C_DOC, S_DOC, N_DOC');
      end if;

    -- RGE-0001
      if vSluch.Z$fl_Poly = 1 and vSluch.q_u = 2 then
        select MAX(ti.fk_smid) into v_LPU_NAPR from asu.tib ti
         where ti.fk_smeditid = asu.GET_SMID_PD_NAPRAVIV_YCH
           and ti.fk_pacid =  vSluch.ID_ILL;

        if v_LPU_NAPR is null then
          select count(*) into vCount from asu.tusl_dbf tu where tu.fk_sluchid = vSluch.Fk_Id and tu.kod_eo like 'T%';
          if vCount = 0 then
            ADD_SLUCH_ERR(pSluchID,
                          'RGE-0001',
                          'Амбулаторный случай. Нет ни осмотров, ни направившего учреждения',
                          'LPU_NAPR, KOD_EO');
          end if;
        end if;
      end if;
    end if;
  end if;

 END;

 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 PROCEDURE ADD_USL_ERR(pUslID IN asu.tusl_dbf.fk_id%TYPE,
                       pFC_CODE asu.texsluch_err.fc_code%TYPE,
                       pFC_MSG_ERR asu.texsluch_err.FC_MSG_ERR%TYPE,
                       pFC_FIELDS asu.texsluch_err.FC_FIELDS%TYPE
                      ) is
 begin
   insert into asu.texsluch_err(YEAR, MONTH, LPU_ID, PERSON_IDL, ID_ILL, ID_ILL_U, P_ID_ILL, FC_CODE, FC_MSG_ERR, FC_FIELDS, FK_SLUCHID, FK_USLID, FN_IS_LOAD)
          select max(t.YEAR), max(t.MONTH), max(t.LPU_ID), max(t.PERSON_IDL), max(t.ID_ILL), max(t.ID_ILL_U), max(t.P_ID_ILL),
                 pFC_CODE, pFC_MSG_ERR, pFC_FIELDS, Max(t.fk_sluchid), pUslID, 0
            from asu.tusl_dbf t where t.fk_id = pUslID;
 end;

 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 PROCEDURE FILL_EXSLUCH_ERR_USL(pUslID IN asu.tusl_dbf.fk_id%TYPE,
                                pYear IN asu.tsluch_dbf.year%TYPE,
                                pMonth IN asu.tsluch_dbf.month%TYPE) IS
  vCount NUMBER;
--  vfn_same NUMBER;
  vUsl asu.tusl_dbf%ROWTYPE;
  vdate_s asu.tsluch_dbf.date_s%TYPE;
  vdate_e asu.tsluch_dbf.date_e%TYPE;
  vfd_cert login.tsotr.fd_cert%TYPE;
  vAMB_PR  asu.tsluch_dbf.AMB_PR%TYPE;
  vRESG_DOP  asu.tsluch_dbf.RESG_DOP%TYPE;
  vIsSotrPRVSM_UInAmmin Number;
  vSotrStr Varchar2(100);
 BEGIN
  select count(*) into vCount from asu.tusl_dbf t where t.fk_id = pUslID;
  if vCount = 1 then
    select t.* into vUsl from asu.tusl_dbf t where t.fk_id = pUslID;
    if vUsl.OWN in (1, 2) then
-- USA-0001
      if vUsl.LPU_ID Is Null then
        ADD_USL_ERR(pUslID,
                    'USA-0001',
                    'Неверный код МУ или МУ не входит в систему ОМС ХМАО',
                    'LPU_ID');
      end if;
-- USA-0002
      if vUsl.YEAR <> pYear or vUsl.MONTH <> pMonth then
        ADD_USL_ERR(pUslID,
                    'USA-0002',
                    'Неверный период, указанный в реестре (год и/или месяц не соответствуют отчетному периоду в имени файла) ',
                    'YEAR, MONTH');
      end if;

-- USA-0003 Efimov
      select count(*) fn_count into vCount
        from asu.tusl_dbf tu
        left join asu.tsluch_dbf t on t.id_ill = tu.id_ill
                                  and ((t.p_id_ill = tu.p_id_ill) or
                                      (t.p_id_ill is null and tu.p_id_ill is null))
       where tu.id_ill = vUsl.ID_ILL
         and nvl(tu.p_id_ill, -1) = nvl(vUsl.P_ID_ILL, -1);
      if vCount < 1 then
        ADD_USL_ERR(pUslID,
                    'USA-0003',
                    'Отсутствие соответствия записи в USA записи в RSA по набору ключевых полей (идентификаторов уникальности) ',
                    'ID_ILL, P_ID_ILL, LPU_ID, PERSON_IDL');
      end if;

-- USA-0004 Efimov
      if vUsl.V_MU Is Null then
        ADD_USL_ERR(pUslID,
                    'USA-0004',
                    'Неверный код вида медицинской помощи',
                    'V_MU');
      end if;
-- USA-0005
      if (vUsl.type_usl = 5) and -- стоматология
         (vUsl.KOD_MU Is Null or
          (NOT ( (vUsl.Kod_Eo = 'A.01.07.001.01' AND vUsl.Kod_Mu = 1) OR (NOT (vUsl.Kod_Eo = 'A.01.07.001.01') AND vUsl.Kod_Mu = 4) )))
--         (vUsl.Kod_Eo = 'A.01.07.001.01' and vUsl.Kod_Mu = 4) or
--         not(((vUsl.Kod_Eo like 'A%' or vUsl.Kod_Eo like 'B%') and vUsl.Kod_Mu = 1) or
--             ((vUsl.Kod_Eo like 'A%' or vUsl.Kod_Eo like 'B%') and vUsl.Kod_Mu = 4) or
--             ((vUsl.Kod_Eo like 'A%' or vUsl.Kod_Eo like 'B%') and vUsl.Kod_Mu = 5) or
--             ((vUsl.Kod_Eo like 'A%' or vUsl.Kod_Eo like 'B%') and vUsl.Kod_Mu = 6) or
--             ((vUsl.Kod_Eo like '10%' or vUsl.Kod_Eo like '11%') and vUsl.Kod_Mu = 3) or
--             ((vUsl.Kod_Eo like '14%' or vUsl.Kod_Eo like '31%') and vUsl.Kod_Mu = 2) or
--             (vUsl.Kod_Eo like 'T%' and vUsl.Kod_Mu = 1))
      then
         ADD_USL_ERR(pUslID,
                    'USA-0005',
                    'Неверный код единицы учёта медицинской помощи',
                    'KOD_MU');
      end if;
-- USA-0006
      if vUsl.TYPE_EO Is Null or
         not((vUsl.Kod_MU = 1 and vUsl.Type_Eo in (2, 4)) or
             (vUsl.Kod_MU = 2 and vUsl.Type_Eo = 3) or
             (vUsl.Kod_MU = 3 and vUsl.Type_Eo = 3) or
             (vUsl.Kod_MU = 4 and vUsl.Type_Eo = 2) or
             (vUsl.Kod_MU = 5 and vUsl.Type_Eo = 1) or
             (vUsl.Kod_MU = 6 and vUsl.Type_Eo = 5))
      then
        ADD_USL_ERR(pUslID,
                    'USA-0006',
                    'Неверный код типа единицы оплаты',
                    'TYPE_EO');
      end if;
-- USA-0007
      if vUsl.TYPE_USL Is Null then
        ADD_USL_ERR(pUslID,
                    'USA-0007',
                    'Недопустимое значение в поле тип оказания медицинской помощи',
                    'TYPE_USL');
      end if;
-- USA-0008
      if (vUsl.KOL_MU < 0) or
         (vUsl.KOL_MU = 0 and vUsl.KOD_EO like '14%')
      then
        ADD_USL_ERR(pUslID,
                    'USA-0008',
                    'Количество единиц учета медицинской помощи равно 0 или отрицательное',
                    'KOL_MU');
      end if;
-- USA-0009
      if vUsl.KOL_EO Is Null then
        ADD_USL_ERR(pUslID,
                    'USA-0009',
                    'Количество по полю код единицы оплаты отрицательное или равно нулю',
                    'KOL_EO');
      end if;
-- USA-0010 Efimov
      if vUsl.KOD_EO Is Null then
        ADD_USL_ERR(pUslID,
                    'USA-0010',
                    'Неверный код единицы оплаты',
                    'KOD_EO');
      end if;

-- USA-0012 Efimov -- http://192.168.1.9/redmine/issues/24431 проверка осуществляется только для проверка осуществляется только для
      if not(((vUsl.Kod_Eo like 'A%' or vUsl.Kod_Eo like 'B%') and vUsl.Type_Usl in (2, 5, 6)) or
--             ((vUsl.Kod_Eo like '10%' or vUsl.Kod_Eo like '11%') and vUsl.Type_Usl = 1) or
--             ((vUsl.Kod_Eo like '10%' or vUsl.Kod_Eo like '11%') and vUsl.Type_Usl = 4) or
--             ((vUsl.Kod_Eo like '14%' or vUsl.Kod_Eo like '31%') and vUsl.Type_Usl = 3) or
             (vUsl.Kod_Eo like 'T%' and vUsl.Type_Usl in (2, 5, 6)))
      then
        ADD_USL_ERR(pUslID,
                    'USA-0012',
                    'Код единицы оплаты не соответствует типу услуги',
                    'KOD_EO');
      end if;

-- USA-0014 Efimov
      if vUsl.SUM_EO is null or vUsl.COST_EO is null or vUsl.KOL_EO is null or (vUsl.SUM_EO <> vUsl.COST_EO * vUsl.KOL_EO) then
        ADD_USL_ERR(pUslID,
                    'USA-0014',
                    'Неверная сумма оплаты предъявленная МУ',
                    'SUM_EO, COST_EO, KOL_EO');
      end if;

-- USA-0015 Efimov
      if not((vUsl.Type_Usl = 2 and vUsl.Kod_Mu = 1) or
             (vUsl.Type_Usl = 6 and vUsl.Kod_Mu = 1) or
             (vUsl.Type_Usl = 3 and vUsl.Kod_Mu = 2) or
             (vUsl.Type_Usl = 1 and vUsl.Kod_Mu = 3) or
             (vUsl.Type_Usl = 4 and vUsl.Kod_Mu = 3) or
             (vUsl.Type_Usl = 2 and vUsl.Kod_Mu = 4) or
             (vUsl.Type_Usl = 2 and vUsl.Kod_Mu = 5) or
             (vUsl.Type_Usl = 2 and vUsl.Kod_Mu = 6))
      then
        ADD_USL_ERR(pUslID,
                    'USA-0015',
                    'Несоответствие кода единицы учета медицинской помощи типу оказания медицинской помощи',
                    'KOD_MU');
      end if;

-- USA-0016
      if vUsl.DATE_B_U Is Null or vUsl.DATE_E_U Is Null then
        ADD_USL_ERR(pUslID,
                    'USA-0016',
                    'Период выполнения услуги не в периоде даты начала и окончания заболевания из реестра',
                    'DATE_B_U, DATE_E_U');
      else
        select date_s, date_e
          into vdate_s, vdate_e
          from asu.tsluch_dbf
         where fk_id = (select max(fk_sluchid)
                          from asu.tusl_dbf
                         where fk_id = pUslID);
        if (vUsl.DATE_B_U < vdate_s) or
           (vUsl.DATE_B_U > vdate_e) or
           (vUsl.DATE_E_U < vdate_s) or
           (vUsl.DATE_E_U > vdate_e)
        then
          ADD_USL_ERR(pUslID,
                      'USA-0016',
                      'Период выполнения услуги не в периоде даты начала и окончания заболевания из реестра',
                      'DATE_B_U, DATE_E_U');
        end if;
      end if;

-- USA-0019 Efimov
      if vUsl.Z$FL_POLY = 1 then
        select Max(tsr.fd_cert) fd_cert into vfd_cert
          from vnaz vn
          left join ( select vr.fk_nazid, Max(vr.fk_vrachid_last) fk_vrachid_last
                        from (select vr.fk_nazid,
                                     LAST_VALUE(vr.fk_vrachid) OVER(PARTITION BY vr.fk_nazid ORDER BY vr.fk_id ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) fk_vrachid_last
                                from asu.TRESLECH vr
                               where nvl(vr.fk_vrachid, 0) > 0) vr
                       group by vr.fk_nazid ) vr on vr.fk_nazid = vn.fk_id
          left join login.tsotr tst_isp on tst_isp.fk_id = vn.fk_ispolid
          left join asu.ts_sprav tss_isp on tss_isp.fk_id = tst_isp.fk_spravid
          left join asu.tsmid_fizter tsf on tsf.fk_id = vn.fk_smid
--          left join login.tsotr tsr on tsr.fk_id = decode(tsf.fk_id, null, nvl(decode(vn.fk_ispolid, 0, null, vn.fk_ispolid), vn.fk_vrachid), decode(tss_isp.fl_vrach, 1, nvl(decode(vn.fk_ispolid, 0, null, vn.fk_ispolid), vn.fk_vrachid), vn.fk_vrachid))
          left join login.tsotr tsr on tsr.fk_id = nvl(decode(nvl(vr.fk_vrachid_last, vn.fk_ispolid), 0, null, nvl(vr.fk_vrachid_last, vn.fk_ispolid)), vn.fk_vrachid)
         where vn.fk_id = vUsl.Z$naz_Id;
        if vfd_cert Is Null or (vfd_cert <= to_date('01.01.1900', 'dd.mm.yyyy')) then
          ADD_USL_ERR(pUslID,
                      'USA-0019',
                      'Включение в счета-реестры медицинской помощи оказанной в период  отсутствия или окончании срока действия лицензии на данный вид(ы) ',
                      'V_MU, TYPE_V_MU, TYPE USL');
        end if;
      end if;

--  Efimov
/* http://192.168.1.9/redmine/issues/24431
      select decode(tu.policyser, t.policyser, 1, 0) *
             decode(tu.policynum, t.policynum, 1, 0) fn_same
        into vfn_same
        from asu.tusl_dbf tu
        left join asu.tsluch_dbf t on t.fk_id = tu.fk_sluchid
       where tu.fk_id = pUslID;
      if vfn_same <> 1 then
        ADD_USL_ERR(pUslID,
                    'USA-0025',
                    'Данные полиса в услугах не соответствуют данным полиса из реестра ',
                    'POLICYSER(RSA), POLICYNUM(RSA)');
      end if;
*/
-- USA-0027 Efimov
      if vUsl.DOC_CD_U Is Null then
        ADD_USL_ERR(pUslID,
                    'USA-0027',
                    'Врач с указанным кодом отсутствует  в регистре врачей ЛПУ (уволен на момент оказания помощи)',
                    'DOC_CD_U');
      end if;
-- USA-0028  Efimov
      if vUsl.PRVSM_U Is Null then
        ADD_USL_ERR(pUslID,
                    'USA-0028',
                    'Код специальности медработника не заполнен',
                    'PRVSM_U');
      else
        select decode(count(*), 0, 0, 1)
          into vIsSotrPRVSM_UInAmmin
          from dual
         where vUsl.PRVSM_U in
               (select exch43.pkg_exchcache.GET_THEIR_ID(asu.GET_HOMS_COMPANYID,
                                                        'VSO_VSD_SSO',
                                                        'TSOTR_SPEC',
                                                        tsr.fk_medspec)
                  from login.tsotr tsr
                 where tsr.fn_inn = vUsl.DOC_CD_U);

        if vIsSotrPRVSM_UInAmmin = 0 then
          select max(ts.fc_fam) || ' ' || max(ts.fc_name) || ' ' || max(ts.fc_otch) || ' ' || max(ts.fn_inn) into vSotrStr
            from login.tsotr ts
           where ts.fn_inn = vUsl.Doc_Cd_u;

          ADD_USL_ERR(pUslID,
                      'USA-0028',
                      'Код специальности ' || to_char(vUsl.PRVSM_U) || ' не определён для врача ' || vSotrStr,
                      'PRVSM_U');
        end if;
      end if;

    -- UGE-0001, UGE-0002
      if vUsl.TYPE_EO = 9 then
        select AMB_PR, RESG_DOP into vAMB_PR, vRESG_DOP from asu.tsluch_dbf ts where ts.fk_id = vUsl.Fk_Sluchid;
        if vAMB_PR not in (3, 8) then
          ADD_USL_ERR(pUslID,
                      'UGE-0001',
                      'Если TYPE_EO = 9, AMB_PR должно быть равно 3 или 8 (AMB_PR = ' || to_char(vAMB_PR) || ')',
                      'TYPE_EO');
        end if;

        if vRESG_DOP <> 312 then
          ADD_USL_ERR(pUslID,
                      'UGE-0001',
                      'Если TYPE_EO = 9, RESG_DOP должно быть равно 312 (RESG_DOP = ' || to_char(vRESG_DOP) || ')',
                      'TYPE_EO');
        end if;
      end if;

    -- UGE-0003
      if vUsl.KOD_MU = 4 and vUsl.KOL_MU = 0 then
        ADD_USL_ERR(pUslID,
                    'UGE-0003',
                    'Если KOD_MU = 4, KOL_MU должно быть больше 0',
                    'KOL_MU');
      end if;
    end if;
  end if;
 END;

 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 procedure FILL_EXSLUCH_ERR is
 begin
   FOR C IN (SELECT t.fk_id, t.Year, t.Month FROM asu.tsluch_dbf t
              inner join (select tu.fk_sluchid
                            from asu.tusl_dbf tu
                            left join asu.tuslnocompare tuc on tu.fk_id = tuc.fk_uslid
                           where tuc.fk_id is null
                           group by tu.fk_sluchid) tu on tu.fk_sluchid = t.fk_id
              where nvl(t.fk_groupsluchid, 0) = 0
                and t.total is not null
                and ((t.OWN = 1) or (t.OWN = 2)))
     LOOP FILL_EXSLUCH_ERR_SLUCH(c.fk_id, c.Year, c.Month);
   END LOOP;

   FOR C IN (SELECT t.fk_id, t.Year, t.Month
               FROM asu.tusl_dbf t
              inner join asu.tsluch_dbf ts on ts.fk_id  = t.fk_sluchid
               left join asu.tuslnocompare tuc on tuc.fk_uslid = t.fk_id
              where tuc.fk_id is null
                and ts.total is not null
                and ((t.OWN = 1) or (t.OWN = 2)))
     LOOP FILL_EXSLUCH_ERR_USL(c.fk_id, c.Year, c.Month);
   END LOOP;

  -- ошибки которые легче проверить одним запросом, а не проверкой каждого случая отдельно, т.к. как речь идёт об ограниченных выборках,
  -- например RSA-0052 существует только для случаев диспансеризации
  -- RSA-0052
  for c in (select ts.fk_id
              from asu.tsluch_dbf ts
             inner join asu.tusl_dbf tu on tu.fk_sluchid = ts.fk_id
             where ts.FN_DISP_FSTAGE_NAZ is not null and tu.kod_mu = 1
               and nvl(ts.fk_groupsluchid, 0) = 0
               and ts.total is not null
               and ((ts.OWN = 1) or (ts.OWN = 2))
               and not (
                   (ts.AMB_PR = 3 and ts.RESG_DOP = 316 and ts.GZ = 0 and ts.DISP_RES = 1 and ts.RES_G = 306 and ts.Q_U in (2, 6) and tu.KOD_MU = 1 and tu.TYPE_EO = 9)
                or (ts.AMB_PR = 3 and ts.RESG_DOP = 317 and ts.GZ = 1 and ts.DISP_RES = 0 and ts.RES_G = 306 and ts.Q_U in (2, 6) and tu.KOD_MU = 1 and tu.TYPE_EO = 9)
                or (ts.AMB_PR = 3 and ts.RESG_DOP = 318 and ts.GZ = 2 and ts.DISP_RES = 0 and ts.RES_G = 306 and ts.Q_U in (2, 6) and tu.KOD_MU = 1 and tu.TYPE_EO = 9)
                or (ts.AMB_PR = 3 and ts.RESG_DOP = 319 and ts.GZ = 3 and ts.DISP_RES = 0 and ts.RES_G = 306 and ts.Q_U in (2, 6) and tu.KOD_MU = 1 and tu.TYPE_EO = 9)

                or (ts.AMB_PR = 8 and ts.RESG_DOP = 316 and ts.GZ = 1 and ts.DISP_RES = 0 and ts.RES_G = 306 and ts.Q_U in (2, 6) and tu.KOD_MU = 1 and tu.TYPE_EO in (1, 4))
                or (ts.AMB_PR = 8 and ts.RESG_DOP = 317 and ts.GZ = 2 and ts.DISP_RES = 0 and ts.RES_G = 306 and ts.Q_U in (2, 6) and tu.KOD_MU = 1 and tu.TYPE_EO in (1, 4))
                or (ts.AMB_PR = 8 and ts.RESG_DOP = 318 and ts.GZ = 3 and ts.DISP_RES = 0 and ts.RES_G = 306 and ts.Q_U in (2, 6) and tu.KOD_MU = 1 and tu.TYPE_EO in (1, 4))

                or (ts.AMB_PR = 9 and ts.RESG_DOP = 320 and ts.GZ = 1 and ts.DISP_RES = 0 and ts.RES_G = 306 and ts.Q_U in (2, 6) and tu.KOD_MU = 1 and tu.TYPE_EO = 9)
                or (ts.AMB_PR = 9 and ts.RESG_DOP = 321 and ts.GZ = 2 and ts.DISP_RES = 0 and ts.RES_G = 306 and ts.Q_U in (2, 6) and tu.KOD_MU = 1 and tu.TYPE_EO = 9)
                or (ts.AMB_PR = 9 and ts.RESG_DOP = 322 and ts.GZ = 3 and ts.DISP_RES = 0 and ts.RES_G = 306 and ts.Q_U in (2, 6) and tu.KOD_MU = 1 and tu.TYPE_EO = 9)
                or (ts.AMB_PR = 9 and ts.RESG_DOP = 323 and ts.GZ = 4 and ts.DISP_RES = 0 and ts.RES_G = 306 and ts.Q_U in (2, 6) and tu.KOD_MU = 1 and tu.TYPE_EO = 9)
                or (ts.AMB_PR = 9 and ts.RESG_DOP = 324 and ts.GZ = 5 and ts.DISP_RES = 0 and ts.RES_G = 306 and ts.Q_U in (2, 6) and tu.KOD_MU = 1 and tu.TYPE_EO = 9)
                or (ts.AMB_PR = 9 and ts.RESG_DOP = 315 and ts.GZ = 0 and ts.DISP_RES = 1 and ts.RES_G = 306 and ts.Q_U in (2, 6) and tu.KOD_MU = 1 and tu.TYPE_EO = 9)

                or (ts.AMB_PR = 10 and ts.RESG_DOP = 320 and ts.GZ = 1 and ts.DISP_RES = 0 and ts.RES_G = 306 and ts.Q_U in (2, 6) and tu.KOD_MU = 1 and tu.TYPE_EO in (1, 4))
                or (ts.AMB_PR = 10 and ts.RESG_DOP = 321 and ts.GZ = 2 and ts.DISP_RES = 0 and ts.RES_G = 306 and ts.Q_U in (2, 6) and tu.KOD_MU = 1 and tu.TYPE_EO in (1, 4))
                or (ts.AMB_PR = 10 and ts.RESG_DOP = 322 and ts.GZ = 3 and ts.DISP_RES = 0 and ts.RES_G = 306 and ts.Q_U in (2, 6) and tu.KOD_MU = 1 and tu.TYPE_EO in (1, 4))
                or (ts.AMB_PR = 10 and ts.RESG_DOP = 323 and ts.GZ = 4 and ts.DISP_RES = 0 and ts.RES_G = 306 and ts.Q_U in (2, 6) and tu.KOD_MU = 1 and tu.TYPE_EO in (1, 4))
                or (ts.AMB_PR = 10 and ts.RESG_DOP = 324 and ts.GZ = 5 and ts.DISP_RES = 0 and ts.RES_G = 306 and ts.Q_U in (2, 6) and tu.KOD_MU = 1 and tu.TYPE_EO in (1, 4))

                or (ts.AMB_PR = 11 and ts.RESG_DOP = 336 and ts.GZ = 1 and ts.DISP_RES = 0 and ts.RES_G = 306 and ts.Q_U in (2, 6) and tu.KOD_MU = 1 and tu.TYPE_EO in (1, 4))
                or (ts.AMB_PR = 11 and ts.RESG_DOP = 337 and ts.GZ = 2 and ts.DISP_RES = 0 and ts.RES_G = 306 and ts.Q_U in (2, 6) and tu.KOD_MU = 1 and tu.TYPE_EO in (1, 4))
                or (ts.AMB_PR = 11 and ts.RESG_DOP = 338 and ts.GZ = 3 and ts.DISP_RES = 0 and ts.RES_G = 306 and ts.Q_U in (2, 6) and tu.KOD_MU = 1 and tu.TYPE_EO in (1, 4))

                or (ts.AMB_PR = 12 and ts.RESG_DOP = 325 and ts.GZ = 1 and ts.DISP_RES = 0 and ts.RES_G = 306 and ts.Q_U in (2, 6) and tu.KOD_MU = 1 and tu.TYPE_EO in (1, 4))
                or (ts.AMB_PR = 12 and ts.RESG_DOP = 326 and ts.GZ = 2 and ts.DISP_RES = 0 and ts.RES_G = 306 and ts.Q_U in (2, 6) and tu.KOD_MU = 1 and tu.TYPE_EO in (1, 4))
                or (ts.AMB_PR = 12 and ts.RESG_DOP = 327 and ts.GZ = 3 and ts.DISP_RES = 0 and ts.RES_G = 306 and ts.Q_U in (2, 6) and tu.KOD_MU = 1 and tu.TYPE_EO in (1, 4))
                or (ts.AMB_PR = 12 and ts.RESG_DOP = 328 and ts.GZ = 4 and ts.DISP_RES = 0 and ts.RES_G = 306 and ts.Q_U in (2, 6) and tu.KOD_MU = 1 and tu.TYPE_EO in (1, 4))
                or (ts.AMB_PR = 12 and ts.RESG_DOP = 329 and ts.GZ = 5 and ts.DISP_RES = 0 and ts.RES_G = 306 and ts.Q_U in (2, 6) and tu.KOD_MU = 1 and tu.TYPE_EO in (1, 4))

                or (ts.AMB_PR = 13 and ts.RESG_DOP = 330 and ts.GZ = 1 and ts.DISP_RES = 0 and ts.RES_G = 306 and ts.Q_U in (2, 6) and tu.KOD_MU = 1 and tu.TYPE_EO in (1, 4))
                or (ts.AMB_PR = 13 and ts.RESG_DOP = 331 and ts.GZ = 2 and ts.DISP_RES = 0 and ts.RES_G = 306 and ts.Q_U in (2, 6) and tu.KOD_MU = 1 and tu.TYPE_EO in (1, 4))
                or (ts.AMB_PR = 13 and ts.RESG_DOP = 332 and ts.GZ = 3 and ts.DISP_RES = 0 and ts.RES_G = 306 and ts.Q_U in (2, 6) and tu.KOD_MU = 1 and tu.TYPE_EO in (1, 4))
                or (ts.AMB_PR = 13 and ts.RESG_DOP = 333 and ts.GZ = 4 and ts.DISP_RES = 0 and ts.RES_G = 306 and ts.Q_U in (2, 6) and tu.KOD_MU = 1 and tu.TYPE_EO in (1, 4))
                or (ts.AMB_PR = 13 and ts.RESG_DOP = 334 and ts.GZ = 5 and ts.DISP_RES = 0 and ts.RES_G = 306 and ts.Q_U in (2, 6) and tu.KOD_MU = 1 and tu.TYPE_EO in (1, 4))

                or (ts.AMB_PR = 14 and ts.RESG_DOP = 335 and ts.GZ = 0 and ts.DISP_RES = 0 and ts.RES_G = 306 and ts.Q_U in (2, 6) and tu.KOD_MU = 1 and tu.TYPE_EO in (1, 4))
                )
            group by ts.fk_id)
  loop
    ADD_SLUCH_ERR(c.fk_id,
                  'RSA-0052',
                  'Нарушено соответствие полей диспансеризации и осмотров',
                  'AMB_PR, RESG_DOP, GZ, DISP_RES, RES_G, Q_U, KOD_MU, TYPE_EO');
  end loop;
 end;

 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 procedure FillGrids is
--   my_raise_percent  CONSTANT PLS_INTEGER := 10;
 begin
  delete from asu.tsluch_dbf_grid;
  delete from asu.tusl_dbf_grid;

  insert into asu.tsluch_dbf_grid
  select
    decode(t.OWN_SOURCE, 0, t.OWN_TSL, 3, t.OWN_TS || ' | ' || t.OWN_TSL, t.OWN_TS) OWN,
    decode(t.TYPE_FIN_SOURCE, 0, t.TYPE_FIN_TSL, 3, t.TYPE_FIN_TS || ' | ' || t.TYPE_FIN_TSL, t.TYPE_FIN_TS) TYPE_FIN,
    decode(t.GLOBAL_ID_SOURCE, 0, t.GLOBAL_ID_TSL, 3, t.GLOBAL_ID_TS || ' | ' || t.GLOBAL_ID_TSL, t.GLOBAL_ID_TS) GLOBAL_ID,
    decode(t.YEAR_SOURCE, 0, t.YEAR_TSL, 3, t.YEAR_TS || ' | ' || t.YEAR_TSL, t.YEAR_TS) YEAR,
    decode(t.MONTH_SOURCE, 0, t.MONTH_TSL, 3, t.MONTH_TS || ' | ' || t.MONTH_TSL, t.MONTH_TS) MONTH,
    decode(t.LPU_ID_SOURCE, 0, t.LPU_ID_TSL, 3, t.LPU_ID_TS || ' | ' || t.LPU_ID_TSL, t.LPU_ID_TS) LPU_ID,
    decode(t.TER_OKATO_SOURCE, 0, t.TER_OKATO_TSL, 3, t.TER_OKATO_TS || ' | ' || t.TER_OKATO_TSL, t.TER_OKATO_TS) TER_OKATO,
    decode(t.OKATOG_SOURCE, 0, t.OKATOG_TSL, 3, t.OKATOG_TS || ' | ' || t.OKATOG_TSL, t.OKATOG_TS) OKATOG,
    decode(t.OKATOP_SOURCE, 0, t.OKATOP_TSL, 3, t.OKATOP_TS || ' | ' || t.OKATOP_TSL, t.OKATOP_TS) OKATOP,
    decode(t.LPU_NAPR_SOURCE, 0, t.LPU_NAPR_TSL, 3, t.LPU_NAPR_TS || ' | ' || t.LPU_NAPR_TSL, t.LPU_NAPR_TS) LPU_NAPR,
    decode(t.PERSON_IDL_SOURCE, 0, t.PERSON_IDL_TSL, 3, t.PERSON_IDL_TS || ' | ' || t.PERSON_IDL_TSL, t.PERSON_IDL_TS) PERSON_IDL,
    nvl(t.ID_ILL_TS, t.ID_ILL_TSL) ID_ILL,
    decode(t.POLICYSER_SOURCE, 0, t.POLICYSER_TSL, 3, t.POLICYSER_TS || ' | ' || t.POLICYSER_TSL, t.POLICYSER_TS) POLICYSER,
    decode(t.POLICYNUM_SOURCE, 0, t.POLICYNUM_TSL, 3, t.POLICYNUM_TS || ' | ' || t.POLICYNUM_TSL, t.POLICYNUM_TS) POLICYNUM,
    decode(t.FAM_SOURCE, 0, t.FAM_TSL, 3, t.FAM_TS || ' | ' || t.FAM_TSL, t.FAM_TS) FAM,
    decode(t.IM_SOURCE, 0, t.IM_TSL, 3, t.IM_TS || ' | ' || t.IM_TSL, t.IM_TS) IM,
    decode(t.OTCH_SOURCE, 0, t.OTCH_TSL, 3, t.OTCH_TS || ' | ' || t.OTCH_TSL, t.OTCH_TS) OTCH,
    decode(t.DATE_B_DAY_SOURCE, 0, t.DATE_B_DAY_TSL, 3, t.DATE_B_DAY_TS || ' | ' || t.DATE_B_DAY_TSL, t.DATE_B_DAY_TS) DATE_B_DAY,
    decode(t.POL_SOURCE, 0, t.POL_TSL, 3, t.POL_TS || ' | ' || t.POL_TSL, t.POL_TS) POL,
    decode(t.DIA_SD_SOURCE, 0, t.DIA_SD_TSL, 3, t.DIA_SD_TS || ' | ' || t.DIA_SD_TSL, t.DIA_SD_TS) DIA_SD,
    decode(t.DIA_O_SOURCE, 0, t.DIA_O_TSL, 3, t.DIA_O_TS || ' | ' || t.DIA_O_TSL, t.DIA_O_TS) DIA_O,
    decode(t.DIA_C_SOURCE, 0, t.DIA_C_TSL, 3, t.DIA_C_TS || ' | ' || t.DIA_C_TSL, t.DIA_C_TS) DIA_C,
    decode(t.DIA_E_SOURCE, 0, t.DIA_E_TSL, 3, t.DIA_E_TS || ' | ' || t.DIA_E_TSL, t.DIA_E_TS) DIA_E,
    decode(t.DATE_S_SOURCE, 0, t.DATE_S_TSL, 3, t.DATE_S_TS || ' | ' || t.DATE_S_TSL, t.DATE_S_TS) DATE_S,
    decode(t.DATE_E_SOURCE, 0, t.DATE_E_TSL, 3, t.DATE_E_TS || ' | ' || t.DATE_E_TSL, t.DATE_E_TS) DATE_E,
    nvl(t.D_DATE_E_TS, t.D_DATE_E_TSL) D_DATE_E,

    decode(t.DATE_NAPR_SOURCE, 0, t.DATE_NAPR_TSL, 3, t.DATE_NAPR_TS || ' | ' || t.DATE_NAPR_TSL, t.DATE_NAPR_TS) DATE_NAPR,

    decode(t.DESTROY_SOURCE, 0, t.DESTROY_TSL, 3, t.DESTROY_TS || ' | ' || t.DESTROY_TSL, t.DESTROY_TS) DESTROY,
    decode(t.Q_Z_SOURCE, 0, t.Q_Z_TSL, 3, t.Q_Z_TS || ' | ' || t.Q_Z_TSL, t.Q_Z_TS) Q_Z,
    decode(t.RES_G_SOURCE, 0, t.RES_G_TSL, 3, t.RES_G_TS || ' | ' || t.RES_G_TSL, t.RES_G_TS) RES_G,
    decode(t.RESG_DOP_SOURCE, 0, t.RESG_DOP_TSL, 3, t.RESG_DOP_TS || ' | ' || t.RESG_DOP_TSL, t.RESG_DOP_TS) RESG_DOP,
    decode(t.DISP_SOURCE, 0, t.DISP_TSL, 3, t.DISP_TS || ' | ' || t.DISP_TSL, t.DISP_TS) DISP,
  --  decode(t.DOC_STAT_SOURCE, 0, t.DOC_STAT_TSL, 3, t.DOC_STAT_TS || ' | ' || t.DOC_STAT_TSL, t.DOC_STAT_TS) DOC_STAT,
  --  decode(t.PRVD_SOURCE, 0, t.PRVD_TSL, 3, t.PRVD_TS || ' | ' || t.PRVD_TSL, t.PRVD_TS) PRVD,
    decode(t.TOTAL_SOURCE, 0, t.TOTAL_TSL, 3, t.TOTAL_TS || ' | ' || t.TOTAL_TSL, t.TOTAL_TS) TOTAL,

    decode(t.N_NAPR_SOURCE, 0, t.N_NAPR_TSL, 3, t.N_NAPR_TS || ' | ' || t.N_NAPR_TSL, t.N_NAPR_TS) N_NAPR,

    decode(t.N_MAP_SOURCE, 0, t.N_MAP_TSL, 3, t.N_MAP_TS || ' | ' || t.N_MAP_TSL, t.N_MAP_TS) N_MAP,
    decode(t.N_MAP_AMB_SOURCE, 0, t.N_MAP_AMB_TSL, 3, t.N_MAP_AMB_TS || ' | ' || t.N_MAP_AMB_TSL, t.N_MAP_AMB_TS) N_MAP_AMB,
    decode(t.OPER_ID_SOURCE, 0, t.OPER_ID_TSL, 3, t.OPER_ID_TS || ' | ' || t.OPER_ID_TSL, t.OPER_ID_TS) OPER_ID,
    decode(t.NARKOZ_ID_SOURCE, 0, t.NARKOZ_ID_TSL, 3, t.NARKOZ_ID_TS || ' | ' || t.NARKOZ_ID_TSL, t.NARKOZ_ID_TS) NARKOZ_ID,
  --  decode(t.BL_SER_SOURCE, 0, t.BL_SER_TSL, 3, t.BL_SER_TS || ' | ' || t.BL_SER_TSL, t.BL_SER_TS) BL_SER,
  --  decode(t.BL_NUM_SOURCE, 0, t.BL_NUM_TSL, 3, t.BL_NUM_TS || ' | ' || t.BL_NUM_TSL, t.BL_NUM_TS) BL_NUM,
  --  decode(t.BL_DATE_S_SOURCE, 0, t.BL_DATE_S_TSL, 3, t.BL_DATE_S_TS || ' | ' || t.BL_DATE_S_TSL, t.BL_DATE_S_TS) BL_DATE_S,
  --  decode(t.BL_DATE_E_SOURCE, 0, t.BL_DATE_E_TSL, 3, t.BL_DATE_E_TS || ' | ' || t.BL_DATE_E_TSL, t.BL_DATE_E_TS) BL_DATE_E,
  --  decode(t.ADRES_SOURCE, 0, t.ADRES_TSL, 3, t.ADRES_TS || ' | ' || t.ADRES_TSL, t.ADRES_TS) ADRES, -- was commented by Prihodko N. 29.04.2011
    decode(t.SMK_NAME_SOURCE, 0, t.SMK_NAME_TSL, 3, t.SMK_NAME_TS || ' | ' || t.SMK_NAME_TSL, t.SMK_NAME_TS) SMK_NAME,
    decode(t.SN_PASP_SOURCE, 0, t.SN_PASP_TSL, 3, t.SN_PASP_TS || ' | ' || t.SN_PASP_TSL, t.SN_PASP_TS) SN_PASP,
    decode(t.Q_U_SOURCE, 0, t.Q_U_TSL, 3, t.Q_U_TS || ' | ' || t.Q_U_TSL, t.Q_U_TS) Q_U,
    decode(t.D_TYPE_SOURCE, 0, t.D_TYPE_TSL, 3, t.D_TYPE_TS || ' | ' || t.D_TYPE_TSL, t.D_TYPE_TS) D_TYPE,
    nvl(t.P_ID_ILL_TS, t.P_ID_ILL_TSL) P_ID_ILL,
    decode(t.LPU_INTR_SOURCE, 0, t.LPU_INTR_TSL, 3, t.LPU_INTR_TS || ' | ' || t.LPU_INTR_TSL, t.LPU_INTR_TS) LPU_INTR,
    decode(t.TFOMS_REG_SOURCE, 0, t.TFOMS_REG_TSL, 3, t.TFOMS_REG_TS || ' | ' || t.TFOMS_REG_TSL, t.TFOMS_REG_TS) TFOMS_REG,
    decode(t.DATE_NPOL_SOURCE, 0, t.DATE_NPOL_TSL, 3, t.DATE_NPOL_TS || ' | ' || t.DATE_NPOL_TSL, t.DATE_NPOL_TS) DATE_NPOL,
    decode(t.DATE_EPOL_SOURCE, 0, t.DATE_EPOL_TSL, 3, t.DATE_EPOL_TS || ' | ' || t.DATE_EPOL_TSL, t.DATE_EPOL_TS) DATE_EPOL,
    decode(t.STAT_P_SOURCE, 0, t.STAT_P_TSL, 3, t.STAT_P_TS || ' | ' || t.STAT_P_TSL, t.STAT_P_TS) STAT_P,
    decode(t.NOVOR_SOURCE, 0, t.NOVOR_TSL, 3, t.NOVOR_TS || ' | ' || t.NOVOR_TSL, t.NOVOR_TS) NOVOR,
    decode(t.FAMP_SOURCE, 0, t.FAMP_TSL, 3, t.FAMP_TS || ' | ' || t.FAMP_TSL, t.FAMP_TS) FAMP,
    decode(t.IMP_SOURCE, 0, t.IMP_TSL, 3, t.IMP_TS || ' | ' || t.IMP_TSL, t.IMP_TS) IMP,
    decode(t.OTP_SOURCE, 0, t.OTP_TSL, 3, t.OTP_TS || ' | ' || t.OTP_TSL, t.OTP_TS) OTP,
    decode(t.C_OKSM_SOURCE, 0, t.C_OKSM_TSL, 3, t.C_OKSM_TS || ' | ' || t.C_OKSM_TSL, t.C_OKSM_TS) C_OKSM,
    decode(t.C_DOC_SOURCE, 0, t.C_DOC_TSL, 3, t.C_DOC_TS || ' | ' || t.C_DOC_TSL, t.C_DOC_TS) C_DOC,
    decode(t.S_DOC_SOURCE, 0, t.S_DOC_TSL, 3, t.S_DOC_TS || ' | ' || t.S_DOC_TSL, t.S_DOC_TS) S_DOC,
    decode(t.N_DOC_SOURCE, 0, t.N_DOC_TSL, 3, t.N_DOC_TS || ' | ' || t.N_DOC_TSL, t.N_DOC_TS) N_DOC,
    decode(t.R_NAME_SOURCE, 0, t.R_NAME_TSL, 3, t.R_NAME_TS || ' | ' || t.R_NAME_TSL, t.R_NAME_TS) R_NAME,
    decode(t.C_NAME_SOURCE, 0, t.C_NAME_TSL, 3, t.C_NAME_TS || ' | ' || t.C_NAME_TSL, t.C_NAME_TS) C_NAME,
    decode(t.Q_NP_SOURCE, 0, t.Q_NP_TSL, 3, t.Q_NP_TS || ' | ' || t.Q_NP_TSL, t.Q_NP_TS) Q_NP,
    decode(t.NP_NAME_SOURCE, 0, t.NP_NAME_TSL, 3, t.NP_NAME_TS || ' | ' || t.NP_NAME_TSL, t.NP_NAME_TS) NP_NAME,
    decode(t.Q_UL_SOURCE, 0, t.Q_UL_TSL, 3, t.Q_UL_TS || ' | ' || t.Q_UL_TSL, t.Q_UL_TS) Q_UL,
    decode(t.UL_NAME_SOURCE, 0, t.UL_NAME_TSL, 3, t.UL_NAME_TS || ' | ' || t.UL_NAME_TSL, t.UL_NAME_TS) UL_NAME,
    decode(t.DOM_SOURCE, 0, t.DOM_TSL, 3, t.DOM_TS || ' | ' || t.DOM_TSL, t.DOM_TS) DOM,
    decode(t.KOR_SOURCE, 0, t.KOR_TSL, 3, t.KOR_TS || ' | ' || t.KOR_TSL, t.KOR_TS) KOR,
    decode(t.KV_SOURCE, 0, t.KV_TSL, 3, t.KV_TS || ' | ' || t.KV_TSL, t.KV_TS) KV,
    decode(t.STAT_Z_SOURCE, 0, t.STAT_Z_TSL, 3, t.STAT_Z_TS || ' | ' || t.STAT_Z_TSL, t.STAT_Z_TS) STAT_Z,
    decode(t.V_MU_SOURCE, 0, t.V_MU_TSL, 3, t.V_MU_TS || ' | ' || t.V_MU_TSL, t.V_MU_TS) V_MU,
    decode(t.PR_MP_SOURCE, 0, t.PR_MP_TSL, 3, t.PR_MP_TS || ' | ' || t.PR_MP_TSL, t.PR_MP_TS) PR_MP,
    decode(t.TYPE_MP_SOURCE, 0, t.TYPE_MP_TSL, 3, t.TYPE_MP_TS || ' | ' || t.TYPE_MP_TSL, t.TYPE_MP_TS) TYPE_MP,
    decode(t.PRVS_SOURCE, 0, t.PRVS_TSL, 3, t.PRVS_TS || ' | ' || t.PRVS_TSL, t.PRVS_TS) PRVS,
  --  decode(t.VO_SOURCE, 0, t.VO_TSL, 3, t.VO_TS || ' | ' || t.VO_TSL, t.VO_TS) VO,

    decode(t.VID_P_SOURCE, 0, t.VID_P_TSL, 3, t.VID_P_TS || ' | ' || t.VID_P_TSL, t.VID_P_TS) VID_P,
    decode(t.Q_OGRN_SOURCE, 0, t.Q_OGRN_TSL, 3, t.Q_OGRN_TS || ' | ' || t.Q_OGRN_TSL, t.Q_OGRN_TS) Q_OGRN,

    decode(t.STANDARD_SOURCE, 0, t.STANDARD_TSL, 3, t.STANDARD_TS || ' | ' || t.STANDARD_TSL, t.STANDARD_TS) STANDARD,
    decode(t.MR_SOURCE, 0, t.MR_TSL, 3, t.MR_TS || ' | ' || t.MR_TSL, t.MR_TS) MR,
    decode(t.SNILS_SOURCE, 0, t.SNILS_TSL, 3, t.SNILS_TS || ' | ' || t.SNILS_TSL, t.SNILS_TS) SNILS,

    decode(t.POLP_SOURCE, 0, t.POLP_TSL, 3, t.POLP_TS || ' | ' || t.POLP_TSL, t.POLP_TS) POLP,
    decode(t.DRP_SOURCE, 0, t.DRP_TSL, 3, t.DRP_TS || ' | ' || t.DRP_TSL, t.DRP_TS) DRP,
    decode(t.TYPE_V_MU_SOURCE, 0, t.TYPE_V_MU_TSL, 3, t.TYPE_V_MU_TS || ' | ' || t.TYPE_V_MU_TSL, t.TYPE_V_MU_TS) TYPE_V_MU,

    decode(t.AMB_PR_SOURCE, 0, t.AMB_PR_TSL, 3, t.AMB_PR_TS || ' | ' || t.AMB_PR_TSL, t.AMB_PR_TS) TYPE_V_MU,
    decode(t.DISP_KAT_SOURCE, 0, t.DISP_KAT_TSL, 3, t.DISP_KAT_TS || ' | ' || t.DISP_KAT_TSL, t.DISP_KAT_TS) TYPE_V_MU,
    decode(t.GZ_SOURCE, 0, t.GZ_TSL, 3, t.GZ_TS || ' | ' || t.GZ_TSL, t.GZ_TS) TYPE_V_MU,
    decode(t.DISP_RES_SOURCE, 0, t.DISP_RES_TSL, 3, t.DISP_RES_TS || ' | ' || t.DISP_RES_TSL, t.DISP_RES_TS) TYPE_V_MU,

    decode(t.MODERN_SOURCE, 0, t.MODERN_TSL, 3, t.MODERN_TS || ' | ' || t.MODERN_TSL, t.MODERN_TS) MODERN,

    decode(t.SUM_MODERN_SOURCE, 0, t.SUM_MODERN_TSL, 3, t.SUM_MODERN_TS || ' | ' || t.SUM_MODERN_TSL, t.SUM_MODERN_TS) SUM_MODERN,

    decode(t.Z$FL_POLY_SOURCE, 0, t.Z$FL_POLY_TSL, 3, t.Z$FL_POLY_TS || ' | ' || t.Z$FL_POLY_TSL, t.Z$FL_POLY_TS) Z$FL_POLY,

    t.OWN_SOURCE,

    t.TYPE_FIN_SOURCE,

    t.GLOBAL_ID_SOURCE,
    t.YEAR_SOURCE,
    t.MONTH_SOURCE,
    t.LPU_ID_SOURCE,
    t.TER_OKATO_SOURCE,
    t.OKATOG_SOURCE,
    t.OKATOP_SOURCE,
    t.LPU_NAPR_SOURCE,
    t.PERSON_IDL_SOURCE,
    t.POLICYSER_SOURCE,
    t.POLICYNUM_SOURCE,
    t.FAM_SOURCE,
    t.IM_SOURCE,
    t.OTCH_SOURCE,
    t.DATE_B_DAY_SOURCE,
    t.POL_SOURCE,
    t.DIA_SD_SOURCE,
    t.DIA_O_SOURCE,
    t.DIA_C_SOURCE,
    t.DIA_E_SOURCE,
    t.DATE_S_SOURCE,
    t.DATE_E_SOURCE,
    t.DATE_NAPR_SOURCE,
    t.DESTROY_SOURCE,
    t.Q_Z_SOURCE,
    t.RES_G_SOURCE,
    t.RESG_DOP_SOURCE,
    t.DISP_SOURCE,
  --  t.DOC_STAT_SOURCE,
  --  t.PRVD_SOURCE,
    t.TOTAL_SOURCE,
    t.N_NAPR_SOURCE,
    t.N_MAP_SOURCE,
    t.N_MAP_AMB_SOURCE,
    t.OPER_ID_SOURCE,
    t.NARKOZ_ID_SOURCE,
  --  t.BL_SER_SOURCE,
  --  t.BL_NUM_SOURCE,
  --  t.BL_DATE_S_SOURCE,
  --  t.BL_DATE_E_SOURCE,
  --  t.ADRES_SOURCE,
    t.SMK_NAME_SOURCE,
    t.SN_PASP_SOURCE,
    t.Q_U_SOURCE,
    t.D_TYPE_SOURCE,
    t.LPU_INTR_SOURCE,
    t.TFOMS_REG_SOURCE,
    t.DATE_NPOL_SOURCE,
    t.DATE_EPOL_SOURCE,
    t.STAT_P_SOURCE,
    t.NOVOR_SOURCE,
    t.FAMP_SOURCE,
    t.IMP_SOURCE,
    t.OTP_SOURCE,
    t.C_OKSM_SOURCE,
    t.C_DOC_SOURCE,
    t.S_DOC_SOURCE,
    t.N_DOC_SOURCE,
    t.R_NAME_SOURCE,
    t.C_NAME_SOURCE,
    t.Q_NP_SOURCE,
    t.NP_NAME_SOURCE,
    t.Q_UL_SOURCE,
    t.UL_NAME_SOURCE,
    t.DOM_SOURCE,
    t.KOR_SOURCE,
    t.KV_SOURCE,
    t.STAT_Z_SOURCE,
    t.V_MU_SOURCE,
    t.PR_MP_SOURCE,
    t.TYPE_MP_SOURCE,
    t.PRVS_SOURCE,
  --  t.VO_SOURCE,

    t.VID_P_SOURCE,
    t.Q_OGRN_SOURCE,
    t.STANDARD_SOURCE,
    t.MR_SOURCE,
    t.SNILS_SOURCE,

    t.POLP_SOURCE,
    t.DRP_SOURCE,
    t.TYPE_V_MU_SOURCE,

    t.AMB_PR_SOURCE,
    t.DISP_KAT_SOURCE,
    t.GZ_SOURCE,
    t.DISP_RES_SOURCE,

    t.MODERN_SOURCE,
    t.SUM_MODERN_SOURCE,

    t.Z$FL_POLY_SOURCE,

    nvl(tsmo.fc_value, Cm.Fc_Short) SMO,

    decode(t.FN_SOURCE, 0, 77, 2,

      decode(t.OWN_SOURCE, 0, 1, 0) +
      decode(t.TYPE_FIN_SOURCE, 0, 1, 0) +
      decode(t.GLOBAL_ID_SOURCE, 0, 1, 0) +
      decode(t.YEAR_SOURCE, 0, 1, 0) +
      decode(t.MONTH_SOURCE, 0, 1, 0) +
      decode(t.LPU_ID_SOURCE, 0, 1, 0) +
      decode(t.TER_OKATO_SOURCE, 0, 1, 0) +
      decode(t.OKATOG_SOURCE, 0, 1, 0) +
      decode(t.OKATOP_SOURCE, 0, 1, 0) +
      decode(t.LPU_NAPR_SOURCE, 0, 1, 0) +
      decode(t.PERSON_IDL_SOURCE, 0, 1, 0) +
      decode(t.POLICYSER_SOURCE, 0, 1, 0) +
      decode(t.POLICYNUM_SOURCE, 0, 1, 0) +
      decode(t.FAM_SOURCE, 0, 1, 0) +
      decode(t.IM_SOURCE, 0, 1, 0) +
      decode(t.OTCH_SOURCE, 0, 1, 0) +
      decode(t.DATE_B_DAY_SOURCE, 0, 1, 0) +
      decode(t.POL_SOURCE, 0, 1, 0) +
      decode(t.DIA_SD_SOURCE, 0, 1, 0) +
      decode(t.DIA_O_SOURCE, 0, 1, 0) +
      decode(t.DIA_C_SOURCE, 0, 1, 0) +
      decode(t.DIA_E_SOURCE, 0, 1, 0) +
      decode(t.DATE_S_SOURCE, 0, 1, 0) +
      decode(t.DATE_E_SOURCE, 0, 1, 0) +
      decode(t.DATE_NAPR_SOURCE, 0, 1, 0) +
      decode(t.DESTROY_SOURCE, 0, 1, 0) +
      decode(t.Q_Z_SOURCE, 0, 1, 0) +
      decode(t.RES_G_SOURCE, 0, 1, 0) +
      decode(t.RESG_DOP_SOURCE, 0, 1, 0) +
      decode(t.DISP_SOURCE, 0, 1, 0) +
  --    decode(t.DOC_STAT_SOURCE, 0, 1, 0) +
  --    decode(t.PRVD_SOURCE, 0, 1, 0) +
      decode(t.TOTAL_SOURCE, 0, 1, 0) +
      decode(t.N_NAPR_SOURCE, 0, 1, 0) +
      decode(t.N_MAP_SOURCE, 0, 1, 0) +
      decode(t.N_MAP_AMB_SOURCE, 0, 1, 0) +
      decode(t.OPER_ID_SOURCE, 0, 1, 0) +
      decode(t.NARKOZ_ID_SOURCE, 0, 1, 0) +
  --    decode(t.BL_SER_SOURCE, 0, 1, 0) +
  --    decode(t.BL_NUM_SOURCE, 0, 1, 0) +
  --    decode(t.BL_DATE_S_SOURCE, 0, 1, 0) +
  --    decode(t.BL_DATE_E_SOURCE, 0, 1, 0) +
  --    decode(t.ADRES_SOURCE, 0, 1, 0) +
      decode(t.SMK_NAME_SOURCE, 0, 1, 0) +
      decode(t.SN_PASP_SOURCE, 0, 1, 0) +
      decode(t.Q_U_SOURCE, 0, 1, 0) +
      decode(t.D_TYPE_SOURCE, 0, 1, 0) +
      decode(t.LPU_INTR_SOURCE, 0, 1, 0) +
      decode(t.TFOMS_REG_SOURCE, 0, 1, 0) +
      decode(t.DATE_NPOL_SOURCE, 0, 1, 0) +
      decode(t.DATE_EPOL_SOURCE, 0, 1, 0) +
      decode(t.STAT_P_SOURCE, 0, 1, 0) +
      decode(t.NOVOR_SOURCE, 0, 1, 0) +
      decode(t.FAMP_SOURCE, 0, 1, 0) +
      decode(t.IMP_SOURCE, 0, 1, 0) +
      decode(t.OTP_SOURCE, 0, 1, 0) +
      decode(t.C_OKSM_SOURCE, 0, 1, 0) +
      decode(t.C_DOC_SOURCE, 0, 1, 0) +
      decode(t.S_DOC_SOURCE, 0, 1, 0) +
      decode(t.N_DOC_SOURCE, 0, 1, 0) +
      decode(t.R_NAME_SOURCE, 0, 1, 0) +
      decode(t.C_NAME_SOURCE, 0, 1, 0) +
      decode(t.Q_NP_SOURCE, 0, 1, 0) +
      decode(t.NP_NAME_SOURCE, 0, 1, 0) +
      decode(t.Q_UL_SOURCE, 0, 1, 0) +
      decode(t.UL_NAME_SOURCE, 0, 1, 0) +
      decode(t.DOM_SOURCE, 0, 1, 0) +
      decode(t.KOR_SOURCE, 0, 1, 0) +
      decode(t.KV_SOURCE, 0, 1, 0) +
      decode(t.STAT_Z_SOURCE, 0, 1, 0) +
      decode(t.V_MU_SOURCE, 0, 1, 0) +
      decode(t.PR_MP_SOURCE, 0, 1, 0) +
      decode(t.TYPE_MP_SOURCE, 0, 1, 0) +
      decode(t.PRVS_SOURCE, 0, 1, 0) +
  --    decode(t.VO_SOURCE, 0, 1, 0) +

      decode(t.VID_P_SOURCE, 0, 1, 0) +
      decode(t.Q_OGRN_SOURCE, 0, 1, 0) +
      decode(t.STANDARD_SOURCE, 0, 1, 0)+
      decode(t.MR_SOURCE, 0, 1, 0) +
      decode(t.SNILS_SOURCE, 0, 1, 0) +

      decode(t.POLP_SOURCE, 0, 1, 0) +
      decode(t.DRP_SOURCE, 0, 1, 0) +
      decode(t.TYPE_V_MU_SOURCE, 0, 1, 0) +
      decode(t.AMB_PR_SOURCE, 0, 1, 0) +
      decode(t.DISP_KAT_SOURCE, 0, 1, 0) +
      decode(t.GZ_SOURCE, 0, 1, 0) +
      decode(t.DISP_RES_SOURCE, 0, 1, 0) +
      decode(t.MODERN_SOURCE, 0, 1, 0) +
      decode(t.SUM_MODERN_SOURCE, 0, 1, 0),

      0

    )FN_IS_LOAD,

    decode(t.FN_SOURCE, 1, 77, 2,

      decode(t.OWN_SOURCE, 1, 1, 0) +
      decode(t.TYPE_FIN_SOURCE, 1, 1, 0) +
      decode(t.GLOBAL_ID_SOURCE, 1, 1, 0) +
      decode(t.YEAR_SOURCE, 1, 1, 0) +
      decode(t.MONTH_SOURCE, 1, 1, 0) +
      decode(t.LPU_ID_SOURCE, 1, 1, 0) +
      decode(t.TER_OKATO_SOURCE, 1, 1, 0) +
      decode(t.OKATOG_SOURCE, 1, 1, 0) +
      decode(t.OKATOP_SOURCE, 1, 1, 0) +
      decode(t.LPU_NAPR_SOURCE, 1, 1, 0) +
      decode(t.PERSON_IDL_SOURCE, 1, 1, 0) +
      decode(t.POLICYSER_SOURCE, 1, 1, 0) +
      decode(t.POLICYNUM_SOURCE, 1, 1, 0) +
      decode(t.FAM_SOURCE, 1, 1, 0) +
      decode(t.IM_SOURCE, 1, 1, 0) +
      decode(t.OTCH_SOURCE, 1, 1, 0) +
      decode(t.DATE_B_DAY_SOURCE, 1, 1, 0) +
      decode(t.POL_SOURCE, 1, 1, 0) +
      decode(t.DIA_SD_SOURCE, 1, 1, 0) +
      decode(t.DIA_O_SOURCE, 1, 1, 0) +
      decode(t.DIA_C_SOURCE, 1, 1, 0) +
      decode(t.DIA_E_SOURCE, 1, 1, 0) +
      decode(t.DATE_S_SOURCE, 1, 1, 0) +
      decode(t.DATE_E_SOURCE, 1, 1, 0) +
      decode(t.DATE_NAPR_SOURCE, 1, 1, 0) +
      decode(t.DESTROY_SOURCE, 1, 1, 0) +
      decode(t.Q_Z_SOURCE, 1, 1, 0) +
      decode(t.RES_G_SOURCE, 1, 1, 0) +
      decode(t.RESG_DOP_SOURCE, 1, 1, 0) +
      decode(t.DISP_SOURCE, 1, 1, 0) +
  --    decode(t.DOC_STAT_SOURCE, 1, 1, 0) +
  --    decode(t.PRVD_SOURCE, 1, 1, 0) +
      decode(t.TOTAL_SOURCE, 1, 1, 0) +
      decode(t.N_NAPR_SOURCE, 1, 1, 0) +
      decode(t.N_MAP_SOURCE, 1, 1, 0) +
      decode(t.N_MAP_AMB_SOURCE, 1, 1, 0) +
      decode(t.OPER_ID_SOURCE, 1, 1, 0) +
      decode(t.NARKOZ_ID_SOURCE, 1, 1, 0) +
  --    decode(t.BL_SER_SOURCE, 1, 1, 0) +
  --    decode(t.BL_NUM_SOURCE, 1, 1, 0) +
  --    decode(t.BL_DATE_S_SOURCE, 1, 1, 0) +
  --    decode(t.BL_DATE_E_SOURCE, 1, 1, 0) +
  --    decode(t.ADRES_SOURCE, 1, 1, 0) +
      decode(t.SMK_NAME_SOURCE, 1, 1, 0) +
      decode(t.SN_PASP_SOURCE, 1, 1, 0) +
      decode(t.Q_U_SOURCE, 1, 1, 0) +
      decode(t.D_TYPE_SOURCE, 1, 1, 0) +
      decode(t.LPU_INTR_SOURCE, 1, 1, 0) +
      decode(t.TFOMS_REG_SOURCE, 1, 1, 0) +
      decode(t.DATE_NPOL_SOURCE, 1, 1, 0) +
      decode(t.DATE_EPOL_SOURCE, 1, 1, 0) +
      decode(t.STAT_P_SOURCE, 1, 1, 0) +
      decode(t.NOVOR_SOURCE, 1, 1, 0) +
      decode(t.FAMP_SOURCE, 1, 1, 0) +
      decode(t.IMP_SOURCE, 1, 1, 0) +
      decode(t.OTP_SOURCE, 1, 1, 0) +
      decode(t.C_OKSM_SOURCE, 1, 1, 0) +
      decode(t.C_DOC_SOURCE, 1, 1, 0) +
      decode(t.S_DOC_SOURCE, 1, 1, 0) +
      decode(t.N_DOC_SOURCE, 1, 1, 0) +
      decode(t.R_NAME_SOURCE, 1, 1, 0) +
      decode(t.C_NAME_SOURCE, 1, 1, 0) +
      decode(t.Q_NP_SOURCE, 1, 1, 0) +
      decode(t.NP_NAME_SOURCE, 1, 1, 0) +
      decode(t.Q_UL_SOURCE, 1, 1, 0) +
      decode(t.UL_NAME_SOURCE, 1, 1, 0) +
      decode(t.DOM_SOURCE, 1, 1, 0) +
      decode(t.KOR_SOURCE, 1, 1, 0) +
      decode(t.KV_SOURCE, 1, 1, 0) +
      decode(t.STAT_Z_SOURCE, 1, 1, 0) +
      decode(t.V_MU_SOURCE, 1, 1, 0) +
      decode(t.PR_MP_SOURCE, 1, 1, 0) +
      decode(t.TYPE_MP_SOURCE, 1, 1, 0) +
      decode(t.PRVS_SOURCE, 1, 1, 0) +

  --    decode(t.VO_SOURCE, 1, 1, 0) +
      decode(t.VID_P_SOURCE, 1, 1, 0) +
      decode(t.Q_OGRN_SOURCE, 1, 1, 0) +
      decode(t.STANDARD_SOURCE, 1, 1, 0)+
      decode(t.MR_SOURCE, 1, 1, 0)+
      decode(t.SNILS_SOURCE, 1, 1, 0) +

      decode(t.POLP_SOURCE, 1, 1, 0) +
      decode(t.DRP_SOURCE, 1, 1, 0) +
      decode(t.TYPE_V_MU_SOURCE, 1, 1, 0) +
      decode(t.AMB_PR_SOURCE, 1, 1, 0) +
      decode(t.DISP_KAT_SOURCE, 1, 1, 0) +
      decode(t.GZ_SOURCE, 1, 1, 0) +
      decode(t.DISP_RES_SOURCE, 1, 1, 0) +
      decode(t.MODERN_SOURCE, 1, 1, 0) +
      decode(t.SUM_MODERN_SOURCE, 1, 1, 0),

      0

    )FN_IS_CALC,

    decode(t.FN_SOURCE, 2,

      decode(t.OWN_SOURCE, 2, 1, 0) +
      decode(t.TYPE_FIN_SOURCE, 2, 1, 0) +
      decode(t.GLOBAL_ID_SOURCE, 2, 1, 0) +
      decode(t.YEAR_SOURCE, 2, 1, 0) +
      decode(t.MONTH_SOURCE, 2, 1, 0) +
      decode(t.LPU_ID_SOURCE, 2, 1, 0) +
      decode(t.TER_OKATO_SOURCE, 2, 1, 0) +
      decode(t.OKATOG_SOURCE, 2, 1, 0) +
      decode(t.OKATOP_SOURCE, 2, 1, 0) +
      decode(t.LPU_NAPR_SOURCE, 2, 1, 0) +
      decode(t.PERSON_IDL_SOURCE, 2, 1, 0) +
      decode(t.POLICYSER_SOURCE, 2, 1, 0) +
      decode(t.POLICYNUM_SOURCE, 2, 1, 0) +
      decode(t.FAM_SOURCE, 2, 1, 0) +
      decode(t.IM_SOURCE, 2, 1, 0) +
      decode(t.OTCH_SOURCE, 2, 1, 0) +
      decode(t.DATE_B_DAY_SOURCE, 2, 1, 0) +
      decode(t.POL_SOURCE, 2, 1, 0) +
      decode(t.DIA_SD_SOURCE, 2, 1, 0) +
      decode(t.DIA_O_SOURCE, 2, 1, 0) +
      decode(t.DIA_C_SOURCE, 2, 1, 0) +
      decode(t.DIA_E_SOURCE, 2, 1, 0) +
      decode(t.DATE_S_SOURCE, 2, 1, 0) +
      decode(t.DATE_E_SOURCE, 2, 1, 0) +
      decode(t.DATE_NAPR_SOURCE, 2, 1, 0) +
      decode(t.DESTROY_SOURCE, 2, 1, 0) +
      decode(t.Q_Z_SOURCE, 2, 1, 0) +
      decode(t.RES_G_SOURCE, 2, 1, 0) +
      decode(t.RESG_DOP_SOURCE, 2, 1, 0) +
      decode(t.DISP_SOURCE, 2, 1, 0) +
  --    decode(t.DOC_STAT_SOURCE, 2, 1, 0) +
  --    decode(t.PRVD_SOURCE, 2, 1, 0) +
      decode(t.TOTAL_SOURCE, 2, 1, 0) +
      decode(t.N_NAPR_SOURCE, 2, 1, 0) +
      decode(t.N_MAP_SOURCE, 2, 1, 0) +
      decode(t.N_MAP_AMB_SOURCE, 2, 1, 0) +
      decode(t.OPER_ID_SOURCE, 2, 1, 0) +
      decode(t.NARKOZ_ID_SOURCE, 2, 1, 0) +
  --    decode(t.BL_SER_SOURCE, 2, 1, 0) +
  --    decode(t.BL_NUM_SOURCE, 2, 1, 0) +
  --    decode(t.BL_DATE_S_SOURCE, 2, 1, 0) +
  --    decode(t.BL_DATE_E_SOURCE, 2, 1, 0) +
  --    decode(t.ADRES_SOURCE, 2, 1, 0) +
      decode(t.SMK_NAME_SOURCE, 2, 1, 0) +
      decode(t.SN_PASP_SOURCE, 2, 1, 0) +
      decode(t.Q_U_SOURCE, 2, 1, 0) +
      decode(t.D_TYPE_SOURCE, 2, 1, 0) +
      decode(t.LPU_INTR_SOURCE, 2, 1, 0) +
      decode(t.TFOMS_REG_SOURCE, 2, 1, 0) +
      decode(t.DATE_NPOL_SOURCE, 2, 1, 0) +
      decode(t.DATE_EPOL_SOURCE, 2, 1, 0) +
      decode(t.STAT_P_SOURCE, 2, 1, 0) +
      decode(t.NOVOR_SOURCE, 2, 1, 0) +
      decode(t.FAMP_SOURCE, 2, 1, 0) +
      decode(t.IMP_SOURCE, 2, 1, 0) +
      decode(t.OTP_SOURCE, 2, 1, 0) +
      decode(t.C_OKSM_SOURCE, 2, 1, 0) +
      decode(t.C_DOC_SOURCE, 2, 1, 0) +
      decode(t.S_DOC_SOURCE, 2, 1, 0) +
      decode(t.N_DOC_SOURCE, 2, 1, 0) +
      decode(t.R_NAME_SOURCE, 2, 1, 0) +
      decode(t.C_NAME_SOURCE, 2, 1, 0) +
      decode(t.Q_NP_SOURCE, 2, 1, 0) +
      decode(t.NP_NAME_SOURCE, 2, 1, 0) +
      decode(t.Q_UL_SOURCE, 2, 1, 0) +
      decode(t.UL_NAME_SOURCE, 2, 1, 0) +
      decode(t.DOM_SOURCE, 2, 1, 0) +
      decode(t.KOR_SOURCE, 2, 1, 0) +
      decode(t.KV_SOURCE, 2, 1, 0) +
      decode(t.STAT_Z_SOURCE, 2, 1, 0) +
      decode(t.V_MU_SOURCE, 2, 1, 0) +
      decode(t.PR_MP_SOURCE, 2, 1, 0) +
      decode(t.TYPE_MP_SOURCE, 2, 1, 0) +
      decode(t.PRVS_SOURCE, 2, 1, 0) +
  --    decode(t.VO_SOURCE, 2, 1, 0) +

      decode(t.VID_P_SOURCE, 2, 1, 0) +
      decode(t.Q_OGRN_SOURCE, 2, 1, 0) +
      decode(t.STANDARD_SOURCE, 2, 1, 0)+
      decode(t.MR_SOURCE, 2, 1, 0)+
      decode(t.SNILS_SOURCE, 2, 1, 0) +

      decode(t.POLP_SOURCE, 2, 1, 0) +
      decode(t.DRP_SOURCE, 2, 1, 0) +
      decode(t.TYPE_V_MU_SOURCE, 2, 1, 0) +
      decode(t.AMB_PR_SOURCE, 2, 1, 0) +
      decode(t.DISP_KAT_SOURCE, 2, 1, 0) +
      decode(t.GZ_SOURCE, 2, 1, 0) +
      decode(t.DISP_RES_SOURCE, 2, 1, 0) +
      decode(t.MODERN_SOURCE, 2, 1, 0) +
      decode(t.SUM_MODERN_SOURCE, 2, 1, 0),

      0

    )FN_IS_BOTH,

    decode(t.FN_SOURCE, 3, 77, 2,

      decode(t.OWN_SOURCE, 3, 1, 0) +
      decode(t.TYPE_FIN_SOURCE, 3, 1, 0) +
      decode(t.GLOBAL_ID_SOURCE, 3, 1, 0) +
      decode(t.YEAR_SOURCE, 3, 1, 0) +
      decode(t.MONTH_SOURCE, 3, 1, 0) +
      decode(t.LPU_ID_SOURCE, 3, 1, 0) +
      decode(t.TER_OKATO_SOURCE, 3, 1, 0) +
      decode(t.OKATOG_SOURCE, 3, 1, 0) +
      decode(t.OKATOP_SOURCE, 3, 1, 0) +
      decode(t.LPU_NAPR_SOURCE, 3, 1, 0) +
      decode(t.PERSON_IDL_SOURCE, 3, 1, 0) +
      decode(t.POLICYSER_SOURCE, 3, 1, 0) +
      decode(t.POLICYNUM_SOURCE, 3, 1, 0) +
      decode(t.FAM_SOURCE, 3, 1, 0) +
      decode(t.IM_SOURCE, 3, 1, 0) +
      decode(t.OTCH_SOURCE, 3, 1, 0) +
      decode(t.DATE_B_DAY_SOURCE, 3, 1, 0) +
      decode(t.POL_SOURCE, 3, 1, 0) +
      decode(t.DIA_SD_SOURCE, 3, 1, 0) +
      decode(t.DIA_O_SOURCE, 3, 1, 0) +
      decode(t.DIA_C_SOURCE, 3, 1, 0) +
      decode(t.DIA_E_SOURCE, 3, 1, 0) +
      decode(t.DATE_S_SOURCE, 3, 1, 0) +
      decode(t.DATE_E_SOURCE, 3, 1, 0) +
      decode(t.DATE_NAPR_SOURCE, 3, 1, 0) +
      decode(t.DESTROY_SOURCE, 3, 1, 0) +
      decode(t.Q_Z_SOURCE, 3, 1, 0) +
      decode(t.RES_G_SOURCE, 3, 1, 0) +
      decode(t.RESG_DOP_SOURCE, 3, 1, 0) +
      decode(t.DISP_SOURCE, 3, 1, 0) +
  --    decode(t.DOC_STAT_SOURCE, 3, 1, 0) +
  --    decode(t.PRVD_SOURCE, 3, 1, 0) +
      decode(t.TOTAL_SOURCE, 3, 1, 0) +
      decode(t.N_NAPR_SOURCE, 3, 1, 0) +
      decode(t.N_MAP_SOURCE, 3, 1, 0) +
      decode(t.N_MAP_AMB_SOURCE, 3, 1, 0) +
      decode(t.OPER_ID_SOURCE, 3, 1, 0) +
      decode(t.NARKOZ_ID_SOURCE, 3, 1, 0) +
  --    decode(t.BL_SER_SOURCE, 3, 1, 0) +
  --    decode(t.BL_NUM_SOURCE, 3, 1, 0) +
  --    decode(t.BL_DATE_S_SOURCE, 3, 1, 0) +
  --    decode(t.BL_DATE_E_SOURCE, 3, 1, 0) +
  --    decode(t.ADRES_SOURCE, 3, 1, 0) +
      decode(t.SMK_NAME_SOURCE, 3, 1, 0) +
      decode(t.SN_PASP_SOURCE, 3, 1, 0) +
      decode(t.Q_U_SOURCE, 3, 1, 0) +
      decode(t.D_TYPE_SOURCE, 3, 1, 0) +
      decode(t.LPU_INTR_SOURCE, 3, 1, 0) +
      decode(t.TFOMS_REG_SOURCE, 3, 1, 0) +
      decode(t.DATE_NPOL_SOURCE, 3, 1, 0) +
      decode(t.DATE_EPOL_SOURCE, 3, 1, 0) +
      decode(t.STAT_P_SOURCE, 3, 1, 0) +
      decode(t.NOVOR_SOURCE, 3, 1, 0) +
      decode(t.FAMP_SOURCE, 3, 1, 0) +
      decode(t.IMP_SOURCE, 3, 1, 0) +
      decode(t.OTP_SOURCE, 3, 1, 0) +
      decode(t.C_OKSM_SOURCE, 3, 1, 0) +
      decode(t.C_DOC_SOURCE, 3, 1, 0) +
      decode(t.S_DOC_SOURCE, 3, 1, 0) +
      decode(t.N_DOC_SOURCE, 3, 1, 0) +
      decode(t.R_NAME_SOURCE, 3, 1, 0) +
      decode(t.C_NAME_SOURCE, 3, 1, 0) +
      decode(t.Q_NP_SOURCE, 3, 1, 0) +
      decode(t.NP_NAME_SOURCE, 3, 1, 0) +
      decode(t.Q_UL_SOURCE, 3, 1, 0) +
      decode(t.UL_NAME_SOURCE, 3, 1, 0) +
      decode(t.DOM_SOURCE, 3, 1, 0) +
      decode(t.KOR_SOURCE, 3, 1, 0) +
      decode(t.KV_SOURCE, 3, 1, 0) +
      decode(t.STAT_Z_SOURCE, 3, 1, 0) +
      decode(t.V_MU_SOURCE, 3, 1, 0) +
      decode(t.PR_MP_SOURCE, 3, 1, 0) +
      decode(t.TYPE_MP_SOURCE, 3, 1, 0) +
      decode(t.PRVS_SOURCE, 3, 1, 0) +
  --    decode(t.VO_SOURCE, 3, 1, 0) +

      decode(t.VID_P_SOURCE, 3, 1, 0) +
      decode(t.Q_OGRN_SOURCE, 3, 1, 0) +
      decode(t.STANDARD_SOURCE, 3, 1, 0)+
      decode(t.MR_SOURCE, 3, 1, 0)+
      decode(t.SNILS_SOURCE, 3, 1, 0) +

      decode(t.POLP_SOURCE, 3, 1, 0) +
      decode(t.DRP_SOURCE, 3, 1, 0) +
      decode(t.TYPE_V_MU_SOURCE, 3, 1, 0) +
      decode(t.AMB_PR_SOURCE, 3, 1, 0) +
      decode(t.DISP_KAT_SOURCE, 3, 1, 0) +
      decode(t.GZ_SOURCE, 3, 1, 0) +
      decode(t.DISP_RES_SOURCE, 3, 1, 0) +
      decode(t.MODERN_SOURCE, 3, 1, 0) +
      decode(t.SUM_MODERN_SOURCE, 3, 1, 0),

      0

    )FN_IS_ERR,

    t.FN_SOURCE,

    t.FK_ID_TS,

    t.FK_ID_TSL,

    t.N_TOTAL_TS N_TOTAL_TS,

    t.N_TOTAL_TSL N_TOTAL_TSL,

    t.N_SUM_MODERN_TS N_SUM_MODERN_TS,

    t.N_SUM_MODERN_TSL N_SUM_MODERN_TSL,

    tu.N_SUM_MODERN_SBJ,
    tu.N_SUM_MODERN_FED,

    tu.kol_eosum,
    tul.kol_eosum kol_eosum_l,

    t.fk_groupsluchid,

    t.fn_AgeInYears,

    CASE
      WHEN t.FK_ID_TS is null or (tu.fn_nocomparecount < tu.fn_uslcount) THEN
        1
      ELSE
        0
     END fl_CompearUsl,

    t.SMK_ID_P,
    t.TOTAL_SMO,
    t.SANK_KOD,
    t.UDR_MEK,
    t.UDR_MEE,
    t.UDR_EKMP,
    t.SHTR_MEK,
    t.SHTR_MEE,
    t.SHTR_EKMP,
    t.MSG_DEF,

    t.n_own_ts,

    tu.kol_musum,
    tul.kol_musum kol_musum_l,

    i.fk_id FK_INSURDOCID,
    nvl(tp.fk_pacid, ta.fk_id) fk_pacid,

    t.POLICYSER_TSL,
    t.POLICYNUM_TSL,
    t.OWN_TSL,
    t.VID_P_TSL,

    tsr_od.fk_id fk_sotrid,
    tsr_od.fc_fam fc_sotrfam,
    tsr_od.fc_name fc_sotrname,
    tsr_od.fc_otch fc_sotrotch,
    tosc_od.fk_id fk_otdelid_vyp,
    tosc_od.fc_name fc_otdelname_vyp

  from
     (select
      to_char(ts.OWN) OWN_TS,
      to_char(tsl.OWN) OWN_TSL,
      decode(TS.OWN, TSL.OWN, 2, decode(TS.OWN, null, 0, decode(TSL.OWN, null, 1, 3))) OWN_SOURCE,
      to_char(ts.TYPE_FIN) TYPE_FIN_TS,
      to_char(tsl.TYPE_FIN) TYPE_FIN_TSL,
      decode(TS.TYPE_FIN, TSL.TYPE_FIN, 2, decode(TS.TYPE_FIN, null, 0, decode(TSL.TYPE_FIN, null, 1, 3))) TYPE_FIN_SOURCE,
      to_char(ts.GLOBAL_ID) GLOBAL_ID_TS,
      to_char(tsl.GLOBAL_ID) GLOBAL_ID_TSL,
      decode(TS.GLOBAL_ID, TSL.GLOBAL_ID, 2, decode(TS.GLOBAL_ID, null, 0, decode(TSL.GLOBAL_ID, null, 1, 3))) GLOBAL_ID_SOURCE,
      to_char(ts.YEAR) YEAR_TS,
      to_char(nvl(nvl(tsl.YEAR, d.year), ts.YEAR)) YEAR_TSL,
      decode(nvl(tsl.ID_ILL, d.ID_ILL), null, 1, decode(ts.ID_ILL, nvl(tsl.ID_ILL, d.ID_ILL), 2, 0)) YEAR_SOURCE,
      to_char(ts.MONTH) MONTH_TS,
      to_char(nvl(nvl(tsl.MONTH, d.month), ts.MONTH)) MONTH_TSL,
      decode(nvl(tsl.ID_ILL, d.ID_ILL), null, 1, decode(ts.ID_ILL, nvl(tsl.ID_ILL, d.ID_ILL), 2, 0)) MONTH_SOURCE,
      to_char(ts.LPU_ID) LPU_ID_TS,
      to_char(nvl(nvl(tsl.LPU_ID, d.lpu_id), ts.LPU_ID)) LPU_ID_TSL,
      decode(nvl(tsl.ID_ILL, d.ID_ILL), null, 1, decode(ts.ID_ILL, nvl(tsl.ID_ILL, d.ID_ILL), 2, 0)) LPU_ID_SOURCE,
      to_char(ts.TER_OKATO) TER_OKATO_TS,
      to_char(tsl.TER_OKATO) TER_OKATO_TSL,
      decode(TS.TER_OKATO, TSL.TER_OKATO, 2, decode(TS.TER_OKATO, null, 0, decode(TSL.TER_OKATO, null, 1, 3))) TER_OKATO_SOURCE,
      to_char(ts.OKATOG) OKATOG_TS,
      to_char(tsl.OKATOG) OKATOG_TSL,
      decode(TS.OKATOG, TSL.OKATOG, 2, decode(TS.OKATOG, null, 0, decode(TSL.OKATOG, null, 1, 3))) OKATOG_SOURCE,
      to_char(ts.OKATOP) OKATOP_TS,
      to_char(tsl.OKATOP) OKATOP_TSL,
      decode(TS.OKATOP, TSL.OKATOP, 2, decode(TS.OKATOP, null, 0, decode(TSL.OKATOP, null, 1, 3))) OKATOP_SOURCE,
      to_char(ts.LPU_NAPR) LPU_NAPR_TS,
      to_char(tsl.LPU_NAPR) LPU_NAPR_TSL,
      decode(TS.LPU_NAPR, TSL.LPU_NAPR, 2, decode(TS.LPU_NAPR, null, 0, decode(TSL.LPU_NAPR, null, 1, 3))) LPU_NAPR_SOURCE,
      to_char(ts.PERSON_IDL) PERSON_IDL_TS,
      to_char(nvl(tsl.PERSON_IDL, d.person_idl)) PERSON_IDL_TSL,
      decode(TS.PERSON_IDL, nvl(tsl.PERSON_IDL, d.person_idl), 2, decode(TS.PERSON_IDL, null, 0, decode(nvl(tsl.PERSON_IDL, d.person_idl), null, 1, 3))) PERSON_IDL_SOURCE,
      ts.ID_ILL ID_ILL_TS,
      nvl(nvl(tsl.ID_ILL, d.ID_ILL), ts.ID_ILL) ID_ILL_TSL,
      to_char(ts.POLICYSER) POLICYSER_TS,
      to_char(tsl.POLICYSER) POLICYSER_TSL,
      decode(TS.POLICYSER, TSL.POLICYSER, 2, decode(TS.POLICYSER, null, 0, decode(TSL.POLICYSER, null, 1, 3))) POLICYSER_SOURCE,
      to_char(ts.POLICYNUM) POLICYNUM_TS,
      to_char(tsl.POLICYNUM) POLICYNUM_TSL,
      decode(TS.POLICYNUM, TSL.POLICYNUM, 2, decode(TS.POLICYNUM, null, 0, decode(TSL.POLICYNUM, null, 1, 3))) POLICYNUM_SOURCE,
      to_char(ts.FAM) FAM_TS,
      to_char(nvl(tsl.FAM, dp.fc_fam)) FAM_TSL,
      decode(TS.FAM, nvl(tsl.FAM, dp.fc_fam), 2, decode(TS.FAM, null, 0, decode(nvl(tsl.FAM, dp.fc_fam), null, 1, 3))) FAM_SOURCE,
      to_char(ts.IM) IM_TS,
      to_char(nvl(tsl.IM, dp.fc_im)) IM_TSL,
      decode(TS.IM, nvl(tsl.IM, dp.fc_im), 2, decode(TS.IM, null, 0, decode(nvl(tsl.IM, dp.fc_im), null, 1, 3))) IM_SOURCE,
      to_char(ts.OTCH) OTCH_TS,
      to_char(nvl(tsl.OTCH, dp.fc_otch)) OTCH_TSL,
      decode(TS.OTCH, nvl(tsl.OTCH, dp.fc_otch), 2, decode(TS.OTCH, null, 0, decode(nvl(tsl.OTCH, dp.fc_otch), null, 1, 3))) OTCH_SOURCE,
      to_char(ts.DATE_B_DAY, 'dd.mm.yyyy') DATE_B_DAY_TS,
      to_char(nvl(tsl.DATE_B_DAY, dp.fd_rojd), 'dd.mm.yyyy') DATE_B_DAY_TSL,
      decode(TS.DATE_B_DAY, nvl(tsl.DATE_B_DAY, dp.fd_rojd), 2, decode(TS.DATE_B_DAY, null, 0, decode(nvl(tsl.DATE_B_DAY, dp.fd_rojd), null, 1, 3))) DATE_B_DAY_SOURCE,
      to_char(ts.POL) POL_TS,
      to_char(tsl.POL) POL_TSL,
      decode(TS.POL, TSL.POL, 2, decode(TS.POL, null, 0, decode(TSL.POL, null, 1, 3))) POL_SOURCE,
      to_char(ts.DIA_SD) DIA_SD_TS,
      to_char(tsl.DIA_SD) DIA_SD_TSL,
      decode(TS.DIA_SD, TSL.DIA_SD, 2, decode(TS.DIA_SD, null, 0, decode(TSL.DIA_SD, null, 1, 3))) DIA_SD_SOURCE,
      to_char(ts.DIA_O) DIA_O_TS,
      to_char(tsl.DIA_O) DIA_O_TSL,
      decode(TS.DIA_O, TSL.DIA_O, 2, decode(TS.DIA_O, null, 0, decode(TSL.DIA_O, null, 1, 3))) DIA_O_SOURCE,
      to_char(ts.DIA_C) DIA_C_TS,
      to_char(tsl.DIA_C) DIA_C_TSL,
      decode(TS.DIA_C, TSL.DIA_C, 2, decode(TS.DIA_C, null, 0, decode(TSL.DIA_C, null, 1, 3))) DIA_C_SOURCE,
      to_char(ts.DIA_E) DIA_E_TS,
      to_char(tsl.DIA_E) DIA_E_TSL,
      decode(TS.DIA_E, TSL.DIA_E, 2, decode(TS.DIA_E, null, 0, decode(TSL.DIA_E, null, 1, 3))) DIA_E_SOURCE,
      to_char(ts.DATE_S, 'dd.mm.yyyy') DATE_S_TS,
      to_char(tsl.DATE_S, 'dd.mm.yyyy') DATE_S_TSL,
      decode(TS.DATE_S, TSL.DATE_S, 2, decode(TS.DATE_S, null, 0, decode(TSL.DATE_S, null, 1, 3))) DATE_S_SOURCE,
      to_char(ts.DATE_E, 'dd.mm.yyyy') DATE_E_TS,
      to_char(tsl.DATE_E, 'dd.mm.yyyy') DATE_E_TSL,
      decode(TS.DATE_E, TSL.DATE_E, 2, decode(TS.DATE_E, null, 0, decode(TSL.DATE_E, null, 1, 3))) DATE_E_SOURCE,
      to_char(ts.DATE_NAPR, 'dd.mm.yyyy') DATE_NAPR_TS,
      to_char(tsl.DATE_NAPR, 'dd.mm.yyyy') DATE_NAPR_TSL,
      decode(TS.DATE_NAPR, TSL.DATE_NAPR, 2, decode(TS.DATE_NAPR, null, 0, decode(TSL.DATE_NAPR, null, 1, 3))) DATE_NAPR_SOURCE,
      to_char(ts.DESTROY) DESTROY_TS,
      to_char(tsl.DESTROY) DESTROY_TSL,
      decode(TS.DESTROY, TSL.DESTROY, 2, decode(TS.DESTROY, null, 0, decode(TSL.DESTROY, null, 1, 3))) DESTROY_SOURCE,
      to_char(ts.Q_Z) Q_Z_TS,
      to_char(tsl.Q_Z) Q_Z_TSL,
      decode(TS.Q_Z, TSL.Q_Z, 2, decode(TS.Q_Z, null, 0, decode(TSL.Q_Z, null, 1, 3))) Q_Z_SOURCE,
      to_char(ts.RES_G) RES_G_TS,
      to_char(tsl.RES_G) RES_G_TSL,
      decode(TS.RES_G, TSL.RES_G, 2, decode(TS.RES_G, null, 0, decode(TSL.RES_G, null, 1, 3))) RES_G_SOURCE,
      to_char(ts.RESG_DOP) RESG_DOP_TS,
      to_char(tsl.RESG_DOP) RESG_DOP_TSL,
      decode(TS.RESG_DOP, TSL.RESG_DOP, 2, decode(TS.RESG_DOP, null, 0, decode(TSL.RESG_DOP, null, 1, 3))) RESG_DOP_SOURCE,
      to_char(ts.DISP) DISP_TS,
      to_char(tsl.DISP) DISP_TSL,
      decode(TS.DISP, TSL.DISP, 2, decode(TS.DISP, null, 0, decode(TSL.DISP, null, 1, 3))) DISP_SOURCE,
  --    to_char(ts.DOC_STAT) DOC_STAT_TS,
  --    to_char(tsl.DOC_STAT) DOC_STAT_TSL,
  --    decode(TS.DOC_STAT, TSL.DOC_STAT, 2, decode(TS.DOC_STAT, null, 0, decode(TSL.DOC_STAT, null, 1, 3))) DOC_STAT_SOURCE,
  --    to_char(ts.PRVD) PRVD_TS,
  --    to_char(tsl.PRVD) PRVD_TSL,
  --    decode(TS.PRVD, TSL.PRVD, 2, decode(TS.PRVD, null, 0, decode(TSL.PRVD, null, 1, 3))) PRVD_SOURCE,
      trim(to_char(ts.TOTAL, '999999999999999.00')) TOTAL_TS,
      trim(to_char(tsl.TOTAL, '999999999999999.00')) TOTAL_TSL,
      ts.TOTAL N_TOTAL_TS,
      tsl.TOTAL N_TOTAL_TSL,
      decode(TS.TOTAL, TSL.TOTAL, 2, decode(TS.TOTAL, null, 0, decode(TSL.TOTAL, null, 1, 3))) TOTAL_SOURCE,

      to_char(ts.N_NAPR) N_NAPR_TS,
      to_char(tsl.N_NAPR) N_NAPR_TSL,
      decode(TS.N_NAPR, TSL.N_NAPR, 2, decode(TS.N_NAPR, null, 0, decode(TSL.N_NAPR, null, 1, 3))) N_NAPR_SOURCE,

      to_char(ts.N_MAP) N_MAP_TS,
      to_char(tsl.N_MAP) N_MAP_TSL,
      decode(TS.N_MAP, TSL.N_MAP, 2, decode(TS.N_MAP, null, 0, decode(TSL.N_MAP, null, 1, 3))) N_MAP_SOURCE,
      to_char(ts.N_MAP_AMB) N_MAP_AMB_TS,
      to_char(tsl.N_MAP_AMB) N_MAP_AMB_TSL,
      decode(TS.N_MAP_AMB, TSL.N_MAP_AMB, 2, decode(TS.N_MAP_AMB, null, 0, decode(TSL.N_MAP_AMB, null, 1, 3))) N_MAP_AMB_SOURCE,
      to_char(ts.OPER_ID) OPER_ID_TS,
      to_char(tsl.OPER_ID) OPER_ID_TSL,
      decode(TS.OPER_ID, TSL.OPER_ID, 2, decode(TS.OPER_ID, null, 0, decode(TSL.OPER_ID, null, 1, 3))) OPER_ID_SOURCE,
      to_char(ts.NARKOZ_ID) NARKOZ_ID_TS,
      to_char(tsl.NARKOZ_ID) NARKOZ_ID_TSL,
      decode(TS.NARKOZ_ID, TSL.NARKOZ_ID, 2, decode(TS.NARKOZ_ID, null, 0, decode(TSL.NARKOZ_ID, null, 1, 3))) NARKOZ_ID_SOURCE,
  --    to_char(ts.BL_SER) BL_SER_TS,
  --    to_char(tsl.BL_SER) BL_SER_TSL,
  --    decode(TS.BL_SER, TSL.BL_SER, 2, decode(TS.BL_SER, null, 0, decode(TSL.BL_SER, null, 1, 3))) BL_SER_SOURCE,
  --    to_char(ts.BL_NUM) BL_NUM_TS,
  --    to_char(tsl.BL_NUM) BL_NUM_TSL,
  --    decode(TS.BL_NUM, TSL.BL_NUM, 2, decode(TS.BL_NUM, null, 0, decode(TSL.BL_NUM, null, 1, 3))) BL_NUM_SOURCE,
  --    to_char(ts.BL_DATE_S) BL_DATE_S_TS,
  --    to_char(tsl.BL_DATE_S) BL_DATE_S_TSL,
  --    decode(TS.BL_DATE_S, TSL.BL_DATE_S, 2, decode(TS.BL_DATE_S, null, 0, decode(TSL.BL_DATE_S, null, 1, 3))) BL_DATE_S_SOURCE,
  --    to_char(ts.BL_DATE_E) BL_DATE_E_TS,
  --    to_char(tsl.BL_DATE_E) BL_DATE_E_TSL,
  --    decode(TS.BL_DATE_E, TSL.BL_DATE_E, 2, decode(TS.BL_DATE_E, null, 0, decode(TSL.BL_DATE_E, null, 1, 3))) BL_DATE_E_SOURCE,
  --    to_char(ts.ADRES) ADRES_TS,
  --    to_char(tsl.ADRES) ADRES_TSL,
  --    decode(TS.ADRES, TSL.ADRES, 2, decode(TS.ADRES, null, 0, decode(TSL.ADRES, null, 1, 3))) ADRES_SOURCE,
      to_char(ts.SMK_NAME) SMK_NAME_TS,
      to_char(tsl.SMK_NAME) SMK_NAME_TSL,
      decode(TS.SMK_NAME, TSL.SMK_NAME, 2, decode(TS.SMK_NAME, null, 0, decode(TSL.SMK_NAME, null, 1, 3))) SMK_NAME_SOURCE,
      to_char(ts.SN_PASP) SN_PASP_TS,
      to_char(tsl.SN_PASP) SN_PASP_TSL,
      decode(TS.SN_PASP, TSL.SN_PASP, 2, decode(TS.SN_PASP, null, 0, decode(TSL.SN_PASP, null, 1, 3))) SN_PASP_SOURCE,
      to_char(ts.Q_U) Q_U_TS,
      to_char(tsl.Q_U) Q_U_TSL,
      decode(TS.Q_U, TSL.Q_U, 2, decode(TS.Q_U, null, 0, decode(TSL.Q_U, null, 1, 3))) Q_U_SOURCE,
      to_char(ts.D_TYPE) D_TYPE_TS,
      to_char(tsl.D_TYPE) D_TYPE_TSL,
      decode(TS.D_TYPE, TSL.D_TYPE, 2, decode(TS.D_TYPE, null, 0, decode(TSL.D_TYPE, null, 1, 3))) D_TYPE_SOURCE,
      ts.P_ID_ILL P_ID_ILL_TS,
      nvl(nvl(tsl.P_ID_ILL, d.P_ID_ILL), ts.P_ID_ILL) P_ID_ILL_TSL,
      to_char(ts.LPU_INTR) LPU_INTR_TS,
      to_char(tsl.LPU_INTR) LPU_INTR_TSL,
      decode(TS.LPU_INTR, TSL.LPU_INTR, 2, decode(TS.LPU_INTR, null, 0, decode(TSL.LPU_INTR, null, 1, 3))) LPU_INTR_SOURCE,
      to_char(ts.TFOMS_REG) TFOMS_REG_TS,
      to_char(tsl.TFOMS_REG) TFOMS_REG_TSL,
      decode(TS.TFOMS_REG, TSL.TFOMS_REG, 2, decode(TS.TFOMS_REG, null, 0, decode(TSL.TFOMS_REG, null, 1, 3))) TFOMS_REG_SOURCE,
      to_char(ts.DATE_NPOL) DATE_NPOL_TS,
      to_char(tsl.DATE_NPOL) DATE_NPOL_TSL,
      decode(TS.DATE_NPOL, TSL.DATE_NPOL, 2, decode(TS.DATE_NPOL, null, 0, decode(TSL.DATE_NPOL, null, 1, 3))) DATE_NPOL_SOURCE,
      to_char(ts.DATE_EPOL) DATE_EPOL_TS,
      to_char(tsl.DATE_EPOL) DATE_EPOL_TSL,
      decode(TS.DATE_EPOL, TSL.DATE_EPOL, 2, decode(TS.DATE_EPOL, null, 0, decode(TSL.DATE_EPOL, null, 1, 3))) DATE_EPOL_SOURCE,
      to_char(ts.STAT_P) STAT_P_TS,
      to_char(tsl.STAT_P) STAT_P_TSL,
      decode(TS.STAT_P, TSL.STAT_P, 2, decode(TS.STAT_P, null, 0, decode(TSL.STAT_P, null, 1, 3))) STAT_P_SOURCE,
      to_char(ts.NOVOR) NOVOR_TS,
      to_char(tsl.NOVOR) NOVOR_TSL,
      decode(TS.NOVOR, TSL.NOVOR, 2, decode(TS.NOVOR, null, 0, decode(TSL.NOVOR, null, 1, 3))) NOVOR_SOURCE,
      to_char(ts.FAMP) FAMP_TS,
      to_char(tsl.FAMP) FAMP_TSL,
      decode(TS.FAMP, TSL.FAMP, 2, decode(TS.FAMP, null, 0, decode(TSL.FAMP, null, 1, 3))) FAMP_SOURCE,
      to_char(ts.IMP) IMP_TS,
      to_char(tsl.IMP) IMP_TSL,
      decode(TS.IMP, TSL.IMP, 2, decode(TS.IMP, null, 0, decode(TSL.IMP, null, 1, 3))) IMP_SOURCE,
      to_char(ts.OTP) OTP_TS,
      to_char(tsl.OTP) OTP_TSL,
      decode(TS.OTP, TSL.OTP, 2, decode(TS.OTP, null, 0, decode(TSL.OTP, null, 1, 3))) OTP_SOURCE,
      to_char(ts.C_OKSM) C_OKSM_TS,
      to_char(tsl.C_OKSM) C_OKSM_TSL,
      decode(TS.C_OKSM, TSL.C_OKSM, 2, decode(TS.C_OKSM, null, 0, decode(TSL.C_OKSM, null, 1, 3))) C_OKSM_SOURCE,
      to_char(ts.C_DOC) C_DOC_TS,
      to_char(tsl.C_DOC) C_DOC_TSL,
      decode(TS.C_DOC, TSL.C_DOC, 2, decode(TS.C_DOC, null, 0, decode(TSL.C_DOC, null, 1, 3))) C_DOC_SOURCE,
      to_char(ts.S_DOC) S_DOC_TS,
      to_char(tsl.S_DOC) S_DOC_TSL,
      decode(TS.S_DOC, TSL.S_DOC, 2, decode(TS.S_DOC, null, 0, decode(TSL.S_DOC, null, 1, 3))) S_DOC_SOURCE,
      to_char(ts.N_DOC) N_DOC_TS,
      to_char(tsl.N_DOC) N_DOC_TSL,
      decode(TS.N_DOC, TSL.N_DOC, 2, decode(TS.N_DOC, null, 0, decode(TSL.N_DOC, null, 1, 3))) N_DOC_SOURCE,
      to_char(ts.R_NAME) R_NAME_TS,
      to_char(tsl.R_NAME) R_NAME_TSL,
      decode(TS.R_NAME, TSL.R_NAME, 2, decode(TS.R_NAME, null, 0, decode(TSL.R_NAME, null, 1, 3))) R_NAME_SOURCE,
      to_char(ts.C_NAME) C_NAME_TS,
      to_char(tsl.C_NAME) C_NAME_TSL,
      decode(TS.C_NAME, TSL.C_NAME, 2, decode(TS.C_NAME, null, 0, decode(TSL.C_NAME, null, 1, 3))) C_NAME_SOURCE,
      to_char(ts.Q_NP) Q_NP_TS,
      to_char(tsl.Q_NP) Q_NP_TSL,
      decode(TS.Q_NP, TSL.Q_NP, 2, decode(TS.Q_NP, null, 0, decode(TSL.Q_NP, null, 1, 3))) Q_NP_SOURCE,
      to_char(ts.NP_NAME) NP_NAME_TS,
      to_char(tsl.NP_NAME) NP_NAME_TSL,
      decode(TS.NP_NAME, TSL.NP_NAME, 2, decode(TS.NP_NAME, null, 0, decode(TSL.NP_NAME, null, 1, 3))) NP_NAME_SOURCE,
      to_char(ts.Q_UL) Q_UL_TS,
      to_char(tsl.Q_UL) Q_UL_TSL,
      decode(TS.Q_UL, TSL.Q_UL, 2, decode(TS.Q_UL, null, 0, decode(TSL.Q_UL, null, 1, 3))) Q_UL_SOURCE,
      to_char(ts.UL_NAME) UL_NAME_TS,
      to_char(tsl.UL_NAME) UL_NAME_TSL,
      decode(TS.UL_NAME, TSL.UL_NAME, 2, decode(TS.UL_NAME, null, 0, decode(TSL.UL_NAME, null, 1, 3))) UL_NAME_SOURCE,
      to_char(ts.DOM) DOM_TS,
      to_char(tsl.DOM) DOM_TSL,
      decode(TS.DOM, TSL.DOM, 2, decode(TS.DOM, null, 0, decode(TSL.DOM, null, 1, 3))) DOM_SOURCE,
      to_char(ts.KOR) KOR_TS,
      to_char(tsl.KOR) KOR_TSL,
      decode(TS.KOR, TSL.KOR, 2, decode(TS.KOR, null, 0, decode(TSL.KOR, null, 1, 3))) KOR_SOURCE,
      to_char(ts.KV) KV_TS,
      to_char(tsl.KV) KV_TSL,
      decode(TS.KV, TSL.KV, 2, decode(TS.KV, null, 0, decode(TSL.KV, null, 1, 3))) KV_SOURCE,
      to_char(ts.STAT_Z) STAT_Z_TS,
      to_char(tsl.STAT_Z) STAT_Z_TSL,
      decode(TS.STAT_Z, TSL.STAT_Z, 2, decode(TS.STAT_Z, null, 0, decode(TSL.STAT_Z, null, 1, 3))) STAT_Z_SOURCE,
      to_char(ts.V_MU) V_MU_TS,
      to_char(tsl.V_MU) V_MU_TSL,
      decode(TS.V_MU, TSL.V_MU, 2, decode(TS.V_MU, null, 0, decode(TSL.V_MU, null, 1, 3))) V_MU_SOURCE,
      to_char(ts.PR_MP) PR_MP_TS,
      to_char(tsl.PR_MP) PR_MP_TSL,
      decode(TS.PR_MP, TSL.PR_MP, 2, decode(TS.PR_MP, null, 0, decode(TSL.PR_MP, null, 1, 3))) PR_MP_SOURCE,
      to_char(ts.TYPE_MP) TYPE_MP_TS,
      to_char(tsl.TYPE_MP) TYPE_MP_TSL,
      decode(TS.TYPE_MP, TSL.TYPE_MP, 2, decode(TS.TYPE_MP, null, 0, decode(TSL.TYPE_MP, null, 1, 3))) TYPE_MP_SOURCE,
      to_char(ts.PRVS) PRVS_TS,
      to_char(tsl.PRVS) PRVS_TSL,
      decode(TS.PRVS, TSL.PRVS, 2, decode(TS.PRVS, null, 0, decode(TSL.PRVS, null, 1, 3))) PRVS_SOURCE,
  --    to_char(ts.VO) VO_TS,
  --    to_char(tsl.VO) VO_TSL,
  --    decode(TS.VO, TSL.VO, 2, decode(TS.VO, null, 0, decode(TSL.VO, null, 1, 3))) VO_SOURCE,

      to_char(ts.VID_P) VID_P_TS,
      to_char(tsl.VID_P) VID_P_TSL,
      decode(TS.VID_P, TSL.VID_P, 2, decode(TS.VID_P, null, 0, decode(TSL.VID_P, null, 1, 3))) VID_P_SOURCE,
      to_char(ts.Q_OGRN) Q_OGRN_TS,
      to_char(tsl.Q_OGRN) Q_OGRN_TSL,
      decode(TS.Q_OGRN, TSL.Q_OGRN, 2, decode(TS.Q_OGRN, null, 0, decode(TSL.Q_OGRN, null, 1, 3))) Q_OGRN_SOURCE,
      to_char(ts.STANDARD) STANDARD_TS,
      to_char(tsl.STANDARD) STANDARD_TSL,
      decode(TS.STANDARD, TSL.STANDARD, 2, decode(TS.STANDARD, null, 0, decode(TSL.STANDARD, null, 1, 3))) STANDARD_SOURCE,

      to_char(ts.MR) MR_TS,
      to_char(tsl.MR) MR_TSL,
      decode(TS.MR, TSL.MR, 2, decode(TS.MR, null, 0, decode(TSL.MR, null, 1, 3))) MR_SOURCE,
      to_char(ts.SNILS) SNILS_TS,
      to_char(tsl.SNILS) SNILS_TSL,
      decode(TS.SNILS, TSL.SNILS, 2, decode(TS.SNILS, null, 0, decode(TSL.SNILS, null, 1, 3))) SNILS_SOURCE, -- was added by Prihodko

      to_char(ts.POLP) POLP_TS,
      to_char(tsl.POLP) POLP_TSL,
      decode(TS.POLP, TSL.POLP, 2, decode(TS.POLP, null, 0, decode(TSL.POLP, null, 1, 3))) POLP_SOURCE, -- was added by Prihodko
      to_char(ts.DRP) DRP_TS,
      to_char(tsl.DRP) DRP_TSL,
      decode(TS.DRP, TSL.DRP, 2, decode(TS.DRP, null, 0, decode(TSL.DRP, null, 1, 3))) DRP_SOURCE, -- was added by Prihodko
      to_char(ts.TYPE_V_MU) TYPE_V_MU_TS,
      to_char(tsl.TYPE_V_MU) TYPE_V_MU_TSL,
      decode(TS.TYPE_V_MU, TSL.TYPE_V_MU, 2, decode(TS.TYPE_V_MU, null, 0, decode(TSL.TYPE_V_MU, null, 1, 3))) TYPE_V_MU_SOURCE,

      to_char(ts.AMB_PR) AMB_PR_TS,
      to_char(tsl.AMB_PR) AMB_PR_TSL,
      decode(TS.AMB_PR, TSL.AMB_PR, 2, decode(TS.AMB_PR, null, 0, decode(TSL.AMB_PR, null, 1, 3))) AMB_PR_SOURCE,
      to_char(ts.DISP_KAT) DISP_KAT_TS,
      to_char(tsl.DISP_KAT) DISP_KAT_TSL,
      decode(TS.DISP_KAT, TSL.DISP_KAT, 2, decode(TS.DISP_KAT, null, 0, decode(TSL.DISP_KAT, null, 1, 3))) DISP_KAT_SOURCE,
      to_char(ts.GZ) GZ_TS,
      to_char(tsl.GZ) GZ_TSL,
      decode(TS.GZ, TSL.GZ, 2, decode(TS.GZ, null, 0, decode(TSL.GZ, null, 1, 3))) GZ_SOURCE,
      to_char(ts.DISP_RES) DISP_RES_TS,
      to_char(tsl.DISP_RES) DISP_RES_TSL,
      decode(TS.DISP_RES, TSL.DISP_RES, 2, decode(TS.DISP_RES, null, 0, decode(TSL.DISP_RES, null, 1, 3))) DISP_RES_SOURCE,

      to_char(ts.MODERN) MODERN_TS,
      to_char(tsl.MODERN) MODERN_TSL,
      decode(TS.MODERN, TSL.MODERN, 2, decode(TS.MODERN, null, 0, decode(TSL.MODERN, null, 1, 3))) MODERN_SOURCE, -- was added by Prihodko

      trim(to_char(ts.SUM_MODERN, '999999999999999.00')) SUM_MODERN_TS,
      trim(to_char(tsl.SUM_MODERN, '999999999999999.00')) SUM_MODERN_TSL,
      ts.SUM_MODERN N_SUM_MODERN_TS,
      tsl.SUM_MODERN N_SUM_MODERN_TSL,
      decode(TS.SUM_MODERN, TSL.SUM_MODERN, 2, decode(TS.SUM_MODERN, null, 0, decode(TSL.SUM_MODERN, null, 1, 3))) SUM_MODERN_SOURCE,


      to_char(ts.Z$FL_POLY) Z$FL_POLY_TS,
      '' Z$FL_POLY_TSL,
      1 Z$FL_POLY_SOURCE,
      to_char(ts.FK_ID) FK_ID_TS,
      to_char(tsl.FK_ID) FK_ID_TSL,
      decode(nvl(tsl.ID_ILL, d.ID_ILL), null, 1, decode(ts.ID_ILL, nvl(tsl.ID_ILL, d.ID_ILL), 2, 0))FK_ID_SOURCE,
      decode(nvl(tsl.ID_ILL, d.ID_ILL), null, 1, decode(ts.ID_ILL, nvl(tsl.ID_ILL, d.ID_ILL), 2, 0)) FN_SOURCE,

      ts.fk_groupsluchid,

      decode(ts.Date_b_Day, null,
             trunc(months_between(tsl.Date_e, nvl(tsl.DATE_B_DAY, dp.fd_rojd)) / 12),
             trunc(months_between(ts.Date_e, ts.Date_b_Day) / 12)) fn_AgeInYears,

      ts.SMO,

      ts.date_e D_DATE_E_TS,
      tsl.Date_e D_DATE_E_TSL,

      d.SMK_ID_P,
      d.TOTAL_SMO,
      d.SANK_KOD,
      d.UDR_MEK,
      d.UDR_MEE,
      d.UDR_EKMP,
      d.SHTR_MEK,
      d.SHTR_MEE,
      d.SHTR_EKMP,
      d.MSG_DEF,

      ts.own n_own_ts

    from asu.tsluch_dbf ts
    full join asu.tsluch_dbf_load tsl on
         tsl.ID_ILL = ts.id_ill and nvl(tsl.p_id_ill, -1) = nvl(ts.p_id_ill, -1) and tsl.year = ts.year and tsl.month = ts.month and tsl.lpu_id = ts.lpu_id
    full join asu.trsd_dbf d
      on d.id_ill = nvl(ts.id_ill, tsl.id_ill)
--     and nvl(d.p_id_ill, 0) = nvl2(ts.p_id_ill, tsl.p_id_ill, 0) -- В RSD поле p_id_ill не остаётся не заполненным, как в RSA, вместо пустого значения используется 0. Efimov V.A. 20121128 Убрал проверку на p_id_ill, так как в результатах экспертизы p_id_illимеет не нудувое значение, не ясно почему.
     and d.year = nvl(ts.year, tsl.year)
     and d.month = nvl(ts.month, tsl.month)
     and d.lpu_id = nvl(ts.lpu_id, tsl.lpu_id)
    left join asu.tpeoples dp on dp.fk_id = d.person_idl
   where nvl(ts.fk_groupsluchid, 0) = 0
  -- where nvl(ts.fn_rownum, tsl.fn_rownum) between pBeginRownum and pEndRownum and nvl(ts.fk_groupsluchid, 0) = 0
  ) t
  left join (select tu.fk_sluchid, sum(tu.kol_eo * tu.cost_moder) N_SUM_MODERN_SBJ, sum(tu.kol_eo * tu.cost_moder_f) N_SUM_MODERN_FED,
                    count(tu.fk_id) fn_uslcount, count(tuc.fk_id) fn_nocomparecount, sum(tu.kol_eo) kol_eosum,
                    sum(decode(tu.KOD_MU, 9, 0, tu.kol_mu)) kol_musum -- суммируются только tu.kol_mu из перемещений, из операций не суммируются, в результате получается кол-во койкодней
               from asu.tusl_dbf tu
               left join asu.tuslnocompare tuc on tu.fk_id = tuc.fk_uslid
              group by tu.fk_sluchid) tu on tu.fk_sluchid = t.FK_ID_ts
  left join (select tul.fk_sluchid, sum(tul.kol_eo) kol_eosum,
                    sum(decode(tul.KOD_MU, 9, 0, tul.kol_mu)) kol_musum
               from asu.tusl_dbf_load tul
              group by tul.fk_sluchid) tul on tul.fk_sluchid = t.FK_ID_TSL

  left join asu.tambtalon ta on ta.fk_id = nvl(t.ID_ILL_TS, t.ID_ILL_TSL)
  left join asu.tperesel tp on tp.fk_id = nvl(t.ID_ILL_TS, t.ID_ILL_TSL)
  left join ASU.TPAC_INSURANCE PI on PI.FK_PACID = tp.fk_pacid
  left join ASU.TINSURDOCS I on I.FK_ID = ta.fk_insuranceid or I.FK_ID = PI.FK_INSURDOCID
  left join asu.TCOMPANY Cm on Cm.FK_ID = I.FK_COMPANYID
  left join (select te.fc_value, tow.fn_code
              from exch43.ttables tt
             inner join exch43.texchange_their te on te.fk_table = tt.fk_id
             inner join exch43.texchange_own tow on tow.fk_their = te.fk_id
             where tt.fk_company = asu.GET_HOMS_COMPANYID
               and tt.fc_name = 'SMO'
             group by te.fn_code, te.fc_value, tow.fn_code) tsmo on tsmo.fn_code = Cm.FK_ID
  -- Врач и отделение выписки, добалвены в связи с задачей https://srvotrs2.loc/redmine/issues/25088
  left join (select s.fk_sluchid, s.fk_sotrid, p.fk_palataid_vyp
               from (select tu.fk_sluchid, max(tu.fk_sotrid) fk_sotrid
                       from (select n.fk_sluchid,
                                    LAST_VALUE(nvl(vr.fk_sotrid, n.fk_sotrid)) OVER(PARTITION BY n.fk_sluchid ORDER BY n.date_e_u ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) fk_sotrid
                               from (SELECT tu.fk_id,
                                            nvl(decode(n.fk_ispolid, 0, null, n.fk_ispolid), n.fk_vrachid) fk_sotrid,
                                            decode(db_name.fc_name,
                                                   'SK', nvl((select max(trl.fd_ins)
                                                                from asu.tnazlech tnl
                                                                left join asu.treslech trl on trl.fk_nazid = tnl.fk_id
                                                               where tnl.fk_id = n.fk_id), n.fd_run),
                                                         n.fd_run) date_e_u,
                                            tu.fk_sluchid
                                       FROM ASU.TUSL_DBF tu
                                      inner JOIN asu.vnaz n ON n.fk_id = tu.id_ill_u
                                      INNER JOIN asu.TSMID_KONS_SPEC ts ON ts.fk_id = n.fk_smid
                                      INNER join (select 1 fk_id, ASU.PKG_SMINI.READSTRING('CONFIG', 'DB_NAME', 'H') fc_name from dual) db_name on db_name.fk_id = 1
                                      where tu.type_usl in (2, 5, 6, 7)) n
                               left join (select tu.fk_id, max(tu.fk_sotrid) fk_sotrid
                                           from (SELECT tu.fk_id,
                                                        LAST_VALUE(vr.fk_vrachid) OVER(PARTITION BY vr.fk_nazid ORDER BY vr.fk_id ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) fk_sotrid
                                                   FROM ASU.TUSL_DBF tu
                                                  inner JOIN asu.TRESLECH vr ON vr.fk_nazid = tu.id_ill_u
                                                  where tu.type_usl in (2, 5, 6, 7)
                                                    and vr.fk_vrachid > 0) tu
                                          group by tu.fk_id) vr on vr.fk_id = n.fk_id) tu
                      group by tu.fk_sluchid) s
               full join (select tu.fk_sluchid, max(tu.fk_palataid_vyp) fk_palataid_vyp
                            from (select tu.fk_sluchid,
                                         LAST_VALUE(tpk.fk_palataid) OVER(PARTITION BY tpk.fk_pacid ORDER BY tpk.fd_data2, tpk.fk_id ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) fk_palataid_vyp
                                    from (SELECT tu.id_ill, tu.fk_sluchid, max(tu.id_ill_u)
                                            FROM ASU.TUSL_DBF tu
                                           where tu.type_usl in (1, 3)
                                           group by tu.id_ill, tu.fk_sluchid) tu
                                   inner JOIN ASU.TPERESEL TP ON TP.FK_ID = TU.ID_ILL
                                   inner JOIN ASU.TPERESEL tpk ON tpk.fk_pacid = tp.Fk_Pacid) tu
                           group by tu.fk_sluchid) p on p.fk_sluchid = s.fk_sluchid) tu_od on tu_od.fk_sluchid = t.FK_ID_ts
  left join login.tsotr tsr_od on tsr_od.fk_id = tu_od.fk_sotrid
  left join login.tsotr tsc_od on tsc_od.fk_id = ta.fk_sotrclosed
  left join asu.troom trv_od on trv_od.fk_id = tu_od.fk_palataid_vyp
  left join login.totdel tosc_od on tosc_od.fk_id = nvl(trv_od.fk_otdelid, tsc_od.fk_otdelid);




  insert into asu.tusl_dbf_grid
  select
      decode(t.OWN_SOURCE, 0, t.OWN_TSL, 3, t.OWN_TS || ' | ' || t.OWN_TSL, t.OWN_TS) OWN,
      decode(t.TYPE_FIN_SOURCE, 0, t.TYPE_FIN_TSL, 3, t.TYPE_FIN_TS || ' | ' || t.TYPE_FIN_TSL, t.TYPE_FIN_TS) TYPE_FIN,
      decode(t.GLOBAL_ID_SOURCE, 0, t.GLOBAL_ID_TSL, 3, t.GLOBAL_ID_TS || ' | ' || t.GLOBAL_ID_TSL, t.GLOBAL_ID_TS) GLOBAL_ID,
      decode(t.YEAR_SOURCE, 0, t.YEAR_TSL, 3, t.YEAR_TS || ' | ' || t.YEAR_TSL, t.YEAR_TS) YEAR,
      decode(t.MONTH_SOURCE, 0, t.MONTH_TSL, 3, t.MONTH_TS || ' | ' || t.MONTH_TSL, t.MONTH_TS) MONTH,
      decode(t.LPU_ID_SOURCE, 0, t.LPU_ID_TSL, 3, t.LPU_ID_TS || ' | ' || t.LPU_ID_TSL, t.LPU_ID_TS) LPU_ID,
      decode(t.LPU_NAPR_SOURCE, 0, t.LPU_NAPR_TSL, 3, t.LPU_NAPR_TS || ' | ' || t.LPU_NAPR_TSL, t.LPU_NAPR_TS) LPU_NAPR,
      decode(t.TFOMS_ID_SOURCE, 0, t.TFOMS_ID_TSL, 3, t.TFOMS_ID_TS || ' | ' || t.TFOMS_ID_TSL, t.TFOMS_ID_TS) TFOMS_ID,
      decode(t.PERSON_IDL_SOURCE, 0, t.PERSON_IDL_TSL, 3, t.PERSON_IDL_TS || ' | ' || t.PERSON_IDL_TSL, t.PERSON_IDL_TS) PERSON_IDL,
      nvl(t.ID_ILL_TS, t.ID_ILL_TSL) ID_ILL,
      nvl(t.ID_ILL_U_TS, t.ID_ILL_U_TSL) ID_ILL_U,
      decode(t.POLICYSER_SOURCE, 0, t.POLICYSER_TSL, 3, t.POLICYSER_TS || ' | ' || t.POLICYSER_TSL, t.POLICYSER_TS) POLICYSER,
      decode(t.POLICYNUM_SOURCE, 0, t.POLICYNUM_TSL, 3, t.POLICYNUM_TS || ' | ' || t.POLICYNUM_TSL, t.POLICYNUM_TS) POLICYNUM,
      decode(t.TYPE_USL_SOURCE, 0, t.TYPE_USL_TSL, 3, t.TYPE_USL_TS || ' | ' || t.TYPE_USL_TSL, t.TYPE_USL_TS) TYPE_USL,
      decode(t.DATE_B_U_SOURCE, 0, t.DATE_B_U_TSL, 3, t.DATE_B_U_TS || ' | ' || t.DATE_B_U_TSL, t.DATE_B_U_TS) DATE_B_U,
      decode(t.DATE_E_U_SOURCE, 0, t.DATE_E_U_TSL, 3, t.DATE_E_U_TS || ' | ' || t.DATE_E_U_TSL, t.DATE_E_U_TS) DATE_E_U,
      nvl(t.D_DATE_E_U_TS, t.D_DATE_E_U_TSL) D_DATE_E_U,
      decode(t.V_MU_SOURCE, 0, t.V_MU_TSL, 3, t.V_MU_TS || ' | ' || t.V_MU_TSL, t.V_MU_TS) V_MU,
      decode(t.PR_MP_SOURCE, 0, t.PR_MP_TSL, 3, t.PR_MP_TS || ' | ' || t.PR_MP_TSL, t.PR_MP_TS) PR_MP,
      decode(t.KOD_MU_SOURCE, 0, t.KOD_MU_TSL, 3, t.KOD_MU_TS || ' | ' || t.KOD_MU_TSL, t.KOD_MU_TS) KOD_MU,
      decode(t.KOL_MU_SOURCE, 0, t.KOL_MU_TSL, 3, t.KOL_MU_TS || ' | ' || t.KOL_MU_TSL, t.KOL_MU_TS) KOL_MU,
      decode(t.TYPE_EO_SOURCE, 0, t.TYPE_EO_TSL, 3, t.TYPE_EO_TS || ' | ' || t.TYPE_EO_TSL, t.TYPE_EO_TS) TYPE_EO,
      decode(t.KOD_EO_SOURCE, 0, t.KOD_EO_TSL, 3, t.KOD_EO_TS || ' | ' || t.KOD_EO_TSL, t.KOD_EO_TS) KOD_EO,
      decode(t.KOL_EO_SOURCE, 0, t.KOL_EO_TSL, 3, t.KOL_EO_TS || ' | ' || t.KOL_EO_TSL, t.KOL_EO_TS) KOL_EO,
      decode(t.COST_EO_SOURCE, 0, t.COST_EO_TSL, 3, t.COST_EO_TS || ' | ' || t.COST_EO_TSL, t.COST_EO_TS) COST_EO,
      decode(t.SUM_EO_SOURCE, 0, t.SUM_EO_TSL, 3, t.SUM_EO_TS || ' | ' || t.SUM_EO_TSL, t.SUM_EO_TS) SUM_EO,
      decode(t.N_QU_SOURCE, 0, t.N_QU_TSL, 3, t.N_QU_TS || ' | ' || t.N_QU_TSL, t.N_QU_TS) N_QU,
      decode(t.N_TOOTH_SOURCE, 0, t.N_TOOTH_TSL, 3, t.N_TOOTH_TS || ' | ' || t.N_TOOTH_TSL, t.N_TOOTH_TS) N_TOOTH,
      decode(t.P_TOOTH_SOURCE, 0, t.P_TOOTH_TSL, 3, t.P_TOOTH_TS || ' | ' || t.P_TOOTH_TSL, t.P_TOOTH_TS) P_TOOTH,
      decode(t.N_QU2_SOURCE, 0, t.N_QU2_TSL, 3, t.N_QU2_TS || ' | ' || t.N_QU2_TSL, t.N_QU2_TS) N_QU2,
      decode(t.N_TOOTH2_SOURCE, 0, t.N_TOOTH2_TSL, 3, t.N_TOOTH2_TS || ' | ' || t.N_TOOTH2_TSL, t.N_TOOTH2_TS) N_TOOTH2,
      decode(t.P_TOOTH2_SOURCE, 0, t.P_TOOTH2_TSL, 3, t.P_TOOTH2_TS || ' | ' || t.P_TOOTH2_TSL, t.P_TOOTH2_TS) P_TOOTH2,
      decode(t.N_QU3_SOURCE, 0, t.N_QU3_TSL, 3, t.N_QU3_TS || ' | ' || t.N_QU3_TSL, t.N_QU3_TS) N_QU3,
      decode(t.N_TOOTH3_SOURCE, 0, t.N_TOOTH3_TSL, 3, t.N_TOOTH3_TS || ' | ' || t.N_TOOTH3_TSL, t.N_TOOTH3_TS) N_TOOTH3,
      decode(t.P_TOOTH3_SOURCE, 0, t.P_TOOTH3_TSL, 3, t.P_TOOTH3_TS || ' | ' || t.P_TOOTH3_TSL, t.P_TOOTH3_TS) P_TOOTH3,
      decode(t.N_QU4_SOURCE, 0, t.N_QU4_TSL, 3, t.N_QU4_TS || ' | ' || t.N_QU4_TSL, t.N_QU4_TS) N_QU4,
      decode(t.N_TOOTH4_SOURCE, 0, t.N_TOOTH4_TSL, 3, t.N_TOOTH4_TS || ' | ' || t.N_TOOTH4_TSL, t.N_TOOTH4_TS) N_TOOTH4,
      decode(t.P_TOOTH4_SOURCE, 0, t.P_TOOTH4_TSL, 3, t.P_TOOTH4_TS || ' | ' || t.P_TOOTH4_TSL, t.P_TOOTH4_TS) P_TOOTH4,
      decode(t.N_QU5_SOURCE, 0, t.N_QU5_TSL, 3, t.N_QU5_TS || ' | ' || t.N_QU5_TSL, t.N_QU5_TS) N_QU5,
      decode(t.N_TOOTH5_SOURCE, 0, t.N_TOOTH5_TSL, 3, t.N_TOOTH5_TS || ' | ' || t.N_TOOTH5_TSL, t.N_TOOTH5_TS) N_TOOTH5,
      decode(t.P_TOOTH5_SOURCE, 0, t.P_TOOTH5_TSL, 3, t.P_TOOTH5_TS || ' | ' || t.P_TOOTH5_TSL, t.P_TOOTH5_TS) P_TOOTH5,
      decode(t.N_QU6_SOURCE, 0, t.N_QU6_TSL, 3, t.N_QU6_TS || ' | ' || t.N_QU6_TSL, t.N_QU6_TS) N_QU6,
      decode(t.N_TOOTH6_SOURCE, 0, t.N_TOOTH6_TSL, 3, t.N_TOOTH6_TS || ' | ' || t.N_TOOTH6_TSL, t.N_TOOTH6_TS) N_TOOTH6,
      decode(t.P_TOOTH6_SOURCE, 0, t.P_TOOTH6_TSL, 3, t.P_TOOTH6_TS || ' | ' || t.P_TOOTH6_TSL, t.P_TOOTH6_TS) P_TOOTH6,
      decode(t.N_QU7_SOURCE, 0, t.N_QU7_TSL, 3, t.N_QU7_TS || ' | ' || t.N_QU7_TSL, t.N_QU7_TS) N_QU7,
      decode(t.N_TOOTH7_SOURCE, 0, t.N_TOOTH7_TSL, 3, t.N_TOOTH7_TS || ' | ' || t.N_TOOTH7_TSL, t.N_TOOTH7_TS) N_TOOTH7,
      decode(t.P_TOOTH7_SOURCE, 0, t.P_TOOTH7_TSL, 3, t.P_TOOTH7_TS || ' | ' || t.P_TOOTH7_TSL, t.P_TOOTH7_TS) P_TOOTH7,
      decode(t.N_QU8_SOURCE, 0, t.N_QU8_TSL, 3, t.N_QU8_TS || ' | ' || t.N_QU8_TSL, t.N_QU8_TS) N_QU8,
      decode(t.N_TOOTH8_SOURCE, 0, t.N_TOOTH8_TSL, 3, t.N_TOOTH8_TS || ' | ' || t.N_TOOTH8_TSL, t.N_TOOTH8_TS) N_TOOTH8,
      decode(t.P_TOOTH8_SOURCE, 0, t.P_TOOTH8_TSL, 3, t.P_TOOTH8_TS || ' | ' || t.P_TOOTH8_TSL, t.P_TOOTH8_TS) P_TOOTH8,
      decode(t.DOC_CD_U_SOURCE, 0, t.DOC_CD_U_TSL, 3, t.DOC_CD_U_TS || ' | ' || t.DOC_CD_U_TSL, t.DOC_CD_U_TS) DOC_CD_U,
      decode(t.PRVSM_U_SOURCE, 0, t.PRVSM_U_TSL, 3, t.PRVSM_U_TS || ' | ' || t.PRVSM_U_TSL, t.PRVSM_U_TS) PRVSM_U,
      nvl(t.P_ID_ILL_TS, t.P_ID_ILL_TSL) P_ID_ILL,
      decode(t.LPU_INTR_SOURCE, 0, t.LPU_INTR_TSL, 3, t.LPU_INTR_TS || ' | ' || t.LPU_INTR_TSL, t.LPU_INTR_TS) LPU_INTR,

      decode(t.MODERN_CODE_SOURCE, 0, t.MODERN_CODE_TSL, 3, t.MODERN_CODE_TS || ' | ' || t.MODERN_CODE_TSL, t.MODERN_CODE_TS) MODERN_CODE,
      decode(t.SBJ_MODERN_SOURCE, 0, t.SBJ_MODERN_TSL, 3, t.SBJ_MODERN_TS || ' | ' || t.SBJ_MODERN_TSL, t.SBJ_MODERN_TS) SBJ_MODERN,
      decode(t.FED_MODERN_SOURCE, 0, t.FED_MODERN_TSL, 3, t.FED_MODERN_TS || ' | ' || t.FED_MODERN_TSL, t.FED_MODERN_TS) FED_MODERN,
      decode(t.HOMS_MODERN_SOURCE, 0, t.HOMS_MODERN_TSL, 3, t.HOMS_MODERN_TS || ' | ' || t.HOMS_MODERN_TSL, t.HOMS_MODERN_TS) HOMS_MODERN,
      decode(t.SUM_MODERN_SOURCE, 0, t.SUM_MODERN_TSL, 3, t.SUM_MODERN_TS || ' | ' || t.SUM_MODERN_TSL, t.SUM_MODERN_TS) SUM_MODERN,

      decode(t.pol_SOURCE, 0, t.pol_TSL, 3, t.pol_TS || ' | ' || t.pol_TSL, t.pol_TS) pol,

      decode(t.Z$NAZ_ID_SOURCE, 0, t.Z$NAZ_ID_TSL, 3, t.Z$NAZ_ID_TS || ' | ' || t.Z$NAZ_ID_TSL, t.Z$NAZ_ID_TS) Z$NAZ_ID,
    --  decode(t.VO_SOURCE, 0, t.VO_TSL, 3, t.VO_TS || ' | ' || t.VO_TSL, t.VO_TS) VO,
      decode(t.Z$FL_POLY_SOURCE, 0, t.Z$FL_POLY_TSL, 3, t.Z$FL_POLY_TS || ' | ' || t.Z$FL_POLY_TSL, t.Z$FL_POLY_TS) Z$FL_POLY,


      t.OWN_SOURCE,
      t.TYPE_FIN_SOURCE,
      t.GLOBAL_ID_SOURCE,
      t.YEAR_SOURCE,
      t.MONTH_SOURCE,
      t.LPU_ID_SOURCE,
      t.LPU_NAPR_SOURCE,
      t.TFOMS_ID_SOURCE,
      t.PERSON_IDL_SOURCE,
      t.POLICYSER_SOURCE,
      t.POLICYNUM_SOURCE,
      t.TYPE_USL_SOURCE,
      t.DATE_B_U_SOURCE,
      t.DATE_E_U_SOURCE,
      t.V_MU_SOURCE,
      t.PR_MP_SOURCE,
      t.KOD_MU_SOURCE,
      t.KOL_MU_SOURCE,
      t.TYPE_EO_SOURCE,
      t.KOD_EO_SOURCE,
      t.KOL_EO_SOURCE,
      t.COST_EO_SOURCE,
      t.SUM_EO_SOURCE,
      t.N_QU_SOURCE,
      t.N_TOOTH_SOURCE,
      t.P_TOOTH_SOURCE,
      t.N_QU2_SOURCE,
      t.N_TOOTH2_SOURCE,
      t.P_TOOTH2_SOURCE,
      t.N_QU3_SOURCE,
      t.N_TOOTH3_SOURCE,
      t.P_TOOTH3_SOURCE,
      t.N_QU4_SOURCE,
      t.N_TOOTH4_SOURCE,
      t.P_TOOTH4_SOURCE,
      t.N_QU5_SOURCE,
      t.N_TOOTH5_SOURCE,
      t.P_TOOTH5_SOURCE,
      t.N_QU6_SOURCE,
      t.N_TOOTH6_SOURCE,
      t.P_TOOTH6_SOURCE,
      t.N_QU7_SOURCE,
      t.N_TOOTH7_SOURCE,
      t.P_TOOTH7_SOURCE,
      t.N_QU8_SOURCE,
      t.N_TOOTH8_SOURCE,
      t.P_TOOTH8_SOURCE,
      t.DOC_CD_U_SOURCE,
      t.PRVSM_U_SOURCE,
      t.LPU_INTR_SOURCE,

      t.MODERN_CODE_SOURCE,
      t.SBJ_MODERN_SOURCE,
      t.FED_MODERN_SOURCE,
      t.HOMS_MODERN_SOURCE,
      t.SUM_MODERN_SOURCE,
      t.pol_SOURCE,

      t.Z$NAZ_ID_SOURCE,
    --  t.VO_SOURCE,
      t.Z$FL_POLY_SOURCE,


      decode(t.FN_SOURCE, 0, 77, 2,

        decode(t.OWN_SOURCE, 0, 1, 0) +
        decode(t.TYPE_FIN_SOURCE, 0, 1, 0) +
        decode(t.GLOBAL_ID_SOURCE, 0, 1, 0) +
        decode(t.YEAR_SOURCE, 0, 1, 0) +
        decode(t.MONTH_SOURCE, 0, 1, 0) +
        decode(t.LPU_ID_SOURCE, 0, 1, 0) +
        decode(t.LPU_NAPR_SOURCE, 0, 1, 0) +
        decode(t.TFOMS_ID_SOURCE, 0, 1, 0) +
        decode(t.PERSON_IDL_SOURCE, 0, 1, 0) +
        decode(t.POLICYSER_SOURCE, 0, 1, 0) +
        decode(t.POLICYNUM_SOURCE, 0, 1, 0) +
        decode(t.TYPE_USL_SOURCE, 0, 1, 0) +
        decode(t.DATE_B_U_SOURCE, 0, 1, 0) +
        decode(t.DATE_E_U_SOURCE, 0, 1, 0) +
        decode(t.V_MU_SOURCE, 0, 1, 0) +
        decode(t.PR_MP_SOURCE, 0, 1, 0) +
        decode(t.KOD_MU_SOURCE, 0, 1, 0) +
        decode(t.KOL_MU_SOURCE, 0, 1, 0) +
        decode(t.TYPE_EO_SOURCE, 0, 1, 0) +
        decode(t.KOD_EO_SOURCE, 0, 1, 0) +
        decode(t.KOL_EO_SOURCE, 0, 1, 0) +
        decode(t.COST_EO_SOURCE, 0, 1, 0) +
        decode(t.SUM_EO_SOURCE, 0, 1, 0) +
        decode(t.N_QU_SOURCE, 0, 1, 0) +
        decode(t.N_TOOTH_SOURCE, 0, 1, 0) +
        decode(t.P_TOOTH_SOURCE, 0, 1, 0) +
        decode(t.N_QU2_SOURCE, 0, 1, 0) +
        decode(t.N_TOOTH2_SOURCE, 0, 1, 0) +
        decode(t.P_TOOTH2_SOURCE, 0, 1, 0) +
        decode(t.N_QU3_SOURCE, 0, 1, 0) +
        decode(t.N_TOOTH3_SOURCE, 0, 1, 0) +
        decode(t.P_TOOTH3_SOURCE, 0, 1, 0) +
        decode(t.N_QU4_SOURCE, 0, 1, 0) +
        decode(t.N_TOOTH4_SOURCE, 0, 1, 0) +
        decode(t.P_TOOTH4_SOURCE, 0, 1, 0) +
        decode(t.N_QU5_SOURCE, 0, 1, 0) +
        decode(t.N_TOOTH5_SOURCE, 0, 1, 0) +
        decode(t.P_TOOTH5_SOURCE, 0, 1, 0) +
        decode(t.N_QU6_SOURCE, 0, 1, 0) +
        decode(t.N_TOOTH6_SOURCE, 0, 1, 0) +
        decode(t.P_TOOTH6_SOURCE, 0, 1, 0) +
        decode(t.N_QU7_SOURCE, 0, 1, 0) +
        decode(t.N_TOOTH7_SOURCE, 0, 1, 0) +
        decode(t.P_TOOTH7_SOURCE, 0, 1, 0) +
        decode(t.N_QU8_SOURCE, 0, 1, 0) +
        decode(t.N_TOOTH8_SOURCE, 0, 1, 0) +
        decode(t.P_TOOTH8_SOURCE, 0, 1, 0) +
        decode(t.DOC_CD_U_SOURCE, 0, 1, 0) +
        decode(t.PRVSM_U_SOURCE, 0, 1, 0) +
        decode(t.LPU_INTR_SOURCE, 0, 1, 0) +
        decode(t.MODERN_CODE_SOURCE, 0, 1, 0) +
        decode(t.SBJ_MODERN_SOURCE, 0, 1, 0) +
        decode(t.FED_MODERN_SOURCE, 0, 1, 0) +
        decode(t.HOMS_MODERN_SOURCE, 0, 1, 0) +
        decode(t.SUM_MODERN_SOURCE, 0, 1, 0) +
        decode(t.pol_SOURCE, 0, 1, 0),

    --    decode(t.VO_SOURCE, 0, 1, 0),


        0

      )FN_IS_LOAD,

      decode(t.FN_SOURCE, 1, 77, 2,

        decode(t.OWN_SOURCE, 1, 1, 0) +
        decode(t.TYPE_FIN_SOURCE, 1, 1, 0) +
        decode(t.GLOBAL_ID_SOURCE, 1, 1, 0) +
        decode(t.YEAR_SOURCE, 1, 1, 0) +
        decode(t.MONTH_SOURCE, 1, 1, 0) +
        decode(t.LPU_ID_SOURCE, 1, 1, 0) +
        decode(t.LPU_NAPR_SOURCE, 1, 1, 0) +
        decode(t.TFOMS_ID_SOURCE, 1, 1, 0) +
        decode(t.PERSON_IDL_SOURCE, 1, 1, 0) +
        decode(t.POLICYSER_SOURCE, 1, 1, 0) +
        decode(t.POLICYNUM_SOURCE, 1, 1, 0) +
        decode(t.TYPE_USL_SOURCE, 1, 1, 0) +
        decode(t.DATE_B_U_SOURCE, 1, 1, 0) +
        decode(t.DATE_E_U_SOURCE, 1, 1, 0) +
        decode(t.V_MU_SOURCE, 1, 1, 0) +
        decode(t.PR_MP_SOURCE, 1, 1, 0) +
        decode(t.KOD_MU_SOURCE, 1, 1, 0) +
        decode(t.KOL_MU_SOURCE, 1, 1, 0) +
        decode(t.TYPE_EO_SOURCE, 1, 1, 0) +
        decode(t.KOD_EO_SOURCE, 1, 1, 0) +
        decode(t.KOL_EO_SOURCE, 1, 1, 0) +
        decode(t.COST_EO_SOURCE, 1, 1, 0) +
        decode(t.SUM_EO_SOURCE, 1, 1, 0) +
        decode(t.N_QU_SOURCE, 1, 1, 0) +
        decode(t.N_TOOTH_SOURCE, 1, 1, 0) +
        decode(t.P_TOOTH_SOURCE, 1, 1, 0) +
        decode(t.N_QU2_SOURCE, 1, 1, 0) +
        decode(t.N_TOOTH2_SOURCE, 1, 1, 0) +
        decode(t.P_TOOTH2_SOURCE, 1, 1, 0) +
        decode(t.N_QU3_SOURCE, 1, 1, 0) +
        decode(t.N_TOOTH3_SOURCE, 1, 1, 0) +
        decode(t.P_TOOTH3_SOURCE, 1, 1, 0) +
        decode(t.N_QU4_SOURCE, 1, 1, 0) +
        decode(t.N_TOOTH4_SOURCE, 1, 1, 0) +
        decode(t.P_TOOTH4_SOURCE, 1, 1, 0) +
        decode(t.N_QU5_SOURCE, 1, 1, 0) +
        decode(t.N_TOOTH5_SOURCE, 1, 1, 0) +
        decode(t.P_TOOTH5_SOURCE, 1, 1, 0) +
        decode(t.N_QU6_SOURCE, 1, 1, 0) +
        decode(t.N_TOOTH6_SOURCE, 1, 1, 0) +
        decode(t.P_TOOTH6_SOURCE, 1, 1, 0) +
        decode(t.N_QU7_SOURCE, 1, 1, 0) +
        decode(t.N_TOOTH7_SOURCE, 1, 1, 0) +
        decode(t.P_TOOTH7_SOURCE, 1, 1, 0) +
        decode(t.N_QU8_SOURCE, 1, 1, 0) +
        decode(t.N_TOOTH8_SOURCE, 1, 1, 0) +
        decode(t.P_TOOTH8_SOURCE, 1, 1, 0) +
        decode(t.DOC_CD_U_SOURCE, 1, 1, 0) +
        decode(t.PRVSM_U_SOURCE, 1, 1, 0) +
        decode(t.LPU_INTR_SOURCE, 1, 1, 0) +
        decode(t.MODERN_CODE_SOURCE, 1, 1, 0) +
        decode(t.SBJ_MODERN_SOURCE, 1, 1, 0) +
        decode(t.FED_MODERN_SOURCE, 1, 1, 0) +
        decode(t.HOMS_MODERN_SOURCE, 1, 1, 0) +
        decode(t.SUM_MODERN_SOURCE, 1, 1, 0) +
        decode(t.pol_SOURCE, 1, 1, 0),
    --    decode(t.VO_SOURCE, 1, 1, 0),


        0

      )FN_IS_CALC,

      decode(t.FN_SOURCE, 2,

        decode(t.OWN_SOURCE, 2, 1, 0) +
        decode(t.TYPE_FIN_SOURCE, 2, 1, 0) +
        decode(t.GLOBAL_ID_SOURCE, 2, 1, 0) +
        decode(t.YEAR_SOURCE, 2, 1, 0) +
        decode(t.MONTH_SOURCE, 2, 1, 0) +
        decode(t.LPU_ID_SOURCE, 2, 1, 0) +
        decode(t.LPU_NAPR_SOURCE, 2, 1, 0) +
        decode(t.TFOMS_ID_SOURCE, 2, 1, 0) +
        decode(t.PERSON_IDL_SOURCE, 2, 1, 0) +
        decode(t.POLICYSER_SOURCE, 2, 1, 0) +
        decode(t.POLICYNUM_SOURCE, 2, 1, 0) +
        decode(t.TYPE_USL_SOURCE, 2, 1, 0) +
        decode(t.DATE_B_U_SOURCE, 2, 1, 0) +
        decode(t.DATE_E_U_SOURCE, 2, 1, 0) +
        decode(t.V_MU_SOURCE, 2, 1, 0) +
        decode(t.PR_MP_SOURCE, 2, 1, 0) +
        decode(t.KOD_MU_SOURCE, 2, 1, 0) +
        decode(t.KOL_MU_SOURCE, 2, 1, 0) +
        decode(t.TYPE_EO_SOURCE, 2, 1, 0) +
        decode(t.KOD_EO_SOURCE, 2, 1, 0) +
        decode(t.KOL_EO_SOURCE, 2, 1, 0) +
        decode(t.COST_EO_SOURCE, 2, 1, 0) +
        decode(t.SUM_EO_SOURCE, 2, 1, 0) +
        decode(t.N_QU_SOURCE, 2, 1, 0) +
        decode(t.N_TOOTH_SOURCE, 2, 1, 0) +
        decode(t.P_TOOTH_SOURCE, 2, 1, 0) +
        decode(t.N_QU2_SOURCE, 2, 1, 0) +
        decode(t.N_TOOTH2_SOURCE, 2, 1, 0) +
        decode(t.P_TOOTH2_SOURCE, 2, 1, 0) +
        decode(t.N_QU3_SOURCE, 2, 1, 0) +
        decode(t.N_TOOTH3_SOURCE, 2, 1, 0) +
        decode(t.P_TOOTH3_SOURCE, 2, 1, 0) +
        decode(t.N_QU4_SOURCE, 2, 1, 0) +
        decode(t.N_TOOTH4_SOURCE, 2, 1, 0) +
        decode(t.P_TOOTH4_SOURCE, 2, 1, 0) +
        decode(t.N_QU5_SOURCE, 2, 1, 0) +
        decode(t.N_TOOTH5_SOURCE, 2, 1, 0) +
        decode(t.P_TOOTH5_SOURCE, 2, 1, 0) +
        decode(t.N_QU6_SOURCE, 2, 1, 0) +
        decode(t.N_TOOTH6_SOURCE, 2, 1, 0) +
        decode(t.P_TOOTH6_SOURCE, 2, 1, 0) +
        decode(t.N_QU7_SOURCE, 2, 1, 0) +
        decode(t.N_TOOTH7_SOURCE, 2, 1, 0) +
        decode(t.P_TOOTH7_SOURCE, 2, 1, 0) +
        decode(t.N_QU8_SOURCE, 2, 1, 0) +
        decode(t.N_TOOTH8_SOURCE, 2, 1, 0) +
        decode(t.P_TOOTH8_SOURCE, 2, 1, 0) +
        decode(t.DOC_CD_U_SOURCE, 2, 1, 0) +
        decode(t.PRVSM_U_SOURCE, 2, 1, 0) +
        decode(t.LPU_INTR_SOURCE, 2, 1, 0) +
        decode(t.MODERN_CODE_SOURCE, 2, 1, 0) +
        decode(t.SBJ_MODERN_SOURCE, 2, 1, 0) +
        decode(t.FED_MODERN_SOURCE, 2, 1, 0) +
        decode(t.HOMS_MODERN_SOURCE, 2, 1, 0) +
        decode(t.SUM_MODERN_SOURCE, 2, 1, 0) +
        decode(t.pol_SOURCE, 2, 1, 0),
    --    decode(t.VO_SOURCE, 2, 1, 0),


        0

      )FN_IS_BOTH,

      decode(t.FN_SOURCE, 3, 77, 2,

        decode(t.OWN_SOURCE, 3, 1, 0) +
        decode(t.TYPE_FIN_SOURCE, 3, 1, 0) +
        decode(t.GLOBAL_ID_SOURCE, 3, 1, 0) +
        decode(t.YEAR_SOURCE, 3, 1, 0) +
        decode(t.MONTH_SOURCE, 3, 1, 0) +
        decode(t.LPU_ID_SOURCE, 3, 1, 0) +
        decode(t.LPU_NAPR_SOURCE, 3, 1, 0) +
        decode(t.TFOMS_ID_SOURCE, 3, 1, 0) +
        decode(t.PERSON_IDL_SOURCE, 3, 1, 0) +
        decode(t.POLICYSER_SOURCE, 3, 1, 0) +
        decode(t.POLICYNUM_SOURCE, 3, 1, 0) +
        decode(t.TYPE_USL_SOURCE, 3, 1, 0) +
        decode(t.DATE_B_U_SOURCE, 3, 1, 0) +
        decode(t.DATE_E_U_SOURCE, 3, 1, 0) +
        decode(t.V_MU_SOURCE, 3, 1, 0) +
        decode(t.PR_MP_SOURCE, 3, 1, 0) +
        decode(t.KOD_MU_SOURCE, 3, 1, 0) +
        decode(t.KOL_MU_SOURCE, 3, 1, 0) +
        decode(t.TYPE_EO_SOURCE, 3, 1, 0) +
        decode(t.KOD_EO_SOURCE, 3, 1, 0) +
        decode(t.KOL_EO_SOURCE, 3, 1, 0) +
        decode(t.COST_EO_SOURCE, 3, 1, 0) +
        decode(t.SUM_EO_SOURCE, 3, 1, 0) +
        decode(t.N_QU_SOURCE, 3, 1, 0) +
        decode(t.N_TOOTH_SOURCE, 3, 1, 0) +
        decode(t.P_TOOTH_SOURCE, 3, 1, 0) +
        decode(t.N_QU2_SOURCE, 3, 1, 0) +
        decode(t.N_TOOTH2_SOURCE, 3, 1, 0) +
        decode(t.P_TOOTH2_SOURCE, 3, 1, 0) +
        decode(t.N_QU3_SOURCE, 3, 1, 0) +
        decode(t.N_TOOTH3_SOURCE, 3, 1, 0) +
        decode(t.P_TOOTH3_SOURCE, 3, 1, 0) +
        decode(t.N_QU4_SOURCE, 3, 1, 0) +
        decode(t.N_TOOTH4_SOURCE, 3, 1, 0) +
        decode(t.P_TOOTH4_SOURCE, 3, 1, 0) +
        decode(t.N_QU5_SOURCE, 3, 1, 0) +
        decode(t.N_TOOTH5_SOURCE, 3, 1, 0) +
        decode(t.P_TOOTH5_SOURCE, 3, 1, 0) +
        decode(t.N_QU6_SOURCE, 3, 1, 0) +
        decode(t.N_TOOTH6_SOURCE, 3, 1, 0) +
        decode(t.P_TOOTH6_SOURCE, 3, 1, 0) +
        decode(t.N_QU7_SOURCE, 3, 1, 0) +
        decode(t.N_TOOTH7_SOURCE, 3, 1, 0) +
        decode(t.P_TOOTH7_SOURCE, 3, 1, 0) +
        decode(t.N_QU8_SOURCE, 3, 1, 0) +
        decode(t.N_TOOTH8_SOURCE, 3, 1, 0) +
        decode(t.P_TOOTH8_SOURCE, 3, 1, 0) +
        decode(t.DOC_CD_U_SOURCE, 3, 1, 0) +
        decode(t.PRVSM_U_SOURCE, 3, 1, 0) +
        decode(t.LPU_INTR_SOURCE, 3, 1, 0) +
        decode(t.MODERN_CODE_SOURCE, 3, 1, 0) +
        decode(t.SBJ_MODERN_SOURCE, 3, 1, 0) +
        decode(t.FED_MODERN_SOURCE, 3, 1, 0) +
        decode(t.HOMS_MODERN_SOURCE, 3, 1, 0) +
        decode(t.SUM_MODERN_SOURCE, 3, 1, 0),
    --    decode(t.VO_SOURCE, 3, 1, 0),


        0

      )FN_IS_ERR,

      t.FN_SOURCE,

      t.FK_ID_TS,

      t.FK_ID_TSL,

      t.FK_SLUCHID_TS,

      t.FK_SLUCHID_TSL,

      t.N_KOL_EO_TS,
      t.N_KOL_EO_TSL,
      t.N_SUM_EO_TS,
      t.N_SUM_EO_TSL,

      decode(t.FK_ID_TS, null, 1, decode(tuc.fk_uslid, null, 1, 0)) fl_CompearUsl,
      nvl(ttr.fc_vid, asu.pkg_smid.get_path_showprint(tuc.fk_smid)) fc_UnCompearName,

    $IF ASU.PKG_COMPILE_CONDITIONS .bDBF_EXCH_FILL_FC_KOD_EO_NAME = false $THEN
      '' FC_KOD_EO_NAME, -- поле временно не заполняется, пока не удасться оптимизировать получение названия услуги
    $ELSE
      decode(ts.fc_name, null, th.fc_name, ts.fc_name) FC_KOD_EO_NAME,
    $END

      nvl(tsmo.fc_value, Cm.Fc_Short) SMO,

      t.fn_AgeInYears,

      t.sum_eo_smo,

      t.n_own_ts

      from

       (select

        to_char(ts.OWN) OWN_TS,
        to_char(tsl.OWN) OWN_TSL,
        decode(TS.OWN, TSL.OWN, 2, decode(TS.OWN, null, 0, decode(TSL.OWN, null, 1, 3))) OWN_SOURCE,
        to_char(ts.TYPE_FIN) TYPE_FIN_TS,
        to_char(tsl.TYPE_FIN) TYPE_FIN_TSL,
        decode(TS.TYPE_FIN, TSL.TYPE_FIN, 2, decode(TS.TYPE_FIN, null, 0, decode(TSL.TYPE_FIN, null, 1, 3))) TYPE_FIN_SOURCE,
        to_char(ts.GLOBAL_ID) GLOBAL_ID_TS,
        to_char(tsl.GLOBAL_ID) GLOBAL_ID_TSL,
        decode(TS.GLOBAL_ID, TSL.GLOBAL_ID, 2, decode(TS.GLOBAL_ID, null, 0, decode(TSL.GLOBAL_ID, null, 1, 3))) GLOBAL_ID_SOURCE,
        to_char(ts.YEAR) YEAR_TS,
        to_char(nvl(nvl(tsl.YEAR, d.year), ts.YEAR)) YEAR_TSL,
        decode(nvl(tsl.YEAR, d.year), null, 1, decode(ts.YEAR, nvl(tsl.YEAR, d.year), 2, 0)) YEAR_SOURCE,
        to_char(ts.MONTH) MONTH_TS,
        to_char(nvl(nvl(tsl.MONTH, d.month), ts.MONTH)) MONTH_TSL,
        decode(nvl(tsl.MONTH, d.month), null, 1, decode(ts.MONTH, nvl(tsl.MONTH, d.month), 2, 0)) MONTH_SOURCE,
        to_char(ts.LPU_ID) LPU_ID_TS,
        to_char(nvl(tsl.LPU_ID, ts.LPU_ID)) LPU_ID_TSL,
        decode(nvl(tsl.LPU_ID, ts.LPU_ID), null, 1, decode(ts.LPU_ID, nvl(tsl.LPU_ID, ts.LPU_ID), 2, 0)) LPU_ID_SOURCE,
        to_char(ts.LPU_NAPR) LPU_NAPR_TS,
        to_char(tsl.LPU_NAPR) LPU_NAPR_TSL,
        decode(TS.LPU_NAPR, TSL.LPU_NAPR, 2, decode(TS.LPU_NAPR, null, 0, decode(TSL.LPU_NAPR, null, 1, 3))) LPU_NAPR_SOURCE,
        to_char(ts.TFOMS_ID) TFOMS_ID_TS,
        to_char(tsl.TFOMS_ID) TFOMS_ID_TSL,
        decode(TS.TFOMS_ID, TSL.TFOMS_ID, 2, decode(TS.TFOMS_ID, null, 0, decode(TSL.TFOMS_ID, null, 1, 3))) TFOMS_ID_SOURCE,
        to_char(ts.PERSON_IDL) PERSON_IDL_TS,
        to_char(nvl(tsl.PERSON_IDL, d.person_idl)) PERSON_IDL_TSL,
        decode(TS.PERSON_IDL, nvl(tsl.PERSON_IDL, d.person_idl), 2, decode(TS.PERSON_IDL, null, 0, decode(nvl(tsl.PERSON_IDL, d.person_idl), null, 1, 3))) PERSON_IDL_SOURCE,
        ts.ID_ILL ID_ILL_TS,
        nvl(tsl.ID_ILL, d.ID_ILL) ID_ILL_TSL,
        ts.ID_ILL_U ID_ILL_U_TS,
        nvl(tsl.ID_ILL_U, d.ID_ILL_U) ID_ILL_U_TSL,
        to_char(ts.POLICYSER) POLICYSER_TS,
        to_char(tsl.POLICYSER) POLICYSER_TSL,
        decode(TS.POLICYSER, TSL.POLICYSER, 2, decode(TS.POLICYSER, null, 0, decode(TSL.POLICYSER, null, 1, 3))) POLICYSER_SOURCE,
        to_char(ts.POLICYNUM) POLICYNUM_TS,
        to_char(tsl.POLICYNUM) POLICYNUM_TSL,
        decode(TS.POLICYNUM, TSL.POLICYNUM, 2, decode(TS.POLICYNUM, null, 0, decode(TSL.POLICYNUM, null, 1, 3))) POLICYNUM_SOURCE,
        to_char(ts.TYPE_USL) TYPE_USL_TS,
        to_char(tsl.TYPE_USL) TYPE_USL_TSL,
        decode(TS.TYPE_USL, TSL.TYPE_USL, 2, decode(TS.TYPE_USL, null, 0, decode(TSL.TYPE_USL, null, 1, 3))) TYPE_USL_SOURCE,
        to_char(ts.DATE_B_U, 'dd.mm.yyyy') DATE_B_U_TS,
        to_char(tsl.DATE_B_U, 'dd.mm.yyyy') DATE_B_U_TSL,
        decode(TS.DATE_B_U, TSL.DATE_B_U, 2, decode(TS.DATE_B_U, null, 0, decode(TSL.DATE_B_U, null, 1, 3))) DATE_B_U_SOURCE,
        to_char(ts.DATE_E_U, 'dd.mm.yyyy') DATE_E_U_TS,
        to_char(tsl.DATE_E_U, 'dd.mm.yyyy') DATE_E_U_TSL,
        decode(TS.DATE_E_U, TSL.DATE_E_U, 2, decode(TS.DATE_E_U, null, 0, decode(TSL.DATE_E_U, null, 1, 3))) DATE_E_U_SOURCE,
        to_char(ts.V_MU) V_MU_TS,
        to_char(tsl.V_MU) V_MU_TSL,
        decode(TS.V_MU, TSL.V_MU, 2, decode(TS.V_MU, null, 0, decode(TSL.V_MU, null, 1, 3))) V_MU_SOURCE,
        to_char(ts.PR_MP) PR_MP_TS,
        to_char(tsl.PR_MP) PR_MP_TSL,
        decode(TS.PR_MP, TSL.PR_MP, 2, decode(TS.PR_MP, null, 0, decode(TSL.PR_MP, null, 1, 3))) PR_MP_SOURCE,
        to_char(ts.KOD_MU) KOD_MU_TS,
        to_char(tsl.KOD_MU) KOD_MU_TSL,
        decode(TS.KOD_MU, TSL.KOD_MU, 2, decode(TS.KOD_MU, null, 0, decode(TSL.KOD_MU, null, 1, 3))) KOD_MU_SOURCE,
        to_char(ts.KOL_MU) KOL_MU_TS,
        to_char(tsl.KOL_MU) KOL_MU_TSL,
        decode(TS.KOL_MU, TSL.KOL_MU, 2, decode(TS.KOL_MU, null, 0, decode(TSL.KOL_MU, null, 1, 3))) KOL_MU_SOURCE,
        to_char(ts.TYPE_EO) TYPE_EO_TS,
        to_char(tsl.TYPE_EO) TYPE_EO_TSL,
        decode(TS.TYPE_EO, TSL.TYPE_EO, 2, decode(TS.TYPE_EO, null, 0, decode(TSL.TYPE_EO, null, 1, 3))) TYPE_EO_SOURCE,
        to_char(ts.KOD_EO) KOD_EO_TS,
        to_char(tsl.KOD_EO) KOD_EO_TSL,
        decode(TS.KOD_EO, TSL.KOD_EO, 2, decode(TS.KOD_EO, null, 0, decode(TSL.KOD_EO, null, 1, 3))) KOD_EO_SOURCE,
        to_char(ts.KOL_EO) KOL_EO_TS,
        to_char(tsl.KOL_EO) KOL_EO_TSL,
        decode(TS.KOL_EO, TSL.KOL_EO, 2, decode(TS.KOL_EO, null, 0, decode(TSL.KOL_EO, null, 1, 3))) KOL_EO_SOURCE,
        trim(to_char(ts.COST_EO, '999999999999999.00')) COST_EO_TS,
        trim(to_char(tsl.COST_EO, '999999999999999.00')) COST_EO_TSL,
        decode(TS.COST_EO, TSL.COST_EO, 2, decode(TS.COST_EO, null, 0, decode(TSL.COST_EO, null, 1, 3))) COST_EO_SOURCE,
        trim(to_char(ts.SUM_EO, '999999999999999.00')) SUM_EO_TS,
        trim(to_char(tsl.SUM_EO, '999999999999999.00')) SUM_EO_TSL,
        decode(TS.SUM_EO, TSL.SUM_EO, 2, decode(TS.SUM_EO, null, 0, decode(TSL.SUM_EO, null, 1, 3))) SUM_EO_SOURCE,
        to_char(ts.N_QU) N_QU_TS,
        to_char(tsl.N_QU) N_QU_TSL,
        decode(TS.N_QU, TSL.N_QU, 2, decode(TS.N_QU, null, 0, decode(TSL.N_QU, null, 1, 3))) N_QU_SOURCE,
        to_char(ts.N_TOOTH) N_TOOTH_TS,
        to_char(tsl.N_TOOTH) N_TOOTH_TSL,
        decode(TS.N_TOOTH, TSL.N_TOOTH, 2, decode(TS.N_TOOTH, null, 0, decode(TSL.N_TOOTH, null, 1, 3))) N_TOOTH_SOURCE,
        to_char(ts.P_TOOTH) P_TOOTH_TS,
        to_char(tsl.P_TOOTH) P_TOOTH_TSL,
        decode(TS.P_TOOTH, TSL.P_TOOTH, 2, decode(TS.P_TOOTH, null, 0, decode(TSL.P_TOOTH, null, 1, 3))) P_TOOTH_SOURCE,
        to_char(ts.N_QU2) N_QU2_TS,
        to_char(tsl.N_QU2) N_QU2_TSL,
        decode(TS.N_QU2, TSL.N_QU2, 2, decode(TS.N_QU2, null, 0, decode(TSL.N_QU2, null, 1, 3))) N_QU2_SOURCE,
        to_char(ts.N_TOOTH2) N_TOOTH2_TS,
        to_char(tsl.N_TOOTH2) N_TOOTH2_TSL,
        decode(TS.N_TOOTH2, TSL.N_TOOTH2, 2, decode(TS.N_TOOTH2, null, 0, decode(TSL.N_TOOTH2, null, 1, 3))) N_TOOTH2_SOURCE,
        to_char(ts.P_TOOTH2) P_TOOTH2_TS,
        to_char(tsl.P_TOOTH2) P_TOOTH2_TSL,
        decode(TS.P_TOOTH2, TSL.P_TOOTH2, 2, decode(TS.P_TOOTH2, null, 0, decode(TSL.P_TOOTH2, null, 1, 3))) P_TOOTH2_SOURCE,
        to_char(ts.N_QU3) N_QU3_TS,
        to_char(tsl.N_QU3) N_QU3_TSL,
        decode(TS.N_QU3, TSL.N_QU3, 2, decode(TS.N_QU3, null, 0, decode(TSL.N_QU3, null, 1, 3))) N_QU3_SOURCE,
        to_char(ts.N_TOOTH3) N_TOOTH3_TS,
        to_char(tsl.N_TOOTH3) N_TOOTH3_TSL,
        decode(TS.N_TOOTH3, TSL.N_TOOTH3, 2, decode(TS.N_TOOTH3, null, 0, decode(TSL.N_TOOTH3, null, 1, 3))) N_TOOTH3_SOURCE,
        to_char(ts.P_TOOTH3) P_TOOTH3_TS,
        to_char(tsl.P_TOOTH3) P_TOOTH3_TSL,
        decode(TS.P_TOOTH3, TSL.P_TOOTH3, 2, decode(TS.P_TOOTH3, null, 0, decode(TSL.P_TOOTH3, null, 1, 3))) P_TOOTH3_SOURCE,
        to_char(ts.N_QU4) N_QU4_TS,
        to_char(tsl.N_QU4) N_QU4_TSL,
        decode(TS.N_QU4, TSL.N_QU4, 2, decode(TS.N_QU4, null, 0, decode(TSL.N_QU4, null, 1, 3))) N_QU4_SOURCE,
        to_char(ts.N_TOOTH4) N_TOOTH4_TS,
        to_char(tsl.N_TOOTH4) N_TOOTH4_TSL,
        decode(TS.N_TOOTH4, TSL.N_TOOTH4, 2, decode(TS.N_TOOTH4, null, 0, decode(TSL.N_TOOTH4, null, 1, 3))) N_TOOTH4_SOURCE,
        to_char(ts.P_TOOTH4) P_TOOTH4_TS,
        to_char(tsl.P_TOOTH4) P_TOOTH4_TSL,
        decode(TS.P_TOOTH4, TSL.P_TOOTH4, 2, decode(TS.P_TOOTH4, null, 0, decode(TSL.P_TOOTH4, null, 1, 3))) P_TOOTH4_SOURCE,
        to_char(ts.N_QU5) N_QU5_TS,
        to_char(tsl.N_QU5) N_QU5_TSL,
        decode(TS.N_QU5, TSL.N_QU5, 2, decode(TS.N_QU5, null, 0, decode(TSL.N_QU5, null, 1, 3))) N_QU5_SOURCE,
        to_char(ts.N_TOOTH5) N_TOOTH5_TS,
        to_char(tsl.N_TOOTH5) N_TOOTH5_TSL,
        decode(TS.N_TOOTH5, TSL.N_TOOTH5, 2, decode(TS.N_TOOTH5, null, 0, decode(TSL.N_TOOTH5, null, 1, 3))) N_TOOTH5_SOURCE,
        to_char(ts.P_TOOTH5) P_TOOTH5_TS,
        to_char(tsl.P_TOOTH5) P_TOOTH5_TSL,
        decode(TS.P_TOOTH5, TSL.P_TOOTH5, 2, decode(TS.P_TOOTH5, null, 0, decode(TSL.P_TOOTH5, null, 1, 3))) P_TOOTH5_SOURCE,
        to_char(ts.N_QU6) N_QU6_TS,
        to_char(tsl.N_QU6) N_QU6_TSL,
        decode(TS.N_QU6, TSL.N_QU6, 2, decode(TS.N_QU6, null, 0, decode(TSL.N_QU6, null, 1, 3))) N_QU6_SOURCE,
        to_char(ts.N_TOOTH6) N_TOOTH6_TS,
        to_char(tsl.N_TOOTH6) N_TOOTH6_TSL,
        decode(TS.N_TOOTH6, TSL.N_TOOTH6, 2, decode(TS.N_TOOTH6, null, 0, decode(TSL.N_TOOTH6, null, 1, 3))) N_TOOTH6_SOURCE,
        to_char(ts.P_TOOTH6) P_TOOTH6_TS,
        to_char(tsl.P_TOOTH6) P_TOOTH6_TSL,
        decode(TS.P_TOOTH6, TSL.P_TOOTH6, 2, decode(TS.P_TOOTH6, null, 0, decode(TSL.P_TOOTH6, null, 1, 3))) P_TOOTH6_SOURCE,
        to_char(ts.N_QU7) N_QU7_TS,
        to_char(tsl.N_QU7) N_QU7_TSL,
        decode(TS.N_QU7, TSL.N_QU7, 2, decode(TS.N_QU7, null, 0, decode(TSL.N_QU7, null, 1, 3))) N_QU7_SOURCE,
        to_char(ts.N_TOOTH7) N_TOOTH7_TS,
        to_char(tsl.N_TOOTH7) N_TOOTH7_TSL,
        decode(TS.N_TOOTH7, TSL.N_TOOTH7, 2, decode(TS.N_TOOTH7, null, 0, decode(TSL.N_TOOTH7, null, 1, 3))) N_TOOTH7_SOURCE,
        to_char(ts.P_TOOTH7) P_TOOTH7_TS,
        to_char(tsl.P_TOOTH7) P_TOOTH7_TSL,
        decode(TS.P_TOOTH7, TSL.P_TOOTH7, 2, decode(TS.P_TOOTH7, null, 0, decode(TSL.P_TOOTH7, null, 1, 3))) P_TOOTH7_SOURCE,
        to_char(ts.N_QU8) N_QU8_TS,
        to_char(tsl.N_QU8) N_QU8_TSL,
        decode(TS.N_QU8, TSL.N_QU8, 2, decode(TS.N_QU8, null, 0, decode(TSL.N_QU8, null, 1, 3))) N_QU8_SOURCE,
        to_char(ts.N_TOOTH8) N_TOOTH8_TS,
        to_char(tsl.N_TOOTH8) N_TOOTH8_TSL,
        decode(TS.N_TOOTH8, TSL.N_TOOTH8, 2, decode(TS.N_TOOTH8, null, 0, decode(TSL.N_TOOTH8, null, 1, 3))) N_TOOTH8_SOURCE,
        to_char(ts.P_TOOTH8) P_TOOTH8_TS,
        to_char(tsl.P_TOOTH8) P_TOOTH8_TSL,
        decode(TS.P_TOOTH8, TSL.P_TOOTH8, 2, decode(TS.P_TOOTH8, null, 0, decode(TSL.P_TOOTH8, null, 1, 3))) P_TOOTH8_SOURCE,
        to_char(ts.DOC_CD_U) DOC_CD_U_TS,
        to_char(tsl.DOC_CD_U) DOC_CD_U_TSL,
        decode(TS.DOC_CD_U, TSL.DOC_CD_U, 2, decode(TS.DOC_CD_U, null, 0, decode(TSL.DOC_CD_U, null, 1, 3))) DOC_CD_U_SOURCE,
        to_char(ts.PRVSM_U) PRVSM_U_TS,
        to_char(tsl.PRVSM_U) PRVSM_U_TSL,
        decode(TS.PRVSM_U, TSL.PRVSM_U, 2, decode(TS.PRVSM_U, null, 0, decode(TSL.PRVSM_U, null, 1, 3))) PRVSM_U_SOURCE,
        ts.P_ID_ILL P_ID_ILL_TS,
        nvl(nvl(tsl.P_ID_ILL, d.P_ID_ILL), ts.P_ID_ILL) P_ID_ILL_TSL,
        to_char(ts.LPU_INTR) LPU_INTR_TS,
        to_char(tsl.LPU_INTR) LPU_INTR_TSL,
        decode(TS.LPU_INTR, TSL.LPU_INTR, 2, decode(TS.LPU_INTR, null, 0, decode(TSL.LPU_INTR, null, 1, 3))) LPU_INTR_SOURCE,

        '' MODERN_CODE_TS,
        '' MODERN_CODE_TSL,
        0 MODERN_CODE_SOURCE,
        '' SBJ_MODERN_TS,
        '' SBJ_MODERN_TSL,
        0 SBJ_MODERN_SOURCE,
        '' FED_MODERN_TS,
        '' FED_MODERN_TSL,
        0 FED_MODERN_SOURCE,

        '' HOMS_MODERN_TS,
        '' HOMS_MODERN_TSL,
        0 HOMS_MODERN_SOURCE,

        '' SUM_MODERN_TS,
        '' SUM_MODERN_TSL,
        0 SUM_MODERN_SOURCE,

        to_char(ts.Z$NAZ_ID) Z$NAZ_ID_TS,
        '' Z$NAZ_ID_TSL,
        1 Z$NAZ_ID_SOURCE,
    --    to_char(ts.VO) VO_TS,
    --    to_char(tsl.VO) VO_TSL,
    --    decode(TS.VO, TSL.VO, 2, decode(TS.VO, null, 0, decode(TSL.VO, null, 1, 3))) VO_SOURCE,
        to_char(ts.Z$FL_POLY) Z$FL_POLY_TS,
        '' Z$FL_POLY_TSL,
        1 Z$FL_POLY_SOURCE,
        to_char(ts.FK_ID) FK_ID_TS,
        to_char(tsl.FK_ID) FK_ID_TSL,
        decode(nvl(tsl.ID_ILL, d.ID_ILL), null, 1, decode(ts.ID_ILL, nvl(tsl.ID_ILL, d.ID_ILL), 2, 0))FK_ID_SOURCE,
        to_char(ts.FK_SLUCHID) FK_SLUCHID_TS,
        to_char(tsl.FK_SLUCHID) FK_SLUCHID_TSL,
        decode(nvl(tsl.ID_ILL, d.ID_ILL), null, 1, decode(ts.ID_ILL, nvl(tsl.ID_ILL, d.ID_ILL), 2, 0))FK_SLUCHID_SOURCE,

        ts.KOL_EO N_KOL_EO_TS,
        tsl.KOL_EO N_KOL_EO_TSL,
        ts.SUM_EO N_SUM_EO_TS,
        tsl.SUM_EO N_SUM_EO_TSL,

        ts.Date_e_u d_Date_e_u_ts,
        tsl.Date_e_u d_Date_e_u_TSL,

        decode(nvl(tsl.ID_ILL, d.ID_ILL), null, 1, decode(ts.ID_ILL, nvl(tsl.ID_ILL, d.ID_ILL), 2, 0)) FN_SOURCE,

        decode(sluch.Date_b_Day, null, trunc(months_between(sluch_l.Date_e, sluch_l.Date_b_Day) / 12), trunc(months_between(sluch.Date_e, sluch.Date_b_Day) / 12)) fn_AgeInYears,

        sluch.pol pol_ts,
        sluch_l.pol pol_tsl,
        decode(sluch.pol, sluch_l.pol, 2, decode(sluch.pol, null, 0, decode(sluch_l.pol, null, 1, 3))) POL_SOURCE,

  --      decode(EXCH_DBF_SHOW_USL_NAME, 1,
  --             decode(sluch.z$fl_poly, 0, (select max(s.fc_name) from asu.tstandart s where s.fc_code = ts.kod_eo),
  --                                        (select max(h.fc_name) from asu.theal h where h.code = ts.kod_eo))) kod_eo_name,
--        sluch.smo,

        d.sum_eo_smo,

        ts.own n_own_ts

      from asu.tusl_dbf ts
      left join asu.tsluch_dbf sluch on sluch.fk_id = ts.fk_sluchid
--      full join asu.tusl_dbf_load tsl on tsl.id_ill = ts.id_ill
--                                     and tsl.id_ill_u = ts.id_ill_u
--                                     and nvl(tsl.p_id_ill, -1) = nvl(ts.p_id_ill, -1)
--                                     and tsl.year = ts.year and tsl.month = ts.month
--                                     and tsl.lpu_id = ts.lpu_id and tsl.kod_eo = ts.kod_eo
--                                     and tsl.Date_e_u = ts.Date_e_u
      full join asu.tusl_dbf_load tsl on tsl.id_ill_u = ts.id_ill_u
      full join asu.tusd_dbf d on d.id_ill_u = nvl(ts.id_ill_u, tsl.id_ill_u)

      left join asu.tsluch_dbf_load sluch_l on sluch_l.fk_id = tsl.fk_sluchid
    ) t

    $IF ASU.PKG_COMPILE_CONDITIONS.bDBF_EXCH_FILL_FC_KOD_EO_NAME $THEN -- директива компиляци создана, чтобы отключить на Хантах участак кода, который значительно замедляет сбор данных, но именно на этом объекте
      left join (select ts.FC_CODE, ts.fc_name
                   from (SELECT MAX(s.FK_ID) FK_ID, s.fc_Code FROM ASU.tstandart s group by s.fc_Code) tsm
                  inner join ASU.tstandart Ts on ts.fk_id = tsm.fk_id) ts
             on ts.fc_code = decode(t.KOD_EO_SOURCE, 0, t.KOD_EO_TSL, t.KOD_EO_TS)
      left join (select th.CODE, th.fc_name
                   from (SELECT MAX(H.FK_ID) FK_ID, h.Code FROM ASU.THEAL H group by h.Code) thm
                  inner join ASU.THEAL TH on th.fk_id = thm.fk_id) th
             on th.code = decode(t.KOD_EO_SOURCE, 0, t.KOD_EO_TSL, t.KOD_EO_TS)
    $END

      left join asu.tuslnocompare tuc on tuc.fk_uslid = t.FK_ID_TS
      left join asu.ttiproom ttr on ttr.fk_id = tuc.fk_tiproom

      left join asu.tambtalon ta on ta.fk_id = nvl(t.ID_ILL_TS, t.ID_ILL_TSL)
      left join asu.tperesel tp on tp.fk_id = nvl(t.ID_ILL_TS, t.ID_ILL_TSL)
      left join ASU.TPAC_INSURANCE PI on PI.FK_PACID = tp.fk_pacid
      left join ASU.TINSURDOCS I on I.FK_ID = ta.fk_insuranceid or I.FK_ID = PI.FK_INSURDOCID
      left join asu.TCOMPANY Cm on Cm.FK_ID = I.FK_COMPANYID
      left join (select te.fc_value, tow.fn_code
                  from exch43.ttables tt
                 inner join exch43.texchange_their te on te.fk_table = tt.fk_id
                 inner join exch43.texchange_own tow on tow.fk_their = te.fk_id
                 where tt.fk_company = asu.GET_HOMS_COMPANYID
                   and tt.fc_name = 'SMO'
                 group by te.fn_code, te.fc_value, tow.fn_code) tsmo on tsmo.fn_code = Cm.FK_ID;
 end;

 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 procedure SetCalculateParams(pBeg DATE, pEnd DATE, pAddUnExSluch NUMBER, pOMS_ONLY NUMBER, pAddSluchByYear NUMBER, pSluchType NUMBER, pOWN NUMBER,
--                              pUseModernForOWN2 Integer,
                              pPeriod Integer) is
 begin
   delete from asu.TDBF_EXCH_CALCULATEPARAMS;

   insert into asu.TDBF_EXCH_CALCULATEPARAMS
     (FD_BEG,
      FD_END,
      FL_ADDUNEXSLUCH,
      FL_OMS_ONLY,
      FL_ADDSLUCHBYYEAR,
      FN_SLUCHTYPE,
      FN_OWN,
--      FL_USEMODERNFOROWN2,
      FN_PERIOD)
     select pBeg,
            pEnd,
            pAddUnExSluch,
            pOMS_ONLY,
            pAddSluchByYear,
            pSluchType,
            pOWN,
--            pUseModernForOWN2,
            pPeriod
       from dual;
 end;

 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 procedure Calculate(pBeg DATE, pEnd DATE, pAddUnExSluch NUMBER, pOMS_ONLY NUMBER, pAddSluchByYear NUMBER, pSluchType NUMBER, pOWN NUMBER,
                     pUseStorage integer  default 0) is
 begin
   ASU.PKG_FOMS_UPLOAD.ClearLog;
   ASU.PKG_FOMS_UPLOAD.FILL_SLUCH_DBF_CALC(pBeg, pEnd, pAddUnExSluch, pAddSluchByYear, pSluchType, pUseStorage);

   ASU.PKG_FOMS_UPLOAD.AddLog(sysdate, 'FILL_FIRST_TABLE_DBF', 'Calculate_FILL_FIRST_TABLE_DBF');
   ASU.PKG_FOMS_UPLOAD.FILL_FIRST_TABLE_DBF(pOMS_ONLY, pSluchType, pOWN);

   ASU.PKG_FOMS_UPLOAD.AddLog(sysdate, 'CLEAR_TABLES', 'Calculate_CLEAR_TABLES');

   ASU.PKG_FOMS_UPLOAD.CLEAR_TABLES;
   ASU.PKG_FOMS_UPLOAD.AddLog(sysdate, 'DELETE_FROM_SLUCH_DBF_CALC', 'Calculate_DELETE_FROM_SLUCH_DBF_CALC');
   ASU.PKG_FOMS_UPLOAD.DELETE_FROM_SLUCH_DBF_CALC;
   ASU.PKG_FOMS_UPLOAD.AddLog(sysdate, 'FILL_CACHE', 'Calculate_FILL_CACHE');
   ASU.PKG_FOMS_UPLOAD.FILL_CACHE;
   ASU.PKG_FOMS_UPLOAD.AddLog(sysdate, 'ADD_MAIN_DATA', 'Calculate_ADD_MAIN_DATA');
   ASU.PKG_FOMS_UPLOAD.ADD_MAIN_DATA;
   DBMS_STATS.GATHER_TABLE_STATS('ASU', 'TSLUCH_DBF', CASCADE => TRUE);

   ASU.PKG_FOMS_UPLOAD.AddLog(sysdate, 'FILL_STAC_USL', 'Calculate_FILL_STAC_USL');
   ASU.PKG_FOMS_UPLOAD.FILL_STAC_USL;
   ASU.PKG_FOMS_UPLOAD.AddLog(sysdate, 'FILL_STAC_SLUCH', 'Calculate_FILL_STAC_SLUCH');
   ASU.PKG_FOMS_UPLOAD.FILL_STAC_SLUCH;
   ASU.PKG_FOMS_UPLOAD.AddLog(sysdate, 'ADD_STAC_OPER', 'Calculate_ADD_STAC_OPER');
   ASU.PKG_FOMS_UPLOAD.ADD_STAC_OPER;
   commit;

   ASU.PKG_FOMS_UPLOAD.AddLog(sysdate, 'ADD_ALL_DIAG_DATA', 'Calculate_ADD_ALL_DIAG_DATA');
   ASU.PKG_FOMS_UPLOAD.ADD_ALL_DIAG_DATA;
   commit;

   ASU.PKG_FOMS_UPLOAD.AddLog(sysdate, 'ADD_ALL_INSUR_AND_ALIEN_DATA', 'Calculate_ADD_ALL_INSUR_AND_ALIEN_DATA');
   ASU.PKG_FOMS_UPLOAD.ADD_ALL_INSUR_AND_ALIEN_DATA;
   commit;

   ASU.PKG_FOMS_UPLOAD.AddLog(sysdate, 'ADD_ALL_SLUCH_DATA', 'Calculate_ADD_ALL_SLUCH_DATA');
   ASU.PKG_FOMS_UPLOAD.ADD_ALL_SLUCH_DATA;

   DBMS_STATS.GATHER_TABLE_STATS('ASU', 'TSLUCH_DBF', CASCADE => TRUE);

   ASU.PKG_FOMS_UPLOAD.AddLog(sysdate, 'FILL_AMB_USL', 'Calculate_FILL_AMB_USL');
   ASU.PKG_FOMS_UPLOAD.FILL_AMB_USL;
   ASU.PKG_FOMS_UPLOAD.AddLog(sysdate, 'ADD_AMB_USL_AND_OPER_DOC_DATA', 'Calculate_ADD_AMB_USL_AND_OPER_DOC_DATA');
   ASU.PKG_FOMS_UPLOAD.ADD_AMB_USL_AND_OPER_DOC_DATA;
   DBMS_STATS.GATHER_TABLE_STATS('ASU', 'TUSL_DBF', CASCADE => TRUE);
   ASU.PKG_FOMS_UPLOAD.AddLog(sysdate, 'ADD_AMB_SUM_DATA', 'Calculate_ADD_AMB_SUM_DATA');
   ASU.PKG_FOMS_UPLOAD.ADD_AMB_SUM_DATA;
   commit;

   ASU.PKG_FOMS_UPLOAD.AddLog(sysdate, 'DELETE_ZERO_COST_USL', 'Calculate_DELETE_ZERO_COST_USL');
   ASU.PKG_FOMS_UPLOAD.DELETE_ZERO_COST_USL;
   commit;

   ASU.PKG_FOMS_UPLOAD.AddLog(sysdate, 'ADD_TOTAL', 'Calculate_ADD_TOTAL');
   ASU.PKG_FOMS_UPLOAD.ADD_TOTAL;
   commit;

   ASU.PKG_FOMS_UPLOAD.AddLog(sysdate, 'SYNC_AMB_DATA', 'Calculate_SYNC_AMB_DATA');
   ASU.PKG_FOMS_UPLOAD.SYNC_AMB_DATA;
   commit;

   AddLog(sysdate, 'FILL_BY_PERSON', 'CalculateAndSaveExt_FILL_BY_PERSON');
   ASU.PKG_FOMS_UPLOAD.FILL_BY_PERSON;
   commit;

   ASU.PKG_FOMS_UPLOAD.AddLog(sysdate, 'FILL_EXSLUCH_ERR', 'Calculate_FILL_EXSLUCH_ERR');
   ASU.PKG_FOMS_UPLOAD.FILL_EXSLUCH_ERR;
   commit;
 end;

 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 procedure CalculateByParams is
   vCount NUMBER;

   pBeg DATE;
   pEnd DATE;
   pAddUnExSluch NUMBER;
   pOMS_ONLY NUMBER;
   pAddSluchByYear NUMBER;
   pSluchType NUMBER;
   pOWN NUMBER;
--   pUseModernForOWN2 Integer;
   pPeriod Integer;
 begin
   select count(*) into vCount from asu.TDBF_EXCH_CalculateParams;

   if vCount <> 1 then
     pAddUnExSluch := 1;
     pOMS_ONLY := 0;
     pAddSluchByYear := 0;
     pSluchType := 0;
     pOWN := 0;
--     pUseModernForOWN2 := 1;
     pPeriod := 14;
     select trunc(sysdate - pPeriod) , trunc(sysdate) into pBeg, pEnd from dual;

     SetCalculateParams(pBeg, pEnd, pAddUnExSluch, pOMS_ONLY, pAddSluchByYear, pSluchType, pOWN,
--                        pUseModernForOWN2,
                        pPeriod);
   end if;

   select decode(FN_PERIOD, 0, fd_beg, trunc(sysdate - FN_PERIOD)) fd_beg, decode(FN_PERIOD, 0, fd_end, trunc(sysdate)) fd_end, fl_AddUnExSluch, fl_oms_only, fl_AddSluchByYear, fn_SluchType, fn_OWN--, fl_UseModernForOWN2
     into pBeg, pEnd, pAddUnExSluch, pOMS_ONLY, pAddSluchByYear, pSluchType, pOWN--, pUseModernForOWN2
     from asu.TDBF_EXCH_CalculateParams;

   Calculate(pBeg, pEnd, pAddUnExSluch, pOMS_ONLY, pAddSluchByYear, pSluchType, pOWN);--, pUseModernForOWN2);
 end;

 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 procedure SaveToStorage(aErrOnly integer default 0) is
 begin
  DELETE FROM asu.texsluch_err_stor t
   WHERE (t.fk_sluchid IN
         (SELECT fk_id
             FROM asu.tsluch_dbf_stor
            WHERE id_ill IN (SELECT id_ill FROM asu.tsluch_dbf)));
  DELETE FROM asu.texsluch_err_stor t
   WHERE (t.fk_uslid IN (SELECT fk_id
                           FROM asu.tusl_dbf_stor
                          WHERE id_ill IN (SELECT id_ill FROM asu.tsluch_dbf)));
  DELETE FROM asu.texsluch_err_stor t WHERE (t.fk_id IN (SELECT fk_id FROM asu.texsluch_err));

  if aErrOnly = 0 then
    DELETE FROM asu.texchange_elselog_stor t
     WHERE (t.fc_table = 'asu.tsluch_dbf' AND
           t.fk_owner IN (SELECT fk_id
                             FROM asu.tsluch_dbf_stor
                            WHERE id_ill IN (SELECT id_ill FROM asu.tsluch_dbf)));
    DELETE FROM asu.texchange_elselog_stor t
     WHERE (t.fc_table = 'asu.tusl_dbf' AND
           t.fk_owner IN (SELECT fk_id
                             FROM asu.tusl_dbf_stor
                            WHERE id_ill IN (SELECT id_ill FROM asu.tsluch_dbf)));
    DELETE FROM asu.texchange_elselog_stor t
     WHERE (t.fk_id IN (SELECT fk_id FROM asu.texchange_elselog));

    DELETE FROM asu.tuslnocompare_stor t
     WHERE (t.fk_uslid IN (SELECT fk_id
                             FROM asu.tusl_dbf_stor u
                            WHERE u.id_ill IN (SELECT id_ill FROM asu.tsluch_dbf)
                               OR (t.fk_id IN (SELECT fk_id FROM asu.tusl_dbf))));
    DELETE FROM asu.tuslnocompare_stor t
     WHERE (t.fk_id IN (SELECT fk_id FROM asu.tuslnocompare));

    DELETE FROM asu.tsluch_dbf_stor t WHERE t.id_ill IN (SELECT id_ill FROM asu.tsluch_dbf);
    DELETE FROM asu.tsluch_dbf_stor t WHERE t.fk_id IN (SELECT fk_id FROM asu.tsluch_dbf);
    DELETE FROM asu.tusl_dbf_stor t WHERE t.id_ill IN (SELECT id_ill FROM asu.tsluch_dbf);
    DELETE FROM asu.tusl_dbf_stor t WHERE t.fk_id IN (SELECT fk_id FROM asu.tusl_dbf);
--    DELETE FROM asu.tmda_dbf_stor t WHERE t.id_ill IN (SELECT id_ill FROM asu.tsluch_dbf);
--    DELETE FROM asu.tmda_dbf_stor t WHERE t.fk_id IN (SELECT fk_id FROM asu.tmda_dbf);

    insert into asu.tsluch_dbf_stor select * from asu.tsluch_dbf;
    insert into asu.tusl_dbf_stor select * from asu.tusl_dbf;
--    insert into asu.tmda_dbf_stor select * from asu.tmda_dbf;

    insert into asu.tuslnocompare_stor select c.* from asu.tuslnocompare c inner join asu.tusl_dbf u on u.fk_id = c.FK_USLID;

    insert into asu.texchange_elselog_stor
      select *
        from asu.texchange_elselog t
       where (t.fc_table = 'asu.tsluch_dbf' and
              t.fk_owner in
              (select fk_id
                 from asu.tsluch_dbf_stor
                where id_ill in (select id_ill from asu.tsluch_dbf)));
    insert into asu.texchange_elselog_stor
      select *
        from asu.texchange_elselog t
       where (t.fc_table = 'asu.tusl_dbf' and
              t.fk_owner in
              (select fk_id
                 from asu.tusl_dbf_stor
                where id_ill in (select id_ill from asu.tsluch_dbf)));
   end if;

  insert into asu.texsluch_err_stor
    (FK_ID,
     YEAR,
     MONTH,
     LPU_ID,
     PERSON_IDL,
     ID_ILL,
     P_ID_ILL,
     FC_CODE,
     FK_SLUCHID,
     FN_IS_LOAD,
     FC_MSG_ERR,
     FC_FIELDS,
     FK_USLID,
     FK_SLUCHLOADID,
     GLOBAL_ID,
     VO,
     POLICYSER,
     POLICYNUM,
     TYPE_FILE)
    select FK_ID,
           YEAR,
           MONTH,
           LPU_ID,
           PERSON_IDL,
           ID_ILL,
           P_ID_ILL,
           FC_CODE,
           FK_SLUCHID,
           FN_IS_LOAD,
           FC_MSG_ERR,
           FC_FIELDS,
           FK_USLID,
           FK_SLUCHLOADID,
           GLOBAL_ID,
           VO,
           POLICYSER,
           POLICYNUM,
           TYPE_FILE
      from asu.texsluch_err t
     where t.fn_is_load = 0
       and ((t.fk_sluchid in
           (select fk_id
                from asu.tsluch_dbf_stor
               where id_ill in (select id_ill from asu.tsluch_dbf))) or
           (t.fk_uslid in
           (select fk_id
                from asu.tusl_dbf_stor
               where id_ill in (select id_ill from asu.tsluch_dbf))));
 end;

 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 procedure LoadFromStorage(aYear integer default vYEAR, aMonth integer default vMONTH) is
 begin
   -- сначала обновим tuslnocompare и только потом tusl_dbf и tsluch_dbf
   INSERT INTO asu.tuslnocompare (fk_id, fk_uslid, fk_smid, fk_tiproom)
    SELECT t.fk_id, t.fk_uslid, t.fk_smid, t.fk_tiproom
      FROM asu.tuslnocompare_stor t
     INNER JOIN (SELECT t.fk_id
                   FROM asu.tusl_dbf_stor t
                  INNER JOIN (SELECT id_ill
                   FROM asu.tsluch_dbf_calc
                  WHERE fl_fromstor = 1 group by id_ill) c ON c.id_ill = t.id_ill) c
        ON c.fk_id = t.fk_uslid;

   -- Задаём результирующий период выгрузки
   INSERT INTO asu.tusl_dbf
    SELECT t.*
      FROM asu.tusl_dbf_stor t
     INNER JOIN (SELECT id_ill FROM asu.tsluch_dbf_calc WHERE fl_fromstor = 1 group by id_ill) c ON c.id_ill = t.id_ill;

   insert into asu.texchange_elselog
     select t.*
       from asu.texchange_elselog_stor t
      inner join asu.tsluch_dbf_stor s on s.fk_id = t.fk_owner
      inner join (select id_ill from asu.tsluch_dbf_calc where fl_fromstor = 1 group by id_ill) c on c.id_ill = s.id_ill
      where t.fc_table = 'asu.tsluch_dbf'
     union all
     select t.*
       from asu.texchange_elselog_stor t
      inner join asu.tusl_dbf_stor s on s.fk_id = t.fk_owner
      inner join (select id_ill from asu.tsluch_dbf_calc where fl_fromstor = 1 group by id_ill) c on c.id_ill = s.id_ill
      where t.fc_table = 'asu.tusl_dbf';

  insert into asu.texsluch_err
    (FK_ID,
     YEAR,
     MONTH,
     LPU_ID,
     PERSON_IDL,
     ID_ILL,
     P_ID_ILL,
     FC_CODE,
     FK_SLUCHID,
     FN_IS_LOAD,
     FC_MSG_ERR,
     FC_FIELDS,
     FK_USLID,
     FK_SLUCHLOADID,
     GLOBAL_ID,
     VO,
     POLICYSER,
     POLICYNUM,
     TYPE_FILE)
    select t.FK_ID,
           t.YEAR,
           t.MONTH,
           t.LPU_ID,
           t.PERSON_IDL,
           t.ID_ILL,
           t.P_ID_ILL,
           t.FC_CODE,
           t.FK_SLUCHID,
           t.FN_IS_LOAD,
           t.FC_MSG_ERR,
           t.FC_FIELDS,
           t.FK_USLID,
           t.FK_SLUCHLOADID,
           t.GLOBAL_ID,
           t.VO,
           t.POLICYSER,
           t.POLICYNUM,
           t.TYPE_FILE
      from asu.texsluch_err_stor t
     inner join asu.tsluch_dbf_stor s on s.fk_id = t.fk_sluchid
     inner join (select id_ill from asu.tsluch_dbf_calc where fl_fromstor = 1 group by id_ill) c on c.id_ill = s.id_ill
    union
    select t.FK_ID,
           t.YEAR,
           t.MONTH,
           t.LPU_ID,
           t.PERSON_IDL,
           t.ID_ILL,
           t.P_ID_ILL,
           t.FC_CODE,
           t.FK_SLUCHID,
           t.FN_IS_LOAD,
           t.FC_MSG_ERR,
           t.FC_FIELDS,
           t.FK_USLID,
           t.FK_SLUCHLOADID,
           t.GLOBAL_ID,
           t.VO,
           t.POLICYSER,
           t.POLICYNUM,
           t.TYPE_FILE
      from asu.texsluch_err_stor t
     inner join asu.tusl_dbf_stor s on s.fk_id = t.fk_uslid
     inner join (select id_ill from asu.tsluch_dbf_calc where fl_fromstor = 1 group by id_ill) c on c.id_ill = s.id_ill;

   -- Так как все проверки на то что случай уже присутствует в выгрузке (и его не надо копировать из хранилища)
   -- завязаны на таблицу tsluch_dbf, обновляем её последней
   -- Задаём результирующий период выгрузки   insert into asu.tsluch_dbf
   insert into asu.tsluch_dbf
     select t.*
       from asu.tsluch_dbf_stor t
      inner join (select id_ill from asu.tsluch_dbf_calc where fl_fromstor = 1 group by id_ill) c on c.id_ill = t.id_ill;

  UPDATE asu.tusl_dbf t
     SET YEAR = aYear, MONTH = aMonth
   WHERE NOT EXISTS (SELECT fk_id
            FROM asu.tusl_dbf u
           WHERE u.fk_id = t.fk_id
             AND u.YEAR = aYear
             AND u.MONTH = aMonth);

  UPDATE asu.tsluch_dbf t
     SET YEAR = aYear, MONTH = aMonth
   WHERE NOT EXISTS (SELECT fk_id
            FROM asu.tsluch_dbf u
           WHERE u.fk_id = t.fk_id
             AND u.YEAR = aYear
             AND u.MONTH = aMonth);
 end;

 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 procedure CalculateAndSave/*(aLastPeriod integer default 1)*/ is
 begin
   -- по умолчанию функция всегда собирает данные за послдений период

   AddLog(sysdate, 'CalculateByParams', 'CalculateAndSave_CalculateByParams');
   CalculateByParams;
   AddLog(sysdate, 'SaveToStorage', 'CalculateAndSave_SaveToStorage');
   SaveToStorage;
   AddLog(sysdate, 'FillGrids', 'CalculateAndSave_FillGrids');
   FillGrids;

   -- собирается статистика по таблицам
   DBMS_STATS.GATHER_TABLE_STATS('ASU', 'TUSLNOCOMPARE', CASCADE => TRUE);
   DBMS_STATS.GATHER_TABLE_STATS('ASU', 'TEXCHANGE_ELSELOG', CASCADE => TRUE);
   DBMS_STATS.GATHER_TABLE_STATS('ASU', 'TSLUCH_DBF', CASCADE => TRUE);
   DBMS_STATS.GATHER_TABLE_STATS('ASU', 'TUSL_DBF', CASCADE => TRUE);
   DBMS_STATS.GATHER_TABLE_STATS('ASU', 'TEXSLUCH_ERR', CASCADE => TRUE);
   DBMS_STATS.GATHER_TABLE_STATS('ASU', 'TSMID_FIZTER', CASCADE => TRUE);
   DBMS_STATS.GATHER_TABLE_STATS('ASU', 'TSMID_DENT', CASCADE => TRUE);
   DBMS_STATS.GATHER_TABLE_STATS('ASU', 'TSMID_KONS_SPEC', CASCADE => TRUE);
   DBMS_STATS.GATHER_TABLE_STATS('ASU', 'TSMID_PD_TRAVM', CASCADE => TRUE);
   DBMS_STATS.GATHER_TABLE_STATS('ASU', 'TSMID_OPER', CASCADE => TRUE);
   DBMS_STATS.GATHER_TABLE_STATS('ASU', 'TSMID_NARCOSIS', CASCADE => TRUE);
   DBMS_STATS.GATHER_TABLE_STATS('ASU', 'TSMID_NODBFEXCH', CASCADE => TRUE);
   DBMS_STATS.GATHER_TABLE_STATS('ASU', 'TSLUCH_DBF_CALC', CASCADE => TRUE);
   DBMS_STATS.GATHER_TABLE_STATS('ASU', 'TEXCHUPLOAD_TMP_DBF', CASCADE => TRUE);
--   DBMS_STATS.GATHER_TABLE_STATS('ASU', 'TMDA_DBF', CASCADE => TRUE);
   DBMS_STATS.GATHER_TABLE_STATS('ASU', 'TSLUCH_DBF_GRID', CASCADE => TRUE);
   DBMS_STATS.GATHER_TABLE_STATS('ASU', 'TUSL_DBF_GRID', CASCADE => TRUE);
   DBMS_STATS.GATHER_TABLE_STATS('ASU', 'TEXCHANGE_ELSELOG_STOR', CASCADE => TRUE);
   DBMS_STATS.GATHER_TABLE_STATS('ASU', 'TEXSLUCH_ERR_STOR', CASCADE => TRUE);
   DBMS_STATS.GATHER_TABLE_STATS('ASU', 'TUSLNOCOMPARE_STOR', CASCADE => TRUE);
   DBMS_STATS.GATHER_TABLE_STATS('ASU', 'TSLUCH_DBF_STOR', CASCADE => TRUE);
   DBMS_STATS.GATHER_TABLE_STATS('ASU', 'TUSL_DBF_STOR', CASCADE => TRUE);
--   DBMS_STATS.GATHER_TABLE_STATS('ASU', 'TMDA_DBF_STOR', CASCADE => TRUE);

   AddLog(sysdate, 'FINISH', 'CalculateAndSave_FINISH');
 end;


 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 procedure CalculateAndSaveExt (pBeg DATE, pEnd DATE, pAddUnExSluch NUMBER, pOMS_ONLY NUMBER, pAddSluchByYear NUMBER, pSluchType NUMBER, pOWN NUMBER,
                                pUseStorage integer default 0, pIsGroupAmbSluch integer default 0, pStartFromCLEAR_TABLES integer default 0, pReCalc integer default 0) is
 begin
   ASU.PKG_FOMS_UPLOAD.ClearLog;
   if pStartFromCLEAR_TABLES = 0 then -- На случай, если заполнение служебных таблиц уже произошло при оценке кол-ва соучаев введён режим в котором FILL_SLUCH_DBF_CALC и FILL_FIRST_TABLE_DBF не выполняются
     if pReCalc = 1 then
       vYEAR := to_char(pBeg, 'YYYY');
       vMONTH := to_char(pBeg, 'MM');
     else
       ASU.PKG_FOMS_UPLOAD.AddLog(sysdate, 'FILL_SLUCH_DBF_CALC(' || to_char(pBeg, 'dd.mm.yyyy') || ', ' || to_char(pEnd, 'dd.mm.yyyy') || ', ' ||
                                                                     to_char(pAddUnExSluch) || ', ' || to_char(pAddSluchByYear) || ', ' ||
                                                                     to_char(pSluchType) || ', ' || to_char(pUseStorage) || ')', 'CalculateAndSaveExt_FILL_SLUCH_DBF_CALC');
       ASU.PKG_FOMS_UPLOAD.FILL_SLUCH_DBF_CALC(pBeg, pEnd, pAddUnExSluch, pAddSluchByYear, pSluchType, pUseStorage);
     end if;

     ASU.PKG_FOMS_UPLOAD.AddLog(sysdate, 'FILL_FIRST_TABLE_DBF(' || to_char(pOMS_ONLY) || ', ' || to_char(pSluchType) || ', ' || to_char(pOWN) || ')', 'CalculateAndSaveExt_FILL_FIRST_TABLE_DBF');
     ASU.PKG_FOMS_UPLOAD.FILL_FIRST_TABLE_DBF(pOMS_ONLY, pSluchType, pOWN);
   end if;

   ASU.PKG_FOMS_UPLOAD.AddLog(sysdate, 'CLEAR_TABLES', 'CalculateAndSaveExt_CLEAR_TABLES');

   ASU.PKG_FOMS_UPLOAD.CLEAR_TABLES;

   if pReCalc = 0 then
     ASU.PKG_FOMS_UPLOAD.AddLog(sysdate, 'DELETE_FROM_SLUCH_DBF_CALC', 'CalculateAndSaveExt_DELETE_FROM_SLUCH_DBF_CALC');
     ASU.PKG_FOMS_UPLOAD.DELETE_FROM_SLUCH_DBF_CALC;
   end if;

   ASU.PKG_FOMS_UPLOAD.AddLog(sysdate, 'FILL_CACHE', 'CalculateAndSaveExt_FILL_CACHE');
   ASU.PKG_FOMS_UPLOAD.FILL_CACHE;
   ASU.PKG_FOMS_UPLOAD.AddLog(sysdate, 'ADD_MAIN_DATA', 'CalculateAndSaveExt_ADD_MAIN_DATA');
   ASU.PKG_FOMS_UPLOAD.ADD_MAIN_DATA;
   DBMS_STATS.GATHER_TABLE_STATS('ASU', 'TSLUCH_DBF', CASCADE => TRUE);

   ASU.PKG_FOMS_UPLOAD.AddLog(sysdate, 'FILL_STAC_USL', 'CalculateAndSaveExt_FILL_STAC_USL');
   ASU.PKG_FOMS_UPLOAD.FILL_STAC_USL;
   ASU.PKG_FOMS_UPLOAD.AddLog(sysdate, 'FILL_STAC_SLUCH', 'CalculateAndSaveExt_FILL_STAC_SLUCH');
   ASU.PKG_FOMS_UPLOAD.FILL_STAC_SLUCH;
   ASU.PKG_FOMS_UPLOAD.AddLog(sysdate, 'ADD_STAC_OPER', 'CalculateAndSaveExt_ADD_STAC_OPER');
   ASU.PKG_FOMS_UPLOAD.ADD_STAC_OPER;
   commit;

   ASU.PKG_FOMS_UPLOAD.AddLog(sysdate, 'ADD_ALL_DIAG_DATA', 'CalculateAndSaveExt_ADD_ALL_DIAG_DATA');
   ASU.PKG_FOMS_UPLOAD.ADD_ALL_DIAG_DATA;
   commit;

   ASU.PKG_FOMS_UPLOAD.AddLog(sysdate, 'ADD_ALL_INSUR_AND_ALIEN_DATA', 'CalculateAndSaveExt_ADD_ALL_INSUR_AND_ALIEN_DATA');
   ASU.PKG_FOMS_UPLOAD.ADD_ALL_INSUR_AND_ALIEN_DATA;
   commit;

   ASU.PKG_FOMS_UPLOAD.AddLog(sysdate, 'ADD_ALL_SLUCH_DATA', 'CalculateAndSaveExt_ADD_ALL_SLUCH_DATA');
   ASU.PKG_FOMS_UPLOAD.ADD_ALL_SLUCH_DATA;

   DBMS_STATS.GATHER_TABLE_STATS('ASU', 'TSLUCH_DBF', CASCADE => TRUE);

   ASU.PKG_FOMS_UPLOAD.AddLog(sysdate, 'FILL_AMB_USL', 'CalculateAndSaveExt_FILL_AMB_USL');
   ASU.PKG_FOMS_UPLOAD.FILL_AMB_USL;
   ASU.PKG_FOMS_UPLOAD.AddLog(sysdate, 'ADD_AMB_USL_AND_OPER_DOC_DATA', 'CalculateAndSaveExt_ADD_AMB_USL_AND_OPER_DOC_DATA');
   ASU.PKG_FOMS_UPLOAD.ADD_AMB_USL_AND_OPER_DOC_DATA;
   DBMS_STATS.GATHER_TABLE_STATS('ASU', 'TUSL_DBF', CASCADE => TRUE);
   ASU.PKG_FOMS_UPLOAD.AddLog(sysdate, 'ADD_AMB_SUM_DATA', 'CalculateAndSaveExt_ADD_AMB_SUM_DATA');
   ASU.PKG_FOMS_UPLOAD.ADD_AMB_SUM_DATA;
   commit;

   ASU.PKG_FOMS_UPLOAD.AddLog(sysdate, 'DELETE_ZERO_COST_USL', 'CalculateAndSaveExt_DELETE_ZERO_COST_USL');
   ASU.PKG_FOMS_UPLOAD.DELETE_ZERO_COST_USL;
   commit;

   ASU.PKG_FOMS_UPLOAD.AddLog(sysdate, 'ADD_TOTAL', 'CalculateAndSaveExt_ADD_TOTAL');
   ASU.PKG_FOMS_UPLOAD.ADD_TOTAL;
   commit;

   ASU.PKG_FOMS_UPLOAD.AddLog(sysdate, 'SYNC_AMB_DATA', 'CalculateAndSaveExt_SYNC_AMB_DATA');
   ASU.PKG_FOMS_UPLOAD.SYNC_AMB_DATA;
   commit;

   -- Добавляются данные определяемые по пиплу, для этих данных мехинизм хранения не отличается для стационара и амбулатории поэтому добавляются они в общей для всех типов процедуре
   AddLog(sysdate, 'FILL_BY_PERSON', 'CalculateAndSaveExt_FILL_BY_PERSON');
   ASU.PKG_FOMS_UPLOAD.FILL_BY_PERSON;

   if pReCalc = 1 or asu.GET_DBF_AUTO_CHECK_DATA = 1 then
     ASU.PKG_FOMS_UPLOAD.AddLog(sysdate, 'FILL_EXSLUCH_ERR', 'CalculateAndSaveExt_FILL_EXSLUCH_ERR');
     ASU.PKG_FOMS_UPLOAD.FILL_EXSLUCH_ERR;
     commit;
   end if;

   AddLog(sysdate, 'SaveToStorage', 'CalculateAndSaveExt_SaveToStorage');
   ASU.PKG_FOMS_UPLOAD.SaveToStorage;
   AddLog(sysdate, 'LoadFromStorage(' || to_char(vYEAR) || ',' || to_char(vMONTH) || ')', 'CalculateAndSaveExt_SaveToStorage');
   ASU.PKG_FOMS_UPLOAD.LoadFromStorage(vYEAR, vMONTH);

   if pIsGroupAmbSluch = 1 then
     AddLog(sysdate, 'GROUP_AMB_SLUCH', 'CalculateAndSaveExt_GROUP_AMB_SLUCH');
     ASU.PKG_FOMS_UPLOAD.GROUP_AMB_SLUCH;
     AddLog(sysdate, 'ADD_TOTAL', 'CalculateAndSaveExt_ADD_TOTAL');
     ASU.PKG_FOMS_UPLOAD.ADD_TOTAL;
     AddLog(sysdate, 'SYNC_AMB_DATA', 'CalculateAndSaveExt_SYNC_AMB_DATA');
     ASU.PKG_FOMS_UPLOAD.SYNC_AMB_DATA;
   end if;

   AddLog(sysdate, 'FillGrids', 'CalculateAndSaveExt_FillGrids');
   ASU.PKG_FOMS_UPLOAD.FillGrids;

   -- собирается статистика по таблицам
   DBMS_STATS.GATHER_TABLE_STATS('ASU', 'TUSLNOCOMPARE', CASCADE => TRUE);
   DBMS_STATS.GATHER_TABLE_STATS('ASU', 'TEXCHANGE_ELSELOG', CASCADE => TRUE);
   DBMS_STATS.GATHER_TABLE_STATS('ASU', 'TSLUCH_DBF', CASCADE => TRUE);
   DBMS_STATS.GATHER_TABLE_STATS('ASU', 'TUSL_DBF', CASCADE => TRUE);
   DBMS_STATS.GATHER_TABLE_STATS('ASU', 'TEXSLUCH_ERR', CASCADE => TRUE);
   DBMS_STATS.GATHER_TABLE_STATS('ASU', 'TSMID_FIZTER', CASCADE => TRUE);
   DBMS_STATS.GATHER_TABLE_STATS('ASU', 'TSMID_DENT', CASCADE => TRUE);
   DBMS_STATS.GATHER_TABLE_STATS('ASU', 'TSMID_KONS_SPEC', CASCADE => TRUE);
   DBMS_STATS.GATHER_TABLE_STATS('ASU', 'TSMID_PD_TRAVM', CASCADE => TRUE);
   DBMS_STATS.GATHER_TABLE_STATS('ASU', 'TSMID_OPER', CASCADE => TRUE);
   DBMS_STATS.GATHER_TABLE_STATS('ASU', 'TSMID_NARCOSIS', CASCADE => TRUE);
   DBMS_STATS.GATHER_TABLE_STATS('ASU', 'TSMID_NODBFEXCH', CASCADE => TRUE);
   DBMS_STATS.GATHER_TABLE_STATS('ASU', 'TSLUCH_DBF_CALC', CASCADE => TRUE);
   DBMS_STATS.GATHER_TABLE_STATS('ASU', 'TEXCHUPLOAD_TMP_DBF', CASCADE => TRUE);
   DBMS_STATS.GATHER_TABLE_STATS('ASU', 'TSLUCH_DBF_GRID', CASCADE => TRUE);
   DBMS_STATS.GATHER_TABLE_STATS('ASU', 'TUSL_DBF_GRID', CASCADE => TRUE);
   DBMS_STATS.GATHER_TABLE_STATS('ASU', 'TEXCHANGE_ELSELOG_STOR', CASCADE => TRUE);
   DBMS_STATS.GATHER_TABLE_STATS('ASU', 'TEXSLUCH_ERR_STOR', CASCADE => TRUE);
   DBMS_STATS.GATHER_TABLE_STATS('ASU', 'TUSLNOCOMPARE_STOR', CASCADE => TRUE);
   DBMS_STATS.GATHER_TABLE_STATS('ASU', 'TSLUCH_DBF_STOR', CASCADE => TRUE);
   DBMS_STATS.GATHER_TABLE_STATS('ASU', 'TUSL_DBF_STOR', CASCADE => TRUE);

   AddLog(sysdate, 'FINISH', 'CalculateAndSaveExt_FINISH');
 end;

END;
/

SHOW ERRORS;


