ALTER TABLE ASU.TRIGHTS
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TRIGHTS CASCADE CONSTRAINTS
/

--
-- TRIGHTS  (Table) 
--
CREATE TABLE ASU.TRIGHTS
(
  FK_ID       INTEGER                           NOT NULL,
  FC_NAME     VARCHAR2(50 BYTE)                 NOT NULL,
  FC_COMMENT  VARCHAR2(250 BYTE),
  FC_GROUPE   VARCHAR2(15 BYTE)
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          160K
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

COMMENT ON TABLE ASU.TRIGHTS IS 'Права в системе'
/

COMMENT ON COLUMN ASU.TRIGHTS.FC_NAME IS 'Название'
/

COMMENT ON COLUMN ASU.TRIGHTS.FC_COMMENT IS 'Комментраий'
/

COMMENT ON COLUMN ASU.TRIGHTS.FC_GROUPE IS 'поле для группировки, чисто для визуального удобсва'
/


--
-- PK_TRIGHTS  (Index) 
--
--  Dependencies: 
--   TRIGHTS (Table)
--
CREATE UNIQUE INDEX ASU.PK_TRIGHTS ON ASU.TRIGHTS
(FK_ID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          128K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


-- 
-- Non Foreign Key Constraints for Table TRIGHTS 
-- 
ALTER TABLE ASU.TRIGHTS ADD (
  CONSTRAINT PK_TRIGHTS
 PRIMARY KEY
 (FK_ID)
    USING INDEX 
    TABLESPACE INDX
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          128K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
               ))
/

