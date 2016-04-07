ALTER TABLE ASU.TVAC_STORE
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TVAC_STORE CASCADE CONSTRAINTS
/

--
-- TVAC_STORE  (Table) 
--
CREATE TABLE ASU.TVAC_STORE
(
  FK_ID     INTEGER                             NOT NULL,
  FK_OTDEL  INTEGER                             NOT NULL,
  FC_REM    VARCHAR2(200 BYTE)
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

COMMENT ON TABLE ASU.TVAC_STORE IS 'Места учета вакцин и проб
Author: Ura'
/

COMMENT ON COLUMN ASU.TVAC_STORE.FK_ID IS 'SEQUENCE=[SEQ_VAC_STORE]'
/

COMMENT ON COLUMN ASU.TVAC_STORE.FK_OTDEL IS 'LOGIN.TOTDEL'
/

COMMENT ON COLUMN ASU.TVAC_STORE.FC_REM IS 'ПРИМЕЧАНИЕ'
/


--
-- IX_TVAC_STORE$FK_OTDEL  (Index) 
--
--  Dependencies: 
--   TVAC_STORE (Table)
--
CREATE UNIQUE INDEX ASU.IX_TVAC_STORE$FK_OTDEL ON ASU.TVAC_STORE
(FK_OTDEL)
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
-- PK_TVAC_STORE  (Index) 
--
--  Dependencies: 
--   TVAC_STORE (Table)
--
CREATE UNIQUE INDEX ASU.PK_TVAC_STORE ON ASU.TVAC_STORE
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
-- TVAC_STORE_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TVAC_STORE (Table)
--
CREATE OR REPLACE TRIGGER ASU."TVAC_STORE_BEFORE_INSERT" BEFORE INSERT
ON ASU.TVAC_STORE FOR EACH ROW
begin
    --  Column "FK_ID" uses sequence SEQ_VAC_STORE
      IF :NEW.FK_ID IS NULL
      THEN
         SELECT SEQ_VAC_STORE.NEXTVAL INTO :NEW.FK_ID from dual;
      END IF;
end;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TVAC_STORE 
-- 
ALTER TABLE ASU.TVAC_STORE ADD (
  CONSTRAINT PK_TVAC_STORE
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

