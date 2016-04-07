-- Add/modify columns 
alter table MED.TKART add DRUGID number;
-- Add comments to the columns 
comment on column MED.TKART.DRUGID
  is 'DrugID из проекта Мониторинг цен';
