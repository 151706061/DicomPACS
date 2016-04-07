ALTER TABLE ASU.TRECIPE_DLO_EXP_POST
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TRECIPE_DLO_EXP_POST CASCADE CONSTRAINTS
/

--
-- TRECIPE_DLO_EXP_POST  (Table) 
--
CREATE TABLE ASU.TRECIPE_DLO_EXP_POST
(
  NOMK_LS    NUMBER,
  C_LSFO     NUMBER,
  DATE_B     DATE,
  DATE_E     DATE,
  NAME       VARCHAR2(250 BYTE),
  NAME_L     VARCHAR2(250 BYTE),
  PRODUCER   VARCHAR2(200 BYTE),
  COUNTRY    VARCHAR2(250 BYTE),
  NDS_PR     NUMBER(18,8),
  NSP_PR     NUMBER(18,8),
  PSIHI      NUMBER,
  NARKOTA    NUMBER,
  PKU        NUMBER,
  SPEC       NUMBER,
  P_VK       NUMBER,
  UPAK       VARCHAR2(23 BYTE),
  KRATN      NUMBER,
  SPR_TYPE   VARCHAR2(50 BYTE),
  DOZ_ME     NUMBER(18,8),
  CODEPOST   NUMBER,
  ANALG_GRP  NUMBER,
  ANALG_FAS  NUMBER,
  ANALG_DOZ  NUMBER,
  PRIZ_DUBL  NUMBER                             DEFAULT 0,
  PRIZ_BP    NUMBER,
  MSG_TEXT   VARCHAR2(100 BYTE),
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
NOLOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING
/

COMMENT ON TABLE ASU.TRECIPE_DLO_EXP_POST IS '���.���������� ������������� ����������(SPPOST)'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_POST.NOMK_LS IS '�������������� ��� �������������� ��������'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_POST.C_LSFO IS '��� �������������� ���������'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_POST.DATE_B IS '���� ������ ��������'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_POST.DATE_E IS '���� ��������� ��������'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_POST.NAME IS '������������ ��'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_POST.NAME_L IS '������������ �� �� ������'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_POST.NDS_PR IS '������� ���'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_POST.NSP_PR IS '������� ���'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_POST.PSIHI IS '������� ����������������� ������������� �������'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_POST.NARKOTA IS '������� ������������� ������������� ������� � ����'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_POST.PKU IS '������� ������������� �������, ���������� ���������-��������������� �����'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_POST.SPEC IS '������ �� ����������: ��������� (1), ���������� ������� (3), ����������� (5), ������� ���� (6), ������������ (7), ������������ ������ (8), �������������� ������� (9)'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_POST.P_VK IS '������� ������� �� ������� ��������� ��������'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_POST.UPAK IS '���������� �������� � ��������� ��������'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_POST.KRATN IS '��������� ������� ��������� ��������'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_POST.SPR_TYPE IS '����� ������������ �������'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_POST.DOZ_ME IS '��������� ������� ��������� ��������'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_POST.CODEPOST IS '��� ����������'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_POST.ANALG_GRP IS ' ������ ��������'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_POST.ANALG_FAS IS '������� ��������'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_POST.ANALG_DOZ IS '��������� ��������'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_POST.PRIZ_DUBL IS '������� ������������� ��� ��������� ������'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_POST.PRIZ_BP IS '������� ��������� �������'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_POST.MSG_TEXT IS '�����������'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_POST.C_FINL IS '�������� ��������������'
/


--
-- TRECIPE_DLO_EXP_POST_PK  (Index) 
--
--  Dependencies: 
--   TRECIPE_DLO_EXP_POST (Table)
--
CREATE UNIQUE INDEX ASU.TRECIPE_DLO_EXP_POST_PK ON ASU.TRECIPE_DLO_EXP_POST
(C_LSFO, C_FINL)
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


-- 
-- Non Foreign Key Constraints for Table TRECIPE_DLO_EXP_POST 
-- 
ALTER TABLE ASU.TRECIPE_DLO_EXP_POST ADD (
  CONSTRAINT TRECIPE_DLO_EXP_POST_PK
 PRIMARY KEY
 (C_LSFO, C_FINL)
    USING INDEX 
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
               ))
/

