DROP TABLE ASU.TTREB CASCADE CONSTRAINTS
/

--
-- TTREB  (Table) 
--
CREATE TABLE ASU.TTREB
(
  FK_ID            NUMBER(9)                    NOT NULL,
  FC_NUM           VARCHAR2(20 BYTE),
  FK_MATOTVSOTRID  NUMBER(9),
  FK_RAZRSOTRID    NUMBER(9),
  FK_POLUCHSOTRID  NUMBER(9),
  FK_VYDALSOTRID   NUMBER(9),
  FC_COMMENT       VARCHAR2(255 BYTE),
  FL_INOUT         NUMBER(1),
  FD_DATA          DATE
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          520K
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

COMMENT ON TABLE ASU.TTREB IS 'Таблицы входных и выходных требований в аптеке на медикаменты'
/

COMMENT ON COLUMN ASU.TTREB.FK_ID IS 'Код'
/

COMMENT ON COLUMN ASU.TTREB.FC_NUM IS 'Код требования внутри учреждения'
/

COMMENT ON COLUMN ASU.TTREB.FK_MATOTVSOTRID IS 'Код мат отвю сотрудника, который сформировал требование на основе запросов врачей'
/

COMMENT ON COLUMN ASU.TTREB.FK_RAZRSOTRID IS 'код сотруднки который подписал требование к исполнению'
/

COMMENT ON COLUMN ASU.TTREB.FK_POLUCHSOTRID IS 'кому выдали эти медикаменты'
/

COMMENT ON COLUMN ASU.TTREB.FK_VYDALSOTRID IS 'кто выдал эти медикаменты'
/

COMMENT ON COLUMN ASU.TTREB.FC_COMMENT IS 'Комментарий'
/

COMMENT ON COLUMN ASU.TTREB.FL_INOUT IS 'при = 1 это трбование до получения м.м., =0 требование скорректированно после получения из аптеки'
/

COMMENT ON COLUMN ASU.TTREB.FD_DATA IS 'Дата'
/


