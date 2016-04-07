ALTER TABLE ASU.TRECIPE_DLO_EXP_EDVLF
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TRECIPE_DLO_EXP_EDVLF CASCADE CONSTRAINTS
/

--
-- TRECIPE_DLO_EXP_EDVLF  (Table) 
--
CREATE TABLE ASU.TRECIPE_DLO_EXP_EDVLF
(
  C_VLF       NUMBER,
  NAME_VLF    VARCHAR2(50 BYTE),
  NAME_VLF_L  VARCHAR2(50 BYTE),
  MSG_TEXT    VARCHAR2(100 BYTE),
  C_FINL      NUMBER                            DEFAULT 0
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

COMMENT ON TABLE ASU.TRECIPE_DLO_EXP_EDVLF IS 'Cправочник единиц измерения объема жидких смесей и растворов'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_EDVLF.C_VLF IS 'Код единицы объема лекарственной формы'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_EDVLF.NAME_VLF IS 'Название единицы объема лекарственной формы'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_EDVLF.NAME_VLF_L IS 'Название единицы объема лекарственной формы на латыне'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_EDVLF.MSG_TEXT IS 'Комментарий'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_EDVLF.C_FINL IS 'Источник финансирования'
/


--
-- TRECIPE_DLO_EXP_EDVLF_PK  (Index) 
--
--  Dependencies: 
--   TRECIPE_DLO_EXP_EDVLF (Table)
--
CREATE UNIQUE INDEX ASU.TRECIPE_DLO_EXP_EDVLF_PK ON ASU.TRECIPE_DLO_EXP_EDVLF
(C_VLF, C_FINL)
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
-- Non Foreign Key Constraints for Table TRECIPE_DLO_EXP_EDVLF 
-- 
ALTER TABLE ASU.TRECIPE_DLO_EXP_EDVLF ADD (
  CONSTRAINT TRECIPE_DLO_EXP_EDVLF_PK
 PRIMARY KEY
 (C_VLF, C_FINL)
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

