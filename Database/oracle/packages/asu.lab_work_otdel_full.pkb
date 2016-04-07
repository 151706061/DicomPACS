DROP PACKAGE BODY ASU.LAB_WORK_OTDEL_FULL
/

--
-- LAB_WORK_OTDEL_FULL  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."LAB_WORK_OTDEL_FULL" 
IS
  vdate1 DATE;
  vdate2 DATE;
  vfk_otdelid NUMBER;

  TYPE ct_line IS TABLE OF INTEGER
    INDEX BY BINARY_INTEGER;

  FUNCTION get_report_header
    RETURN VARCHAR2
  IS
    RESULT VARCHAR2 (32767);
  BEGIN
    RESULT :=
      get_html_header || '<BODY><P ALIGN="CENTER"><B><font size="+1">Клинико - диагностическая лаборатория санатория "'
      || pkg_smini.readstring ('CONFIG', 'S_NAME', 'Не известен') || '"</font></B><BR>';
    RESULT :=
      RESULT || '<ALIGN="CENTER"><font size="+1">Отчет о работе по отделу:  ' || get_name_from_smid (vfk_otdelid)
      || '</font><br>';
    RESULT :=
           RESULT || 'за период с ' || TO_CHAR (vdate1, 'dd.mm.yyyy') || ' по ' || TO_CHAR (vdate2, 'dd.mm.yyyy')
           || ' .';
    RETURN RESULT;
  END;

  FUNCTION get_report (pfd_dateb IN DATE, pfd_datee IN DATE, pfk_otdel IN NUMBER)
    RETURN NUMBER
  IS
    pb_result CLOB;   --Временный клоб в который все будет складываться
    pn_result NUMBER;   --Идентификатор из TCLOBS
    pc_str VARCHAR2 (32000);   /*Переменная в которую будут собираться
                               данные до вставки во временный CLOB*/
    pc_str_razd VARCHAR2 (32000) DEFAULT ' ';                                           /*Переменная в которую будут собираться
                                               данные для разделов и потом присовокупяться к строке pc_str*/
    pn_number NUMBER DEFAULT 1;   --Счетчик для номера
    pc_strout VARCHAR2 (255);   -- Выводимые данные пока собираеться отчет
    pct_line ct_line;   --массив значений из запроса для некоторых запросов результаты которых не требуються в последствии
    pct_issl ct_line;   --массив значений для исследований
    pct_out ct_line;   --массив значений для выписанных
    pct_obs_pac ct_line;   --массив значений для обследованных пациентов
    pct_patology ct_line;   --массив значений для обследованных пациентов с выявленной патологией
    pct_povtor_obsl ct_line;   --массив значений для повторно обследованных пациентов
    pct_povt_pat ct_line;   --массив значений для повторно обследованных пациентов c патологией
    pct_pat_res ct_line;   --Количество патологических результатов
    pn_summ NUMBER;   --Переменная для столбца Итого для некоторых запросов результаты которых не требуються в последствии
    pn_dop NUMBER;   --Пееременная куда складываються промежуточные вычисления для облегчения понимания кода

    CURSOR crazd (ck_otdel NUMBER)   -- Получение всех подразделов у отдела
    IS
      SELECT     fk_id, fc_name
            FROM tsmid
           WHERE fl_showanal = 1 AND fl_stat = 1
      START WITH fk_id = ck_otdel
      CONNECT BY PRIOR fk_id = fk_owner
        ORDER BY fn_order;

    CURSOR c_live_put (pfd_dateb DATE, pfd_datee DATE)   --Количество проживающих по путевке
    IS
      SELECT   SUM (fn_count) fn_count
          FROM (SELECT *
                  FROM (SELECT   COUNT (*) fn_count, fk_townid, fn_age
                            FROM (SELECT t.fk_id,
                                         DECODE (TRUNC ((MONTHS_BETWEEN (TRUNC (tp.fd_date_in), t.fd_rojd) / 12)
                                                        / pkg_core.get_constbyname ('CHILD_AGE')),
                                                 0, 2,
                                                 t.fp_sex) fn_age,   --Получаем 2 если человеку меньше pkg_core.get_constbyname('CHILD_AGE') и пол если больше
                                         DECODE (ta.fk_townid, 101632, 1, 0) AS fk_townid   --101632 код Югорска
                                    FROM tkarta t, tadress ta, (SELECT fd_data1 fd_date_in, fk_pacid
                                                                  FROM tsroky
                                                                 WHERE fk_pryb = 2) tp,   -- 2 - Заезд
                                         (SELECT fd_data1 fd_date_out, fk_pacid
                                            FROM tsroky
                                           WHERE fk_pryb = 3) tv   -- 3 - Выезд
                                   WHERE t.fk_id = tp.fk_pacid AND t.fk_id = tv.fk_pacid AND ta.fk_pacid = t.fk_peplid
                                         AND ((pfd_dateb BETWEEN tp.fd_date_in AND tv.fd_date_out)
                                              OR (pfd_datee BETWEEN tp.fd_date_in AND tv.fd_date_out)
                                              OR (pfd_dateb > tp.fd_date_in AND pfd_datee < tv.fd_date_out)
                                              OR (pfd_dateb < tp.fd_date_in AND pfd_datee > tv.fd_date_out)))
                        GROUP BY fk_townid, fn_age)
                UNION
                SELECT 0, 0, 2
                  FROM DUAL
                UNION
                SELECT 0, 0, 1
                  FROM DUAL
                UNION
                SELECT 0, 0, 0
                  FROM DUAL
                UNION
                SELECT 0, 1, 2
                  FROM DUAL
                UNION
                SELECT 0, 1, 1
                  FROM DUAL
                UNION
                SELECT 0, 1, 0
                  FROM DUAL)
      GROUP BY fk_townid, fn_age
      ORDER BY fk_townid, fn_age DESC;

    CURSOR c_out (pfd_dateb DATE, pfd_datee DATE)   --Количество выписанных
    IS
      SELECT   SUM (fn_count) fn_count
          FROM (SELECT *
                  FROM (SELECT   COUNT (*) fn_count, fk_townid, fn_age
                            FROM (SELECT t.fk_id,
                                         DECODE (TRUNC ((MONTHS_BETWEEN (TRUNC (tp.fd_date_in), t.fd_rojd) / 12)
                                                        / pkg_core.get_constbyname ('CHILD_AGE')),
                                                 0, 2,
                                                 t.fp_sex) fn_age,   --Получаем 2 если человеку меньше pkg_core.get_constbyname('CHILD_AGE') и пол если больше
                                         DECODE (ta.fk_townid, 101632, 1, 0) AS fk_townid
                                    FROM tsroky ts, tkarta t, tadress ta, (SELECT fd_data1 fd_date_in, fk_pacid
                                                                             FROM tsroky
                                                                            WHERE fk_pryb = 2) tp
                                   WHERE t.fk_id = ts.fk_pacid AND tp.fk_pacid = t.fk_id AND ta.fk_pacid = t.fk_peplid
                                         AND ts.fk_pryb = 3 AND TRUNC (ts.fd_data1) BETWEEN pfd_dateb AND pfd_datee)
                        GROUP BY fk_townid, fn_age)
                UNION
                SELECT 0, 0, 2
                  FROM DUAL
                UNION
                SELECT 0, 0, 1
                  FROM DUAL
                UNION
                SELECT 0, 0, 0
                  FROM DUAL
                UNION
                SELECT 0, 1, 2
                  FROM DUAL
                UNION
                SELECT 0, 1, 1
                  FROM DUAL
                UNION
                SELECT 0, 1, 0
                  FROM DUAL)
      GROUP BY fk_townid, fn_age
      ORDER BY fk_townid, fn_age DESC;

    CURSOR c_obs_pac (pfd_dateb DATE, pfd_datee DATE, pfk_otdel NUMBER)   --кол-во обследованных
    IS
      SELECT   SUM (fn_count) fn_count
          FROM (SELECT   COUNT (*) fn_count, fk_townid, fn_age
                    FROM (SELECT DISTINCT t.fk_id,
                                          DECODE (TRUNC ((MONTHS_BETWEEN (TRUNC (tp.fd_date_in), t.fd_rojd) / 12)
                                                         / dd.fn_child),
                                                  0, 2,
                                                  t.fp_sex) fn_age,   --Получаем 2 если человеку меньше pkg_core.get_constbyname('CHILD_AGE') и пол если больше
                                          DECODE (ta.fk_townid, 101632, 1, 0) AS fk_townid
                                     FROM vresan v, tkarta t, tadress ta,
                                          (SELECT pkg_core.get_constbyname ('CHILD_AGE') fn_child
                                             FROM DUAL) dd, (SELECT fd_data1 fd_date_in, fk_pacid
                                                               FROM tsroky
                                                              WHERE fk_pryb = 2) tp   -- 2 - Заезд
                                    WHERE t.fk_id = tp.fk_pacid AND ta.fk_pacid = t.fk_peplid AND t.fk_id = v.fk_pacid
                                          AND v.fk_razdid IN (SELECT fk_id
                                                                FROM tsmid
                                                               WHERE fk_owner = pfk_otdel)
                                          AND v.fd_ins BETWEEN pfd_dateb AND pfd_datee)
                GROUP BY fk_townid, fn_age
                UNION
                SELECT COUNT (*), 2, 0
                  FROM (SELECT DISTINCT v.fk_pacid
                                   FROM vresan v
                                  WHERE v.fk_razdid IN (SELECT fk_id
                                                          FROM tsmid
                                                         WHERE fk_owner = pfk_otdel) AND v.fl_amb = 1
                                        AND v.fd_ins BETWEEN pfd_dateb AND pfd_datee)
                UNION
                SELECT 0, 0, 2
                  FROM DUAL
                UNION
                SELECT 0, 0, 1
                  FROM DUAL
                UNION
                SELECT 0, 0, 0
                  FROM DUAL
                UNION
                SELECT 0, 1, 2
                  FROM DUAL
                UNION
                SELECT 0, 1, 1
                  FROM DUAL
                UNION
                SELECT 0, 1, 0
                  FROM DUAL)
      GROUP BY fk_townid, fn_age
      ORDER BY fk_townid, fn_age DESC;

    CURSOR c_issl_razd (pd_dateb DATE, pd_datee DATE, pk_razd NUMBER)   --кол-во исследований по разделу
    IS
      SELECT   SUM (fn_count) fn_count
          FROM (SELECT   COUNT (1) fn_count, fk_townid, fn_age
                    FROM (SELECT DISTINCT v.fk_smid, v.fk_id,
                                          DECODE (TRUNC ((MONTHS_BETWEEN (TRUNC (tp.fd_date_in), t.fd_rojd) / 12)
                                                         / dd.fn_child),
                                                  0, 2,
                                                  t.fp_sex) fn_age,
                                          DECODE (ta.fk_townid, 101632, 1, 0) AS fk_townid, ss.fk_razdel
                                     FROM vresan v, tkarta t, tadress ta,
                                          (SELECT pkg_core.get_constbyname ('CHILD_AGE') fn_child
                                             FROM DUAL) dd, (SELECT fd_data1 fd_date_in, fk_pacid
                                                               FROM tsroky
                                                              WHERE fk_pryb = 2) tp,
                                          (SELECT   a.fk_id fk_razdel, b.fk_smid, a.fn_order
                                               FROM tisslrazdrows a, tisslrazddeps b
                                              WHERE a.fk_smid = pk_razd AND a.fk_id = b.fk_rowid
                                           ORDER BY a.fn_order) ss
                                    WHERE v.fd_ins BETWEEN pd_dateb AND pd_datee AND t.fk_id = v.fk_pacid
                                          AND tp.fk_pacid = t.fk_id AND ta.fk_pacid = t.fk_peplid
                                          AND v.fk_smid = ss.fk_smid)
                GROUP BY fn_age, fk_townid
                UNION
                SELECT NVL (SUM (fn_count), 0) fn_count, 2, 0
                  FROM (SELECT COUNT (1) fn_count
                          FROM (SELECT v.fk_smid, v.fk_id
                                  FROM vresan v,
                                       (SELECT   a.fk_id fk_razdel, b.fk_smid, a.fn_order
                                            FROM tisslrazdrows a, tisslrazddeps b
                                           WHERE a.fk_smid = pk_razd AND a.fk_id = b.fk_rowid
                                        ORDER BY a.fn_order) ss
                                 WHERE v.fd_ins BETWEEN pd_dateb AND pd_datee AND v.fl_amb = 1
                                       AND v.fk_smid = ss.fk_smid))
                UNION
                SELECT 0, 0, 2
                  FROM DUAL
                UNION
                SELECT 0, 0, 1
                  FROM DUAL
                UNION
                SELECT 0, 0, 0
                  FROM DUAL
                UNION
                SELECT 0, 1, 2
                  FROM DUAL
                UNION
                SELECT 0, 1, 1
                  FROM DUAL
                UNION
                SELECT 0, 1, 0
                  FROM DUAL)
      GROUP BY fk_townid, fn_age
      ORDER BY fk_townid, fn_age DESC;

    CURSOR c_issl_otdel (pd_dateb DATE, pd_datee DATE, pk_otdel NUMBER)   --кол-во исследований по отделу
    IS
      SELECT   SUM (fn_count) fn_count
          FROM (SELECT   COUNT (1) fn_count, fk_townid, fn_age
                    FROM (SELECT DISTINCT v.fk_smid, v.fk_id,
                                          DECODE (TRUNC ((MONTHS_BETWEEN (TRUNC (tp.fd_date_in), t.fd_rojd) / 12)
                                                         / dd.fn_child),
                                                  0, 2,
                                                  t.fp_sex) fn_age,
                                          DECODE (ta.fk_townid, 101632, 1, 0) AS fk_townid, ss.fk_razdel
                                     FROM vresan v, tkarta t, tadress ta,
                                          (SELECT pkg_core.get_constbyname ('CHILD_AGE') fn_child
                                             FROM DUAL) dd, (SELECT fd_data1 fd_date_in, fk_pacid
                                                               FROM tsroky
                                                              WHERE fk_pryb = 2) tp,
                                          (SELECT   a.fk_id fk_razdel, b.fk_smid, a.fn_order
                                               FROM tisslrazdrows a, tisslrazddeps b
                                              WHERE a.fk_smid IN (SELECT fk_id
                                                                    FROM tsmid
                                                                   WHERE fk_owner = pk_otdel) AND a.fk_id = b.fk_rowid
                                           ORDER BY a.fn_order) ss
                                    WHERE v.fd_ins BETWEEN pd_dateb AND pd_datee AND t.fk_id = v.fk_pacid
                                          AND tp.fk_pacid = t.fk_id AND ta.fk_pacid = t.fk_peplid
                                          AND v.fk_smid = ss.fk_smid)
                GROUP BY fn_age, fk_townid
                UNION
                SELECT NVL (SUM (fn_count), 0) fn_count, 2, 0
                  FROM (SELECT COUNT (1) fn_count
                          FROM (SELECT v.fk_smid, v.fk_id
                                  FROM vresan v,
                                       (SELECT   a.fk_id fk_razdel, b.fk_smid, a.fn_order
                                            FROM tisslrazdrows a, tisslrazddeps b
                                           WHERE a.fk_smid IN (SELECT fk_id
                                                                 FROM tsmid
                                                                WHERE fk_owner = pk_otdel) AND a.fk_id = b.fk_rowid
                                        ORDER BY a.fn_order) ss
                                 WHERE v.fd_ins BETWEEN pd_dateb AND pd_datee AND v.fl_amb = 1
                                       AND v.fk_smid = ss.fk_smid))
                UNION
                SELECT 0, 0, 2
                  FROM DUAL
                UNION
                SELECT 0, 0, 1
                  FROM DUAL
                UNION
                SELECT 0, 0, 0
                  FROM DUAL
                UNION
                SELECT 0, 1, 2
                  FROM DUAL
                UNION
                SELECT 0, 1, 1
                  FROM DUAL
                UNION
                SELECT 0, 1, 0
                  FROM DUAL)
      GROUP BY fk_townid, fn_age
      ORDER BY fk_townid, fn_age DESC;

    CURSOR c_patology (pfd_dateb DATE, pfd_datee DATE, pfk_otdel NUMBER)   -- Количество людей с патологией
    IS
      SELECT   SUM (fn_count) fn_count, fk_townid, fn_age
          FROM (SELECT   COUNT (*) fn_count, fk_townid, fn_age
                    FROM (SELECT DISTINCT t.fk_id,
                                          DECODE (TRUNC ((MONTHS_BETWEEN (TRUNC (tp.fd_date_in), t.fd_rojd) / 12)
                                                         / dd.fn_child),
                                                  0, 2,
                                                  t.fp_sex) fn_age,   --Получаем 2 если человеку меньше pkg_core.get_constbyname('CHILD_AGE') и пол если больше
                                          DECODE (ta.fk_townid, 101632, 1, 0) AS fk_townid
                                     FROM vresan v, tkarta t, tadress ta, tpatname tt,
                                          (SELECT pkg_core.get_constbyname ('CHILD_AGE') fn_child
                                             FROM DUAL) dd, (SELECT fd_data1 fd_date_in, fk_pacid
                                                               FROM tsroky
                                                              WHERE fk_pryb = 2) tp
                                    WHERE tt.fp_prior > 0 AND tt.fk_id = v.fk_patid
                                          AND v.fd_ins BETWEEN pfd_dateb AND pfd_datee AND tp.fk_pacid = t.fk_id
                                          AND ta.fk_pacid = t.fk_peplid AND t.fk_id = v.fk_pacid
                                          AND v.fk_razdid IN (SELECT fk_id
                                                                FROM tsmid
                                                               WHERE fk_owner = pfk_otdel))
                GROUP BY fk_townid, fn_age
                UNION
                SELECT COUNT (*) fn_count, 2, 0
                  FROM (SELECT DISTINCT v.fk_pacid
                                   FROM vresan v, tpatname tt
                                  WHERE v.fk_patid = tt.fk_id AND tt.fp_prior > 0
                                        AND v.fd_ins BETWEEN pfd_dateb AND pfd_datee AND v.fl_amb = 1
                                        AND v.fk_razdid IN (SELECT fk_id
                                                              FROM tsmid
                                                             WHERE fk_owner = pfk_otdel))
                UNION
                SELECT 0, 0, 2
                  FROM DUAL
                UNION
                SELECT 0, 0, 1
                  FROM DUAL
                UNION
                SELECT 0, 0, 0
                  FROM DUAL
                UNION
                SELECT 0, 1, 2
                  FROM DUAL
                UNION
                SELECT 0, 1, 1
                  FROM DUAL
                UNION
                SELECT 0, 1, 0
                  FROM DUAL)
      GROUP BY fk_townid, fn_age
      ORDER BY fk_townid, fn_age DESC;

    CURSOR c_povtor_obsl (pfd_dateb DATE, pfd_datee DATE, pfk_otdel NUMBER)   --Количество Повторно обследованных
    IS
      SELECT   SUM (fn_count) fn_count, fk_townid, fn_age
          FROM (SELECT   COUNT (1) fn_count, fk_townid, fn_age
                    FROM (SELECT DISTINCT v.fk_pacid,
                                          DECODE (TRUNC ((MONTHS_BETWEEN (TRUNC (tp.fd_date_in), t.fd_rojd) / 12)
                                                         / dd.fn_child),
                                                  0, 2,
                                                  t.fp_sex) fn_age,   --Получаем 2 если человеку меньше pkg_core.get_constbyname('CHILD_AGE') и пол если больше
                                          DECODE (ta.fk_townid, 101632, 1, 0) AS fk_townid
                                     FROM vresan v, tkarta t, tadress ta,
                                          (SELECT pkg_core.get_constbyname ('CHILD_AGE') fn_child
                                             FROM DUAL) dd, (SELECT fd_data1 fd_date_in, fk_pacid
                                                               FROM tsroky
                                                              WHERE fk_pryb = 2) tp,
                                          (SELECT DISTINCT fk_pacid fk_vpacid, fd_ins fd_vrun
                                                      FROM vresan
                                                     WHERE fd_ins BETWEEN pfd_dateb AND pfd_datee AND fl_amb = 0
                                                           AND fk_razdid IN (SELECT fk_id
                                                                               FROM tsmid
                                                                              WHERE fk_owner = pfk_otdel)) vv
                                    WHERE t.fk_id = v.fk_pacid AND v.fd_ins BETWEEN pfd_dateb AND pfd_datee
                                          AND tp.fk_pacid = t.fk_id AND ta.fk_pacid = t.fk_peplid
                                          AND v.fk_pacid = vv.fk_vpacid
                                          AND v.fd_ins BETWEEN TO_DATE ('1.01' || TO_CHAR (vv.fd_vrun, 'yyyy'),
                                                                        'dd.mm.yyyy')
                                                           AND vv.fd_vrun
                                          AND v.fk_razdid IN (SELECT fk_id
                                                                FROM tsmid
                                                               WHERE fk_owner = pfk_otdel)
                                 GROUP BY v.fk_pacid, v.fk_smid,
                                          DECODE (TRUNC ((MONTHS_BETWEEN (TRUNC (tp.fd_date_in), t.fd_rojd) / 12)
                                                         / dd.fn_child),
                                                  0, 2,
                                                  t.fp_sex),
                                          DECODE (ta.fk_townid, 101632, 1, 0)
                                   HAVING COUNT (1) > 1)
                GROUP BY fk_townid, fn_age
                UNION
                SELECT COUNT (*) fn_count, 2, 0
                  FROM (SELECT DISTINCT v.fk_pacid
                                   FROM vresan v,
                                        (SELECT DISTINCT fk_pacid fk_vpacid, fd_ins fd_vrun
                                                    FROM vresan
                                                   WHERE fd_ins BETWEEN pfd_dateb AND pfd_datee AND fl_amb = 1
                                                         AND fk_razdid IN (SELECT fk_id
                                                                             FROM tsmid
                                                                            WHERE fk_owner = pfk_otdel)) vv
                                  WHERE v.fk_razdid IN (SELECT fk_id
                                                          FROM tsmid
                                                         WHERE fk_owner = pfk_otdel)
                                        AND v.fd_ins BETWEEN pfd_dateb AND pfd_datee AND v.fl_amb = 1
                                        AND v.fk_pacid = vv.fk_vpacid
                                        AND v.fd_ins BETWEEN TO_DATE ('1.01' || TO_CHAR (vv.fd_vrun, 'yyyy'),
                                                                      'dd.mm.yyyy')
                                                         AND vv.fd_vrun
                               GROUP BY v.fk_pacid, v.fk_smid
                                 HAVING COUNT (1) > 1)
                UNION
                SELECT 0, 0, 2
                  FROM DUAL
                UNION
                SELECT 0, 0, 1
                  FROM DUAL
                UNION
                SELECT 0, 0, 0
                  FROM DUAL
                UNION
                SELECT 0, 1, 2
                  FROM DUAL
                UNION
                SELECT 0, 1, 1
                  FROM DUAL
                UNION
                SELECT 0, 1, 0
                  FROM DUAL)
      GROUP BY fk_townid, fn_age
      ORDER BY fk_townid, fn_age DESC;

    CURSOR c_povt_pat (pfd_dateb DATE, pfd_datee DATE, pfk_otdel NUMBER)   -- Повтороно обследованных с патологией
    IS
      SELECT   /*+CHOOSE*/
               SUM (fn_count) fn_count, fk_townid, fn_age
          FROM (SELECT   COUNT (1) fn_count, fk_townid, fn_age
                    FROM (SELECT DISTINCT v.fk_pacid,
                                          DECODE (TRUNC ((MONTHS_BETWEEN (TRUNC (tp.fd_date_in), t.fd_rojd) / 12)
                                                         / dd.fn_child),
                                                  0, 2,
                                                  t.fp_sex) fn_age,   --Получаем 2 если человеку меньше pkg_core.get_constbyname('CHILD_AGE') и пол если больше
                                          DECODE (ta.fk_townid, 101632, 1, 0) AS fk_townid
                                     FROM vresan v, tkarta t, tadress ta, tpatname p,
                                          (SELECT pkg_core.get_constbyname ('CHILD_AGE') fn_child
                                             FROM DUAL) dd, (SELECT fd_data1 fd_date_in, fk_pacid
                                                               FROM tsroky
                                                              WHERE fk_pryb = 2) tp,
                                          (SELECT DISTINCT fk_pacid fk_vpacid, fd_ins fd_vrun
                                                      FROM vresan
                                                     WHERE fd_ins BETWEEN pfd_dateb AND pfd_datee AND fl_amb = 0
                                                           AND fk_patid > 0
                                                           AND fk_razdid IN (SELECT fk_id
                                                                               FROM tsmid
                                                                              WHERE fk_owner = pfk_otdel)) vv
                                    WHERE t.fk_id = v.fk_pacid AND tp.fk_pacid = t.fk_id AND ta.fk_pacid = t.fk_peplid
                                          AND v.fk_pacid = vv.fk_vpacid
                                          AND v.fd_ins BETWEEN TO_DATE ('1.01' || TO_CHAR (vv.fd_vrun, 'yyyy'),
                                                                        'dd.mm.yyyy')
                                                           AND vv.fd_vrun
                                          AND p.fk_id = v.fk_patid AND p.fp_prior > 0
                                          AND v.fk_razdid IN (SELECT fk_id
                                                                FROM tsmid
                                                               WHERE fk_owner = pfk_otdel)
                                 GROUP BY v.fk_pacid, v.fk_smid,
                                          DECODE (TRUNC ((MONTHS_BETWEEN (TRUNC (tp.fd_date_in), t.fd_rojd) / 12)
                                                         / dd.fn_child),
                                                  0, 2,
                                                  t.fp_sex),
                                          DECODE (ta.fk_townid, 101632, 1, 0)
                                   HAVING COUNT (1) > 1)
                GROUP BY fk_townid, fn_age
                UNION
                SELECT COUNT (*) fn_count, 2, 0
                  FROM (SELECT DISTINCT v.fk_pacid
                                   FROM vresan v, tpatname p,
                                        (SELECT DISTINCT fk_pacid fk_vpacid, fd_ins fd_vrun
                                                    FROM vresan
                                                   WHERE fd_ins BETWEEN pfd_dateb AND pfd_datee AND fl_amb = 1
                                                         AND fk_patid > 0 AND fk_razdid IN (SELECT fk_id
                                                                                              FROM tsmid
                                                                                             WHERE fk_owner = pfk_otdel)) vv
                                  WHERE v.fk_razdid IN (SELECT fk_id
                                                          FROM tsmid
                                                         WHERE fk_owner = pfk_otdel) AND v.fk_pacid = vv.fk_vpacid
                                        AND v.fl_amb = 1
                                        AND v.fd_ins BETWEEN TO_DATE ('1.01' || TO_CHAR (vv.fd_vrun, 'yyyy'),
                                                                      'dd.mm.yyyy')
                                                         AND vv.fd_vrun
                                        AND p.fk_id = v.fk_patid AND p.fp_prior > 0
                               GROUP BY v.fk_pacid, v.fk_smid
                                 HAVING COUNT (1) > 1)
                UNION
                SELECT 0, 0, 2
                  FROM DUAL
                UNION
                SELECT 0, 0, 1
                  FROM DUAL
                UNION
                SELECT 0, 0, 0
                  FROM DUAL
                UNION
                SELECT 0, 1, 2
                  FROM DUAL
                UNION
                SELECT 0, 1, 1
                  FROM DUAL
                UNION
                SELECT 0, 1, 0
                  FROM DUAL)
      GROUP BY fk_townid, fn_age
      ORDER BY fk_townid, fn_age DESC;

    CURSOR c_pat_res (pfd_dateb DATE, pfd_datee DATE, pfk_otdel NUMBER)   --Количество патологических результатов
    IS
      SELECT   /*+CHOOSE*/
               SUM (fn_count) fn_count
          FROM (SELECT   count(1) fn_count, fk_townid, fn_age
                    FROM (SELECT DISTINCT v.fk_smid fn_count, v.fk_id,
                                          DECODE (TRUNC ((MONTHS_BETWEEN (TRUNC (tp.fd_date_in), t.fd_rojd) / 12)
                                                         / dd.fn_child),
                                                  0, 2,
                                                  t.fp_sex) fn_age,   --Получаем 2 если человеку меньше pkg_core.get_constbyname('CHILD_AGE') и пол если больше
                                          DECODE (ta.fk_townid, 101632, 1, 0) AS fk_townid
                                     FROM vresan v, tkarta t, tadress ta, tpatname p,
                                          (SELECT pkg_core.get_constbyname ('CHILD_AGE') fn_child
                                             FROM DUAL) dd, (SELECT fd_data1 fd_date_in, fk_pacid
                                                               FROM tsroky
                                                              WHERE fk_pryb = 2) tp
                                    WHERE v.fd_ins BETWEEN pfd_dateb AND pfd_datee AND tp.fk_pacid = t.fk_id
                                          AND ta.fk_pacid = t.fk_peplid AND p.fk_id = v.fk_patid AND p.fp_prior > 0
                                          AND t.fk_id = v.fk_pacid AND v.fk_razdid IN (SELECT fk_id
                                                                                         FROM tsmid
                                                                                        WHERE fk_owner = pfk_otdel))
                GROUP BY fn_age, fk_townid
                UNION
                SELECT NVL (SUM (fn_count), 0) fn_count, 2, 0
                  FROM (SELECT count(1) fn_count
                          FROM (SELECT v.fk_smid, v.fk_id
                                  FROM vresan v, tpatname p
                                 WHERE v.fd_ins BETWEEN pfd_dateb AND pfd_datee AND fl_amb = 1 AND p.fk_id = v.fk_patid
                                       AND p.fp_prior > 0 AND v.fk_razdid IN (SELECT fk_id
                                                                                FROM tsmid
                                                                               WHERE fk_owner = pfk_otdel)))
                UNION
                SELECT 0, 0, 2
                  FROM DUAL
                UNION
                SELECT 0, 0, 1
                  FROM DUAL
                UNION
                SELECT 0, 0, 0
                  FROM DUAL
                UNION
                SELECT 0, 1, 2
                  FROM DUAL
                UNION
                SELECT 0, 1, 1
                  FROM DUAL
                UNION
                SELECT 0, 1, 0
                  FROM DUAL)
      GROUP BY fk_townid, fn_age
      ORDER BY fk_townid, fn_age DESC;
  BEGIN
    -- Задаем переменнные для шапки отчета
    vdate1 := pfd_dateb;
    vdate2 := pfd_datee;
    vfk_otdelid := pfk_otdel;

    --Обнуляем все массивы
    FOR cc IN 1 .. 8
    LOOP
      pct_line (cc) := 0;
      pct_issl (cc) := 0;
      pct_out (cc) := 0;
      pct_obs_pac (cc) := 0;
      pct_patology (cc) := 0;
      pct_povtor_obsl (cc) := 0;
      pct_povt_pat (cc) := 0;
      pct_pat_res (cc) := 0;
    END LOOP;

    DBMS_LOB.createtemporary (pb_result, TRUE, DBMS_LOB.SESSION);
    -- вставляем шапку отчета
    pc_str := get_report_header;
    DBMS_LOB.writeappend (pb_result, LENGTH (pc_str), pc_str);
    -- вставляем шапку таблицы
    pc_str :=
      '<table width="100%" border="1" cellpadding="0" cellspacing="0">' || '<TR>'
      || '<TH rowspan="3" width="3%">№:</TH>' || '<TH rowspan="3" width="30%">Наименование</TH>'
      || '<TH colspan="6" width="57%">Санаторные</TH>' || '<TH rowspan="3" width="5%">Амбула<br>торные</TH>'
      || '<TH rowspan="3" width="5%">Итого</TH>' || '</TR><TR>' || '<TH colspan="3">Иногородние</TH>'
      || '<TH colspan="3">Проживающие в Югорске</TH>' || '</TR><TR>' || '<TH width="9%">Дети</TH>'
      || '<TH width="9%">Взрослые</TH>' || '<TH width="9%">Женщины</TH>' || '<TH width="9%">Дети</TH>'
      || '<TH width="9%">Взрослые</TH>' || '<TH width="9%">Женщины</TH>' || '</TR>';
    DBMS_LOB.writeappend (pb_result, LENGTH (pc_str), pc_str);
    /**/
    pn_number := 1;
    pc_str := '<TR><TD align = "center">' || pn_number || '</TD><TD>Количество проживающих по путевке</TD>';
    pc_strout := 'Количество проживающих по путевке';
    progress_bar.setstrout ('Рассчет: ' || pc_strout);
    progress_bar.stepit;

    FOR cc IN c_live_put (pfd_dateb, pfd_datee)
    LOOP
      pct_line (c_live_put%ROWCOUNT) := cc.fn_count;
    END LOOP;

    FOR cc IN 1 .. 7
    LOOP
      IF cc IN (2, 5)
      THEN

        pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pct_line (cc) + pct_line (cc + 1))||' ',' 0 ','&nbsp;') || '</TD>';
      ELSE
        pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pct_line (cc))||' ',' 0 ','&nbsp;') || '</TD>';
      END IF;

      pct_line (8) := pct_line (8) + pct_line (cc);
      pct_line (cc) := 0;
    END LOOP;

    pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pct_line (8))||' ',' 0 ','&nbsp;') || '</TD></TR>';
    pct_line (8) := 0;
    DBMS_LOB.writeappend (pb_result, LENGTH (pc_str), pc_str);
    /**/
    pn_number := pn_number + 1;
    pc_str := '<TR><TD align = "center">' || pn_number || '</TD><TD>Количество выписанных:</TD>';
    pc_strout := 'Количество выписанных';
    progress_bar.setstrout ('Рассчет: ' || pc_strout);
    progress_bar.stepit;

    FOR cc IN c_out (pfd_dateb, pfd_datee)
    LOOP
      pct_out (c_out%ROWCOUNT) := cc.fn_count;
    END LOOP;

    FOR cc IN 1 .. 7
    LOOP
      IF cc IN (2, 5)
      THEN
        pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pct_out (cc) + pct_out (cc + 1))||' ',' 0 ','&nbsp;') || '</TD>';
      ELSE
        pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR(pct_out (cc))||' ',' 0 ','&nbsp;') || '</TD>';
      END IF;

      pct_out (8) := pct_out (8) + pct_out (cc);
    END LOOP;

    pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR(pct_out (8))||' ',' 0 ','&nbsp;') || '</TD></TR>';
    DBMS_LOB.writeappend (pb_result, LENGTH (pc_str), pc_str);
    /**/
    pn_number := 3;
    pc_str := '<TR><TD align = "center">' || pn_number || '</TD><TD>Количество обследованных:</TD>';
    pc_strout := 'Количество обследованных';
    progress_bar.setstrout ('Рассчет: ' || pc_strout);
    progress_bar.stepit;

    FOR cc IN c_obs_pac (pfd_dateb, pfd_datee, pfk_otdel)
    LOOP
      pct_obs_pac (c_obs_pac%ROWCOUNT) := cc.fn_count;
    END LOOP;

    FOR cc IN 1 .. 7
    LOOP
      IF cc IN (2, 5)
      THEN
        pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pct_obs_pac (cc) + pct_obs_pac (cc + 1))||' ',' 0 ','&nbsp;') || '</TD>';
      ELSE
        pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR(pct_obs_pac (cc))||' ',' 0 ','&nbsp;') || '</TD>';
      END IF;

      pct_obs_pac (8) := pct_obs_pac (8) + pct_obs_pac (cc);
    END LOOP;

    pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR(pct_obs_pac (8))||' ',' 0 ','&nbsp;') || '</TD></TR>';
    DBMS_LOB.writeappend (pb_result, LENGTH (pc_str), pc_str);
    /**/
    pn_number := pn_number + 1;
    pc_str := '<TR><TD align = "center">' || pn_number || '</TD><TD>Количество исследований:</TD>';
    pc_strout := 'Количество исследований';
    pc_str_razd := ' ';
    progress_bar.setstrout ('Рассчет: ' || pc_strout);
    progress_bar.stepit;

    FOR cur_razd IN crazd (pfk_otdel)
    LOOP
      pn_number := pn_number + 1;
      pc_str_razd :=
        pc_str_razd || '<TR><TD align = "center">' || pn_number || '</TD>' || '<TD>в т.ч. ' || cur_razd.fc_name
        || '</TD>';

      FOR cc IN c_issl_razd (pfd_dateb, pfd_datee, cur_razd.fk_id)
      LOOP
        pct_line (c_issl_razd%ROWCOUNT) := cc.fn_count;
      END LOOP;

      FOR cc IN 1 .. 7
      LOOP
        IF cc IN (2, 5)
        THEN
          pc_str_razd := pc_str_razd || '<TD align = "center">' || replace(' '||TO_CHAR (pct_line (cc) + pct_line (cc + 1))||' ',' 0 ','&nbsp;')
                         || '</TD>';
        ELSE
          pc_str_razd := pc_str_razd || '<TD align = "center">' || replace(' '||TO_CHAR (pct_line (cc))||' ',' 0 ','&nbsp;') || '</TD>';
        END IF;

        pct_line (8) := pct_line (8) + pct_line (cc);
        pct_line (cc) := 0;
      END LOOP;

      pc_str_razd := pc_str_razd || '<TD align = "center">' || replace(' '||TO_CHAR (pct_line (8))||' ',' 0 ','&nbsp;') || '</TD></TR>';
      pct_line (8) := 0;
    END LOOP;

    FOR cc IN c_issl_otdel (pfd_dateb, pfd_datee, pfk_otdel)
    LOOP
      pct_issl (c_issl_otdel%ROWCOUNT) := cc.fn_count;
    END LOOP;

    FOR cc IN 1 .. 7
    LOOP
      IF cc IN (2, 5)
      THEN
        pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pct_issl (cc) + pct_issl (cc + 1))||' ',' 0 ','&nbsp;') || '</TD>';
      ELSE
        pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pct_issl (cc))||' ',' 0 ','&nbsp;') || '</TD>';
      END IF;

      pct_issl (8) := pct_issl (8) + pct_issl (cc);
    END LOOP;

    pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pct_issl (8))||' ',' 0 ','&nbsp;') || '</TD></TR>';
    DBMS_LOB.writeappend (pb_result, LENGTH (pc_str), pc_str);
    DBMS_LOB.writeappend (pb_result, LENGTH (pc_str_razd), pc_str_razd);
    /**/
    pn_number := pn_number + 1;
    pc_str := '<TR><TD align = "center">' || pn_number || '</TD><TD>Количество иссл. на 1-го обсл:</TD>';
    pc_strout := 'Количество иссл. на 1-го обсл';
    progress_bar.setstrout ('Рассчет: ' || pc_strout);
    progress_bar.stepit;

    FOR cc IN 1 .. 7
    LOOP
      IF cc IN (2, 5)
      THEN
        IF (pct_issl (cc) + pct_issl (cc + 1)) <> 0
        THEN
          pn_dop := (pct_obs_pac (cc) + pct_obs_pac (cc + 1)) / (pct_issl (cc) + pct_issl (cc + 1)) * 100;
        ELSE
          pn_dop := 0;
        END IF;

        pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pn_dop, 'FM99999999990.09')||' ',' 0.0 ','&nbsp;') || '</TD>';
      ELSE
        IF pct_issl (cc) <> 0
        THEN
          pn_dop := pct_obs_pac (cc) / pct_issl (cc) * 100;
        ELSE
          pn_dop := 0;
        END IF;

        pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pn_dop, 'FM99999999990.09')||' ',' 0.0 ','&nbsp;') || '</TD>';
      END IF;
    END LOOP;

    IF (pct_issl (8)) <> 0
    THEN
      pn_dop := pct_obs_pac (8) / pct_issl (8) * 100;
    ELSE
      pn_dop := 0;
    END IF;

    pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pn_dop, 'FM99999999990.09')||' ',' 0.0 ','&nbsp;') || '</TD></TR>';
    DBMS_LOB.writeappend (pb_result, LENGTH (pc_str), pc_str);
    /**/
    pn_number := pn_number + 1;
    pc_str := '<TR><TD align = "center">' || pn_number || '</TD><TD>Количество иссл. на 1-го выпис.:</TD>';
    pc_strout := 'Количество иссл. на 1-го выпис.';
    progress_bar.setstrout ('Рассчет: ' || pc_strout);
    progress_bar.stepit;

    FOR cc IN 1 .. 7
    LOOP
      IF cc IN (2, 5)
      THEN
        IF (pct_issl (cc) + pct_issl (cc + 1)) <> 0
        THEN
          pn_dop := (pct_out (cc) + pct_out (cc + 1)) / (pct_issl (cc) + pct_issl (cc + 1)) * 100;
        ELSE
          pn_dop := 0;
        END IF;

        pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pn_dop, 'FM99999999990.09')||' ',' 0.0 ','&nbsp;') || '</TD>';
      ELSE
        IF pct_issl (cc) <> 0
        THEN
          pn_dop := pct_out (cc) / pct_issl (cc) * 100;
        ELSE
          pn_dop := 0;
        END IF;

        pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pn_dop, 'FM99999999990.09')||' ',' 0.0 ','&nbsp;') || '</TD>';
      END IF;
    END LOOP;

    IF (pct_issl (8)) <> 0
    THEN
      pn_dop := pct_out (8) / pct_issl (8) * 100;
    ELSE
      pn_dop := 0;
    END IF;

    pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pn_dop, 'FM99999999990.09')||' ',' 0.0 ','&nbsp;') || '</TD></TR>';
    DBMS_LOB.writeappend (pb_result, LENGTH (pc_str), pc_str);
    /**/
    pn_number := pn_number + 1;
    pc_str := '<TR><TD align = "center">' || pn_number || '</TD><TD>Количество лиц с патологией:</TD>';
    pc_strout := 'Количество лиц с патологией';
    progress_bar.setstrout ('Рассчет: ' || pc_strout);
    progress_bar.stepit;

    FOR cc IN c_patology (pfd_dateb, pfd_datee, pfk_otdel)
    LOOP
      pct_patology (c_patology%ROWCOUNT) := cc.fn_count;
    END LOOP;

    FOR cc IN 1 .. 7
    LOOP
      IF cc IN (2, 5)
      THEN
        pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pct_patology (cc) + pct_patology (cc + 1))||' ',' 0 ','&nbsp;') || '</TD>';
      ELSE
        pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pct_patology (cc))||' ',' 0 ','&nbsp;') || '</TD>';
      END IF;

      pct_patology (8) := pct_patology (8) + pct_patology (cc);
    END LOOP;

    pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pct_patology (8))||' ',' 0 ','&nbsp;') || '</TD></TR>';
    DBMS_LOB.writeappend (pb_result, LENGTH (pc_str), pc_str);
    /**/
    pn_number := pn_number + 1;
    pc_str := '<TR><TD align = "center">' || pn_number || '</TD><TD>% лиц с патологией от обследованных:</TD>';
    pc_strout := '% лиц с патологией от обследованных';
    progress_bar.setstrout ('Рассчет: ' || pc_strout);
    progress_bar.stepit;

    FOR cc IN 1 .. 7
    LOOP
      IF cc IN (2, 5)
      THEN
        IF (pct_obs_pac (cc) + pct_obs_pac (cc + 1)) <> 0
        THEN
          pn_dop := (pct_patology (cc) + pct_patology (cc + 1)) / (pct_obs_pac (cc) + pct_obs_pac (cc + 1)) * 100;
        ELSE
          pn_dop := 0;
        END IF;

        pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pn_dop, 'FM99999999990.09')||' ',' 0.0 ','&nbsp;') || '</TD>';
      ELSE
        IF pct_obs_pac (cc) <> 0
        THEN
          pn_dop := pct_patology (cc) / pct_obs_pac (cc) * 100;
        ELSE
          pn_dop := 0;
        END IF;

        pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pn_dop, 'FM99999999990.09')||' ',' 0.0 ','&nbsp;') || '</TD>';
      END IF;
    END LOOP;

    IF (pct_obs_pac (8)) <> 0
    THEN
      pn_dop := pct_patology (8) / pct_obs_pac (8) * 100;
    ELSE
      pn_dop := 0;
    END IF;

    pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pn_dop, 'FM99999999990.09')||' ',' 0.0 ','&nbsp;') || '</TD></TR>';
    DBMS_LOB.writeappend (pb_result, LENGTH (pc_str), pc_str);
    /**/
    pn_number := pn_number + 1;
    pc_str := '<TR><TD align = "center">' || pn_number || '</TD><TD>% лиц с патологией от выписанных:</TD>';
    pc_strout := '% лиц с патологией от выписанных';
    progress_bar.setstrout ('Рассчет: ' || pc_strout);
    progress_bar.stepit;

    FOR cc IN 1 .. 7
    LOOP
      IF cc IN (2, 5)
      THEN
        IF (pct_out (cc) + pct_out (cc + 1)) <> 0
        THEN
          pn_dop := (pct_patology (cc) + pct_patology (cc + 1)) / (pct_out (cc) + pct_out (cc + 1)) * 100;
        ELSE
          pn_dop := 0;
        END IF;

        pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pn_dop, 'FM99999999990.09')||' ',' 0.0 ','&nbsp;') || '</TD>';
      ELSE
        IF pct_out (cc) <> 0
        THEN
          pn_dop := pct_patology (cc) / pct_out (cc) * 100;
        ELSE
          pn_dop := 0;
        END IF;

        pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pn_dop, 'FM99999999990.09')||' ',' 0.0 ','&nbsp;') || '</TD>';
      END IF;
    END LOOP;

    IF (pct_out (8)) <> 0
    THEN
      pn_dop := pct_patology (8) / pct_out (8) * 100;
    ELSE
      pn_dop := 0;
    END IF;

    pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pn_dop, 'FM99999999990.09')||' ',' 0.0 ','&nbsp;') || '</TD></TR>';
    DBMS_LOB.writeappend (pb_result, LENGTH (pc_str), pc_str);
    /**/
    pn_number := pn_number + 1;
    pc_str := '<TR><TD align = "center">' || pn_number || '</TD><TD>Повторно обследовано лиц:</TD>';
    pc_strout := 'Повторно обследовано лиц';
    pn_number := pn_number + 1;
    progress_bar.setstrout ('Рассчет: ' || pc_strout);
    progress_bar.stepit;

    FOR cc IN c_povtor_obsl (pfd_dateb, pfd_datee, pfk_otdel)
    LOOP
      pct_povtor_obsl (c_povtor_obsl%ROWCOUNT) := cc.fn_count;
    END LOOP;

    FOR cc IN 1 .. 7
    LOOP
      IF cc IN (2, 5)
      THEN
        pc_str :=
                pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pct_povtor_obsl (cc) + pct_povtor_obsl (cc + 1))||' ',' 0 ','&nbsp;')
                || '</TD>';
      ELSE
        pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pct_povtor_obsl (cc))||' ',' 0 ','&nbsp;') || '</TD>';
      END IF;

      pct_povtor_obsl (8) := pct_povtor_obsl (8) + pct_povtor_obsl (cc);
    END LOOP;

    pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pct_povtor_obsl (8))||' ',' 0 ','&nbsp;') || '</TD></TR>';
    DBMS_LOB.writeappend (pb_result, LENGTH (pc_str), pc_str);
    /**/
    pc_str := '<TR><TD align = "center">' || pn_number || '</TD><TD>% повторно обследованных от обследованных:</TD>';
    pc_strout := '% повторно обследованных от обследованных';
    progress_bar.setstrout ('Рассчет: ' || pc_strout);
    progress_bar.stepit;

    FOR cc IN 1 .. 7
    LOOP
      IF cc IN (2, 5)
      THEN
        IF (pct_obs_pac (cc) + pct_obs_pac (cc + 1)) <> 0
        THEN
          pn_dop := (pct_povtor_obsl (cc) + pct_povtor_obsl (cc + 1)) / (pct_obs_pac (cc) + pct_obs_pac (cc + 1)) * 100;
        ELSE
          pn_dop := 0;
        END IF;

        pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pn_dop, 'FM99999999990.09')||' ',' 0.0 ','&nbsp;') || '</TD>';
      ELSE
        IF pct_obs_pac (cc) <> 0
        THEN
          pn_dop := pct_povtor_obsl (cc) / pct_obs_pac (cc) * 100;
        ELSE
          pn_dop := 0;
        END IF;

        pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pn_dop, 'FM99999999990.09')||' ',' 0.0 ','&nbsp;') || '</TD>';
      END IF;
    END LOOP;

    IF (pct_obs_pac (8)) <> 0
    THEN
      pn_dop := pct_povtor_obsl (8) / pct_obs_pac (8) * 100;
    ELSE
      pn_dop := 0;
    END IF;

    pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pn_dop, 'FM99999999990.09')||' ',' 0.0 ','&nbsp;') || '</TD></TR>';
    DBMS_LOB.writeappend (pb_result, LENGTH (pc_str), pc_str);
    /**/
    pn_number := pn_number + 1;
    pc_str := '<TR><TD align = "center">' || pn_number || '</TD><TD>% повторно обследованных от выписанных:</TD>';
    pc_strout := '% повторно обследованных от выписанных';
    progress_bar.setstrout ('Рассчет: ' || pc_strout);
    progress_bar.stepit;

    FOR cc IN 1 .. 7
    LOOP
      IF cc IN (2, 5)
      THEN
        IF (pct_out (cc) + pct_out (cc + 1)) <> 0
        THEN
          pn_dop := (pct_povtor_obsl (cc) + pct_povtor_obsl (cc + 1)) / (pct_out (cc) + pct_out (cc + 1)) * 100;
        ELSE
          pn_dop := 0;
        END IF;

        pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pn_dop, 'FM99999999990.09')||' ',' 0.0 ','&nbsp;') || '</TD>';
      ELSE
        IF pct_out (cc) <> 0
        THEN
          pn_dop := pct_povtor_obsl (cc) / pct_out (cc) * 100;
        ELSE
          pn_dop := 0;
        END IF;

        pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pn_dop, 'FM99999999990.09')||' ',' 0.0 ','&nbsp;') || '</TD>';
      END IF;
    END LOOP;

    IF (pct_out (8)) <> 0
    THEN
      pn_dop := pct_povtor_obsl (8) / pct_out (8) * 100;
    ELSE
      pn_dop := 0;
    END IF;

    pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pn_dop, 'FM99999999990.09')||' ',' 0.0 ','&nbsp;') || '</TD></TR>';
    DBMS_LOB.writeappend (pb_result, LENGTH (pc_str), pc_str);
    /**/
    pn_number := pn_number + 1;
    pc_str := '<TR><TD align = "center">' || pn_number || '</TD><TD>Повторно обследованно лиц с патологией:</TD>';
    pc_strout := 'Повторно обследованно лиц с патологией';
    progress_bar.setstrout ('Рассчет: ' || pc_strout);
    progress_bar.stepit;

    FOR cc IN c_povt_pat (pfd_dateb, pfd_datee, pfk_otdel)
    LOOP
      pct_povt_pat (c_povt_pat%ROWCOUNT) := cc.fn_count;
    END LOOP;

    FOR cc IN 1 .. 7
    LOOP
      IF cc IN (2, 5)
      THEN
        pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pct_povt_pat (cc) + pct_povt_pat (cc + 1))||' ',' 0 ','&nbsp;') || '</TD>';
      ELSE
        pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pct_povt_pat (cc))||' ',' 0 ','&nbsp;') || '</TD>';
      END IF;

      pct_povt_pat (8) := pct_povt_pat (8) + pct_povt_pat (cc);
    END LOOP;

    pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pct_povt_pat (8))||' ',' 0 ','&nbsp;') || '</TD></TR>';
    DBMS_LOB.writeappend (pb_result, LENGTH (pc_str), pc_str);
    /**/
    pn_number := pn_number + 1;
    pc_str :=
      '<TR><TD align = "center">' || pn_number
      || '</TD><TD>% повторно обследованных лиц с патологией от лиц с патологией:</TD>';
    pc_strout := '% повторно обследованных лиц с патологией от лиц с патологией';
    pn_number := pn_number + 1;
    progress_bar.setstrout ('Рассчет: ' || pc_strout);
    progress_bar.stepit;

    FOR cc IN 1 .. 7
    LOOP
      IF cc IN (2, 5)
      THEN
        IF (pct_patology (cc) + pct_patology (cc + 1)) <> 0
        THEN
          pn_dop := (pct_povt_pat (cc) + pct_povt_pat (cc + 1)) / (pct_patology (cc) + pct_patology (cc + 1)) * 100;
        ELSE
          pn_dop := 0;
        END IF;

        pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pn_dop, 'FM99999999990.09')||' ',' 0.0 ','&nbsp;') || '</TD>';
      ELSE
        IF pct_patology (cc) <> 0
        THEN
          pn_dop := pct_povt_pat (cc) / pct_patology (cc) * 100;
        ELSE
          pn_dop := 0;
        END IF;

        pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pn_dop, 'FM99999999990.09')||' ',' 0.0 ','&nbsp;') || '</TD>';
      END IF;
    END LOOP;

    IF (pct_patology (8)) <> 0
    THEN
      pn_dop := pct_povt_pat (8) / pct_patology (8) * 100;
    ELSE
      pn_dop := 0;
    END IF;

    pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pn_dop, 'FM99999999990.09')||' ',' 0.0 ','&nbsp;') || '</TD></TR>';
    DBMS_LOB.writeappend (pb_result, LENGTH (pc_str), pc_str);
    /**/
    pc_str :=
      '<TR><TD align = "center">' || pn_number
      || '</TD><TD>% повторно обследованных лиц с патологией от выписанных:</TD>';
    pc_strout := '% повторно обследованных лиц с патологией от выписанных';
    pn_number := pn_number + 1;
    progress_bar.setstrout ('Рассчет: ' || pc_strout);
    progress_bar.stepit;

    FOR cc IN 1 .. 7
    LOOP
      IF cc IN (2, 5)
      THEN
        IF (pct_out (cc) + pct_out (cc + 1)) <> 0
        THEN
          pn_dop := (pct_povt_pat (cc) + pct_povt_pat (cc + 1)) / (pct_out (cc) + pct_out (cc + 1)) * 100;
        ELSE
          pn_dop := 0;
        END IF;

        pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pn_dop, 'FM99999999990.09')||' ',' 0.0 ','&nbsp;') || '</TD>';
      ELSE
        IF pct_out (cc) <> 0
        THEN
          pn_dop := pct_povt_pat (cc) / pct_out (cc) * 100;
        ELSE
          pn_dop := 0;
        END IF;

        pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pn_dop, 'FM99999999990.09')||' ',' 0.0 ','&nbsp;') || '</TD>';
      END IF;
    END LOOP;

    IF (pct_out (8)) <> 0
    THEN
      pn_dop := pct_povt_pat (8) / pct_out (8) * 100;
    ELSE
      pn_dop := 0;
    END IF;

    pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pn_dop, 'FM99999999990.09')||' ',' 0.0 ','&nbsp;') || '</TD></TR>';
    DBMS_LOB.writeappend (pb_result, LENGTH (pc_str), pc_str);
    /**/
    pc_str := '<TR><TD align = "center">' || pn_number || '</TD><TD>Количество патологических результатов:</TD>';
    pc_strout := 'Количество патологических результатов';
    pn_number := pn_number + 1;
    progress_bar.setstrout ('Рассчет: ' || pc_strout);
    progress_bar.stepit;

    FOR cc IN c_pat_res (pfd_dateb, pfd_datee, pfk_otdel)
    LOOP
      pct_pat_res (c_pat_res%ROWCOUNT) := cc.fn_count;
    END LOOP;

    FOR cc IN 1 .. 7
    LOOP
      IF cc IN (2, 5)
      THEN
        pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pct_pat_res (cc) + pct_pat_res (cc + 1))||' ',' 0 ','&nbsp;') || '</TD>';
      ELSE
        pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pct_pat_res (cc))||' ',' 0 ','&nbsp;') || '</TD>';
      END IF;

      pct_pat_res (8) := pct_pat_res (8) + pct_pat_res (cc);
    END LOOP;

    pc_str := pc_str || '<TD align = "center">' || replace(' '||TO_CHAR (pct_pat_res (8))||' ',' 0 ','&nbsp;') || '</TD></TR>';
    DBMS_LOB.writeappend (pb_result, LENGTH (pc_str), pc_str);
    /**/
/*Вывод коментарий к данным которые собираються в данный момент*/
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


