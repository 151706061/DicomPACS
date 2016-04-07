ALTER TABLE ASU.TEQUEUE
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TEQUEUE CASCADE CONSTRAINTS
/

--
-- TEQUEUE  (Table) 
--
CREATE TABLE ASU.TEQUEUE
(
  FK_ID           NUMBER                        NOT NULL,
  FD_DATE         DATE,
  FC_TALON        VARCHAR2(10 BYTE),
  FK_EQUEUETYPE   NUMBER,
  FD_PROCESSDATE  DATE,
  FL_PROCESS      NUMBER,
  FK_SOTRID       NUMBER,
  FK_WINDOW       NUMBER,
  FD_CALLDATE     DATE,
  FT_PLAN         DATE,
  FK_PACID        NUMBER
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

COMMENT ON TABLE ASU.TEQUEUE IS 'электронная очередь'
/

COMMENT ON COLUMN ASU.TEQUEUE.FD_DATE IS 'дата и время выдачи талона'
/

COMMENT ON COLUMN ASU.TEQUEUE.FC_TALON IS 'номер талона'
/

COMMENT ON COLUMN ASU.TEQUEUE.FK_EQUEUETYPE IS 'id типа очереди'
/

COMMENT ON COLUMN ASU.TEQUEUE.FD_PROCESSDATE IS 'дата'
/

COMMENT ON COLUMN ASU.TEQUEUE.FL_PROCESS IS 'тип обработки(0-прием, 1-неявка)'
/

COMMENT ON COLUMN ASU.TEQUEUE.FK_SOTRID IS 'id сотрудника'
/

COMMENT ON COLUMN ASU.TEQUEUE.FK_WINDOW IS 'id окна'
/

COMMENT ON COLUMN ASU.TEQUEUE.FD_CALLDATE IS 'дата и время вызова к окну'
/

COMMENT ON COLUMN ASU.TEQUEUE.FT_PLAN IS 'планируемое время обработки'
/

COMMENT ON COLUMN ASU.TEQUEUE.FK_PACID IS 'ID человека'
/


--
-- TEQUEUE_FK_WINDOW  (Index) 
--
--  Dependencies: 
--   TEQUEUE (Table)
--
CREATE INDEX ASU.TEQUEUE_FK_WINDOW ON ASU.TEQUEUE
(FK_WINDOW)
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
-- TEQUEUE_PK  (Index) 
--
--  Dependencies: 
--   TEQUEUE (Table)
--
CREATE UNIQUE INDEX ASU.TEQUEUE_PK ON ASU.TEQUEUE
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
-- TEQUEUE_BI  (Trigger) 
--
--  Dependencies: 
--   TEQUEUE (Table)
--
CREATE OR REPLACE TRIGGER ASU.tequeue_bi
  before insert ON ASU.TEQUEUE   referencing new as new
  for each row
begin
  if :new.fk_id is null then
    select seq_tequeue.nextval into :new.fk_id from dual;
  end if;
end tequeue_bi;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TEQUEUE 
-- 
ALTER TABLE ASU.TEQUEUE ADD (
  CONSTRAINT TEQUEUE_PK
 PRIMARY KEY
 (FK_ID)
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

