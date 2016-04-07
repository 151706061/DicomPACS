ALTER TABLE ASU.TKLADR
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TKLADR CASCADE CONSTRAINTS
/

--
-- TKLADR  (Table) 
--
CREATE TABLE ASU.TKLADR
(
  FK_ID      NUMBER,
  FC_NAME    VARCHAR2(40 BYTE)                  NOT NULL,
  FC_CODE    VARCHAR2(17 BYTE)                  NOT NULL,
  FC_PREFIX  VARCHAR2(10 BYTE),
  FL_DEL     NUMBER                             NOT NULL,
  FK_OWNER   NUMBER                             NOT NULL,
  FN_LEVEL   NUMBER                             NOT NULL,
  FC_OKATO   VARCHAR2(11 BYTE)
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          53M
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

COMMENT ON TABLE ASU.TKLADR IS 'Для заливки КЛАДРа в древовидный справочник из DBF -- Created 20080702 by Linnikov'
/

COMMENT ON COLUMN ASU.TKLADR.FC_NAME IS 'Название (Тульская, Таганрог, Ленина и т.п.)'
/

COMMENT ON COLUMN ASU.TKLADR.FC_CODE IS 'Шифр КЛАДР'
/

COMMENT ON COLUMN ASU.TKLADR.FC_PREFIX IS 'Тип названия (г - город, ул - улица и т.п.)'
/

COMMENT ON COLUMN ASU.TKLADR.FL_DEL IS '1 - запись не актуальна, 0 - актуальна'
/

COMMENT ON COLUMN ASU.TKLADR.FK_OWNER IS 'Родитель (TKLADR.FK_ID)'
/

COMMENT ON COLUMN ASU.TKLADR.FN_LEVEL IS 'Уровень (1-Регион, 2-Район, 3-Город, 4-Нас. пункт, 5-Улица)'
/

COMMENT ON COLUMN ASU.TKLADR.FC_OKATO IS 'Код ОКАТО'
/


--
-- TKLADR_FC_CODE  (Index) 
--
--  Dependencies: 
--   TKLADR (Table)
--
CREATE UNIQUE INDEX ASU.TKLADR_FC_CODE ON ASU.TKLADR
(FC_CODE)
NOLOGGING
TABLESPACE USR
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          29M
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TKLADR_FC_NAME  (Index) 
--
--  Dependencies: 
--   TKLADR (Table)
--
CREATE INDEX ASU.TKLADR_FC_NAME ON ASU.TKLADR
(UPPER("FC_NAME"))
NOLOGGING
TABLESPACE USR
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          23M
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TKLADR_ID_OWNER  (Index) 
--
--  Dependencies: 
--   TKLADR (Table)
--
CREATE INDEX ASU.TKLADR_ID_OWNER ON ASU.TKLADR
(FK_OWNER)
NOLOGGING
TABLESPACE USR
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          17M
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
REVERSE
/


--
-- TKLADR_LEVEL  (Index) 
--
--  Dependencies: 
--   TKLADR (Table)
--
CREATE INDEX ASU.TKLADR_LEVEL ON ASU.TKLADR
(FN_LEVEL)
NOLOGGING
TABLESPACE USR
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          12M
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
COMPRESS 1
/


--
-- TKLADR_PK  (Index) 
--
--  Dependencies: 
--   TKLADR (Table)
--
CREATE UNIQUE INDEX ASU.TKLADR_PK ON ASU.TKLADR
(FK_ID)
NOLOGGING
TABLESPACE USR
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          16M
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TKLADR_1_11  (Index) 
--
--  Dependencies: 
--   TKLADR (Table)
--
CREATE INDEX ASU.TKLADR_1_11 ON ASU.TKLADR
(SUBSTR("FC_CODE",1,11))
NOLOGGING
TABLESPACE USR
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          25M
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TKLADR_1_5  (Index) 
--
--  Dependencies: 
--   TKLADR (Table)
--
CREATE INDEX ASU.TKLADR_1_5 ON ASU.TKLADR
(SUBSTR("FC_CODE",1,5))
NOLOGGING
TABLESPACE USR
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          18M
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TKLADR_1_8  (Index) 
--
--  Dependencies: 
--   TKLADR (Table)
--
CREATE INDEX ASU.TKLADR_1_8 ON ASU.TKLADR
(SUBSTR("FC_CODE",1,8))
NOLOGGING
TABLESPACE USR
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          22M
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TKLADR_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TKLADR (Table)
--
CREATE OR REPLACE TRIGGER ASU."TKLADR_BEFORE_INSERT" 
 BEFORE INSERT ON ASU.TKLADR  REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
BEGIN
if   :NEW.FK_ID is null then 
 SELECT SEQ_TKLADR.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
 end if;
END;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TKLADR 
-- 
ALTER TABLE ASU.TKLADR ADD (
  CONSTRAINT TKLADR_PK
 PRIMARY KEY
 (FK_ID)
    USING INDEX 
    TABLESPACE USR
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          16M
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
               ))
/

