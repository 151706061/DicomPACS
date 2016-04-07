-- Start of DDL Script for Function ASU.INT_NUMBER_TO_WORDS
-- Generated 30-���-2009 9:30:26 from ASU@ASU

CREATE OR REPLACE 
FUNCTION     asu.int_number_to_words (aSource IN NUMBER,                         -- ����� �����
                             aRod IN NUMBER default 1,                  -- ��� - 1-�������, 2-�������, 0-�������
                             aWordFor1 IN VARCHAR2 default null,        -- ������� ��� ����, �������������� �� 1 (�������� '�����')
                             aWordFor234 IN VARCHAR2 default null,      -- ������� ��� ����, �������������� �� 2,3,4 (�������� '�����')
                             aWordFor567890_1x IN VARCHAR2 default null -- ������� ��� ���� ��������� �����, ������� 11, 12, � �.�. (�������� '������')
                            ) RETURN varchar2 IS
  result VARCHAR2(500);
  i  NUMBER;
  s VARCHAR2(50);
  n NUMBER;
  n1 NUMBER;  
BEGIN
  -- ����������� ������� ����� � ������ ��������� ������
  result := ltrim(to_char(TRUNC(aSource), '9,9,,9,,,,,,9,9,,9,,,,,9,9,,9,,,,9,9,,9,,,.'));

  s := TO_CHAR(TRUNC(aSource)); -- ���������� 2 ��������� ����� �����
  s := SUBSTR(s, Length(s)-1, 2);
  n := TO_NUMBER(s);
  n1 := (Trunc(  ((n / 10) - Trunc(n / 10))*10 ));
  result := replace( result, '.', 'r');
  -- t - ������; m - �������; M - ���������;
  result := replace( result, ',,,,,,', 'eM');
  result := replace( result, ',,,,,', 'em');
  result := replace( result, ',,,,', 'et');
  -- e - �������; d - �������; c - �����;
  result := replace( result, ',,,', 'e');
  result := replace( result, ',,', 'd');
  result := replace( result, ',', 'c');
  --
  result := replace( result, '0c0d0et', '');
  result := replace( result, '0c0d0em', '');
  result := replace( result, '0c0d0eM', '');

  -- ������� ��������� ���������������� ������������� ����� ���������� ��������������
  result := replace( result, '0c', '');
  result := replace( result, '1c', '��� ');
  result := replace( result, '2c', '������ ');
  result := replace( result, '3c', '������ ');
  result := replace( result, '4c', '��������� ');
  result := replace( result, '5c', '������� ');
  result := replace( result, '6c', '�������� ');
  result := replace( result, '7c', '������� ');
  result := replace( result, '8c', '��������� ');
  result := replace( result, '9c', '��������� ');
  --
  result := replace( result, '1d0e', '������ ');
  result := replace( result, '1d1e', '����������� ');
  result := replace( result, '1d2e', '���������� ');
  result := replace( result, '1d3e', '���������� ');
  result := replace( result, '1d4e', '������������ ');
  result := replace( result, '1d5e', '���������� ');
  result := replace( result, '1d6e', '����������� ');
  result := replace( result, '1d7e', '���������� ');
  result := replace( result, '1d8e', '������������ ');
  result := replace( result, '1d9e', '������������ ');
  --
  result := replace( result, '0d', '');
  result := replace( result, '2d', '�������� ');
  result := replace( result, '3d', '�������� ');
  result := replace( result, '4d', '����� ');
  result := replace( result, '5d', '��������� ');
  result := replace( result, '6d', '���������� ');
  result := replace( result, '7d', '��������� ');
  result := replace( result, '8d', '����������� ');
  result := replace( result, '9d', '��������� ');
  --
  result := replace( result, '1et', '���� ������ ');
  result := replace( result, '2et', '��� ������ ');
  result := replace( result, '3et', '��� ������ ');
  result := replace( result, '4et', '������ ������ ');
  result := replace( result, '1em', '���� ������� ');
  result := replace( result, '2em', '��� �������� ');
  result := replace( result, '3em', '��� �������� ');
  result := replace( result, '4em', '������ �������� ');
  result := replace( result, '1eM', '���� �������� ');
  result := replace( result, '2eM', '��� ��������� ');
  result := replace( result, '3eM', '��� ��������� ');
  result := replace( result, '4eM', '������ ��������� ');
  --
  result := replace( result, '0et', 't');
  result := replace( result, '0em', 'm');
  result := replace( result, '0eM', 'M');
  result := replace( result, '0er', 'r');

  --
  if aRod = 1 then
    result := replace( result, '1e', '���� ');
    result := replace( result, '2e', '��� ');
  elsif  aRod = 2 then
    result := replace( result, '1e', '���� ');
    result := replace( result, '2e', '��� ');
  elsif  aRod = 0 then
    result := replace( result, '1e', '���� ');
    result := replace( result, '2e', '��� ');
  end if;

  result := replace( result, '3e', '��� ');
  result := replace( result, '4e', '������ ');
  result := replace( result, '5e', '���� ');
  result := replace( result, '6e', '����� ');
  result := replace( result, '7e', '���� ');
  result := replace( result, '8e', '������ ');
  result := replace( result, '9e', '������ ');
  --
  result := replace( result, 't', '����� ');
  result := replace( result, 'm', '��������� ');
  result := replace( result, 'M', '���������� ');

  -- ������� ���������
  if ((n<10) or (n>20)) and(n1 = 1) then
    result := replace( result, 'r', aWordFor1);
  elsif ((n<10) or (n>20)) and(n1 in(2,3,4))  then -- �������� ��� ��� �� 10..20 � 
    result := replace( result, 'r', aWordFor234);
  else
    result := replace( result, 'r', aWordFor567890_1x);
  end if;

  -- �������� ������ ������ ��������� � ������� �������
  RETURN result; -- (UPPER(SUBSTR(Result,1,1))||SUBSTR(Result,2));
END INT_NUMBER_TO_WORDS;
/



-- End of DDL Script for Function ASU.INT_NUMBER_TO_WORDS

