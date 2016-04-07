ALTER TABLE ASU.TS_QUEUETYPE
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TS_QUEUETYPE CASCADE CONSTRAINTS
/

--
-- TS_QUEUETYPE  (Table) 
--
CREATE TABLE ASU.TS_QUEUETYPE
(
  FK_ID       NUMBER                            NOT NULL,
  FC_NAME     VARCHAR2(50 BYTE)                 NOT NULL,
  FC_LETTER   CHAR(1 BYTE),
  FN_PROCESS  NUMBER,
  FN_ABSENCE  NUMBER,
  FT_BEGIN    DATE,
  FT_END      DATE,
  FL_ENABLED  NUMBER(1)                         DEFAULT 1
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

COMMENT ON TABLE ASU.TS_QUEUETYPE IS 'тип электронной очереди'
/

COMMENT ON COLUMN ASU.TS_QUEUETYPE.FC_NAME IS 'наименование типа очереди'
/

COMMENT ON COLUMN ASU.TS_QUEUETYPE.FC_LETTER IS 'символьное обозначение(печатается на талоне)'
/

COMMENT ON COLUMN ASU.TS_QUEUETYPE.FN_PROCESS IS 'длительность обработки(сек)'
/

COMMENT ON COLUMN ASU.TS_QUEUETYPE.FN_ABSENCE IS 'длительность неявки(сек)'
/

COMMENT ON COLUMN ASU.TS_QUEUETYPE.FT_BEGIN IS 'вермя начала обслуживания'
/

COMMENT ON COLUMN ASU.TS_QUEUETYPE.FT_END IS 'вермя окончания обслуживания'
/

COMMENT ON COLUMN ASU.TS_QUEUETYPE.FL_ENABLED IS 'активна ли очередь'
/


--
-- TS_QUEUETYPE_PK  (Index) 
--
--  Dependencies: 
--   TS_QUEUETYPE (Table)
--
CREATE UNIQUE INDEX ASU.TS_QUEUETYPE_PK ON ASU.TS_QUEUETYPE
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
-- TS_QUEUETYPE_BI  (Trigger) 
--
--  Dependencies: 
--   TS_QUEUETYPE (Table)
--
CREATE OR REPLACE TRIGGER ASU.ts_queuetype_bi
  before insert ON ASU.TS_QUEUETYPE   referencing new as new
  for each row
begin
  if :new.fk_id is null then
    select seq_queuetype.nextval into :new.fk_id from dual;
  end if;
end ts_queuetype_bi;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TS_QUEUETYPE 
-- 
ALTER TABLE ASU.TS_QUEUETYPE ADD (
  CONSTRAINT TS_QUEUETYPE_PK
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

