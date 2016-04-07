ALTER TABLE ASU.TS_QUEUEWINDOWS
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TS_QUEUEWINDOWS CASCADE CONSTRAINTS
/

--
-- TS_QUEUEWINDOWS  (Table) 
--
CREATE TABLE ASU.TS_QUEUEWINDOWS
(
  FK_ID       NUMBER                            NOT NULL,
  FC_NAME     VARCHAR2(50 BYTE)                 NOT NULL,
  FL_ENABLED  NUMBER                            DEFAULT 1                     NOT NULL,
  FL_PAUSED   NUMBER                            DEFAULT 1                     NOT NULL
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

COMMENT ON TABLE ASU.TS_QUEUEWINDOWS IS 'окна регистратуры'
/

COMMENT ON COLUMN ASU.TS_QUEUEWINDOWS.FC_NAME IS 'название или номер окна'
/

COMMENT ON COLUMN ASU.TS_QUEUEWINDOWS.FL_ENABLED IS 'работает ли окно'
/

COMMENT ON COLUMN ASU.TS_QUEUEWINDOWS.FL_PAUSED IS 'поставлено на паузу'
/


--
-- TS_QUEUEWINDOWS_PK  (Index) 
--
--  Dependencies: 
--   TS_QUEUEWINDOWS (Table)
--
CREATE UNIQUE INDEX ASU.TS_QUEUEWINDOWS_PK ON ASU.TS_QUEUEWINDOWS
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
-- TS_QUEUEWINDOWS_BI  (Trigger) 
--
--  Dependencies: 
--   TS_QUEUEWINDOWS (Table)
--
CREATE OR REPLACE TRIGGER ASU.ts_queuewindows_bi
  before insert ON ASU.TS_QUEUEWINDOWS   referencing new as new
  for each row
begin
  if :new.fk_id is null then
    select seq_ts_queuewindows.nextval into :new.fk_id from dual;
  end if;
end ts_queuewindows_bi;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TS_QUEUEWINDOWS 
-- 
ALTER TABLE ASU.TS_QUEUEWINDOWS ADD (
  CONSTRAINT TS_QUEUEWINDOWS_PK
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

