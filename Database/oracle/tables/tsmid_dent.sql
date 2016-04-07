DROP TABLE ASU.TSMID_DENT CASCADE CONSTRAINTS
/

--
-- TSMID_DENT  (Table) 
--
CREATE TABLE ASU.TSMID_DENT
(
  FK_ID       NUMBER(15)                        NOT NULL,
  FN_EDCHILD  NUMBER(5,2),
  FN_ED       NUMBER(5,2)
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

COMMENT ON TABLE ASU.TSMID_DENT IS 'Перед выгрузкой в DBF, в таблицу копируются ID всех стоматологических услуг, чтобы в дальнейшем использовать её вместо древовидного запроса к tsmid и тем самым ускорить работу Author:Efimov'
/

COMMENT ON COLUMN ASU.TSMID_DENT.FK_ID IS 'TSMID.fk_id'
/


--
-- TSMID_DENT_ID  (Index) 
--
--  Dependencies: 
--   TSMID_DENT (Table)
--
CREATE INDEX ASU.TSMID_DENT_ID ON ASU.TSMID_DENT
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


GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE ON ASU.TSMID_DENT TO EXCH79
/

