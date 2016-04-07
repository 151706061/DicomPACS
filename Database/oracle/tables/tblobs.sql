DROP TABLE ASU.TBLOBS CASCADE CONSTRAINTS
/

--
-- TBLOBS  (Table) 
--
CREATE TABLE ASU.TBLOBS
(
  FK_ID      NUMBER(15),
  FB_B       BLOB,
  FC_COMENT  VARCHAR2(300 BYTE)
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          10M
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
LOB (FB_B) STORE AS 
      ( TABLESPACE  LOB 
        ENABLE      STORAGE IN ROW
        CHUNK       8192
        PCTVERSION  10
        NOCACHE
        NOLOGGING
        INDEX       (
          TABLESPACE LOB
          STORAGE    (
                      INITIAL          64K
                      NEXT             1
                      MINEXTENTS       1
                      MAXEXTENTS       UNLIMITED
                      PCTINCREASE      0
                      BUFFER_POOL      DEFAULT
                     ))
        STORAGE    (
                    INITIAL          128K
                    NEXT             1M
                    MINEXTENTS       1
                    MAXEXTENTS       UNLIMITED
                    PCTINCREASE      0
                    BUFFER_POOL      DEFAULT
                   )
      )
NOCACHE
NOPARALLEL
MONITORING
/

COMMENT ON TABLE ASU.TBLOBS IS 'Глобальное хранилище бинарных данных by TimurLan LABEL=_EXP DATE=16.02.2004 21:42:54'
/

COMMENT ON COLUMN ASU.TBLOBS.FK_ID IS 'SEQUENCE=[SEQ_TBLOBS]'
/

COMMENT ON COLUMN ASU.TBLOBS.FB_B IS 'бинарные данные'
/

COMMENT ON COLUMN ASU.TBLOBS.FC_COMENT IS 'комментарии'
/


--
-- TBLOBS_ID  (Index) 
--
--  Dependencies: 
--   TBLOBS (Table)
--
CREATE UNIQUE INDEX ASU.TBLOBS_ID ON ASU.TBLOBS
(FK_ID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          256K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TBLOBS_INSERT  (Trigger) 
--
--  Dependencies: 
--   TBLOBS (Table)
--
CREATE OR REPLACE TRIGGER ASU."TBLOBS_INSERT" 
BEFORE  INSERT  ON ASU.TBLOBS REFERENCING
 NEW AS NEW
 OLD AS OLD
FOR EACH ROW
Begin
  select seq_tblobs.nextval into :new.fk_id from dual;
End;
/
SHOW ERRORS;


GRANT DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE ON ASU.TBLOBS TO STAT
/

