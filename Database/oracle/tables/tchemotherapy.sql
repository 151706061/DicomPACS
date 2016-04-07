ALTER TABLE ASU.TCHEMOTHERAPY
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TCHEMOTHERAPY CASCADE CONSTRAINTS
/

--
-- TCHEMOTHERAPY  (Table) 
--
CREATE TABLE ASU.TCHEMOTHERAPY
(
  FK_ID          NUMBER                         NOT NULL,
  FK_PACID       NUMBER                         NOT NULL,
  FC_KURSNUM     VARCHAR2(10 BYTE),
  FK_VRACHID     NUMBER                         DEFAULT -1                    NOT NULL,
  FD_DATE        DATE                           DEFAULT sysdate               NOT NULL,
  FL_DEL         NUMBER(1)                      DEFAULT 0                     NOT NULL,
  FK_SOTRID      NUMBER                         DEFAULT -1                    NOT NULL,
  FD_BEGIN       DATE                           DEFAULT sysdate               NOT NULL,
  FD_END         DATE                           DEFAULT sysdate               NOT NULL,
  FK_TEMPLID     NUMBER,
  FK_KURSVID     NUMBER(15),
  FK_EFFECT      NUMBER(15)                     DEFAULT -1,
  FK_NAZOWNER    NUMBER(15)                     DEFAULT -1,
  FK_STANDARTID  NUMBER(15)                     DEFAULT -1
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

COMMENT ON TABLE ASU.TCHEMOTHERAPY IS '������������. Author: Neronov A.S. 01.06.2012'
/

COMMENT ON COLUMN ASU.TCHEMOTHERAPY.FK_ID IS '[SEQ_TCHEMOTHERAPY] - ID'
/

COMMENT ON COLUMN ASU.TCHEMOTHERAPY.FK_PACID IS 'ID ��������'
/

COMMENT ON COLUMN ASU.TCHEMOTHERAPY.FC_KURSNUM IS '����� �����'
/

COMMENT ON COLUMN ASU.TCHEMOTHERAPY.FK_VRACHID IS 'LOGIN.TSOTR.FK_ID - ����'
/

COMMENT ON COLUMN ASU.TCHEMOTHERAPY.FD_DATE IS '���� ��������'
/

COMMENT ON COLUMN ASU.TCHEMOTHERAPY.FL_DEL IS '1 - ������'
/

COMMENT ON COLUMN ASU.TCHEMOTHERAPY.FK_SOTRID IS 'LOGIN.TSOTR.FK_ID - ���������, ������� ������'
/

COMMENT ON COLUMN ASU.TCHEMOTHERAPY.FD_BEGIN IS '������ �����'
/

COMMENT ON COLUMN ASU.TCHEMOTHERAPY.FD_END IS '��������� �����'
/

COMMENT ON COLUMN ASU.TCHEMOTHERAPY.FK_TEMPLID IS 'ASU.TCHEMOTHERAPY_TEMPL.FK_ID - ������ �� ������, �� �������� ��� ������ ����'
/

COMMENT ON COLUMN ASU.TCHEMOTHERAPY.FK_KURSVID IS '��� ������������ (id �� ����� asu.tsmid � ��������� CHEMOTHERAPY_VID)'
/

COMMENT ON COLUMN ASU.TCHEMOTHERAPY.FK_EFFECT IS '������������� ������� (id �� ����� asu.tsmid � ��������� CHEMOTHERAPY_EFFECT_LECH)'
/

COMMENT ON COLUMN ASU.TCHEMOTHERAPY.FK_NAZOWNER IS '�� �������, � ������ �������� ��� �������� ���� ������������'
/

COMMENT ON COLUMN ASU.TCHEMOTHERAPY.FK_STANDARTID IS 'TSTANDART.FK_ID   (ID ���� ���)'
/


--
-- PK_TCHEMOTHERAPY  (Index) 
--
--  Dependencies: 
--   TCHEMOTHERAPY (Table)
--
CREATE UNIQUE INDEX ASU.PK_TCHEMOTHERAPY ON ASU.TCHEMOTHERAPY
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
-- TCHEMOTHERAPY_BY_PACID  (Index) 
--
--  Dependencies: 
--   TCHEMOTHERAPY (Table)
--
CREATE INDEX ASU.TCHEMOTHERAPY_BY_PACID ON ASU.TCHEMOTHERAPY
(FK_PACID)
NOLOGGING
TABLESPACE INDX
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
-- TCHEMOTHERAPY_BI  (Trigger) 
--
--  Dependencies: 
--   TCHEMOTHERAPY (Table)
--
CREATE OR REPLACE TRIGGER ASU.TCHEMOTHERAPY_BI
 BEFORE
 INSERT
 ON ASU.TCHEMOTHERAPY  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
BEGIN
   select asu.SEQ_TCHEMOTHERAPY.nextval into :new.fk_id from dual;
END;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TCHEMOTHERAPY 
-- 
ALTER TABLE ASU.TCHEMOTHERAPY ADD (
  CONSTRAINT PK_TCHEMOTHERAPY
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

