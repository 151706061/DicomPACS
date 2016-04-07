
set define off
CREATE TABLE med.TPayCond
    (fk_id                          NUMBER NOT NULL,
     fc_name                        VARCHAR2(50 BYTE)
  )
/

CREATE SEQUENCE MED.SEQ_TPayCond
 START WITH  1
 INCREMENT BY  1
 MINVALUE  1
/

-- Triggers for MED.TFinSource

CREATE OR REPLACE TRIGGER med.TPayCond_ins
 BEFORE
  INSERT
 ON med.TPayCond
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
  if NVL(:new.FK_ID,-1) < 0 then
    select SEQ_TPayCond.nextval into :new.FK_ID from dual;
  end if;
end;
/


-- Comments for MED.TFinSource

COMMENT ON TABLE med.TPayCond IS 'Справочник условий оплаты'
/
COMMENT ON COLUMN med.TPayCond.fk_id IS 'ключ'
/
COMMENT ON COLUMN med.TPayCond.fc_name IS 'название'
/


-- End of DDL Script for Table MED.TFinSource
quit
/
