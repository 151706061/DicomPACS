DROP TABLE ASU.TVRACHKAB_NAZ CASCADE CONSTRAINTS
/

--
-- TVRACHKAB_NAZ  (Table) 
--
CREATE TABLE ASU.TVRACHKAB_NAZ
(
  FK_ID           NUMBER(10),
  FK_SOTRKABID    NUMBER(10),
  FK_SMID         NUMBER(15),
  FN_DOSTUP       NUMBER(1)                     DEFAULT 3,
  FN_PODPIS       NUMBER(1)                     DEFAULT 0,
  FN_ACCESS       NUMBER(1)                     DEFAULT 0,
  FK_ID_          NUMBER(15),
  FK_MEDSPEC      NUMBER,
  FK_PMSP         NUMBER,
  FK_VSO_VSD_SSO  NUMBER
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          560K
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

COMMENT ON COLUMN ASU.TVRACHKAB_NAZ.FK_ID IS 'SEQUENCE=[SEQ_TNAZVRACH]'
/

COMMENT ON COLUMN ASU.TVRACHKAB_NAZ.FK_SOTRKABID IS 'код из TVRACHKAB'
/

COMMENT ON COLUMN ASU.TVRACHKAB_NAZ.FK_SMID IS 'код из TSMID'
/

COMMENT ON COLUMN ASU.TVRACHKAB_NAZ.FN_DOSTUP IS 'Доступ к закладкам приёма(1-только осмотр, 2-осмотр и назначения, 3-всё, 4-только назначения)'
/

COMMENT ON COLUMN ASU.TVRACHKAB_NAZ.FN_PODPIS IS 'Право подписи'
/

COMMENT ON COLUMN ASU.TVRACHKAB_NAZ.FN_ACCESS IS 'Право подтверждения (0-нет ничего, 1-право подтверждать, 2-право назначать)'
/

COMMENT ON COLUMN ASU.TVRACHKAB_NAZ.FK_ID_ IS 'Сборный идешник для вьюхи tnazvrach'
/

COMMENT ON COLUMN ASU.TVRACHKAB_NAZ.FK_MEDSPEC IS 'Специальность врача для выгрузки, Add Efimov V 20100603 http://192.168.1.2:15000/redmine/issues/show/5372'
/


--
-- TVRACHKAB_BY_SMID  (Index) 
--
--  Dependencies: 
--   TVRACHKAB_NAZ (Table)
--
CREATE INDEX ASU.TVRACHKAB_BY_SMID ON ASU.TVRACHKAB_NAZ
(FK_SMID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          400K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TVRACHKAB_BY_SOTRID_SMID  (Index) 
--
--  Dependencies: 
--   TVRACHKAB_NAZ (Table)
--
CREATE INDEX ASU.TVRACHKAB_BY_SOTRID_SMID ON ASU.TVRACHKAB_NAZ
(FK_SOTRKABID, FK_SMID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          400K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TVRACHKAB_NAZ_BY_ID  (Index) 
--
--  Dependencies: 
--   TVRACHKAB_NAZ (Table)
--
CREATE UNIQUE INDEX ASU.TVRACHKAB_NAZ_BY_ID ON ASU.TVRACHKAB_NAZ
(FK_ID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          280K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TVRACHKAB_NAZ_BY_ID_  (Index) 
--
--  Dependencies: 
--   TVRACHKAB_NAZ (Table)
--
CREATE UNIQUE INDEX ASU.TVRACHKAB_NAZ_BY_ID_ ON ASU.TVRACHKAB_NAZ
(FK_ID_)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          440K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TVRACHKAB_NAZ_OWNERID  (Index) 
--
--  Dependencies: 
--   TVRACHKAB_NAZ (Table)
--
CREATE INDEX ASU.TVRACHKAB_NAZ_OWNERID ON ASU.TVRACHKAB_NAZ
(FK_SOTRKABID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          320K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TVRACHKAB_NAZ_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TVRACHKAB_NAZ (Table)
--
CREATE OR REPLACE TRIGGER ASU."TVRACHKAB_NAZ_BEFORE_INSERT" 
 BEFORE
 INSERT
 ON ASU.TVRACHKAB_NAZ  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
/* Formatted on 2006/07/05 10:56 (Formatter Plus v4.8.0) */
BEGIN
  IF (:NEW.FK_ID IS NULL OR :NEW.FK_ID < 0) THEN
    SELECT seq_tnazvrach.NEXTVAL
      INTO :NEW.fk_id
      FROM DUAL;
  END IF;
END;
/
SHOW ERRORS;


