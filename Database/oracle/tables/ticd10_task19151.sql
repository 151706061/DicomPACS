DROP TABLE ASU.TICD10_TASK19151 CASCADE CONSTRAINTS
/

--
-- TICD10_TASK19151  (Table) 
--
CREATE TABLE ASU.TICD10_TASK19151
(
  FK_ID      INTEGER                            NOT NULL,
  FK_PARENT  INTEGER,
  FC_NAME    VARCHAR2(250 BYTE)                 NOT NULL,
  FC_KOD     VARCHAR2(10 BYTE)                  NOT NULL,
  FC_SYMB    VARCHAR2(1 BYTE),
  FC_DESC    CLOB,
  FC_KOD1    VARCHAR2(10 BYTE)
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
LOB (FC_DESC) STORE AS 
      ( TABLESPACE  USR 
        ENABLE      STORAGE IN ROW
        CHUNK       8192
        PCTVERSION  10
        NOCACHE
        NOLOGGING
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


