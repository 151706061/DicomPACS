-- Start of DDL Script for Table MED.TSKLAD
-- Generated 24.11.2008 16:33:35 from MED@ASU
set define off
CREATE TABLE med.tsklad
    (fk_id                          NUMBER NOT NULL,
    fc_name                        VARCHAR2(100 BYTE),
    fc_synonim                     VARCHAR2(100 BYTE),
    fc_name_rep                    VARCHAR2(100 BYTE)
  ,
  CONSTRAINT PK_FK_SKLAD_ID
  PRIMARY KEY (fk_id)
  USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  usr
  STORAGE   (
    INITIAL     65536
    MINEXTENTS  1
    MAXEXTENTS  2147483645
  ))
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

ALTER TABLE MED.TSKLAD ADD (FC_MAINFORM_CAPTION VARCHAR2 (100))
/
COMMENT ON COLUMN MED.TSKLAD.FC_MAINFORM_CAPTION IS 'текст заголовка главной формы'
/

ALTER TABLE MED.TSKLAD ADD (FC_OBJ_UCH_NAME VARCHAR2 (100))
/
COMMENT ON COLUMN MED.TSKLAD.FC_OBJ_UCH_NAME IS 'Название объектов учета'
/

CREATE SEQUENCE MED.SEQ_TSKLAD
 START WITH  1
 INCREMENT BY  1
 MINVALUE  1
/

-- Triggers for MED.TSKLAD

CREATE OR REPLACE TRIGGER med.tsklad_ins
 BEFORE
  INSERT
 ON med.tsklad
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
  if NVL(:new.FK_ID,-1) < 0 then
    select SEQ_TSKLAD.nextval into :new.FK_ID from dual;
  end if;
end;
/


-- Comments for MED.TSKLAD

COMMENT ON TABLE med.tsklad IS 'Список складов на базе аптеки'
/
COMMENT ON COLUMN med.tsklad.fc_name IS 'название склада'
/
COMMENT ON COLUMN med.tsklad.fc_name_rep IS 'название для отчетов'
/
COMMENT ON COLUMN med.tsklad.fc_synonim IS 'синоним склада латинскими буквами'
/
COMMENT ON COLUMN med.tsklad.fk_id IS 'ключ'
/

-- End of DDL Script for Table MED.TSKLAD
quit
/
