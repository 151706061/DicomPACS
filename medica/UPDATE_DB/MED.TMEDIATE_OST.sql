-- Create table
create table MED.TMEDIATE_OST
(
  FK_KARTID       NUMBER,
  FK_MOGROUP      NUMBER,
  FN_OST          NUMBER,
  FD_BEGIN        DATE,
  FK_PRIH_DPID    NUMBER,
  FK_REZERV_DPCID NUMBER
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
comment on table MED.TMEDIATE_OST
  is '������� � �������������� ���������, ��� ��������� ������. Author: Neronov A.S. 22.04.2013';
-- Add comments to the columns 
comment on column MED.TMEDIATE_OST.FK_KARTID
  is 'MED.TKART.KARTID - ������ �������� �����';
comment on column MED.TMEDIATE_OST.FK_MOGROUP
  is 'MED.TMO_GROUP.GROUPID - ������ ��';
comment on column MED.TMEDIATE_OST.FN_OST
  is '�������';
comment on column MED.TMEDIATE_OST.FD_BEGIN
  is '����, �� ������� �������� ������������� �������';
comment on column MED.TMEDIATE_OST.FK_PRIH_DPID
  is 'MED.TDOCS.DPID - ��������� ��������';
comment on column MED.TMEDIATE_OST.FK_REZERV_DPCID
  is 'MED.TDPC.DPCID - ������� � ���������, ������� ����� � ������';
-- Create/Recreate indexes 
create index MED.TMEDIATE_OST_KARTID on MED.TMEDIATE_OST (FK_KARTID)
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
create index MED.TMEDIATE_OST_MOGROUP on MED.TMEDIATE_OST (FK_MOGROUP)
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
