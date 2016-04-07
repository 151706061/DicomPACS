DROP TABLE ASU.TGRAPH_TMP_26022013 CASCADE CONSTRAINTS
/

--
-- TGRAPH_TMP_26022013  (Table) 
--
CREATE TABLE ASU.TGRAPH_TMP_26022013
(
  FK_ID              NUMBER(15)                 NOT NULL,
  FK_RASPID          NUMBER(15)                 NOT NULL,
  FL_SEX             NUMBER                     NOT NULL,
  FK_PACLSTID        NUMBER(15),
  FN_COUNT           NUMBER(10),
  FT_HOUR            VARCHAR2(2 BYTE),
  FT_MIN             VARCHAR2(2 BYTE),
  FD_DATE            DATE,
  FN_INTERVAL        NUMBER,
  FT_END             DATE,
  FL_OCHERED         NUMBER,
  FK_KABINETTALONID  NUMBER,
  FL_SHOW            NUMBER
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


