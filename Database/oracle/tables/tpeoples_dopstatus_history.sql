DROP TABLE ASU.TPEOPLES_DOPSTATUS_HISTORY CASCADE CONSTRAINTS
/

--
-- TPEOPLES_DOPSTATUS_HISTORY  (Table) 
--
--  Dependencies: 
--   TPEOPLES_DOPSTATUS (Table)
--
CREATE TABLE ASU.TPEOPLES_DOPSTATUS_HISTORY
(
  FK_DOPSTATUS     NUMBER(15)                   NOT NULL,
  FK_SOTRID        NUMBER(15),
  FN_TYPE          NUMBER(2)                    NOT NULL,
  FL_STATUS        NUMBER(1),
  FD_DATE          DATE,
  FL_TFOMS_STATUS  NUMBER(1),
  FC_TFOMS_REPLY   VARCHAR2(250 BYTE),
  FL_SOGLASIE      NUMBER(1),
  FD_USERDATE      DATE                         DEFAULT SYSDATE               NOT NULL,
  FK_DOCTOR        NUMBER(15)
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          1M
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOLOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING
/

COMMENT ON TABLE ASU.TPEOPLES_DOPSTATUS_HISTORY IS '������� ������� ����������� ��� ��������� �������� � ����� ����� ������� ������������ � ��������� �������� �� �������� ���. ����������. Created by ������ �.�. - 6/05/2015'
/

COMMENT ON COLUMN ASU.TPEOPLES_DOPSTATUS_HISTORY.FK_DOPSTATUS IS '������ �� TPEOPLES_DOPSTATUS.FK_ID'
/

COMMENT ON COLUMN ASU.TPEOPLES_DOPSTATUS_HISTORY.FK_SOTRID IS '������ �� ID ������������ ���'
/

COMMENT ON COLUMN ASU.TPEOPLES_DOPSTATUS_HISTORY.FN_TYPE IS '��� ��������: 1 - ��������� ������� ������������ ��������; 11 - ���������� �������� �� ������������; 2 - ��������� ������� �������� �� �������� ���. ����������; 22 - ���������� ����� ��������; 3 - ������������ �� XML-����������; 4 - ������������ � ������� ������ ������� �����.'
/

COMMENT ON COLUMN ASU.TPEOPLES_DOPSTATUS_HISTORY.FL_STATUS IS '������ ������������ � ���: 1 - ����������, 0 - �� ���������� (���������)'
/

COMMENT ON COLUMN ASU.TPEOPLES_DOPSTATUS_HISTORY.FD_DATE IS '���� ������������/�����������'
/

COMMENT ON COLUMN ASU.TPEOPLES_DOPSTATUS_HISTORY.FL_TFOMS_STATUS IS '������ ��������� �������� �� ������� �����: 0 - �� �������������, 1 - ������� ����������, -1 - ������� �� ������ �� �������'
/

COMMENT ON COLUMN ASU.TPEOPLES_DOPSTATUS_HISTORY.FC_TFOMS_REPLY IS '����� ���-������� ����� �� ������ � ����� ������� ������������ ��������'
/

COMMENT ON COLUMN ASU.TPEOPLES_DOPSTATUS_HISTORY.FL_SOGLASIE IS '������ �������� �� �������� ���. ����������: 1 - �������� ����; 0 - �������� �� ����'
/

COMMENT ON COLUMN ASU.TPEOPLES_DOPSTATUS_HISTORY.FD_USERDATE IS '���� ���������� �������� ������������� ��� ��� ������� ������������/���������� �������� ��������'
/

COMMENT ON COLUMN ASU.TPEOPLES_DOPSTATUS_HISTORY.FK_DOCTOR IS 'ID ������� (�� LOGIN.TSOTR), � �������� ���������� �������'
/


-- 
-- Foreign Key Constraints for Table TPEOPLES_DOPSTATUS_HISTORY 
-- 
ALTER TABLE ASU.TPEOPLES_DOPSTATUS_HISTORY ADD (
  CONSTRAINT FK_DOPSTATUS_HISTORY 
 FOREIGN KEY (FK_DOPSTATUS) 
 REFERENCES ASU.TPEOPLES_DOPSTATUS (FK_ID)
    ON DELETE CASCADE)
/

