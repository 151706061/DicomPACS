-- Start of DDL Script for Table MED.TMO_IN_GROUP
-- Generated 19-апр-2007 9:30:28 from MED@ASU
CREATE TABLE med.tmo_in_group
    (fk_id                          NUMBER NOT NULL,
    fk_mo                          NUMBER,
    fk_group                       NUMBER,
    fl_del                         NUMBER DEFAULT 0
  ,
  CONSTRAINT PK_TMO_IN_GROUP
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
-- Triggers for MED.TMO_IN_GROUP
CREATE OR REPLACE TRIGGER med.TMO_IN_GROUP_BEFORE_INSERT
BEFORE INSERT
ON med.TMO_IN_GROUP
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
Begin
  select SEQ_TMO_IN_GROUP.nextval into :new.FK_ID from dual;
End;
/
-- Comments for MED.TMO_IN_GROUP
COMMENT ON COLUMN med.tmo_in_group.fk_group IS 'TMO_GROUP.GROUPID'
/
COMMENT ON COLUMN med.tmo_in_group.fk_id IS 'Ключ'
/
COMMENT ON COLUMN med.tmo_in_group.fk_mo IS 'TMO.MOID'
/
COMMENT ON COLUMN med.tmo_in_group.fl_del IS 'Признак удаления'
/
-- End of DDL Script for Table MED.TMO_IN_GROUP
