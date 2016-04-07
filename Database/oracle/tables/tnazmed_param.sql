DROP TABLE ASU.TNAZMED_PARAM CASCADE CONSTRAINTS
/

--
-- TNAZMED_PARAM  (Table) 
--
CREATE TABLE ASU.TNAZMED_PARAM
(
  FK_TNAZMEDID  NUMBER(10)                      NOT NULL,
  FL_LGOT       NUMBER(1)                       DEFAULT 0,
  FK_DURATION   NUMBER(10),
  FK_PERCENT    NUMBER(10),
  FK_PAYTYPE    NUMBER(10),
  FK_TYPE       NUMBER(10),
  FC_VRACHFIO   VARCHAR2(120 BYTE),
  FK_TSOTRID    NUMBER                          DEFAULT -1,
  FK_SMDIAGID   NUMBER(15)                      DEFAULT -1                    NOT NULL
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

COMMENT ON TABLE ASU.TNAZMED_PARAM IS '������� �������� ��������� ���������������� ���������� (TNAZMED), ������� �������� ����������� �������: ��� �������, ���� ��������, ����. ������ � �.�.'
/

COMMENT ON COLUMN ASU.TNAZMED_PARAM.FK_TNAZMEDID IS '������ �� TNAZMED.FK_ID'
/

COMMENT ON COLUMN ASU.TNAZMED_PARAM.FL_LGOT IS '0 - ������� (107�); 1 - ����� (148-1/�-06(�) (��������-�����������); 2 - 148-1/�-88 (��������-������������)'
/

COMMENT ON COLUMN ASU.TNAZMED_PARAM.FK_DURATION IS '��� ����� �������� (��. �. TRecipeDuration)'
/

COMMENT ON COLUMN ASU.TNAZMED_PARAM.FK_PERCENT IS '��� �������� ������ (��. �. TRecipePercent)'
/

COMMENT ON COLUMN ASU.TNAZMED_PARAM.FK_PAYTYPE IS '��� �������� �������������� (��. �. TRecipePaytype)'
/

COMMENT ON COLUMN ASU.TNAZMED_PARAM.FK_TYPE IS '��� ���� ������� (��. �. TRecipeType)'
/

COMMENT ON COLUMN ASU.TNAZMED_PARAM.FC_VRACHFIO IS '��� ����� ������������ ��������'
/

COMMENT ON COLUMN ASU.TNAZMED_PARAM.FK_TSOTRID IS '������ �� ������ �����, ������������ ��������'
/

COMMENT ON COLUMN ASU.TNAZMED_PARAM.FK_SMDIAGID IS 'ID �������� �� TSMID. (������������ ��� ��������� MKB10 GET_MKB10_FROM_TSMID(FK_SMDIAGID))  ��� ���� FK_MKB_10'
/


