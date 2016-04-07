-- Start of DDL Script for Table ASU.TIMP_POST_NAKL
-- Generated 20.08.08 12:20:29 from ASU@ASU
set define off

drop TABLE asu.timp_post_nakl
/

CREATE SEQUENCE asu.seq_timp_post_nakl
  INCREMENT BY 1
  START WITH 21
  MINVALUE 1
  MAXVALUE 999999999999999999999999999
  NOCYCLE
  NOORDER
  CACHE 20
/

CREATE SEQUENCE asu.seq_timp_post_nakl_group
  INCREMENT BY 1
  START WITH 1
  MINVALUE 1
  MAXVALUE 999999999999999999999999999
  NOCYCLE
  NOORDER
  CACHE 20
/

CREATE TABLE asu.timp_post_nakl
    (fk_id                          NUMBER NOT NULL,
    fk_tspis_prod_id               NUMBER,
    fd_ins_record                  DATE,
    fc_post                        VARCHAR2(500),
    fc_name                        VARCHAR2(500),
    fc_ei                          VARCHAR2(20),
    fc_kol                         VARCHAR2(20),
    fc_kol_zak                     VARCHAR2(20),
    fc_price                       VARCHAR2(20),
    fc_goden_do                    VARCHAR2(20),
    fk_post_id                     NUMBER,
    fk_name_id                     NUMBER,
    fk_ei_id                       NUMBER,
    fn_kol                         NUMBER,
    fn_kol_zak                     NUMBER,
    fn_price                       NUMBER,
    fd_goden_do                    DATE,
    fd_import_date                 DATE,
    fl_is_imported                 NUMBER(1,0),
    fn_imp_group_num               NUMBER,
    fn_imp_type                    NUMBER(1,0),
    fn_status                      NUMBER)
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

ALTER TABLE ASU.TIMP_POST_NAKL ADD (FC_SERIAL VARCHAR2(50))
/
COMMENT ON COLUMN ASU.TIMP_POST_NAKL.FC_SERIAL IS 'из экселя (серия партии)'
/
ALTER TABLE ASU.TIMP_POST_NAKL ADD (FK_TIMP_DOCS NUMBER)
/
COMMENT ON COLUMN ASU.TIMP_POST_NAKL.FK_TIMP_DOCS IS 'ссылка на ASU.TIMP_DOCS'
/
ALTER TABLE ASU.TIMP_POST_NAKL ADD (FL_IS_FROM_EXCEL NUMBER (1) DEFAULT 0)
/
COMMENT ON COLUMN ASU.TIMP_POST_NAKL.FL_IS_FROM_EXCEL IS '1 - строка из экселя, 0 - добавлена вручную'
/
-- Triggers for ASU.TIMP_POST_NAKL

CREATE OR REPLACE TRIGGER timp_post_nakl_UPD_FL_IMP
 BEFORE 
 UPDATE OF FL_IS_IMPORTED
 ON timp_post_nakl
 REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
begin
  IF :NEW.fl_is_imported = 1 then
    :NEW.fd_import_date := sysdate;
  else
    :NEW.fd_import_date := null;
  END IF;
end;
/

CREATE OR REPLACE TRIGGER ASU.TIMP_POST_NAKL_INS
 BEFORE 
 INSERT
 ON ASU.TIMP_POST_NAKL
 REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW 
begin
  if NVL(:NEW.FK_ID,-1) < 0 then
    select ASU.SEQ_timp_post_nakl.NEXTVAL INTO :NEW.FK_ID from dual;
  end if;
  :NEW.FD_INS_RECORD := sysdate;
  :NEW.FL_IS_IMPORTED := 0;
end;
/

-- Comments for ASU.TIMP_POST_NAKL

COMMENT ON TABLE asu.timp_post_nakl IS 'Промежуточная таблица для хранения списка импортируемых продуктов из накладных поставщиков (Воронов О.А. 16.08.2008)'
/
COMMENT ON COLUMN asu.timp_post_nakl.fc_ei IS 'из экселя (ед. изм.)'
/
COMMENT ON COLUMN asu.timp_post_nakl.fc_goden_do IS 'из экселя (срок годности)'
/
COMMENT ON COLUMN asu.timp_post_nakl.fc_kol IS 'из экселя (Количество поставки)'
/
COMMENT ON COLUMN asu.timp_post_nakl.fc_kol_zak IS 'из экселя (Количество заказа)'
/
COMMENT ON COLUMN asu.timp_post_nakl.fc_name IS 'из экселя  (название продукта)'
/
COMMENT ON COLUMN asu.timp_post_nakl.fc_post IS 'из экселя (Поставщик)'
/
COMMENT ON COLUMN asu.timp_post_nakl.fc_price IS 'из экселя (Цена, р)'
/
COMMENT ON COLUMN asu.timp_post_nakl.fd_goden_do IS 'срок годности'
/
COMMENT ON COLUMN asu.timp_post_nakl.fd_import_date IS 'дата/время импорта'
/
COMMENT ON COLUMN asu.timp_post_nakl.fd_ins_record IS 'дата/время вставки записи'
/
COMMENT ON COLUMN asu.timp_post_nakl.fk_ei_id IS 'ссылка на BUH.TS_EI - если удалось найти в справочнике'
/
COMMENT ON COLUMN asu.timp_post_nakl.fk_id IS 'ключ'
/
COMMENT ON COLUMN asu.timp_post_nakl.fk_name_id IS 'ссылка на  BUH.ts_names.FK_ID - если удалось найти в справочнике'
/
COMMENT ON COLUMN asu.timp_post_nakl.fk_post_id IS 'ID поставщика'
/
COMMENT ON COLUMN asu.timp_post_nakl.fk_tspis_prod_id IS 'ссылка на BUH.TSPIS_PROD.FK_ID'
/
COMMENT ON COLUMN asu.timp_post_nakl.fl_is_imported IS '0 - еще не было импортировано в конечные таблицы, 1 - уже перенесено'
/
COMMENT ON COLUMN asu.timp_post_nakl.fn_imp_group_num IS 'число, которое объединяет записи одного импорта'
/
COMMENT ON COLUMN asu.timp_post_nakl.fn_imp_type IS 'что импортим: 0 - продукты; 1 - медикаменты'
/
COMMENT ON COLUMN asu.timp_post_nakl.fn_kol IS 'Количество поставки'
/
COMMENT ON COLUMN asu.timp_post_nakl.fn_kol_zak IS 'Количество заказа'
/
COMMENT ON COLUMN asu.timp_post_nakl.fn_price IS 'Цена, р'
/
COMMENT ON COLUMN TIMP_POST_NAKL.FN_STATUS IS 'статус записи: что с записью не так. null - не анализировалась, 0 - все ок (см. ASU.PKG_IMP_POST_NAKL.DECODE_FN_STATUS)'
/

-- End of DDL Script for Table ASU.TIMP_POST_NAKL

quit
/
