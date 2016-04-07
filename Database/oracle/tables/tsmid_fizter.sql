DROP TABLE ASU.TSMID_FIZTER CASCADE CONSTRAINTS
/

--
-- TSMID_FIZTER  (Table) 
--
CREATE TABLE ASU.TSMID_FIZTER
(
  FK_ID  NUMBER(15)                             NOT NULL
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

COMMENT ON TABLE ASU.TSMID_FIZTER IS 'Перед выгрузкой в DBF, в таблицу копируются ID всех физиотерапевтических услуг, чтобы в дальнейшем использовать её вместо древовидного запроса к tsmid и тем самым ускорить работу Author:Efimov'
/

COMMENT ON COLUMN ASU.TSMID_FIZTER.FK_ID IS 'TSMID.fk_id'
/


--
-- TSMID_FIZTER_ID  (Index) 
--
--  Dependencies: 
--   TSMID_FIZTER (Table)
--
CREATE INDEX ASU.TSMID_FIZTER_ID ON ASU.TSMID_FIZTER
(FK_ID)
NOLOGGING
TABLESPACE USR
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


GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE ON ASU.TSMID_FIZTER TO EXCH79
/

