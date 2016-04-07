DROP TABLE ASU.TRECIPE_DLO_EXP_LF CASCADE CONSTRAINTS
/

--
-- TRECIPE_DLO_EXP_LF  (Table) 
--
CREATE TABLE ASU.TRECIPE_DLO_EXP_LF
(
  C_LF       NUMBER,
  NAME_LF    VARCHAR2(87 BYTE),
  NAME_LF_L  VARCHAR2(87 BYTE),
  MSG_TEXT   VARCHAR2(100 BYTE),
  ONAME_LF   VARCHAR2(50 BYTE),
  FNAME_LF   VARCHAR2(100 BYTE),
  PRIZ_DUBL  NUMBER                             DEFAULT 0,
  DATE_E     DATE,
  C_FINL     NUMBER                             DEFAULT 0
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
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING
/

COMMENT ON TABLE ASU.TRECIPE_DLO_EXP_LF IS '������� � �������������� �������. Author:Voronov'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_LF.C_LF IS '��� ������������� �����'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_LF.NAME_LF IS '������� �������� ������������� �����'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_LF.NAME_LF_L IS '������� �������� ������������� ����� �� ������'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_LF.MSG_TEXT IS '�����������'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_LF.ONAME_LF IS '���������� �������� ������ ������������� ����, � ������� ������ ������ �����'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_LF.FNAME_LF IS '������ �������� ������������� �����'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_LF.PRIZ_DUBL IS '������� ������������� ��� ��������� ������'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_LF.DATE_E IS '���� ��������� �������� ������� ���� ������������� ����� '
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_LF.C_FINL IS '�������� ��������������'
/


--
-- TRECIPE_DLO_EXP_LF_KEY  (Index) 
--
--  Dependencies: 
--   TRECIPE_DLO_EXP_LF (Table)
--
CREATE UNIQUE INDEX ASU.TRECIPE_DLO_EXP_LF_KEY ON ASU.TRECIPE_DLO_EXP_LF
(C_LF, C_FINL)
NOLOGGING
TABLESPACE USR
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


