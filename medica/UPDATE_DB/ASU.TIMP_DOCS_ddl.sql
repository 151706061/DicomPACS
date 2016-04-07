-- Start of DDL Script for Table ASU.TIMP_DOCS
-- Generated 19.09.08 14:25:26 from ASU@ASU
DROP TABLE asu.timp_docs
/

CREATE SEQUENCE asu.seq_timp_docs
  INCREMENT BY 1
  START WITH 1
  MINVALUE 1
  MAXVALUE 999999999999999999999999999
  NOCYCLE
  NOORDER
  CACHE 20
/

CREATE TABLE asu.timp_docs
    (fk_id                          NUMBER NOT NULL,
    fc_doc_num                     VARCHAR2(50),
    fd_doc_date                    DATE,
    fc_from                        VARCHAR2(100),
    fc_to                          VARCHAR2(100),
    fc_comment                     VARCHAR2(1024),
    fd_doc_create                  DATE,
    fd_doc_edit                    DATE,
    fn_imp_type                    NUMBER,
    fc_excel_filename              VARCHAR2(1024))
  PCTFREE     10
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  usr
  STORAGE   (
    INITIAL     65536
    MINEXTENTS  1
    MAXEXTENTS  2147483645
  )
  NOCACHE
  MONITORING
/

ALTER TABLE TIMP_DOCS add FN_DOC_TYPE number DEFAULT 0
/
COMMENT ON COLUMN TIMP_DOCS.FN_DOC_TYPE IS 'тип документа: 0 - импорт, 1 - накладная'
/
ALTER TABLE ASU.TIMP_DOCS ADD (FL_SHOW_EXCEL_COLS NUMBER)
/
COMMENT ON COLUMN ASU.TIMP_DOCS.FL_SHOW_EXCEL_COLS IS 'показывать колонки экселя'
/
ALTER TABLE ASU.TIMP_DOCS ADD (FK_FROM NUMBER)
/
COMMENT ON COLUMN TIMP_DOCS.FK_FROM IS 'ID поставщика'
/
ALTER TABLE ASU.TIMP_DOCS ADD (FK_TO NUMBER)
/
COMMENT ON COLUMN TIMP_DOCS.FK_TO IS 'ID получателя'
/


-- Indexes for ASU.TIMP_DOCS

CREATE UNIQUE INDEX asu.timp_docs_fk_id ON asu.timp_docs
  (
    fk_id                           ASC
  )
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  usr
  STORAGE   (
    INITIAL     65536
    MINEXTENTS  1
    MAXEXTENTS  2147483645
  )
NOLOGGING
/

CREATE INDEX asu.timp_docs_fn_imp_type ON asu.timp_docs
  (
    fn_imp_type                     ASC
  )
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  usr
  STORAGE   (
    INITIAL     65536
    MINEXTENTS  1
    MAXEXTENTS  2147483645
  )
NOLOGGING
/

CREATE INDEX asu.timp_docs_fd_doc_date ON asu.timp_docs
  (
    fd_doc_date                     ASC
  )
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  usr
  STORAGE   (
    INITIAL     65536
    MINEXTENTS  1
    MAXEXTENTS  2147483645
  )
NOLOGGING
/



-- Triggers for ASU.TIMP_DOCS

CREATE OR REPLACE TRIGGER ASU.TIMP_DOCS_INS
 BEFORE 
 INSERT
 ON ASU.TIMP_DOCS
 FOR EACH ROW
begin
  if NVL(:new.fk_id,0) < 1 then
    select seq_timp_docs.nextval into :new.fk_id from dual;
  end if;
  :new.FD_DOC_CREATE := sysdate;
end;
/

CREATE OR REPLACE TRIGGER ASU.TIMP_DOCS_DEL
 BEFORE 
 DELETE
 ON ASU.TIMP_DOCS
 REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
begin
  delete from asu.TIMP_POST_NAKL ipn where ipn.FK_TIMP_DOCS = :OLD.FK_ID;
end;
/

CREATE OR REPLACE TRIGGER ASU.TIMP_DOCS_UPD
 BEFORE 
 UPDATE
 ON TIMP_DOCS
 FOR EACH ROW
begin
  :NEW.FD_DOC_EDIT := sysdate;
end;
/

-- Comments for ASU.TIMP_DOCS

COMMENT ON TABLE asu.timp_docs IS 'Таблица для хранения заголовков импортируемых документов (связано с TIMP_POST_NAKL)'
/
COMMENT ON COLUMN asu.timp_docs.fc_comment IS 'комментарий'
/
COMMENT ON COLUMN asu.timp_docs.fc_doc_num IS 'номер документа'
/
COMMENT ON COLUMN asu.timp_docs.fc_excel_filename IS 'имя файла, из которого записи попали в документ при импорте'
/
COMMENT ON COLUMN asu.timp_docs.fc_from IS 'от кого документ'
/
COMMENT ON COLUMN asu.timp_docs.fc_to IS 'кому документ'
/
COMMENT ON COLUMN asu.timp_docs.fd_doc_create IS 'дата создания документа'
/
COMMENT ON COLUMN asu.timp_docs.fd_doc_edit IS 'дата изменения любойго из полей документа'
/
COMMENT ON COLUMN asu.timp_docs.fk_id IS 'ключ'
/
COMMENT ON COLUMN asu.timp_docs.fn_imp_type IS 'тип импортируемых записей: 0 - продукты питания, 1 - медикаменты'
/

-- End of DDL Script for Table ASU.TIMP_DOCS

quit
/