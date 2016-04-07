DROP TABLE ASU.TRECIPE_DLO_EXP CASCADE CONSTRAINTS
/

--
-- TRECIPE_DLO_EXP  (Table) 
--
CREATE TABLE ASU.TRECIPE_DLO_EXP
(
  FK_ID         NUMBER                          NOT NULL,
  MCOD          NUMBER,
  OGRN          NUMBER,
  PCOD          VARCHAR2(30 BYTE),
  RSERIES       VARCHAR2(10 BYTE),
  RNUMBER       VARCHAR2(16 BYTE),
  RDATE         DATE,
  SNILS         VARCHAR2(14 BYTE),
  DATEBIRTH     DATE,
  IDSEX         VARCHAR2(1 BYTE),
  OKATO         NUMBER(5),
  CODECATEG     VARCHAR2(5 BYTE),
  ONLS          NUMBER(1),
  FINSOURCE     NUMBER,
  PERCENT       NUMBER,
  MKBDIAG       VARCHAR2(7 BYTE),
  MNNTRADE      VARCHAR2(13 BYTE),
  MNNINTEG      VARCHAR2(13 BYTE),
  DOSAGEFORM    VARCHAR2(4 BYTE),
  DOSAGE        VARCHAR2(200 BYTE),
  QTY           NUMBER,
  VALIDITY      NUMBER,
  GLOBAL_ID     VARCHAR2(30 BYTE),
  PSERIES       VARCHAR2(10 BYTE),
  PNUMBER       VARCHAR2(16 BYTE),
  FK_RECIPE_ID  NUMBER,
  FK_LGOT_ID    NUMBER,
  FK_SP_TOV     NUMBER,
  FL_EXPORTED   NUMBER                          DEFAULT 0,
  FD_EXPORT     DATE,
  CATEGORYTYPE  NUMBER
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

COMMENT ON TABLE ASU.TRECIPE_DLO_EXP IS '������� ��� ����� ���������� �� ��� ��� �������� � dbf (����������� � ������������ �������). Author:Voronov'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP.MCOD IS '��� ������������ ����������. ���������� LPU.dbf (��������� �����). 10 ����.'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP.OGRN IS '���� ������������ ����������. 15 ����.'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP.PCOD IS '����������������� ��� �����. � ������������ � ��������� ������, ������� ����� �� ������� �������� ��������'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP.RSERIES IS '����� �������. 4 �����.'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP.RNUMBER IS '����� �������. 16 ����.'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP.RDATE IS '���� ������� �������'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP.SNILS IS '����� ����������'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP.DATEBIRTH IS '���� ��������'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP.IDSEX IS '���. ������ ����� � ��� � � ������� ��������'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP.OKATO IS '��� ���������� ���������� ����������� ����������  (�� �����)'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP.CODECATEG IS '��� ��������� ����������. ���������� fed_k.dbf'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP.ONLS IS '��������� ���. 1 � 7 ���������, 0 - ���� (������ ���.)'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP.FINSOURCE IS '�������� ��������������. 1 � �����������, 2 � ������� ��, 3 � ������������� ������'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP.PERCENT IS '�������  ������ �������. 3 �����'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP.MKBDIAG IS '������� �����������, �� �������� ������� ������. ���-10.'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP.MNNTRADE IS '��� �������� ������������ ����������� �������������� �������� (��). ���������� Sp_TRN.dbf'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP.MNNINTEG IS '��� ������������� ��������������� ������������ ����������� �������������� �������� (��). ���������� Sp_MNN.dbf'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP.DOSAGEFORM IS '��� ������������� ����� ��. ���������� Sp_LF.dbf'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP.DOSAGE IS '��������� ��'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP.QTY IS '���������� ���������� ������ ������������� ����� ��;'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP.VALIDITY IS '���� �������� ������� (14 ���� ��� 1 �����). 1- �����,2 - 14 ����; (������ ���.)'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP.GLOBAL_ID IS '�������������� ����. ���������� ��� ��������, ������������� ����� (������ ���.)'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP.PSERIES IS '�������������� ����. ����� ���������� ������ (������ ���.)'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP.PNUMBER IS '����� ���������� ������. 16 ����. (������ ���.)'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP.FK_RECIPE_ID IS 'ASU.TRECIPE.FK_ID - ������ �� ������, �� �������� �������� ������������'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP.FK_LGOT_ID IS 'asu.trecipe_dlo_exp_lgot.fk_id - ������ �� ������ - ��������� ��������� ���� ������������ � ����������� ������ ���������'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP.FK_SP_TOV IS '������ �� ���������� (SP_TOV.DBF)'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP.FL_EXPORTED IS '������ ���� �������������� (1 - ��, 0 - ���)'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP.FD_EXPORT IS '���� ��������'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP.CATEGORYTYPE IS '��� ��������� ���������� (1-�����������, 2-������������, 3-7 ���������, 4-��������)'
/


--
-- TRECIPE_DLO_EXP_FK_ID  (Index) 
--
--  Dependencies: 
--   TRECIPE_DLO_EXP (Table)
--
CREATE UNIQUE INDEX ASU.TRECIPE_DLO_EXP_FK_ID ON ASU.TRECIPE_DLO_EXP
(FK_ID)
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
-- TRECIPE_DLO_EXP_FK_RECIPE  (Index) 
--
--  Dependencies: 
--   TRECIPE_DLO_EXP (Table)
--
CREATE INDEX ASU.TRECIPE_DLO_EXP_FK_RECIPE ON ASU.TRECIPE_DLO_EXP
(FK_RECIPE_ID)
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
-- TRECIPE_DLO_EXP_FL_EXPORTED  (Index) 
--
--  Dependencies: 
--   TRECIPE_DLO_EXP (Table)
--
CREATE INDEX ASU.TRECIPE_DLO_EXP_FL_EXPORTED ON ASU.TRECIPE_DLO_EXP
(FL_EXPORTED)
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
-- TRECIPE_DLO_EXP_INS  (Trigger) 
--
--  Dependencies: 
--   TRECIPE_DLO_EXP (Table)
--
CREATE OR REPLACE TRIGGER ASU."TRECIPE_DLO_EXP_INS" 
 BEFORE
  INSERT
 ON asu.trecipe_dlo_exp
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
  if :new.fk_id is null then
    select ASU.SEQ_TRECIPE_DLO_EXP.NEXTVAL into :new.fk_id from dual;
  end if;
end;
/
SHOW ERRORS;


