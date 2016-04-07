DROP TABLE ASU.TRECIPE_DLO_EXP_TRN CASCADE CONSTRAINTS
/

--
-- TRECIPE_DLO_EXP_TRN  (Table) 
--
CREATE TABLE ASU.TRECIPE_DLO_EXP_TRN
(
  C_TRN       NUMBER,
  NAME_TRN_R  VARCHAR2(254 BYTE),
  NAME_TRN_L  VARCHAR2(254 BYTE),
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

COMMENT ON TABLE ASU.TRECIPE_DLO_EXP_TRN IS '“аблица с торговыми названи€ми медикаментов. Author:Voronov'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_TRN.NAME_TRN_R IS 'русское название'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_TRN.NAME_TRN_L IS 'латинское название'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_TRN.MSG_TEXT IS ' омментарий'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_TRN.PRIZ_DUBL IS 'ѕризнак дублированной или ошибочной записи'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_TRN.DATE_E IS 'ƒата окончани€ действи€ данного кода лекарственной формы'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_TRN.C_FINL IS '»сточник финансировани€'
/


--
-- TRECIPE_DLO_EXP_TRN_KEY  (Index) 
--
--  Dependencies: 
--   TRECIPE_DLO_EXP_TRN (Table)
--
CREATE UNIQUE INDEX ASU.TRECIPE_DLO_EXP_TRN_KEY ON ASU.TRECIPE_DLO_EXP_TRN
(C_TRN, C_FINL)
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


