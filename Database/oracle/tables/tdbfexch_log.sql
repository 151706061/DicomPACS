DROP TABLE ASU.TDBFEXCH_LOG CASCADE CONSTRAINTS
/

--
-- TDBFEXCH_LOG  (Table) 
--
CREATE TABLE ASU.TDBFEXCH_LOG
(
  FD_START     DATE                             NOT NULL,
  FC_ACTION    VARCHAR2(100 BYTE),
  FC_FUNCTION  VARCHAR2(100 BYTE)
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             8K
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

COMMENT ON TABLE ASU.TDBFEXCH_LOG IS 'Выгрузка в DBF. Лог выгрузки. Очищается и заполняется заново при каждом новом расчёте Author:Efimov'
/

COMMENT ON COLUMN ASU.TDBFEXCH_LOG.FD_START IS 'Время начала действия'
/

COMMENT ON COLUMN ASU.TDBFEXCH_LOG.FC_ACTION IS 'Действие'
/

COMMENT ON COLUMN ASU.TDBFEXCH_LOG.FC_FUNCTION IS 'Функция или процедура к которой относится действие'
/


