ALTER TABLE ASU.TVAC_PERIOD_TYPE
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TVAC_PERIOD_TYPE CASCADE CONSTRAINTS
/

--
-- TVAC_PERIOD_TYPE  (Table) 
--
CREATE TABLE ASU.TVAC_PERIOD_TYPE
(
  FK_ID           INTEGER                       NOT NULL,
  FC_NAME         VARCHAR2(64 BYTE)             NOT NULL,
  FC_DESCRIPTION  VARCHAR2(128 BYTE)
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

COMMENT ON TABLE ASU.TVAC_PERIOD_TYPE IS 'Условия, относительно которых планируется дата прививки. Author: rca'
/

COMMENT ON COLUMN ASU.TVAC_PERIOD_TYPE.FK_ID IS 'Уникальный идентификатор'
/

COMMENT ON COLUMN ASU.TVAC_PERIOD_TYPE.FC_NAME IS 'Наименование типа периода'
/

COMMENT ON COLUMN ASU.TVAC_PERIOD_TYPE.FC_DESCRIPTION IS 'Описание'
/


--
-- PK_TVAC_PERIOD_TYPE  (Index) 
--
--  Dependencies: 
--   TVAC_PERIOD_TYPE (Table)
--
CREATE UNIQUE INDEX ASU.PK_TVAC_PERIOD_TYPE ON ASU.TVAC_PERIOD_TYPE
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
-- Non Foreign Key Constraints for Table TVAC_PERIOD_TYPE 
-- 
ALTER TABLE ASU.TVAC_PERIOD_TYPE ADD (
  CONSTRAINT PK_TVAC_PERIOD_TYPE
 PRIMARY KEY
 (FK_ID)
    USING INDEX 
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
               ))
/

