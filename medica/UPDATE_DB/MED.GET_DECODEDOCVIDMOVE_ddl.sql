-- Start of DDL Script for Function MED.GET_DECODEDOCVIDMOVE
-- Generated 9-���-2011 11:58:59 from MED@H100609

CREATE OR REPLACE 
FUNCTION     med.get_decodedocvidmove ( FP_VIDMOVE in NUMBER)
  RETURN  VARCHAR2 IS
BEGIN
  if FP_VIDMOVE = 1 THEN RETURN '���������';
  elsif FP_VIDMOVE = 2 THEN RETURN '������ �� ����������';
  elsif FP_VIDMOVE = 3 THEN RETURN '�������� � ���������';
  elsif FP_VIDMOVE = 4 THEN RETURN '� ������';
  elsif FP_VIDMOVE = 5 THEN RETURN '�� �������';
--  elsif FP_VIDMOVE = 5 THEN RETURN '����������';
  elsif FP_VIDMOVE = 6 THEN RETURN '������� � ������';
  elsif FP_VIDMOVE = 7 THEN RETURN '�������� � ���';
  elsif FP_VIDMOVE = 8 THEN RETURN '��� �������� ���';
  elsif FP_VIDMOVE = 9 THEN RETURN '��� ����� ��������';
  elsif FP_VIDMOVE = 10 THEN RETURN '������ �� ���';
  elsif FP_VIDMOVE = 11 THEN RETURN '������� ����������';
  elsif FP_VIDMOVE = 12 THEN RETURN '������ �� ���. �������';
  elsif FP_VIDMOVE = 13 THEN RETURN '������ �� ���. ����������';
  elsif FP_VIDMOVE = 14 THEN RETURN '��� �������� �� ������� �����������';
  else RETURN '';
  end if;
END;
/



-- End of DDL Script for Function MED.GET_DECODEDOCVIDMOVE

