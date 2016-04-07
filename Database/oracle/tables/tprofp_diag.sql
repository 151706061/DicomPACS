DROP TABLE ASU.TPROFP_DIAG CASCADE CONSTRAINTS
/

--
-- TPROFP_DIAG  (Table) 
--
CREATE TABLE ASU.TPROFP_DIAG
(
  FK_ID     NUMBER,
  FC_NAME   VARCHAR2(200 BYTE),
  FC_MKB10  VARCHAR2(50 BYTE),
  FL_DEL    NUMBER(1)                           DEFAULT 1
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOLOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING
/


--
-- TPROFP_DIAG_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TPROFP_DIAG (Table)
--
CREATE OR REPLACE TRIGGER ASU."TPROFP_DIAG_BEFORE_INSERT"
 BEFORE
  INSERT
 ON tprofp_DIAG
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
  select seq_profp_dog.NEXTVAL into :new.fk_id from dual;
end;
/
SHOW ERRORS;

