DROP TABLE ASU.TMK CASCADE CONSTRAINTS
/

--
-- TMK  (Table) 
--
CREATE TABLE ASU.TMK
(
  FK_SMID  NUMBER(15)
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

COMMENT ON TABLE ASU.TMK IS '“аблица, котора€ содержит в себе методики (услуги рентгена), которые св€заны с контрастированием.
TMK - Table Metodics Kontrast
Created by Prihodko N. 12.12.2011'
/

COMMENT ON COLUMN ASU.TMK.FK_SMID IS 'tsmid.fk_id'
/


