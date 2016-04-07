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
(������, �����������, �����������, ������, "�.�.�. ���.",
 FK_PACID, FK_SMID, "���-�� ������", "������ ����������", "���� 1 ��",
 FK_PEPLID, "�����. ����.", "����� ������", "���-�� � �������",
      "���-�� ������.",
 "���-�� ����� ���.", "����� ��", "����� �����", FL_VYB)
AS

SELECT   fc_usluga AS "������",
         ispol AS "�����������",
         naznvr AS "�����������",
         f�_nazsos AS "������",
         fc_fio AS "�.�.�. ���.",
         fk_pacid,
         fk_smid,
         fn_ed AS "���-�� ������",
         DECODE (fl_vyb,
                 0,
                 '���������',
                 1,
                 '�������')
            AS "������ ����������",
         fn_price AS "���� 1 ��",
         fk_peplid,
         fc_company AS "�����. ����.",
         fc_num AS "����� ������",
         pCount AS "���-�� � �������",
         total_count AS "���-�� ������.",
         biger_norm AS "���-�� ����� ���.",
         (biger_norm * fn_ed) AS "����� ��",
         (biger_norm * fn_ed * fn_price) AS "����� �����",
         fl_vyb
  FROM   (SELECT   fc_usluga,
                   ispol,
                   naznvr,
                   f�_nazsos,
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
                               f�_nazsos,
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
                                         f�_nazsos,
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
                                                   f�_nazsos,
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
                                                             f�_nazsos,
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
                                                                          '���.'
      ,
                                                                          2,
                                                                          '�� ���.'
      ,
                                                                          4,
                                                                          '���-��'
      ,
                                                                          23,
                                                                          '�����.'
      ,
                                                                          3,
                                                                          '����.'
      ,
                                                                          89,
                                                                          '���-��'
      ,
                                                                          '������'
                                                                       )
                                                                          AS
      f�_nazsos,
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
                               f�_nazsos,
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


