ALTER TABLE ASU.TKONSULT_USLUG
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TKONSULT_USLUG CASCADE CONSTRAINTS
/

--
-- TKONSULT_USLUG  (Table) 
--
CREATE TABLE ASU.TKONSULT_USLUG
(
  FK_NAZID  NUMBER                              NOT NULL
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

COMMENT ON TABLE ASU.TKONSULT_USLUG IS '“аблица-св€зка дл€ определени€ того, €вл€етс€ ли услуга(назначение) консультативной или нет.
Created by Prihodko N.
Date: 29.04.2010'
/

COMMENT ON COLUMN ASU.TKONSULT_USLUG.FK_NAZID IS 'VNAZ.FK_ID консультативного назначени€. '
/


--
-- PK_TKONSULT_USLUG  (Index) 
--
--  Dependencies: 
--   TKONSULT_USLUG (Table)
--
CREATE UNIQUE INDEX ASU.PK_TKONSULT_USLUG ON ASU.TKONSULT_USLUG
(FK_NAZID)
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
-- Non Foreign Key Constraints for Table TKONSULT_USLUG 
-- 
ALTER TABLE ASU.TKONSULT_USLUG ADD (
  CONSTRAINT PK_TKONSULT_USLUG
 PRIMARY KEY
 (FK_NAZID)
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

