DROP TABLE ASU.TDOZAPOL_SETUP CASCADE CONSTRAINTS
/

--
-- TDOZAPOL_SETUP  (Table) 
--
CREATE TABLE ASU.TDOZAPOL_SETUP
(
  FC_SYNONYM   VARCHAR2(50 BYTE),
  FN_COLOUR    NUMBER,
  FL_REQUIRED  NUMBER(1),
  FL_MSG       NUMBER(1),
  FC_COMMENT   VARCHAR2(100 BYTE)
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
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

COMMENT ON TABLE ASU.TDOZAPOL_SETUP IS '-- ��������� ������ "������������ ����������" -- Created 20080110 by Linnikov'
/

COMMENT ON COLUMN ASU.TDOZAPOL_SETUP.FC_SYNONYM IS '������������ ���� (�������)'
/

COMMENT ON COLUMN ASU.TDOZAPOL_SETUP.FN_COLOUR IS '���� � ������ ������������ (1179647 - ������, 255 - �������, 16776960 - �������)'
/

COMMENT ON COLUMN ASU.TDOZAPOL_SETUP.FL_REQUIRED IS '������������ ��� ���������� ���� (�� ���������, ���� ���� �� ���������)'
/

COMMENT ON COLUMN ASU.TDOZAPOL_SETUP.FL_MSG IS '���������� �������������� '
/

COMMENT ON COLUMN ASU.TDOZAPOL_SETUP.FC_COMMENT IS '�������������� ����������'
/


