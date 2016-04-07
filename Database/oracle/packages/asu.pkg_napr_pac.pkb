DROP PACKAGE BODY ASU.PKG_NAPR_PAC
/

--
-- PKG_NAPR_PAC  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_NAPR_PAC" 
IS
function GET_NAPR_PAC (data1 in date,data2 in date,vrach_id in number)
RETURN NUMBER
 IS
CURSOR c
 is
select count(*) from tsroky,tkarta
where tkarta.fk_id=tsroky.fk_pacid and
      tsroky.fd_data1 between data1 AND data2 AND
      tsroky.fk_pryb =3 and
      tkarta.fl_ill=1;
 tc number;
 nc number;  --   ������������ ��������
 cc CLOB;    --   ��������� ����
 str VARCHAR2 (32767);  --  ��������� ������ HTML-����
  BEGIN

 DBMS_LOB.createtemporary(cc,true,DBMS_LOB.session);
 str:=GET_HTML_HEADER(0);
  DBMS_LOB.WRITEAPPEND (cc, LENGTH (str), str); --                                        ������� ������ � ����� �����
         --                                    �����
  str  :='<P ALIGN="CENTER"><B><font size="+1"> ������������� "' ||
        PKG_SMINI.READSTRING ('CONFIG', 'S_NAME', '�� ��������') ||
        '"</font></B><BR>';
    str  := str || '<ALIGN="CENTER"><font size="+2">"����� � ���������, ������������ � ��������"  </font><br>';
    str  := str || '�� ������ � ' || TO_CHAR (data1, 'dd.mm.yyyy') || ' �� ' || TO_CHAR (data2, 'dd.mm.yyyy')||'<BR>';
  DBMS_LOB.WRITEAPPEND (cc, LENGTH (str), str); --                                        ������� ������ � ����� �����
str := '<BR><p align="left"><B>���������� ������� ������������ � ��������:</B>';
open c;
fetch c into tc;
close c;
str:= str||' '||tc||'</p><br>';
DBMS_LOB.WRITEAPPEND (cc, LENGTH (str), str);
      str:='<p align="left">����� ��������:  _________________________'|| DO_VRACHFIO(vrach_id)||'</p>';
      DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
 --             ��������
 str  := '</html>';
 DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    INSERT INTO TCLOBS
                (FC_CLOB)
         VALUES (cc)
      RETURNING FK_ID
          INTO nC;
  RETURN nc;
 end;

END; -- Package Body PKG_NAPR_PAC
/

SHOW ERRORS;


