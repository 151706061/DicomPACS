DROP TABLE ASU.TNAZMED_PARAM CASCADE CONSTRAINTS
/

--
-- TNAZMED_PARAM  (Table) 
--
CREATE TABLE ASU.TNAZMED_PARAM
(
  FK_TNAZMEDID  NUMBER(10)                      NOT NULL,
  FL_LGOT       NUMBER(1)                       DEFAULT 0,
  FK_DURATION   NUMBER(10),
  FK_PERCENT    NUMBER(10),
  FK_PAYTYPE    NUMBER(10),
  FK_TYPE       NUMBER(10),
  FC_VRACHFIO   VARCHAR2(120 BYTE),
  FK_TSOTRID    NUMBER                          DEFAULT -1,
  FK_SMDIAGID   NUMBER(15)                      DEFAULT -1                    NOT NULL
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

COMMENT ON TABLE ASU.TNAZMED_PARAM IS 'Таблица содержит параметры медикаментозного назначения (TNAZMED), которые помогают формировать рецепты: вид рецепта, срок годности, проц. оплаты и т.д.'
/

COMMENT ON COLUMN ASU.TNAZMED_PARAM.FK_TNAZMEDID IS 'Ссылка на TNAZMED.FK_ID'
/

COMMENT ON COLUMN ASU.TNAZMED_PARAM.FL_LGOT IS '0 - обычный (107у); 1 - форма (148-1/У-06(л) (льготный-ФЕДЕРАЛЬНЫЙ); 2 - 148-1/У-88 (льготный-РЕГИОНАЛЬНЫЙ)'
/

COMMENT ON COLUMN ASU.TNAZMED_PARAM.FK_DURATION IS 'Код срока действий (см. т. TRecipeDuration)'
/

COMMENT ON COLUMN ASU.TNAZMED_PARAM.FK_PERCENT IS 'Код процента оплаты (см. т. TRecipePercent)'
/

COMMENT ON COLUMN ASU.TNAZMED_PARAM.FK_PAYTYPE IS 'Код источник финансирования (см. т. TRecipePaytype)'
/

COMMENT ON COLUMN ASU.TNAZMED_PARAM.FK_TYPE IS 'Код типа рецепта (см. т. TRecipeType)'
/

COMMENT ON COLUMN ASU.TNAZMED_PARAM.FC_VRACHFIO IS 'Фио врача назначевшего препарат'
/

COMMENT ON COLUMN ASU.TNAZMED_PARAM.FK_TSOTRID IS 'Ссылка на запись врача, назначевшего препарат'
/

COMMENT ON COLUMN ASU.TNAZMED_PARAM.FK_SMDIAGID IS 'ID диагноза из TSMID. (используется для получения MKB10 GET_MKB10_FROM_TSMID(FK_SMDIAGID))  это поле FK_MKB_10'
/


