ALTER TABLE ASU.TPERESEL_DIAG
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TPERESEL_DIAG CASCADE CONSTRAINTS
/

--
-- TPERESEL_DIAG  (Table) 
--
--  Dependencies: 
--   TSMID (Table)
--
CREATE TABLE ASU.TPERESEL_DIAG
(
  FK_PERESEL   NUMBER                           NOT NULL,
  FK_SMID      NUMBER                           NOT NULL,
  FC_CODE      VARCHAR2(10 BYTE),
  FC_CLASS     VARCHAR2(10 BYTE),
  FL_FIRST     NUMBER(15)                       DEFAULT 0,
  FN_MES       INTEGER,
  FN_MES_EXEC  NUMBER(1)                        DEFAULT 1
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             8K
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

COMMENT ON TABLE ASU.TPERESEL_DIAG IS 'Диагнозы перемецений по стационару #21836 Author:Efimov'
/

COMMENT ON COLUMN ASU.TPERESEL_DIAG.FK_PERESEL IS 'TPERESEL.FK_ID  - перемещение по стационару'
/

COMMENT ON COLUMN ASU.TPERESEL_DIAG.FK_SMID IS 'TSMID.FK_ID  - диагноз и ОСС из ветски с синонимом "RAZ_DIAGSCLINIK"'
/

COMMENT ON COLUMN ASU.TPERESEL_DIAG.FC_CODE IS 'Код диагноза, копируется из TSMID.FK_MKB10, чтобы не приходилось каждый раз подтягивать ОСС'
/

COMMENT ON COLUMN ASU.TPERESEL_DIAG.FC_CLASS IS 'Класс диагноза, копируется из TSMID.FK_MKB9, чтобы не приходилось каждый раз подтягивать ОСС'
/

COMMENT ON COLUMN ASU.TPERESEL_DIAG.FL_FIRST IS 'МЭС'
/

COMMENT ON COLUMN ASU.TPERESEL_DIAG.FN_MES_EXEC IS '1 - Стандарт (МЭС) выполнен в полном объёме, 0 - не выполнен в полном объёме'
/


--
-- I_TPERESEL_DIAG_SMID  (Index) 
--
--  Dependencies: 
--   TPERESEL_DIAG (Table)
--
CREATE INDEX ASU.I_TPERESEL_DIAG_SMID ON ASU.TPERESEL_DIAG
(FK_SMID)
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
-- K_TPERESEL_DIAG_PERESEL  (Index) 
--
--  Dependencies: 
--   TPERESEL_DIAG (Table)
--
CREATE UNIQUE INDEX ASU.K_TPERESEL_DIAG_PERESEL ON ASU.TPERESEL_DIAG
(FK_PERESEL)
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
-- Non Foreign Key Constraints for Table TPERESEL_DIAG 
-- 
ALTER TABLE ASU.TPERESEL_DIAG ADD (
  CONSTRAINT K_TPERESEL_DIAG_PERESEL
 PRIMARY KEY
 (FK_PERESEL)
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

-- 
-- Foreign Key Constraints for Table TPERESEL_DIAG 
-- 
ALTER TABLE ASU.TPERESEL_DIAG ADD (
  CONSTRAINT FK_TPERESEL_DIAG_SMID 
 FOREIGN KEY (FK_SMID) 
 REFERENCES ASU.TSMID (FK_ID)
    ON DELETE SET NULL)
/

