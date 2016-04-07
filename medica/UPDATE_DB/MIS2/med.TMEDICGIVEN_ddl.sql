-- Start of DDL Script for Table ASU.TMEDICGIVEN
-- Generated 20-���-2011 11:31:45 from ASU@H100609

CREATE TABLE med.tmedicgiven
    (fk_id                          NUMBER NOT NULL,
    fk_nazmark                     NUMBER,
    fk_nazmedlechid                NUMBER,
    fk_medicgiven                  NUMBER,
    fk_sotrfrom                    NUMBER,
    fk_sotrto                      NUMBER,
    fp_mode                        NUMBER,
    fd_given                       DATE,
    fd_date                        DATE,
    fn_kol                         NUMBER,
    fk_dpcid                       NUMBER,
    fk_nazmedid                    NUMBER
  )
/





-- Indexes for ASU.TMEDICGIVEN

CREATE INDEX med.tmedicgiven_fk_dpcid ON med.tmedicgiven
  (
    fk_dpcid                        ASC
  )
/

CREATE INDEX med.tmedicgiven_nmlech_nmar_medgiv ON med.tmedicgiven
  (
    fk_nazmedlechid                 ASC,
    fk_nazmark                      ASC,
    fk_medicgiven                   ASC
  )
/



-- Triggers for ASU.TMEDICGIVEN
/*
CREATE OR REPLACE TRIGGER med.tmedicgiven_before_insert
 BEFORE
  INSERT
 ON med.tmedicgiven
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
  -- LOCAL VARIABLES HERE
BEGIN
  IF :NEW.FK_ID IS NULL THEN
      SELECT SEQ_TMEDICGIVEN.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
  END IF;
  :NEW.FD_DATE := SYSDATE;
END;
/
*/

-- Comments for ASU.TMEDICGIVEN

COMMENT ON TABLE med.tmedicgiven IS '������� ������ ����������, �������� �������� ��������� ������� ����������.
FP_MODE - �����, � ������� ����������� �������� ������ � �������. ������������  select fc_value from asu.tsmini sm where sm.fc_section = ''medica.exe'' and fc_key = ''MEDSES_GIVE_MODE''. ���� �� ������, �� ����� = 0
FP_MODE = 0 - �� �������, �� ������� ��������� �� ������ ������ �����������
FP_MODE = 1 - ������� ��������� ��� ������ �������� ��������� ������ ������������. ����� �������� ��������� ������ ������ FK_NAZMARK
FP_MODE = 2 - ������� ��������� ��� ������ �������� ��������� �� ������ ������������. �������� ��������� ������ ������������ ��� ������ �������� '
/
COMMENT ON COLUMN med.tmedicgiven.fd_date IS '���� �������� ������'
/
COMMENT ON COLUMN med.tmedicgiven.fd_given IS '���� ������'
/
COMMENT ON COLUMN med.tmedicgiven.fk_dpcid IS 'MED.TDPC.DPCID ����������� ������ ������� ����������'
/
COMMENT ON COLUMN med.tmedicgiven.fk_id IS 'SEQUENCE=[SEQ_TMEDICGIVEN]'
/
COMMENT ON COLUMN med.tmedicgiven.fk_medicgiven IS 'MED.TMEDIC.FK_ID - ������ �� ��������, ������� ������������� ������'
/
COMMENT ON COLUMN med.tmedicgiven.fk_nazmark IS 'ASU.TNAZMARK.FK_ID - ������ �� ������ � ������ ��������. ���� mode = 1, ����������� ������ �������� ������� ��� ������'
/
COMMENT ON COLUMN med.tmedicgiven.fk_nazmedid IS 'ASU.TNAZMED.FK_ID  - ������ �� ����������'
/
COMMENT ON COLUMN med.tmedicgiven.fk_nazmedlechid IS 'ASU.TNAZMEDLECH.FK_ID - ������ �� ������ ���������� � ���������'
/
COMMENT ON COLUMN med.tmedicgiven.fk_sotrfrom IS 'TSOTR.FK_ID - ��� ����� (������ ������� ���.������)'
/
COMMENT ON COLUMN med.tmedicgiven.fk_sotrto IS 'TSOTR.FK_ID - ���� ����� (������ �������� ���������)'
/
COMMENT ON COLUMN med.tmedicgiven.fn_kol IS '���-�� ��������� ���������'
/
COMMENT ON COLUMN med.tmedicgiven.fp_mode IS '�����, � ������� ����������� �������� ������ � �������. ������������  select fc_value from asu.tsmini sm where sm.fc_section = ''medica.exe'' and fc_key = ''MEDSES_GIVE_MODE'' �� ������, �� ����� = 0'
/

-- End of DDL Script for Table ASU.TMEDICGIVEN

