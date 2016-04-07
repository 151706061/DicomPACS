DROP TABLE ASU.THELP_TYPE CASCADE CONSTRAINTS
/

--
-- THELP_TYPE  (Table) 
--
CREATE TABLE ASU.THELP_TYPE
(
  FK_ID    NUMBER,
  FC_NAME  VARCHAR2(255 BYTE)
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

COMMENT ON TABLE ASU.THELP_TYPE IS 'Справочник вида медико-санитарной помощи Author:Kulbatsky'
/

COMMENT ON COLUMN ASU.THELP_TYPE.FK_ID IS 'Это не сиквенция!'
/

COMMENT ON COLUMN ASU.THELP_TYPE.FC_NAME IS 'Наименование'
/


--
-- I_THELP_TYPE_ID  (Index) 
--
--  Dependencies: 
--   THELP_TYPE (Table)
--
CREATE INDEX ASU.I_THELP_TYPE_ID ON ASU.THELP_TYPE
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


