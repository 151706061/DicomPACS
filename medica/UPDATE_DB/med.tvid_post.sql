-- Start of DDL Script for Table MED.TSKLAD
-- Generated 24.11.2008 16:33:35 from MED@ASU
set define off
CREATE TABLE med.tvid_post
    (fk_id                          NUMBER NOT NULL,
    fc_name                        VARCHAR2(100 BYTE)
  ,
  CONSTRAINT PK_FK_vid_post
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

CREATE SEQUENCE MED.SEQ_Tvid_post
 START WITH  1
 INCREMENT BY  1
 MINVALUE  1
/

-- Triggers for MED.TSKLAD

CREATE OR REPLACE TRIGGER med.tvid_post_ins
 BEFORE
  INSERT
 ON med.tvid_post
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
  if NVL(:new.FK_ID,-1) < 0 then
    select SEQ_Tvid_post.nextval into :new.FK_ID from dual;
  end if;
end;
/


-- Comments for MED.TSKLAD

COMMENT ON TABLE med.tvid_post IS 'видов поступления'
/
COMMENT ON COLUMN med.tvid_post.fc_name IS 'название поступления'
/
COMMENT ON COLUMN med.tvid_post.fk_id IS 'ключ'
/

insert into  med.tvid_post (fc_name) values('Конкурсы и аукционы')
/
insert into  med.tvid_post (fc_name) values('Котировка')
/
insert into  med.tvid_post (fc_name) values('Свободный закуп')
/
insert into  med.tvid_post (fc_name) values('Нац. проект')
/
insert into  med.tvid_post (fc_name) values('Федеральная программа')
/
commit
/
-- End of DDL Script for Table MED.TSKLAD
quit
/
