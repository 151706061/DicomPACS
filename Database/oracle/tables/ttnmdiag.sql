DROP TABLE ASU.TTNMDIAG CASCADE CONSTRAINTS
/

--
-- TTNMDIAG  (Table) 
--
CREATE TABLE ASU.TTNMDIAG
(
  FK_ID        NUMBER                           NOT NULL,
  FK_DIAGID    NUMBER                           NOT NULL,
  FK_TNMSPRID  NUMBER                           NOT NULL
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

COMMENT ON TABLE ASU.TTNMDIAG IS 'связка классификатора TNM и диагнозов'
/

COMMENT ON COLUMN ASU.TTNMDIAG.FK_ID IS 'ID'
/

COMMENT ON COLUMN ASU.TTNMDIAG.FK_DIAGID IS 'tsmid.fk_id'
/

COMMENT ON COLUMN ASU.TTNMDIAG.FK_TNMSPRID IS 'ttnmspr.fk_id'
/


--
-- TTNMDIAG_FK_DIAGID_UNIQUE  (Index) 
--
--  Dependencies: 
--   TTNMDIAG (Table)
--
CREATE UNIQUE INDEX ASU.TTNMDIAG_FK_DIAGID_UNIQUE ON ASU.TTNMDIAG
(FK_DIAGID)
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
-- TTNMDIAG_BI  (Trigger) 
--
--  Dependencies: 
--   TTNMDIAG (Table)
--
CREATE OR REPLACE TRIGGER ASU."TTNMDIAG_BI" 
  before insert on asu.ttnmdiag
  referencing new as new
  for each row
begin
  if :new.fk_id is null then
    select seq_ttnmdiag.nextval into :new.fk_id from dual;
  end if;
end;
/
SHOW ERRORS;


