DROP TABLE ASU.TANAMBOL CASCADE CONSTRAINTS
/

--
-- TANAMBOL  (Table) 
--
CREATE TABLE ASU.TANAMBOL
(
  FK_ID       NUMBER(15)                        NOT NULL,
  FK_VRACHID  NUMBER(15)                        NOT NULL,
  FK_PACID    NUMBER(15)                        NOT NULL,
  FD_DATE     DATE,
  FK_BID      NUMBER(9),
  FK_CLOBID   NUMBER(9),
  FC_COMMENT  VARCHAR2(4000 BYTE)
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          2360K
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

COMMENT ON TABLE ASU.TANAMBOL IS 'Анамнезы заболеваний пациентов by TimurLan'
/

COMMENT ON COLUMN ASU.TANAMBOL.FK_ID IS 'SEQUENCE=[SEQ_TANAMBOL]'
/

COMMENT ON COLUMN ASU.TANAMBOL.FK_VRACHID IS 'TSOTR.FK_ID врач сделавший запись'
/

COMMENT ON COLUMN ASU.TANAMBOL.FK_PACID IS 'код пациента'
/

COMMENT ON COLUMN ASU.TANAMBOL.FD_DATE IS 'дата записи'
/

COMMENT ON COLUMN ASU.TANAMBOL.FK_BID IS 'служебное поле'
/

COMMENT ON COLUMN ASU.TANAMBOL.FK_CLOBID IS 'TCLOBS.FK_ID'
/

COMMENT ON COLUMN ASU.TANAMBOL.FC_COMMENT IS 'комментарии'
/


--
-- TANAMBOL_BY_ID  (Index) 
--
--  Dependencies: 
--   TANAMBOL (Table)
--
CREATE UNIQUE INDEX ASU.TANAMBOL_BY_ID ON ASU.TANAMBOL
(FK_ID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          256K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TANAMBOL_PACID  (Index) 
--
--  Dependencies: 
--   TANAMBOL (Table)
--
CREATE INDEX ASU.TANAMBOL_PACID ON ASU.TANAMBOL
(FK_PACID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          256K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TANAMBOL_DELETE  (Trigger) 
--
--  Dependencies: 
--   TANAMBOL (Table)
--
CREATE OR REPLACE TRIGGER ASU."TANAMBOL_DELETE" 
BEFORE DELETE
ON ASU.TANAMBOL REFERENCING OLD AS OLD NEW AS NEW
FOR EACH ROW
Begin
  delete from tblobs where fk_id=:old.fk_bid;
  delete from tclobs where fk_id=:old.fk_clobid;
End;
/
SHOW ERRORS;


--
-- TANAMBOL_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TANAMBOL (Table)
--
CREATE OR REPLACE TRIGGER ASU."TANAMBOL_BEFORE_INSERT" 
BEFORE INSERT
ON ASU.TANAMBOL REFERENCING OLD AS OLD NEW AS NEW
FOR EACH ROW
Begin
  if :new.fk_id is null then
    select seq_tanambol.nextval into :new.fk_id from dual;
  end if;
End;
/
SHOW ERRORS;


