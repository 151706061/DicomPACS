DROP TABLE ASU.TENL_LPU CASCADE CONSTRAINTS
/

--
-- TENL_LPU  (Table) 
--
CREATE TABLE ASU.TENL_LPU
(
  FK_ID       NUMBER,
  FK_SMIDLPU  NUMBER
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


--
-- TENL_LPU_BI  (Trigger) 
--
--  Dependencies: 
--   TENL_LPU (Table)
--
CREATE OR REPLACE TRIGGER ASU.TENL_LPU_BI
  before insert ON ASU.TENL_LPU   REFERENCING OLD AS OLD NEW AS NEW
  for each ROW
begin
  SELECT asu.seq_tenl_lpu.nextval INTO :new.fk_id FROM dual;
END;
/
SHOW ERRORS;


