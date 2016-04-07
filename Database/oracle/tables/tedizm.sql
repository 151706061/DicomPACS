DROP TABLE ASU.TEDIZM CASCADE CONSTRAINTS
/

--
-- TEDIZM  (Table) 
--
CREATE TABLE ASU.TEDIZM
(
  FC_NAME     VARCHAR2(255 BYTE),
  FK_ID       NUMBER(9)                         NOT NULL,
  FC_COMMENT  VARCHAR2(2000 BYTE)
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

COMMENT ON COLUMN ASU.TEDIZM.FK_ID IS 'SEQUENCE=[SEQ_TEDIZM]'
/


--
-- TEDIZM_INS  (Trigger) 
--
--  Dependencies: 
--   TEDIZM (Table)
--
CREATE OR REPLACE TRIGGER ASU."TEDIZM_INS" 
BEFORE INSERT
ON ASU.TEDIZM REFERENCING OLD AS OLD NEW AS NEW
FOR EACH ROW
Begin
  select seq_tedizm.nextval into :new.fk_id from dual;
End;
/
SHOW ERRORS;


--
-- TEDIZM_DEL  (Trigger) 
--
--  Dependencies: 
--   TEDIZM (Table)
--
CREATE OR REPLACE TRIGGER ASU."TEDIZM_DEL" 
BEFORE DELETE
ON ASU.TEDIZM REFERENCING OLD AS OLD NEW AS NEW
FOR EACH ROW
DECLARE
   nTmp   ROWID;
BEGIN
   IF pkgtedizm.isExistsMedic(:old.fk_id) = 1 THEN
      raise_application_error (-20001, 'Вы не можете удалить эту единицу измерения, т.к. есть записи зависящие от нее');
   END IF;
END;
/
SHOW ERRORS;


