ALTER TABLE ASU.TSLUCH_DBF_LOAD
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TSLUCH_DBF_LOAD CASCADE CONSTRAINTS
/

--
-- TSLUCH_DBF_LOAD  (Table) 
--
CREATE TABLE ASU.TSLUCH_DBF_LOAD
(
  OWN                 NUMBER(1),
  TYPE_FIN            NUMBER(1),
  TFOMS_ID            NUMBER(10),
  YEAR                NUMBER(4),
  MONTH               NUMBER(2),
  TER_OKATO           VARCHAR2(5 BYTE),
  LPU_ID              NUMBER(10),
  LPU_NAPR            NUMBER(10),
  LPU_INTR            NUMBER(10),
  GLOBAL_ID           NUMBER(19),
  PERSON_IDL          NUMBER(19),
  ID_ILL              NUMBER(19),
  POLICYSER           VARCHAR2(10 BYTE),
  POLICYNUM           VARCHAR2(20 BYTE),
  FAM                 VARCHAR2(25 BYTE),
  IM                  VARCHAR2(25 BYTE),
  OTCH                VARCHAR2(25 BYTE),
  DATE_B_DAY          DATE,
  POL                 VARCHAR2(1 BYTE),
  DIA_SD              VARCHAR2(8 BYTE),
  DIA_O               VARCHAR2(8 BYTE),
  DIA_C               VARCHAR2(8 BYTE),
  DIA_E               VARCHAR2(8 BYTE),
  DATE_S              DATE,
  DATE_E              DATE,
  DATE_NAPR           DATE,
  Q_U                 NUMBER(1),
  V_MU                NUMBER(3),
  PR_MP               NUMBER(3),
  TYPE_MP             NUMBER(1),
  DESTROY             NUMBER(2),
  Q_Z                 NUMBER(1),
  RES_G               NUMBER(3),
  RESG_DOP            NUMBER(3),
  DISP                NUMBER(1),
  NOVOR               VARCHAR2(9 BYTE),
  TOTAL               NUMBER(10,2),
  N_NAPR              VARCHAR2(19 BYTE),
  N_MAP               VARCHAR2(19 BYTE),
  N_MAP_AMB           VARCHAR2(19 BYTE),
  OPER_ID             NUMBER(1),
  NARKOZ_ID           NUMBER(2),
  SMK_NAME            VARCHAR2(50 BYTE),
  SN_PASP             VARCHAR2(20 BYTE),
  D_TYPE              VARCHAR2(5 BYTE),
  P_ID_ILL            NUMBER(2),
  TFOMS_REG           NUMBER(10),
  DATE_NPOL           DATE,
  DATE_EPOL           DATE,
  STAT_P              NUMBER(1),
  FAMP                VARCHAR2(30 BYTE),
  IMP                 VARCHAR2(20 BYTE),
  OTP                 VARCHAR2(20 BYTE),
  C_OKSM              VARCHAR2(3 BYTE),
  C_DOC               NUMBER(2),
  S_DOC               VARCHAR2(9 BYTE),
  N_DOC               VARCHAR2(8 BYTE),
  R_NAME              VARCHAR2(150 BYTE),
  C_NAME              VARCHAR2(150 BYTE),
  Q_NP                NUMBER(2),
  NP_NAME             VARCHAR2(150 BYTE),
  Q_UL                NUMBER(2),
  UL_NAME             VARCHAR2(150 BYTE),
  DOM                 VARCHAR2(7 BYTE),
  KOR                 VARCHAR2(5 BYTE),
  KV                  VARCHAR2(5 BYTE),
  STAT_Z              NUMBER(2),
  PRVS                NUMBER(4),
  VID_P               NUMBER(1),
  Q_OGRN              VARCHAR2(15 BYTE),
  STANDARD            NUMBER(1),
  MR                  VARCHAR2(100 BYTE),
  SNILS               VARCHAR2(14 BYTE),
  OKATOG              VARCHAR2(11 BYTE),
  OKATOP              VARCHAR2(11 BYTE),
  POLP                VARCHAR2(1 BYTE),
  DRP                 DATE,
  TYPE_V_MU           NUMBER(1),
  MODERN              NUMBER(1),
  SUM_MODERN          NUMBER(10,2),
  FK_ID               NUMBER(15)                NOT NULL,
  FN_ROWNUM           NUMBER(15),
  FN_DISP_FSTAGE_NAZ  NUMBER                    DEFAULT 0,
  FK_USLVIDID         NUMBER(15),
  DISP_KAT            NUMBER(2),
  GZ                  NUMBER(1),
  DISP_RES            NUMBER(1),
  FK_PACID            NUMBER(15),
  AMB_PR              NUMBER(2)
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

COMMENT ON TABLE ASU.TSLUCH_DBF_LOAD IS '����������� �� RSA ����� ������ (������� ��� ������� ������ �������� ������ �����) Author:Efimov'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF_LOAD.FK_ID IS 'SEQ_TSLUCH_DBF_LOAD'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF_LOAD.FN_ROWNUM IS '���������� �����'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF_LOAD.FN_DISP_FSTAGE_NAZ IS '���������, ��������������� ������� ����� ���������������, 0 - ������ ��� �� ��������������� ��� ������ ����'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF_LOAD.DISP_KAT IS '��������� �������, ���������� ��������������� (���������� DISP_KAT)'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF_LOAD.GZ IS '������ ��������� �������� ������� �� ������ ���������������, ����. �������, ����. ���������� (���������� GZ)'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF_LOAD.DISP_RES IS '����������� ���������� �� II ���� ��������������� (1- ��������� �� II ���� ��������������� 0 � II ���� ��������������� �� �����)'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF_LOAD.FK_PACID IS '���� ��������� ��� �������� ����������� ������ � ������������ �������� � ������ �������� ��� ���������� FK_PACID'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF_LOAD.AMB_PR IS '���� ��������� ��� �������� ����������� ������ � ������������ �������� � ������ �������� ��� ���������� AMB_PR'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF_LOAD.OWN IS '������� ����� ����������� (1- ����������� �� ���������� ����-����
2- ����������� �� ���� ���������� ��
)'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF_LOAD.TFOMS_ID IS '��� ���������� ����������� (���������� TFOMS)'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF_LOAD.YEAR IS '��� ������ �������'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF_LOAD.MONTH IS '����� ������ �������'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF_LOAD.LPU_ID IS '��� ��� (���������� LPU)'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF_LOAD.GLOBAL_ID IS '���������� ����� ��������������� �� ���������� ���� '
/

