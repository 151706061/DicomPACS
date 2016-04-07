ALTER TABLE ASU.TEXCHSOTR
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TEXCHSOTR CASCADE CONSTRAINTS
/

--
-- TEXCHSOTR  (Table) 
--
CREATE TABLE ASU.TEXCHSOTR
(
  FK_ID        NUMBER(15)                       NOT NULL,
  FD_EXCH      DATE,
  LPU_ID       VARCHAR2(255 BYTE),
  DOK_INN      VARCHAR2(12 BYTE),
  FAM          VARCHAR2(30 BYTE),
  IM           VARCHAR2(30 BYTE),
  OTCH         VARCHAR2(30 BYTE),
  DATE_B_DAY   DATE,
  STAT         NUMBER,
  SPEC_VUZ     NUMBER,
  DATE_BEG     DATE,
  DATE_END     DATE,
  VID_SPEC     NUMBER,
  KOD_SPEC     NUMBER,
  DATE_SRT     DATE,
  KOD_SPEC_79  NUMBER,
  FD_ADD_DAY   DATE
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

COMMENT ON TABLE ASU.TEXCHSOTR IS '����� ����������� � DBF (����������� ����� � ������������ � �������� ����������� ���� ��. � ������������) Author:Efimov'
/

COMMENT ON COLUMN ASU.TEXCHSOTR.KOD_SPEC_79 IS '��� ������������� ��� �������� �� 79�� ������� ������ 2.1.1'
/

COMMENT ON COLUMN ASU.TEXCHSOTR.FD_ADD_DAY IS '���� ����������'
/

COMMENT ON COLUMN ASU.TEXCHSOTR.FK_ID IS 'SEQ_EXCHSOTR'
/

COMMENT ON COLUMN ASU.TEXCHSOTR.FD_EXCH IS '���� ��������� �������� � DBF'
/

COMMENT ON COLUMN ASU.TEXCHSOTR.LPU_ID IS '��� �������'
/

COMMENT ON COLUMN ASU.TEXCHSOTR.DOK_INN IS '��� ���. ���������'
/

COMMENT ON COLUMN ASU.TEXCHSOTR.FAM IS '������� ���. ���������'
/

COMMENT ON COLUMN ASU.TEXCHSOTR.IM IS '��� ���. ���������'
/

COMMENT ON COLUMN ASU.TEXCHSOTR.OTCH IS '�������� ���. ���������'
/

COMMENT ON COLUMN ASU.TEXCHSOTR.DATE_B_DAY IS '���� �������� ���. ���������'
/

COMMENT ON COLUMN ASU.TEXCHSOTR.STAT IS '������ ���. ��������� (1 - �������� ����� ������. 2 - ������� ������������)'
/

COMMENT ON COLUMN ASU.TEXCHSOTR.SPEC_VUZ IS '������������� ���������� � ����'
/

COMMENT ON COLUMN ASU.TEXCHSOTR.DATE_BEG IS '���� ������ �� ������'
/

COMMENT ON COLUMN ASU.TEXCHSOTR.DATE_END IS '���� ���������� � ������'
/

COMMENT ON COLUMN ASU.TEXCHSOTR.VID_SPEC IS '��������� ���� ������������� �����������. ���� �������� ����� �������� ������ 2.1.1 �������� �� ������� 79 � ������ �� �����������'
/

COMMENT ON COLUMN ASU.TEXCHSOTR.KOD_SPEC IS '��� �������������. ���� �������� ����� �������� ������ 2.1.1 �������� �� ������� 79 � ������ �� �����������'
/

COMMENT ON COLUMN ASU.TEXCHSOTR.DATE_SRT IS '���� ������ (���������� ���������) ����������� �� ��������������� �������������'
/


--
-- K_TEXCHSOTR_ID  (Index) 
--
--  Dependencies: 
--   TEXCHSOTR (Table)
--
CREATE UNIQUE INDEX ASU.K_TEXCHSOTR_ID ON ASU.TEXCHSOTR
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
-- TEXCHSOTR_INSERT  (Trigger) 
--
--  Dependencies: 
--   TEXCHSOTR (Table)
--
CREATE OR REPLACE TRIGGER ASU."TEXCHSOTR_INSERT" 
 BEFORE
  INSERT
 ON asu.TEXCHSOTR
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
Begin
  IF :new.fk_id IS NULL THEN
    SELECT asu.SEQ_TEXCHSOTR.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
  end if;
End;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TEXCHSOTR 
-- 
ALTER TABLE ASU.TEXCHSOTR ADD (
  CONSTRAINT K_TEXCHSOTR_ID
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

