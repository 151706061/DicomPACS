ALTER TABLE ASU.TOFOMS_INFO
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TOFOMS_INFO CASCADE CONSTRAINTS
/

--
-- TOFOMS_INFO  (Table) 
--
CREATE TABLE ASU.TOFOMS_INFO
(
  FK_INSURANCEID  NUMBER                        NOT NULL,
  FC_FAM          VARCHAR2(4000 BYTE),
  FC_IM           VARCHAR2(4000 BYTE),
  FC_OTCH         VARCHAR2(4000 BYTE)
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

COMMENT ON TABLE ASU.TOFOMS_INFO IS 'ФИО Офомса у полиса Author: Marriage'
/


--
-- PK_TOFOMS_INFO  (Index) 
--
--  Dependencies: 
--   TOFOMS_INFO (Table)
--
CREATE UNIQUE INDEX ASU.PK_TOFOMS_INFO ON ASU.TOFOMS_INFO
(FK_INSURANCEID)
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
-- Non Foreign Key Constraints for Table TOFOMS_INFO 
-- 
ALTER TABLE ASU.TOFOMS_INFO ADD (
  CONSTRAINT PK_TOFOMS_INFO
 PRIMARY KEY
 (FK_INSURANCEID)
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

