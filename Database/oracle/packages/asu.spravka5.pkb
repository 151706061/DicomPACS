DROP PACKAGE BODY ASU.SPRAVKA5
/

--
-- SPRAVKA5  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."SPRAVKA5" 
IS
   FUNCTION do_calc_report (pfd_data1 IN DATE, pfk_vrachid IN NUMBER)
      RETURN NUMBER
   IS
      nall          NUMBER;
      strtable      VARCHAR2 (100);
      nshortall     NUMBER;
      nc            NUMBER;
      cc            CLOB;
      str           VARCHAR2 (2000);
      ncols         NUMBER;
      sp            VARCHAR2 (100);
      n1            NUMBER;
      n2            NUMBER;
      n3            NUMBER;
      n4            NUMBER;
      n5            NUMBER;
      n6            NUMBER;
      n7            NUMBER;
      n8            NUMBER;
      ntotal        NUMBER;
      nshorttotal   NUMBER;
   BEGIN
      INSERT INTO tclobs
                  (fc_clob
                  )
           VALUES (EMPTY_CLOB ()
                  )
        RETURNING fk_id, fc_clob
             INTO nc, cc;

      DBMS_LOB.OPEN (cc, DBMS_LOB.lob_readwrite);
      str :=
            '<html><head><meta http-equiv="Content-Type" content="text/html; charset=windows-1251"></head><p ALIGN="RIGHT"><b><font size="1">����� �5</b></P><P ALIGN="CENTER"><B><font size="+3">������� </font> <br><font size="+2">� �������� ������� (����������) �� ��������� "'
         || '������� ����'
         || '"</font></B><BR>';
      str :=
            str
         || '<ALIGN="CENTER"><font size="+2">�� '
         || TO_CHAR (pfd_data1, 'dd.mm.yyyy')
         || '</font></P>';
      DBMS_LOB.writeappend (cc, LENGTH (str), str);
      str :=
         '<table align="center" width="100%" border="1" bordercolorlight="#000000" bordercolordark="#FFFFFF" bordercolor="#FFFFFF" bgcolor="#FFFFFF" cellpadding="0" cellspacing="0">';
      DBMS_LOB.writeappend (cc, LENGTH (str), str);
      str :=
         '<TR ALIGN="CENTER"><TD ROWSPAN="2">&nbsp;</TD></font><TD ROWSPAN="2"><B><font size="-2">�������:</B></TD></font><TD COLSPAN="2"><B><font size="-2">������� � �����.</B></TD></font><TD COLSPAN="2"><B><font size="-2">����� �����</B></TD></font><TD COLSPAN="2"><B><font size="-2">�����. �� �����.</B></TD></font><TD COLSPAN="2"><B><font size="-2">�����. �� ���.</B></TD></font></TR>';
      str :=
            str
         || '<tr ALIGN="CENTER"> <TD><font size="-2"><B>���.:</TD></font><td ><font size="-2"><B>���.:</TD></font>';
      str :=
            str
         || ' <td ><B><font size="-2">���.:</TD></font><td><B><font size="-2">���.:</TD></font>';
      str :=
            str
         || ' <td ><B><font size="-2">���.:</TD></font><td><B><font size="-2">���.:</TD></font>';
      str :=
            str
         || ' <td ><B><font size="-2">���.:</TD></font><td><B><font size="-2">���.:</TD></font></tr>';
      DBMS_LOB.writeappend (cc, LENGTH (str), str);

      OPEN cbegin (pfd_data1);

      FETCH cbegin
       INTO ntotal;

      CLOSE cbegin;

      str :=
            '<TR ALIGN="CENTER"><TD ALIGN="LEFT"><font size="-2"><B>1.�������� �� ������ ���:</TD></font><TD><font size="-2">'
         || ntotal
         || '</TD></font><TD><font size="-2">-</TD></font><TD><font size="-2">-</TD></font><TD><font size="-2">-</TD></font><TD><font size="-2">-</TD></font><TD><font size="-2">-</TD></font><TD><font size="-2">-</TD></font><TD><font size="-2">-</TD></font><TD><font size="-2">-</TD></font>';
      DBMS_LOB.writeappend (cc, LENGTH (str), str);

      OPEN cprybran (pfd_data1);

      FETCH cprybran
       INTO ntotal, nshorttotal;

      CLOSE cprybran;

      IF nshorttotal IS NULL
      THEN
         nshorttotal := 0;
      END IF;

      str :=
            '<TR ALIGN="CENTER"><TD ALIGN="LEFT"><font size="-2"><B>2.������� �� ����:</TD></font><TD><font size="-2">'
         || get_count_pryb (pfd_data1)
         || '</TD></font><TD><font size="-2">'
         || ntotal
         || '</TD></font><TD><font size="-2">'
         || nshorttotal
         || '</TD></font><TD><font size="-2">-</TD></font><TD><font size="-2">-</TD></font><TD><font size="-2">-</TD></font><TD><font size="-2">-</TD></font><TD><font size="-2">-</TD></font><TD><font size="-2">-</TD></font>';
      DBMS_LOB.writeappend (cc, LENGTH (str), str);

      OPEN cvybran (pfd_data1);

      FETCH cvybran
       INTO ntotal, nshorttotal;

      CLOSE cvybran;

      IF nshorttotal IS NULL
      THEN
         nshorttotal := 0;
      END IF;

      str :=
            '<TR ALIGN="CENTER"><TD ALIGN="LEFT"><B><font size="-2">3.������ �� ����:</TD></font><TD><font size="-2">'
         || get_count_vyb (pfd_data1)
         || '</TD></font><TD><font size="-2">-</TD></font><TD><font size="-2">-</TD></font><TD><font size="-2">'
         || ntotal
         || '</TD></font><TD><font size="-2">'
         || nshorttotal
         || '</TD></font><TD><font size="-2">-</TD></font><TD><font size="-2">-</TD></font><TD><font size="-2">-</TD></font><TD><font size="-2">-</TD></font>';
      DBMS_LOB.writeappend (cc, LENGTH (str), str);

      OPEN cbegin (pfd_data1 + 1);

      FETCH cbegin
       INTO ntotal;

      CLOSE cbegin;

      str :=
            '<TR ALIGN="CENTER"><TD ALIGN="LEFT"><B><font size="-2">4.�� ����� ���:</TD></font><TD><font size="-2">'
         || ntotal
         || '</TD></font><TD><font size="-2">-</TD></font><TD><font size="-2">-</TD></font><TD><font size="-2">-</TD></font><TD><font size="-2">-</TD></font><TD><font size="-2">';

      OPEN cprodl (pfd_data1, 6);

      FETCH cprodl
       INTO ntotal, nshorttotal;

      CLOSE cprodl;

      IF nshorttotal IS NULL
      THEN
         nshorttotal := 0;
      END IF;

      str :=
            str
         || ntotal
         || '</TD></font><TD><font size="-2">'
         || nshorttotal
         || '</TD></font><TD><font size="-2">';

      OPEN cprodl (pfd_data1, 5);

      FETCH cprodl
       INTO ntotal, nshorttotal;

      CLOSE cprodl;

      IF nshorttotal IS NULL
      THEN
         nshorttotal := 0;
      END IF;

      str :=
            str
         || ntotal
         || '</TD></font><TD><font size="-2">'
         || nshorttotal
         || '</TD></font></TABLE><BR><BR><P ALIGN="CENTER"><font size="+3"><b>�. �������� </b></font><BR><font size="+1">�� ��������� �������(����������) �� '
         || TO_CHAR (pfd_data1, 'dd.mm.yyyy')
         || '</font></P>';
      DBMS_LOB.writeappend (cc, LENGTH (str), str);
      str :=
         '<table align="center" width="100%" border="1" bordercolorlight="#000000" bordercolordark="#FFFFFF" bordercolor="#FFFFFF" bgcolor="#FFFFFF" cellpadding="0" cellspacing="0">';
      DBMS_LOB.writeappend (cc, LENGTH (str), str);
      str :=
         '<tr ALIGN="CENTER"><td rowspan="4"><B><font size="-2">�:</B></TD></font><td rowspan="4"><B><font size="-2">������� � �������� �����������:</B></TD></font><td colspan="3"><B><font size="-2">�������</B></TD></font><td rowspan="3" colspan="2"><font size="-2"><B>��������</B></TD></font></tr><tr ALIGN="CENTER"><td rowspan="3"><B><font size="-2">�����:</B></TD></font><td rowspan="3"><B><font size="-2">�:</B></TD></font><td rowspan="3"><B><font size="-2">��:</B></TD></font></tr><tr ALIGN="CENTER"> </tr><tr ALIGN="CENTER"><TD><font size="-2"><B>�����:</B></TD></font><TD><font size="-2"><B>���������:</B></TD></font></tr>';
      DBMS_LOB.writeappend (cc, LENGTH (str), str);
      n1 := 1;
      n2 := 0;
      n3 := 0;

      FOR p IN ctypeput
      LOOP
         IF p.fc_vid IS NOT NULL
         THEN
            str :=
                  '<TR ALIGN="LEFT"><TD COLSPAN="7"><B><font size="-2">'
               || p.fc_vid
               || ':</B></TD></font></TR>';
         ELSE
            str :=
               '<TR ALIGN="LEFT"><TD COLSPAN="7"><B><font size="-2">&nbsp;:</B></TD></font></TR>';
         END IF;

         FOR n IN cpryb (pfd_data1, p.fk_id)
         LOOP
            sp := n.fc_put;

            IF sp IS NULL
            THEN
               sp := '&nbsp;';
            END IF;

            str :=
                  str
               || '<TR ALIGN="CENTER"><TD><font size="-2">'
               || n1
               || '</TD></font><TD ALIGN="LEFT"><font size="-2">'
               || n.fc_fio
               || '</TD></font><TD><font size="-2">'
               || sp
               || '</TD></font><TD><font size="-2">'
               || TO_CHAR (n.fd_data1, 'dd.mm.yyyy')
               || '</TD></font><TD><font size="-2">'
               || TO_CHAR (n.fd_data2, 'dd.mm.yyyy')
               || '</TD></font><TD><font size="-2">'
               || n.fn_opozd
               || '</TD></font><TD><font size="-2">'
               || n.fn_ranee
               || '</TD></font></TR>';
            n2 := n2 + n.fn_opozd;
            n3 := n3 + n.fn_ranee;
            n1 := n1 + 1;
            DBMS_LOB.writeappend (cc, LENGTH (str), str);
            str := '';
         END LOOP;
      END LOOP;

      str :=
            '<TR ALIGN="CENTER"><TD><font size="-2">&nbsp;</TD></font><TD ALIGN="LEFT"><B><font size="-2">�����: '
         || TO_CHAR (n1 - 1)
         || '</B></TD></font><TD><font size="-2">&nbsp;</TD></font><TD><font size="-2">&nbsp;</TD></font><TD><font size="-2">&nbsp;</TD></font><TD><font size="-2"><B>'
         || n2
         || '</B></TD></font><TD><font size="-2"><B>'
         || n3
         || '</B></TD></font></TR></TABLE><P><font size="+2">������� �� ��������� � ���������� ___________ ���� �����������.</font></P>';
      DBMS_LOB.writeappend (cc, LENGTH (str), str);
      str :=
         '<span lang=EN-US style=''font-size:12.0pt;font-family:"Times New Roman"mso-fareast-font-family:"Times New Roman";mso-ansi-language:EN-US;mso-fareast-language:RU;mso-bidi-language:AR-SA''><br clear=all style=''mso-special-character:line-break;page-break-before:always''></span>';
      DBMS_LOB.writeappend (cc, LENGTH (str), str);
      str :=
            '<P ALIGN="CENTER"><font size="+3"><b>�. �������� </b></font><BR><font size="+1">�� ������� ������� (����������) �� '
         || TO_CHAR (pfd_data1, 'dd.mm.yyyy')
         || '</font></P> <table align="CENTER" width="100%" border="1" bordercolorlight="#000000" bordercolordark="#FFFFFF" bordercolor="#FFFFFF" bgcolor="#FFFFFF" cellpadding="0" cellspacing="0">';
      DBMS_LOB.writeappend (cc, LENGTH (str), str);
      str :=
         '<tr> <td rowspan="2"> <div align="center"><b><font size="-2">�:</b></div> </TD></font><td rowspan="2"> <div align="center"><b><font size="-2">������� � �������� �����������:</b></div> </TD></font> <td colspan="3"> <div align="center"><b><font size="-2">�������</b></div></TD></font><td rowspan="2"> <div align="center"><b><font size="-2">���� ��������:</b></div> </TD></font> <td colspan="3"> <div align="center"><b><font size="-2">���������� ����</b></div> </TD></font><td colspan="2"> <div align="center"><b><font size="-2">��� ���������</b></div></TD></font>';
      str :=
            str
         || '<td colspan="2"> <div align="center"><b><font size="-2">�����-���</b></div> </TD></font> </tr> <tr> <TD><font size="-2">  <div align="center"><b>�:</b></div></TD></font><TD><font size="-2"> <div align="center"><b>�:</b></div></TD></font><TD><font size="-2"> <div align="center"><b>��:</b></div></TD></font><TD><font size="-2"> <div align="center"><b>����. �����:</b></div></TD></font><TD><font size="-2"> <div align="center"><b>�����.:</b></div></TD></font>';
      str :=
            str
         || '<TD><font size="-2"> <div align="center"><b>����. ���.:</b></div></TD></font><TD><font size="-2"> <div align="center"><b>�� �����:</b></div></TD></font><TD><font size="-2"> <div align="center"><b>�� �/�.:</b></div></TD></font><TD><font size="-2"> <div align="center"><b>������. ������:</b></div></TD></font><TD><font size="-2"> <div align="center"><b>�����. ������:</b></div></TD></font></tr>';
      DBMS_LOB.writeappend (cc, LENGTH (str), str);
      n1 := 1;
      n2 := 0;
      n3 := 0;
      n4 := 0;
      n5 := 0;
      n6 := 0;
      n7 := 0;
      n8 := 0;

      FOR p IN ctypeput
      LOOP
         str :=
               '<TR ALIGN="LEFT"><TD COLSPAN="13"><B><font size="-2">'
            || p.fc_vid
            || ':</B></TD></font></TR>';

         FOR n IN cvyb (pfd_data1, p.fk_id)
         LOOP
            str :=
                  str
               || '<TR ALIGN="CENTER"><TD><font size="-2">'
               || n1
               || '</TD></font><TD ALIGN="LEFT"><font size="-2">'
               || n.fc_fio
               || '</TD></font><TD><font size="-2">'
               || n.fc_put
               || '</TD></font><TD><font size="-2">'
               || TO_CHAR (n.fd_data1, 'dd.mm.yyyy')
               || '</TD></font><TD><font size="-2">'
               || TO_CHAR (n.fd_data2, 'dd.mm.yyyy')
               || '</TD></font><TD><font size="-2">'
               || TO_CHAR (n.fd_pryb, 'dd.mm.yyyy')
               || '</TD></font><TD><font size="-2">'
               || n.fn_ranee
               || '</TD></font><TD><font size="-2">'
               || n.fn_opozd
               || '</TD></font><TD><font size="-2">'
               || n.fn_vybranee
               || '</TD></font><TD><font size="-2">'
               || n.fn_prodlop
               || '</TD></font><TD><font size="-2">'
               || n.fn_prodlnal
               || '</TD></font><TD><font size="-2">'
               || n.fn_proshl
               || '</TD></font><TD><font size="-2">'
               || n.fn_tekush
               || '</TD></font></TR>';
            n2 := n2 + n.fn_ranee;
            n3 := n3 + n.fn_opozd;
            n4 := n4 + n.fn_vybranee;
            n5 := n5 + n.fn_prodlop;
            n6 := n6 + n.fn_prodlnal;
            n7 := n7 + n.fn_proshl;
            n8 := n8 + n.fn_tekush;
            n1 := n1 + 1;
            DBMS_LOB.writeappend (cc, LENGTH (str), str);
            str := '';
         END LOOP;
      END LOOP;

      str :=
            '<TR ALIGN="CENTER"><TD><font size="-2">&nbsp;</TD></font><TD ALIGN="LEFT"><font size="-2"><B>�����: '
         || TO_CHAR (n1 - 1)
         || '</B></TD></font><TD><font size="-2">&nbsp;</TD></font><TD><font size="-2">&nbsp;</TD></font><TD><font size="-2">&nbsp;</TD></font><TD><font size="-2">&nbsp;</TD></font><TD><font size="-2"><B>'
         || n2
         || '</B></TD></font><TD><font size="-2"><B>'
         || n3
         || '</B></TD></font><TD><font size="-2"><B>'
         || n4
         || '</B></TD></font><TD><font size="-2"><B>'
         || n5
         || '</B></TD></font><TD><font size="-2"><B>'
         || n6
         || '</B></TD></font><TD><font size="-2"><B>'
         || n7
         || '</B></TD></font><TD><font size="-2"><B>'
         || n8
         || '</B></TD></font></TR></TABLE><BR>';
      DBMS_LOB.writeappend (cc, LENGTH (str), str);
      str :=
         '<font size="+2">������� � ������ ��������� �� �������� � ���������� ___________ ���� �����������.<br><br>';
      str :=
            str
         || '����� ��������: _________________________'
         || do_vrachfio (pfk_vrachid)
         || '<BR>';
      str := str || '���������: ������� ��������� _________________________</font></html>';
      DBMS_LOB.writeappend (cc, LENGTH (str), str);
      DBMS_LOB.CLOSE (cc);
      RETURN nc;
   END;
END;                                                              -- Package Body SPRAVKA5
/

SHOW ERRORS;


