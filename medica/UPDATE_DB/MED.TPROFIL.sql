------------------------------------------
-- Export file for user MED             --
-- Created by 5 on 28.08.2012, 10:28:07 --
------------------------------------------

spool MED.log

prompt
prompt Creating table TPROFIL
prompt ======================
prompt
create table MED.TPROFIL
(
  FK_ID   NUMBER not null,
  FC_NAME VARCHAR2(500) not null,
  FL_DEL  NUMBER(1) default 0 not null
)
tablespace USR
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table MED.TPROFIL
  is 'Список профилей. Может использоваться как справочник второстепенных причин списания. Author: Neronov A.S. 27.08.2012';
comment on column MED.TPROFIL.FK_ID
  is '[MED.SEQ_TPROFIL] Первичный ключ';
comment on column MED.TPROFIL.FC_NAME
  is 'Название';
comment on column MED.TPROFIL.FL_DEL
  is '1 - удален';
alter table MED.TPROFIL
  add constraint TPROFIL_PK primary key (FK_ID)
  using index 
  tablespace USR
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating sequence SEQ_TPROFIL
prompt =============================
prompt
create sequence MED.SEQ_TPROFIL
minvalue 1
maxvalue 999999999999999999
start with 9
increment by 1
cache 2;

prompt
prompt Creating trigger TPROFIL_INS
prompt ============================
prompt
CREATE OR REPLACE TRIGGER MED.TPROFIL_INS
 BEFORE
 INSERT
 ON MED.TPROFIL
 REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
BEGIN
  IF :NEW.FK_ID IS NULL OR :NEW.FK_ID < 0 THEN
    SELECT SEQ_TPROFIL.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
  END IF;
END;
/


spool off
