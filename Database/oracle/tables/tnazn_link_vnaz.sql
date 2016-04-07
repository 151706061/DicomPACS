ALTER TABLE ASU.TNAZN_LINK_VNAZ
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TNAZN_LINK_VNAZ CASCADE CONSTRAINTS
/

--
-- TNAZN_LINK_VNAZ  (Table) 
--
--  Dependencies: 
--   TNAZN (Table)
--
CREATE TABLE ASU.TNAZN_LINK_VNAZ
(
  FK_TNAZN  INTEGER                             NOT NULL,
  FK_VNAZ   INTEGER                             NOT NULL
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          200K
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

COMMENT ON TABLE ASU.TNAZN_LINK_VNAZ IS 'ССылка на Старые назначения
Author: Ura'
/


--
-- PK_TNAZN_LINK_VNAZ  (Index) 
--
--  Dependencies: 
--   TNAZN_LINK_VNAZ (Table)
--
CREATE UNIQUE INDEX ASU.PK_TNAZN_LINK_VNAZ ON ASU.TNAZN_LINK_VNAZ
(FK_TNAZN, FK_VNAZ)
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
-- Non Foreign Key Constraints for Table TNAZN_LINK_VNAZ 
-- 
ALTER TABLE ASU.TNAZN_LINK_VNAZ ADD (
  CONSTRAINT PK_TNAZN_LINK_VNAZ
 PRIMARY KEY
 (FK_TNAZN, FK_VNAZ)
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
-- Foreign Key Constraints for Table TNAZN_LINK_VNAZ 
-- 
ALTER TABLE ASU.TNAZN_LINK_VNAZ ADD (
  CONSTRAINT CK_TNAZN_LINK_VNAZ__TNAZN 
 FOREIGN KEY (FK_TNAZN) 
 REFERENCES ASU.TNAZN (FK_ID))
/

