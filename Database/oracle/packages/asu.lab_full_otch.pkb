DROP PACKAGE BODY ASU.LAB_FULL_OTCH
/

--
-- LAB_FULL_OTCH  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."LAB_FULL_OTCH" 
IS
  /*2005/05/30 12:48 Vint*/
  TYPE ct_line IS TABLE OF INTEGER
    INDEX BY BINARY_INTEGER;

  TYPE ct_otdel_name IS TABLE OF VARCHAR2 (500)
    INDEX BY BINARY_INTEGER;

  pct_year ct_year := ct_year ();   --Массив лет за которые предстоит собирать отчет

  FUNCTION get_report (pfn_year IN NUMBER, pfn_count IN NUMBER)
    RETURN NUMBER
  IS
    pb_result CLOB;   --Временный клоб в который все будет складываться
    pn_result NUMBER;   --Идентификатор из TCLOBS
    pc_str VARCHAR2 (32000);   /*Переменная в которую будут собираться
                               данные до вставки во временный CLOB*/
    pd_dateb DATE;   --Дата начала сборки
    pd_datee DATE;   --Дата окончания сборки
    pc_str_razd VARCHAR2 (32000) DEFAULT '';                                           /*Переменная в которую будут собираться
                                               данные для отделов и потом присовокупяться к строке pc_str*/
    i NUMBER;   --вспомогательная переменная
    pn_number NUMBER DEFAULT 1;   --Счетчик для номера
    pc_strout VARCHAR2 (255);   -- Выводимые данные пока собираеться отчет
    pn_dop NUMBER;   --Пееременная куда складываються промежуточные вычисления для облегчения понимания кода
    pn_otdel_count NUMBER;   -- Количество отделов
    pn_row_count NUMBER;   --Длинна масива которая складываеться из произведения количества отделов, количесва лет и 6 столбцов в каждом годе
    pct_line ct_line;   --массив значений из запроса для некоторых запросов результаты которых не требуються в последствии
    pct_issl ct_line;   --массив значений для исследований
    pct_out ct_line;   --массив значений для выписанных
    pct_obs_pac ct_line;   --массив значений для обследованных пациентов
    pct_patology ct_line;   --массив значений для обследованных пациентов с выявленной патологией
    pct_povtor_obsl ct_line;   --массив значений для повторно обследованных пациентов
    pct_povt_pat ct_line;   --массив значений для повторно обследованных пациентов c патологией
    pct_pat_res ct_line;   --Количество патологических результатов
    pct_pac_without ct_line;   --ЛИц обследованных по категории без направления
    pct_issl_without ct_line;   --Исследований для лиц по категории без направления
    pct_name ct_otdel_name;   --массив названий отделов

    CURSOR c_otdel
    IS
      SELECT     fc_name
            FROM tsmid
           WHERE LEVEL = 2
      START WITH fc_synonim LIKE 'RAZ_ANAL'
      CONNECT BY PRIOR fk_id = fk_owner
        ORDER BY fk_id;

    CURSOR c_out (pfd_dateb DATE, pfd_datee DATE)   --Количество выписанных
    IS
      SELECT   SUM (fn_count) fn_count
          FROM (SELECT *
                  FROM (SELECT   COUNT (*) fn_count, fk_townid, fn_age, fd_year
                            FROM (SELECT t.fk_id,
                                         DECODE (TRUNC ((MONTHS_BETWEEN (TRUNC (tp.fd_date_in), t.fd_rojd) / 12)
                                                        / pkg_core.get_constbyname ('CHILD_AGE')),
                                                 0, 2,
                                                 t.fp_sex) fn_age,   --Получаем 2 если человеку меньше pkg_core.get_constbyname('CHILD_AGE') и пол если больше
                                         DECODE (ta.fk_townid, 101632, 1, 0) AS fk_townid,
                                         TO_CHAR (ts.fd_data1, 'yyyy') fd_year
                                    FROM tsroky ts, tkarta t, tadress ta, (SELECT fd_data1 fd_date_in, fk_pacid
                                                                             FROM tsroky
                                                                            WHERE fk_pryb = 2) tp
                                   WHERE t.fk_id = ts.fk_pacid AND tp.fk_pacid = t.fk_id AND ta.fk_pacid = t.fk_peplid
                                         AND ts.fk_pryb = 3 AND TRUNC (ts.fd_data1) BETWEEN pfd_dateb AND pfd_datee)
                        GROUP BY fd_year, fk_townid, fn_age)
                UNION
                SELECT 0, 0, 2, TO_CHAR (column_value)
                  FROM (SELECT column_value
                          FROM TABLE (CAST (pct_year AS ct_year)))
                UNION
                SELECT 0, 0, 1, TO_CHAR (column_value)
                  FROM (SELECT column_value
                          FROM TABLE (CAST (pct_year AS ct_year)))
                UNION
                SELECT 0, 0, 0, TO_CHAR (column_value)
                  FROM (SELECT column_value
                          FROM TABLE (CAST (pct_year AS ct_year)))
                UNION
                SELECT 0, 1, 2, TO_CHAR (column_value)
                  FROM (SELECT column_value
                          FROM TABLE (CAST (pct_year AS ct_year)))
                UNION
                SELECT 0, 1, 1, TO_CHAR (column_value)
                  FROM (SELECT column_value
                          FROM TABLE (CAST (pct_year AS ct_year)))
                UNION
                SELECT 0, 1, 0, TO_CHAR (column_value)
                  FROM (SELECT column_value
                          FROM TABLE (CAST (pct_year AS ct_year))))
      GROUP BY fd_year, fk_townid, fn_age
      ORDER BY fd_year, fk_townid, fn_age DESC;

    CURSOR c_obs_pac (pfd_dateb DATE, pfd_datee DATE)   --кол-во обследованных
    IS
      SELECT   /*+CHOOSE*/
               SUM (fn_count) fn_count
          FROM (SELECT   COUNT (*) fn_count, fk_townid, fn_age, fd_year, fk_otdel
                    FROM (SELECT DISTINCT t.fk_id,
                                          DECODE (TRUNC ((MONTHS_BETWEEN (TRUNC (tp.fd_date_in), t.fd_rojd) / 12)
                                                         / dd.fn_child),
                                                  0, 2,
                                                  t.fp_sex) fn_age,   --Получаем 2 если человеку меньше pkg_core.get_constbyname('CHILD_AGE') и пол если больше
                                          DECODE (ta.fk_townid, 101632, 1, 0) AS fk_townid,
                                          TO_CHAR (v.fd_ins, 'yyyy') fd_year, ss.fk_otdel
                                     FROM vresan v, tkarta t, tadress ta,
                                          (SELECT pkg_core.get_constbyname ('CHILD_AGE') fn_child
                                             FROM DUAL) dd, (SELECT fd_data1 fd_date_in, fk_pacid
                                                               FROM tsroky
                                                              WHERE fk_pryb = 2) tp,   -- 2 - Заезд
                                          (SELECT     fk_owner fk_otdel, fk_id fk_razdel
                                                 FROM tsmid
                                                WHERE LEVEL = 3 AND fl_stat = 1
                                           START WITH fc_synonim = 'RAZ_ANAL'
                                           CONNECT BY PRIOR fk_id = fk_owner) ss
                                    WHERE t.fk_id = tp.fk_pacid AND ta.fk_pacid = t.fk_peplid AND t.fk_id = v.fk_pacid
                                          AND v.fk_razdid = ss.fk_razdel AND v.fd_ins BETWEEN pfd_dateb AND pfd_datee)
                GROUP BY fk_otdel, fd_year, fk_townid, fn_age
                UNION
                SELECT   COUNT (*) fn_count, fk_townid, fn_age, fd_year, 1000000000
                    FROM (SELECT DISTINCT t.fk_id,
                                          DECODE (TRUNC ((MONTHS_BETWEEN (TRUNC (tp.fd_date_in), t.fd_rojd) / 12)
                                                         / pkg_core.get_constbyname ('CHILD_AGE')),
                                                  0, 2,
                                                  t.fp_sex) fn_age,   --Получаем 2 если человеку меньше pkg_core.get_constbyname('CHILD_AGE') и пол если больше
                                          DECODE (ta.fk_townid, 101632, 1, 0) AS fk_townid,
                                          TO_CHAR (v.fd_ins, 'yyyy') fd_year
                                     FROM vresan v, tkarta t, tadress ta, (SELECT fd_data1 fd_date_in, fk_pacid
                                                                             FROM tsroky
                                                                            WHERE fk_pryb = 2) tp,   -- 2 - Заезд
                                          (SELECT     fk_owner fk_otdel, fk_id fk_razdel
                                                 FROM tsmid
                                                WHERE LEVEL = 3 AND fl_stat = 1
                                           START WITH fc_synonim LIKE 'RAZ_ANAL'
                                           CONNECT BY PRIOR fk_id = fk_owner) ss
                                    WHERE t.fk_id = tp.fk_pacid AND ta.fk_pacid = t.fk_peplid AND t.fk_id = v.fk_pacid
                                          AND v.fk_razdid = ss.fk_razdel AND v.fd_ins BETWEEN pfd_dateb AND pfd_datee)
                GROUP BY fd_year, fk_townid, fn_age
                UNION
                SELECT 0, 0, 2, TO_CHAR (column_value), 1000000000
                  FROM (SELECT column_value
                          FROM TABLE (CAST (pct_year AS ct_year)))
                UNION
                SELECT 0, 0, 1, TO_CHAR (column_value), 1000000000
                  FROM (SELECT column_value
                          FROM TABLE (CAST (pct_year AS ct_year)))
                UNION
                SELECT 0, 0, 0, TO_CHAR (column_value), 1000000000
                  FROM (SELECT column_value
                          FROM TABLE (CAST (pct_year AS ct_year)))
                UNION
                SELECT 0, 1, 2, TO_CHAR (column_value), 1000000000
                  FROM (SELECT column_value
                          FROM TABLE (CAST (pct_year AS ct_year)))
                UNION
                SELECT 0, 1, 1, TO_CHAR (column_value), 1000000000
                  FROM (SELECT column_value
                          FROM TABLE (CAST (pct_year AS ct_year)))
                UNION
                SELECT 0, 1, 0, TO_CHAR (column_value), 1000000000
                  FROM (SELECT column_value
                          FROM TABLE (CAST (pct_year AS ct_year)))
                UNION
                SELECT 0, 0, 2, TO_CHAR (column_value), fk_otdel
                  FROM (SELECT column_value
                          FROM TABLE (CAST (pct_year AS ct_year))), (SELECT     fk_id fk_otdel
                                                                           FROM tsmid
                                                                          WHERE LEVEL = 2
                                                                     START WITH fc_synonim LIKE 'RAZ_ANAL'
                                                                     CONNECT BY PRIOR fk_id = fk_owner)
                UNION
                SELECT 0, 0, 1, TO_CHAR (column_value), fk_otdel
                  FROM (SELECT column_value
                          FROM TABLE (CAST (pct_year AS ct_year))), (SELECT     fk_id fk_otdel
                                                                           FROM tsmid
                                                                          WHERE LEVEL = 2
                                                                     START WITH fc_synonim LIKE 'RAZ_ANAL'
                                                                     CONNECT BY PRIOR fk_id = fk_owner)
                UNION
                SELECT 0, 0, 0, TO_CHAR (column_value), fk_otdel
                  FROM (SELECT column_value
                          FROM TABLE (CAST (pct_year AS ct_year))), (SELECT     fk_id fk_otdel
                                                                           FROM tsmid
                                                                          WHERE LEVEL = 2
                                                                     START WITH fc_synonim LIKE 'RAZ_ANAL'
                                                                     CONNECT BY PRIOR fk_id = fk_owner)
                UNION
                SELECT 0, 1, 2, TO_CHAR (column_value), fk_otdel
                  FROM (SELECT column_value
                          FROM TABLE (CAST (pct_year AS ct_year))), (SELECT     fk_id fk_otdel
                                                                           FROM tsmid
                                                                          WHERE LEVEL = 2
                                                                     START WITH fc_synonim LIKE 'RAZ_ANAL'
                                                                     CONNECT BY PRIOR fk_id = fk_owner)
                UNION
                SELECT 0, 1, 1, TO_CHAR (column_value), fk_otdel
                  FROM (SELECT column_value
                          FROM TABLE (CAST (pct_year AS ct_year))), (SELECT     fk_id fk_otdel
                                                                           FROM tsmid
                                                                          WHERE LEVEL = 2
                                                                     START WITH fc_synonim LIKE 'RAZ_ANAL'
                                                                     CONNECT BY PRIOR fk_id = fk_owner)
                UNION
                SELECT 0, 1, 0, TO_CHAR (column_value), fk_otdel
                  FROM (SELECT column_value
                          FROM TABLE (CAST (pct_year AS ct_year))), (SELECT     fk_id fk_otdel
                                                                           FROM tsmid
                                                                          WHERE LEVEL = 2
                                                                     START WITH fc_synonim LIKE 'RAZ_ANAL'
                                                                     CONNECT BY PRIOR fk_id = fk_owner))
      GROUP BY fk_otdel, fd_year, fk_townid, fn_age
      ORDER BY fk_otdel, fd_year, fk_townid, fn_age DESC;

    CURSOR c_issl (pd_dateb DATE, pd_datee DATE)   --Колисество исследований
    IS
      SELECT   /*+CHOOSE*/
               SUM (fn_count) fn_count
          FROM (SELECT   count(1) fn_count, fk_townid, fn_age, fd_year, fk_otdel
                    FROM (SELECT DISTINCT v.fk_smid fn_count, v.fk_id,
                                          DECODE (TRUNC ((MONTHS_BETWEEN (TRUNC (tp.fd_date_in), t.fd_rojd) / 12)
                                                         / pkg_core.get_constbyname ('CHILD_AGE')),
                                                  0, 2,
                                                  t.fp_sex) fn_age,   --Получаем 2 если человеку меньше pkg_core.get_constbyname('CHILD_AGE') и пол если больше
                                          DECODE (ta.fk_townid, 101632, 1, 0) AS fk_townid,
                                          TO_CHAR (v.fd_ins, 'yyyy') fd_year, ss.fk_otdel
                                     FROM vresan v, tkarta t, tadress ta, (SELECT fd_data1 fd_date_in, fk_pacid
                                                                             FROM tsroky
                                                                            WHERE fk_pryb = 2) tp,
                                          (SELECT DISTINCT b.fk_smid, s.fk_otdel
                                                      FROM tisslrazdrows a, tisslrazddeps b,
                                                           (SELECT     fk_owner fk_otdel, fk_id fk_razdel
                                                                  FROM tsmid
                                                                 WHERE LEVEL = 3
                                                            START WITH fc_synonim LIKE 'RAZ_ANAL'
                                                            CONNECT BY PRIOR fk_id = fk_owner) s
                                                     WHERE a.fk_smid = s.fk_razdel AND a.fk_id = b.fk_rowid) ss
                                    WHERE v.fd_ins BETWEEN pd_dateb AND pd_datee AND tp.fk_pacid = t.fk_id
                                          AND ta.fk_pacid = t.fk_peplid AND v.fk_smid = ss.fk_smid
                                          AND t.fk_id = v.fk_pacid)
                GROUP BY fk_otdel, fd_year, fn_age, fk_townid
                UNION
                SELECT 0, 0, 2, TO_CHAR (column_value), fk_otdel
                  FROM (SELECT column_value
                          FROM TABLE (CAST (pct_year AS ct_year))), (SELECT     fk_id fk_otdel
                                                                           FROM tsmid
                                                                          WHERE LEVEL = 2
                                                                     START WITH fc_synonim LIKE 'RAZ_ANAL'
                                                                     CONNECT BY PRIOR fk_id = fk_owner)
                UNION
                SELECT 0, 0, 1, TO_CHAR (column_value), fk_otdel
                  FROM (SELECT column_value
                          FROM TABLE (CAST (pct_year AS ct_year))), (SELECT     fk_id fk_otdel
                                                                           FROM tsmid
                                                                          WHERE LEVEL = 2
                                                                     START WITH fc_synonim LIKE 'RAZ_ANAL'
                                                                     CONNECT BY PRIOR fk_id = fk_owner)
                UNION
                SELECT 0, 0, 0, TO_CHAR (column_value), fk_otdel
                  FROM (SELECT column_value
                          FROM TABLE (CAST (pct_year AS ct_year))), (SELECT     fk_id fk_otdel
                                                                           FROM tsmid
                                                                          WHERE LEVEL = 2
                                                                     START WITH fc_synonim LIKE 'RAZ_ANAL'
                                                                     CONNECT BY PRIOR fk_id = fk_owner)
                UNION
                SELECT 0, 1, 2, TO_CHAR (column_value), fk_otdel
                  FROM (SELECT column_value
                          FROM TABLE (CAST (pct_year AS ct_year))), (SELECT     fk_id fk_otdel
                                                                           FROM tsmid
                                                                          WHERE LEVEL = 2
                                                                     START WITH fc_synonim LIKE 'RAZ_ANAL'
                                                                     CONNECT BY PRIOR fk_id = fk_owner)
                UNION
                SELECT 0, 1, 1, TO_CHAR (column_value), fk_otdel
                  FROM (SELECT column_value
                          FROM TABLE (CAST (pct_year AS ct_year))), (SELECT     fk_id fk_otdel
                                                                           FROM tsmid
                                                                          WHERE LEVEL = 2
                                                                     START WITH fc_synonim LIKE 'RAZ_ANAL'
                                                                     CONNECT BY PRIOR fk_id = fk_owner)
                UNION
                SELECT 0, 1, 0, TO_CHAR (column_value), fk_otdel
                  FROM (SELECT column_value
                          FROM TABLE (CAST (pct_year AS ct_year))), (SELECT     fk_id fk_otdel
                                                                           FROM tsmid
                                                                          WHERE LEVEL = 2
                                                                     START WITH fc_synonim LIKE 'RAZ_ANAL'
                                                                     CONNECT BY PRIOR fk_id = fk_owner))
      GROUP BY fk_otdel, fd_year, fk_townid, fn_age
      ORDER BY fk_otdel, fd_year, fk_townid, fn_age DESC;

    CURSOR c_patology (pd_dateb DATE, pd_datee DATE)   --Количество патологий
    IS
      SELECT   /*+CHOOSE*/
               SUM (fn_count) fn_count
          FROM (SELECT   COUNT (*) fn_count, fk_townid, fn_age, fd_year, fk_otdel
                    FROM (SELECT DISTINCT t.fk_id,
                                          DECODE (TRUNC ((MONTHS_BETWEEN (TRUNC (tp.fd_date_in), t.fd_rojd) / 12)
                                                         / dd.fn_child),
                                                  0, 2,
                                                  t.fp_sex) fn_age,   --Получаем 2 если человеку меньше pkg_core.get_constbyname('CHILD_AGE') и пол если больше
                                          DECODE (ta.fk_townid, 101632, 1, 0) AS fk_townid,
                                          TO_CHAR (tr.fd_ins, 'yyyy') fd_year, fk_otdel
                                     FROM vresan tr, tkarta t, tadress ta,
                                          (SELECT pkg_core.get_constbyname ('CHILD_AGE') fn_child
                                             FROM DUAL) dd, (SELECT fd_data1 fd_date_in, fk_pacid
                                                               FROM tsroky
                                                              WHERE fk_pryb = 2) tp,
                                          (SELECT     fk_owner fk_otdel, fk_id fk_razdel
                                                 FROM tsmid
                                                WHERE LEVEL = 3 AND fl_stat = 1
                                           START WITH fc_synonim LIKE 'RAZ_ANAL'
                                           CONNECT BY PRIOR fk_id = fk_owner) ss
                                    WHERE tr.fk_patid > 0 AND tr.fd_ins BETWEEN pd_dateb AND pd_datee
                                          AND tr.fk_razdid = ss.fk_razdel AND tp.fk_pacid = t.fk_id
                                          AND ta.fk_pacid = t.fk_peplid AND t.fk_id = tr.fk_pacid)
                GROUP BY fk_otdel, fd_year, fk_townid, fn_age
                UNION
                SELECT   COUNT (*) fn_count, fk_townid, fn_age, fd_year, 1000000000
                    FROM (SELECT DISTINCT t.fk_id,
                                          DECODE (TRUNC ((MONTHS_BETWEEN (TRUNC (tp.fd_date_in), t.fd_rojd) / 12)
                                                         / pkg_core.get_constbyname ('CHILD_AGE')),
                                                  0, 2,
                                                  t.fp_sex) fn_age,   --Получаем 2 если человеку меньше pkg_core.get_constbyname('CHILD_AGE') и пол если больше
                                          DECODE (ta.fk_townid, 101632, 1, 0) AS fk_townid,
                                          TO_CHAR (tr.fd_ins, 'yyyy') fd_year
                                     FROM vresan tr, tkarta t, tadress ta, (SELECT fd_data1 fd_date_in, fk_pacid
                                                                              FROM tsroky
                                                                             WHERE fk_pryb = 2) tp,
                                          (SELECT     fk_owner fk_otdel, fk_id fk_razdel
                                                 FROM tsmid
                                                WHERE LEVEL = 3 AND fl_stat = 1
                                           START WITH fc_synonim LIKE 'RAZ_ANAL'
                                           CONNECT BY PRIOR fk_id = fk_owner) ss
                                    WHERE tr.fk_patid > 0 AND tr.fd_ins BETWEEN pd_dateb AND pd_datee
                                          AND tr.fk_razdid = ss.fk_razdel AND tp.fk_pacid = t.fk_id
                                          AND ta.fk_pacid = t.fk_peplid AND t.fk_id = tr.fk_pacid)
                GROUP BY fd_year, fk_townid, fn_age
                UNION
                SELECT 0, 0, 2, TO_CHAR (column_value), 1000000000
                  FROM (SELECT column_value
                          FROM TABLE (CAST (pct_year AS ct_year)))
                UNION
                SELECT 0, 0, 1, TO_CHAR (column_value), 1000000000
                  FROM (SELECT column_value
                          FROM TABLE (CAST (pct_year AS ct_year)))
                UNION
                SELECT 0, 0, 0, TO_CHAR (column_value), 1000000000
                  FROM (SELECT column_value
                          FROM TABLE (CAST (pct_year AS ct_year)))
                UNION
                SELECT 0, 1, 2, TO_CHAR (column_value), 1000000000
                  FROM (SELECT column_value
                          FROM TABLE (CAST (pct_year AS ct_year)))
                UNION
                SELECT 0, 1, 1, TO_CHAR (column_value), 1000000000
                  FROM (SELECT column_value
                          FROM TABLE (CAST (pct_year AS ct_year)))
                UNION
                SELECT 0, 1, 0, TO_CHAR (column_value), 1000000000
                  FROM (SELECT column_value
                          FROM TABLE (CAST (pct_year AS ct_year)))
                UNION
                SELECT 0, 0, 2, TO_CHAR (column_value), fk_otdel
                  FROM (SELECT column_value
                          FROM TABLE (CAST (pct_year AS ct_year))), (SELECT     fk_id fk_otdel
                                                                           FROM tsmid
                                                                          WHERE LEVEL = 2
                                                                     START WITH fc_synonim LIKE 'RAZ_ANAL'
                                                                     CONNECT BY PRIOR fk_id = fk_owner)
                UNION
                SELECT 0, 0, 1, TO_CHAR (column_value), fk_otdel
                  FROM (SELECT column_value
                          FROM TABLE (CAST (pct_year AS ct_year))), (SELECT     fk_id fk_otdel
                                                                           FROM tsmid
                                                                          WHERE LEVEL = 2
                                                                     START WITH fc_synonim LIKE 'RAZ_ANAL'
                                                                     CONNECT BY PRIOR fk_id = fk_owner)
                UNION
                SELECT 0, 0, 0, TO_CHAR (column_value), fk_otdel
                  FROM (SELECT column_value
                          FROM TABLE (CAST (pct_year AS ct_year))), (SELECT     fk_id fk_otdel
                                                                           FROM tsmid
                                                                          WHERE LEVEL = 2
                                                                     START WITH fc_synonim LIKE 'RAZ_ANAL'
                                                                     CONNECT BY PRIOR fk_id = fk_owner)
                UNION
                SELECT 0, 1, 2, TO_CHAR (column_value), fk_otdel
                  FROM (SELECT column_value
                          FROM TABLE (CAST (pct_year AS ct_year))), (SELECT     fk_id fk_otdel
                                                                           FROM tsmid
                                                                          WHERE LEVEL = 2
                                                                     START WITH fc_synonim LIKE 'RAZ_ANAL'
                                                                     CONNECT BY PRIOR fk_id = fk_owner)
                UNION
                SELECT 0, 1, 1, TO_CHAR (column_value), fk_otdel
                  FROM (SELECT column_value
                          FROM TABLE (CAST (pct_year AS ct_year))), (SELECT     fk_id fk_otdel
                                                                           FROM tsmid
                                                                          WHERE LEVEL = 2
                                                                     START WITH fc_synonim LIKE 'RAZ_ANAL'
                                                                     CONNECT BY PRIOR fk_id = fk_owner)
                UNION
                SELECT 0, 1, 0, TO_CHAR (column_value), fk_otdel
                  FROM (SELECT column_value
                          FROM TABLE (CAST (pct_year AS ct_year))), (SELECT     fk_id fk_otdel
                                                                           FROM tsmid
                                                                          WHERE LEVEL = 2
                                                                     START WITH fc_synonim LIKE 'RAZ_ANAL'
                                                                     CONNECT BY PRIOR fk_id = fk_owner))
      GROUP BY fk_otdel, fd_year, fk_townid, fn_age
      ORDER BY fk_otdel, fd_year, fk_townid, fn_age DESC;

    CURSOR c_povtor_obsl (pfd_dateb DATE, pfd_datee DATE)   --Количество повторно обследованных
    IS
      SELECT   /*+CHOOSE*/
               SUM (fn_count) fn_count
          FROM (SELECT   /*+CHOOSE*/
                         COUNT (1) fn_count, fk_townid, fn_age, fd_year, fk_otdel
                    FROM (SELECT DISTINCT t.fk_id,
                                          DECODE (TRUNC ((MONTHS_BETWEEN (TRUNC (tp.fd_date_in), t.fd_rojd) / 12)
                                                         / dd.fn_child),
                                                  0, 2,
                                                  t.fp_sex) fn_age,   --Получаем 2 если человеку меньше pkg_core.get_constbyname('CHILD_AGE') и пол если больше
                                          DECODE (ta.fk_townid, 101632, 1, 0) AS fk_townid,
                                          TO_CHAR (v.fd_ins, 'yyyy') fd_year, fk_otdel
                                     FROM vresan v, tkarta t, tadress ta,
                                          (SELECT pkg_core.get_constbyname ('CHILD_AGE') fn_child
                                             FROM DUAL) dd, (SELECT fd_data1 fd_date_in, fk_pacid
                                                               FROM tsroky
                                                              WHERE fk_pryb = 2) tp,
                                          (SELECT DISTINCT fk_pacid fk_vpacid, fd_ins fd_vrun
                                                      FROM vresan
                                                     WHERE fd_ins BETWEEN pfd_dateb AND pfd_datee AND fl_amb = 0
                                                           AND fk_razdid IN (SELECT     fk_id
                                                                                   FROM tsmid
                                                                                  WHERE LEVEL = 3 AND fl_stat = 1
                                                                             START WITH fc_synonim LIKE 'RAZ_ANAL'
                                                                             CONNECT BY PRIOR fk_id = fk_owner)) vv,
                                          (SELECT     fk_owner fk_otdel, fk_id fk_razdel
                                                 FROM tsmid
                                                WHERE LEVEL = 3 AND fl_stat = 1
                                           START WITH fc_synonim LIKE 'RAZ_ANAL'
                                           CONNECT BY PRIOR fk_id = fk_owner) ss
                                    WHERE t.fk_id = v.fk_pacid AND v.fk_pacid = vv.fk_vpacid
                                          AND v.fd_ins BETWEEN TO_DATE ('1.01' || TO_CHAR (vv.fd_vrun, 'yyyy'),
                                                                        'dd.mm.yyyy')
                                                           AND vv.fd_vrun
                                          AND tp.fk_pacid = t.fk_id AND v.fk_razdid = ss.fk_razdel
                                          AND ta.fk_pacid = t.fk_peplid
                                 GROUP BY fk_otdel, TO_CHAR (v.fd_ins, 'yyyy'), t.fk_id, v.fk_smid,
                                          DECODE (TRUNC ((MONTHS_BETWEEN (TRUNC (tp.fd_date_in), t.fd_rojd) / 12)
                                                         / dd.fn_child),
                                                  0, 2,
                                                  t.fp_sex),
                                          DECODE (ta.fk_townid, 101632, 1, 0)
                                   HAVING COUNT (1) > 1)
                GROUP BY fk_otdel, fd_year, fk_townid, fn_age
                UNION
                SELECT   /*+CHOOSE*/
                         COUNT (1) fn_count, fk_townid, fn_age, fd_year, 1000000000
                    FROM (SELECT DISTINCT t.fk_id,
                                          DECODE (TRUNC ((MONTHS_BETWEEN (TRUNC (tp.fd_date_in), t.fd_rojd) / 12)
                                                         / dd.fn_child),
                                                  0, 2,
                                                  t.fp_sex) fn_age,   --Получаем 2 если человеку меньше pkg_core.get_constbyname('CHILD_AGE') и пол если больше
                                          DECODE (ta.fk_townid, 101632, 1, 0) AS fk_townid,
                                          TO_CHAR (v.fd_ins, 'yyyy') fd_year
                                     FROM vresan v, tkarta t, tadress ta,
                                          (SELECT pkg_core.get_constbyname ('CHILD_AGE') fn_child
                                             FROM DUAL) dd,
                                          (SELECT DISTINCT fk_pacid fk_vpacid, fd_ins fd_vrun
                                                      FROM vresan
                                                     WHERE fd_ins BETWEEN pfd_dateb AND pfd_datee AND fl_amb = 0
                                                           AND fk_razdid IN (SELECT     fk_id
                                                                                   FROM tsmid
                                                                                  WHERE LEVEL = 3 AND fl_stat = 1
                                                                             START WITH fc_synonim LIKE 'RAZ_ANAL'
                                                                             CONNECT BY PRIOR fk_id = fk_owner)) vv,
                                          (SELECT fd_data1 fd_date_in, fk_pacid
                                             FROM tsroky
                                            WHERE fk_pryb = 2) tp, (SELECT     fk_owner fk_otdel, fk_id fk_razdel
                                                                          FROM tsmid
                                                                         WHERE LEVEL = 3
                                                                    START WITH fc_synonim LIKE 'RAZ_ANAL'
                                                                    CONNECT BY PRIOR fk_id = fk_owner) ss
                                    WHERE t.fk_id = v.fk_pacid AND v.fk_pacid = vv.fk_vpacid
                                          AND v.fd_ins BETWEEN TO_DATE ('1.01' || TO_CHAR (vv.fd_vrun, 'yyyy'),
                                                                        'dd.mm.yyyy')
                                                           AND vv.fd_vrun
                                          AND tp.fk_pacid = t.fk_id AND v.fk_razdid = ss.fk_razdel
                                          AND ta.fk_pacid = t.fk_peplid
                                 GROUP BY fk_otdel, TO_CHAR (v.fd_ins, 'yyyy'), t.fk_id, v.fk_smid,
                                          DECODE (TRUNC ((MONTHS_BETWEEN (TRUNC (tp.fd_date_in), t.fd_rojd) / 12)
                                                         / dd.fn_child),
                                                  0, 2,
                                                  t.fp_sex),
                                          DECODE (ta.fk_townid, 101632, 1, 0)
                                   HAVING COUNT (1) > 1)
                GROUP BY fd_year, fk_townid, fn_age
                UNION
                SELECT 0, 0, 2, TO_CHAR (column_value), 1000000000
                  FROM (SELECT column_value
                          FROM TABLE (CAST (pct_year AS ct_year)))
                UNION
                SELECT 0, 0, 1, TO_CHAR (column_value), 1000000000
                  FROM (SELECT column_value
                          FROM TABLE (CAST (pct_year AS ct_year)))
                UNION
                SELECT 0, 0, 0, TO_CHAR (column_value), 1000000000
                  FROM (SELECT column_value
                          FROM TABLE (CAST (pct_year AS ct_year)))
                UNION
                SELECT 0, 1, 2, TO_CHAR (column_value), 1000000000
                  FROM (SELECT column_value
                          FROM TABLE (CAST (pct_year AS ct_year)))
                UNION
                SELECT 0, 1, 1, TO_CHAR (column_value), 1000000000
                  FROM (SELECT column_value
                          FROM TABLE (CAST (pct_year AS ct_year)))
                UNION
                SELECT 0, 1, 0, TO_CHAR (column_value), 1000000000
                  FROM (SELECT column_value
                          FROM TABLE (CAST (pct_year AS ct_year)))
                UNION
                SELECT 0, 0, 2, TO_CHAR (column_value), fk_otdel
                  FROM (SELECT column_value
                          FROM TABLE (CAST (pct_year AS ct_year))), (SELECT     fk_id fk_otdel
                                                                           FROM tsmid
                                                                          WHERE LEVEL = 2
                                                                     START WITH fc_synonim LIKE 'RAZ_ANAL'
                                                                     CONNECT BY PRIOR fk_id = fk_owner)
                UNION
                SELECT 0, 0, 1, TO_CHAR (column_value), fk_otdel
                  FROM (SELECT column_value
                          FROM TABLE (CAST (pct_year AS ct_year))), (SELECT     fk_id fk_otdel
                                                                           FROM tsmid
                                                                          WHERE LEVEL = 2
                                                                     START WITH fc_synonim LIKE 'RAZ_ANAL'
                                                                     CONNECT BY PRIOR fk_id = fk_owner)
                UNION
                SELECT 0, 0, 0, TO_CHAR (column_value), fk_otdel
                  FROM (SELECT column_value
                          FROM TABLE (CAST (pct_year AS ct_year))), (SELECT     fk_id fk_otdel
                                                                           FROM tsmid
                                                                          WHERE LEVEL = 2
                                                                     START WITH fc_synonim LIKE 'RAZ_ANAL'
                                                                     CONNECT BY PRIOR fk_id = fk_owner)
                UNION
                SELECT 0, 1, 2, TO_CHAR (column_value), fk_otdel
                  FROM (SELECT column_value
                          FROM TABLE (CAST (pct_year AS ct_year))), (SELECT     fk_id fk_otdel
                                                                           FROM tsmid
                                                                          WHERE LEVEL = 2
                                                                     START WITH fc_synonim LIKE 'RAZ_ANAL'
                                                                     CONNECT BY PRIOR fk_id = fk_owner)
                UNION
                SELECT 0, 1, 1, TO_CHAR (column_value), fk_otdel
                  FROM (SELECT column_value
                          FROM TABLE (CAST (pct_year AS ct_year))), (SELECT     fk_id fk_otdel
                                                                           FROM tsmid
                                                                          WHERE LEVEL = 2
                                                                     START WITH fc_synonim LIKE 'RAZ_ANAL'
                                                                     CONNECT BY PRIOR fk_id = fk_owner)
                UNION
                SELECT 0, 1, 0, TO_CHAR (column_value), fk_otdel
                  FROM (SELECT column_value
                          FROM TABLE (CAST (pct_year AS ct_year))), (SELECT     fk_id fk_otdel
                                                                           FROM tsmid
                                                                          WHERE LEVEL = 2
                                                                     START WITH fc_synonim LIKE 'RAZ_ANAL'
                                                                     CONNECT BY PRIOR fk_id = fk_owner))
      GROUP BY fk_otdel, fd_year, fk_townid, fn_age
      ORDER BY fk_otdel, fd_year, fk_townid, fn_age DESC;

    CURSOR c_povt_pat (pfd_dateb DATE, pfd_datee DATE)   -- Повтороно обследованных с патологией
    IS
      SELECT   /*+CHOOSE*/
               SUM (fn_count) fn_count
          FROM (SELECT   /*+CHOOSE*/
                         COUNT (1) fn_count, fk_townid, fn_age, fd_year, fk_otdel
                    FROM (SELECT DISTINCT t.fk_id,
                                          DECODE (TRUNC ((MONTHS_BETWEEN (TRUNC (tp.fd_date_in), t.fd_rojd) / 12)
                                                         / dd.fn_child),
                                                  0, 2,
                                                  t.fp_sex) fn_age,   --Получаем 2 если человеку меньше pkg_core.get_constbyname('CHILD_AGE') и пол если больше
                                          DECODE (ta.fk_townid, 101632, 1, 0) AS fk_townid,
                                          TO_CHAR (v.fd_ins, 'yyyy') fd_year, fk_otdel
                                     FROM vresan v, tkarta t, tadress ta, tpatname p,
                                          (SELECT pkg_core.get_constbyname ('CHILD_AGE') fn_child
                                             FROM DUAL) dd,
                                          (SELECT DISTINCT fk_pacid fk_vpacid, fd_ins fd_vrun
                                                      FROM vresan
                                                     WHERE fd_ins BETWEEN pfd_dateb AND pfd_datee AND fl_amb = 0
                                                           AND fk_patid > 0
                                                           AND fk_razdid IN (SELECT     fk_id
                                                                                   FROM tsmid
                                                                                  WHERE LEVEL = 3
                                                                             START WITH fc_synonim LIKE 'RAZ_ANAL'
                                                                             CONNECT BY PRIOR fk_id = fk_owner)) vv,
                                          (SELECT fd_data1 fd_date_in, fk_pacid
                                             FROM tsroky
                                            WHERE fk_pryb = 2) tp, (SELECT     fk_owner fk_otdel, fk_id fk_razdel
                                                                          FROM tsmid
                                                                         WHERE LEVEL = 3 AND fl_stat = 1
                                                                    START WITH fc_synonim LIKE 'RAZ_ANAL'
                                                                    CONNECT BY PRIOR fk_id = fk_owner) ss
                                    WHERE t.fk_id = v.fk_pacid AND tp.fk_pacid = t.fk_id AND p.fk_id = v.fk_patid
                                          AND p.fp_prior > 0 AND v.fk_razdid = ss.fk_razdel
                                          AND ta.fk_pacid = t.fk_peplid AND v.fk_pacid = vv.fk_vpacid
                                          AND v.fd_ins BETWEEN TO_DATE ('1.01' || TO_CHAR (vv.fd_vrun, 'yyyy'),
                                                                        'dd.mm.yyyy')
                                                           AND vv.fd_vrun
                                 GROUP BY fk_otdel, TO_CHAR (v.fd_ins, 'yyyy'), t.fk_id, v.fk_smid,
                                          DECODE (TRUNC ((MONTHS_BETWEEN (TRUNC (tp.fd_date_in), t.fd_rojd) / 12)
                                                         / dd.fn_child),
                                                  0, 2,
                                                  t.fp_sex),
                                          DECODE (ta.fk_townid, 101632, 1, 0)
                                   HAVING COUNT (1) > 1)
                GROUP BY fk_otdel, fd_year, fk_townid, fn_age
                UNION
                SELECT   /*+CHOOSE*/
                         COUNT (1) fn_count, fk_townid, fn_age, fd_year, 1000000000
                    FROM (SELECT DISTINCT t.fk_id,
                                          DECODE (TRUNC ((MONTHS_BETWEEN (TRUNC (tp.fd_date_in), t.fd_rojd) / 12)
                                                         / dd.fn_child),
                                                  0, 2,
                                                  t.fp_sex) fn_age,   --Получаем 2 если человеку меньше pkg_core.get_constbyname('CHILD_AGE') и пол если больше
                                          DECODE (ta.fk_townid, 101632, 1, 0) AS fk_townid,
                                          TO_CHAR (v.fd_ins, 'yyyy') fd_year
                                     FROM vresan v, tkarta t, tadress ta, tpatname p,
                                          (SELECT pkg_core.get_constbyname ('CHILD_AGE') fn_child
                                             FROM DUAL) dd,
                                          (SELECT DISTINCT fk_pacid fk_vpacid, fd_ins fd_vrun
                                                      FROM vresan
                                                     WHERE fd_ins BETWEEN pfd_dateb AND pfd_datee AND fl_amb = 0
                                                           AND fk_patid > 0
                                                           AND fk_razdid IN (SELECT     fk_id
                                                                                   FROM tsmid
                                                                                  WHERE LEVEL = 3
                                                                             START WITH fc_synonim LIKE 'RAZ_ANAL'
                                                                             CONNECT BY PRIOR fk_id = fk_owner)) vv,
                                          (SELECT fd_data1 fd_date_in, fk_pacid
                                             FROM tsroky
                                            WHERE fk_pryb = 2) tp, (SELECT     fk_owner fk_otdel, fk_id fk_razdel
                                                                          FROM tsmid
                                                                         WHERE LEVEL = 3 AND fl_stat = 1
                                                                    START WITH fc_synonim LIKE 'RAZ_ANAL'
                                                                    CONNECT BY PRIOR fk_id = fk_owner) ss
                                    WHERE t.fk_id = v.fk_pacid AND tp.fk_pacid = t.fk_id AND v.fk_pacid = vv.fk_vpacid
                                          AND v.fd_ins BETWEEN TO_DATE ('1.01' || TO_CHAR (vv.fd_vrun, 'yyyy'),
                                                                        'dd.mm.yyyy')
                                                           AND vv.fd_vrun
                                          AND p.fk_id = v.fk_patid AND p.fp_prior > 0 AND v.fk_razdid = ss.fk_razdel
                                          AND ta.fk_pacid = t.fk_peplid
                                 GROUP BY fk_otdel, TO_CHAR (v.fd_ins, 'yyyy'), t.fk_id, v.fk_smid,
                                          DECODE (TRUNC ((MONTHS_BETWEEN (TRUNC (tp.fd_date_in), t.fd_rojd) / 12)
                                                         / dd.fn_child),
                                                  0, 2,
                                                  t.fp_sex),
                                          DECODE (ta.fk_townid, 101632, 1, 0)
                                   HAVING COUNT (1) > 1)
                GROUP BY fd_year, fk_townid, fn_age
                UNION
                SELECT 0, 0, 2, TO_CHAR (column_value), 1000000000
                  FROM (SELECT column_value
                          FROM TABLE (CAST (pct_year AS ct_year)))
                UNION
                SELECT 0, 0, 1, TO_CHAR (column_value), 1000000000
                  FROM (SELECT column_value
                          FROM TABLE (CAST (pct_year AS ct_year)))
                UNION
                SELECT 0, 0, 0, TO_CHAR (column_value), 1000000000
                  FROM (SELECT column_value
                          FROM TABLE (CAST (pct_year AS ct_year)))
                UNION
                SELECT 0, 1, 2, TO_CHAR (column_value), 1000000000
                  FROM (SELECT column_value
                          FROM TABLE (CAST (pct_year AS ct_year)))
                UNION
                SELECT 0, 1, 1, TO_CHAR (column_value), 1000000000
                  FROM (SELECT column_value
                          FROM TABLE (CAST (pct_year AS ct_year)))
                UNION
                SELECT 0, 1, 0, TO_CHAR (column_value), 1000000000
                  FROM (SELECT column_value
                          FROM TABLE (CAST (pct_year AS ct_year)))
                UNION
                SELECT 0, 0, 2, TO_CHAR (column_value), fk_otdel
                  FROM (SELECT column_value
                          FROM TABLE (CAST (pct_year AS ct_year))), (SELECT     fk_id fk_otdel
                                                                           FROM tsmid
                                                                          WHERE LEVEL = 2
                                                                     START WITH fc_synonim LIKE 'RAZ_ANAL'
                                                                     CONNECT BY PRIOR fk_id = fk_owner)
                UNION
                SELECT 0, 0, 1, TO_CHAR (column_value), fk_otdel
                  FROM (SELECT column_value
                          FROM TABLE (CAST (pct_year AS ct_year))), (SELECT     fk_id fk_otdel
                                                                           FROM tsmid
                                                                          WHERE LEVEL = 2
                                                                     START WITH fc_synonim LIKE 'RAZ_ANAL'
                                                                     CONNECT BY PRIOR fk_id = fk_owner)
                UNION
                SELECT 0, 0, 0, TO_CHAR (column_value), fk_otdel
                  FROM (SELECT column_value
                          FROM TABLE (CAST (pct_year AS ct_year))), (SELECT     fk_id fk_otdel
                                                                           FROM tsmid
                                                                          WHERE LEVEL = 2
                                                                     START WITH fc_synonim LIKE 'RAZ_ANAL'
                                                                     CONNECT BY PRIOR fk_id = fk_owner)
                UNION
                SELECT 0, 1, 2, TO_CHAR (column_value), fk_otdel
                  FROM (SELECT column_value
                          FROM TABLE (CAST (pct_year AS ct_year))), (SELECT     fk_id fk_otdel
                                                                           FROM tsmid
                                                                          WHERE LEVEL = 2
                                                                     START WITH fc_synonim LIKE 'RAZ_ANAL'
                                                                     CONNECT BY PRIOR fk_id = fk_owner)
                UNION
                SELECT 0, 1, 1, TO_CHAR (column_value), fk_otdel
                  FROM (SELECT column_value
                          FROM TABLE (CAST (pct_year AS ct_year))), (SELECT     fk_id fk_otdel
                                                                           FROM tsmid
                                                                          WHERE LEVEL = 2
                                                                     START WITH fc_synonim LIKE 'RAZ_ANAL'
                                                                     CONNECT BY PRIOR fk_id = fk_owner)
                UNION
                SELECT 0, 1, 0, TO_CHAR (column_value), fk_otdel
                  FROM (SELECT column_value
                          FROM TABLE (CAST (pct_year AS ct_year))), (SELECT     fk_id fk_otdel
                                                                           FROM tsmid
                                                                          WHERE LEVEL = 2
                                                                     START WITH fc_synonim LIKE 'RAZ_ANAL'
                                                                     CONNECT BY PRIOR fk_id = fk_owner))
      GROUP BY fk_otdel, fd_year, fk_townid, fn_age
      ORDER BY fk_otdel, fd_year, fk_townid, fn_age DESC;

    CURSOR c_pac_without (pfd_dateb DATE, pfd_datee DATE)   --кол-во обследованных по категории без направления
    IS
      SELECT   /*+CHOOSE*/
               SUM (fn_count) fn_count
          FROM (SELECT   COUNT (*) fn_count, fk_townid, fn_age, fd_year, fk_otdel
                            FROM (SELECT DISTINCT t.fk_id,
                                                  DECODE (TRUNC ((MONTHS_BETWEEN (TRUNC (v.fd_ins), t.fd_rojd) / 12)
                                                                 / dd.fn_child),
                                                          0, 2,
                                                          t.fp_sex) fn_age,   --Получаем 2 если человеку меньше pkg_core.get_constbyname('CHILD_AGE') и пол если больше
                                                  DECODE (ta.fk_townid, 101632, 1, 0) AS fk_townid,
                                                  TO_CHAR (v.fd_ins, 'yyyy') fd_year, fk_otdel
                                             FROM vresan v, tambulance t, tadress ta,
                                                  (select pkg_core.get_constbyname ('CHILD_AGE') fn_child from dual) dd,
                                                  (SELECT     fk_owner fk_otdel, fk_id fk_razdel
                                                         FROM tsmid
                                                        WHERE LEVEL = 3 AND fl_stat = 1
                                                   START WITH fc_synonim LIKE 'RAZ_ANAL'
                                                   CONNECT BY PRIOR fk_id = fk_owner) ss
                                            WHERE ta.fk_pacid = t.fk_peplid
                                                  AND t.fk_id = v.fk_pacid AND v.fk_razdid = ss.fk_razdel
                                                  AND v.fd_ins BETWEEN pfd_dateb AND pfd_datee)
                        GROUP BY fk_otdel, fd_year, fk_townid, fn_age
                UNION
                SELECT   COUNT (*) fn_count, fk_townid, fn_age, fd_year, 1000000000
                    FROM (SELECT DISTINCT t.fk_id,
                                          DECODE (TRUNC ((MONTHS_BETWEEN (TRUNC (v.fd_ins), t.fd_rojd) / 12)
                                                         / dd.fn_child),
                                                  0, 2,
                                                  t.fp_sex) fn_age,   --Получаем 2 если человеку меньше pkg_core.get_constbyname('CHILD_AGE') и пол если больше
                                          DECODE (ta.fk_townid, 101632, 1, 0) AS fk_townid,
                                          TO_CHAR (v.fd_ins, 'yyyy') fd_year
                                     FROM vresan v, tambulance t, tadress ta,
                                          (select pkg_core.get_constbyname ('CHILD_AGE') fn_Child from dual) dd,
                                          (SELECT     fk_owner fk_otdel, fk_id fk_razdel
                                                 FROM tsmid
                                                WHERE LEVEL = 3 AND fl_stat = 1
                                           START WITH fc_synonim LIKE 'RAZ_ANAL'
                                           CONNECT BY PRIOR fk_id = fk_owner) ss
                                    WHERE ta.fk_pacid = t.fk_peplid AND t.fk_id = v.fk_pacid
                                          AND v.fk_razdid = ss.fk_razdel
                                          AND v.fd_ins BETWEEN pfd_dateb AND pfd_datee)
                GROUP BY fd_year, fk_townid, fn_age
                UNION
                SELECT 0, 0, 2, TO_CHAR (column_value), 1000000000
                  FROM (SELECT column_value
                          FROM TABLE (CAST (pct_year AS ct_year)))
                UNION
                SELECT 0, 0, 1, TO_CHAR (column_value), 1000000000
                  FROM (SELECT column_value
                          FROM TABLE (CAST (pct_year AS ct_year)))
                UNION
                SELECT 0, 0, 0, TO_CHAR (column_value), 1000000000
                  FROM (SELECT column_value
                          FROM TABLE (CAST (pct_year AS ct_year)))
                UNION
                SELECT 0, 1, 2, TO_CHAR (column_value), 1000000000
                  FROM (SELECT column_value
                          FROM TABLE (CAST (pct_year AS ct_year)))
                UNION
                SELECT 0, 1, 1, TO_CHAR (column_value), 1000000000
                  FROM (SELECT column_value
                          FROM TABLE (CAST (pct_year AS ct_year)))
                UNION
                SELECT 0, 1, 0, TO_CHAR (column_value), 1000000000
                  FROM (SELECT column_value
                          FROM TABLE (CAST (pct_year AS ct_year)))
                UNION
                SELECT 0, 0, 2, TO_CHAR (column_value), fk_otdel
                  FROM (SELECT column_value
                          FROM TABLE (CAST (pct_year AS ct_year))), (SELECT     fk_id fk_otdel
                                                                           FROM tsmid
                                                                          WHERE LEVEL = 2
                                                                     START WITH fc_synonim LIKE 'RAZ_ANAL'
                                                                     CONNECT BY PRIOR fk_id = fk_owner)
                UNION
                SELECT 0, 0, 1, TO_CHAR (column_value), fk_otdel
                  FROM (SELECT column_value
                          FROM TABLE (CAST (pct_year AS ct_year))), (SELECT     fk_id fk_otdel
                                                                           FROM tsmid
                                                                          WHERE LEVEL = 2
                                                                     START WITH fc_synonim LIKE 'RAZ_ANAL'
                                                                     CONNECT BY PRIOR fk_id = fk_owner)
                UNION
                SELECT 0, 0, 0, TO_CHAR (column_value), fk_otdel
                  FROM (SELECT column_value
                          FROM TABLE (CAST (pct_year AS ct_year))), (SELECT     fk_id fk_otdel
                                                                           FROM tsmid
                                                                          WHERE LEVEL = 2
                                                                     START WITH fc_synonim LIKE 'RAZ_ANAL'
                                                                     CONNECT BY PRIOR fk_id = fk_owner)
                UNION
                SELECT 0, 1, 2, TO_CHAR (column_value), fk_otdel
                  FROM (SELECT column_value
                          FROM TABLE (CAST (pct_year AS ct_year))), (SELECT     fk_id fk_otdel
                                                                           FROM tsmid
                                                                          WHERE LEVEL = 2
                                                                     START WITH fc_synonim LIKE 'RAZ_ANAL'
                                                                     CONNECT BY PRIOR fk_id = fk_owner)
                UNION
                SELECT 0, 1, 1, TO_CHAR (column_value), fk_otdel
                  FROM (SELECT column_value
                          FROM TABLE (CAST (pct_year AS ct_year))), (SELECT     fk_id fk_otdel
                                                                           FROM tsmid
                                                                          WHERE LEVEL = 2
                                                                     START WITH fc_synonim LIKE 'RAZ_ANAL'
                                                                     CONNECT BY PRIOR fk_id = fk_owner)
                UNION
                SELECT 0, 1, 0, TO_CHAR (column_value), fk_otdel
                  FROM (SELECT column_value
                          FROM TABLE (CAST (pct_year AS ct_year))), (SELECT     fk_id fk_otdel
                                                                           FROM tsmid
                                                                          WHERE LEVEL = 2
                                                                     START WITH fc_synonim LIKE 'RAZ_ANAL'
                                                                     CONNECT BY PRIOR fk_id = fk_owner))
      GROUP BY fk_otdel, fd_year, fk_townid, fn_age
      ORDER BY fk_otdel, fd_year, fk_townid, fn_age DESC;

    CURSOR c_issl_without (pd_dateb DATE, pd_datee DATE)   --Колисество исследований для пациентов по категории без направления
    IS
      SELECT   /*+CHOOSE*/
               SUM (fn_count) fn_count
          FROM (SELECT   count(1) fn_count , fk_townid, fn_age, fd_year, fk_otdel
                    FROM (SELECT DISTINCT v.fk_smid fn_count, v.fk_id,
                                          DECODE (TRUNC ((MONTHS_BETWEEN (TRUNC (v.fd_ins), t.fd_rojd) / 12)
                                                         / pkg_core.get_constbyname ('CHILD_AGE')),
                                                  0, 2,
                                                  t.fp_sex) fn_age,   --Получаем 2 если человеку меньше pkg_core.get_constbyname('CHILD_AGE') и пол если больше
                                          DECODE (ta.fk_townid, 101632, 1, 0) AS fk_townid,
                                          TO_CHAR (v.fd_ins, 'yyyy') fd_year, ss.fk_otdel
                                     FROM vresan v, tambulance t, tadress ta,
                                          (SELECT DISTINCT b.fk_smid, s.fk_otdel
                                                      FROM tisslrazdrows a, tisslrazddeps b,
                                                           (SELECT     fk_owner fk_otdel, fk_id fk_razdel
                                                                  FROM tsmid
                                                                 WHERE LEVEL = 3
                                                            START WITH fc_synonim LIKE 'RAZ_ANAL'
                                                            CONNECT BY PRIOR fk_id = fk_owner) s
                                                     WHERE a.fk_smid = s.fk_razdel AND a.fk_id = b.fk_rowid) ss
                                    WHERE v.fd_ins BETWEEN pd_dateb AND pd_datee
                                          AND ta.fk_pacid = t.fk_peplid AND v.fk_smid = ss.fk_smid
                                          AND t.fk_id = v.fk_pacid)
                GROUP BY fk_otdel, fd_year, fn_age, fk_townid
                UNION
                SELECT 0, 0, 2, TO_CHAR (column_value), fk_otdel
                  FROM (SELECT column_value
                          FROM TABLE (CAST (pct_year AS ct_year))), (SELECT     fk_id fk_otdel
                                                                           FROM tsmid
                                                                          WHERE LEVEL = 2
                                                                     START WITH fc_synonim LIKE 'RAZ_ANAL'
                                                                     CONNECT BY PRIOR fk_id = fk_owner)
                UNION
                SELECT 0, 0, 1, TO_CHAR (column_value), fk_otdel
                  FROM (SELECT column_value
                          FROM TABLE (CAST (pct_year AS ct_year))), (SELECT     fk_id fk_otdel
                                                                           FROM tsmid
                                                                          WHERE LEVEL = 2
                                                                     START WITH fc_synonim LIKE 'RAZ_ANAL'
                                                                     CONNECT BY PRIOR fk_id = fk_owner)
                UNION
                SELECT 0, 0, 0, TO_CHAR (column_value), fk_otdel
                  FROM (SELECT column_value
                          FROM TABLE (CAST (pct_year AS ct_year))), (SELECT     fk_id fk_otdel
                                                                           FROM tsmid
                                                                          WHERE LEVEL = 2
                                                                     START WITH fc_synonim LIKE 'RAZ_ANAL'
                                                                     CONNECT BY PRIOR fk_id = fk_owner)
                UNION
                SELECT 0, 1, 2, TO_CHAR (column_value), fk_otdel
                  FROM (SELECT column_value
                          FROM TABLE (CAST (pct_year AS ct_year))), (SELECT     fk_id fk_otdel
                                                                           FROM tsmid
                                                                          WHERE LEVEL = 2
                                                                     START WITH fc_synonim LIKE 'RAZ_ANAL'
                                                                     CONNECT BY PRIOR fk_id = fk_owner)
                UNION
                SELECT 0, 1, 1, TO_CHAR (column_value), fk_otdel
                  FROM (SELECT column_value
                          FROM TABLE (CAST (pct_year AS ct_year))), (SELECT     fk_id fk_otdel
                                                                           FROM tsmid
                                                                          WHERE LEVEL = 2
                                                                     START WITH fc_synonim LIKE 'RAZ_ANAL'
                                                                     CONNECT BY PRIOR fk_id = fk_owner)
                UNION
                SELECT 0, 1, 0, TO_CHAR (column_value), fk_otdel
                  FROM (SELECT column_value
                          FROM TABLE (CAST (pct_year AS ct_year))), (SELECT     fk_id fk_otdel
                                                                           FROM tsmid
                                                                          WHERE LEVEL = 2
                                                                     START WITH fc_synonim LIKE 'RAZ_ANAL'
                                                                     CONNECT BY PRIOR fk_id = fk_owner))
      GROUP BY fk_otdel, fd_year, fk_townid, fn_age
      ORDER BY fk_otdel, fd_year, fk_townid, fn_age DESC;
  BEGIN
    -- Количество отделов
    SELECT     COUNT (1)
          INTO pn_otdel_count
          FROM tsmid
         WHERE LEVEL = 2
    START WITH fc_synonim LIKE 'RAZ_ANAL'
    CONNECT BY PRIOR fk_id = fk_owner
      ORDER BY fk_id;

    --Задаем дату начала и дату окончания сборки отчета
    pd_dateb := TO_DATE ('1.01.' || TO_CHAR (pfn_year - pfn_count + 1), 'dd.mm.yyyy');
    pd_datee := TO_DATE ('31.12.' || TO_CHAR (pfn_year), 'dd.mm.yyyy');

    --Задаем названия отделов
    FOR cc IN c_otdel
    LOOP
      pct_name (c_otdel%ROWCOUNT) := cc.fc_name;
    END LOOP;

    --Задаем годы для которых будет собираться отчет
    pct_year.TRIM (pct_year.COUNT);

    FOR cc IN REVERSE 1 .. pfn_count
    LOOP
      pct_year.EXTEND;
      pct_year (1 + (pfn_count - cc)) := pfn_year - cc + 1;
    END LOOP;

    --сколько всего строк в массиве без учета суммы
    pn_row_count := pfn_count * pn_otdel_count * 6;

    --Обнуляем все массивы
    FOR cc IN 1 .. ((pn_otdel_count + 1) * 6 * pfn_count)
    LOOP
      pct_line (cc) := 0;
      pct_issl (cc) := 0;
      pct_out (cc) := 0;
      pct_obs_pac (cc) := 0;
      pct_patology (cc) := 0;
      pct_povtor_obsl (cc) := 0;
      pct_povt_pat (cc) := 0;
      pct_pat_res (cc) := 0;
      pct_pac_without (cc) := 0;
      pct_issl_without (cc) := 0;
    END LOOP;

    DBMS_LOB.createtemporary (pb_result, TRUE, DBMS_LOB.SESSION);
    -- вставляем шапку отчета
    pc_str :=
      get_html_header || '<BODY><P ALIGN="CENTER"><B><font size="+1">Клинико - диагностическая лаборатория санатория "'
      || pkg_smini.readstring ('CONFIG', 'S_NAME', 'Не известен')
      || '"</font></B><BR><ALIGN="CENTER"><font size="+1">Производственная деятельность лаборатории  '
      || '</font><br>за период с ' || TO_CHAR (pd_dateb, 'dd.mm.yyyy') || ' по ' || TO_CHAR (pd_datee, 'dd.mm.yyyy')
      || ' .';
    DBMS_LOB.writeappend (pb_result, LENGTH (pc_str), pc_str);
    pc_str :=
      '<table width="100%" border="1" cellpadding="0" cellspacing="0">' || '<TR>'
      || '<TH rowspan="3" width="3%">№:</TH>' || '<TH rowspan="3" width="30%">Наименование</TH>';

    FOR cc IN 1 .. pfn_count
    LOOP
      pc_str := pc_str || '<TH colspan="6" >Санаторные за ' || pct_year (cc) || ' год</TH>';
    END LOOP;

    pc_str := pc_str || '</TR><TR>';

    FOR cc IN 1 .. pfn_count
    LOOP
      pc_str := pc_str || '<TH colspan="3">Иногородние</TH>' || '<TH colspan="3">Проживающие в Югорске</TH>';
    END LOOP;

    pc_str := pc_str || '</TR><TR>';

    FOR cc IN 1 .. pfn_count
    LOOP
      pc_str :=
        pc_str || '<TH >Дети</TH>' || '<TH >Взрослые</TH>' || '<TH >Женщины</TH>' || '<TH >Дети</TH>'
        || '<TH >Взрослые</TH>' || '<TH >Женщины</TH>';
    END LOOP;

    pc_str := pc_str || '</TR>';
    DBMS_LOB.writeappend (pb_result, LENGTH (pc_str), pc_str);
    /**/
    pc_str := '<TR><TD align = "center">&nbsp;</TD><TD class="sm_td " >Количество выписанных</TD>';
    pc_strout := 'Количество выписанных';
    progress_bar.setstrout ('Рассчет: ' || pc_strout);
    progress_bar.stepit;

    FOR cc IN c_out (pd_dateb, pd_datee)
    LOOP
      pct_out (c_out%ROWCOUNT + pn_row_count) := cc.fn_count;
    END LOOP;

    FOR cc IN (pn_row_count + 1) .. (pn_row_count + 6 * pfn_count)
    LOOP
      IF MOD (cc, 3) = 2
      THEN
        pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pct_out (cc) + pct_out (cc + 1))||' ',' 0 ','&nbsp;') || '</TD>';
      ELSE
        pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pct_out (cc))||' ',' 0 ','&nbsp;') || '</TD>';
      END IF;
    END LOOP;

    pc_str := pc_str || '</TR>';
    DBMS_LOB.writeappend (pb_result, LENGTH (pc_str), pc_str);
    /**/
    pn_number := 1;
    pc_str := '<TR><TD align = "center">' || pn_number || '</TD><TD class="sm_td " ><B>Обследовано отдыхающих:</B></TD>';
    pc_strout := 'Обследовано отдыхающих';
    progress_bar.setstrout ('Рассчет: ' || pc_strout);
    progress_bar.stepit;

    FOR cc IN c_obs_pac (pd_dateb, pd_datee)
    LOOP
      pct_obs_pac (c_obs_pac%ROWCOUNT) := cc.fn_count;
    END LOOP;

