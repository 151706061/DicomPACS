ALTER TABLE ASU.TUSL_DBF_LOAD
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TUSL_DBF_LOAD CASCADE CONSTRAINTS
/

--
-- TUSL_DBF_LOAD  (Table) 
--
CREATE TABLE ASU.TUSL_DBF_LOAD
(
  OWN            NUMBER(1),
  TYPE_FIN       NUMBER(1),
  GLOBAL_ID      NUMBER(19),
  YEAR           NUMBER(4),
  MONTH          NUMBER(2),
  LPU_ID         NUMBER(10),
  LPU_NAPR       NUMBER(10),
  TFOMS_ID       NUMBER(10),
  PERSON_IDL     NUMBER(19),
  ID_ILL         NUMBER(19),
  ID_ILL_U       NUMBER(19),
  POLICYSER      VARCHAR2(10 BYTE),
  POLICYNUM      VARCHAR2(20 BYTE),
  TYPE_USL       NUMBER(1),
  DATE_B_U       DATE,
  DATE_E_U       DATE,
  V_MU           NUMBER(3),
  PR_MP          NUMBER(3),
  KOD_MU         NUMBER(1),
  KOL_MU         NUMBER(5,2),
  TYPE_EO        NUMBER(2),
  KOD_EO         VARCHAR2(20 BYTE),
  KOL_EO         NUMBER(5),
  COST_EO        NUMBER(10,2),
  SUM_EO         NUMBER(10,2),
  N_QU           NUMBER(1),
  N_TOOTH        NUMBER(1),
  P_TOOTH        VARCHAR2(6 BYTE),
  N_QU2          NUMBER(1),
  N_TOOTH2       NUMBER(1),
  P_TOOTH2       VARCHAR2(6 BYTE),
  N_QU3          NUMBER(1),
  N_TOOTH3       NUMBER(1),
  P_TOOTH3       VARCHAR2(6 BYTE),
  N_QU4          NUMBER(1),
  N_TOOTH4       NUMBER(1),
  P_TOOTH4       VARCHAR2(6 BYTE),
  N_QU5          NUMBER(1),
  N_TOOTH5       NUMBER(1),
  P_TOOTH5       VARCHAR2(6 BYTE),
  N_QU6          NUMBER(1),
  N_TOOTH6       NUMBER(1),
  P_TOOTH6       VARCHAR2(6 BYTE),
  N_QU7          NUMBER(1),
  N_TOOTH7       NUMBER(1),
  P_TOOTH7       VARCHAR2(6 BYTE),
  N_QU8          NUMBER(1),
  N_TOOTH8       NUMBER(1),
  P_TOOTH8       VARCHAR2(6 BYTE),
  DOC_CD_U       VARCHAR2(20 BYTE),
  PRVSM_U        NUMBER(4),
  P_ID_ILL       NUMBER(2),
  LPU_INTR       NUMBER(10),
  COST_MODER     NUMBER(10,2),
  SUM_MODERN     NUMBER(10,2),
  Z$NAZ_ID       NUMBER,
  Z$FL_POLY      NUMBER(1),
  FK_ID          NUMBER(15)                     NOT NULL,
  FK_SLUCHID     NUMBER(15),
  DATE_B_U_TIME  DATE,
  DATE_E_U_TIME  DATE,
  FK_PACID       NUMBER(15)
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          16K
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

COMMENT ON TABLE ASU.TUSL_DBF_LOAD IS '����������� �� USA ����� ������ (������� ��� ������� ������ �������� ������ �����) Author:Efimov'
/

COMMENT ON COLUMN ASU.TUSL_DBF_LOAD.OWN IS '������� ����� ����������� '
/

COMMENT ON COLUMN ASU.TUSL_DBF_LOAD.GLOBAL_ID IS '���������� ����� ��������������� �� ���������� ���� '
/

COMMENT ON COLUMN ASU.TUSL_DBF_LOAD.YEAR IS '�������� ������'
/

COMMENT ON COLUMN ASU.TUSL_DBF_LOAD.MONTH IS '�������� ������'
/

COMMENT ON COLUMN ASU.TUSL_DBF_LOAD.LPU_ID IS '���������� LPU'
/

COMMENT ON COLUMN ASU.TUSL_DBF_LOAD.TFOMS_ID IS '��� �������������� �� ���������� ����-���� =86, ��� �������������� �� ���� ����������� ��, �������� ����������� TFOMS'
/

COMMENT ON COLUMN ASU.TUSL_DBF_LOAD.PERSON_IDL IS '������������ � ���, ���������� � ������ ���'
/

COMMENT ON COLUMN ASU.TUSL_DBF_LOAD.ID_ILL IS '���������� ����� ��� ������� ������ ����������� � ������ ���������� ���'
/

COMMENT ON COLUMN ASU.TUSL_DBF_LOAD.POLICYSER IS '����� ������'
/

COMMENT ON COLUMN ASU.TUSL_DBF_LOAD.POLICYNUM IS '����� ������'
/

COMMENT ON COLUMN ASU.TUSL_DBF_LOAD.TYPE_USL IS '1-��������� (�������� ��������������)
  2-�����������
  3-������� ���������
  4 � ��������� (���������� ��������������)
'
/

COMMENT ON COLUMN ASU.TUSL_DBF_LOAD.DATE_B_U IS '���� ������ ���������� ������'
/

COMMENT ON COLUMN ASU.TUSL_DBF_LOAD.DATE_E_U IS '���� ����� ���������� ������'
/

COMMENT ON COLUMN ASU.TUSL_DBF_LOAD.V_MU IS '��� ����������� ������ (���������� PMSP)'
/

COMMENT ON COLUMN ASU.TUSL_DBF_LOAD.KOD_MU IS '��� ������� ����� ����������� ������ (���������� EU_MP)'
/

COMMENT ON COLUMN ASU.TUSL_DBF_LOAD.KOL_MU IS '���������� ������ ����� ����������� ������'
/

COMMENT ON COLUMN ASU.TUSL_DBF_LOAD.TYPE_EO IS '��� ������� ������ (���������� EDOP)'
/

COMMENT ON COLUMN ASU.TUSL_DBF_LOAD.KOD_EO IS '��� ������� ������'
/

COMMENT ON COLUMN ASU.TUSL_DBF_LOAD.KOL_EO IS '���������� �� ���� (KOD_ EO)'
/

COMMENT ON COLUMN ASU.TUSL_DBF_LOAD.COST_EO IS '���� ������� ������'
/

COMMENT ON COLUMN ASU.TUSL_DBF_LOAD.SUM_EO IS '�������������  ��� ����� ������'
/

COMMENT ON COLUMN ASU.TUSL_DBF_LOAD.N_QU IS '����� �������� (���������) ��������������� ������� ������� � ������ ������� (ZF)'
/

COMMENT ON COLUMN ASU.TUSL_DBF_LOAD.N_TOOTH IS '����� ���� (ZF)'
/

COMMENT ON COLUMN ASU.TUSL_DBF_LOAD.P_TOOTH IS '����������� ���� (PZ)'
/

COMMENT ON COLUMN ASU.TUSL_DBF_LOAD.N_QU2 IS '����� �������� (���������) ��������������� ������� ������� � ������ ������� (ZF)'
/

COMMENT ON COLUMN ASU.TUSL_DBF_LOAD.N_TOOTH2 IS '����� ���� (ZF)'
/

COMMENT ON COLUMN ASU.TUSL_DBF_LOAD.P_TOOTH2 IS '����������� ���� (PZ)'
/

COMMENT ON COLUMN ASU.TUSL_DBF_LOAD.N_QU3 IS '����� �������� (���������) ��������������� ������� ������� � ������ ������� (ZF)'
/

COMMENT ON COLUMN ASU.TUSL_DBF_LOAD.N_TOOTH3 IS '����� ���� (ZF)'
/

COMMENT ON COLUMN ASU.TUSL_DBF_LOAD.P_TOOTH3 IS '����������� ���� (PZ)'
/

COMMENT ON COLUMN ASU.TUSL_DBF_LOAD.N_QU4 IS '����� �������� (���������) ��������������� ������� ������� � ������ ������� (ZF)'
/

COMMENT ON COLUMN ASU.TUSL_DBF_LOAD.N_TOOTH4 IS '����� ���� (ZF)'
/

COMMENT ON COLUMN ASU.TUSL_DBF_LOAD.P_TOOTH4 IS '����������� ���� (PZ)'
/

COMMENT ON COLUMN ASU.TUSL_DBF_LOAD.N_QU5 IS '����� �������� (���������) ��������������� ������� ������� � ������ ������� (ZF)'
/

COMMENT ON COLUMN ASU.TUSL_DBF_LOAD.N_TOOTH5 IS '����� ���� (ZF)'
/

COMMENT ON COLUMN ASU.TUSL_DBF_LOAD.P_TOOTH5 IS '����������� ���� (PZ)'
/

COMMENT ON COLUMN ASU.TUSL_DBF_LOAD.N_QU6 IS '����� �������� (���������) ��������������� ������� ������� � ������ ������� (ZF)'
/

COMMENT ON COLUMN ASU.TUSL_DBF_LOAD.N_TOOTH6 IS '����� ���� (ZF)'
/

COMMENT ON COLUMN ASU.TUSL_DBF_LOAD.P_TOOTH6 IS '����������� ���� (PZ)'
/

COMMENT ON COLUMN ASU.TUSL_DBF_LOAD.N_QU7 IS '����� �������� (���������) ��������������� ������� ������� � ������ ������� (ZF)'
/

COMMENT ON COLUMN ASU.TUSL_DBF_LOAD.N_TOOTH7 IS '����� ���� (ZF)'
/

COMMENT ON COLUMN ASU.TUSL_DBF_LOAD.P_TOOTH7 IS '����������� ���� (PZ)'
/

COMMENT ON COLUMN ASU.TUSL_DBF_LOAD.N_QU8 IS '����� �������� (���������) ��������������� ������� ������� � ������ ������� (ZF)'
/

COMMENT ON COLUMN ASU.TUSL_DBF_LOAD.N_TOOTH8 IS '����� ���� (ZF)'
/

COMMENT ON COLUMN ASU.TUSL_DBF_LOAD.P_TOOTH8 IS '����������� ���� (PZ)'
/

COMMENT ON COLUMN ASU.TUSL_DBF_LOAD.Z$NAZ_ID IS '��������� ����'
/

COMMENT ON COLUMN ASU.TUSL_DBF_LOAD.Z$FL_POLY IS '��������� ���� 1 - ����������� 0 - ���������'
/

COMMENT ON COLUMN ASU.TUSL_DBF_LOAD.FK_ID IS 'SEQ_TUSL_DBF_LOAD'
/

COMMENT ON COLUMN ASU.TUSL_DBF_LOAD.FK_SLUCHID IS 'TSLUCH_DBF.FK_ID'
/


--
-- I_TUSL_DBF_LOAD_ID_ILL  (Index) 
--
--  Dependencies: 
--   TUSL_DBF_LOAD (Table)
--
CREATE INDEX ASU.I_TUSL_DBF_LOAD_ID_ILL ON ASU.TUSL_DBF_LOAD
(ID_ILL)
NOLOGGING
TABLESPACE USR
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- I_TUSL_DBF_LOAD_SLUCHID  (Index) 
--
--  Dependencies: 
--   TUSL_DBF_LOAD (Table)
--
CREATE INDEX ASU.I_TUSL_DBF_LOAD_SLUCHID ON ASU.TUSL_DBF_LOAD
(FK_SLUCHID)
NOLOGGING
TABLESPACE USR
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- K_TUSL_DBF_LOAD_ID  (Index) 
--
--  Dependencies: 
--   TUSL_DBF_LOAD (Table)
--
CREATE UNIQUE INDEX ASU.K_TUSL_DBF_LOAD_ID ON ASU.TUSL_DBF_LOAD
(FK_ID)
NOLOGGING
TABLESPACE USR
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TUSL_DBF_LOAD_INSERT  (Trigger) 
--
--  Dependencies: 
--   TUSL_DBF_LOAD (Table)
--
CREATE OR REPLACE TRIGGER ASU."TUSL_DBF_LOAD_INSERT" 
 BEFORE
  INSERT
 ON ASU.TUSL_DBF_LOAD REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
Begin
  IF :new.fk_id IS NULL THEN
    SELECT ASU.SEQ_TUSL_DBF.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
  end if;
End;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TUSL_DBF_LOAD 
-- 
ALTER TABLE ASU.TUSL_DBF_LOAD ADD (
  CONSTRAINT K_TUSL_DBF_LOAD_ID
 PRIMARY KEY
 (FK_ID)
    USING INDEX 
    TABLESPACE USR
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
               ))
/

