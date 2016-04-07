CREATE TABLE MED.TLINK_IMPNAKL
  (
  FK_ID NUMBER,
  FN_OUR_TABLE_NUM NUMBER,
  FK_OUR_KEY_FIELD_VALUE NUMBER,
  FK_POST_ID NUMBER,
  FN_THEIR_TABLE_NUM NUMBER,
  FK_THEIR_KEY_FIELD_VALUE NUMBER,
  FC_THEIR_VALUE VARCHAR2 (200)
 )
/
COMMENT ON TABLE MED.TLINK_IMPNAKL IS 
'������� ��� ���������� ����� ������ � ������ �����������. ������� �.�. 30.04.2009'
/
COMMENT ON COLUMN MED.TLINK_IMPNAKL.FN_OUR_TABLE_NUM IS '�������� ����� ������, ������� ����� ����� ���������. 1 - MED.TPOSTAV, 2- MED.TMEDIC, 3 - MED.TEI'
/
COMMENT ON COLUMN MED.TLINK_IMPNAKL.FK_OUR_KEY_FIELD_VALUE IS '�������� ��������� ���� ����� �������'
/
COMMENT ON COLUMN MED.TLINK_IMPNAKL.FK_POST_ID IS 'ID ���������� (MED.TPOSTAV.postavid), �� �������� �������� ����� ������ ���������'
/
COMMENT ON COLUMN MED.TLINK_IMPNAKL.FN_THEIR_TABLE_NUM IS '�������� ����� ������� ���������� (���������� - ����������� - 1, ������� ��������� - 2 � �.�.)'
/
COMMENT ON COLUMN MED.TLINK_IMPNAKL.FK_THEIR_KEY_FIELD_VALUE IS '�������� ��������� ���� ��� �������� (���� ���������). ��������������.'
/
COMMENT ON COLUMN MED.TLINK_IMPNAKL.FC_THEIR_VALUE IS '��������, ������� ��������� ��������� � ����������� ���������.'
/
-- Indexes for MED.TLINK_IMPNAKL

CREATE INDEX med.tlink_search_their_value ON med.tlink_impnakl
  (
    fn_our_table_num                ASC,
    fc_their_value                  ASC,
    fk_post_id                      ASC
  )
/

