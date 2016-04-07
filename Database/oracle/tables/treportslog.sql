ALTER TABLE ASU.TREPORTSLOG
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TREPORTSLOG CASCADE CONSTRAINTS
/

--
-- TREPORTSLOG  (Table) 
--
CREATE TABLE ASU.TREPORTSLOG
(
  FK_ID        NUMBER                           NOT NULL,
  FK_REPORTID  NUMBER                           NOT NULL,
  FK_SOTRID    NUMBER                           NOT NULL,
  FC_MACHINE   VARCHAR2(50 BYTE),
  FC_OSUSER    VARCHAR2(50 BYTE),
  FD_DATE      DATE                             DEFAULT SYSDATE
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

COMMENT ON TABLE ASU.TREPORTSLOG IS 'таблица логов построения отчетов'
/

COMMENT ON COLUMN ASU.TREPORTSLOG.FK_ID IS 'уникальный идентификатор'
/

COMMENT ON COLUMN ASU.TREPORTSLOG.FK_REPORTID IS 'код отчета, ссылка на таблицу ASU.TREPORTSPREF'
/

COMMENT ON COLUMN ASU.TREPORTSLOG.FK_SOTRID IS 'код сотрудника, ссылка на таблицу LOGIN.TSOTR'
/

COMMENT ON COLUMN ASU.TREPORTSLOG.FC_MACHINE IS 'имя компьютера из v$session'
/

COMMENT ON COLUMN ASU.TREPORTSLOG.FC_OSUSER IS 'имя пользователя из v$session'
/

COMMENT ON COLUMN ASU.TREPORTSLOG.FD_DATE IS 'дата создания записи'
/


--
-- TREPORTSLOG_FK_ID  (Index) 
--
--  Dependencies: 
--   TREPORTSLOG (Table)
--
CREATE UNIQUE INDEX ASU.TREPORTSLOG_FK_ID ON ASU.TREPORTSLOG
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
-- TREPORTSLOG_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TREPORTSLOG (Table)
--
CREATE OR REPLACE TRIGGER ASU."TREPORTSLOG_BEFORE_INSERT" 
BEFORE INSERT
ON ASU.TREPORTSLOG REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
Begin
  select ASU.SEQ_TREPORTSLOG.nextval into :new.FK_ID from dual;
End;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TREPORTSLOG 
-- 
ALTER TABLE ASU.TREPORTSLOG ADD (
  CONSTRAINT TREPORTSLOG_FK_ID
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

