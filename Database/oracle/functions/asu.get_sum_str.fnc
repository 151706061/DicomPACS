DROP FUNCTION ASU.GET_SUM_STR
/

--
-- GET_SUM_STR  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE FUNCTION ASU."GET_SUM_STR" (Data IN NUMBER) RETURN VARCHAR2 IS
-- �������� by Linnikov 20080522
-- ������� ������������ ����� ��������
-- �� ����� ��������� �������� �������� ������� 123456789012.12
-- �� ���� �� ����� 15 ������ � �����, ������ � ������������
--         � ������� ������. ������� ����� ����� �������������.
-- �� ������ ������� ����������� ������ � ������ ��������.
   Stmon  VARCHAR2(255); -- ��������� ������
   St VARCHAR2(15); -- ��������������� ����������
--
   d1  VARCHAR2(3); -- ��� �����
--
   Tr1  VARCHAR2(1); -- �����
   Tr2  VARCHAR2(1); -- �������
   Tr3  VARCHAR2(1); -- �������
--
  kop1  VARCHAR2(1); -- ������� ������
  kop2  VARCHAR2(1); -- ������� ������

BEGIN

-- {����������� �� ����� � ������}
  St:=substr((to_char(abs(data),'999999999990D00')),2,15);
  Stmon:=''; -- ��������� ������������� ����������� ������

FOR i IN 1..5 LOOP
-- {�������� ��� �����}
  d1:=SUBSTR(St,1,3);
  St:=substr(St,4,(length(St)-3));

-- {������ ����� �� ���}
  Tr1:=SUBSTR(d1,1,1);

-- {������ ����� �� ���}
  Tr2:=SUBSTR(d1,2,1);

-- {������ ����� �� ���}
  Tr3:=SUBSTR(d1,3,1);

/*-------------------------------------------------------
              ��������� ����� ����� ����� (������)
*/

-- ��������� ������ �����
if i<>5 then
  IF Tr1='1' THEN Stmon:=Stmon||'��� ';
  END IF;
--
  IF Tr1='2' THEN Stmon:=Stmon||'������ ';
  END IF;
--
  IF Tr1='3' THEN Stmon:=Stmon||'������';
  END IF;
--
  IF Tr1='4' THEN Stmon:=Stmon||'���������';
  END IF;
--
  IF Tr1='5' THEN Stmon:=Stmon||'������� ';
  END IF;
--
  IF Tr1='6' THEN Stmon:=Stmon||'�������� ';
  END IF;
--
  IF Tr1='7' THEN Stmon:=Stmon||'������� ';
  END IF;
--
  IF Tr1='8' THEN Stmon:=Stmon||'��������� ';
  END IF;
--
  IF Tr1='9' THEN Stmon:=Stmon||'��������� ';
  END IF;

-- ��������� 2 �����
  IF Tr2='1' THEN
     IF Tr3='0' THEN Stmon:=Stmon||'������ ';
     END IF;
--
     If Tr3='1' THEN Stmon:=Stmon||'����������� ';
     END IF;
--
     If Tr3='2' THEN Stmon:=Stmon||'���������� ';
     END IF;
--
     If Tr3='3' THEN Stmon:=Stmon||'�p�������� ';
     END IF;
--
     If Tr3='4' THEN Stmon:=Stmon||'����p������� ';
     END IF;
--
     If Tr3='5' THEN Stmon:=Stmon||'���������� ';
     END IF;
--
     If Tr3='6' THEN Stmon:=Stmon||'����������� ';
     END IF;
--
     If Tr3='7' THEN Stmon:=Stmon||'���������� ';
     END IF;
--
     If Tr3='8' THEN Stmon:=Stmon||'������������ ';
     END IF;
--
     If Tr3='9' THEN Stmon:=Stmon||'������������ ';
     END IF;
 END IF;
--
     If Tr2='2' then Stmon:=Stmon||'�������� ';
     END IF;
--
     If Tr2='3' then Stmon:=Stmon||'�p������ ';
     END IF;
--
     If Tr2='4' then Stmon:=Stmon||'��p�� ';
     END IF;
--
     If Tr2='5' then Stmon:=Stmon||'��������� ';
     END IF;
--
     If Tr2='6' then Stmon:=Stmon||'���������� ';
     END IF;
--
     If Tr2='7' then Stmon:=Stmon||'��������� ';
     END IF;
--
     If Tr2='8' then Stmon:=Stmon||'����������� ';
     END IF;
--
     If Tr2='9' then Stmon:=Stmon||'��������� ';
     END IF;

