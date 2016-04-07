ALTER TABLE ASU.TVACCANCEL_TYPE
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TVACCANCEL_TYPE CASCADE CONSTRAINTS
/

--
-- TVACCANCEL_TYPE  (Table) 
--
CREATE TABLE ASU.TVACCANCEL_TYPE
(
  FK_ID            INTEGER                      NOT NULL,
  FN_PERMANENT     INTEGER                      DEFAULT 0                     NOT NULL,
  FC_NAME          VARCHAR2(50 BYTE)            NOT NULL,
  FN_DEF_DURATION  INTEGER,
  FL_MED           NUMBER(1)                    DEFAULT 0                     NOT NULL,
  FL_ALL           NUMBER(1)                    DEFAULT 0                     NOT NULL
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

COMMENT ON TABLE ASU.TVACCANCEL_TYPE IS 'Типы отводов
Author: Ura'
/

COMMENT ON COLUMN ASU.TVACCANCEL_TYPE.FK_ID IS '0 - отвод от всех прививок'
/

COMMENT ON COLUMN ASU.TVACCANCEL_TYPE.FN_PERMANENT IS '1- постоянный отвод; 0 - Временный'
/

COMMENT ON COLUMN ASU.TVACCANCEL_TYPE.FC_NAME IS 'Название отвода'
/

COMMENT ON COLUMN ASU.TVACCANCEL_TYPE.FN_DEF_DURATION IS 'Длительность отвода по умолчнанию (в днях)'
/

COMMENT ON COLUMN ASU.TVACCANCEL_TYPE.FL_MED IS 'Признак медицинского отвода'
/

COMMENT ON COLUMN ASU.TVACCANCEL_TYPE.FL_ALL IS '1- от всех болезней и вакцин'
/


--
-- PK_TVACCANCEL_TYPE  (Index) 
--
--  Dependencies: 
--   TVACCANCEL_TYPE (Table)
--
CREATE UNIQUE INDEX ASU.PK_TVACCANCEL_TYPE ON ASU.TVACCANCEL_TYPE
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
-- TVACCANCEL_TYPE$BI  (Trigger) 
--
--  Dependencies: 
--   TVACCANCEL_TYPE (Table)
--
CREATE OR REPLACE TRIGGER ASU."TVACCANCEL_TYPE$BI" before insert
on TVACCANCEL_TYPE for each row
begin
    --  Column "FK_ID" uses sequence SEQ_VAC_CANCEL_TYPE
    if :new.FK_ID is null then
      select SEQ_VAC_CANCEL_TYPE.NEXTVAL INTO :new.FK_ID from dual;
    end if;

end;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TVACCANCEL_TYPE 
-- 
ALTER TABLE ASU.TVACCANCEL_TYPE ADD (
  CONSTRAINT PK_TVACCANCEL_TYPE
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

