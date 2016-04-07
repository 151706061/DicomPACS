ALTER TABLE ASU.TUSLNOCOMPARE_STOR
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TUSLNOCOMPARE_STOR CASCADE CONSTRAINTS
/

--
-- TUSLNOCOMPARE_STOR  (Table) 
--
CREATE TABLE ASU.TUSLNOCOMPARE_STOR
(
  FK_ID       NUMBER(15)                        NOT NULL,
  FK_USLID    NUMBER(15),
  FK_SMID     NUMBER(15),
  FK_TIPROOM  NUMBER(15)
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

COMMENT ON TABLE ASU.TUSLNOCOMPARE_STOR IS 'В таблицу сохраняются данные о несопоставленных услугах и диагнозах, обнаруженных в процессе выгрузки в DBF Author:Efimov'
/

COMMENT ON COLUMN ASU.TUSLNOCOMPARE_STOR.FK_ID IS 'SEQ_USLNOCOMPARE_STOR'
/

COMMENT ON COLUMN ASU.TUSLNOCOMPARE_STOR.FK_USLID IS 'TUSL_DBF.FK_ID - услуга, при добавлении которой было выявлено отсутствие соответствия'
/

COMMENT ON COLUMN ASU.TUSLNOCOMPARE_STOR.FK_SMID IS 'TSMID.FK_ID - not null если отсутствует соответствие назначение - услуга'
/

COMMENT ON COLUMN ASU.TUSLNOCOMPARE_STOR.FK_TIPROOM IS 'TTIPROOM.FK_ID - not null если отсутствует соответствие профиля койки - стандарт'
/


--
-- I_TUSLNOCOMPARE_STOR_SMIDID  (Index) 
--
--  Dependencies: 
--   TUSLNOCOMPARE_STOR (Table)
--
CREATE INDEX ASU.I_TUSLNOCOMPARE_STOR_SMIDID ON ASU.TUSLNOCOMPARE_STOR
(FK_SMID)
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
-- I_TUSLNOCOMPARE_STOR_TIPROOM  (Index) 
--
--  Dependencies: 
--   TUSLNOCOMPARE_STOR (Table)
--
CREATE INDEX ASU.I_TUSLNOCOMPARE_STOR_TIPROOM ON ASU.TUSLNOCOMPARE_STOR
(FK_TIPROOM)
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
-- I_TUSLNOCOMPARE_STOR_USLID  (Index) 
--
--  Dependencies: 
--   TUSLNOCOMPARE_STOR (Table)
--
CREATE INDEX ASU.I_TUSLNOCOMPARE_STOR_USLID ON ASU.TUSLNOCOMPARE_STOR
(FK_USLID)
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
-- K_TUSLNOCOMPARE_STOR_ID  (Index) 
--
--  Dependencies: 
--   TUSLNOCOMPARE_STOR (Table)
--
CREATE UNIQUE INDEX ASU.K_TUSLNOCOMPARE_STOR_ID ON ASU.TUSLNOCOMPARE_STOR
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
-- Non Foreign Key Constraints for Table TUSLNOCOMPARE_STOR 
-- 
ALTER TABLE ASU.TUSLNOCOMPARE_STOR ADD (
  CONSTRAINT K_TUSLNOCOMPARE_STOR_ID
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

