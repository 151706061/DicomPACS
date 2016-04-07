ALTER TABLE ASU.TMATRIX_TEMPLATES
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TMATRIX_TEMPLATES CASCADE CONSTRAINTS
/

--
-- TMATRIX_TEMPLATES  (Table) 
--
CREATE TABLE ASU.TMATRIX_TEMPLATES
(
  FK_ID                NUMBER                   NOT NULL,
  FK_PRESCRIPTION_ID   NUMBER                   NOT NULL,
  FN_HEIGHT            NUMBER                   NOT NULL,
  FN_WIDTH             NUMBER                   NOT NULL,
  FB_DISPLAY           BLOB,
  FB_DISPLAY_SELECTED  BLOB,
  FN_DEFAULT           NUMBER                   DEFAULT 0,
  FB_DISPLAY_ACTIVE    BLOB
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
LOB (FB_DISPLAY) STORE AS 
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
  LOB (FB_DISPLAY_SELECTED) STORE AS 
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
  LOB (FB_DISPLAY_ACTIVE) STORE AS 
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

COMMENT ON TABLE ASU.TMATRIX_TEMPLATES IS 'Предназначена для храниения шаблонов изображений матриц. Author: rca'
/

COMMENT ON COLUMN ASU.TMATRIX_TEMPLATES.FN_HEIGHT IS 'Высота матрицы изображения'
/

COMMENT ON COLUMN ASU.TMATRIX_TEMPLATES.FN_WIDTH IS 'Ширина матрицы изображения'
/

COMMENT ON COLUMN ASU.TMATRIX_TEMPLATES.FB_DISPLAY IS 'Изображение матрицы дисплея'
/

COMMENT ON COLUMN ASU.TMATRIX_TEMPLATES.FB_DISPLAY_SELECTED IS 'Изображение выбранной матрицы дисплея'
/

COMMENT ON COLUMN ASU.TMATRIX_TEMPLATES.FN_DEFAULT IS '1-Использовать изображение по умолчанию'
/

COMMENT ON COLUMN ASU.TMATRIX_TEMPLATES.FB_DISPLAY_ACTIVE IS 'Изображение активной матрицы дисплея'
/

COMMENT ON COLUMN ASU.TMATRIX_TEMPLATES.FK_ID IS 'Уникальный идентификатор'
/

COMMENT ON COLUMN ASU.TMATRIX_TEMPLATES.FK_PRESCRIPTION_ID IS 'Уникальный идентификатор назначения'
/


--
-- IX_TMATRIX_TMPLS$FK_PRESCRIPT  (Index) 
--
--  Dependencies: 
--   TMATRIX_TEMPLATES (Table)
--
CREATE UNIQUE INDEX ASU.IX_TMATRIX_TMPLS$FK_PRESCRIPT ON ASU.TMATRIX_TEMPLATES
(FK_PRESCRIPTION_ID)
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


--
-- PK_TMATRIX_TEMPLATES  (Index) 
--
--  Dependencies: 
--   TMATRIX_TEMPLATES (Table)
--
CREATE UNIQUE INDEX ASU.PK_TMATRIX_TEMPLATES ON ASU.TMATRIX_TEMPLATES
(FK_ID)
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


--
-- TMATRIX_TEMPLATES$BI  (Trigger) 
--
--  Dependencies: 
--   TMATRIX_TEMPLATES (Table)
--
CREATE OR REPLACE TRIGGER ASU."TMATRIX_TEMPLATES$BI" 
 BEFORE
  INSERT
 ON asu.tmatrix_templates
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
BEGIN
  --  Column "FK_ID" uses sequence SEQ_TMATRIX_TEMPLATES
  SELECT SEQ_TMATRIX_TEMPLATES.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
END;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TMATRIX_TEMPLATES 
-- 
ALTER TABLE ASU.TMATRIX_TEMPLATES ADD (
  CONSTRAINT PK_TMATRIX_TEMPLATES
 PRIMARY KEY
 (FK_ID)
    USING INDEX 
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
               ))
/

