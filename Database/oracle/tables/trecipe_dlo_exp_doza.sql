DROP TABLE ASU.TRECIPE_DLO_EXP_DOZA CASCADE CONSTRAINTS
/

--
-- TRECIPE_DLO_EXP_DOZA  (Table) 
--
CREATE TABLE ASU.TRECIPE_DLO_EXP_DOZA
(
  C_DLS       NUMBER,
  NAME_DLS    VARCHAR2(50 BYTE),
  NAME_DLS_L  VARCHAR2(50 BYTE),
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
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING
/

COMMENT ON TABLE ASU.TRECIPE_DLO_EXP_DOZA IS 'Справочник единиц измерения доз медикаментов. Для федеральных медикаментов (заполняется из импортом из Sp_doza.DBF). Author:Voronov'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_DOZA.C_DLS IS 'Код единицы измерения дозировки'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_DOZA.NAME_DLS IS 'Название единицы измерения дозировки'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_DOZA.NAME_DLS_L IS 'Название единицы измерения дозировки на латыни'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_DOZA.MSG_TEXT IS 'Комментарий'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_DOZA.C_FINL IS 'Источник финансирования'
/


--
-- TRECIPE_DLO_EXP_DOZA_KEY  (Index) 
--
--  Dependencies: 
--   TRECIPE_DLO_EXP_DOZA (Table)
--
CREATE UNIQUE INDEX ASU.TRECIPE_DLO_EXP_DOZA_KEY ON ASU.TRECIPE_DLO_EXP_DOZA
(C_DLS, C_FINL)
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


