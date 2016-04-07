ALTER TABLE ASU.TVACCANCEL_PREP
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TVACCANCEL_PREP CASCADE CONSTRAINTS
/

--
-- TVACCANCEL_PREP  (Table) 
--
--  Dependencies: 
--   TVACCIN_PREP (Table)
--   TVAC_CANCEL (Table)
--
CREATE TABLE ASU.TVACCANCEL_PREP
(
  FK_ID          INTEGER                        NOT NULL,
  FK_VAC_CANCEL  INTEGER                        NOT NULL,
  FK_VAC_PREP    INTEGER                        NOT NULL
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

COMMENT ON TABLE ASU.TVACCANCEL_PREP IS 'Отводы от конкретных вакцин
Author: Ura'
/


--
-- PK_TVACCANCEL_PREP  (Index) 
--
--  Dependencies: 
--   TVACCANCEL_PREP (Table)
--
CREATE UNIQUE INDEX ASU.PK_TVACCANCEL_PREP ON ASU.TVACCANCEL_PREP
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
-- TVACCANCEL_PREP$FK_VAC_CANCEL  (Index) 
--
--  Dependencies: 
--   TVACCANCEL_PREP (Table)
--
CREATE INDEX ASU.TVACCANCEL_PREP$FK_VAC_CANCEL ON ASU.TVACCANCEL_PREP
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
-- TVACCANCEL_PREP$FK_VAC_PREP  (Index) 
--
--  Dependencies: 
--   TVACCANCEL_PREP (Table)
--
CREATE INDEX ASU.TVACCANCEL_PREP$FK_VAC_PREP ON ASU.TVACCANCEL_PREP
(FK_VAC_PREP)
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
-- TVACCANCEL_PREP$BI  (Trigger) 
--
--  Dependencies: 
--   TVACCANCEL_PREP (Table)
--
CREATE OR REPLACE TRIGGER ASU."TVACCANCEL_PREP$BI" before insert
on TVACCANCEL_PREP for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;

begin
    --  Column "FK_ID" uses sequence SEQ_TVACCANCEL_PREP
    if :new.FK_ID is null then
      select SEQ_TVACCANCEL_PREP.NEXTVAL INTO :new.FK_ID from dual;
    end if;

--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TVACCANCEL_PREP 
-- 
ALTER TABLE ASU.TVACCANCEL_PREP ADD (
  CONSTRAINT PK_TVACCANCEL_PREP
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
-- Foreign Key Constraints for Table TVACCANCEL_PREP 
-- 
ALTER TABLE ASU.TVACCANCEL_PREP ADD (
  CONSTRAINT FK_TVACCANC_REFERENCE_TVACCIN_ 
 FOREIGN KEY (FK_VAC_PREP) 
 REFERENCES ASU.TVACCIN_PREP (FK_ID),
  CONSTRAINT FK_TVACCANC_REFERENCE_TVAC_CAN 
 FOREIGN KEY (FK_VAC_CANCEL) 
 REFERENCES ASU.TVAC_CANCEL (FK_ID))
/

