-- Add/modify columns 
alter table MED.TUCHGR add PARENTID number(9) default 0 not null;
-- Add comments to the columns 
comment on column MED.TUCHGR.PARENTID
  is 'Для деревянного списка';