--Вывод суммарного поля
    FOR cc IN (pn_row_count + 1) .. (pn_row_count + 6 * pfn_count)
    LOOP
      IF MOD (cc, 3) = 2
      THEN
        pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pct_obs_pac (cc) + pct_obs_pac (cc + 1))||' ',' 0 ','&nbsp;') || '</TD>';
      ELSE
        pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pct_obs_pac (cc))||' ',' 0 ','&nbsp;') || '</TD>';
      END IF;
    END LOOP;

--Вывод по отделам
    FOR cc IN 1 .. pn_row_count
    LOOP
      IF MOD (cc, pfn_count * 6) = 1
      THEN
        pn_number := pn_number + 1;
        pc_str :=
          pc_str || '</TR><TR><TD align = "center">' || pn_number || '</TD><TD>'
          || pct_name (TRUNC ((cc - 1) / (pfn_count * 6)) + 1) || '</TD>';
      END IF;

      IF MOD (cc, 3) = 2
      THEN
        pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pct_obs_pac (cc) + pct_obs_pac (cc + 1))||' ',' 0 ','&nbsp;') || '</TD>';
      ELSE
        pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pct_obs_pac (cc))||' ',' 0 ','&nbsp;') || '</TD>';
      END IF;
    END LOOP;

    pc_str := pc_str || '</TR>';
    DBMS_LOB.writeappend (pb_result, LENGTH (pc_str), pc_str);
    /**/
    pn_number := pn_number + 1;
    pc_str :=
      '<TR><TD align = "center">' || pn_number
      || '</TD><TD class="sm_td " ><B>Количество исследований для отдыхающих:</B></TD>';
    pc_strout := 'Количество исследований для отдыхающих';
    progress_bar.setstrout ('Рассчет: ' || pc_strout);
    progress_bar.stepit;

    FOR cc IN c_issl (pd_dateb, pd_datee)
    LOOP
      pct_issl (c_issl%ROWCOUNT) := cc.fn_count;
    END LOOP;

    FOR cc IN (pn_row_count + 1) .. (pn_row_count + 6 * pfn_count)
    LOOP
      FOR i IN 0 .. (pn_otdel_count - 1)
      LOOP
        pct_issl (cc) := pct_issl (cc) + pct_issl (cc - pn_row_count + i * pfn_count * 6);
      END LOOP;
    END LOOP;

