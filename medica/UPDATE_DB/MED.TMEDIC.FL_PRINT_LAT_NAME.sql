ALTER TABLE MED.TMEDIC 
 ADD (
  FL_PRINT_LAT_NAME NUMBER (1) DEFAULT 0
 )
/
COMMENT ON COLUMN MED.TMEDIC.FL_PRINT_LAT_NAME IS '������ ��������� �������� � ������� (0 - �������, 1 - ���������)'
/
