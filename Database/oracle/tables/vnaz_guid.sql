DROP TABLE ASU.VNAZ_GUID CASCADE CONSTRAINTS
/

--
-- VNAZ_GUID  (Table) 
--
CREATE TABLE ASU.VNAZ_GUID
(
  FK_NAZID  NUMBER(15),
  FC_GUID   VARCHAR2(64 BYTE)
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

COMMENT ON TABLE ASU.VNAZ_GUID IS 'Таблица, содержит в себе GUID отправленного на ПАКС исследования (применяется в PriemDll - при захвате изображения и отправке на ПАКС)
Created By Prihodko N. 03.05.2012'
/

COMMENT ON COLUMN ASU.VNAZ_GUID.FK_NAZID IS 'VNAZ.FK_ID'
/

COMMENT ON COLUMN ASU.VNAZ_GUID.FC_GUID IS 'GUID'
/


--
-- VNAZ_GUID_NAZID  (Index) 
--
--  Dependencies: 
--   VNAZ_GUID (Table)
--
CREATE UNIQUE INDEX ASU.VNAZ_GUID_NAZID ON ASU.VNAZ_GUID
(FK_NAZID)
NOLOGGING
TABLESPACE INDX
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


