-- Create table
create table asu.TOTDELS_IN_CITO
(
  FK_OTDELID NUMBER
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
comment on table asu.TOTDELS_IN_CITO
  is 'отделения для кабинета CITO Author:Melnikov 2014.01.20';