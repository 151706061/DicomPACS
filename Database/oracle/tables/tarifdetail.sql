ALTER TABLE ASU.TARIFDETAIL
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TARIFDETAIL CASCADE CONSTRAINTS
/

--
-- TARIFDETAIL  (Table) 
--
CREATE TABLE ASU.TARIFDETAIL
(
  FK_ID         NUMBER(15)                      NOT NULL,
  FK_PACID      NUMBER(15)                      DEFAULT -1,
  FK_TALONID    NUMBER(15)                      DEFAULT -1,
  FK_NAZID      NUMBER(15)                      DEFAULT -1,
  FK_NAZHEALID  NUMBER(15)                      DEFAULT -1,
  FK_PERESELID  NUMBER(15)                      DEFAULT -1,
  FC_COMMENT    VARCHAR2(4000 BYTE),
  FC_OWNER      VARCHAR2(100 BYTE),
  FD_DATE       DATE,
  FK_PEOPLEID   NUMBER(15)                      DEFAULT -1
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

COMMENT ON TABLE ASU.TARIFDETAIL IS 'Детали тарификации и выгрузки. Author:Efimov'
/

COMMENT ON COLUMN ASU.TARIFDETAIL.FC_OWNER IS 'Не обязательный параметр, который объединяет данные в группу'
/

COMMENT ON COLUMN ASU.TARIFDETAIL.FD_DATE IS 'sysdate добавления записи'
/


--
-- I_TARIFDETAIL_NAZHEALID  (Index) 
--
--  Dependencies: 
--   TARIFDETAIL (Table)
--
CREATE INDEX ASU.I_TARIFDETAIL_NAZHEALID ON ASU.TARIFDETAIL
(FK_NAZHEALID)
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
-- I_TARIFDETAIL_NAZID  (Index) 
--
--  Dependencies: 
--   TARIFDETAIL (Table)
--
CREATE INDEX ASU.I_TARIFDETAIL_NAZID ON ASU.TARIFDETAIL
(FK_NAZID)
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
-- I_TARIFDETAIL_OWNER  (Index) 
--
--  Dependencies: 
--   TARIFDETAIL (Table)
--
CREATE INDEX ASU.I_TARIFDETAIL_OWNER ON ASU.TARIFDETAIL
(FC_OWNER)
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
-- I_TARIFDETAIL_PACID  (Index) 
--
--  Dependencies: 
--   TARIFDETAIL (Table)
--
CREATE INDEX ASU.I_TARIFDETAIL_PACID ON ASU.TARIFDETAIL
(FK_PACID)
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
-- I_TARIFDETAIL_PEOPLEID  (Index) 
--
--  Dependencies: 
--   TARIFDETAIL (Table)
--
CREATE INDEX ASU.I_TARIFDETAIL_PEOPLEID ON ASU.TARIFDETAIL
(FK_PEOPLEID)
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
-- I_TARIFDETAIL_PERESELID  (Index) 
--
--  Dependencies: 
--   TARIFDETAIL (Table)
--
CREATE INDEX ASU.I_TARIFDETAIL_PERESELID ON ASU.TARIFDETAIL
(FK_PERESELID)
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
-- I_TARIFDETAIL_TALONID  (Index) 
--
--  Dependencies: 
--   TARIFDETAIL (Table)
--
CREATE INDEX ASU.I_TARIFDETAIL_TALONID ON ASU.TARIFDETAIL
(FK_TALONID)
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
-- K_TARIFDETAIL_ID  (Index) 
--
--  Dependencies: 
--   TARIFDETAIL (Table)
--
CREATE UNIQUE INDEX ASU.K_TARIFDETAIL_ID ON ASU.TARIFDETAIL
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
-- "TarifDetail_INSERT"  (Trigger) 
--
--  Dependencies: 
--   TARIFDETAIL (Table)
--
CREATE OR REPLACE TRIGGER ASU."TarifDetail_INSERT"
 BEFORE
  INSERT
 ON asu.TarifDetail
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
Begin
  IF :new.FK_ID IS NULL THEN
    SELECT asu.SEQ_TarifDetail.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
  END IF;
End;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TARIFDETAIL 
-- 
ALTER TABLE ASU.TARIFDETAIL ADD (
  CONSTRAINT K_TARIFDETAIL_ID
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

