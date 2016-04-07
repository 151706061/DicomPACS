DROP TABLE ASU.T_RMT_PHRASES CASCADE CONSTRAINTS
/

--
-- T_RMT_PHRASES  (Table) 
--
CREATE TABLE ASU.T_RMT_PHRASES
(
  FK_SOTR    NUMBER,
  FC_PHRASE  CLOB,
  FK_ID      NUMBER
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
LOB (FC_PHRASE) STORE AS 
      ( TABLESPACE  USR 
        ENABLE      STORAGE IN ROW
        CHUNK       8192
        PCTVERSION  10
        NOCACHE
        INDEX       (
          TABLESPACE USR
          STORAGE    (
                      INITIAL          64K
                      NEXT             1
                      MINEXTENTS       1
                      MAXEXTENTS       UNLIMITED
                      PCTINCREASE      0
                      BUFFER_POOL      DEFAULT
                     ))
        STORAGE    (
                    INITIAL          64K
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

COMMENT ON TABLE ASU.T_RMT_PHRASES IS 'RemoteDoctor. Фразы'
/

COMMENT ON COLUMN ASU.T_RMT_PHRASES.FK_SOTR IS 'Сотрудник'
/

COMMENT ON COLUMN ASU.T_RMT_PHRASES.FC_PHRASE IS 'Фраза'
/

COMMENT ON COLUMN ASU.T_RMT_PHRASES.FK_ID IS 'Ключ'
/


