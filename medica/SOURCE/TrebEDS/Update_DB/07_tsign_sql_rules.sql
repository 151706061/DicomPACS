-- Create table
create table ASU.TSIGN_SQL_RULES
(
  FK_ID      INTEGER not null,
  FC_SQL     VARCHAR2(255),
  FC_TABLE   VARCHAR2(50),
  FC_COMMENT VARCHAR2(255)
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
comment on table ASU.TSIGN_SQL_RULES
  is 'Запросы, собирающие подписываемые строки Author: Linnikov';
-- Add comments to the columns 
comment on column ASU.TSIGN_SQL_RULES.FK_ID
  is 'SEQ_TSIGN_SQL_RULES';
comment on column ASU.TSIGN_SQL_RULES.FC_SQL
  is 'Запрос, возвращающий подписываемую строку';
comment on column ASU.TSIGN_SQL_RULES.FC_TABLE
  is 'Главная таблица (FK_ID должен быть передан в качестве параметра)';
comment on column ASU.TSIGN_SQL_RULES.FC_COMMENT
  is 'Примечание (описание того, что подписывается)';
-- Create/Recreate primary, unique and foreign key constraints 
alter table ASU.TSIGN_SQL_RULES
  add constraint TSIGN_SQL_RULES_PK primary key (FK_ID)
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
-- Create/Recreate indexes 
create unique index ASU.TSIGN_SQL_RULES_FC_TABLE on ASU.TSIGN_SQL_RULES (FC_TABLE)
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

ALTER TABLE ASU.TSIGN_SQL_RULES 
 MODIFY (
  FC_SQL VARCHAR2 (4000)

 )
/