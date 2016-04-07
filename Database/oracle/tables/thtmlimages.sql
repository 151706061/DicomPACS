ALTER TABLE ASU.THTMLIMAGES
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.THTMLIMAGES CASCADE CONSTRAINTS
/

--
-- THTMLIMAGES  (Table) 
--
--  Dependencies: 
--   TRICHVIEWDATA (Table)
--
CREATE TABLE ASU.THTMLIMAGES
(
  FK_ID        INTEGER                          NOT NULL,
  FC_NAME      VARCHAR2(200 BYTE)               NOT NULL,
  FB_BLOB      BLOB,
  FK_RICHVIEW  INTEGER                          NOT NULL
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
LOB (FB_BLOB) STORE AS 
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
                    INITIAL          128K
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

COMMENT ON TABLE ASU.THTMLIMAGES IS 'Картинки, полученные при экспорте в  HTML
см. TRichviewdata.FB_HTML
AUTHOR: Ura'
/

COMMENT ON COLUMN ASU.THTMLIMAGES.FK_ID IS 'SEQUENCE=[SEQ_TRICHVIEWDATA]'
/

COMMENT ON COLUMN ASU.THTMLIMAGES.FC_NAME IS 'Название файла'
/

COMMENT ON COLUMN ASU.THTMLIMAGES.FB_BLOB IS 'Сам файл, по умолчанию jpeg'
/

COMMENT ON COLUMN ASU.THTMLIMAGES.FK_RICHVIEW IS 'TRICHVIEW.fk_id'
/


--
-- IX_THTML_IMAGES$FK_RICHVIEW  (Index) 
--
--  Dependencies: 
--   THTMLIMAGES (Table)
--
CREATE INDEX ASU.IX_THTML_IMAGES$FK_RICHVIEW ON ASU.THTMLIMAGES
(FK_RICHVIEW)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          128K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- PK_THTMLIMAGES  (Index) 
--
--  Dependencies: 
--   THTMLIMAGES (Table)
--
CREATE UNIQUE INDEX ASU.PK_THTMLIMAGES ON ASU.THTMLIMAGES
(FK_ID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          128K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- THTMLIMAGES_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   THTMLIMAGES (Table)
--
CREATE OR REPLACE TRIGGER ASU."THTMLIMAGES_BEFORE_INSERT" 
 BEFORE
  INSERT
 ON thtmlimages
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
BEGIN
    if :new.FK_ID is null then
      select SEQ_TRICHVIEWDATA.NEXTVAL INTO :new.FK_ID from dual;
    end if;
END;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table THTMLIMAGES 
-- 
ALTER TABLE ASU.THTMLIMAGES ADD (
  CONSTRAINT PK_THTMLIMAGES
 PRIMARY KEY
 (FK_ID)
    USING INDEX 
    TABLESPACE INDX
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          128K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
               ))
/

-- 
-- Foreign Key Constraints for Table THTMLIMAGES 
-- 
ALTER TABLE ASU.THTMLIMAGES ADD (
  CONSTRAINT FK_THTMLIMAGES$TRICHVIEWDAT 
 FOREIGN KEY (FK_RICHVIEW) 
 REFERENCES ASU.TRICHVIEWDATA (FK_ID) DISABLE)
/

