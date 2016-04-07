DROP TABLE ASU.TRECIPE_DLO_EXP_MNN CASCADE CONSTRAINTS
/

--
-- TRECIPE_DLO_EXP_MNN  (Table) 
--
CREATE TABLE ASU.TRECIPE_DLO_EXP_MNN
(
  C_MNN       NUMBER,
  NAME_MNN_R  VARCHAR2(200 BYTE),
  NAME_MNN_L  VARCHAR2(200 BYTE),
  MSG_TEXT    VARCHAR2(1000 BYTE),
  PRIZ_DUBL   NUMBER                            DEFAULT 0,
  DATE_E      DATE,
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
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING
/

COMMENT ON TABLE ASU.TRECIPE_DLO_EXP_MNN IS 'Таблица с международными непатентованными названиями. Author:Voronov'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_MNN.NAME_MNN_R IS 'русское название'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_MNN.NAME_MNN_L IS 'латинское название'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_MNN.MSG_TEXT IS 'Комментарий'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_MNN.PRIZ_DUBL IS 'Признак дублированной или ошибочной записи'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_MNN.DATE_E IS 'Дата окончания действия данного кода лекарственной формы '
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_MNN.C_FINL IS 'Источник финансирования'
/


--
-- TRECIPE_DLO_EXP_MNN_KEY  (Index) 
--
--  Dependencies: 
--   TRECIPE_DLO_EXP_MNN (Table)
--
CREATE UNIQUE INDEX ASU.TRECIPE_DLO_EXP_MNN_KEY ON ASU.TRECIPE_DLO_EXP_MNN
(C_MNN, C_FINL)
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


