ALTER TABLE MED.TKART 
 ADD (
  FN_PRICE NUMBER (36, 8),
  FN_KOL NUMBER (38, 4)
 );
COMMENT ON COLUMN MED.TKART.FN_PRICE IS '���� �� ������� ������';
COMMENT ON COLUMN MED.TKART.FN_KOL IS '��������� ���������� ������ ��������� � ������';