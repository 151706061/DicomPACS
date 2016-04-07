ALTER TABLE ASU.TUSLVID_INFO
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TUSLVID_INFO CASCADE CONSTRAINTS
/

--
-- TUSLVID_INFO  (Table) 
--
CREATE TABLE ASU.TUSLVID_INFO
(
  FK_USLVID         NUMBER,
  FL_DOUBLE_REGIST  NUMBER
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

COMMENT ON TABLE ASU.TUSLVID_INFO IS '25.09.2012 Информация по видам услуг, чтобы не перекомпиливались зависимвые от TUSLVID объеты by Marriage'
/


--
-- PK_USLVID_INFO  (Index) 
--
--  Dependencies: 
--   TUSLVID_INFO (Table)
--
CREATE UNIQUE INDEX ASU.PK_USLVID_INFO ON ASU.TUSLVID_INFO
(FK_USLVID)
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
-- Non Foreign Key Constraints for Table TUSLVID_INFO 
-- 
ALTER TABLE ASU.TUSLVID_INFO ADD (
  CONSTRAINT PK_USLVID_INFO
 PRIMARY KEY
 (FK_USLVID)
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

