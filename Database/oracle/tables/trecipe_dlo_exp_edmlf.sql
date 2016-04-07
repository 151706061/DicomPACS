ALTER TABLE ASU.TRECIPE_DLO_EXP_EDMLF
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TRECIPE_DLO_EXP_EDMLF CASCADE CONSTRAINTS
/

--
-- TRECIPE_DLO_EXP_EDMLF  (Table) 
--
CREATE TABLE ASU.TRECIPE_DLO_EXP_EDMLF
(
  C_MLF       NUMBER,
  NAME_MLF    VARCHAR2(50 BYTE),
  NAME_MLF_L  VARCHAR2(50 BYTE),
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

COMMENT ON TABLE ASU.TRECIPE_DLO_EXP_EDMLF IS 'Справочник единиц измерения массы сыпучих смесей'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_EDMLF.C_MLF IS 'Код единицы веса лекарственной формы'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_EDMLF.NAME_MLF IS 'Название единицы веса лекарственной формы'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_EDMLF.NAME_MLF_L IS 'Название единицы веса лекарственной формы на латыне'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_EDMLF.MSG_TEXT IS 'Комментарий'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_EDMLF.C_FINL IS 'Источник финансирования'
/


--
-- TRECIPE_DLO_EXP_EDMLF_PK  (Index) 
--
--  Dependencies: 
--   TRECIPE_DLO_EXP_EDMLF (Table)
--
CREATE UNIQUE INDEX ASU.TRECIPE_DLO_EXP_EDMLF_PK ON ASU.TRECIPE_DLO_EXP_EDMLF
(C_MLF, C_FINL)
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
-- Non Foreign Key Constraints for Table TRECIPE_DLO_EXP_EDMLF 
-- 
ALTER TABLE ASU.TRECIPE_DLO_EXP_EDMLF ADD (
  CONSTRAINT TRECIPE_DLO_EXP_EDMLF_PK
 PRIMARY KEY
 (C_MLF, C_FINL)
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

