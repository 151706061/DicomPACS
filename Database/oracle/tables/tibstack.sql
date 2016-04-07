DROP TABLE ASU.TIBSTACK CASCADE CONSTRAINTS
/

--
-- TIBSTACK  (Table) 
--
CREATE TABLE ASU.TIBSTACK
(
  FK_ID     NUMBER(9),
  FK_PACID  NUMBER(9)
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          560K
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

COMMENT ON TABLE ASU.TIBSTACK IS 'Таблица содержит запросы сервису для создания историй болезни'
/

COMMENT ON COLUMN ASU.TIBSTACK.FK_ID IS 'SEQUENCE=[SEQ_TIBSTACK]'
/

COMMENT ON COLUMN ASU.TIBSTACK.FK_PACID IS 'Код пациента для формирования ИБ'
/


--
-- TIBSTACK_INSERT  (Trigger) 
--
--  Dependencies: 
--   TIBSTACK (Table)
--
CREATE OR REPLACE TRIGGER ASU."TIBSTACK_INSERT" 
BEFORE  INSERT  ON ASU.TIBSTACK FOR EACH ROW
Begin
select seq_tibstack.nextval into :new.fk_id from dual;
End;
/
SHOW ERRORS;


