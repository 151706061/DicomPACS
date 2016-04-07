ALTER TABLE ASU.TUSLUG_PAY_REQ
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TUSLUG_PAY_REQ CASCADE CONSTRAINTS
/

--
-- TUSLUG_PAY_REQ  (Table) 
--
CREATE TABLE ASU.TUSLUG_PAY_REQ
(
  FK_ID              INTEGER                    NOT NULL,
  FK_SMID_PEOPL_CAT  INTEGER                    NOT NULL,
  FK_SMID_USL        INTEGER                    NOT NULL,
  FN_PAY_REQ         NUMBER(15,4)               NOT NULL
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          200K
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

COMMENT ON TABLE ASU.TUSLUG_PAY_REQ IS 'Связь типов услуг, категорий людей с платностью
'
/

COMMENT ON COLUMN ASU.TUSLUG_PAY_REQ.FK_ID IS 'SEQUENCE=[SEQ_USLUG_PAY_REQ]'
/

COMMENT ON COLUMN ASU.TUSLUG_PAY_REQ.FK_SMID_PEOPL_CAT IS 'Категория людей из TSMID'
/

COMMENT ON COLUMN ASU.TUSLUG_PAY_REQ.FK_SMID_USL IS 'Тип услуги'
/

COMMENT ON COLUMN ASU.TUSLUG_PAY_REQ.FN_PAY_REQ IS 'Коэффициент оплаты(1<0 - платно, 0 - бесплатно, -1 - запрещена к использованию)'
/


--
-- PK_TUSLUG_PAY_REQ  (Index) 
--
--  Dependencies: 
--   TUSLUG_PAY_REQ (Table)
--
CREATE UNIQUE INDEX ASU.PK_TUSLUG_PAY_REQ ON ASU.TUSLUG_PAY_REQ
(FK_ID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          128K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TUSLUG_PAY_REQ_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TUSLUG_PAY_REQ (Table)
--
CREATE OR REPLACE TRIGGER ASU."TUSLUG_PAY_REQ_BEFORE_INSERT" 
 BEFORE
  INSERT
 ON tuslug_pay_req
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;

begin
    --  Column "FK_ID" uses sequence SEQ_USLUG_PAY_REQ
    if :new.FK_ID is null then
      select SEQ_USLUG_PAY_REQ.NEXTVAL INTO :new.FK_ID from dual;
    end if;

--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/
SHOW ERRORS;


DROP SYNONYM BUH.TUSLUG_PAY_REQ
/

--
-- TUSLUG_PAY_REQ  (Synonym) 
--
--  Dependencies: 
--   TUSLUG_PAY_REQ (Table)
--
CREATE SYNONYM BUH.TUSLUG_PAY_REQ FOR ASU.TUSLUG_PAY_REQ
/


-- 
-- Non Foreign Key Constraints for Table TUSLUG_PAY_REQ 
-- 
ALTER TABLE ASU.TUSLUG_PAY_REQ ADD (
  CONSTRAINT PK_TUSLUG_PAY_REQ
 PRIMARY KEY
 (FK_ID)
    USING INDEX 
    TABLESPACE INDX
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          128K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
               ))
/

