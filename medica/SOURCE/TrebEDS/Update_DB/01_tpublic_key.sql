-- Create table
create table ASU.TPUBLIC_KEY
(
  FK_ID       INTEGER not null,
  FB_KEY      BLOB,
  FD_CREATE   DATE,
  FD_DELETE   DATE,
  FL_DEL      INTEGER default 0,
  FK_PEOPLEID INTEGER
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
comment on table ASU.TPUBLIC_KEY
  is '��������� ����� ������������� Author: Linnikov';
-- Add comments to the columns 
comment on column ASU.TPUBLIC_KEY.FK_ID
  is 'SEQ_TPUBLIC_KEY';
comment on column ASU.TPUBLIC_KEY.FB_KEY
  is '����';
comment on column ASU.TPUBLIC_KEY.FD_CREATE
  is '���� �����������';
comment on column ASU.TPUBLIC_KEY.FD_DELETE
  is '���� �������� (�����������)';
comment on column ASU.TPUBLIC_KEY.FL_DEL
  is '������� �������� 1 - ������, ����� - ���';
comment on column ASU.TPUBLIC_KEY.FK_PEOPLEID
  is '�������-��������� TPEOPLES';
-- Create/Recreate primary, unique and foreign key constraints 
alter table ASU.TPUBLIC_KEY
  add constraint TPUBLIC_KEY_PK primary key (FK_ID)
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


ALTER TABLE ASU.TPUBLIC_KEY 
 ADD (
  FC_CONTAINER VARCHAR2 (100)
 )
/