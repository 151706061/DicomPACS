ALTER TABLE ASU.TTNMSPR
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TTNMSPR CASCADE CONSTRAINTS
/

--
-- TTNMSPR  (Table) 
--
CREATE TABLE ASU.TTNMSPR
(
  FK_ID          NUMBER                         NOT NULL,
  FC_CLASS       NUMBER,
  FC_ANATOM      NUMBER,
  FC_REGLIMF     NUMBER,
  FC_CLINIC      NUMBER,
  FC_PATANATOM   NUMBER,
  FC_GIST        NUMBER,
  FC_GROUPSTAGE  NUMBER,
  FC_RESUME      NUMBER,
  FK_OWNER       NUMBER                         DEFAULT -1,
  FC_GROUP       VARCHAR2(50 BYTE)
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

COMMENT ON TABLE ASU.TTNMSPR IS 'Классификатор TNM'
/

COMMENT ON COLUMN ASU.TTNMSPR.FK_ID IS 'ID'
/

COMMENT ON COLUMN ASU.TTNMSPR.FC_CLASS IS 'правила классификации (TCLOBS.FK_ID)'
/

COMMENT ON COLUMN ASU.TTNMSPR.FC_ANATOM IS 'анатомические области и части (TCLOBS.FK_ID)'
/

COMMENT ON COLUMN ASU.TTNMSPR.FC_REGLIMF IS 'регионарные (TCLOBS.FK_ID)'
/

COMMENT ON COLUMN ASU.TTNMSPR.FC_CLINIC IS 'клиническая классификация (TCLOBS.FK_ID)'
/

COMMENT ON COLUMN ASU.TTNMSPR.FC_PATANATOM IS 'патологоанатомическая классификация (TCLOBS.FK_ID)'
/

COMMENT ON COLUMN ASU.TTNMSPR.FC_GIST IS 'гистопатологическая дифференцировка (TCLOBS.FK_ID)'
/

COMMENT ON COLUMN ASU.TTNMSPR.FC_GROUPSTAGE IS 'группировка по стадиям (TCLOBS.FK_ID)'
/

COMMENT ON COLUMN ASU.TTNMSPR.FC_RESUME IS 'резюме (TCLOBS.FK_ID)'
/

COMMENT ON COLUMN ASU.TTNMSPR.FK_OWNER IS 'ID родителя'
/

COMMENT ON COLUMN ASU.TTNMSPR.FC_GROUP IS 'название группы'
/


--
-- PK_TTNMSPR  (Index) 
--
--  Dependencies: 
--   TTNMSPR (Table)
--
CREATE UNIQUE INDEX ASU.PK_TTNMSPR ON ASU.TTNMSPR
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
-- TTNMSPR_BI  (Trigger) 
--
--  Dependencies: 
--   TTNMSPR (Table)
--
CREATE OR REPLACE TRIGGER ASU."TTNMSPR_BI" 
  before insert on asu.ttnmspr
  referencing new as new
  for each row
begin
  if :new.fk_id is null then
    select seq_ttnmspr.nextval into :new.fk_id from dual;
  end if;
end;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TTNMSPR 
-- 
ALTER TABLE ASU.TTNMSPR ADD (
  CONSTRAINT PK_TTNMSPR
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

