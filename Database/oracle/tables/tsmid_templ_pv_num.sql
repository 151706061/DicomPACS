ALTER TABLE ASU.TSMID_TEMPL_PV_NUM
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TSMID_TEMPL_PV_NUM CASCADE CONSTRAINTS
/

--
-- TSMID_TEMPL_PV_NUM  (Table) 
--
CREATE TABLE ASU.TSMID_TEMPL_PV_NUM
(
  FK_ID               INTEGER                   NOT NULL,
  FK_SMID_TEMPL_SMID  INTEGER                   NOT NULL,
  FN                  NUMBER                    NOT NULL,
  FK_SMID             INTEGER                   NOT NULL
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          160K
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

COMMENT ON TABLE ASU.TSMID_TEMPL_PV_NUM IS '«начени€ параметра типа NUMBER дл€ шаблонов SMID
Author: Ura'
/

COMMENT ON COLUMN ASU.TSMID_TEMPL_PV_NUM.FK_ID IS 'SEQUENCE=[SEQ_NAZN_PV]'
/

COMMENT ON COLUMN ASU.TSMID_TEMPL_PV_NUM.FK_SMID_TEMPL_SMID IS '—сылка на значение в шаблоне'
/

COMMENT ON COLUMN ASU.TSMID_TEMPL_PV_NUM.FN IS '«начение типа NUMBER'
/

COMMENT ON COLUMN ASU.TSMID_TEMPL_PV_NUM.FK_SMID IS 'ссылка на параметр в SMID'
/


--
-- IX_NAZN_PV_NUMBER_U2  (Index) 
--
--  Dependencies: 
--   TSMID_TEMPL_PV_NUM (Table)
--
CREATE INDEX ASU.IX_NAZN_PV_NUMBER_U2 ON ASU.TSMID_TEMPL_PV_NUM
(FK_SMID_TEMPL_SMID)
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
-- PK_TSMID_TEMPL_PV_NUM  (Index) 
--
--  Dependencies: 
--   TSMID_TEMPL_PV_NUM (Table)
--
CREATE UNIQUE INDEX ASU.PK_TSMID_TEMPL_PV_NUM ON ASU.TSMID_TEMPL_PV_NUM
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
-- TSMID_TEMPL_PV_NUM_BEFORE_INS  (Trigger) 
--
--  Dependencies: 
--   TSMID_TEMPL_PV_NUM (Table)
--
CREATE OR REPLACE TRIGGER ASU."TSMID_TEMPL_PV_NUM_BEFORE_INS" 
 BEFORE INSERT
ON asu.tsmid_templ_pv_num FOR EACH ROW
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
begin
    --  Column "FK_ID" uses sequence SEQ_NAZN_PV
    if :new.FK_ID is null then
      select SEQ_NAZN_PV.NEXTVAL INTO :new.FK_ID from dual;
    end if;
--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TSMID_TEMPL_PV_NUM 
-- 
ALTER TABLE ASU.TSMID_TEMPL_PV_NUM ADD (
  CONSTRAINT PK_TSMID_TEMPL_PV_NUM
 PRIMARY KEY
 (FK_ID)
    USING INDEX 
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
               ))
/

