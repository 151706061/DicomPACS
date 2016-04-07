ALTER TABLE ASU.TBUNKS
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TBUNKS CASCADE CONSTRAINTS
/

--
-- TBUNKS  (Table) 
--
CREATE TABLE ASU.TBUNKS
(
  FK_ID       NUMBER                            NOT NULL,
  FC_NAME     VARCHAR2(4000 BYTE),
  FC_COMMENT  VARCHAR2(4000 BYTE),
  FL_DEL      NUMBER                            DEFAULT 0,
  FK_ROOMID   NUMBER
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


--
-- PK_BUNKS  (Index) 
--
--  Dependencies: 
--   TBUNKS (Table)
--
CREATE UNIQUE INDEX ASU.PK_BUNKS ON ASU.TBUNKS
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
-- TBUNKS_BI  (Trigger) 
--
--  Dependencies: 
--   TBUNKS (Table)
--
CREATE OR REPLACE TRIGGER ASU."TBUNKS_BI" 
 BEFORE
  INSERT
 ON ASU.TBUNKS REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
Begin
  SELECT ASU.SEQ_TBUNKS.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
End;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TBUNKS 
-- 
ALTER TABLE ASU.TBUNKS ADD (
  CONSTRAINT PK_BUNKS
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