COMMENT ON COLUMN ASU.TSLUCH_DBF_LOAD.PERSON_IDL IS '��������� ����� ��������������� � ���'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF_LOAD.ID_ILL IS '����������������� ����� ������'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF_LOAD.POLICYSER IS '����� ������ ��������'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF_LOAD.POLICYNUM IS '����� ������'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF_LOAD.FAM IS '������� ��������'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF_LOAD.IM IS '��� ��������'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF_LOAD.OTCH IS '�������� ��������'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF_LOAD.DATE_B_DAY IS '���� �������� ��������'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF_LOAD.POL IS '��� �������� (� ��� � � ������� ��������)'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF_LOAD.DIA_SD IS '������� ��������������� (� ������ ����������� �� ������� ��� DS ������������ ���)'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF_LOAD.DIA_O IS '������� ����������'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF_LOAD.DIA_C IS '������� �������������'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF_LOAD.DIA_E IS '������� �������������'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF_LOAD.DATE_S IS '���� ������ �����������'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF_LOAD.DATE_E IS '���� ��������� �����������'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF_LOAD.Q_U IS '��� ������.  ����������� � ������ �������� ���� OWN=2 (1-���������, 2-�����������, 3-������� ���������, 4-��������� ��������)'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF_LOAD.DESTROY IS '������ (����������� � ���������� �  ������ ��������������� �������� S.00-S.99 ��� T.00-T.98
���������� DESTROY)'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF_LOAD.Q_Z IS '��� ��������� ����������� (���������� KH_ZABOL)'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF_LOAD.RES_G IS '��� ���������� ��������� (���������� REZ_OBR)'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF_LOAD.RESG_DOP IS '���������� � ������ ��������� (���������� REZOBR_DOP)'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF_LOAD.DISP IS '��������� �� � ����
(1 -������� 2-���������, 3-����)'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF_LOAD.TOTAL IS '�����, ������������� � ������ �� ���'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF_LOAD.N_MAP IS '����� ����� ������� �� ����������'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF_LOAD.N_MAP_AMB IS '����� ����� ������������� ������'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF_LOAD.OPER_ID IS '������� ����������� ������������� (1 ������������, 0- �� �������������)'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF_LOAD.NARKOZ_ID IS '��������� (���������� MORPHEY)'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF_LOAD.SMK_NAME IS '������������ �����������. ����������� � ������ �������� ���� OWN=2'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF_LOAD.D_TYPE IS '������ ������. ����������� � ������ �������� ���� OWN=2'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF_LOAD.MR IS '����� ��������. ����������� ���� OWN=2'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF_LOAD.SNILS IS '�����. ����������� ���� OWN=2'
/


--
-- I_SLUCH_DBF_LOAD_BY_KEY  (Index) 
--
--  Dependencies: 
--   TSLUCH_DBF_LOAD (Table)
--
CREATE UNIQUE INDEX ASU.I_SLUCH_DBF_LOAD_BY_KEY ON ASU.TSLUCH_DBF_LOAD
(YEAR, MONTH, LPU_ID, ID_ILL, P_ID_ILL)
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
-- I_SLUCH_DBF_LOAD_ROWNUM  (Index) 
--
--  Dependencies: 
--   TSLUCH_DBF_LOAD (Table)
--
CREATE UNIQUE INDEX ASU.I_SLUCH_DBF_LOAD_ROWNUM ON ASU.TSLUCH_DBF_LOAD
(FN_ROWNUM)
NOLOGGING
TABLESPACE USR
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- I_TSLUCH_DBF_LOAD_DISP_NAZ  (Index) 
--
--  Dependencies: 
--   TSLUCH_DBF_LOAD (Table)
--
CREATE INDEX ASU.I_TSLUCH_DBF_LOAD_DISP_NAZ ON ASU.TSLUCH_DBF_LOAD
(FN_DISP_FSTAGE_NAZ)
NOLOGGING
TABLESPACE USR
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- K_TSLUCH_DBF_LOAD_ID  (Index) 
--
--  Dependencies: 
--   TSLUCH_DBF_LOAD (Table)
--
CREATE UNIQUE INDEX ASU.K_TSLUCH_DBF_LOAD_ID ON ASU.TSLUCH_DBF_LOAD
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
-- TSLUCH_DBF_LOAD_INSERT  (Trigger) 
--
--  Dependencies: 
--   TSLUCH_DBF_LOAD (Table)
--
CREATE OR REPLACE TRIGGER ASU."TSLUCH_DBF_LOAD_INSERT" 
 BEFORE
  INSERT
 ON asu.TSLUCH_DBF_LOAD
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
Begin
  IF :new.fk_id IS NULL THEN
    SELECT asu.SEQ_TSLUCH_DBF.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
  end if;
End;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TSLUCH_DBF_LOAD 
-- 
ALTER TABLE ASU.TSLUCH_DBF_LOAD ADD (
  CONSTRAINT K_TSLUCH_DBF_LOAD_ID
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

