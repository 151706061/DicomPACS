DROP TABLE ASU.TASKTABLE CASCADE CONSTRAINTS
/

--
-- TASKTABLE  (Table) 
--
CREATE TABLE ASU.TASKTABLE
(
  FK_ID            NUMBER(15)                   NOT NULL,
  FC_TABLE         VARCHAR2(50 BYTE)            NOT NULL,
  FC_FIELD         VARCHAR2(50 BYTE)            DEFAULT 'FK_ID'               NOT NULL,
  FC_SQL           VARCHAR2(4000 BYTE),
  FC_COMMENT       VARCHAR2(250 BYTE),
  FC_NAMEFIELD     VARCHAR2(50 BYTE)            DEFAULT 0,
  FN_IS_TREETABLE  NUMBER(1)                    DEFAULT 0                     NOT NULL,
  FC_TREE          VARCHAR2(50 BYTE)            DEFAULT 'FK_ID',
  FC_PARENT        VARCHAR2(50 BYTE)            DEFAULT 'FK_PARENT',
  FN_IS_BIGTABLE   NUMBER(1)                    DEFAULT 0
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          16K
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

COMMENT ON TABLE ASU.TASKTABLE IS '“аблицы дл€ настройки соотвтетсвий на цены Author:Efimov'
/

COMMENT ON COLUMN ASU.TASKTABLE.FK_ID IS 'asu.seq_CostConfTable'
/

COMMENT ON COLUMN ASU.TASKTABLE.FC_TABLE IS 'Ќазвание таблицы (с учЄтом схемы)'
/

COMMENT ON COLUMN ASU.TASKTABLE.FC_FIELD IS 'Ќазвание пол€ в таблице FC_TABLE (≈сли задан запрос FC_SQL должно совпадать)'
/

COMMENT ON COLUMN ASU.TASKTABLE.FC_SQL IS '«апрос на который будет заменено FC_TABLE при настройке, если не задано будет использовано содержимое пол€ FC_TABLE'
/

COMMENT ON COLUMN ASU.TASKTABLE.FC_COMMENT IS ' омментарий'
/

COMMENT ON COLUMN ASU.TASKTABLE.FC_NAMEFIELD IS 'ѕоле-название, не об€зательное поле, используетс€ дл€ визуального представлени€ начала и конца страницы при постраничном отображении, емли не задано используетс€ FC_FIELD'
/

COMMENT ON COLUMN ASU.TASKTABLE.FN_IS_TREETABLE IS '0 - не древовидна€ таблица, 1 - древовидна€ таблица'
/

COMMENT ON COLUMN ASU.TASKTABLE.FC_TREE IS 'Ќазвание пол€ по которому определ€етс€ вершина дерева в таблице FC_TABLE'
/

COMMENT ON COLUMN ASU.TASKTABLE.FC_PARENT IS 'Ќазвание пол€ по которому определ€етс€ родитель вершины дерева в таблице FC_TABLE'
/

COMMENT ON COLUMN ASU.TASKTABLE.FN_IS_BIGTABLE IS '0 - таблица загружетс€ сразу, 1 - таблица загружаетс€ постранично'
/


--
-- K_TASKTABLE_ID  (Index) 
--
--  Dependencies: 
--   TASKTABLE (Table)
--
CREATE INDEX ASU.K_TASKTABLE_ID ON ASU.TASKTABLE
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
-- TASKTABLE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TASKTABLE (Table)
--
CREATE OR REPLACE TRIGGER ASU."TASKTABLE_INSERT" 
 BEFORE
  INSERT
 ON ASU.TASKTABLE REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
Begin
  SELECT asu.SEQ_TASKTABLE.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
End;
/
SHOW ERRORS;


