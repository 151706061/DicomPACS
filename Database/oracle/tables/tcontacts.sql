DROP TABLE ASU.TCONTACTS CASCADE CONSTRAINTS
/

--
-- TCONTACTS  (Table) 
--
CREATE TABLE ASU.TCONTACTS
(
  FK_ID       NUMBER                            NOT NULL,
  FK_PACID    NUMBER,
  FK_TYPE     NUMBER,
  FC_CONTACT  VARCHAR2(50 BYTE),
  FC_REMARK   VARCHAR2(20 BYTE)
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

COMMENT ON TABLE ASU.TCONTACTS IS 'Таблица контактов
Created by Nefedov S. on 14.09.2007'
/

COMMENT ON COLUMN ASU.TCONTACTS.FK_PACID IS 'Код пациента'
/

COMMENT ON COLUMN ASU.TCONTACTS.FK_TYPE IS 'Тип контакта (Телефон, E-Mail и т.п.)'
/

COMMENT ON COLUMN ASU.TCONTACTS.FC_CONTACT IS 'Текст контакта'
/

COMMENT ON COLUMN ASU.TCONTACTS.FC_REMARK IS 'Описание контакта'
/


--
-- TCONTACTS_BY_ID  (Index) 
--
--  Dependencies: 
--   TCONTACTS (Table)
--
CREATE UNIQUE INDEX ASU.TCONTACTS_BY_ID ON ASU.TCONTACTS
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
-- TCONTACTS_BY_PACID  (Index) 
--
--  Dependencies: 
--   TCONTACTS (Table)
--
CREATE INDEX ASU.TCONTACTS_BY_PACID ON ASU.TCONTACTS
(FK_PACID)
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
-- TCONTACTS_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TCONTACTS (Table)
--
CREATE OR REPLACE TRIGGER ASU."TCONTACTS_BEFORE_INSERT" 
 BEFORE
  INSERT
 ON asu.tcontacts
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
Begin
  select seq_tcontacts.nextval into :new.fk_id from dual;
End;
/
SHOW ERRORS;


