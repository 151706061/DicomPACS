-- Start of DDL Script for Table MED.TCROSS_TABLE_CHECK
-- Generated 18.02.2010 14:21:07 from MED@H091003

CREATE TABLE med.tcross_table_check
    (fk_cross_params_id             NUMBER,
    fn_value                       NUMBER,
    fk_key1                        NUMBER,
    fk_key2                        NUMBER)
/





-- Indexes for MED.TCROSS_TABLE_CHECK

CREATE UNIQUE INDEX med.tcross_tc_uniq ON med.tcross_table_check
  (
    fk_cross_params_id              ASC,
    fk_key1                         ASC,
    fk_key2                         ASC
  )
/



-- Comments for MED.TCROSS_TABLE_CHECK

COMMENT ON COLUMN med.tcross_table_check.fk_cross_params_id IS '��������������� ������������ �������'
/
COMMENT ON COLUMN med.tcross_table_check.fk_key1 IS '���� ��� ������ �������'
/
COMMENT ON COLUMN med.tcross_table_check.fk_key2 IS '���� ��� ������ �������'
/
COMMENT ON COLUMN med.tcross_table_check.fn_value IS '����� ��� ���������������� 2-� ������'
/

-- End of DDL Script for Table MED.TCROSS_TABLE_CHECK

