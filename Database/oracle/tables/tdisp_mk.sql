ALTER TABLE ASU.TDISP_MK
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TDISP_MK CASCADE CONSTRAINTS
/

--
-- TDISP_MK  (Table) 
--
CREATE TABLE ASU.TDISP_MK
(
  FK_ID               NUMBER(15)                NOT NULL,
  FK_PACID            NUMBER(15),
  FD_DATE_CREATE      DATE,
  FK_SOTR_CREATE      NUMBER(15),
  FL_SIGN             NUMBER(1)                 DEFAULT 0,
  FK_SOTR_SIGN        NUMBER(15),
  FD_DATE_SIGN        DATE,
  FK_TALONID_1        NUMBER(15),
  FK_TALONID_2        NUMBER(15),
  FL_HEALTH           NUMBER(1),
  FL_ADD_EXAMINATION  NUMBER(1),
  FL_SURGEON          NUMBER(1),
  FL_NARKOLOG         NUMBER(1),
  FL_HI_TECH_HEALTH   NUMBER(1),
  FL_SANATORIUM       NUMBER(1)
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOLOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING
/

COMMENT ON TABLE ASU.TDISP_MK IS '������� ���� ����� ��������������� (���������� ����). Author:Malev'
/

COMMENT ON COLUMN ASU.TDISP_MK.FK_PACID IS '������ �� ASU.TKARTA.FK_ID ��� ASU.TAMBULANCE.FK_ID'
/

COMMENT ON COLUMN ASU.TDISP_MK.FD_DATE_CREATE IS '���� �������� �����'
/

COMMENT ON COLUMN ASU.TDISP_MK.FK_SOTR_CREATE IS '��������� ��������� �����'
/

COMMENT ON COLUMN ASU.TDISP_MK.FL_SIGN IS '��������� ����� (��/���)'
/

COMMENT ON COLUMN ASU.TDISP_MK.FK_SOTR_SIGN IS '��������� ����������� �����'
/

COMMENT ON COLUMN ASU.TDISP_MK.FD_DATE_SIGN IS '���� ������� �����'
/

COMMENT ON COLUMN ASU.TDISP_MK.FK_TALONID_1 IS '����� I ����� ���������������'
/

COMMENT ON COLUMN ASU.TDISP_MK.FK_TALONID_2 IS '����� II ����� ���������������'
/

COMMENT ON COLUMN ASU.TDISP_MK.FL_HEALTH IS '��������� ������� (��/���)'
/

COMMENT ON COLUMN ASU.TDISP_MK.FL_ADD_EXAMINATION IS '���� ����������� �� �������������� ������������, �� �������� � ����� ��������������� (����������������� ������������ �������) (��/���)'
/

COMMENT ON COLUMN ASU.TDISP_MK.FL_SURGEON IS '���� ����������� � �����-��������-����������� ������� (��/���)'
/

COMMENT ON COLUMN ASU.TDISP_MK.FL_NARKOLOG IS '���� ����������� � �����-��������� (�����-���������-���������) (��/���)'
/

COMMENT ON COLUMN ASU.TDISP_MK.FL_HI_TECH_HEALTH IS '��������� �� ���������-��������� ������� (��/���)'
/


--
-- TDISP_MK_FK_PACID_IDX  (Index) 
--
--  Dependencies: 
--   TDISP_MK (Table)
--
CREATE INDEX ASU.TDISP_MK_FK_PACID_IDX ON ASU.TDISP_MK
(FK_PACID)
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
-- TDISP_MK_FK_TALONID_1_IDX  (Index) 
--
--  Dependencies: 
--   TDISP_MK (Table)
--
CREATE INDEX ASU.TDISP_MK_FK_TALONID_1_IDX ON ASU.TDISP_MK
(FK_TALONID_1)
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
-- TDISP_MK_FK_TALONID_2_IDX  (Index) 
--
--  Dependencies: 
--   TDISP_MK (Table)
--
CREATE INDEX ASU.TDISP_MK_FK_TALONID_2_IDX ON ASU.TDISP_MK
(FK_TALONID_2)
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
-- TDISP_MK_PK_ID  (Index) 
--
--  Dependencies: 
--   TDISP_MK (Table)
--
CREATE UNIQUE INDEX ASU.TDISP_MK_PK_ID ON ASU.TDISP_MK
(FK_ID)
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
-- TR_TDISP_MK_BI  (Trigger) 
--
--  Dependencies: 
--   TDISP_MK (Table)
--
CREATE OR REPLACE TRIGGER ASU."TR_TDISP_MK_BI"
BEFORE INSERT
ON ASU.TDISP_MK REFERENCING OLD AS OLD NEW AS NEW
FOR EACH ROW
Begin
  IF :NEW.FK_ID IS NULL THEN
     SELECT ASU.SEQ_TDISP_MK.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
  END IF;
End;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TDISP_MK 
-- 
ALTER TABLE ASU.TDISP_MK ADD (
  CONSTRAINT TDISP_MK_PK_ID
 PRIMARY KEY
 (FK_ID))
/

