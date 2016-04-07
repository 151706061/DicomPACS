ALTER TABLE ASU.TRICHVIEW_TEMPL
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TRICHVIEW_TEMPL CASCADE CONSTRAINTS
/

--
-- TRICHVIEW_TEMPL  (Table) 
--
CREATE TABLE ASU.TRICHVIEW_TEMPL
(
  FK_ID        INTEGER                          NOT NULL,
  FK_SMID      INTEGER                          NOT NULL,
  FN_COMPRESS  INTEGER                          DEFAULT 1                     NOT NULL,
  FD           DATE                             DEFAULT sysdate               NOT NULL,
  FK_SOTR      INTEGER                          NOT NULL,
  FB_BLOB      BLOB,
  FC_NAME      VARCHAR2(200 BYTE)               NOT NULL,
  RC_REMARK    VARCHAR2(4000 BYTE),
  FN_TYPE      INTEGER                          DEFAULT 2                     NOT NULL,
  FN_ORDER     INTEGER                          DEFAULT 0
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          18440K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOLOGGING 
NOCOMPRESS 
LOB (FB_BLOB) STORE AS 
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

COMMENT ON COLUMN ASU.TRICHVIEW_TEMPL.FK_ID IS 'SEQUENCE=[SEQ_TRICHVIEWDATA]'
/

COMMENT ON COLUMN ASU.TRICHVIEW_TEMPL.FN_COMPRESS IS 'ТИП компресси, 0 - нет, 1 - станрдртно DOA'
/

COMMENT ON COLUMN ASU.TRICHVIEW_TEMPL.FD IS 'ДАТА изменения создания'
/

COMMENT ON COLUMN ASU.TRICHVIEW_TEMPL.FK_SOTR IS 'Сотдрудник изменивший'
/

COMMENT ON COLUMN ASU.TRICHVIEW_TEMPL.FC_NAME IS 'Название'
/

COMMENT ON COLUMN ASU.TRICHVIEW_TEMPL.RC_REMARK IS 'Примечания'
/

COMMENT ON COLUMN ASU.TRICHVIEW_TEMPL.FN_TYPE IS 'Тип шаблона: 1- шаблоны автозаполнения, 2 - пользовательские шаблоны'
/

COMMENT ON COLUMN ASU.TRICHVIEW_TEMPL.FN_ORDER IS 'Сортировка используется в системных шаблонах'
/


--
-- PK_TRICHVIEW_TEMP  (Index) 
--
--  Dependencies: 
--   TRICHVIEW_TEMPL (Table)
--
CREATE UNIQUE INDEX ASU.PK_TRICHVIEW_TEMP ON ASU.TRICHVIEW_TEMPL
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
-- TRICHVIEW_TEMPL_BY_FK_SMID  (Index) 
--
--  Dependencies: 
--   TRICHVIEW_TEMPL (Table)
--
CREATE INDEX ASU.TRICHVIEW_TEMPL_BY_FK_SMID ON ASU.TRICHVIEW_TEMPL
(FK_SMID)
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
-- TRICH_VIEW_TEMPL_BY_FK_SOTR  (Index) 
--
--  Dependencies: 
--   TRICHVIEW_TEMPL (Table)
--
CREATE INDEX ASU.TRICH_VIEW_TEMPL_BY_FK_SOTR ON ASU.TRICHVIEW_TEMPL
(FK_SOTR)
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
-- TRICHVIEW_TEMPL_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TRICHVIEW_TEMPL (Table)
--
CREATE OR REPLACE TRIGGER ASU."TRICHVIEW_TEMPL_BEFORE_INSERT" 
 BEFORE 
 INSERT
 ON ASU.TRICHVIEW_TEMPL  FOR EACH ROW
BEGIN
    if :new.FK_ID is null then
      select SEQ_TRICHVIEWDATA.NEXTVAL INTO :new.FK_ID from dual;
    end if;
END;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TRICHVIEW_TEMPL 
-- 
ALTER TABLE ASU.TRICHVIEW_TEMPL ADD (
  CONSTRAINT PK_TRICHVIEW_TEMP
 PRIMARY KEY
 (FK_ID)
    USING INDEX 
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
               ))
/

