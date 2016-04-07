ALTER TABLE ASU.TVAC_COMPANY
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TVAC_COMPANY CASCADE CONSTRAINTS
/

--
-- TVAC_COMPANY  (Table) 
--
--  Dependencies: 
--   TVAC_COMPANY_TYPE (Table)
--
CREATE TABLE ASU.TVAC_COMPANY
(
  FK_COMPANY  INTEGER                           NOT NULL,
  FK_TYPE     INTEGER
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          40K
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

COMMENT ON TABLE ASU.TVAC_COMPANY IS 'Значение типа организаци, которая используется в вакцинации
Author: Ura'
/

COMMENT ON COLUMN ASU.TVAC_COMPANY.FK_COMPANY IS 'TCOMPANY.FK_ID'
/

COMMENT ON COLUMN ASU.TVAC_COMPANY.FK_TYPE IS 'Тип контроллируемой организации организации (Школы, д.сады) и т.п.'
/


--
-- IX_TVAC_COMPANY_FN_TYPE  (Index) 
--
--  Dependencies: 
--   TVAC_COMPANY (Table)
--
CREATE INDEX ASU.IX_TVAC_COMPANY_FN_TYPE ON ASU.TVAC_COMPANY
(FK_TYPE)
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
-- PK_TVAC_COMPANY  (Index) 
--
--  Dependencies: 
--   TVAC_COMPANY (Table)
--
CREATE UNIQUE INDEX ASU.PK_TVAC_COMPANY ON ASU.TVAC_COMPANY
(FK_COMPANY)
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
-- Non Foreign Key Constraints for Table TVAC_COMPANY 
-- 
ALTER TABLE ASU.TVAC_COMPANY ADD (
  CONSTRAINT PK_TVAC_COMPANY
 PRIMARY KEY
 (FK_COMPANY)
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

-- 
-- Foreign Key Constraints for Table TVAC_COMPANY 
-- 
ALTER TABLE ASU.TVAC_COMPANY ADD (
  CONSTRAINT FK_TVAC_COM_RF_TVAC_C_TVAC_COM 
 FOREIGN KEY (FK_TYPE) 
 REFERENCES ASU.TVAC_COMPANY_TYPE (FK_ID))
/

