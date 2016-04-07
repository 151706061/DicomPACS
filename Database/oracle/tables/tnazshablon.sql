DROP TABLE ASU.TNAZSHABLON CASCADE CONSTRAINTS
/

--
-- TNAZSHABLON  (Table) 
--
CREATE TABLE ASU.TNAZSHABLON
(
  FK_ID      NUMBER(15),
  FC_NAME    VARCHAR2(250 BYTE),
  FK_SOTRID  NUMBER(15)
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          160K
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

COMMENT ON COLUMN ASU.TNAZSHABLON.FK_ID IS 'SEQUENCE=[SEQ_TNAZSHABLON]'
/

COMMENT ON COLUMN ASU.TNAZSHABLON.FC_NAME IS 'Наименование шаблона'
/

COMMENT ON COLUMN ASU.TNAZSHABLON.FK_SOTRID IS 'Код сотрудника'
/


--
-- TNAZSHABLON_ID  (Index) 
--
--  Dependencies: 
--   TNAZSHABLON (Table)
--
CREATE UNIQUE INDEX ASU.TNAZSHABLON_ID ON ASU.TNAZSHABLON
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
-- TNAZSHABLON_DELETE  (Trigger) 
--
--  Dependencies: 
--   TNAZSHABLON (Table)
--
CREATE OR REPLACE TRIGGER ASU."TNAZSHABLON_DELETE" 
BEFORE  DELETE
ON tnazshablon
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
Begin
  Delete from TNAZSHAB_NAZ where fk_SHABID=:old.fk_id;
  Delete From TNAZSHAB_DIAG where fk_SHABID=:old.fk_id;
  Delete From TNAZSHAB_TIB where fk_SHABID=:old.fk_id;
  Delete From TNAZSHAB_reslech where fk_SHABID=:old.fk_id;
  Delete From TNAZSHAB_reskons where fk_SHABID=:old.fk_id;
  Delete From TNAZSHAB_resis where fk_SHABID=:old.fk_id;
  Delete From TNAZSHAB_resan where fk_SHABID=:old.fk_id;

End;
/
SHOW ERRORS;


--
-- TNAZSHABLON_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TNAZSHABLON (Table)
--
CREATE OR REPLACE TRIGGER ASU."TNAZSHABLON_BEFORE_INSERT" 
BEFORE INSERT
ON tnazshablon
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
begin
 select SEQ_TNAZSHABLON.nextval  into :new.fk_id from dual;
end;
/
SHOW ERRORS;


