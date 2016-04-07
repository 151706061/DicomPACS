ALTER TABLE ASU.TKABSOOTVET
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TKABSOOTVET CASCADE CONSTRAINTS
/

--
-- TKABSOOTVET  (Table) 
--
CREATE TABLE ASU.TKABSOOTVET
(
  FK_ID    NUMBER                               NOT NULL,
  FC_NAME  VARCHAR2(512 BYTE)
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

COMMENT ON TABLE ASU.TKABSOOTVET IS '“аблица соответстви€ нескольком кабинетм в системе физически одному  кабинету'
/


--
-- TKABSOOTVET_KEY_ID  (Index) 
--
--  Dependencies: 
--   TKABSOOTVET (Table)
--
CREATE UNIQUE INDEX ASU.TKABSOOTVET_KEY_ID ON ASU.TKABSOOTVET
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
-- TKABSOOTVET_INSERT  (Trigger) 
--
--  Dependencies: 
--   TKABSOOTVET (Table)
--
CREATE OR REPLACE TRIGGER ASU."TKABSOOTVET_INSERT" 
  BEFORE INSERT
  ON ASU.TKABSOOTVET   REFERENCING NEW AS NEW OLD AS OLD
  FOR EACH ROW
Begin
  select SEQ_TKABINET.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
End;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TKABSOOTVET 
-- 
ALTER TABLE ASU.TKABSOOTVET ADD (
  CONSTRAINT TKABSOOTVET_KEY_ID
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

