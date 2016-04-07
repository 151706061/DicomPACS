ALTER TABLE ASU.TLOG
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TLOG CASCADE CONSTRAINTS
/

--
-- TLOG  (Table) 
--
CREATE TABLE ASU.TLOG
(
  FK_ID         NUMBER(15)                      NOT NULL,
  FC_TABLE      VARCHAR2(32 BYTE),
  FC_FIELD      VARCHAR2(32 BYTE),
  FC_ACTION     VARCHAR2(6 BYTE),
  FC_OLD        VARCHAR2(255 BYTE),
  FC_NEW        VARCHAR2(255 BYTE),
  FC_OSUSER     VARCHAR2(32 BYTE),
  FC_MACHINE    VARCHAR2(32 BYTE),
  FC_TERMINAL   VARCHAR2(32 BYTE),
  FC_MODULE     VARCHAR2(100 BYTE),
  FC_OSFORM     VARCHAR2(32 BYTE),
  FN_USERID     NUMBER(15),
  FD_LOGONTIME  DATE,
  FC_PROCESS    VARCHAR2(15 BYTE),
  FK_OWNER      NUMBER
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
PARTITION BY RANGE (FD_LOGONTIME)
(  
  PARTITION LOG_12 VALUES LESS THAN (TO_DATE(' 2016-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    NOLOGGING
    NOCOMPRESS
    TABLESPACE LOG
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          8M
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION LOG_01 VALUES LESS THAN (TO_DATE(' 2016-02-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    NOLOGGING
    NOCOMPRESS
    TABLESPACE LOG
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          8M
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION LOG_02 VALUES LESS THAN (TO_DATE(' 2016-03-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    NOLOGGING
    NOCOMPRESS
    TABLESPACE LOG
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          8M
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION LOG_03 VALUES LESS THAN (TO_DATE(' 2016-04-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    NOLOGGING
    NOCOMPRESS
    TABLESPACE LOG
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          8M
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION LOG_04 VALUES LESS THAN (TO_DATE(' 2016-05-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    NOLOGGING
    NOCOMPRESS
    TABLESPACE LOG
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          8M
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
               )
)
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING
/

COMMENT ON TABLE ASU.TLOG IS 'Таблица слежения за работой людей  by Kulechek'
/

COMMENT ON COLUMN ASU.TLOG.FK_ID IS 'SEQUENCE=[SEQ_TLOG]'
/

COMMENT ON COLUMN ASU.TLOG.FC_TABLE IS 'таблица'
/

COMMENT ON COLUMN ASU.TLOG.FC_FIELD IS 'поле'
/

COMMENT ON COLUMN ASU.TLOG.FC_ACTION IS 'действие'
/

COMMENT ON COLUMN ASU.TLOG.FC_OLD IS 'старое значение'
/

COMMENT ON COLUMN ASU.TLOG.FC_NEW IS 'новое значение'
/

COMMENT ON COLUMN ASU.TLOG.FC_OSUSER IS 'пользователь ОС'
/

COMMENT ON COLUMN ASU.TLOG.FC_MACHINE IS 'терминала'
/

COMMENT ON COLUMN ASU.TLOG.FC_TERMINAL IS 'название терминала'
/

COMMENT ON COLUMN ASU.TLOG.FC_MODULE IS 'программный модуль'
/

COMMENT ON COLUMN ASU.TLOG.FC_OSFORM IS 'активная форма'
/

COMMENT ON COLUMN ASU.TLOG.FN_USERID IS 'TAPPSOTR.FK_ID'
/

COMMENT ON COLUMN ASU.TLOG.FD_LOGONTIME IS 'время записи'
/

COMMENT ON COLUMN ASU.TLOG.FC_PROCESS IS 'процесс ИД'
/

COMMENT ON COLUMN ASU.TLOG.FK_OWNER IS 'Ссылка на родительский FK_ID'
/


--
-- TLOG_BY_DATE_TABLE_FIELD_ACT  (Index) 
--
--  Dependencies: 
--   TLOG (Table)
--
CREATE INDEX ASU.TLOG_BY_DATE_TABLE_FIELD_ACT ON ASU.TLOG
(FD_LOGONTIME, FC_TABLE, FC_FIELD, FC_ACTION)
NOLOGGING
TABLESPACE LOG_INDX
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
-- TLOG_BY_ID  (Index) 
--
--  Dependencies: 
--   TLOG (Table)
--
CREATE UNIQUE INDEX ASU.TLOG_BY_ID ON ASU.TLOG
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
-- TLOG_BY_NEW  (Index) 
--
--  Dependencies: 
--   TLOG (Table)
--
CREATE INDEX ASU.TLOG_BY_NEW ON ASU.TLOG
(FC_NEW)
NOLOGGING
TABLESPACE LOG_INDX
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
-- TLOG_BY_OLD  (Index) 
--
--  Dependencies: 
--   TLOG (Table)
--
CREATE INDEX ASU.TLOG_BY_OLD ON ASU.TLOG
(FC_OLD)
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
-- TLOG_BY_OWNER_TABLE_FIELD  (Index) 
--
--  Dependencies: 
--   TLOG (Table)
--
CREATE INDEX ASU.TLOG_BY_OWNER_TABLE_FIELD ON ASU.TLOG
(FK_OWNER, FC_TABLE, FC_FIELD, FC_NEW)
NOLOGGING
TABLESPACE LOG_INDX
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
-- TLOG_BY_TABLE_FIELD_ACTION_NEW  (Index) 
--
--  Dependencies: 
--   TLOG (Table)
--
CREATE INDEX ASU.TLOG_BY_TABLE_FIELD_ACTION_NEW ON ASU.TLOG
(FC_TABLE, FC_FIELD, FC_ACTION, FC_NEW)
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
-- TLOG_BY_USER_TABLE_FIELD_ACT  (Index) 
--
--  Dependencies: 
--   TLOG (Table)
--
CREATE INDEX ASU.TLOG_BY_USER_TABLE_FIELD_ACT ON ASU.TLOG
(FN_USERID, FC_TABLE, FC_FIELD, FC_ACTION)
NOLOGGING
TABLESPACE LOG_INDX
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
-- TLOG_TABLE_FIELD_NEW  (Index) 
--
--  Dependencies: 
--   TLOG (Table)
--
CREATE INDEX ASU.TLOG_TABLE_FIELD_NEW ON ASU.TLOG
(FC_TABLE, FC_FIELD, FC_NEW)
NOLOGGING
TABLESPACE LOG_INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          166144K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TLOG_TFUD  (Index) 
--
--  Dependencies: 
--   TLOG (Table)
--
CREATE INDEX ASU.TLOG_TFUD ON ASU.TLOG
(FC_TABLE, FC_FIELD, FC_OSUSER)
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
-- TLOG_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TLOG (Table)
--
CREATE OR REPLACE TRIGGER ASU."TLOG_BEFORE_INSERT" 
 BEFORE 
 INSERT
 ON ASU.TLOG  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
begin
    SELECT SEQ_TLOG.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
end;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TLOG 
-- 
ALTER TABLE ASU.TLOG ADD (
  CONSTRAINT TLOG_BY_ID
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

