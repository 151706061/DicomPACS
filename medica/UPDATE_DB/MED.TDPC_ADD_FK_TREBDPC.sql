ALTER TABLE MED.TDPC 
 ADD (
  FK_TREBDPC NUMBER DEFAULT -1
 )
/
COMMENT ON COLUMN MED.TDPC.FK_TREBDPC IS 'ID �� ������� MED.TREB_DPC - ������ �����������-������ (������ ��� ������� �� ����������)'
/
