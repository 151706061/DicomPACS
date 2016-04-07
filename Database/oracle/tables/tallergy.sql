DROP TABLE ASU.TALLERGY CASCADE CONSTRAINTS
/

--
-- TALLERGY  (Table) 
--
CREATE TABLE ASU.TALLERGY
(
  FK_ID      NUMBER                             NOT NULL,
  FK_SMID    NUMBER,
  FC_CHAR    VARCHAR2(4000 BYTE),
  FC_CHARID  VARCHAR2(500 BYTE),
  FD_DATE    DATE,
  FK_SOTRID  NUMBER,
  FK_PEPLID  NUMBER
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

COMMENT ON TABLE ASU.TALLERGY IS 'Таблица для сохранения лекарственной непереносимости и характера побочного действия для пипла (tpeoples.fk_id)'
/

COMMENT ON COLUMN ASU.TALLERGY.FK_ID IS 'UID'
/

COMMENT ON COLUMN ASU.TALLERGY.FK_SMID IS 'tsmid.fk_id'
/

COMMENT ON COLUMN ASU.TALLERGY.FC_CHAR IS 'Характер побочного действия'
/

COMMENT ON COLUMN ASU.TALLERGY.FC_CHARID IS 'Список ID характера побочного действия'
/

COMMENT ON COLUMN ASU.TALLERGY.FD_DATE IS 'Дата'
/

COMMENT ON COLUMN ASU.TALLERGY.FK_SOTRID IS 'Врач'
/

COMMENT ON COLUMN ASU.TALLERGY.FK_PEPLID IS 'tpeoples.fk_id'
/


--
-- TALLERGY_PEPLID  (Index) 
--
--  Dependencies: 
--   TALLERGY (Table)
--
CREATE INDEX ASU.TALLERGY_PEPLID ON ASU.TALLERGY
(FK_PEPLID)
NOLOGGING
TABLESPACE INDX
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
-- TALLERGY_UID  (Index) 
--
--  Dependencies: 
--   TALLERGY (Table)
--
CREATE UNIQUE INDEX ASU.TALLERGY_UID ON ASU.TALLERGY
(FK_ID)
NOLOGGING
TABLESPACE INDX
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
-- TALLERGY_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TALLERGY (Table)
--
CREATE OR REPLACE TRIGGER ASU."TALLERGY_BEFORE_INSERT" 
 BEFORE
  INSERT
 ON asu.tallergy
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
  select asu.seq_tallergy.NEXTVAL into :new.fk_id from dual;
end;
/
SHOW ERRORS;


