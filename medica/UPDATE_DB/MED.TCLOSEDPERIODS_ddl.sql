-- Create table
create table MED.TCLOSEDPERIODS
(
  FK_ID     NUMBER not null,
  FD_BEGIN  DATE not null,
  FD_END    DATE not null,
  FL_PODPIS NUMBER(1) default 0 not null,
  FK_MO     NUMBER not null,
  FD_DATE   DATE default sysdate not null,
  FL_DEL    NUMBER default 0 not null
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
-- Add comments to the table 
comment on table MED.TCLOSEDPERIODS
  is 'Таблица закрытых периодов';
-- Add comments to the columns 
comment on column MED.TCLOSEDPERIODS.FK_ID
  is 'Первичный ключ';
comment on column MED.TCLOSEDPERIODS.FD_BEGIN
  is 'Начало периода';
comment on column MED.TCLOSEDPERIODS.FD_END
  is 'Конец периода';
comment on column MED.TCLOSEDPERIODS.FL_PODPIS
  is '1 - подписан';
comment on column MED.TCLOSEDPERIODS.FK_MO
  is 'последний МО, который редактировал запись';
comment on column MED.TCLOSEDPERIODS.FD_DATE
  is 'Дата последнего изменения';
comment on column MED.TCLOSEDPERIODS.FL_DEL
  is '1 - удален';
-- Create/Recreate primary, unique and foreign key constraints 
alter table MED.TCLOSEDPERIODS
  add constraint PK_TCLOSEDPERIODS primary key (FK_ID)
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

/

-- Create sequence 
create sequence MED.SEQ_TCLOSEDPERIODS
minvalue 1
maxvalue 999999999999999
start with 100
increment by 1
nocache;

/

CREATE OR REPLACE TRIGGER "MED"."TCLOSEDPERIODS_INS" 
 BEFORE
 INSERT
 ON MED.TCLOSEDPERIODS
 REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
BEGIN
  IF (:NEW.FK_ID IS NULL) OR (:NEW.FK_ID < 0) THEN
    SELECT SEQ_TCLOSEDPERIODS.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
  END IF;
END;
