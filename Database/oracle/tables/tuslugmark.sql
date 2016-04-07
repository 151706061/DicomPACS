ALTER TABLE ASU.TUSLUGMARK
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TUSLUGMARK CASCADE CONSTRAINTS
/

--
-- TUSLUGMARK  (Table) 
--
CREATE TABLE ASU.TUSLUGMARK
(
  FC_NAME  VARCHAR2(255 BYTE)                   NOT NULL,
  FK_ID    NUMBER                               NOT NULL
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

COMMENT ON TABLE ASU.TUSLUGMARK IS 'Ioiaoee oneoa, ni?aai?iee Author:A.Nakorjakov'
/

COMMENT ON COLUMN ASU.TUSLUGMARK.FC_NAME IS 'Eiiiaioa?ee e oneoaa'
/

COMMENT ON COLUMN ASU.TUSLUGMARK.FK_ID IS 'UID'
/


--
-- PK_TUSLUGMARK  (Index) 
--
--  Dependencies: 
--   TUSLUGMARK (Table)
--
CREATE UNIQUE INDEX ASU.PK_TUSLUGMARK ON ASU.TUSLUGMARK
(FC_NAME)
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
-- TUSLUGMARK_UID  (Index) 
--
--  Dependencies: 
--   TUSLUGMARK (Table)
--
CREATE UNIQUE INDEX ASU.TUSLUGMARK_UID ON ASU.TUSLUGMARK
(FK_ID)
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
-- TUSLUGMARK_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TUSLUGMARK (Table)
--
CREATE OR REPLACE TRIGGER ASU.tuslugmark_before_insert
 BEFORE
  INSERT
 ON ASU.TUSLUGMARK REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
declare

begin
select seq_tuslugmark.nextval into :new.fk_id from dual;
end TUSLUGMARK_BEFORE_INSERT;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TUSLUGMARK 
-- 
ALTER TABLE ASU.TUSLUGMARK ADD (
  CONSTRAINT PK_TUSLUGMARK
 PRIMARY KEY
 (FC_NAME)
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

