
set define off
CREATE TABLE med.TFinSource
    (fk_id                          NUMBER NOT NULL,
     fc_name                        VARCHAR2(50 BYTE),
     fc_synonim                     VARCHAR2(20 BYTE),
     fk_typedoc_id                 NUMBER
  )
/

CREATE SEQUENCE MED.SEQ_TFinSource
 START WITH  1
 INCREMENT BY  1
 MINVALUE  1
/

-- Triggers for MED.TFinSource

CREATE OR REPLACE TRIGGER med.TFinSource_ins
 BEFORE
  INSERT
 ON med.TFinSource
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
  if NVL(:new.FK_ID,-1) < 0 then
    select SEQ_TFinSource.nextval into :new.FK_ID from dual;
  end if;
end;
/


-- Comments for MED.TFinSource

COMMENT ON TABLE med.TFinSource IS 'Справочник источников финансирования'
/
COMMENT ON COLUMN med.TFinSource.fk_id IS 'ключ'
/
COMMENT ON COLUMN med.TFinSource.fc_name IS 'название источника финансирования'
/
COMMENT ON COLUMN med.TFinSource.fc_synonim IS 'синоним латинскими буквами'
/
COMMENT ON COLUMN med.TFinSource.fk_typedoc_id IS 'ссылка на asu.ttypedoc.fk_id'
/

CREATE UNIQUE INDEX med.tfinsource_c_uniq ON med.tfinsource
  (fk_id ASC)
/

ALTER TABLE med.tfinsource ADD CONSTRAINT tfinsource_c_uniq UNIQUE (fk_id) USING INDEX
/

-- End of DDL Script for Table MED.TFinSource
quit
/