--Вывод суммарного поля
    FOR cc IN (pn_row_count + 1) .. (pn_row_count + 6 * pfn_count)
    LOOP
      IF MOD (cc, 3) = 2
      THEN
        pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pct_issl (cc) + pct_issl (cc + 1))||' ',' 0 ','&nbsp;') || '</TD>';
      ELSE
        pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pct_issl (cc))||' ',' 0 ','&nbsp;') || '</TD>';
      END IF;
    END LOOP;

--Вывод по отделам
    FOR cc IN 1 .. pn_row_count
    LOOP
      IF MOD (cc, pfn_count * 6) = 1
      THEN
        pn_number := pn_number + 1;
        pc_str :=
          pc_str || '</TR><TR><TD align = "center">' || pn_number || '</TD><TD>'
          || pct_name (TRUNC ((cc - 1) / (pfn_count * 6)) + 1) || '</TD>';
      END IF;

      IF MOD (cc, 3) = 2
      THEN
        pc_str := pc_str || '<TD align = "center">' ||replace(' '|| TO_CHAR (pct_issl (cc) + pct_issl (cc + 1))||' ',' 0 ','&nbsp;') || '</TD>';
      ELSE
        pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pct_issl (cc))||' ',' 0 ','&nbsp;') || '</TD>';
      END IF;
    END LOOP;

    pc_str := pc_str || '</TR>';
    DBMS_LOB.writeappend (pb_result, LENGTH (pc_str), pc_str);
    /**/
    pn_number := pn_number + 1;
    pc_str :=
      '<TR><TD align = "center">' || pn_number
      || '</TD><TD class="sm_td " ><B>Количество исследований на одного выписанного::</B></TD>';
    pc_strout := 'Количество исследований на одного выписанного';
    progress_bar.setstrout ('Рассчет: ' || pc_strout);
    progress_bar.stepit;

    --Вывод суммарного поля
    FOR cc IN (pn_row_count + 1) .. (pn_row_count + 6 * pfn_count)
    LOOP
      IF MOD (cc, 3) = 2
      THEN
        IF pct_out (cc) + pct_out (cc + 1) = 0
        THEN
          pn_dop := 0;
        ELSE
          pn_dop := (pct_issl (cc) + pct_issl (cc + 1)) / (pct_out (cc) + pct_out (cc + 1));
        END IF;

        pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pn_dop, 'FM99999999990.09')||' ',' 0.0 ','&nbsp;') || '</TD>';
      ELSE
        IF pct_out (cc) = 0
        THEN
          pn_dop := 0;
        ELSE
          pn_dop := (pct_issl (cc)) / (pct_out (cc));
        END IF;

        pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pn_dop, 'FM99999999990.09')||' ',' 0.0 ','&nbsp;') || '</TD>';
      END IF;
    END LOOP;

