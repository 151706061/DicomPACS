DROP TABLE ASU.THOSPITALQUEUE CASCADE CONSTRAINTS
/

--
-- THOSPITALQUEUE  (Table) 
--
CREATE TABLE ASU.THOSPITALQUEUE
(
  FK_ID                 NUMBER(15)              NOT NULL,
  FK_PEPLID             NUMBER(15)              NOT NULL,
  FK_HOSPITAL_REASONID  NUMBER(15)              DEFAULT -1                    NOT NULL,
  FK_SOTRID_ENQUEUE     NUMBER(15),
  FD_ENQUEUE            DATE                    DEFAULT sysdate               NOT NULL,
  FL_STATUS             NUMBER(1)               DEFAULT 1                     NOT NULL,
  FK_SOTRID_STATUS      NUMBER(15),
  FD_STATUS             DATE,
  FK_REMOVED_REASONID   NUMBER(15)              DEFAULT -1                    NOT NULL,
  FK_LPU                NUMBER(15)              DEFAULT -1,
  FK_MKB10              NUMBER(15)              DEFAULT -1,
  FK_GROUP_NABLID       NUMBER(15)              DEFAULT -1,
  FK_SUBGROUP_NABLID    NUMBER(15)              DEFAULT -1,
  FL_PODPIS             NUMBER(1)               DEFAULT 0                     NOT NULL,
  FK_SOTRID_PODPIS      NUMBER(15),
  FK_INSURANCEID        NUMBER(15)              DEFAULT -1,
  FD_REMOVED            DATE,
  FK_SOTRID_REMOVED     NUMBER(15)              DEFAULT -1                    NOT NULL,
  FK_OTDELID            NUMBER(15)              DEFAULT -1                    NOT NULL,
  FK_PACID              NUMBER(15)              DEFAULT -1                    NOT NULL
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
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

COMMENT ON TABLE ASU.THOSPITALQUEUE IS 'Очередь на госпитализацию '
/

COMMENT ON COLUMN ASU.THOSPITALQUEUE.FK_ID IS 'SEQUENCE=[SEQ_THOSPITALQUEUE]'
/

COMMENT ON COLUMN ASU.THOSPITALQUEUE.FK_PEPLID IS 'TPEOPLE.FK_ID - человек, поставленный в очередь'
/

COMMENT ON COLUMN ASU.THOSPITALQUEUE.FK_HOSPITAL_REASONID IS 'Причина госпитализации (синоним - PLANHOSPITAL_REASON    )'
/

COMMENT ON COLUMN ASU.THOSPITALQUEUE.FK_SOTRID_ENQUEUE IS 'Сотрудник, поставивший в очередь'
/

COMMENT ON COLUMN ASU.THOSPITALQUEUE.FD_ENQUEUE IS 'Дата постановки в очередь'
/

COMMENT ON COLUMN ASU.THOSPITALQUEUE.FL_STATUS IS '1 - поставлен в очередь, 0 - удален из очереди, 2 - снят с очереди, 3 - госпитализирован'
/

COMMENT ON COLUMN ASU.THOSPITALQUEUE.FK_SOTRID_STATUS IS 'Сотрудник, изменивший статус'
/

COMMENT ON COLUMN ASU.THOSPITALQUEUE.FD_STATUS IS 'Дата изменения статуса'
/

COMMENT ON COLUMN ASU.THOSPITALQUEUE.FK_REMOVED_REASONID IS 'Причина снятия с очереди (синоним - PLANHOSPITAL_REMOVE)'
/

COMMENT ON COLUMN ASU.THOSPITALQUEUE.FK_LPU IS 'Направившее ЛПУ'
/

COMMENT ON COLUMN ASU.THOSPITALQUEUE.FK_MKB10 IS 'Диагноз по МКБ-10'
/

COMMENT ON COLUMN ASU.THOSPITALQUEUE.FK_GROUP_NABLID IS 'Группа наблюдения'
/

COMMENT ON COLUMN ASU.THOSPITALQUEUE.FK_SUBGROUP_NABLID IS 'Подгруппа наблюдения'
/

COMMENT ON COLUMN ASU.THOSPITALQUEUE.FL_PODPIS IS '1 - подписана запись в очереди, 0 - нет'
/

COMMENT ON COLUMN ASU.THOSPITALQUEUE.FK_SOTRID_PODPIS IS 'Сотрудник, подписавший запись в очереди'
/

COMMENT ON COLUMN ASU.THOSPITALQUEUE.FK_INSURANCEID IS 'Ссылка на выбранный страховой документ пациента'
/

COMMENT ON COLUMN ASU.THOSPITALQUEUE.FD_REMOVED IS 'Дата снятия с очереди'
/

COMMENT ON COLUMN ASU.THOSPITALQUEUE.FK_SOTRID_REMOVED IS 'Сотрудник, снявший с очереди'
/

COMMENT ON COLUMN ASU.THOSPITALQUEUE.FK_OTDELID IS 'Отделение стационара'
/

COMMENT ON COLUMN ASU.THOSPITALQUEUE.FK_PACID IS 'TKARTA.FK_ID. Пока человек стоит в очереди = -1. При госпитализации устанавливается id карты.'
/


--
-- THOSPITALQUEUE_BY_ID  (Index) 
--
--  Dependencies: 
--   THOSPITALQUEUE (Table)
--
CREATE UNIQUE INDEX ASU.THOSPITALQUEUE_BY_ID ON ASU.THOSPITALQUEUE
(FK_ID)
NOLOGGING
TABLESPACE USR
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- THOSPITALQUEUE_BY_PEPLID  (Index) 
--
--  Dependencies: 
--   THOSPITALQUEUE (Table)
--
CREATE INDEX ASU.THOSPITALQUEUE_BY_PEPLID ON ASU.THOSPITALQUEUE
(FK_PEPLID)
NOLOGGING
TABLESPACE USR
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- "thospitalqueue_before_insert"  (Trigger) 
--
--  Dependencies: 
--   THOSPITALQUEUE (Table)
--
CREATE OR REPLACE TRIGGER ASU."thospitalqueue_before_insert" 
  before insert on asu.thospitalqueue
  REFERENCING NEW AS NEW OLD AS OLD
  for each row
declare
  -- local variables here
begin
  select asu.seq_thospitalqueue.nextval into :new.fk_id from dual;
end;
/
SHOW ERRORS;


