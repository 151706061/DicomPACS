ALTER TABLE ASU.TEXSLUCH_ERR
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TEXSLUCH_ERR CASCADE CONSTRAINTS
/

--
-- TEXSLUCH_ERR  (Table) 
--
CREATE TABLE ASU.TEXSLUCH_ERR
(
  FK_ID           NUMBER(15)                    NOT NULL,
  GLOBAL_ID       NUMBER(19),
  YEAR            NUMBER(4),
  MONTH           NUMBER(2),
  LPU_ID          NUMBER(10),
  PERSON_IDL      NUMBER(19),
  ID_ILL          NUMBER(19)                    NOT NULL,
  P_ID_ILL        NUMBER(2),
  VO              NUMBER(1),
  FC_CODE         VARCHAR2(8 BYTE),
  FK_SLUCHID      NUMBER(15),
  FN_IS_LOAD      NUMBER(1),
  FC_MSG_ERR      VARCHAR2(256 BYTE),
  FC_FIELDS       VARCHAR2(256 BYTE),
  POLICYSER       VARCHAR2(10 BYTE),
  POLICYNUM       VARCHAR2(20 BYTE),
  TYPE_FILE       VARCHAR2(3 BYTE),
  FK_USLID        NUMBER(15),
  FK_SLUCHLOADID  NUMBER(15),
  ID_ILL_U        NUMBER(19)
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

COMMENT ON TABLE ASU.TEXSLUCH_ERR IS '������ ������ ����������� � �������� � DBF Author:Efimov'
/

COMMENT ON COLUMN ASU.TEXSLUCH_ERR.YEAR IS '��� ������ �������'
/

COMMENT ON COLUMN ASU.TEXSLUCH_ERR.MONTH IS '����� ������ �������'
/

COMMENT ON COLUMN ASU.TEXSLUCH_ERR.LPU_ID IS '��� ���'
/

COMMENT ON COLUMN ASU.TEXSLUCH_ERR.PERSON_IDL IS '��������� ����� ��������������� � ���'
/

COMMENT ON COLUMN ASU.TEXSLUCH_ERR.ID_ILL IS '����������������� ����� ������'
/

COMMENT ON COLUMN ASU.TEXSLUCH_ERR.P_ID_ILL IS '���������� ����� ������������������ ������ ������'
/

COMMENT ON COLUMN ASU.TEXSLUCH_ERR.FC_CODE IS '��� ������ �� ������ �����'
/

COMMENT ON COLUMN ASU.TEXSLUCH_ERR.FK_SLUCHID IS 'TSLUCH_DBF.FK_ID - ��������� ������ ���� ������ �������� � ���������� �������, � �� �� dbf  �� �����'
/

COMMENT ON COLUMN ASU.TEXSLUCH_ERR.FN_IS_LOAD IS '1 - ������ ��������� �� dbf ���������� � ���������� �������� ������� ������� �� ���� �����, ����� ������ �������� - ������ �������� � ���������� �������'
/

COMMENT ON COLUMN ASU.TEXSLUCH_ERR.FC_MSG_ERR IS '����������� ������ �� ������ �����'
/

COMMENT ON COLUMN ASU.TEXSLUCH_ERR.FC_FIELDS IS '���� �� ������� ���� ����������� ������� ������'
/

COMMENT ON COLUMN ASU.TEXSLUCH_ERR.FK_USLID IS 'TUSL_DBF.FK_ID - ��������� ������ ���� ������ �������� � ���������� �������, � �� �� dbf  �� �����'
/

COMMENT ON COLUMN ASU.TEXSLUCH_ERR.FK_SLUCHLOADID IS 'TSLUCH_LOAD_DBF.FK_ID - ��������� ������ ���� ������ �������� � ���������� �������� �� dbf  �� �����'
/

COMMENT ON COLUMN ASU.TEXSLUCH_ERR.FK_ID IS 'SEQ_TEXSLUCH_ERR'
/


--
-- I_TEXCHSLUCH_ERR_ID_ILL  (Index) 
--
--  Dependencies: 
--   TEXSLUCH_ERR (Table)
--
CREATE INDEX ASU.I_TEXCHSLUCH_ERR_ID_ILL ON ASU.TEXSLUCH_ERR
(ID_ILL, P_ID_ILL)
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
-- I_TEXCHSLUCH_ERR_USLID  (Index) 
--
--  Dependencies: 
--   TEXSLUCH_ERR (Table)
--
CREATE INDEX ASU.I_TEXCHSLUCH_ERR_USLID ON ASU.TEXSLUCH_ERR
(FK_USLID)
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
-- I_TEXSLUCH_ERR_CODE  (Index) 
--
--  Dependencies: 
--   TEXSLUCH_ERR (Table)
--
CREATE INDEX ASU.I_TEXSLUCH_ERR_CODE ON ASU.TEXSLUCH_ERR
(FC_CODE, FC_MSG_ERR, FN_IS_LOAD)
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
-- I_TEXSLUCH_ERR_SLUCHID  (Index) 
--
--  Dependencies: 
--   TEXSLUCH_ERR (Table)
--
CREATE INDEX ASU.I_TEXSLUCH_ERR_SLUCHID ON ASU.TEXSLUCH_ERR
(FK_SLUCHID, FK_SLUCHLOADID)
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
-- K_TEXSLUCH_ERR_ID  (Index) 
--
--  Dependencies: 
--   TEXSLUCH_ERR (Table)
--
CREATE UNIQUE INDEX ASU.K_TEXSLUCH_ERR_ID ON ASU.TEXSLUCH_ERR
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
-- TEXSLUCH_ERR_INSERT  (Trigger) 
--
--  Dependencies: 
--   TEXSLUCH_ERR (Table)
--
CREATE OR REPLACE TRIGGER ASU."TEXSLUCH_ERR_INSERT" 
 BEFORE
  INSERT
 ON asu.TEXSLUCH_ERR
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
Begin
  IF :new.fk_id IS NULL THEN
    SELECT asu.SEQ_TEXSLUCH_ERR.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
  end if;
End;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TEXSLUCH_ERR 
-- 
ALTER TABLE ASU.TEXSLUCH_ERR ADD (
  CONSTRAINT K_TEXSLUCH_ERR_ID
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