--Вывод по отделам
    i := -1;

    FOR cc IN 1 .. pn_row_count
    LOOP
      IF MOD (cc, pfn_count * 6) = 1
      THEN
        pn_number := pn_number + 1;
        pc_str :=
          pc_str || '</TR><TR><TD align = "center">' || pn_number || '</TD><TD>'
          || pct_name (TRUNC ((cc - 1) / (pfn_count * 6)) + 1) || '</TD>';
        i := i + 1;
      END IF;

      IF MOD (cc, 3) = 2
      THEN
        IF pct_out (pn_row_count + cc - i * pfn_count * 6) + pct_out (pn_row_count + cc - i * pfn_count * 6 + 1) = 0
        THEN
          pn_dop := 0;
        ELSE
          pn_dop :=
            (pct_issl (cc) + pct_issl (cc + 1))
            / (pct_out (pn_row_count + cc - i * pfn_count * 6) + pct_out (pn_row_count + cc - i * pfn_count * 6 + 1));
        END IF;

        pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pn_dop, 'FM99999999990.09')||' ',' 0.0 ','&nbsp;') || '</TD>';
      ELSE
        IF pct_out (pn_row_count + cc - i * pfn_count * 6) = 0
        THEN
          pn_dop := 0;
        ELSE
          pn_dop := (pct_issl (cc)) / (pct_out (pn_row_count + cc - i * pfn_count * 6));
        END IF;

        pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pn_dop, 'FM99999999990.09')||' ',' 0.0 ','&nbsp;') || '</TD>';
      END IF;
    END LOOP;

    pc_str := pc_str || '</TR>';
    DBMS_LOB.writeappend (pb_result, LENGTH (pc_str), pc_str);
    /**/
    pn_number := pn_number + 1;
    pc_str :=
      '<TR><TD align = "center">' || pn_number
      || '</TD><TD class="sm_td " ><B>Количество исследований на одного обследованного::</B></TD>';
    pc_strout := 'Количество исследований на одного обследованного';
    progress_bar.setstrout ('Рассчет: ' || pc_strout);
    progress_bar.stepit;

    --Вывод суммарного поля
    FOR cc IN (pn_row_count + 1) .. (pn_row_count + 6 * pfn_count)
    LOOP
      IF MOD (cc, 3) = 2
      THEN
        IF pct_obs_pac (cc) + pct_obs_pac (cc + 1) = 0
        THEN
          pn_dop := 0;
        ELSE
          pn_dop := (pct_issl (cc) + pct_issl (cc + 1)) / (pct_obs_pac (cc) + pct_obs_pac (cc + 1));
        END IF;

        pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pn_dop, 'FM99999999990.09')||' ',' 0.0 ','&nbsp;') || '</TD>';
      ELSE
        IF pct_obs_pac (cc) = 0
        THEN
          pn_dop := 0;
        ELSE
          pn_dop := (pct_issl (cc)) / (pct_obs_pac (cc));
        END IF;

        pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pn_dop, 'FM99999999990.09')||' ',' 0.0 ','&nbsp;') || '</TD>';
      END IF;
    END LOOP;