-- ��������� 3 �����
  IF Tr2!='1' then
     If Tr3='1' and i!=3 then Stmon:=Stmon||'���� ';
     END IF;
--
     If Tr3='1' and i=3 then Stmon:=Stmon||'���� ';
     END IF;
--
     If Tr3='2' and i!=3 then Stmon:=Stmon||'��� ';
     END IF;
--
     If Tr3='2' and i=3 then Stmon:=Stmon||'��� ';
     END IF;
--
     If Tr3='3' then Stmon:=Stmon||'�p� ';
     END IF;
--
     If Tr3='4' then Stmon:=Stmon||'����p� ';
     END IF;
--
     If Tr3='5' then Stmon:=Stmon||'���� ';
     END IF;
--
     If Tr3='6' then Stmon:=Stmon||'����� ';
     END IF;
--
     If Tr3='7' then Stmon:=Stmon||'���� ';
     END IF;
--
     If Tr3='8' then Stmon:=Stmon||'������ ';
     END IF;
--
     If Tr3='9' then Stmon:=Stmon||'������ ';
     END IF;
 END IF;

/*-------------------------------------------------------
              ��������� ����������
*/
if i=1 then
  IF (Tr1=' ') And (Tr2=' ') And (Tr3=' ') then NULL;
  elsIf (Tr1='0') And (Tr2='0') And (Tr3='0') then NULL;
  elsif (Tr3='1') And (Tr2!='1') then Stmon:=Stmon||'������p� ';
  elsif (Tr3='2' or Tr3='3' or Tr3='4')
         And (Tr2!='1') then Stmon:=Stmon||'������p�� ';
  else Stmon:=Stmon||'������p��� ';
  END IF;
end if; -- ����� ��������� ����������

/*-------------------------------------------------------
              ��������� ���������
*/
if i=2 then
  IF (Tr1=' ') And (Tr2=' ') And (Tr3=' ') then  NULL;
  elsIf (Tr1='0') And (Tr2='0') And (Tr3='0') then NULL;
  elsIf (Tr3='1') And (Tr2!='1') then Stmon:=Stmon||'������� ';
  elsIf (Tr3='2' or Tr3='3' or Tr3='4')
         And (Tr2!='1') then Stmon:=Stmon||'�������� ';
  else Stmon:=Stmon||'��������� ';
  END IF;
end if;-- ����� ��������� ���������

/*-------------------------------------------------------
              ��������� �����
*/
if i=3 then
  If (Tr1=' ') And (Tr2=' ') And (Tr3=' ') then NULL;
  elsIf (Tr1='0') And (Tr2='0') And (Tr3='0') then NULL;
  elsIf (Tr3='1') And (Tr2<>'1') then Stmon:=Stmon||'������ ';
  elsIf (Tr3='2' or Tr3='3' or Tr3='4')
         And (Tr2<>'1') then Stmon:=Stmon||'������ ';
  else Stmon:=Stmon||'����� ';
  END IF;
end if; -- ����� ��������� �����

/*-------------------------------------------------------
              ��������� �����
*/
if i=4 then
  IF (Tr1=' ') And (Tr2=' ') And (Tr3=' ') then NULL;
  elsif (Tr3='1') And (Tr2!='1') then Stmon:=Stmon||'p���� ';
  elsIf (Tr3='2' or Tr3='3' or Tr3='4')
         And (Tr2!='1') then Stmon:=Stmon||'p���� ';
  elsIf (Tr1=' ') And (Tr2=' ')
         And (Tr3='0') then Stmon:=Stmon||'���� p����� ';
  else Stmon:=Stmon||'p����� ';
  END IF;
end if;-- ����� ��������� �����
--
end if;-- ����� ��������� ����� ����� ����� (������)

/*-------------------------------------------------------
              ��������� ������
*/
if i=5 then
-- {��������� ��������}
  kop1:=SUBSTR(d1,2,1);

-- {��������� ������}
  kop2:=SUBSTR(d1,3,1);

-- {���������� ������ � �������������� ������}
  Stmon:=Stmon||kop1||kop2||' ';

  If  (kop2='1') And (kop1!='1') then
       Stmon:=Stmon||'�������';
     elsIf (kop2='2' or kop2='3' or kop2='4') And (kop1!='1') then
           Stmon:=Stmon||'�������';
        else Stmon:=Stmon||'������';
  END IF;
end if;-- ����� ��������� ������

end loop;

-- �������������� ������� ������� ������ � ��������� �����
  Stmon:=upper(SUBSTR(Stmon,1,1))||SUBSTR(Stmon,2,(Length(Stmon)-1));

  RETURN(Stmon);

END get_sum_str;
/

SHOW ERRORS;


