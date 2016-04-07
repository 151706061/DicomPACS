-- Start of DDL Script for Table MED.TSPISANIEVID
-- Generated 30.07.07 12:22:33 from MED@ASU
CREATE SEQUENCE med.seq_tspisanievid
  INCREMENT BY 1
  START WITH 1
  MINVALUE 1
  MAXVALUE 99999999999999
  NOCYCLE
  NOORDER
  CACHE 20
/

CREATE TABLE med.tspisanievid
    (fk_id                          NUMBER(14,0) NOT NULL,
    fc_name                        VARCHAR2(150),
    fl_del                         NUMBER(1,0) DEFAULT 0)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  usr
  STORAGE   (
    INITIAL     65536
    MINEXTENTS  1
    MAXEXTENTS  2147483645
  )
/

-- Triggers for MED.TSPISANIEVID

CREATE OR REPLACE TRIGGER MED.TSPISANIEVID_BEFORE_INS
 BEFORE 
 INSERT
 ON MED.TSPISANIEVID
 REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
Begin
  IF :NEW.FK_ID IS NULL OR :NEW.FK_ID < 0 THEN
    select SEQ_TSPISANIEVID.nextval into :new.FK_ID from dual;
  END IF;
End;
/


-- Comments for MED.TSPISANIEVID

COMMENT ON TABLE med.tspisanievid IS 'Author: Voronov Oleg
“аблица дл€ хранени€ видов списани€. „тобы не приходилось мен€ть код, если нужно добавить новый вид списани€.'
/
COMMENT ON COLUMN med.tspisanievid.fc_name IS 'описание вида списани€'
/
COMMENT ON COLUMN med.tspisanievid.fk_id IS 'ключ'
/
COMMENT ON COLUMN med.tspisanievid.fl_del IS '1 - удалено, 0 - нет'
/

-- End of DDL Script for Table MED.TSPISANIEVID
