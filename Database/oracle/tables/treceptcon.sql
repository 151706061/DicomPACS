DROP TABLE ASU.TRECEPTCON CASCADE CONSTRAINTS
/

--
-- TRECEPTCON  (Table) 
--
CREATE TABLE ASU.TRECEPTCON
(
  FK_ID        NUMBER(9),
  FK_RECEPTID  NUMBER(9),
  FK_MEDICID   NUMBER(9),
  FN_KOL       NUMBER(9,3)                      DEFAULT 0
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          520K
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

COMMENT ON TABLE ASU.TRECEPTCON IS 'Содержимое рецепта'
/

COMMENT ON COLUMN ASU.TRECEPTCON.FK_ID IS 'SEQUENCE=[SEQ_TRECEPTCON]'
/

COMMENT ON COLUMN ASU.TRECEPTCON.FK_RECEPTID IS 'Код рецепта'
/

COMMENT ON COLUMN ASU.TRECEPTCON.FK_MEDICID IS 'Код медикамента в рецепте'
/

COMMENT ON COLUMN ASU.TRECEPTCON.FN_KOL IS 'кол-во медикамента которое необходимо для выполнения этого рецепта'
/


--
-- PK_TRECEPTCON  (Index) 
--
--  Dependencies: 
--   TRECEPTCON (Table)
--
CREATE UNIQUE INDEX ASU.PK_TRECEPTCON ON ASU.TRECEPTCON
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
-- TRECEPTCON_MEDICID  (Index) 
--
--  Dependencies: 
--   TRECEPTCON (Table)
--
CREATE INDEX ASU.TRECEPTCON_MEDICID ON ASU.TRECEPTCON
(FK_MEDICID)
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
-- TRECEPTCON_INS  (Trigger) 
--
--  Dependencies: 
--   TRECEPTCON (Table)
--
CREATE OR REPLACE TRIGGER ASU."TRECEPTCON_INS" 
BEFORE INSERT
ON treceptcon
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
Begin
  select seq_treceptcon.nextval into :new.fk_id from dual;
End;
/
SHOW ERRORS;


