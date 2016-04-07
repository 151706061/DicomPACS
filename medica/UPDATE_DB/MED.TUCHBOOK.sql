-------------------------------------------------
-- Export file for user MED                    --
-- Created by HunterNS on 25.02.2011, 11:55:26 --
-------------------------------------------------

spool MED.log

prompt
prompt Creating table TUCHBOOK
prompt =======================
prompt
create table MED.TUCHBOOK
(
  FK_DPCID   NUMBER,
  FD_DATE    DATE,
  FK_GROUPMO NUMBER,
  FK_MEDICID NUMBER
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
comment on table MED.TUCHBOOK
  is 'Книга учета материальных ценностей (Автор: Neronov A.S.)';
comment on column MED.TUCHBOOK.FK_DPCID
  is 'MED.TDPC.DPCID';
comment on column MED.TUCHBOOK.FD_DATE
  is 'Новая дата записи';
comment on column MED.TUCHBOOK.FK_GROUPMO
  is 'Группа мат. ответственного';
comment on column MED.TUCHBOOK.FK_MEDICID
  is 'ID медикамента';
create index MED.TUCHBOOK_DATE on MED.TUCHBOOK (FD_DATE)
  tablespace INDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index MED.TUCHBOOK_DPCID on MED.TUCHBOOK (FK_DPCID)
  tablespace INDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index MED.TUCHBOOK_GROUPMO on MED.TUCHBOOK (FK_GROUPMO)
  tablespace INDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index MED.TUCHBOOK_MEDICID on MED.TUCHBOOK (FK_MEDICID)
  tablespace INDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );


spool off
