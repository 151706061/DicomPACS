ALTER TABLE ASU.TVACCANCEL_INF
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TVACCANCEL_INF CASCADE CONSTRAINTS
/

--
-- TVACCANCEL_INF  (Table) 
--
--  Dependencies: 
--   TINFECTION (Table)
--   TVAC_CANCEL (Table)
--
CREATE TABLE ASU.TVACCANCEL_INF
(
  FK_ID          INTEGER                        NOT NULL,
  FK_VAC_CANCEL  INTEGER                        NOT NULL,
  FK_INFECTION   INTEGER                        NOT NULL
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

COMMENT ON TABLE ASU.TVACCANCEL_INF IS 'Связь отказов с инфекциями
Author: Ura'
/


--
-- PK_TVACCANCEL_INF  (Index) 
--
--  Dependencies: 
--   TVACCANCEL_INF (Table)
--
CREATE UNIQUE INDEX ASU.PK_TVACCANCEL_INF ON ASU.TVACCANCEL_INF
(FK_ID)
NOLOGGING
TABLESPACE INDX
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
-- TVACCANCEL_INF$INFECTION  (Index) 
--
--  Dependencies: 
--   TVACCANCEL_INF (Table)
--
CREATE INDEX ASU.TVACCANCEL_INF$INFECTION ON ASU.TVACCANCEL_INF
(FK_INFECTION)
NOLOGGING
TABLESPACE INDX
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
-- TVACCANCEL_INF$VACCANCEL  (Index) 
--
--  Dependencies: 
--   TVACCANCEL_INF (Table)
--
CREATE INDEX ASU.TVACCANCEL_INF$VACCANCEL ON ASU.TVACCANCEL_INF
(FK_VAC_CANCEL)
NOLOGGING
TABLESPACE INDX
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
-- TVACCANCEL_INF$BI  (Trigger) 
--
--  Dependencies: 
--   TVACCANCEL_INF (Table)
--
CREATE OR REPLACE TRIGGER ASU."TVACCANCEL_INF$BI" before insert
on TVACCANCEL_INF for each row
begin
    --  Column "FK_ID" uses sequence SEQ_TVACCANCEL_INF
    if :new.FK_ID is null then
      select SEQ_TVACCANCEL_INF.NEXTVAL INTO :new.FK_ID from dual;
    end if;

end;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TVACCANCEL_INF 
-- 
ALTER TABLE ASU.TVACCANCEL_INF ADD (
  CONSTRAINT PK_TVACCANCEL_INF
 PRIMARY KEY
 (FK_ID)
    USING INDEX 
    TABLESPACE INDX
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

-- 
-- Foreign Key Constraints for Table TVACCANCEL_INF 
-- 
ALTER TABLE ASU.TVACCANCEL_INF ADD (
  CONSTRAINT FK_TVACCANC_REFERENCE_TINFECTI 
 FOREIGN KEY (FK_INFECTION) 
 REFERENCES ASU.TINFECTION (FK_ID),
  CONSTRAINT FK_TVACCANC_RF_TVAC_CANCEL 
 FOREIGN KEY (FK_VAC_CANCEL) 
 REFERENCES ASU.TVAC_CANCEL (FK_ID))
/

