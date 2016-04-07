ALTER TABLE ASU.TDOPRIZYV
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TDOPRIZYV CASCADE CONSTRAINTS
/

--
-- TDOPRIZYV  (Table) 
--
CREATE TABLE ASU.TDOPRIZYV
(
  FK_PEPLID   NUMBER                            NOT NULL,
  FD_SETUP    DATE                              NOT NULL,
  FK_DIAG1ID  NUMBER                            NOT NULL,
  FD_DATE     DATE                              NOT NULL,
  FK_VRACHID  NUMBER                            NOT NULL
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

COMMENT ON TABLE ASU.TDOPRIZYV IS 'ƒанные о допризывниках -- Created by Galtsev I.A. 13/05/2010'
/

COMMENT ON COLUMN ASU.TDOPRIZYV.FK_PEPLID IS 'ID призывника = TPEOPLES.FK_ID'
/

COMMENT ON COLUMN ASU.TDOPRIZYV.FD_SETUP IS 'ƒата постановки на воинский учЄт'
/

COMMENT ON COLUMN ASU.TDOPRIZYV.FK_DIAG1ID IS 'ID первичного диагноза = TSMID.FK_ID'
/

COMMENT ON COLUMN ASU.TDOPRIZYV.FD_DATE IS 'ƒата создани€/обновлени€ записи'
/

COMMENT ON COLUMN ASU.TDOPRIZYV.FK_VRACHID IS 'ID врача, сделавшего запись'
/


--
-- TDOPRIZYV_PEOPL  (Index) 
--
--  Dependencies: 
--   TDOPRIZYV (Table)
--
CREATE UNIQUE INDEX ASU.TDOPRIZYV_PEOPL ON ASU.TDOPRIZYV
(FK_PEPLID)
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
-- Non Foreign Key Constraints for Table TDOPRIZYV 
-- 
ALTER TABLE ASU.TDOPRIZYV ADD (
  CONSTRAINT TDOPRIZYV_PEOPL
 PRIMARY KEY
 (FK_PEPLID)
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

