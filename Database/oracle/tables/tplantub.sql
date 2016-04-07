DROP TABLE ASU.TPLANTUB CASCADE CONSTRAINTS
/

--
-- TPLANTUB  (Table) 
--
CREATE TABLE ASU.TPLANTUB
(
  FK_ID     NUMBER(15)                          NOT NULL,
  FD_BEGIN  DATE,
  FD_END    DATE,
  FK_TUBID  NUMBER(15)
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
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING
/

COMMENT ON TABLE ASU.TPLANTUB IS 'Таблица, содержащая плановые периоды прохождения пациентом флюорографий, если он стоит на тубучете'
/

COMMENT ON COLUMN ASU.TPLANTUB.FK_ID IS 'Уникальный идентификатор'
/

COMMENT ON COLUMN ASU.TPLANTUB.FD_BEGIN IS 'Дата начала периода'
/

COMMENT ON COLUMN ASU.TPLANTUB.FD_END IS 'Дата окончания периода'
/

COMMENT ON COLUMN ASU.TPLANTUB.FK_TUBID IS 'TTUBPARAM.FK_ID'
/


--
-- TPALNTUB_BY_BEGINEND  (Index) 
--
--  Dependencies: 
--   TPLANTUB (Table)
--
CREATE INDEX ASU.TPALNTUB_BY_BEGINEND ON ASU.TPLANTUB
(FD_BEGIN, FD_END)
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
-- TPLANTUB_BY_TUBID  (Index) 
--
--  Dependencies: 
--   TPLANTUB (Table)
--
CREATE INDEX ASU.TPLANTUB_BY_TUBID ON ASU.TPLANTUB
(FK_TUBID)
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
-- TPLANTUB_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TPLANTUB (Table)
--
CREATE OR REPLACE TRIGGER ASU."TPLANTUB_BEFORE_INSERT" 
 BEFORE
  INSERT
 ON asu.tplantub
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
  select seq_tplantub.nextval into :new.fk_id from dual;
end;
/
SHOW ERRORS;