--Вывод по отделам
    FOR cc IN 1 .. pn_row_count
    LOOP
      IF MOD (cc, pfn_count * 6) = 1
      THEN
        pn_number := pn_number + 1;
        pc_str :=
          pc_str || '</TR><TR><TD align = "center">' || pn_number || '</TD><TD>'
          || pct_name (TRUNC ((cc - 1) / (pfn_count * 6)) + 1) || '</TD>';
      END IF;

      IF MOD (cc, 3) = 2
      THEN
        IF pct_obs_pac (cc) + pct_obs_pac (cc + 1) = 0
        THEN
          pn_dop := 0;
        ELSE
          pn_dop := (pct_issl (cc) + pct_issl (cc + 1)) / (pct_obs_pac (cc) + pct_obs_pac (cc + 1));
        END IF;

        pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pn_dop, 'FM99999999990.09')||' ',' 0.0 ','&nbsp;') || '</TD>';
      ELSE
        IF pct_obs_pac (cc) = 0
        THEN
          pn_dop := 0;
        ELSE
          pn_dop := (pct_issl (cc)) / pct_obs_pac (cc);
        END IF;

        pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pn_dop, 'FM99999999990.09')||' ',' 0.0 ','&nbsp;') || '</TD>';
      END IF;
    END LOOP;

    pc_str := pc_str || '</TR>';
    DBMS_LOB.writeappend (pb_result, LENGTH (pc_str), pc_str);
    /**/
    pn_number := pn_number + 1;
    pc_str :=
         '<TR><TD align = "center">' || pn_number || '</TD><TD class="sm_td " ><B>Количество лиц с патологией:</B></TD>';
    pc_strout := 'Количество лиц с патологией';
    progress_bar.setstrout ('Рассчет: ' || pc_strout);
    progress_bar.stepit;

    FOR cc IN c_patology (pd_dateb, pd_datee)
    LOOP
      pct_patology (c_patology%ROWCOUNT) := cc.fn_count;
    END LOOP;

