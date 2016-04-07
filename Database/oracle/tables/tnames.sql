DROP TABLE ASU.TNAMES CASCADE CONSTRAINTS
/

--
-- TNAMES  (Table) 
--
CREATE TABLE ASU.TNAMES
(
  FK_ID         NUMBER(5),
  FK_RAZDELID   NUMBER(5),
  FK_CHAPTERID  NUMBER(5),
  FK_POINTID    NUMBER(5),
  FC_NAME       VARCHAR2(40 BYTE),
  FC_LATNAME    VARCHAR2(40 BYTE),
  FC_NAMEMEMO   CLOB
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
LOGGING 
NOCOMPRESS 
LOB (FC_NAMEMEMO) STORE AS 
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
                    INITIAL          40K
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


