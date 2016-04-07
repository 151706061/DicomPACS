DROP FUNCTION ASU.GET_COUNTSTR
/

--
-- GET_COUNTSTR  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE FUNCTION ASU."GET_COUNTSTR" (source IN NUMBER)
  RETURN VARCHAR2
IS
  result   VARCHAR2 (300);
/**********************************************/
/* ����� ������� �������� */
/**********************************************/
BEGIN
  -- k - �������
  result  := LTRIM (TO_CHAR (source, '9,9,,9,,,,,,9,9,,9,,,,,9,9,,9,,,,9,9,,9,,,.99'));
--  result  := LTRIM (TO_CHAR (source, '9,9,,9,,,,,,9,9,,9,,,,,9,9,,9,,,,9,9,,9,,,'));
  -- t - ������; m - �������; M - ���������;
  result  := REPLACE (result, ',,,,,,', 'eM');
  result  := REPLACE (result, ',,,,,', 'em');
  result  := REPLACE (result, ',,,,', 'et');
  -- e - �������; d - �������; c - �����;
  result  := REPLACE (result, ',,,', 'e');
  result  := REPLACE (result, ',,', 'd');
  result  := REPLACE (result, ',', 'c');
  --
  result  := REPLACE (result, '0c0d0et', '');
  result  := REPLACE (result, '0c0d0em', '');
  result  := REPLACE (result, '0c0d0eM', '');
  --
  result  := REPLACE (result, '0c', '');
  result  := REPLACE (result, '1c', '��� ');
  result  := REPLACE (result, '2c', '������ ');
  result  := REPLACE (result, '3c', '������ ');
  result  := REPLACE (result, '4c', '��������� ');
  result  := REPLACE (result, '5c', '������� ');
  result  := REPLACE (result, '6c', '�������� ');
  result  := REPLACE (result, '7c', '������� ');
  result  := REPLACE (result, '8c', '��������� ');
  result  := REPLACE (result, '9c', '��������� ');
  --
  result  := REPLACE (result, '1d0e', '������ ');
  result  := REPLACE (result, '1d1e', '����������� ');
  result  := REPLACE (result, '1d2e', '���������� ');
  result  := REPLACE (result, '1d3e', '���������� ');
  result  := REPLACE (result, '1d4e', '������������ ');
  result  := REPLACE (result, '1d5e', '���������� ');
  result  := REPLACE (result, '1d6e', '����������� ');
  result  := REPLACE (result, '1d7e', '����������� ');
  result  := REPLACE (result, '1d8e', '������������ ');
  result  := REPLACE (result, '1d9e', '������������ ');
  --
  result  := REPLACE (result, '0d', '');
  result  := REPLACE (result, '2d', '�������� ');
  result  := REPLACE (result, '3d', '�������� ');
  result  := REPLACE (result, '4d', '����� ');
  result  := REPLACE (result, '5d', '��������� ');
  result  := REPLACE (result, '6d', '���������� ');
  result  := REPLACE (result, '7d', '��������� ');
  result  := REPLACE (result, '8d', '����������� ');
  result  := REPLACE (result, '9d', '��������� ');
  --
  result  := REPLACE (result, '0e', '');
  result  := REPLACE (result, '5e', '���� ');
  result  := REPLACE (result, '6e', '����� ');
  result  := REPLACE (result, '7e', '���� ');
  result  := REPLACE (result, '8e', '������ ');
  result  := REPLACE (result, '9e', '������ ');
  --
  result  := REPLACE (result, '1e.', '���� ');
  result  := REPLACE (result, '2e.', '��� ');
  result  := REPLACE (result, '3e.', '��� ');
  result  := REPLACE (result, '4e.', '������ ');
  result  := REPLACE (result, '1et', '���� ������ ');
  result  := REPLACE (result, '2et', '��� ������ ');
  result  := REPLACE (result, '3et', '��� ������ ');
  result  := REPLACE (result, '4et', '������ ������ ');
  result  := REPLACE (result, '1em', '���� ������� ');
  result  := REPLACE (result, '2em', '��� �������� ');
  result  := REPLACE (result, '3em', '��� �������� ');
  result  := REPLACE (result, '4em', '������ �������� ');
  result  := REPLACE (result, '1eM', '���� ������� ');
  result  := REPLACE (result, '2eM', '��� �������� ');
  result  := REPLACE (result, '3eM', '��� �������� ');
  result  := REPLACE (result, '4eM', '������ �������� ');
  --
  result  := REPLACE (result, '11k', '11');
  result  := REPLACE (result, '12k', '12');
  result  := REPLACE (result, '13k', '13');
  result  := REPLACE (result, '14k', '14');
  result  := REPLACE (result, '1k', '1');
  result  := REPLACE (result, '2k', '2');
  result  := REPLACE (result, '3k', '3');
  result  := REPLACE (result, '4k', '4');
  --
  IF NOT (SUBSTR (result, 1, 1) = '.') THEN
    result  := REPLACE (result, '.', ' ');
  ELSE
    result  := REPLACE (result, '.', '���� ');
  END IF;

  result  := REPLACE (result, '00', '');

  result  := REPLACE (result, 't', '����� ');
  result  := REPLACE (result, 'm', '��������� ');
  result  := REPLACE (result, 'M', '��������� ');
  result  := REPLACE (result, 'k', ' ');
  --
  RETURN (result);
END get_countstr;
/

SHOW ERRORS;