--Вывод суммарного поля
    FOR cc IN (pn_row_count + 1) .. (pn_row_count + 6 * pfn_count)
    LOOP
      IF MOD (cc, 3) = 2
      THEN
        pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pct_patology (cc) + pct_patology (cc + 1))||' ',' 0 ','&nbsp;') || '</TD>';
      ELSE
        pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pct_patology (cc))||' ',' 0 ','&nbsp;') || '</TD>';
      END IF;
    END LOOP;

--Вывод по отделам
    FOR cc IN 1 .. pn_row_count
    LOOP
      IF MOD (cc, pfn_count * 6) = 1
      THEN
        pn_number := pn_number + 1;
        pc_str :=
          pc_str || '</TR><TR><TD align = "center">' || pn_number || '</TD><TD>'
          || pct_name (TRUNC ((cc - 1) / (pfn_count * 6)) + 1) || '</TD>';
      END IF;

      IF MOD (cc, 3) = 2
      THEN
        pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pct_patology (cc) + pct_patology (cc + 1))||' ',' 0 ','&nbsp;') || '</TD>';
      ELSE
        pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pct_patology (cc))||' ',' 0 ','&nbsp;') || '</TD>';
      END IF;
    END LOOP;

    pc_str := pc_str || '</TR>';
    DBMS_LOB.writeappend (pb_result, LENGTH (pc_str), pc_str);
    /**/
    pn_number := pn_number + 1;
    pc_str :=
      '<TR><TD align = "center">' || pn_number
      || '</TD><TD class="sm_td " ><B>% лиц с патологией от выписанных:</B></TD>';
    pc_strout := '% лиц с патологией от выписанных';
    progress_bar.setstrout ('Рассчет: ' || pc_strout);
    progress_bar.stepit;

    --Вывод суммарного поля
    FOR cc IN (pn_row_count + 1) .. (pn_row_count + 6 * pfn_count)
    LOOP
      IF MOD (cc, 3) = 2
      THEN
        IF pct_out (cc) + pct_out (cc + 1) = 0
        THEN
          pn_dop := 0;
        ELSE
          pn_dop := (pct_patology (cc) + pct_patology (cc + 1)) / (pct_out (cc) + pct_out (cc + 1)) * 100;
        END IF;

        pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pn_dop, 'FM99999999990.09')||' ',' 0.0 ','&nbsp;') || '</TD>';
      ELSE
        IF pct_out (cc) = 0
        THEN
          pn_dop := 0;
        ELSE
          pn_dop := (pct_patology (cc)) / (pct_out (cc)) * 100;
        END IF;

        pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pn_dop, 'FM99999999990.09')||' ',' 0.0 ','&nbsp;') || '</TD>';
      END IF;
    END LOOP;

--Вывод по отделам
    i := -1;

    FOR cc IN 1 .. pn_row_count
    LOOP
      IF MOD (cc, pfn_count * 6) = 1
      THEN
        pn_number := pn_number + 1;
        pc_str :=
          pc_str || '</TR><TR><TD align = "center">' || pn_number || '</TD><TD>'
          || pct_name (TRUNC ((cc - 1) / (pfn_count * 6)) + 1) || '</TD>';
        i := i + 1;
      END IF;

      IF MOD (cc, 3) = 2
      THEN
        IF pct_out (pn_row_count + cc - i * pfn_count * 6) + pct_out (pn_row_count + cc - i * pfn_count * 6 + 1) = 0
        THEN
          pn_dop := 0;
        ELSE
          pn_dop :=
            (pct_patology (cc) + pct_patology (cc + 1))
            / (pct_out (pn_row_count + cc - i * pfn_count * 6) + pct_out (pn_row_count + cc - i * pfn_count * 6 + 1))
            * 100;
        END IF;

        pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pn_dop, 'FM99999999990.09')||' ',' 0.0 ','&nbsp;') || '</TD>';
      ELSE
        IF pct_out (pn_row_count + cc - i * pfn_count * 6) = 0
        THEN
          pn_dop := 0;
        ELSE
          pn_dop := (pct_patology (cc)) / (pct_out (pn_row_count + cc - i * pfn_count * 6)) * 100;
        END IF;

        pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pn_dop, 'FM99999999990.09')||' ',' 0.0 ','&nbsp;')|| '</TD>';
      END IF;
    END LOOP;

    pc_str := pc_str || '</TR>';
    DBMS_LOB.writeappend (pb_result, LENGTH (pc_str), pc_str);
    /**/
    pn_number := pn_number + 1;
    pc_str :=
      '<TR><TD align = "center">' || pn_number
      || '</TD><TD class="sm_td " ><B>% лиц с патологией от обследованных:</B></TD>';
    pc_strout := '% лиц с патологией от обследованных:';
    progress_bar.setstrout ('Рассчет: ' || pc_strout);
    progress_bar.stepit;

    --Вывод суммарного поля
    FOR cc IN (pn_row_count + 1) .. (pn_row_count + 6 * pfn_count)
    LOOP
      IF MOD (cc, 3) = 2
      THEN
        IF pct_obs_pac (cc) + pct_obs_pac (cc + 1) = 0
        THEN
          pn_dop := 0;
        ELSE
          pn_dop := (pct_patology (cc) + pct_patology (cc + 1)) / (pct_obs_pac (cc) + pct_obs_pac (cc + 1)) * 100;
        END IF;

        pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pn_dop, 'FM99999999990.09')||' ',' 0.0 ','&nbsp;') || '</TD>';
      ELSE
        IF pct_obs_pac (cc) = 0
        THEN
          pn_dop := 0;
        ELSE
          pn_dop := (pct_patology (cc)) / (pct_obs_pac (cc)) * 100;
        END IF;

        pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pn_dop, 'FM99999999990.09')||' ',' 0.0 ','&nbsp;') || '</TD>';
      END IF;
    END LOOP;

--Вывод по отделам
    FOR cc IN 1 .. pn_row_count
    LOOP
      IF MOD (cc, pfn_count * 6) = 1
      THEN
        pn_number := pn_number + 1;
        pc_str :=
          pc_str || '</TR><TR><TD align = "center">' || pn_number || '</TD><TD>'
          || pct_name (TRUNC ((cc - 1) / (pfn_count * 6)) + 1) || '</TD>';
      END IF;

      IF MOD (cc, 3) = 2
      THEN
        IF pct_obs_pac (cc) + pct_obs_pac (cc + 1) = 0
        THEN
          pn_dop := 0;
        ELSE
          pn_dop := (pct_patology (cc) + pct_patology (cc + 1)) / (pct_obs_pac (cc) + pct_obs_pac (cc + 1)) * 100;
        END IF;

        pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pn_dop, 'FM99999999990.09')||' ',' 0.0 ','&nbsp;') || '</TD>';
      ELSE
        IF pct_obs_pac (cc) = 0
        THEN
          pn_dop := 0;
        ELSE
          pn_dop := (pct_patology (cc)) / pct_obs_pac (cc) * 100;
        END IF;

        pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pn_dop, 'FM99999999990.09')||' ',' 0.0 ','&nbsp;') || '</TD>';
      END IF;
    END LOOP;

    pc_str := pc_str || '</TR>';
    DBMS_LOB.writeappend (pb_result, LENGTH (pc_str), pc_str);
    /**/
    pn_number := pn_number + 1;
    pc_str :=
            '<TR><TD align = "center">' || pn_number || '</TD><TD class="sm_td " ><B>Повторно обследовано лиц:</B></TD>';
    pc_strout := 'Повторно обследовано лиц';
    progress_bar.setstrout ('Рассчет: ' || pc_strout);
    progress_bar.stepit;

    FOR cc IN c_povtor_obsl (pd_dateb, pd_datee)
    LOOP
      pct_povtor_obsl (c_povtor_obsl%ROWCOUNT) := cc.fn_count;
    END LOOP;

