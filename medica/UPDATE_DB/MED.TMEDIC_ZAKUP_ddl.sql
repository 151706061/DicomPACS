-- Start of DDL Script for Table MED.TMEDIC_ZAKUP
-- Generated 3.10.07 11:00:04 from MED@ASU

CREATE TABLE med.tmedic_zakup
    (fk_medicid                     NUMBER(10,0) NOT NULL,
    fn_needtobuy                   NUMBER(10,0),
    fn_price                       NUMBER(10,0),
    fc_correct                     VARCHAR2(100))
  PCTFREE     10
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  usr
  STORAGE   (
    INITIAL     65536
    MINEXTENTS  1
    MAXEXTENTS  2147483645
  )
/





-- Comments for MED.TMEDIC_ZAKUP

COMMENT ON TABLE med.tmedic_zakup IS '������� �������� ��������� ������ �� ������ ��� ������ ������������. � ��������� ��������� ����� ���� ������, �� ����� ������ ������ ���� - ����������'
/
COMMENT ON COLUMN med.tmedic_zakup.fc_correct IS '���������������� - �������'
/
COMMENT ON COLUMN med.tmedic_zakup.fk_medicid IS '���������� �� ������� TMEDIC'
/
COMMENT ON COLUMN med.tmedic_zakup.fn_needtobuy IS '���������� ���������� ��� ������'
/
COMMENT ON COLUMN med.tmedic_zakup.fn_price IS '����'
/

-- End of DDL Script for Table MED.TMEDIC_ZAKUP

