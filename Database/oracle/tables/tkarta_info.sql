ALTER TABLE ASU.TKARTA_INFO
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TKARTA_INFO CASCADE CONSTRAINTS
/

--
-- TKARTA_INFO  (Table) 
--
CREATE TABLE ASU.TKARTA_INFO
(
  FK_PACID           NUMBER                     NOT NULL,
  FL_MODERNIZACIA    NUMBER                     DEFAULT 0,
  FC_ICD10           VARCHAR2(10 BYTE),
  FK_MODERNSTANDART  NUMBER
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

COMMENT ON TABLE ASU.TKARTA_INFO IS '�������������� ���������� �� ������������� ������ DBF Author:Efimov'
/

COMMENT ON COLUMN ASU.TKARTA_INFO.FL_MODERNIZACIA IS '�� ������������ 1 - ��, 0 - ���'
/

COMMENT ON COLUMN ASU.TKARTA_INFO.FC_ICD10 IS '������� ��� �������� ��� ���������� ������� ������������'
/

COMMENT ON COLUMN ASU.TKARTA_INFO.FK_MODERNSTANDART IS '����� �� ������������ ASU.TSTANDART.FK_ID'
/


--
-- PK_TKARTA_INFO  (Index) 
--
--  Dependencies: 
--   TKARTA_INFO (Table)
--
CREATE UNIQUE INDEX ASU.PK_TKARTA_INFO ON ASU.TKARTA_INFO
(FK_PACID)
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
-- Non Foreign Key Constraints for Table TKARTA_INFO 
-- 
ALTER TABLE ASU.TKARTA_INFO ADD (
  CONSTRAINT PK_TKARTA_INFO
 PRIMARY KEY
 (FK_PACID)
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

