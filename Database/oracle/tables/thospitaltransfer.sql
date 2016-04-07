DROP TABLE ASU.THOSPITALTRANSFER CASCADE CONSTRAINTS
/

--
-- THOSPITALTRANSFER  (Table) 
--
CREATE TABLE ASU.THOSPITALTRANSFER
(
  FK_ID               NUMBER(15)                NOT NULL,
  FK_HOSPITALQUEUEID  NUMBER(15)                NOT NULL,
  FD_PLANHOSPITAL     DATE                      NOT NULL,
  FK_SOTRID_TRANSFER  NUMBER(15)                NOT NULL,
  FD_TRANSFER         DATE                      DEFAULT sysdate               NOT NULL,
  FC_REASON           VARCHAR2(1000 BYTE),
  FL_PLANFACT         NUMBER(1)                 DEFAULT 0                     NOT NULL
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

COMMENT ON TABLE ASU.THOSPITALTRANSFER IS '»стори€ переносов дат госпитализации'
/

COMMENT ON COLUMN ASU.THOSPITALTRANSFER.FK_ID IS 'SEQUENCE=[SEQ_THOSPITALTRANSFER]'
/

COMMENT ON COLUMN ASU.THOSPITALTRANSFER.FK_HOSPITALQUEUEID IS 'THOSPITALQUEUE.FK_ID - —сылка на очередь госпитализации'
/

COMMENT ON COLUMN ASU.THOSPITALTRANSFER.FD_PLANHOSPITAL IS 'ѕланируема€/фактическа€ дата госпитализации'
/

COMMENT ON COLUMN ASU.THOSPITALTRANSFER.FK_SOTRID_TRANSFER IS '—отрудник, сделавший перенос даты'
/

COMMENT ON COLUMN ASU.THOSPITALTRANSFER.FD_TRANSFER IS 'ƒата переноса '
/

COMMENT ON COLUMN ASU.THOSPITALTRANSFER.FC_REASON IS 'ѕричина переноса'
/

COMMENT ON COLUMN ASU.THOSPITALTRANSFER.FL_PLANFACT IS '0 - планируема€ дата госпитализации, 1 - фактическа€ дата'
/


--
-- THOSPITALTRANSFER_BY_ID  (Index) 
--
--  Dependencies: 
--   THOSPITALTRANSFER (Table)
--
CREATE UNIQUE INDEX ASU.THOSPITALTRANSFER_BY_ID ON ASU.THOSPITALTRANSFER
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
-- THOSPITALTRANSFER_BY_QUEUE  (Index) 
--
--  Dependencies: 
--   THOSPITALTRANSFER (Table)
--
CREATE INDEX ASU.THOSPITALTRANSFER_BY_QUEUE ON ASU.THOSPITALTRANSFER
(FK_HOSPITALQUEUEID)
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
-- "thosptransfer_before_insert"  (Trigger) 
--
--  Dependencies: 
--   THOSPITALTRANSFER (Table)
--
CREATE OR REPLACE TRIGGER ASU."thosptransfer_before_insert" 
  before insert on asu.thospitaltransfer
  REFERENCING NEW AS NEW OLD AS OLD
  for each row
declare
  -- local variables here
begin
  select asu.seq_thospitaltransfer.nextval into :new.fk_id from dual;
end;
/
SHOW ERRORS;