--Вывод суммарного поля
    FOR cc IN (pn_row_count + 1) .. (pn_row_count + 6 * pfn_count)
    LOOP
      IF MOD (cc, 3) = 2
      THEN
        pc_str :=
                pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pct_povtor_obsl (cc) + pct_povtor_obsl (cc + 1))||' ',' 0 ','&nbsp;')
                || '</TD>';
      ELSE
        pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pct_povtor_obsl (cc))||' ',' 0 ','&nbsp;') || '</TD>';
      END IF;
    END LOOP;

--Вывод по отделам
    FOR cc IN 1 .. pn_row_count
    LOOP
      IF MOD (cc, pfn_count * 6) = 1
      THEN
        pn_number := pn_number + 1;
        pc_str :=
          pc_str || '</TR><TR><TD align = "center">' || pn_number || '</TD><TD>'
          || pct_name (TRUNC ((cc - 1) / (pfn_count * 6)) + 1) || '</TD>';
      END IF;

      IF MOD (cc, 3) = 2
      THEN
        pc_str :=
                pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pct_povtor_obsl (cc) + pct_povtor_obsl (cc + 1))||' ',' 0 ','&nbsp;')
                || '</TD>';
      ELSE
        pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pct_povtor_obsl (cc))||' ',' 0 ','&nbsp;') || '</TD>';
      END IF;
    END LOOP;

    pc_str := pc_str || '</TR>';
    DBMS_LOB.writeappend (pb_result, LENGTH (pc_str), pc_str);
    /**/
    pn_number := pn_number + 1;
    pc_str :=
      '<TR><TD align = "center">' || pn_number
      || '</TD><TD class="sm_td " ><B>% повторно обследованных от выписанных:</B></TD>';
    pc_strout := '% повторно обследованных от выписанных';
    progress_bar.setstrout ('Рассчет: ' || pc_strout);
    progress_bar.stepit;

    --Вывод суммарного поля
    FOR cc IN (pn_row_count + 1) .. (pn_row_count + 6 * pfn_count)
    LOOP
      IF MOD (cc, 3) = 2
      THEN
        IF pct_out (cc) + pct_out (cc + 1) = 0
        THEN
          pn_dop := 0;
        ELSE
          pn_dop := (pct_povtor_obsl (cc) + pct_povtor_obsl (cc + 1)) / (pct_out (cc) + pct_out (cc + 1)) * 100;
        END IF;

        pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pn_dop, 'FM99999999990.09')||' ',' 0.0 ','&nbsp;') || '</TD>';
      ELSE
        IF pct_out (cc) = 0
        THEN
          pn_dop := 0;
        ELSE
          pn_dop := (pct_povtor_obsl (cc)) / (pct_out (cc)) * 100;
        END IF;

        pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pn_dop, 'FM99999999990.09')||' ',' 0.0 ','&nbsp;') || '</TD>';
      END IF;
    END LOOP;

--Вывод по отделам
    i := -1;

    FOR cc IN 1 .. pn_row_count
    LOOP
      IF MOD (cc, pfn_count * 6) = 1
      THEN
        pn_number := pn_number + 1;
        pc_str :=
          pc_str || '</TR><TR><TD align = "center">' || pn_number || '</TD><TD>'
          || pct_name (TRUNC ((cc - 1) / (pfn_count * 6)) + 1) || '</TD>';
        i := i + 1;
      END IF;

      IF MOD (cc, 3) = 2
      THEN
        IF pct_out (pn_row_count + cc - i * pfn_count * 6) + pct_out (pn_row_count + cc - i * pfn_count * 6 + 1) = 0
        THEN
          pn_dop := 0;
        ELSE
          pn_dop :=
            (pct_povtor_obsl (cc) + pct_povtor_obsl (cc + 1))
            / (pct_out (pn_row_count + cc - i * pfn_count * 6) + pct_out (pn_row_count + cc - i * pfn_count * 6 + 1))
            * 100;
        END IF;

        pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pn_dop, 'FM99999999990.09')||' ',' 0.0 ','&nbsp;') || '</TD>';
      ELSE
        IF pct_out (pn_row_count + cc - i * pfn_count * 6) = 0
        THEN
          pn_dop := 0;
        ELSE
          pn_dop := (pct_povtor_obsl (cc)) / (pct_out (pn_row_count + cc - i * pfn_count * 6)) * 100;
        END IF;

        pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pn_dop, 'FM99999999990.09')||' ',' 0.0 ','&nbsp;') || '</TD>';
      END IF;
    END LOOP;

    pc_str := pc_str || '</TR>';
    DBMS_LOB.writeappend (pb_result, LENGTH (pc_str), pc_str);
    /**/
    pn_number := pn_number + 1;
    pc_str :=
      '<TR><TD align = "center">' || pn_number
      || '</TD><TD class="sm_td " ><B>% повторно обследованных от обследованных:</B></TD>';
    pc_strout := '% повторно обследованных от обследованных:';
    progress_bar.setstrout ('Рассчет: ' || pc_strout);
    progress_bar.stepit;

    --Вывод суммарного поля
    FOR cc IN (pn_row_count + 1) .. (pn_row_count + 6 * pfn_count)
    LOOP
      IF MOD (cc, 3) = 2
      THEN
        IF pct_obs_pac (cc) + pct_obs_pac (cc + 1) = 0
        THEN
          pn_dop := 0;
        ELSE
          pn_dop := (pct_povtor_obsl (cc) + pct_povtor_obsl (cc + 1)) / (pct_obs_pac (cc) + pct_obs_pac (cc + 1)) * 100;
        END IF;

        pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pn_dop, 'FM99999999990.09')||' ',' 0.0 ','&nbsp;') || '</TD>';
      ELSE
        IF pct_obs_pac (cc) = 0
        THEN
          pn_dop := 0;
        ELSE
          pn_dop := (pct_povtor_obsl (cc)) / (pct_obs_pac (cc)) * 100;
        END IF;

        pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pn_dop, 'FM99999999990.09')||' ',' 0.0 ','&nbsp;') || '</TD>';
      END IF;
    END LOOP;

--Вывод по отделам
    FOR cc IN 1 .. pn_row_count
    LOOP
      IF MOD (cc, pfn_count * 6) = 1
      THEN
        pn_number := pn_number + 1;
        pc_str :=
          pc_str || '</TR><TR><TD align = "center">' || pn_number || '</TD><TD>'
          || pct_name (TRUNC ((cc - 1) / (pfn_count * 6)) + 1) || '</TD>';
      END IF;

      IF MOD (cc, 3) = 2
      THEN
        IF pct_obs_pac (cc) + pct_obs_pac (cc + 1) = 0
        THEN
          pn_dop := 0;
        ELSE
          pn_dop := (pct_povtor_obsl (cc) + pct_povtor_obsl (cc + 1)) / (pct_obs_pac (cc) + pct_obs_pac (cc + 1)) * 100;
        END IF;

        pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pn_dop, 'FM99999999990.09')||' ',' 0.0 ','&nbsp;') || '</TD>';
      ELSE
        IF pct_obs_pac (cc) = 0
        THEN
          pn_dop := 0;
        ELSE
          pn_dop := (pct_povtor_obsl (cc)) / pct_obs_pac (cc) * 100;
        END IF;

        pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pn_dop, 'FM99999999990.09')||' ',' 0.0 ','&nbsp;') || '</TD>';
      END IF;
    END LOOP;

    pc_str := pc_str || '</TR>';
    DBMS_LOB.writeappend (pb_result, LENGTH (pc_str), pc_str);
    /**/
    --
    pn_number := pn_number + 1;
    pc_str :=
      '<TR><TD align = "center">' || pn_number
      || '</TD><TD class="sm_td " ><B>Повторно обследовано лиц с патологией:</B></TD>';
    pc_strout := 'Повторно обследовано лиц с патологией';
    progress_bar.setstrout ('Рассчет: ' || pc_strout);
    progress_bar.stepit;

    FOR cc IN c_povt_pat (pd_dateb, pd_datee)
    LOOP
      pct_povt_pat (c_povt_pat%ROWCOUNT) := cc.fn_count;
    END LOOP;

--Вывод суммарного поля
    FOR cc IN (pn_row_count + 1) .. (pn_row_count + 6 * pfn_count)
    LOOP
      IF MOD (cc, 3) = 2
      THEN
        pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pct_povt_pat (cc) + pct_povt_pat (cc + 1))||' ',' 0 ','&nbsp;') || '</TD>';
      ELSE
        pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pct_povt_pat (cc))||' ',' 0 ','&nbsp;') || '</TD>';
      END IF;
    END LOOP;

--Вывод по отделам
    FOR cc IN 1 .. pn_row_count
    LOOP
      IF MOD (cc, pfn_count * 6) = 1
      THEN
        pn_number := pn_number + 1;
        pc_str :=
          pc_str || '</TR><TR><TD align = "center">' || pn_number || '</TD><TD>'
          || pct_name (TRUNC ((cc - 1) / (pfn_count * 6)) + 1) || '</TD>';
      END IF;

      IF MOD (cc, 3) = 2
      THEN
        pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pct_povt_pat (cc) + pct_povt_pat (cc + 1))||' ',' 0 ','&nbsp;') || '</TD>';
      ELSE
        pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pct_povt_pat (cc))||' ',' 0 ','&nbsp;') || '</TD>';
      END IF;
    END LOOP;

    pc_str := pc_str || '</TR>';
    DBMS_LOB.writeappend (pb_result, LENGTH (pc_str), pc_str);
    /**/
    pn_number := pn_number + 1;
    pc_str :=
      '<TR><TD align = "center">' || pn_number
      || '</TD><TD class="sm_td " ><B>% повторно обследованных с патологией от выписанных:</B></TD>';
    pc_strout := '% повторно обследованных с патологией от выписанных';
    progress_bar.setstrout ('Рассчет: ' || pc_strout);
    progress_bar.stepit;

    --Вывод суммарного поля
    FOR cc IN (pn_row_count + 1) .. (pn_row_count + 6 * pfn_count)
    LOOP
      IF MOD (cc, 3) = 2
      THEN
        IF pct_out (cc) + pct_out (cc + 1) = 0
        THEN
          pn_dop := 0;
        ELSE
          pn_dop := (pct_povt_pat (cc) + pct_povt_pat (cc + 1)) / (pct_out (cc) + pct_out (cc + 1)) * 100;
        END IF;

        pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pn_dop, 'FM99999999990.09')||' ',' 0.0 ','&nbsp;') || '</TD>';
      ELSE
        IF pct_out (cc) = 0
        THEN
          pn_dop := 0;
        ELSE
          pn_dop := (pct_povt_pat (cc)) / (pct_out (cc)) * 100;
        END IF;

        pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pn_dop, 'FM99999999990.09')||' ',' 0.0 ','&nbsp;') || '</TD>';
      END IF;
    END LOOP;

--Вывод по отделам
    i := -1;

    FOR cc IN 1 .. pn_row_count
    LOOP
      IF MOD (cc, pfn_count * 6) = 1
      THEN
        pn_number := pn_number + 1;
        pc_str :=
          pc_str || '</TR><TR><TD align = "center">' || pn_number || '</TD><TD>'
          || pct_name (TRUNC ((cc - 1) / (pfn_count * 6)) + 1) || '</TD>';
        i := i + 1;
      END IF;

      IF MOD (cc, 3) = 2
      THEN
        IF pct_out (pn_row_count + cc - i * pfn_count * 6) + pct_out (pn_row_count + cc - i * pfn_count * 6 + 1) = 0
        THEN
          pn_dop := 0;
        ELSE
          pn_dop :=
            (pct_povt_pat (cc) + pct_povt_pat (cc + 1))
            / (pct_out (pn_row_count + cc - i * pfn_count * 6) + pct_out (pn_row_count + cc - i * pfn_count * 6 + 1))
            * 100;
        END IF;

        pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pn_dop, 'FM99999999990.09')||' ',' 0.0 ','&nbsp;') || '</TD>';
      ELSE
        IF pct_out (pn_row_count + cc - i * pfn_count * 6) = 0
        THEN
          pn_dop := 0;
        ELSE
          pn_dop := (pct_povt_pat (cc)) / (pct_out (pn_row_count + cc - i * pfn_count * 6)) * 100;
        END IF;

        pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pn_dop, 'FM99999999990.09')||' ',' 0.0 ','&nbsp;') || '</TD>';
      END IF;
    END LOOP;

    pc_str := pc_str || '</TR>';
    DBMS_LOB.writeappend (pb_result, LENGTH (pc_str), pc_str);
    /**/
    pn_number := pn_number + 1;
    pc_str :=
      '<TR><TD align = "center">' || pn_number
      || '</TD><TD class="sm_td " ><B>% повторно обследованых лиц с патологией от обследованных с патологией:</B></TD>';
    pc_strout := '% повторно обследованых лиц с патологией от обследованных с патологией:';
    progress_bar.setstrout ('Рассчет: ' || pc_strout);
    progress_bar.stepit;

    --Вывод суммарного поля
    FOR cc IN (pn_row_count + 1) .. (pn_row_count + 6 * pfn_count)
    LOOP
      IF MOD (cc, 3) = 2
      THEN
        IF pct_patology (cc) + pct_patology (cc + 1) = 0
        THEN
          pn_dop := 0;
        ELSE
          pn_dop := (pct_povt_pat (cc) + pct_povt_pat (cc + 1)) / (pct_patology (cc) + pct_patology (cc + 1)) * 100;
        END IF;

        pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pn_dop, 'FM99999999990.09')||' ',' 0.0 ','&nbsp;') || '</TD>';
      ELSE
        IF pct_patology (cc) = 0
        THEN
          pn_dop := 0;
        ELSE
          pn_dop := (pct_povt_pat (cc)) / (pct_patology (cc)) * 100;
        END IF;

        pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pn_dop, 'FM99999999990.09')||' ',' 0.0 ','&nbsp;') || '</TD>';
      END IF;
    END LOOP;

