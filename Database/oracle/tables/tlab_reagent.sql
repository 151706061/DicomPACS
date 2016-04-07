ALTER TABLE ASU.TLAB_REAGENT
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TLAB_REAGENT CASCADE CONSTRAINTS
/

--
-- TLAB_REAGENT  (Table) 
--
--  Dependencies: 
--   TSMID (Table)
--
CREATE TABLE ASU.TLAB_REAGENT
(
  FK_SMID     NUMBER                            NOT NULL,
  FC_COMMENT  VARCHAR2(255 CHAR)                NOT NULL
)
TABLESPACE USERS
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

COMMENT ON TABLE ASU.TLAB_REAGENT IS 'ѕредназначена дл€ того чтобы лаборанты могли запрещ€ть назначать анализы, вводитьс€ коментарий почему нельз€ назначать анализ'
/

COMMENT ON COLUMN ASU.TLAB_REAGENT.FK_SMID IS '»дентификатор анализа из TSMID'
/

COMMENT ON COLUMN ASU.TLAB_REAGENT.FC_COMMENT IS ' оментарий к анализу, почему его нельз€ назначать'
/


--
-- CON_LAB_REAGENT_PK  (Index) 
--
--  Dependencies: 
--   TLAB_REAGENT (Table)
--
CREATE UNIQUE INDEX ASU.CON_LAB_REAGENT_PK ON ASU.TLAB_REAGENT
(FK_SMID)
LOGGING
TABLESPACE USERS
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
-- Non Foreign Key Constraints for Table TLAB_REAGENT 
-- 
ALTER TABLE ASU.TLAB_REAGENT ADD (
  CONSTRAINT CON_LAB_REAGENT_PK
 PRIMARY KEY
 (FK_SMID)
    USING INDEX 
    TABLESPACE USERS
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
-- Foreign Key Constraints for Table TLAB_REAGENT 
-- 
ALTER TABLE ASU.TLAB_REAGENT ADD (
  CONSTRAINT CON_LAB_REAGENT_SMID 
 FOREIGN KEY (FK_SMID) 
 REFERENCES ASU.TSMID (FK_ID)
    ON DELETE CASCADE)
/

