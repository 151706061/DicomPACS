-- Start of DDL Script for Table MED.TLATIN_NAMES
-- Generated 28.11.07 18:39:09 from MED@ASU

CREATE TABLE med.tlatin_names
    (fk_id                          NUMBER(*,0) NOT NULL,
    fc_name                        VARCHAR2(1024),
    fl_del                         NUMBER(1,0))
  PCTFREE     10
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  usr
  STORAGE   (
    INITIAL     65536
    MINEXTENTS  1
    MAXEXTENTS  2147483645
  )
/

ALTER TABLE MED.TLATIN_NAMES 
 MODIFY (
  FL_DEL DEFAULT 0
 )
/
CREATE Unique INDEX MED.TLATIN_NAMES_PK ON MED.TLATIN_NAMES
   (  FK_ID ASC  ) 
/
-- Comments for MED.TLATIN_NAMES

COMMENT ON TABLE med.tlatin_names IS 'таблица для хранения названий медикаментов, которые назначают врачи. Изначально предполагалось хранить здесь международные имена, потом ЛАТИНСКИЕ, а на деле здесь будет мусорка со сленгом врачей (комент by Воронов О.А.)'
/
COMMENT ON COLUMN med.tlatin_names.fc_name IS 'имя медикамента'
/
COMMENT ON COLUMN med.tlatin_names.fk_id IS 'ключ'
/
COMMENT ON COLUMN med.tlatin_names.fl_del IS 'признак удаления (1 - удален, для добавления новых назначений эту строку не отображаем, 0 - нет, отображаем везде).'
/

CREATE SEQUENCE med.seq_tlatin_names
  INCREMENT BY 1
  START WITH 16020
  MINVALUE 1
  MAXVALUE 99999999999999999999
  NOCYCLE
  NOORDER
  CACHE 20
/
-- Triggers for MED.TLATIN_NAMES

CREATE OR REPLACE TRIGGER "MED"."TLATIN_NAMES_BEFORE_INSERT"
BEFORE INSERT
ON MED.TLATIN_NAMES
REFERENCING OLD AS OLD NEW AS NEW
FOR EACH ROW
BEGIN
  SELECT MED.SEQ_TLATIN_NAMES.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
END;
/



-- End of DDL Script for Table MED.TLATIN_NAMES

