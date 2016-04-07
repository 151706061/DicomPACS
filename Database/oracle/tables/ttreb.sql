DROP TABLE ASU.TTREB CASCADE CONSTRAINTS
/

--
-- TTREB  (Table) 
--
CREATE TABLE ASU.TTREB
(
  FK_ID            NUMBER(9)                    NOT NULL,
  FC_NUM           VARCHAR2(20 BYTE),
  FK_MATOTVSOTRID  NUMBER(9),
  FK_RAZRSOTRID    NUMBER(9),
  FK_POLUCHSOTRID  NUMBER(9),
  FK_VYDALSOTRID   NUMBER(9),
  FC_COMMENT       VARCHAR2(255 BYTE),
  FL_INOUT         NUMBER(1),
  FD_DATA          DATE
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          520K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING
/

COMMENT ON TABLE ASU.TTREB IS '������� ������� � �������� ���������� � ������ �� �����������'
/

COMMENT ON COLUMN ASU.TTREB.FK_ID IS '���'
/

COMMENT ON COLUMN ASU.TTREB.FC_NUM IS '��� ���������� ������ ����������'
/

COMMENT ON COLUMN ASU.TTREB.FK_MATOTVSOTRID IS '��� ��� ���� ����������, ������� ����������� ���������� �� ������ �������� ������'
/

COMMENT ON COLUMN ASU.TTREB.FK_RAZRSOTRID IS '��� ��������� ������� �������� ���������� � ����������'
/

COMMENT ON COLUMN ASU.TTREB.FK_POLUCHSOTRID IS '���� ������ ��� �����������'
/

COMMENT ON COLUMN ASU.TTREB.FK_VYDALSOTRID IS '��� ����� ��� �����������'
/

COMMENT ON COLUMN ASU.TTREB.FC_COMMENT IS '�����������'
/

COMMENT ON COLUMN ASU.TTREB.FL_INOUT IS '��� = 1 ��� ��������� �� ��������� �.�., =0 ���������� ���������������� ����� ��������� �� ������'
/

COMMENT ON COLUMN ASU.TTREB.FD_DATA IS '����'
/