--Вывод по отделам
    FOR cc IN 1 .. pn_row_count
    LOOP
      IF MOD (cc, pfn_count * 6) = 1
      THEN
        pn_number := pn_number + 1;
        pc_str :=
          pc_str || '</TR><TR><TD align = "center">' || pn_number || '</TD><TD>'
          || pct_name (TRUNC ((cc - 1) / (pfn_count * 6)) + 1) || '</TD>';
      END IF;

      IF MOD (cc, 3) = 2
      THEN
        IF pct_patology (cc) + pct_patology (cc + 1) = 0
        THEN
          pn_dop := 0;
        ELSE
          pn_dop := (pct_povt_pat (cc) + pct_povt_pat (cc + 1)) / (pct_patology (cc) + pct_patology (cc + 1)) * 100;
        END IF;

        pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pn_dop, 'FM99999999990.09')||' ',' 0.0 ','&nbsp;') || '</TD>';
      ELSE
        IF pct_patology (cc) = 0
        THEN
          pn_dop := 0;
        ELSE
          pn_dop := (pct_povt_pat (cc)) / pct_patology (cc) * 100;
        END IF;

        pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pn_dop, 'FM99999999990.09')||' ',' 0.0 ','&nbsp;') || '</TD>';
      END IF;
    END LOOP;

    pc_str := pc_str || '</TR>';
    DBMS_LOB.writeappend (pb_result, LENGTH (pc_str), pc_str);
    /**/
    pn_number := pn_number + 1;
    pc_str :=
      '<TR><TD align = "center">' || pn_number
      || '</TD><TD class="sm_td " ><B>Обследовано отдыхающих по категории без направления:</B></TD>';
    pc_strout := 'отдыхающих по категории без направления';
    progress_bar.setstrout ('Рассчет: ' || pc_strout);
    progress_bar.stepit;

    FOR cc IN c_pac_without (pd_dateb, pd_datee)
    LOOP
      pct_pac_without (c_pac_without%ROWCOUNT) := cc.fn_count;
    END LOOP;

--Вывод суммарного поля
    FOR cc IN (pn_row_count + 1) .. (pn_row_count + 6 * pfn_count)
    LOOP
      IF MOD (cc, 3) = 2
      THEN
        pc_str :=
                pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pct_pac_without (cc) + pct_pac_without (cc + 1))||' ',' 0 ','&nbsp;')
                || '</TD>';
      ELSE
        pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pct_pac_without (cc))||' ',' 0 ','&nbsp;') || '</TD>';
      END IF;
    END LOOP;

--Вывод по отделам
    FOR cc IN 1 .. pn_row_count
    LOOP
      IF MOD (cc, pfn_count * 6) = 1
      THEN
        pn_number := pn_number + 1;
        pc_str :=
          pc_str || '</TR><TR><TD align = "center">' || pn_number || '</TD><TD>'
          || pct_name (TRUNC ((cc - 1) / (pfn_count * 6)) + 1) || '</TD>';
      END IF;

      IF MOD (cc, 3) = 2
      THEN
        pc_str :=
                pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pct_pac_without (cc) + pct_pac_without (cc + 1))||' ',' 0 ','&nbsp;')
                || '</TD>';
      ELSE
        pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pct_pac_without (cc))||' ',' 0 ','&nbsp;') || '</TD>';
      END IF;
    END LOOP;

    pc_str := pc_str || '</TR>';
    DBMS_LOB.writeappend (pb_result, LENGTH (pc_str), pc_str);
    /**/
    pn_number := pn_number + 1;
    pc_str :=
      '<TR><TD align = "center">' || pn_number
      || '</TD><TD class="sm_td " ><B>Количество исследований для категории без направления:</B></TD>';
    pc_strout := 'Количества исследований для категории без направления';
    progress_bar.setstrout ('Рассчет: ' || pc_strout);
    progress_bar.stepit;

    FOR cc IN c_issl_without (pd_dateb, pd_datee)
    LOOP
      pct_issl_without (c_issl_without%ROWCOUNT) := cc.fn_count;
    END LOOP;

    FOR cc IN (pn_row_count + 1) .. (pn_row_count + 6 * pfn_count)
    LOOP
      FOR i IN 0 .. (pn_otdel_count - 1)
      LOOP
        pct_issl_without (cc) := pct_issl_without (cc) + pct_issl_without (cc - pn_row_count + i * pfn_count * 6);
      END LOOP;
    END LOOP;

--Вывод суммарного поля
    FOR cc IN (pn_row_count + 1) .. (pn_row_count + 6 * pfn_count)
    LOOP
      IF MOD (cc, 3) = 2
      THEN
        pc_str :=
              pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pct_issl_without (cc) + pct_issl_without (cc + 1))||' ',' 0 ','&nbsp;')
              || '</TD>';
      ELSE
        pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pct_issl_without (cc))||' ',' 0 ','&nbsp;') || '</TD>';
      END IF;
    END LOOP;

--Вывод по отделам
    FOR cc IN 1 .. pn_row_count
    LOOP
      IF MOD (cc, pfn_count * 6) = 1
      THEN
        pn_number := pn_number + 1;
        pc_str :=
          pc_str || '</TR><TR><TD align = "center">' || pn_number || '</TD><TD>'
          || pct_name (TRUNC ((cc - 1) / (pfn_count * 6)) + 1) || '</TD>';
      END IF;

      IF MOD (cc, 3) = 2
      THEN
        pc_str :=
              pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pct_issl_without (cc) + pct_issl_without (cc + 1))||' ',' 0 ','&nbsp;')
              || '</TD>';
      ELSE
        pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pct_issl_without (cc))||' ',' 0 ','&nbsp;') || '</TD>';
      END IF;
    END LOOP;

    pc_str := pc_str || '</TR>';
    DBMS_LOB.writeappend (pb_result, LENGTH (pc_str), pc_str);
    /**/
    pn_number := pn_number + 1;
    pc_str :=
      '<TR><TD align = "center">' || pn_number
      || '</TD><TD class="sm_td " ><B>Итого по лаборатории выполнено исследований:</B></TD>';
    pc_strout := 'Итого по лаборатории выполнено исследований';
    progress_bar.setstrout ('Рассчет: ' || pc_strout);
    progress_bar.stepit;

--Вывод суммарного поля
    FOR cc IN (pn_row_count + 1) .. (pn_row_count + 6 * pfn_count)
    LOOP
      IF MOD (cc, 3) = 2
      THEN
        pc_str :=
          pc_str || '<TD align = "center">'
          || replace(' '||TO_CHAR (pct_issl_without (cc) + pct_issl_without (cc + 1) + pct_issl (cc) + pct_issl (cc + 1))||' ',' 0 ','&nbsp;') || '</TD>';
      ELSE
        pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pct_issl_without (cc) + pct_issl (cc))||' ',' 0 ','&nbsp;') || '</TD>';
      END IF;
    END LOOP;

--Вывод по отделам
    FOR cc IN 1 .. pn_row_count
    LOOP
      IF MOD (cc, pfn_count * 6) = 1
      THEN
        pn_number := pn_number + 1;
        pc_str :=
          pc_str || '</TR><TR><TD align = "center">' || pn_number || '</TD><TD>'
          || pct_name (TRUNC ((cc - 1) / (pfn_count * 6)) + 1) || '</TD>';
      END IF;

      IF MOD (cc, 3) = 2
      THEN
        pc_str :=
          pc_str || '<TD align = "center">'
          || replace(' '||TO_CHAR (pct_issl_without (cc) + pct_issl_without (cc + 1) + pct_issl (cc) + pct_issl (cc + 1))||' ',' 0 ','&nbsp;') || '</TD>';
      ELSE
        pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pct_issl_without (cc) + pct_issl (cc))||' ',' 0 ','&nbsp;')|| '</TD>';
      END IF;
    END LOOP;

    pc_str := pc_str || '</TR>';
    DBMS_LOB.writeappend (pb_result, LENGTH (pc_str), pc_str);
    /**/
    pn_number := pn_number + 1;
    pc_str :=
      '<TR><TD align = "center">' || pn_number
      || '</TD><TD class="sm_td " ><B>Итого по лаборатории выполнено исследований для пациентов:</B></TD>';
    pc_strout := 'Итого по лаборатории выполнено исследований для пациентов';
    progress_bar.setstrout ('Рассчет: ' || pc_strout);
    progress_bar.stepit;

--Вывод суммарного поля
    FOR cc IN (pn_row_count + 1) .. (pn_row_count + 6 * pfn_count)
    LOOP
      IF MOD (cc, 3) = 2
      THEN
        pc_str :=
          pc_str || '<TD align = "center">'
          || replace(' '||TO_CHAR (pct_issl_without (cc) + pct_issl_without (cc + 1) + pct_issl (cc) + pct_issl (cc + 1))||' ',' 0 ','&nbsp;') || '</TD>';
      ELSE
        pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pct_issl_without (cc) + pct_issl (cc))||' ',' 0 ','&nbsp;') || '</TD>';
      END IF;
    END LOOP;

--Вывод по отделам
    FOR cc IN 1 .. pn_row_count
    LOOP
      IF MOD (cc, pfn_count * 6) = 1
      THEN
        pn_number := pn_number + 1;
        pc_str :=
          pc_str || '</TR><TR><TD align = "center">' || pn_number || '</TD><TD>'
          || pct_name (TRUNC ((cc - 1) / (pfn_count * 6)) + 1) || '</TD>';
      END IF;

      IF MOD (cc, 3) = 2
      THEN
        pc_str :=
          pc_str || '<TD align = "center">'
          || replace(' '||TO_CHAR (pct_issl_without (cc) + pct_issl_without (cc + 1) + pct_issl (cc) + pct_issl (cc + 1)) ||' ',' 0 ','&nbsp;')|| '</TD>';
      ELSE
        pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pct_issl_without (cc) + pct_issl (cc))||' ',' 0 ','&nbsp;') || '</TD>';
      END IF;
    END LOOP;

    pc_str := pc_str || '</TR>';
    DBMS_LOB.writeappend (pb_result, LENGTH (pc_str), pc_str);
    /**/
    pn_number := pn_number + 1;
    pc_str :=
      '<TR><TD align = "center">' || pn_number
      || '</TD><TD class="sm_td " ><B>Итого по лаборатории обследованно человек:</B></TD>';
    pc_strout := 'Итого по лаборатории обследованно человек';
    progress_bar.setstrout ('Рассчет: ' || pc_strout);
    progress_bar.stepit;

--Вывод суммарного поля
    FOR cc IN (pn_row_count + 1) .. (pn_row_count + 6 * pfn_count)
    LOOP
      IF MOD (cc, 3) = 2
      THEN
        pc_str :=
          pc_str || '<TD align = "center">'
          || replace(' '||TO_CHAR (pct_pac_without (cc) + pct_pac_without (cc + 1) + pct_obs_pac (cc) + pct_obs_pac (cc + 1))||' ',' 0 ','&nbsp;')
          || '</TD>';
      ELSE
        pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pct_pac_without (cc) + pct_obs_pac (cc))||' ',' 0 ','&nbsp;') || '</TD>';
      END IF;
    END LOOP;

--Вывод по отделам
    FOR cc IN 1 .. pn_row_count
    LOOP
      IF MOD (cc, pfn_count * 6) = 1
      THEN
        pn_number := pn_number + 1;
        pc_str :=
          pc_str || '</TR><TR><TD align = "center">' || pn_number || '</TD><TD>'
          || pct_name (TRUNC ((cc - 1) / (pfn_count * 6)) + 1) || '</TD>';
      END IF;

      IF MOD (cc, 3) = 2
      THEN
        pc_str :=
          pc_str || '<TD align = "center">'
          || replace(' '||TO_CHAR (pct_pac_without (cc) + pct_pac_without (cc + 1) + pct_obs_pac (cc) + pct_obs_pac (cc + 1))||' ',' 0 ','&nbsp;')
          || '</TD>';
      ELSE
        pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pct_pac_without (cc) + pct_obs_pac (cc))||' ',' 0 ','&nbsp;') || '</TD>';
      END IF;
    END LOOP;

    pc_str := pc_str || '</TR>';
    DBMS_LOB.writeappend (pb_result, LENGTH (pc_str), pc_str);
    /**/
    pc_str := '</table>';
    pc_str := pc_str || '</BODY>';
    pc_str := pc_str || '</HTML>';
    DBMS_LOB.writeappend (pb_result, LENGTH (pc_str), pc_str);

    INSERT INTO tclobs
                (fc_clob)
         VALUES (pb_result)
      RETURNING fk_id
           INTO pn_result;

    RETURN pn_result;
  END;
END;
/

SHOW ERRORS;


