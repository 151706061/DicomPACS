DROP TABLE ASU.TRECIPE_DLO_EXP CASCADE CONSTRAINTS
/

--
-- TRECIPE_DLO_EXP  (Table) 
--
CREATE TABLE ASU.TRECIPE_DLO_EXP
(
  FK_ID         NUMBER                          NOT NULL,
  MCOD          NUMBER,
  OGRN          NUMBER,
  PCOD          VARCHAR2(30 BYTE),
  RSERIES       VARCHAR2(10 BYTE),
  RNUMBER       VARCHAR2(16 BYTE),
  RDATE         DATE,
  SNILS         VARCHAR2(14 BYTE),
  DATEBIRTH     DATE,
  IDSEX         VARCHAR2(1 BYTE),
  OKATO         NUMBER(5),
  CODECATEG     VARCHAR2(5 BYTE),
  ONLS          NUMBER(1),
  FINSOURCE     NUMBER,
  PERCENT       NUMBER,
  MKBDIAG       VARCHAR2(7 BYTE),
  MNNTRADE      VARCHAR2(13 BYTE),
  MNNINTEG      VARCHAR2(13 BYTE),
  DOSAGEFORM    VARCHAR2(4 BYTE),
  DOSAGE        VARCHAR2(200 BYTE),
  QTY           NUMBER,
  VALIDITY      NUMBER,
  GLOBAL_ID     VARCHAR2(30 BYTE),
  PSERIES       VARCHAR2(10 BYTE),
  PNUMBER       VARCHAR2(16 BYTE),
  FK_RECIPE_ID  NUMBER,
  FK_LGOT_ID    NUMBER,
  FK_SP_TOV     NUMBER,
  FL_EXPORTED   NUMBER                          DEFAULT 0,
  FD_EXPORT     DATE,
  CATEGORYTYPE  NUMBER
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

COMMENT ON TABLE ASU.TRECIPE_DLO_EXP IS 'Таблица для сбора информации по ДЛО для выгрузки в dbf (федеральные и региональные рецепты). Author:Voronov'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP.MCOD IS 'Код медицинского учреждения. Справочник LPU.dbf (кодировка ОФОМС). 10 цифр.'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP.OGRN IS 'ОГРН медицинского учреждения. 15 цифр.'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP.PCOD IS 'Идентификационный код врача. В соответствии с регистром врачей, имеющим право на выписку льготных рецептов'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP.RSERIES IS 'Серия рецепта. 4 знака.'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP.RNUMBER IS 'Номер рецепта. 16 цифр.'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP.RDATE IS 'Дата выписки рецепта'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP.SNILS IS 'СНИЛС гражданина'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP.DATEBIRTH IS 'Дата рождения'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP.IDSEX IS 'Пол. Только буквы М или Ж в верхнем регистре'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP.OKATO IS 'Код территории постоянной регистрации гражданина  (по ОКАТО)'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP.CODECATEG IS 'Код категории льготности. Справочник fed_k.dbf'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP.ONLS IS 'Программа ЛЛО. 1 – 7 нозологий, 0 - ОНЛС (только фед.)'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP.FINSOURCE IS 'источник финансирования. 1 – Федеральный, 2 – Субъект РФ, 3 – Муниципальный бюджет'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP.PERCENT IS 'процент  льготы рецепта. 3 цифры'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP.MKBDIAG IS 'диагноз заболевания, по которому выписан рецепт. МКБ-10.'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP.MNNTRADE IS 'Код торговое наименование выписанного лекарственного средства (ЛС). Справочник Sp_TRN.dbf'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP.MNNINTEG IS 'Код международное непатентованное наименование выписанного лекарственного средства (ЛС). Справочник Sp_MNN.dbf'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP.DOSAGEFORM IS 'Код лекарственная форма ЛС. Справочник Sp_LF.dbf'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP.DOSAGE IS 'дозировка ЛС'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP.QTY IS 'выписанное количество единиц лекарственной формы ЛС;'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP.VALIDITY IS 'срок действия рецепта (14 дней или 1 месяц). 1- месяц,2 - 14 дней; (только фед.)'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP.GLOBAL_ID IS 'Необязательное поле. Глобальный код пациента, присваиваемый ОФОМС (только рег.)'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP.PSERIES IS 'Необязательное поле. Серия страхового полиса (только рег.)'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP.PNUMBER IS 'Номер страхового полиса. 16 цифр. (только рег.)'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP.FK_RECIPE_ID IS 'ASU.TRECIPE.FK_ID - ссылка на рецепт, по которому делается соответствие'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP.FK_LGOT_ID IS 'asu.trecipe_dlo_exp_lgot.fk_id - ссылка на льготу - поскольку некоторые коды региональной и федеральной льготы совпадают'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP.FK_SP_TOV IS 'ссылка на медикамент (SP_TOV.DBF)'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP.FL_EXPORTED IS 'запись была экспортирована (1 - да, 0 - нет)'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP.FD_EXPORT IS 'дата выгрузки'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP.CATEGORYTYPE IS 'Тип категории льготности (1-федеральный, 2-региональный, 3-7 нозологий, 4-орфанный)'
/


--
-- TRECIPE_DLO_EXP_FK_ID  (Index) 
--
--  Dependencies: 
--   TRECIPE_DLO_EXP (Table)
--
CREATE UNIQUE INDEX ASU.TRECIPE_DLO_EXP_FK_ID ON ASU.TRECIPE_DLO_EXP
(FK_ID)
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
-- TRECIPE_DLO_EXP_FK_RECIPE  (Index) 
--
--  Dependencies: 
--   TRECIPE_DLO_EXP (Table)
--
CREATE INDEX ASU.TRECIPE_DLO_EXP_FK_RECIPE ON ASU.TRECIPE_DLO_EXP
(FK_RECIPE_ID)
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
-- TRECIPE_DLO_EXP_FL_EXPORTED  (Index) 
--
--  Dependencies: 
--   TRECIPE_DLO_EXP (Table)
--
CREATE INDEX ASU.TRECIPE_DLO_EXP_FL_EXPORTED ON ASU.TRECIPE_DLO_EXP
(FL_EXPORTED)
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
-- TRECIPE_DLO_EXP_INS  (Trigger) 
--
--  Dependencies: 
--   TRECIPE_DLO_EXP (Table)
--
CREATE OR REPLACE TRIGGER ASU."TRECIPE_DLO_EXP_INS" 
 BEFORE
  INSERT
 ON asu.trecipe_dlo_exp
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
  if :new.fk_id is null then
    select ASU.SEQ_TRECIPE_DLO_EXP.NEXTVAL into :new.fk_id from dual;
  end if;
end;
/
SHOW ERRORS;


