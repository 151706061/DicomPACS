ALTER TABLE MED.TMEDIC 
 ADD (
  FL_SELECT NUMBER (1) DEFAULT 0
 )
/
COMMENT ON COLUMN MED.TMEDIC.FL_SELECT IS '1 - ������, 0 - ���. ��������� � ���� ���� �� ��������!!'
/
