ALTER TABLE ASU.TPRINTCODES
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TPRINTCODES CASCADE CONSTRAINTS
/

--
-- TPRINTCODES  (Table) 
--
CREATE TABLE ASU.TPRINTCODES
(
  FK_ID       NUMBER                            NOT NULL,
  FD_DATE     DATE,
  FN_APPARAT  NUMBER(2),
  FN_LASTNUM  NUMBER(8)
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
NOLOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING
/

COMMENT ON TABLE ASU.TPRINTCODES IS 'рюакхжю яндепфхр онякедмхе мнлепю пюяоевюрюммшу ьрпху йнднб'
/

COMMENT ON COLUMN ASU.TPRINTCODES.FK_ID IS 'йкчвебне онке'
/

COMMENT ON COLUMN ASU.TPRINTCODES.FD_DATE IS 'дюрю оевюрх ьрпху йнднб'
/

COMMENT ON COLUMN ASU.TPRINTCODES.FN_APPARAT IS 'мнлеп юооюпюрю'
/


--
-- TPRINTCODES_BY_ID  (Index) 
--
--  Dependencies: 
--   TPRINTCODES (Table)
--
CREATE UNIQUE INDEX ASU.TPRINTCODES_BY_ID ON ASU.TPRINTCODES
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
-- Non Foreign Key Constraints for Table TPRINTCODES 
-- 
ALTER TABLE ASU.TPRINTCODES ADD (
  CONSTRAINT TPRINTCODES_BY_ID
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

