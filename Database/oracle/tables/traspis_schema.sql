ALTER TABLE ASU.TRASPIS_SCHEMA
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TRASPIS_SCHEMA CASCADE CONSTRAINTS
/

--
-- TRASPIS_SCHEMA  (Table) 
--
CREATE TABLE ASU.TRASPIS_SCHEMA
(
  FK_ID           NUMBER,
  FK_SCHEMAID     NUMBER,
  FK_NAZVRACHID   NUMBER,
  FD_DATE         DATE                          DEFAULT sysdate,
  FK_SOTRID       NUMBER                        DEFAULT 0,
  FK_GRAPHID      NUMBER,
  FD_SHOW_RASPIS  DATE                          DEFAULT trunc(sysdate),
  FL_SHOW_FLAG    NUMBER                        DEFAULT 0
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
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING
/

COMMENT ON TABLE ASU.TRASPIS_SCHEMA IS 'Аналог TRASPIS, но с разбивкой по схемам'
/

COMMENT ON COLUMN ASU.TRASPIS_SCHEMA.FK_ID IS 'Идентификатор'
/

COMMENT ON COLUMN ASU.TRASPIS_SCHEMA.FK_SCHEMAID IS 'Ид схемы из Tsmid'
/

COMMENT ON COLUMN ASU.TRASPIS_SCHEMA.FK_NAZVRACHID IS 'Tvrachkab.fk_id'
/

COMMENT ON COLUMN ASU.TRASPIS_SCHEMA.FD_DATE IS 'Дата создания'
/

COMMENT ON COLUMN ASU.TRASPIS_SCHEMA.FK_SOTRID IS 'Сотрудник'
/

COMMENT ON COLUMN ASU.TRASPIS_SCHEMA.FK_GRAPHID IS ' = tgraph.fk_raspid'
/


--
-- TRASPIS_SCHEMA_BEFORE_INS  (Trigger) 
--
--  Dependencies: 
--   TRASPIS_SCHEMA (Table)
--
CREATE OR REPLACE TRIGGER ASU."TRASPIS_SCHEMA_BEFORE_INS" before insert on TRaspis_schema
for each row
begin
  select SEQ_TRASPIS.NEXTVAL into :new.fk_id from dual;
end;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TRASPIS_SCHEMA 
-- 
ALTER TABLE ASU.TRASPIS_SCHEMA ADD (
  PRIMARY KEY
 (FK_ID)
    USING INDEX 
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
               ),
  UNIQUE (FK_GRAPHID)
    USING INDEX 
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
               ))
/

