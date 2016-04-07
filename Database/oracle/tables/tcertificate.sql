ALTER TABLE ASU.TCERTIFICATE
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TCERTIFICATE CASCADE CONSTRAINTS
/

--
-- TCERTIFICATE  (Table) 
--
CREATE TABLE ASU.TCERTIFICATE
(
  FK_ID      NUMBER(15)                         NOT NULL,
  FC_NUM     VARCHAR2(100 BYTE),
  FN_SUM     NUMBER(15,2),
  FD_BEGIN   DATE,
  FD_END     DATE,
  FK_PEPLID  NUMBER(15),
  FK_SOTRID  NUMBER(15),
  FL_DEL     NUMBER(1)                          DEFAULT 0
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

COMMENT ON TABLE ASU.TCERTIFICATE IS 'Таблица сертификатов для оплаты мед. услуг. Author: Slusarenko M.D. 20.08.2012'
/

COMMENT ON COLUMN ASU.TCERTIFICATE.FK_ID IS 'SEQUENCE=[SEQ_TCERTIFICATE]'
/

COMMENT ON COLUMN ASU.TCERTIFICATE.FC_NUM IS 'Номер сертификата'
/

COMMENT ON COLUMN ASU.TCERTIFICATE.FN_SUM IS 'Сумма сертификата'
/

COMMENT ON COLUMN ASU.TCERTIFICATE.FD_BEGIN IS 'Дата регистрации сертификата'
/

COMMENT ON COLUMN ASU.TCERTIFICATE.FD_END IS 'Дата окончания действия сертификата'
/

COMMENT ON COLUMN ASU.TCERTIFICATE.FK_PEPLID IS 'Ссылка на пипла (покупателя сертификата)'
/

COMMENT ON COLUMN ASU.TCERTIFICATE.FK_SOTRID IS 'Сотрудник, зарегистрировавший сертификат'
/

COMMENT ON COLUMN ASU.TCERTIFICATE.FL_DEL IS '1 - запись удалена.'
/


--
-- TCERTIFICATE_BY_FD_BEGIN  (Index) 
--
--  Dependencies: 
--   TCERTIFICATE (Table)
--
CREATE INDEX ASU.TCERTIFICATE_BY_FD_BEGIN ON ASU.TCERTIFICATE
(FD_BEGIN)
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
-- TCERTIFICATE_BY_FD_END  (Index) 
--
--  Dependencies: 
--   TCERTIFICATE (Table)
--
CREATE INDEX ASU.TCERTIFICATE_BY_FD_END ON ASU.TCERTIFICATE
(FD_END)
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
-- TCERTIFICATE_BY_ID  (Index) 
--
--  Dependencies: 
--   TCERTIFICATE (Table)
--
CREATE UNIQUE INDEX ASU.TCERTIFICATE_BY_ID ON ASU.TCERTIFICATE
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
-- TCERTIFICETE_BY_PEPLID  (Index) 
--
--  Dependencies: 
--   TCERTIFICATE (Table)
--
CREATE INDEX ASU.TCERTIFICETE_BY_PEPLID ON ASU.TCERTIFICATE
(FK_PEPLID)
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
-- TCERTIFICATE_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TCERTIFICATE (Table)
--
CREATE OR REPLACE TRIGGER ASU."TCERTIFICATE_BEFORE_INSERT" 
  before insert
  on asu.tcertificate
  referencing new as new old as old
  for each row
begin
  select asu.seq_tcertificate.nextval into :new.fk_id from dual;
end;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TCERTIFICATE 
-- 
ALTER TABLE ASU.TCERTIFICATE ADD (
  CONSTRAINT TCERTIFICATE_BY_ID
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

