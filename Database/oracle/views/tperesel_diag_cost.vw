DROP VIEW ASU.TPERESEL_DIAG_COST
/

/* Formatted on 06.04.2016 15:18:59 (QP5 v5.115.810.9015) */
--
-- TPERESEL_DIAG_COST  (View)
--
--  Dependencies:
--   DUAL (Synonym)
--   DOC_IB_DSROOT (Function)
--   TOTDEL (Table)
--   TSTANDART (Table)
--   TSTANDART_COST (Table)
--   TSTANDART_ICD10 (Table)
--   TSTANDART_RAZDEL (Table)
--   TCOMPANY (Table)
--   TDIAG (Table)
--   TROOM (Table)
--   TPAC_INSURANCE (Table)
--   TTYPEDOC (Table)
--   TICD10 (Table)
--   TINSURDOCS (Table)
--   TPERESEL (Table)
--   TSMID (Table)
--   PKG_REGIST_PACFUNC (Package)
--   GET_FULLMKB10 (Function)
--   GET_IS_OPER_IN_TIME (Function)
--   GET_NATIVE_REGION (Function)
--   GET_TIPROOM_HEMODIAL (Function)
--   PKG_STATUTIL (Package)
--   TUSLVID (Table)
--   TKARTA (Table)
--

CREATE OR REPLACE FORCE VIEW ASU.TPERESEL_DIAG_COST
(
   FK_ID,
   PR_OWN,
   FC_CODE,
   FN_COST,
   FK_OTDELID,
   FD_DATA1,
   FD_DATA2,
   FK_PACID,
   FK_PEPLID,
   FC_ICD,
   FL_FIRST,
   FK_KOYKAVIDID,
   FK_PALATAID,
   FK_REGIONID,
   FK_USLVIDID,
   FC_SER,
   FC_NUM,
   FK_COMPANYID,
   FC_OGRN,
   FK_INSURDOCID,
   FK_TYPEOMS,
   FK_TYPEDOCID,
   FC_TYPEDOC_SYN,
   FL_UNDER18,
   FL_ISDS,
   FK_SMID,
   FC_CODE_MASK
)
AS
     SELECT   t.fk_id, -- tperesel.fk_id -- Ефимов В.А. 20120211 http://192.168.1.9/redmine/issues/21836 представление дозволяющее определить код и стоимость перевода
              t.pr_own, -- 1, значит пациент застрахован в ХМАО, 2 - пациент застрахован  вдругом регионе
              CASE
                 WHEN t.pr_own = 2 AND MAX (t.fc_code2) IS NOT NULL
                 THEN
                    MAX (t.fc_code2)
                 WHEN MAX (t.fc_code1) IS NOT NULL
                 THEN
                    MAX (t.fc_code1)
                 ELSE
                    MAX (t.fc_code)
              END
                 fc_code,                                        -- код тарифа
              CASE
                 WHEN t.pr_own = 2 AND MAX (t.fc_code2) IS NOT NULL
                 THEN
                    MAX (t.fn_cost2)
                 ELSE
                    MAX (t.fn_cost1)
              END
                 fn_cost, -- стоимость тарифа -- max(t.fc_code1) fc_code1, max(t.fn_cost1) fn_cost1, max(t.fc_code2) fc_code2, max(t.fn_cost2) fn_cost2,
              t.fk_otdelid,
              t.fd_data1,
              t.fd_data2,
              t.fk_pacid,
              t.fk_peplid,
              MAX (t.fc_code) fc_icd,
              MAX (t.fl_first) fl_first,
              MAX (t.fk_koykavidid) fk_koykavidid,
              MAX (t.fk_palataid) fk_palataid,
              MAX (t.fk_regionid) fk_regionid,
              MAX (t.fk_uslvidid) fk_uslvidid,
              MAX (t.fc_ser) fc_ser,
              MAX (t.fc_num) fc_num,
              MAX (t.fk_companyid) fk_companyid,
              MAX (t.fc_ogrn) fc_ogrn,
              MAX (t.FK_INSURDOCID) FK_INSURDOCID,
              MAX (t.fk_typeoms) fk_typeoms,
              MAX (t.fk_typedocid) fk_typedocid,
              MAX (t.fc_typedoc_syn) fc_typedoc_syn,
              MAX (t.fl_under18) fl_under18,
              MAX (t.fl_isds) fl_isds,
              MAX (t.fk_smid) fk_smid,
              MAX (t.fc_code_mask) fc_code_mask
       FROM   (SELECT   tk.fk_id,
                        r.fk_otdelid,
                        DECODE (c.fk_regionid, ASU.GET_NATIVE_REGION, 1, 2)
                           pr_own,
                        s.OWN st_own,
                        DECODE (s.OWN, 1, s.Fc_Code, '') fc_code1,
                        DECODE (s.OWN, 1, s.FN_COST, NULL) fn_cost1,
                        DECODE (s.OWN, 2, s.Fc_Code, '') fc_code2,
                        DECODE (s.OWN, 2, s.FN_COST, NULL) fn_cost2,
                        tsd.fk_mkb10 fc_code,
                        td.fl_first,
                        ASU.PKG_REGIST_PACFUNC.GET_PAC_INCOME (tk.FK_ID)
                           fd_data1,
                        ASU.PKG_REGIST_PACFUNC.GET_PAC_OUTCOME (tk.FK_ID)
                           fd_data2,
                        tp.fk_pacid,
                        tp.fk_koykavidid,
                        tp.fk_palataid,
                        c.fk_regionid,
                        d.fc_synonim fc_typedoc_syn,
                        tk.fk_uslvidid,
                        i.fc_ser,
                        i.fc_num,
                        c.fk_id fk_companyid,
                        c.fc_ogrn,
                        tk.fk_peplid,
                        PI.FK_INSURDOCID,
                        i.fk_typeoms,
                        i.fk_typedocid,
                        tu18.fl_under18,
                        DECODE (tu_ds.fk_id, NULL, 0, 1) fl_isds,
                        tsd.fk_id fk_smid,
                        LAST_VALUE(tp.fk_id)
                           OVER (
                              PARTITION BY tp.fk_pacid
                              ORDER BY tp.fd_data1, tp.fk_id
                              ROWS BETWEEN UNBOUNDED PRECEDING
                              AND     UNBOUNDED FOLLOWING
                           )
                           fk_peresel_last,
                        tp.fk_id fk_peresel,
                           'G.%.'
                        || -- Первая цифра после G определяет тип КСГ (1, 2, 3А и 3В), сейчас всегда 1
                          tsd.fk_mkb9
                        || '.'
                        ||         -- Класс болезней по МКБ-10 (римские цифры)
                          '%'
                        || -- уровень МО (1- первый, 2 – второй), считатется что может быть любым, так как на самом деле это определяется в момент заливки тарифов
                          DECODE (tu_ds.fk_id, NULL, '1', '2')
                        || '.'
                        || -- условия оказания медицинской помощи (1- стационар, 2 - дневной стационар)
                          DECODE (tu18.fl_under18, 1, '1', '2')
                        ||    -- возрастная категория (1 –дети, 2 – взрослые);
                          DECODE (
                              ASU.GET_IS_OPER_IN_TIME (
                                 tp.fk_pacid,
                                 ASU.PKG_REGIST_PACFUNC.GET_PAC_INCOME (
                                    tk.FK_ID
                                 ),
                                 ASU.PKG_REGIST_PACFUNC.GET_PAC_OUTCOME (
                                    tk.FK_ID
                                 )
                              ),
                              1,
                              '1',
                              '2'
                           )
                        || '.'
                        || -- метод лечения (1 – оперативный, 2 – консервативный)
                          DECODE (tp.fk_koykavidid,
                                  asu.get_tiproom_hemodial, '12',
                                  '%')
                           fc_code_mask
                 FROM                                       asu.tkarta tk
                                                         INNER JOIN
                                                            asu.tperesel tp
                                                         ON tp.fk_pacid =
                                                               tk.fk_id
                                                      INNER JOIN
                                                         asu.troom r
                                                      ON r.fk_id =
                                                            tp.fk_palataid
                                                   INNER JOIN
                                                      (  SELECT   tod.fk_id
                                                           FROM      login.totdel tod
                                                                  LEFT JOIN
                                                                     asu.troom tr
                                                                  ON tr.fk_otdelid =
                                                                        tod.fk_id
                                                          WHERE   UPPER (
                                                                     tr.fc_palata
                                                                  ) NOT LIKE
                                                                     'ПРИ%МН%'
                                                       GROUP BY   tod.fk_id)
                                                      tod
                                                   ON tod.fk_id = r.fk_otdelid
                                                INNER JOIN
                                                   (SELECT   td.fk_pacid,
                                                             td.fk_id,
                                                             td.fk_smdiagid,
                                                             td.fl_first,
                                                             LAST_VALUE(td.fk_id)
                                                                OVER (
                                                                   PARTITION BY td.fk_pacid
                                                                   ORDER BY
                                                                      td.fd_date
                                                                   ROWS BETWEEN UNBOUNDED PRECEDING
                                                                   AND     UNBOUNDED FOLLOWING
                                                                )
                                                                fk_diag_last
                                                      FROM   asu.tdiag td
                                                     WHERE   td.fl_main =
                                                                STAT.PKG_STATUTIL.get_smidid('MAIN')
                                                             AND td.fp_type =
                                                                   STAT.PKG_STATUTIL.get_smidid('PRI_VYPISKE'))
                                                   td
                                                ON td.fk_pacid = tk.fk_id
                                                   AND td.fk_id =
                                                         td.fk_diag_last
                                             INNER JOIN
                                                asu.tsmid tsd
                                             ON tsd.fk_id = td.fk_smdiagid
                                          -- из страховых данных можно получить данные о том является местным или нет. Для местных и не местных разные тарифы
                                          LEFT JOIN
                                             ASU.TPAC_INSURANCE PI
                                          ON PI.FK_PACID = tp.fk_pacid
                                       LEFT JOIN
                                          ASU.TINSURDOCS I
                                       ON I.FK_ID = PI.FK_INSURDOCID       --!
                                    LEFT JOIN
                                       (SELECT   *
                                          FROM   asu.TCOMPANY
                                         WHERE   fl_del = 0) C
                                    ON C.FK_ID = I.FK_COMPANYID            --!
                                 LEFT JOIN
                                    asu.ttypedoc d
                                 ON d.fk_id = i.fk_typedocid               --!
                              -- возраст, т.е. данные о том является совершеннолетним или нет. Для взрослых и детей разные тарифы
                              --           INNER join (select rownum RN, case when rownum < 18 then 1 else 0 end fl_under18  from (select 1 from dual GROUP BY CUBE(1, 1, 1, 1, 1, 1, 1, 1))) tu18 ON tu18.rn = TRUNC(MONTHS_BETWEEN(tp.fd_data1, tk.fd_rojd) / 12)
                              INNER JOIN
                                 (SELECT   ROWNUM - 1 RN,
                                           CASE
                                              WHEN ROWNUM - 1 < 18 THEN 1
                                              ELSE 0
                                           END
                                              fl_under18
                                    FROM   (  SELECT   1
                                                FROM   DUAL
                                            GROUP BY   CUBE (1,
                                                             1,
                                                             1,
                                                             1,
                                                             1,
                                                             1,
                                                             1,
                                                             1))) tu18
                              ON tu18.rn =
                                    TRUNC(MONTHS_BETWEEN (tp.fd_data1,
                                                          tk.fd_rojd)
                                          / 12)
                           -- дневной стационар. Для дневного и обычного стационара разные тарифы
                           LEFT JOIN
                              (    SELECT   tu.FK_ID
                                     FROM   ASU.TUSLVID tu
                               CONNECT BY   PRIOR tu.FK_ID = tu.FK_OWNERID
                               START WITH   tu.FK_ID = ASU.DOC_IB_DSROOT) tu_ds
                           ON tu_ds.fk_id = tk.fk_uslvidid                 --!
                        -- лопределение тарифа в зависимости от диагноза, даты начала и окончания случая и дополнительных параметров, влияющих на код тарифа
                        LEFT JOIN
                           (  SELECT   icd.fc_kod,
                                       s.fc_code,
                                       MAX (SC.FN_COST) FN_COST,
                                       SC.FD_DATE1,
                                       SC.FD_DATE2,
                                       tsr.Code,
                                       DECODE (
                                          SUBSTR (tsr.Code,
                                                  LENGTH (tsr.Code) - 3,
                                                  LENGTH (tsr.Code)),
                                          'OWN2',
                                          2,
                                          1
                                       )
                                          own
                                FROM               asu.Tstandart s
                                                INNER JOIN
                                                   asu.Tstandart_icd10 i
                                                ON I.FK_STANDART = S.FK_ID
                                             INNER JOIN
                                                asu.Ticd10 icd
                                             ON icd.fk_id = i.fk_icd10
                                          INNER JOIN
                                             asu.TSTANDART_COST SC
                                          ON SC.FK_STANDARTID = S.FK_ID
                                       INNER JOIN
                                          asu.tstandart_razdel tsr
                                       ON tsr.fk_id = s.fk_razdel
                               WHERE   tsr.fc_synonym LIKE ('KSG%')
                                       AND SC.FN_COST > 0
                            GROUP BY   icd.fc_kod,
                                       SC.FD_DATE1,
                                       SC.FD_DATE2,
                                       tsr.Code,
                                       s.fc_code,
                                       tsr.fc_synonym) s
                        ON s.fc_kod = tsd.fk_mkb10 -- На этом этапе tu.KOD_EO это диагноз относящийся к переводу
                           AND tp.fd_data2 BETWEEN s.FD_DATE1
                                               AND  NVL (s.FD_DATE2,
                                                         tp.fd_data2)
                           AND s.Fc_Code LIKE
                                    'G.%.'
                                 || -- Первая цифра после G определяет тип КСГ (1, 2, 3А и 3В), сейчас всегда 1
                                   tsd.fk_mkb9
                                 || '.'
                                 || -- Класс болезней по МКБ-10 (римские цифры)
                                   '%'
                                 || -- уровень МО (1- первый, 2 – второй), считатется что может быть любым, так как на самом деле это определяется в момент заливки тарифов
                                   DECODE (tu_ds.fk_id, NULL, '1', '2')
                                 || '.'
                                 || -- условия оказания медицинской помощи (1- стационар, 2 - дневной стационар)
                                   DECODE (tu18.fl_under18, 1, '1', '2')
                                 || -- возрастная категория (1 –дети, 2 – взрослые);
 --                                                                                                                decode(toper.fk_pacid, null, '2', '1') || '.' || -- метод лечения (1 – оперативный, 2 – консервативный)
                                  DECODE (
                                     ASU.GET_IS_OPER_IN_TIME (
                                        tp.fk_pacid,
                                        ASU.PKG_REGIST_PACFUNC.GET_PAC_INCOME(tk.FK_ID),
                                        ASU.PKG_REGIST_PACFUNC.GET_PAC_OUTCOME(tk.FK_ID)
                                     ),
                                     1,
                                     '1',
                                     '2'
                                  )
                                 || '.'
                                 || -- метод лечения (1 – оперативный, 2 – консервативный)
                                   DECODE (tp.fk_koykavidid,
                                           asu.get_tiproom_hemodial, '12',
                                           '%')            -- номер по порядку
                                               ) t
      WHERE   t.fk_peresel_last = t.fk_peresel
   GROUP BY   t.fk_id,
              t.pr_own,
              t.fk_otdelid,
              t.fd_data1,
              t.fd_data2,
              t.fk_pacid,
              t.fk_peplid                           --) where fk_id = 94795319
/


