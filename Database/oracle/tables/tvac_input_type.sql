ALTER TABLE ASU.TVAC_INPUT_TYPE
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TVAC_INPUT_TYPE CASCADE CONSTRAINTS
/

--
-- TVAC_INPUT_TYPE  (Table) 
--
CREATE TABLE ASU.TVAC_INPUT_TYPE
(
  FK_ID    INTEGER                              NOT NULL,
  FC_NAME  VARCHAR2(50 BYTE)                    NOT NULL
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

COMMENT ON TABLE ASU.TVAC_INPUT_TYPE IS 'Способы ввдения препаратов
Не имеет интерфейса воода
Author: Ura'
/

COMMENT ON COLUMN ASU.TVAC_INPUT_TYPE.FC_NAME IS 'Название способа'
/


--
-- PK_TVAC_INPUT_TYPE  (Index) 
--
--  Dependencies: 
--   TVAC_INPUT_TYPE (Table)
--
CREATE UNIQUE INDEX ASU.PK_TVAC_INPUT_TYPE ON ASU.TVAC_INPUT_TYPE
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
-- Non Foreign Key Constraints for Table TVAC_INPUT_TYPE 
-- 
ALTER TABLE ASU.TVAC_INPUT_TYPE ADD (
  CONSTRAINT PK_TVAC_INPUT_TYPE
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

