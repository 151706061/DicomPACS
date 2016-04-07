DROP PACKAGE BODY ASU.LAB_OTCH_RAZDEL
/

--
-- LAB_OTCH_RAZDEL  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."LAB_OTCH_RAZDEL" 
IS
  TYPE ct_line IS TABLE OF INTEGER
    INDEX BY BINARY_INTEGER;

  FUNCTION get_report (pfd_dateb IN DATE, pfd_datee IN DATE, pfk_razd IN NUMBER)
    RETURN NUMBER
  IS
    pb_result CLOB;   --��������� ���� � ������� ��� ����� ������������
    pn_result NUMBER;   --������������� �� TCLOBS
    pc_str VARCHAR2 (32000);   /*���������� � ������� ����� ����������
                               ������ �� ������� �� ��������� CLOB*/
    pn_number NUMBER DEFAULT 0;   -- ���������� ��� �������� ������
    pc_name VARCHAR2 (255);   -- ��� �������
    pn_summ NUMBER DEFAULT 0;   --����� ��������
    pn_man NUMBER;   --��������������� ����������
    pn_woman NUMBER;   --��������������� ����������
    pct_summ ct_line;   -- ������ � ��������� �������
    pc_value VARCHAR2 (50);   -- ��������������� ���������� � ������� ��������� ������ ����� ������� � �����

    CURSOR c_razd
    IS
      SELECT   fc_name
          FROM tisslrazdrows
         WHERE fk_smid = pfk_razd
      ORDER BY fn_order;

    CURSOR c_info   --��� ������ �� ������� � ���������� �� �����������
    IS
      SELECT   /*+CHOOSE*/
               SUM (fn_count) fn_count
          FROM (SELECT   /*+CHOOSE*/
                         COUNT (*) fn_count, fk_townid, fn_age, fn_order
                    FROM (SELECT DISTINCT v.fk_smid fn_count, v.fk_id,
                                          DECODE (TRUNC ((MONTHS_BETWEEN (TRUNC (tp.fd_date_in), tk.fd_rojd) / 12)
                                                         / pkg_core.get_constbyname ('CHILD_AGE')),
                                                  0, 2,
                                                  v.fp_sex) fn_age,
                                          DECODE (ta.fk_townid, 101632, 1, 0) AS fk_townid, ss.fk_razdel, ss.fn_order
                                     FROM vresan v, tkarta tk, tadress ta, (SELECT fd_data1 fd_date_in, fk_pacid
                                                                              FROM tsroky
                                                                             WHERE fk_pryb = 2) tp,
                                          (SELECT   a.fk_id fk_razdel, b.fk_smid, a.fn_order
                                               FROM tisslrazdrows a, tisslrazddeps b
                                              WHERE a.fk_smid = pfk_razd AND a.fk_id = b.fk_rowid
                                           ORDER BY a.fn_order) ss
                                    WHERE v.fd_ins BETWEEN pfd_dateb AND pfd_datee AND tk.fk_id = v.fk_pacid
                                          AND tp.fk_pacid = v.fk_pacid AND ta.fk_pacid = tk.fk_peplid
                                          AND ss.fk_smid = v.fk_smid)
                GROUP BY fk_razdel, fn_order, fn_age, fk_townid
                UNION
                SELECT   /*+CHOOSE*/
                         COUNT (1), 2, 1, fn_order
                    FROM (SELECT DISTINCT v.fk_id, ss.fk_razdel, ss.fn_order
                                     FROM vresan v,
                                          (SELECT   a.fk_id fk_razdel, b.fk_smid, a.fn_order
                                               FROM tisslrazdrows a, tisslrazddeps b
                                              WHERE a.fk_smid = pfk_razd AND a.fk_id = b.fk_rowid
                                           ORDER BY a.fn_order) ss
                                    WHERE v.fd_ins BETWEEN pfd_dateb AND pfd_datee AND v.fk_smid = ss.fk_smid
                                          AND v.fl_amb = 1)
                GROUP BY fn_order
                UNION
                SELECT   /*+CHOOSE*/
                         COUNT (1), 2, 0, fn_order
                    FROM (SELECT DISTINCT v.fk_id, ss.fk_razdel, ss.fn_order
                                     FROM vresan v, tpatname tp,
                                          (SELECT   a.fk_id fk_razdel, b.fk_smid, a.fn_order
                                               FROM tisslrazdrows a, tisslrazddeps b
                                              WHERE a.fk_smid = pfk_razd AND a.fk_id = b.fk_rowid
                                           ORDER BY a.fn_order) ss
                                    WHERE v.fd_ins BETWEEN pfd_dateb AND pfd_datee AND v.fk_smid = ss.fk_smid
                                          AND tp.fk_id = v.fk_patid AND tp.fp_prior > 0 AND v.fl_amb = 1)
                GROUP BY fn_order
                UNION
                SELECT a.a, a.b, a.c, s.fn_order
                  FROM (SELECT 0 a, 0 b, 2 c
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
                          FROM DUAL
                        UNION
                        SELECT 0, 2, 0
                          FROM DUAL
                        UNION
                        SELECT 0, 2, 1
                          FROM DUAL) a,
                       (SELECT   a.fk_id fk_razdel, fn_order
                            FROM tisslrazdrows a
                           WHERE a.fk_smid = pfk_razd
                        ORDER BY a.fn_order) s)
      GROUP BY fn_order, fk_townid, fn_age
      ORDER BY fn_order, fk_townid, fn_age DESC;

    CURSOR c_obsl   --���������� ������������� 1,2,3 � ����� ���
    IS
      SELECT   /*+CHOOSE*/
               *
          FROM (SELECT COUNT (1) fn_count, 1
                  FROM (SELECT   fk_pacid, COUNT (1) fn_count
                            FROM ((SELECT   fk_pacid, COUNT (1) fn_count
                                       FROM vresan,
                                            (SELECT DISTINCT fk_pacid fk_vpacid, fd_ins fd_vrun
                                                        FROM vresan
                                                       WHERE fd_ins BETWEEN pfd_dateb AND pfd_datee AND fl_amb = 0
                                                             AND fk_razdid = pfk_razd)
                                      WHERE fk_pacid = fk_vpacid AND fd_ins <= fd_vrun AND fk_razdid = pfk_razd
                                   GROUP BY fk_pacid, fd_ins))
                        GROUP BY fk_pacid)
                 WHERE fn_count = 1
                UNION ALL
                SELECT COUNT (1), 2
                  FROM (SELECT   fk_pacid, COUNT (1) fn_count
                            FROM ((SELECT   fk_pacid, COUNT (1) fn_count
                                       FROM vresan,
                                            (SELECT DISTINCT fk_pacid fk_vpacid, fd_ins fd_vrun
                                                        FROM vresan, tpatname
                                                       WHERE fd_ins BETWEEN pfd_dateb AND pfd_datee AND fl_amb = 0
                                                             AND tpatname.fk_id = fk_patid AND tpatname.fp_prior > 0
                                                             AND fk_razdid = pfk_razd)
                                      WHERE fk_pacid = fk_vpacid AND fd_ins <= fd_vrun AND fk_razdid = pfk_razd
                                   GROUP BY fk_pacid, fd_ins))
                        GROUP BY fk_pacid)
                 WHERE fn_count = 1
                UNION ALL
                SELECT COUNT (1), 3
                  FROM (SELECT   fk_pacid, COUNT (1) fn_count
                            FROM ((SELECT   fk_pacid, COUNT (1) fn_count
                                       FROM vresan,
                                            (SELECT DISTINCT fk_pacid fk_vpacid, fd_ins fd_vrun
                                                        FROM vresan
                                                       WHERE fd_ins BETWEEN pfd_dateb AND pfd_datee AND fl_amb = 1
                                                             AND fk_razdid = pfk_razd)
                                      WHERE fk_pacid = fk_vpacid AND fd_ins <= fd_vrun AND fk_razdid = pfk_razd
                                   GROUP BY fk_pacid, fd_ins))
                        GROUP BY fk_pacid)
                 WHERE fn_count = 1
                UNION ALL
                SELECT COUNT (1), 4
                  FROM (SELECT   fk_pacid, COUNT (1) fn_count
                            FROM ((SELECT   fk_pacid, COUNT (1) fn_count
                                       FROM vresan,
                                            (SELECT DISTINCT fk_pacid fk_vpacid, fd_ins fd_vrun
                                                        FROM vresan, tpatname
                                                       WHERE fd_ins BETWEEN pfd_dateb AND pfd_datee AND fl_amb = 1
                                                             AND tpatname.fk_id = fk_patid AND tpatname.fp_prior > 0
                                                             AND fk_razdid = pfk_razd)
                                      WHERE fk_pacid = fk_vpacid AND fd_ins <= fd_vrun AND fk_razdid = pfk_razd
                                   GROUP BY fk_pacid, fd_ins))
                        GROUP BY fk_pacid)
                 WHERE fn_count = 1
                UNION ALL
                SELECT COUNT (1), 5
                  FROM (SELECT   fk_pacid, COUNT (1) fn_count
                            FROM ((SELECT   fk_pacid, COUNT (1) fn_count
                                       FROM vresan,
                                            (SELECT DISTINCT fk_pacid fk_vpacid, fd_ins fd_vrun
                                                        FROM vresan
                                                       WHERE fd_ins BETWEEN pfd_dateb AND pfd_datee AND fl_amb = 0
                                                             AND fk_razdid = pfk_razd)
                                      WHERE fk_pacid = fk_vpacid AND fd_ins <= fd_vrun AND fk_razdid = pfk_razd
                                   GROUP BY fk_pacid, fd_ins))
                        GROUP BY fk_pacid)
                 WHERE fn_count = 2
                UNION ALL
                SELECT COUNT (1), 6
                  FROM (SELECT   fk_pacid, COUNT (1) fn_count
                            FROM ((SELECT   fk_pacid, COUNT (1) fn_count
                                       FROM vresan,
                                            (SELECT DISTINCT fk_pacid fk_vpacid, fd_ins fd_vrun
                                                        FROM vresan, tpatname
                                                       WHERE fd_ins BETWEEN pfd_dateb AND pfd_datee AND fl_amb = 0
                                                             AND tpatname.fk_id = fk_patid AND tpatname.fp_prior > 0
                                                             AND fk_razdid = pfk_razd)
                                      WHERE fk_pacid = fk_vpacid AND fd_ins <= fd_vrun AND fk_razdid = pfk_razd
                                   GROUP BY fk_pacid, fd_ins))
                        GROUP BY fk_pacid)
                 WHERE fn_count = 2
                UNION ALL
                SELECT COUNT (1), 7
                  FROM (SELECT   fk_pacid, COUNT (1) fn_count
                            FROM ((SELECT   fk_pacid, COUNT (1) fn_count
                                       FROM vresan,
                                            (SELECT DISTINCT fk_pacid fk_vpacid, fd_ins fd_vrun
                                                        FROM vresan
                                                       WHERE fd_ins BETWEEN pfd_dateb AND pfd_datee AND fl_amb = 1
                                                             AND fk_razdid = pfk_razd)
                                      WHERE fk_pacid = fk_vpacid AND fd_ins <= fd_vrun AND fk_razdid = pfk_razd
                                   GROUP BY fk_pacid, fd_ins))
                        GROUP BY fk_pacid)
                 WHERE fn_count = 2
                UNION ALL
                SELECT COUNT (1), 8
                  FROM (SELECT   fk_pacid, COUNT (1) fn_count
                            FROM ((SELECT   fk_pacid, COUNT (1) fn_count
                                       FROM vresan,
                                            (SELECT DISTINCT fk_pacid fk_vpacid, fd_ins fd_vrun
                                                        FROM vresan, tpatname
                                                       WHERE fd_ins BETWEEN pfd_dateb AND pfd_datee AND fl_amb = 1
                                                             AND tpatname.fk_id = fk_patid AND tpatname.fp_prior > 0
                                                             AND fk_razdid = pfk_razd)
                                      WHERE fk_pacid = fk_vpacid AND fd_ins <= fd_vrun AND fk_razdid = pfk_razd
                                   GROUP BY fk_pacid, fd_ins))
                        GROUP BY fk_pacid)
                 WHERE fn_count = 2
                UNION ALL
                SELECT COUNT (1), 9
                  FROM (SELECT   fk_pacid, COUNT (1) fn_count
                            FROM ((SELECT   fk_pacid, COUNT (1) fn_count
                                       FROM vresan,
                                            (SELECT DISTINCT fk_pacid fk_vpacid, fd_ins fd_vrun
                                                        FROM vresan
                                                       WHERE fd_ins BETWEEN pfd_dateb AND pfd_datee AND fl_amb = 0
                                                             AND fk_razdid = pfk_razd)
                                      WHERE fk_pacid = fk_vpacid AND fd_ins <= fd_vrun AND fk_razdid = pfk_razd
                                   GROUP BY fk_pacid, fd_ins))
                        GROUP BY fk_pacid)
                 WHERE fn_count > 2
                UNION ALL
                SELECT COUNT (1), 10
                  FROM (SELECT   fk_pacid, COUNT (1) fn_count
                            FROM ((SELECT   fk_pacid, COUNT (1) fn_count
                                       FROM vresan,
                                            (SELECT DISTINCT fk_pacid fk_vpacid, fd_ins fd_vrun
                                                        FROM vresan, tpatname
                                                       WHERE fd_ins BETWEEN pfd_dateb AND pfd_datee AND fl_amb = 0
                                                             AND tpatname.fk_id = fk_patid AND tpatname.fp_prior > 0
                                                             AND fk_razdid = pfk_razd)
                                      WHERE fk_pacid = fk_vpacid AND fd_ins <= fd_vrun AND fk_razdid = pfk_razd
                                   GROUP BY fk_pacid, fd_ins))
                        GROUP BY fk_pacid)
                 WHERE fn_count > 2
                UNION ALL
                SELECT COUNT (1), 11
                  FROM (SELECT   fk_pacid, COUNT (1) fn_count
                            FROM ((SELECT   fk_pacid, COUNT (1) fn_count
                                       FROM vresan,
                                            (SELECT DISTINCT fk_pacid fk_vpacid, fd_ins fd_vrun
                                                        FROM vresan
                                                       WHERE fd_ins BETWEEN pfd_dateb AND pfd_datee AND fl_amb = 1
                                                             AND fk_razdid = pfk_razd)
                                      WHERE fk_pacid = fk_vpacid AND fd_ins <= fd_vrun AND fk_razdid = pfk_razd
                                   GROUP BY fk_pacid, fd_ins))
                        GROUP BY fk_pacid)
                 WHERE fn_count > 2
                UNION ALL
                SELECT COUNT (1), 12
                  FROM (SELECT   fk_pacid, COUNT (1) fn_count
                            FROM ((SELECT   fk_pacid, COUNT (1) fn_count
                                       FROM vresan,
                                            (SELECT DISTINCT fk_pacid fk_vpacid, fd_ins fd_vrun
                                                        FROM vresan, tpatname
                                                       WHERE fd_ins BETWEEN pfd_dateb AND pfd_datee AND fl_amb = 1
                                                             AND tpatname.fk_id = fk_patid AND tpatname.fp_prior > 0
                                                             AND fk_razdid = pfk_razd)
                                      WHERE fk_pacid = fk_vpacid AND fd_ins <= fd_vrun AND fk_razdid = pfk_razd
                                   GROUP BY fk_pacid, fd_ins))
                        GROUP BY fk_pacid)
                 WHERE fn_count > 2)
      ORDER BY 2;
  BEGIN
    -- ��������� ���������� �������
    FOR cc IN 0 .. 9
    LOOP
      pct_summ (cc) := 0;
    END LOOP;

    --��������� ������������ �������
    SELECT fc_name
      INTO pc_name
      FROM tsmid
     WHERE fk_id = pfk_razd;

    DBMS_LOB.createtemporary (pb_result, TRUE, DBMS_LOB.SESSION);
    -- ��������� ����� ������
    pc_str :=
      get_html_header || '<BODY><P ALIGN="CENTER"><B><font size="+1">������� - ��������������� ����������� ��������� "'
      || pkg_smini.readstring ('CONFIG', 'S_NAME', '�� ��������')
      || '"</font></B><BR><ALIGN="CENTER"><font size="+1">����� � ����������� ������������� �� �������:' || pc_name
      || '</font><br>�� ������ � ' || TO_CHAR (pfd_dateb, 'dd.mm.yyyy') || ' �� ' || TO_CHAR (pfd_datee, 'dd.mm.yyyy')
      || ' .';
    DBMS_LOB.writeappend (pb_result, LENGTH (pc_str), pc_str);
    pc_str :=
      '<table width="100%" border="1" cellpadding="0" cellspacing="0">' || '<TR>'
      || '<TH rowspan="3" width="3%">�:</TH>' || '<TH rowspan="3" width="30%">������������</TH>'
      || '<TH colspan="6" width="57%">����������</TH>' || '<TH rowspan="1" colspan = "2" width="5%">������������</TH>'
      || '<TH rowspan="3" width="5%">�����</TH>' || '</TR><TR>' || '<TH colspan="3">�����������</TH>'
      || '<TH colspan="3">����������� � �������</TH>' || '<TH rowspan="2">�������<BR>�����</TH>'
      || '<TH rowspan="2">����<BR>�����</TH>' || '</TR><TR>' || '<TH width="9%">����</TH>'
      || '<TH width="9%">��������</TH>' || '<TH width="9%">�������</TH>' || '<TH width="9%">����</TH>'
      || '<TH width="9%">��������</TH>' || '<TH width="9%">�������</TH>' || '</TR>';
    DBMS_LOB.writeappend (pb_result, LENGTH (pc_str), pc_str);
    /**/
    progress_bar.setstrout ('�������: ���������� ������������ �� �������');
    progress_bar.stepit;
    pc_str := ' ';

    OPEN c_razd;

    OPEN c_info;

    LOOP
      FETCH c_info
       INTO pn_man;

      IF c_info%NOTFOUND
      THEN
        EXIT;
      END IF;

      IF MOD (c_info%ROWCOUNT, 8) <> 0
      THEN
        pn_summ := pn_summ + pn_man;
      END IF;

      pct_summ (MOD (c_info%ROWCOUNT, 8)) := pct_summ (MOD (c_info%ROWCOUNT, 8)) + pn_man;

      IF MOD (c_info%ROWCOUNT, 8) = 1
      THEN
        FETCH c_razd
         INTO pc_name;

        IF c_razd%NOTFOUND
        THEN
          EXIT;
        END IF;

        pn_number := pn_number + 1;
        pc_str := pc_str || '<TR><TD>' || TO_CHAR (pn_number) || '</TD><TD>' || pc_name || '</TD>';
      END IF;

      IF MOD (c_info%ROWCOUNT, 8) IN (2, 5)
      THEN
        FETCH c_info
         INTO pn_woman;

        pct_summ (MOD (c_info%ROWCOUNT, 8)) := pct_summ (MOD (c_info%ROWCOUNT, 8)) + pn_woman;
        pn_summ := pn_summ + pn_woman;

        IF pn_man + pn_woman = 0
        THEN
          pc_value := '&nbsp;';
        ELSE
          pc_value := TO_CHAR (pn_man + pn_woman);
        END IF;

        pc_str := pc_str || '<TD ALIGN = "center">' || pc_value || '</TD>';

        IF pn_woman = 0
        THEN
          pc_value := '&nbsp;';
        ELSE
          pc_value := TO_CHAR (pn_woman);
        END IF;

        pc_str := pc_str || '<TD ALIGN = "center">' || pc_value || '</TD>';
      ELSE
        IF pn_man = 0
        THEN
          pc_value := '&nbsp;';
        ELSE
          pc_value := TO_CHAR (pn_man);
        END IF;

        pc_str := pc_str || '<TD ALIGN = "center">' || pc_value || '</TD>';
      END IF;

      IF MOD (c_info%ROWCOUNT, 8) = 0
      THEN
        IF pn_summ = 0
        THEN
          pc_value := '&nbsp;';
        ELSE
          pc_value := TO_CHAR (pn_summ);
        END IF;

        pc_str := pc_str || '<TD ALIGN = "center"><B>' || pc_value || '</B></TD></TR>';
        pct_summ (9) := pct_summ (9) + pn_summ;
        pn_summ := 0;
      END IF;
    END LOOP;

    CLOSE c_info;

    CLOSE c_razd;

    DBMS_LOB.writeappend (pb_result, LENGTH (pc_str), pc_str);
    pct_summ (8) := pct_summ (0);
    pc_str := '<TR><TD>' || TO_CHAR (pn_number + 1) || '</TD><TD><B>�����</B></TD>';

    FOR cc IN 1 .. 9
    LOOP
      IF MOD (cc, 8) IN (2, 5)
      THEN
        IF pct_summ (cc) + pct_summ (cc + 1) = 0
        THEN
          pc_value := '&nbsp;';
        ELSE
          pc_value := TO_CHAR (pct_summ (cc) + pct_summ (cc + 1));
        END IF;

        pc_str := pc_str || '<TD ALIGN = "center"><B>' || pc_value || '</B></TD>';
      ELSE
        IF pct_summ (cc) = 0
        THEN
          pc_value := '&nbsp;';
        ELSE
          pc_value := TO_CHAR (pct_summ (cc));
        END IF;

        pc_str := pc_str || '<TD ALIGN = "center"><B>' || pc_value || '</B></TD>';
      END IF;
    END LOOP;

    pc_str := pc_str || '</TR></table>';
    DBMS_LOB.writeappend (pb_result, LENGTH (pc_str), pc_str);
    /**/
    progress_bar.setstrout ('�������: ���������� ������������� �� �������');
    progress_bar.stepit;
    pc_str :=
      '<table width="100%" border="1" cellpadding="0" cellspacing="0">' || '<TR>'
      || '<TH rowspan="2" width="21%">&nbsp;</TH>' || '<TH colspan="3" width="33%">����������:</TH>'
      || '<TH colspan = "3" width="33%">��� ����.:</TH>' || '<TH colspan="3" width="33%">����� ��<BR>�����������</TH>'
      || '</TR><TR>' || '<TH width="11%">����������.</TH>' || '<TH width="11%">� ����������.</TH>'
      || '<TH width="11%">%���������.</TH>' || '<TH width="11%">����������.</TH>'
      || '<TH width="11%">� ����������.</TH>' || '<TH width="11%">%���������.</TH>'
      || '<TH width="11%">����������.</TH>' || '<TH width="11%">� ����������.</TH>'
      || '<TH width="11%">%���������.</TH>' || '</TR>';
    DBMS_LOB.writeappend (pb_result, LENGTH (pc_str), pc_str);
    pc_str := ' ';

    FOR cc IN c_obsl
    LOOP
      pct_summ (c_obsl%ROWCOUNT) := cc.fn_count;
    END LOOP;

    pc_str :=
      '<TR><TD>����� �������</TD><TD>' || TO_CHAR (pct_summ (1) + pct_summ (5) + pct_summ (9)) || '</TD>' || '<TD>'
      || TO_CHAR (pct_summ (2) + pct_summ (6) + pct_summ (10)) || '</TD>';

    IF pct_summ (1) + pct_summ (5) + pct_summ (9) = 0
    THEN
      pn_number := 1;
    ELSE
      pn_number := pct_summ (1) + pct_summ (5) + pct_summ (9);
    END IF;

    pc_str :=
      pc_str || '<TD>' || TO_CHAR (((pct_summ (2) + pct_summ (6) + pct_summ (10)) / pn_number) * 100,
                                   'FM99999999990.09') || '</TD>' || '<TD>'
      || TO_CHAR (pct_summ (3) + pct_summ (7) + pct_summ (11)) || '</TD>' || '<TD>'
      || TO_CHAR (pct_summ (4) + pct_summ (8) + pct_summ (12)) || '</TD>';

    IF pct_summ (3) + pct_summ (7) + pct_summ (11) = 0
    THEN
      pn_number := 1;
    ELSE
      pn_number := pct_summ (3) + pct_summ (7) + pct_summ (11);
    END IF;

    pc_str :=
      pc_str || '<TD>' || TO_CHAR (((pct_summ (4) + pct_summ (8) + pct_summ (12)) / pn_number) * 100,
                                   'FM99999999990.09') || '</TD>' || '<TD>'
      || TO_CHAR (pct_summ (3) + pct_summ (7) + pct_summ (11) + pct_summ (1) + pct_summ (5) + pct_summ (9)) || '</TD>'
      || '<TD>' || TO_CHAR (pct_summ (4) + pct_summ (8) + pct_summ (12) + pct_summ (2) + pct_summ (6) + pct_summ (10))
      || '</TD>';

    IF pct_summ (3) + pct_summ (7) + pct_summ (11) + pct_summ (1) + pct_summ (5) + pct_summ (9) = 0
    THEN
      pn_number := 1;
    ELSE
      pn_number := pct_summ (3) + pct_summ (7) + pct_summ (11) + pct_summ (1) + pct_summ (5) + pct_summ (9);
    END IF;

    pc_str :=
      pc_str || '<TD>'
      || TO_CHAR (((pct_summ (4) + pct_summ (8) + pct_summ (12) + pct_summ (2) + pct_summ (6) + pct_summ (10))
                   / pn_number) * 100,
                  'FM99999999990.09')
      || '</TD>';
    DBMS_LOB.writeappend (pb_result, LENGTH (pc_str), pc_str);
    -- 1 ���
    pc_str := '<TR><TD>1 ���</TD><TD>' || TO_CHAR (pct_summ (1)) || '</TD>' || '<TD>' || TO_CHAR (pct_summ (2))
              || '</TD>';

    IF pct_summ (1) = 0
    THEN
      pn_number := 1;
    ELSE
      pn_number := pct_summ (1);
    END IF;

    pc_str :=
      pc_str || '<TD>' || TO_CHAR ((pct_summ (2) / pn_number) * 100, 'FM99999999990.09') || '</TD>' || '<TD>'
      || TO_CHAR (pct_summ (3)) || '</TD>' || '<TD>' || TO_CHAR (pct_summ (4)) || '</TD>';

    IF pct_summ (3) = 0
    THEN
      pn_number := 1;
    ELSE
      pn_number := pct_summ (3);
    END IF;

    pc_str :=
      pc_str || '<TD>' || TO_CHAR (((pct_summ (4)) / pn_number) * 100, 'FM99999999990.09') || '</TD>' || '<TD>'
      || TO_CHAR (pct_summ (3) + pct_summ (1)) || '</TD>' || '<TD>' || TO_CHAR (pct_summ (4) + pct_summ (2)) || '</TD>';

    IF pct_summ (3) + pct_summ (1) = 0
    THEN
      pn_number := 1;
    ELSE
      pn_number := pct_summ (3) + pct_summ (1);
    END IF;

    pc_str :=
            pc_str || '<TD>' || TO_CHAR (((pct_summ (4) + pct_summ (2)) / pn_number) * 100, 'FM99999999990.09')
            || '</TD>';
    DBMS_LOB.writeappend (pb_result, LENGTH (pc_str), pc_str);
    -- 2 ����
    pc_str :=
             '<TR><TD>2 ����</TD><TD>' || TO_CHAR (pct_summ (5)) || '</TD>' || '<TD>' || TO_CHAR (pct_summ (6))
             || '</TD>';

    IF pct_summ (5) = 0
    THEN
      pn_number := 1;
    ELSE
      pn_number := pct_summ (5);
    END IF;

    pc_str :=
      pc_str || '<TD>' || TO_CHAR ((pct_summ (6) / pn_number) * 100, 'FM99999999990.09') || '</TD>' || '<TD>'
      || TO_CHAR (pct_summ (7)) || '</TD>' || '<TD>' || TO_CHAR (pct_summ (8)) || '</TD>';

    IF pct_summ (7) = 0
    THEN
      pn_number := 1;
    ELSE
      pn_number := pct_summ (7);
    END IF;

    pc_str :=
      pc_str || '<TD>' || TO_CHAR (((pct_summ (8)) / pn_number) * 100, 'FM99999999990.09') || '</TD>' || '<TD>'
      || TO_CHAR (pct_summ (7) + pct_summ (5)) || '</TD>' || '<TD>' || TO_CHAR (pct_summ (8) + pct_summ (6)) || '</TD>';

    IF pct_summ (7) + pct_summ (5) = 0
    THEN
      pn_number := 1;
    ELSE
      pn_number := pct_summ (7) + pct_summ (5);
    END IF;

    pc_str :=
            pc_str || '<TD>' || TO_CHAR (((pct_summ (8) + pct_summ (6)) / pn_number) * 100, 'FM99999999990.09')
            || '</TD>';
    DBMS_LOB.writeappend (pb_result, LENGTH (pc_str), pc_str);
    -- 3 ���� � �����
    pc_str :=
      '<TR><TD>3 ���� � �����</TD><TD>' || TO_CHAR (pct_summ (9)) || '</TD>' || '<TD>' || TO_CHAR (pct_summ (10))
      || '</TD>';

    IF pct_summ (9) = 0
    THEN
      pn_number := 1;
    ELSE
      pn_number := pct_summ (9);
    END IF;

    pc_str :=
      pc_str || '<TD>' || TO_CHAR ((pct_summ (10) / pn_number) * 100, 'FM99999999990.09') || '</TD>' || '<TD>'
      || TO_CHAR (pct_summ (11)) || '</TD>' || '<TD>' || TO_CHAR (pct_summ (12)) || '</TD>';

    IF pct_summ (11) = 0
    THEN
      pn_number := 1;
    ELSE
      pn_number := pct_summ (11);
    END IF;

    pc_str :=
      pc_str || '<TD>' || TO_CHAR (((pct_summ (12)) / pn_number) * 100, 'FM99999999990.09') || '</TD>' || '<TD>'
      || TO_CHAR (pct_summ (11) + pct_summ (9)) || '</TD>' || '<TD>' || TO_CHAR (pct_summ (12) + pct_summ (10))
      || '</TD>';

    IF pct_summ (11) + pct_summ (9) = 0
    THEN
      pn_number := 1;
    ELSE
      pn_number := pct_summ (11) + pct_summ (9);
    END IF;

    pc_str :=
          pc_str || '<TD>' || TO_CHAR (((pct_summ (12) + pct_summ (10)) / pn_number) * 100, 'FM99999999990.09')
          || '</TD>';
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


