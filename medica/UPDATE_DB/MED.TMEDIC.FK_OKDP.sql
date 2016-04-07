-- Add/modify columns 
alter table MED.TMEDIC add FK_OKDP number default -1;
-- Add comments to the columns 
comment on column MED.TMEDIC.FK_OKDP
  is 'Классификация по ОКДП';
