ALTER TABLE ASU.TBRON_PEOPLE
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TBRON_PEOPLE CASCADE CONSTRAINTS
/

--
-- TBRON_PEOPLE  (Table) 
--
CREATE TABLE ASU.TBRON_PEOPLE
(
  FK_ID          NUMBER                         NOT NULL,
  FC_FAM         VARCHAR2(30 BYTE),
  FC_IM          VARCHAR2(30 BYTE),
  FC_OTCH        VARCHAR2(30 BYTE),
  FD_ROJD        DATE,
  FP_SEX         NUMBER(1),
  FK_DOCVID      NUMBER(15),
  FC_DOCSER      VARCHAR2(10 BYTE),
  FC_DOCNUM      VARCHAR2(10 BYTE),
  FK_INSUR       NUMBER,
  FK_INSUR_COMP  NUMBER,
  FC_INSUR_SER   VARCHAR2(30 BYTE),
  FC_INSUR_NUM   VARCHAR2(30 BYTE)
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

COMMENT ON TABLE ASU.TBRON_PEOPLE IS '��������������� ���. �������� author: A.Nakorjakov'
/

COMMENT ON COLUMN ASU.TBRON_PEOPLE.FK_ID IS 'SEQUENCE=[SEQ_TKARTA]'
/

COMMENT ON COLUMN ASU.TBRON_PEOPLE.FC_FAM IS '�������'
/

COMMENT ON COLUMN ASU.TBRON_PEOPLE.FC_IM IS '���'
/

COMMENT ON COLUMN ASU.TBRON_PEOPLE.FC_OTCH IS '��������'
/

COMMENT ON COLUMN ASU.TBRON_PEOPLE.FD_ROJD IS '���� ��������'
/

COMMENT ON COLUMN ASU.TBRON_PEOPLE.FP_SEX IS '���'
/

COMMENT ON COLUMN ASU.TBRON_PEOPLE.FK_DOCVID IS '��� ��������� ��������������� ��������'
/

COMMENT ON COLUMN ASU.TBRON_PEOPLE.FC_DOCSER IS '����� ���������'
/

COMMENT ON COLUMN ASU.TBRON_PEOPLE.FC_DOCNUM IS '����� ���������'
/

COMMENT ON COLUMN ASU.TBRON_PEOPLE.FK_INSUR IS 'Полис пациента'
/

COMMENT ON COLUMN ASU.TBRON_PEOPLE.FK_INSUR_COMP IS 'Страховая организация полиса'
/

COMMENT ON COLUMN ASU.TBRON_PEOPLE.FC_INSUR_SER IS 'Серия'
/

COMMENT ON COLUMN ASU.TBRON_PEOPLE.FC_INSUR_NUM IS 'Номер'
/


--
-- PK_TBRON_PEOPLE  (Index) 
--
--  Dependencies: 
--   TBRON_PEOPLE (Table)
--
CREATE UNIQUE INDEX ASU.PK_TBRON_PEOPLE ON ASU.TBRON_PEOPLE
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
-- TBRON_PEOPLE$BI  (Trigger) 
--
--  Dependencies: 
--   TBRON_PEOPLE (Table)
--
CREATE OR REPLACE TRIGGER ASU."TBRON_PEOPLE$BI" before insert
on ASU.TBRON_PEOPLE for each row
begin
  --  Column "FK_ID" uses sequence ASU.SEQ_TBRON_PEOPLE
  if :new.FK_ID is null then
    select ASU.SEQ_TKARTA.NEXTVAL INTO :new.FK_ID from dual;
  end if;
end;
/
SHOW ERRORS;


--
-- TBRON_PEOPLE$BD  (Trigger) 
--
--  Dependencies: 
--   TBRON_PEOPLE (Table)
--
CREATE OR REPLACE TRIGGER ASU."TBRON_PEOPLE$BD" before delete
on ASU.TBRON_PEOPLE for each row
begin
  delete from asu.tbron_naz n where n.fk_bron_people = :old.fk_id;
end;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TBRON_PEOPLE 
-- 
ALTER TABLE ASU.TBRON_PEOPLE ADD (
  CONSTRAINT PK_TBRON_PEOPLE
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

