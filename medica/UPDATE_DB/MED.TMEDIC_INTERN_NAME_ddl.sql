-- Start of DDL Script for Table MED.TMEDIC_INTERN_NAME
-- Generated 27.11.07 20:00:34 from MED@ASU

CREATE TABLE med.tmedic_intern_name
    (fk_id                          NUMBER NOT NULL,
    fk_intern_name                 NUMBER NOT NULL,
    fk_medic                       NUMBER NOT NULL)
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


CREATE SEQUENCE med.seq_tmedic_intern_name
  INCREMENT BY 1
  START WITH 1
  MINVALUE 1
  MAXVALUE 999999999999999999999999999
  NOCYCLE
  NOORDER
  CACHE 20
/

-- Triggers for MED.TMEDIC_INTERN_NAME

CREATE OR REPLACE TRIGGER MED.TMEDIC_INTERN_NAME_INS
 BEFORE 
 INSERT
 ON MED.TMEDIC_INTERN_NAME
 REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
Begin
  select seq_tmedic_intern_name.nextval into :new.FK_ID from dual;
End;
/


-- Comments for MED.TMEDIC_INTERN_NAME

COMMENT ON TABLE med.tmedic_intern_name IS 'связь между международным именем препарата и препаратом (TLATIN_NAMES и TMEDIC)'
/
COMMENT ON COLUMN med.tmedic_intern_name.fk_id IS 'ключ'
/
COMMENT ON COLUMN med.tmedic_intern_name.fk_intern_name IS 'международное имя (из TLATIN_NAMES)'
/
COMMENT ON COLUMN med.tmedic_intern_name.fk_medic IS 'препарат (из TMEDIC)'
/

-- End of DDL Script for Table MED.TMEDIC_INTERN_NAME

