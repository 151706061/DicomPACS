ALTER TABLE ASU.TPRAVA_PASPORT
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TPRAVA_PASPORT CASCADE CONSTRAINTS
/

--
-- TPRAVA_PASPORT  (Table) 
--
CREATE TABLE ASU.TPRAVA_PASPORT
(
  FK_ID       NUMBER                            NOT NULL,
  FK_OTD      NUMBER                            NOT NULL,
  FK_TYPEDOC  NUMBER                            NOT NULL
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

COMMENT ON TABLE ASU.TPRAVA_PASPORT IS 'Shpielevoy Права доступа в Паспорте здоровья'
/

COMMENT ON COLUMN ASU.TPRAVA_PASPORT.FK_OTD IS 'id отделения которому назначаем права'
/

COMMENT ON COLUMN ASU.TPRAVA_PASPORT.FK_TYPEDOC IS 'Тип документа обслуживания, ссылка на TUSLVID.FK_ID'
/


--
-- TPRAVA_PASPORT_ID  (Index) 
--
--  Dependencies: 
--   TPRAVA_PASPORT (Table)
--
CREATE UNIQUE INDEX ASU.TPRAVA_PASPORT_ID ON ASU.TPRAVA_PASPORT
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
-- TPRAVA_TYPEDOC_BY_OTDTYPE  (Index) 
--
--  Dependencies: 
--   TPRAVA_PASPORT (Table)
--
CREATE UNIQUE INDEX ASU.TPRAVA_TYPEDOC_BY_OTDTYPE ON ASU.TPRAVA_PASPORT
(FK_OTD, FK_TYPEDOC)
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
-- TPRAVA_PASPORT_BEFOR_INSERT  (Trigger) 
--
--  Dependencies: 
--   TPRAVA_PASPORT (Table)
--
CREATE OR REPLACE TRIGGER ASU."TPRAVA_PASPORT_BEFOR_INSERT" 
  before insert on asu.TPRAVA_PASPORT  
  for each row
begin

  SELECT ASU.SEQ_TPRAVA_PASPORT.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
  
end TPRAVA_PASPORT_BEFOR_INSERT;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TPRAVA_PASPORT 
-- 
ALTER TABLE ASU.TPRAVA_PASPORT ADD (
  CONSTRAINT TPRAVA_PASPORT_ID
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

