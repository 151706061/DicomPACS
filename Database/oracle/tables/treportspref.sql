ALTER TABLE ASU.TREPORTSPREF
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TREPORTSPREF CASCADE CONSTRAINTS
/

--
-- TREPORTSPREF  (Table) 
--
CREATE TABLE ASU.TREPORTSPREF
(
  FK_ID          NUMBER                         NOT NULL,
  FC_NAME        VARCHAR2(100 BYTE),
  FL_BARCODE     NUMBER(1)                      DEFAULT 0                     NOT NULL,
  FL_ONALLPAGES  NUMBER(1)                      DEFAULT 0                     NOT NULL,
  FL_TYPE        NUMBER(1)                      DEFAULT 0,
  FC_SYNONIM     VARCHAR2(50 BYTE)              NOT NULL
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

COMMENT ON COLUMN ASU.TREPORTSPREF.FL_BARCODE IS '0-не печатать,1-одномер без расшифр,2-одномер с расшифр,3-двумерный'
/

COMMENT ON COLUMN ASU.TREPORTSPREF.FL_ONALLPAGES IS '0-только на первой,1-на всех страницах'
/

COMMENT ON COLUMN ASU.TREPORTSPREF.FL_TYPE IS '0-login.tapp,1-stat.t_mds_forms,2-html'
/

COMMENT ON COLUMN ASU.TREPORTSPREF.FC_SYNONIM IS 'синоним, для fl_type<2 числовой'
/


--
-- TREPORTSPREF_ID  (Index) 
--
--  Dependencies: 
--   TREPORTSPREF (Table)
--
CREATE UNIQUE INDEX ASU.TREPORTSPREF_ID ON ASU.TREPORTSPREF
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
-- TREPORTSPREF_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TREPORTSPREF (Table)
--
CREATE OR REPLACE TRIGGER ASU."TREPORTSPREF_BEFORE_INSERT" 
             BEFORE
             INSERT
             ON ASU.TREPORTSPREF              REFERENCING OLD AS Old NEW AS New
             FOR EACH ROW
Begin
              SELECT SEQ_TREPORTSPREF.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
            End;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TREPORTSPREF 
-- 
ALTER TABLE ASU.TREPORTSPREF ADD (
  CONSTRAINT TREPORTSPREF_ID
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

