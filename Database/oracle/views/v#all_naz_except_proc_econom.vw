DROP VIEW ASU.V#ALL_NAZ_EXCEPT_PROC_ECONOM
/

/* Formatted on 06.04.2016 15:19:02 (QP5 v5.115.810.9015) */
--
-- V#ALL_NAZ_EXCEPT_PROC_ECONOM  (View)
--
--  Dependencies:
--   TINSURANCE (Table)
--   TSMID (Table)
--   PKG_NAZ (Package)
--   GET_FIO (Function)
--   GET_FULLESTPATH (Function)
--   GET_PROCID (Function)
--   DO_VRACHFIO (Function)
--   TKARTA (Table)
--   VNAZ (Table)
--
CREATE OR REPLACE FORCE VIEW ASU.V#ALL_NAZ_EXCEPT_PROC_ECONOM
(Услуга, Исполнитель, Назначивший, Статус, "Ф.И.О. пац.",
 FK_PACID, FK_SMID, "Кол-во едениц", "Статус проживания", "Цена 1 УЕ",
 FK_PEPLID, "Страх. комп.", "Номер полиса", "Кол-во в путевке",
      "Кол-во назнач.",
 "Кол-во сверх пут.", "Итого УЕ", "Итого сумма", FL_VYB)
AS

SELECT   fc_usluga AS "Услуга",
         ispol AS "Исполнитель",
         naznvr AS "Назначивший",
         fс_nazsos AS "Статус",
         fc_fio AS "Ф.И.О. пац.",
         fk_pacid,
         fk_smid,
         fn_ed AS "Кол-во едениц",
         DECODE (fl_vyb,
                 0,
                 'Проживает',
                 1,
                 'Выписан')
            AS "Статус проживания",
         fn_price AS "Цена 1 УЕ",
         fk_peplid,
         fc_company AS "Страх. комп.",
         fc_num AS "Номер полиса",
         pCount AS "Кол-во в путевке",
         total_count AS "Кол-во назнач.",
         biger_norm AS "Кол-во сверх пут.",
         (biger_norm * fn_ed) AS "Итого УЕ",
         (biger_norm * fn_ed * fn_price) AS "Итого сумма",
         fl_vyb
  FROM   (SELECT   fc_usluga,
                   ispol,
                   naznvr,
                   fс_nazsos,
                   fc_fio,
                   fk_pacid,
                   fk_smid,
                   fn_ed,
                   fn_price,
                   fk_peplid,
                   fc_company,
                   fc_num,
                   pCount,
                   total_count,
                   total_count - pcount AS biger_norm,
                   fl_vyb
            FROM   (  SELECT   fc_usluga,
                               ispol,
                               naznvr,
                               fс_nazsos,
                               fc_fio,
                               fk_pacid,
                               fk_smid,
                               fn_ed,
                               fn_price,
                               fk_peplid,
                               fc_company,
                               fc_num,
                               pCount,
                               COUNT (fk_smid) AS total_count,
                               fl_vyb
                        FROM   (SELECT                              /*+ rule*/
                                      fc_usluga,
                                         ispol,
                                         naznvr,
                                         fс_nazsos,
                                         fc_fio,
                                         fk_pacid,
                                         fk_smid,
                                         fn_ed,
                                         fn_price,
                                         a.fk_peplid,
                                         pkg_naz.get_company (fk_companyid)
                                            AS fc_company,
                                         fc_num,
                                         pCount,
                                         fl_vyb
                                  FROM   tinsurance,
                                         (SELECT                    /*+ rule*/
                                                fc_usluga,
                                                   ispol,
                                                   naznvr,
                                                   fс_nazsos,
                                                   fc_fio,
                                                   fk_pacid,
                                                   fk_smid,
                                                   fn_ed,
                                                   fn_price,
                                                   fk_peplid,
                                                   pCount,
                                                   fl_vyb
                                            FROM   tkarta,
                                                   (SELECT          /*+ rule*/
                                                          fc_usluga,
                                                             ispol,
                                                             naznvr,
                                                             fс_nazsos,
                                                             fc_fio,
                                                             fk_pacid,
                                                             fk_smid,
                                                             NVL (tsmid.fn_ed,
                                                                  0)
                                                                AS fn_ed,
                                                             NVL (
                                                                tsmid.fn_price
      ,
                                                                0
                                                             )
                                                                AS fn_price,
                                                             NVL (fk_default,
                                                                  0)
                                                                AS pCount
                                                      FROM   tsmid,
                                                             (SELECT
      /*+ rule*/
                                                                    get_fullestpath
      (fk_smid)
                                                                          AS
      fc_usluga,
                                                                       INITCAP
      (do_vrachfio(fk_ispolid))
                                                                          AS
      ispol,
                                                                       INITCAP
      (do_vrachfio(fk_vrachid))
                                                                          AS
      naznvr,
                                                                       DECODE
      (
                                                                          fk_nazsosid
      ,
                                                                          1,
                                                                          'Вып.'
      ,
                                                                          2,
                                                                          'Не вып.'
      ,
                                                                          4,
                                                                          'Вып-ся'
      ,
                                                                          23,
                                                                          'Отмен.'
      ,
                                                                          3,
                                                                          'Неяв.'
      ,
                                                                          89,
                                                                          'Рек-но'
      ,
                                                                          'Ошибка'
                                                                       )
                                                                          AS
      fс_nazsos,
                                                                       INITCAP
      (get_fio(fk_pacid))
                                                                          AS
      fc_fio,
                                                                       fk_pacid
      ,
                                                                       fk_smid
                                                                FROM   vnaz
                                                               WHERE   fk_smid
      NOT IN
                                                                             (
      SELECT /*+ rule*/
                                                                                        fk_id
                                                                                    FROM
      tsmid
                                                                              START
      WITH   fk_id =
                                                                                              get_procid
                                                                              CONNECT
      BY   PRIOR fk_id =
                                                                                              fk_owner
      ))
                                                     WHERE   tsmid.fk_id =
                                                                fk_smid
                                                             AND tsmid.
      fl_usluga =
                                                                   1)
                                           WHERE   tkarta.fk_id = fk_pacid) a
                                 WHERE   tinsurance.fk_peplid = a.fk_peplid
                                         AND tinsurance.fl_old = 0)
                    GROUP BY   fc_usluga,
                               ispol,
                               naznvr,
                               fl_vyb,
                               fс_nazsos,
                               fc_fio,
                               fk_pacid,
                               fk_smid,
                               fn_ed,
                               fn_price,
                               fk_peplid,
                               fc_company,
                               fc_num,
                               pCount)
           WHERE   total_count > pCount)
/


