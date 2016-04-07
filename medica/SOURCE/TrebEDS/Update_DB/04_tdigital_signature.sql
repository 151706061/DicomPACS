-- Create table
create table ASU.TDIGITAL_SIGNATURE
(
  FK_ID          INTEGER not null,
  FK_SQL_RULEID  INTEGER,
  FK_MAINTABLEID INTEGER,
  FD_DATE        DATE,
  FK_KEYID       INTEGER,
  FC_SIGNATURE   VARCHAR2(4000),
  FK_PEOPLEID    INTEGER
)
tablespace USR
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
-- Add comments to the table 
comment on table ASU.TDIGITAL_SIGNATURE
  is 'Цифровые подписи Author: Linnikov';
-- Add comments to the columns 
comment on column ASU.TDIGITAL_SIGNATURE.FK_ID
  is 'SEQ_TDIGITAL_SIGNATURE';
comment on column ASU.TDIGITAL_SIGNATURE.FK_SQL_RULEID
  is 'Запрос, формирующий подписываемые данные [TSIGN_SQL_RULES.FK_ID]';
comment on column ASU.TDIGITAL_SIGNATURE.FK_MAINTABLEID
  is 'FK_ID главной таблицы';
comment on column ASU.TDIGITAL_SIGNATURE.FD_DATE
  is 'Дата подписи';
comment on column ASU.TDIGITAL_SIGNATURE.FK_KEYID
  is 'Ключ';
comment on column ASU.TDIGITAL_SIGNATURE.FC_SIGNATURE
  is 'Подпись';
comment on column ASU.TDIGITAL_SIGNATURE.FK_PEOPLEID
  is '[TPEOPLES.FK_ID]';
-- Create/Recreate primary, unique and foreign key constraints 
alter table ASU.TDIGITAL_SIGNATURE
  add constraint TDIGITAL_SIGNATURE_PK primary key (FK_ID)
  using index 
  tablespace USR
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
