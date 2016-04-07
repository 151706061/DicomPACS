ALTER TABLE ASU.TBRON_NAZ
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TBRON_NAZ CASCADE CONSTRAINTS
/

--
-- TBRON_NAZ  (Table) 
--
CREATE TABLE ASU.TBRON_NAZ
(
  FK_ID           NUMBER                        NOT NULL,
  FK_SMID         NUMBER,
  FK_VRACH        NUMBER,
  FD_DATE         DATE,
  FK_BRON_PEOPLE  NUMBER,
  FK_ROOM         NUMBER
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

COMMENT ON TABLE ASU.TBRON_NAZ IS 'Забранированные назначения  Author: A.Nakorjakov'
/

COMMENT ON COLUMN ASU.TBRON_NAZ.FK_ID IS 'SEQUENCE=[SEQ_TKARTA]'
/

COMMENT ON COLUMN ASU.TBRON_NAZ.FK_SMID IS 'TSMID.FK_ID Консультация'
/

COMMENT ON COLUMN ASU.TBRON_NAZ.FK_VRACH IS 'TSOTR.FK_ID'
/

COMMENT ON COLUMN ASU.TBRON_NAZ.FD_DATE IS 'Дата и время записи'
/

COMMENT ON COLUMN ASU.TBRON_NAZ.FK_BRON_PEOPLE IS 'TBRON_PEOPLE.FK_ID'
/


--
-- PK_TBRON_NAZ  (Index) 
--
--  Dependencies: 
--   TBRON_NAZ (Table)
--
CREATE UNIQUE INDEX ASU.PK_TBRON_NAZ ON ASU.TBRON_NAZ
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


--
-- TBRON_NAZ$BI  (Trigger) 
--
--  Dependencies: 
--   TBRON_NAZ (Table)
--
CREATE OR REPLACE TRIGGER ASU."TBRON_NAZ$BI" before insert
on ASU.TBRON_NAZ for each row
begin
  --  Column "FK_ID" uses sequence SEQ_TKARTA
  if :new.FK_ID is null then
    select SEQ_TKARTA.NEXTVAL INTO :new.FK_ID from dual;
  end if;
end;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TBRON_NAZ 
-- 
ALTER TABLE ASU.TBRON_NAZ ADD (
  CONSTRAINT PK_TBRON_NAZ
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
               ))
/

