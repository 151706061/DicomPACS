ALTER TABLE ASU.TUSL_DBF_ARCHIVE
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TUSL_DBF_ARCHIVE CASCADE CONSTRAINTS
/

--
-- TUSL_DBF_ARCHIVE  (Table) 
--
CREATE TABLE ASU.TUSL_DBF_ARCHIVE
(
  OWN                 NUMBER(1),
  TYPE_FIN            NUMBER(1),
  GLOBAL_ID           NUMBER(19),
  YEAR                NUMBER(4),
  MONTH               NUMBER(2),
  LPU_ID              NUMBER(10),
  LPU_NAPR            NUMBER(10),
  TFOMS_ID            NUMBER(10),
  PERSON_IDL          NUMBER(19),
  ID_ILL              NUMBER(19),
  POLICYSER           VARCHAR2(10 BYTE),
  POLICYNUM           VARCHAR2(20 BYTE),
  TYPE_USL            NUMBER(1),
  DATE_B_U            DATE,
  DATE_E_U            DATE,
  V_MU                NUMBER(3),
  PR_MP               NUMBER(3),
  KOD_MU              NUMBER(1),
  KOL_MU              NUMBER(5,2),
  TYPE_EO             NUMBER(2),
  KOD_EO              VARCHAR2(20 BYTE),
  KOL_EO              NUMBER(5),
  COST_EO             NUMBER(10,2),
  SUM_EO              NUMBER(10,2),
  N_QU                NUMBER(1),
  N_TOOTH             NUMBER(1),
  P_TOOTH             VARCHAR2(6 BYTE),
  N_QU2               NUMBER(1),
  N_TOOTH2            NUMBER(1),
  P_TOOTH2            VARCHAR2(6 BYTE),
  N_QU3               NUMBER(1),
  N_TOOTH3            NUMBER(1),
  P_TOOTH3            VARCHAR2(6 BYTE),
  N_QU4               NUMBER(1),
  N_TOOTH4            NUMBER(1),
  P_TOOTH4            VARCHAR2(6 BYTE),
  N_QU5               NUMBER(1),
  N_TOOTH5            NUMBER(1),
  P_TOOTH5            VARCHAR2(6 BYTE),
  N_QU6               NUMBER(1),
  N_TOOTH6            NUMBER(1),
  P_TOOTH6            VARCHAR2(6 BYTE),
  N_QU7               NUMBER(1),
  N_TOOTH7            NUMBER(1),
  P_TOOTH7            VARCHAR2(6 BYTE),
  N_QU8               NUMBER(1),
  N_TOOTH8            NUMBER(1),
  P_TOOTH8            VARCHAR2(6 BYTE),
  DOC_CD_U            VARCHAR2(20 BYTE),
  PRVSM_U             NUMBER(4),
  P_ID_ILL            NUMBER(2),
  LPU_INTR            NUMBER(10),
  COST_MODER          NUMBER(10,2),
  SUM_MODERN          NUMBER(10,2),
  Z$NAZ_ID            NUMBER,
  Z$FL_POLY           NUMBER(1),
  FK_ID               NUMBER(15)                NOT NULL,
  FK_SLUCHID          NUMBER(15),
  FK_PREGROUPSLUCHID  NUMBER(15),
  ID_ILL_U            NUMBER(19),
  FK_GROUPUSL         NUMBER(1)                 DEFAULT 0,
  FK_KOYKAVIDID       NUMBER(15),
  FK_SOTRID           NUMBER(15),
  COST_MODER_F        NUMBER(10,2),
  MODERN_CODE         VARCHAR2(20 BYTE),
  DATE_B_U_TIME       DATE,
  DATE_E_U_TIME       DATE,
  FK_PACID            NUMBER(15)
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          16K
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

COMMENT ON TABLE ASU.TUSL_DBF_ARCHIVE IS '�����. ����������� �� USA ����� ������ (������� ��� ������� ������ �������� ������ �����) Author: Neronov A.S. 25.07.2011'
/

COMMENT ON COLUMN ASU.TUSL_DBF_ARCHIVE.KOL_EO IS '���������� �� ���� (KOD_ EO)'
/

COMMENT ON COLUMN ASU.TUSL_DBF_ARCHIVE.COST_EO IS '���� ������� ������'
/

COMMENT ON COLUMN ASU.TUSL_DBF_ARCHIVE.SUM_EO IS '�������������  ��� ����� ������'
/

COMMENT ON COLUMN ASU.TUSL_DBF_ARCHIVE.N_QU IS '����� �������� (���������) ��������������� ������� ������� � ������ ������� (ZF)'
/

COMMENT ON COLUMN ASU.TUSL_DBF_ARCHIVE.N_TOOTH IS '����� ���� (ZF)'
/

COMMENT ON COLUMN ASU.TUSL_DBF_ARCHIVE.P_TOOTH IS '����������� ���� (PZ)'
/

COMMENT ON COLUMN ASU.TUSL_DBF_ARCHIVE.N_QU2 IS '����� �������� (���������) ��������������� ������� ������� � ������ ������� (ZF)'
/

COMMENT ON COLUMN ASU.TUSL_DBF_ARCHIVE.N_TOOTH2 IS '����� ���� (ZF)'
/

COMMENT ON COLUMN ASU.TUSL_DBF_ARCHIVE.P_TOOTH2 IS '����������� ���� (PZ)'
/

COMMENT ON COLUMN ASU.TUSL_DBF_ARCHIVE.N_QU3 IS '����� �������� (���������) ��������������� ������� ������� � ������ ������� (ZF)'
/

COMMENT ON COLUMN ASU.TUSL_DBF_ARCHIVE.N_TOOTH3 IS '����� ���� (ZF)'
/

COMMENT ON COLUMN ASU.TUSL_DBF_ARCHIVE.P_TOOTH3 IS '����������� ���� (PZ)'
/

COMMENT ON COLUMN ASU.TUSL_DBF_ARCHIVE.N_QU4 IS '����� �������� (���������) ��������������� ������� ������� � ������ ������� (ZF)'
/

COMMENT ON COLUMN ASU.TUSL_DBF_ARCHIVE.N_TOOTH4 IS '����� ���� (ZF)'
/

COMMENT ON COLUMN ASU.TUSL_DBF_ARCHIVE.P_TOOTH4 IS '����������� ���� (PZ)'
/

COMMENT ON COLUMN ASU.TUSL_DBF_ARCHIVE.N_QU5 IS '����� �������� (���������) ��������������� ������� ������� � ������ ������� (ZF)'
/

COMMENT ON COLUMN ASU.TUSL_DBF_ARCHIVE.N_TOOTH5 IS '����� ���� (ZF)'
/

COMMENT ON COLUMN ASU.TUSL_DBF_ARCHIVE.P_TOOTH5 IS '����������� ���� (PZ)'
/

COMMENT ON COLUMN ASU.TUSL_DBF_ARCHIVE.N_QU6 IS '����� �������� (���������) ��������������� ������� ������� � ������ ������� (ZF)'
/

COMMENT ON COLUMN ASU.TUSL_DBF_ARCHIVE.N_TOOTH6 IS '����� ���� (ZF)'
/

COMMENT ON COLUMN ASU.TUSL_DBF_ARCHIVE.P_TOOTH6 IS '����������� ���� (PZ)'
/

COMMENT ON COLUMN ASU.TUSL_DBF_ARCHIVE.N_QU7 IS '����� �������� (���������) ��������������� ������� ������� � ������ ������� (ZF)'
/

COMMENT ON COLUMN ASU.TUSL_DBF_ARCHIVE.N_TOOTH7 IS '����� ���� (ZF)'
/

COMMENT ON COLUMN ASU.TUSL_DBF_ARCHIVE.P_TOOTH7 IS '����������� ���� (PZ)'
/

COMMENT ON COLUMN ASU.TUSL_DBF_ARCHIVE.N_QU8 IS '����� �������� (���������) ��������������� ������� ������� � ������ ������� (ZF)'
/

COMMENT ON COLUMN ASU.TUSL_DBF_ARCHIVE.N_TOOTH8 IS '����� ���� (ZF)'
/

COMMENT ON COLUMN ASU.TUSL_DBF_ARCHIVE.P_TOOTH8 IS '����������� ���� (PZ)'
/

COMMENT ON COLUMN ASU.TUSL_DBF_ARCHIVE.Z$NAZ_ID IS '��������� ����'
/

COMMENT ON COLUMN ASU.TUSL_DBF_ARCHIVE.Z$FL_POLY IS '��������� ���� 1 - ����������� 0 - ���������'
/

COMMENT ON COLUMN ASU.TUSL_DBF_ARCHIVE.FK_ID IS 'SEQ_TUSL_DBF_ARCHIVE'
/

COMMENT ON COLUMN ASU.TUSL_DBF_ARCHIVE.FK_SLUCHID IS 'TSLUCH_DBF_ARCHIVE.FK_ID'
/

COMMENT ON COLUMN ASU.TUSL_DBF_ARCHIVE.FK_PREGROUPSLUCHID IS '���� ������, � �������� ��������� ������ ��� ������������ � ������� � ������ ������, �� FK_SLUCHID ������ ����� ����������� � FK_PREGROUPSLUCHID, � � FK_SLUCHID ����� �������  TSLUCH_DBF.FK_ID ������-������'
/

COMMENT ON COLUMN ASU.TUSL_DBF_ARCHIVE.FK_GROUPUSL IS '0 - ������� ������, 1 - ������-������, ����������� � ���������� �����������, � ������ ������, ������ ������ ����� � ���������� �����'
/

COMMENT ON COLUMN ASU.TUSL_DBF_ARCHIVE.FK_KOYKAVIDID IS '��������� ���� ������ �� fk_koykavidid ��� ���������� (���������� �� ��������� � tperesel)'
/

COMMENT ON COLUMN ASU.TUSL_DBF_ARCHIVE.OWN IS '������� ����� ����������� '
/

COMMENT ON COLUMN ASU.TUSL_DBF_ARCHIVE.GLOBAL_ID IS '���������� ����� ��������������� �� ���������� ���� '
/

COMMENT ON COLUMN ASU.TUSL_DBF_ARCHIVE.YEAR IS '�������� ������'
/

COMMENT ON COLUMN ASU.TUSL_DBF_ARCHIVE.MONTH IS '�������� ������'
/

COMMENT ON COLUMN ASU.TUSL_DBF_ARCHIVE.LPU_ID IS '���������� LPU'
/

COMMENT ON COLUMN ASU.TUSL_DBF_ARCHIVE.TFOMS_ID IS '��� �������������� �� ���������� ����-���� =86, ��� �������������� �� ���� ����������� ��, �������� ����������� TFOMS'
/

COMMENT ON COLUMN ASU.TUSL_DBF_ARCHIVE.PERSON_IDL IS '������������ � ���, ���������� � ������ ���'
/

COMMENT ON COLUMN ASU.TUSL_DBF_ARCHIVE.ID_ILL IS '���������� ����� ��� ������� ������ ����������� � ������ ���������� ���'
/

COMMENT ON COLUMN ASU.TUSL_DBF_ARCHIVE.POLICYSER IS '����� ������'
/

COMMENT ON COLUMN ASU.TUSL_DBF_ARCHIVE.POLICYNUM IS '����� ������'
/

COMMENT ON COLUMN ASU.TUSL_DBF_ARCHIVE.TYPE_USL IS '1-��������� (�������� ��������������)
  2-�����������
  3-������� ���������
  4 � ��������� (���������� ��������������)
'
/

COMMENT ON COLUMN ASU.TUSL_DBF_ARCHIVE.DATE_B_U IS '���� ������ ���������� ������'
/

COMMENT ON COLUMN ASU.TUSL_DBF_ARCHIVE.DATE_E_U IS '���� ����� ���������� ������'
/

COMMENT ON COLUMN ASU.TUSL_DBF_ARCHIVE.V_MU IS '��� ����������� ������ (���������� PMSP)'
/

COMMENT ON COLUMN ASU.TUSL_DBF_ARCHIVE.KOD_MU IS '��� ������� ����� ����������� ������ (���������� EU_MP)'
/

COMMENT ON COLUMN ASU.TUSL_DBF_ARCHIVE.KOL_MU IS '���������� ������ ����� ����������� ������'
/

COMMENT ON COLUMN ASU.TUSL_DBF_ARCHIVE.TYPE_EO IS '��� ������� ������ (���������� EDOP)'
/

COMMENT ON COLUMN ASU.TUSL_DBF_ARCHIVE.KOD_EO IS '��� ������� ������'
/


--
-- I_TUSL_DBF_ARCHIVE_DATE  (Index) 
--
--  Dependencies: 
--   TUSL_DBF_ARCHIVE (Table)
--
CREATE INDEX ASU.I_TUSL_DBF_ARCHIVE_DATE ON ASU.TUSL_DBF_ARCHIVE
(DATE_E_U, DATE_B_U)
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
-- I_TUSL_DBF_ARCHIVE_ID_ILL  (Index) 
--
--  Dependencies: 
--   TUSL_DBF_ARCHIVE (Table)
--
CREATE INDEX ASU.I_TUSL_DBF_ARCHIVE_ID_ILL ON ASU.TUSL_DBF_ARCHIVE
(ID_ILL, ID_ILL_U)
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
-- I_TUSL_DBF_ARCHIVE_POLY  (Index) 
--
--  Dependencies: 
--   TUSL_DBF_ARCHIVE (Table)
--
CREATE INDEX ASU.I_TUSL_DBF_ARCHIVE_POLY ON ASU.TUSL_DBF_ARCHIVE
(Z$FL_POLY)
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
-- I_TUSL_DBF_ARCHIVE_SLUCHID  (Index) 
--
--  Dependencies: 
--   TUSL_DBF_ARCHIVE (Table)
--
CREATE INDEX ASU.I_TUSL_DBF_ARCHIVE_SLUCHID ON ASU.TUSL_DBF_ARCHIVE
(FK_SLUCHID)
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
-- I_TUSL_DBF_ARCH_PREGRSLUCHID  (Index) 
--
--  Dependencies: 
--   TUSL_DBF_ARCHIVE (Table)
--
CREATE INDEX ASU.I_TUSL_DBF_ARCH_PREGRSLUCHID ON ASU.TUSL_DBF_ARCHIVE
(FK_PREGROUPSLUCHID)
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
-- K_TUSL_DBF_ARCHIVE_ID  (Index) 
--
--  Dependencies: 
--   TUSL_DBF_ARCHIVE (Table)
--
CREATE UNIQUE INDEX ASU.K_TUSL_DBF_ARCHIVE_ID ON ASU.TUSL_DBF_ARCHIVE
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
-- TUSL_DBF_ARCHIVE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TUSL_DBF_ARCHIVE (Table)
--
CREATE OR REPLACE TRIGGER ASU."TUSL_DBF_ARCHIVE_INSERT" 
 BEFORE
  INSERT
 ON asu.tusl_dbf_archive
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
Begin
  SELECT asu.SEQ_tusl_dbf_archive.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
End;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TUSL_DBF_ARCHIVE 
-- 
ALTER TABLE ASU.TUSL_DBF_ARCHIVE ADD (
  CONSTRAINT K_TUSL_DBF_ARCHIVE_ID
 PRIMARY KEY
 (FK_ID)
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

