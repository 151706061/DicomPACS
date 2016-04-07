-- Start of DDL Script for Table NEOTLOZH.TMINZAPAS
-- Generated 29-апр-2011 10:17:03 from NEOTLOZH@H100609

CREATE TABLE med.tminzapas
    (id                            NUMBER,
    medicid                        NUMBER NOT NULL,
    mogroupid                      NUMBER,
    colvo                          NUMBER)
/

CREATE SEQUENCE med.seq_tneotlozh
  INCREMENT BY 1
  START WITH 6661
  MINVALUE 1
  MAXVALUE 999999999
  NOCYCLE
  NOORDER
  CACHE 20
/
-- Triggers for med.TMINZAPAS

CREATE OR REPLACE TRIGGER med.tminzapas_befor_insert
 BEFORE
  INSERT
 ON med.tminzapas
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
  if :new.ID is null then
    select seq_tneotlozh.nextval into :new.ID from dual;
  end if;  
end;
/


-- Comments for med.TMINZAPAS

COMMENT ON TABLE med.tminzapas IS 'Минимальный запас для отделения аптеки. Author:Voronov '
/
COMMENT ON COLUMN med.tminzapas.colvo IS 'кол-во'
/
COMMENT ON COLUMN med.tminzapas.medicid IS 'ссылка на медикамент MED.TMEDIC.medicid'
/
COMMENT ON COLUMN med.tminzapas.mogroupid IS 'ссылка на группу мо med.tmo_group.groupid'
/

-- End of DDL Script for Table med.TMINZAPAS

