-- Start of DDL Script for Table MED.TMO_GROUP
-- Generated 19-апр-2007 9:29:45 from MED@ASU
CREATE TABLE med.tmo_group
    (groupid                        NUMBER NOT NULL,
    fc_group                       VARCHAR2(100),
    fl_del                         NUMBER DEFAULT 0
  ,
  CONSTRAINT PK_MOGROUP
  PRIMARY KEY (groupid)
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
-- Triggers for MED.TMO_GROUP
CREATE OR REPLACE TRIGGER med.TMO_GROUP_BEFORE_INSERT
 BEFORE
 INSERT
 ON med.TMO_GROUP
 REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
Begin
  select SEQ_TMO_GROUP.nextval into :new.GROUPID from dual;
End;
/
-- Comments for MED.TMO_GROUP
COMMENT ON TABLE med.tmo_group IS 'Группы метериально ответственных'
/
COMMENT ON COLUMN med.tmo_group.fc_group IS 'Имя группы'
/
COMMENT ON COLUMN med.tmo_group.fl_del IS 'Признак удаления (1 - удалено)'
/
COMMENT ON COLUMN med.tmo_group.groupid IS 'Ключ'
/
-- End of DDL Script for Table MED.TMO_GROUP
