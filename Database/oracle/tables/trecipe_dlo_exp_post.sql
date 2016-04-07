ALTER TABLE ASU.TRECIPE_DLO_EXP_POST
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TRECIPE_DLO_EXP_POST CASCADE CONSTRAINTS
/

--
-- TRECIPE_DLO_EXP_POST  (Table) 
--
CREATE TABLE ASU.TRECIPE_DLO_EXP_POST
(
  NOMK_LS    NUMBER,
  C_LSFO     NUMBER,
  DATE_B     DATE,
  DATE_E     DATE,
  NAME       VARCHAR2(250 BYTE),
  NAME_L     VARCHAR2(250 BYTE),
  PRODUCER   VARCHAR2(200 BYTE),
  COUNTRY    VARCHAR2(250 BYTE),
  NDS_PR     NUMBER(18,8),
  NSP_PR     NUMBER(18,8),
  PSIHI      NUMBER,
  NARKOTA    NUMBER,
  PKU        NUMBER,
  SPEC       NUMBER,
  P_VK       NUMBER,
  UPAK       VARCHAR2(23 BYTE),
  KRATN      NUMBER,
  SPR_TYPE   VARCHAR2(50 BYTE),
  DOZ_ME     NUMBER(18,8),
  CODEPOST   NUMBER,
  ANALG_GRP  NUMBER,
  ANALG_FAS  NUMBER,
  ANALG_DOZ  NUMBER,
  PRIZ_DUBL  NUMBER                             DEFAULT 0,
  PRIZ_BP    NUMBER,
  MSG_TEXT   VARCHAR2(100 BYTE),
  C_FINL     NUMBER                             DEFAULT 0
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

COMMENT ON TABLE ASU.TRECIPE_DLO_EXP_POST IS 'ДЛО.Справочник лекарственных препаратов(SPPOST)'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_POST.NOMK_LS IS 'Номенклатурный код лекарственного средства'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_POST.C_LSFO IS 'Код лекарственного препарата'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_POST.DATE_B IS 'Дата начала действия'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_POST.DATE_E IS 'Дата окончания действия'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_POST.NAME IS 'Наименование ЛП'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_POST.NAME_L IS 'Наименование ЛП на латыне'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_POST.NDS_PR IS 'Процент НДС'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_POST.NSP_PR IS 'Процент НСП'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_POST.PSIHI IS 'Признак сильнодействующих лекарственных средств'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_POST.NARKOTA IS 'Признак наркотических лекарственных средств и ядов'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_POST.PKU IS 'Признак лекарственных средств, подлежащих предметно-количественному учету'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_POST.SPEC IS 'Группы по нозологиям: гемофилия (1), рассеянный склероз (3), миелолейкоз (5), болезнь Гоше (6), муковисцидоз (7), гипофизарный нанизм (8), трансплантация органов (9)'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_POST.P_VK IS 'Признак отпуска по решению врачебной комиссии'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_POST.UPAK IS 'Количество упаковок в заводской упаковке'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_POST.KRATN IS 'Кратность деления вторичной упаковки'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_POST.SPR_TYPE IS 'Номер действующего приказа'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_POST.DOZ_ME IS 'Кратность деления вторичной упаковки'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_POST.CODEPOST IS 'Код поставщика'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_POST.ANALG_GRP IS ' Группа аналогов'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_POST.ANALG_FAS IS 'Фасовка аналогов'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_POST.ANALG_DOZ IS 'Дозировка аналогов'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_POST.PRIZ_DUBL IS 'Признак дублированной или ошибочной записи'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_POST.PRIZ_BP IS 'Признак лечебного питания'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_POST.MSG_TEXT IS 'Комментарий'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_POST.C_FINL IS 'Источник финансирования'
/


--
-- TRECIPE_DLO_EXP_POST_PK  (Index) 
--
--  Dependencies: 
--   TRECIPE_DLO_EXP_POST (Table)
--
CREATE UNIQUE INDEX ASU.TRECIPE_DLO_EXP_POST_PK ON ASU.TRECIPE_DLO_EXP_POST
(C_LSFO, C_FINL)
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
-- Non Foreign Key Constraints for Table TRECIPE_DLO_EXP_POST 
-- 
ALTER TABLE ASU.TRECIPE_DLO_EXP_POST ADD (
  CONSTRAINT TRECIPE_DLO_EXP_POST_PK
 PRIMARY KEY
 (C_LSFO, C_FINL)
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

