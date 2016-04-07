ALTER TABLE ASU.TLASTNAZS
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TLASTNAZS CASCADE CONSTRAINTS
/

--
-- TLASTNAZS  (Table) 
--
CREATE TABLE ASU.TLASTNAZS
(
  FK_PACID             NUMBER                   NOT NULL,
  FK_KONSID            NUMBER,
  FK_ISSLEDID          NUMBER,
  FK_ANALID            NUMBER,
  FK_PROCID            NUMBER,
  FD_KONSINSDATE       DATE,
  FD_ISSLEDINSDATE     DATE,
  FD_ANALINSDATE       DATE,
  FD_PROCINSDATE       DATE,
  FK_FIZIOPROCID       NUMBER,
  FD_FIZIOPROCINSDATE  DATE,
  FK_FIZIOKONSID       NUMBER,
  FD_FIZIOKONSINSDATE  DATE
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

COMMENT ON COLUMN ASU.TLASTNAZS.FK_PACID IS 'ѕац'
/

COMMENT ON COLUMN ASU.TLASTNAZS.FK_KONSID IS 'последн€€ консультаци€ выполненна€'
/

COMMENT ON COLUMN ASU.TLASTNAZS.FK_ISSLEDID IS 'последнее выполненное исследование'
/

COMMENT ON COLUMN ASU.TLASTNAZS.FK_ANALID IS 'последнее выполненное исслдование'
/

COMMENT ON COLUMN ASU.TLASTNAZS.FK_PROCID IS 'последнее выполненное процедура'
/

COMMENT ON COLUMN ASU.TLASTNAZS.FK_FIZIOPROCID IS 'ѕоследн€€ физиопроцедура'
/

COMMENT ON COLUMN ASU.TLASTNAZS.FD_FIZIOPROCINSDATE IS 'ƒјта выполнени€ последней физиопроцедуры'
/


--
-- PK_TLASTNAZS  (Index) 
--
--  Dependencies: 
--   TLASTNAZS (Table)
--
CREATE UNIQUE INDEX ASU.PK_TLASTNAZS ON ASU.TLASTNAZS
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
-- TLASTNAZS_FIZIOKONSID  (Index) 
--
--  Dependencies: 
--   TLASTNAZS (Table)
--
CREATE UNIQUE INDEX ASU.TLASTNAZS_FIZIOKONSID ON ASU.TLASTNAZS
(FK_FIZIOKONSID)
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
-- TLASTNAZS_FK_KONSID  (Index) 
--
--  Dependencies: 
--   TLASTNAZS (Table)
--
CREATE INDEX ASU.TLASTNAZS_FK_KONSID ON ASU.TLASTNAZS
(FK_KONSID)
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
-- Non Foreign Key Constraints for Table TLASTNAZS 
-- 
ALTER TABLE ASU.TLASTNAZS ADD (
  CONSTRAINT PK_TLASTNAZS
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

