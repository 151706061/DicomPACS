ALTER TABLE MED.TDPC ADD (FK_REZERV_DOCID NUMBER DEFAULT -1)
/
COMMENT ON COLUMN MED.TDPC.FK_REZERV_DOCID IS 'ID ��������� (�� med.tdocs), �� �������� ���������� ������������  �� �������'
/
