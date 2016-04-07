-- Add/modify columns 
alter table MED.TMEDIC add FK_ATC number;
-- Add comments to the columns 
comment on column MED.TMEDIC.FK_ATC
  is 'АТХ классификатор. Ссылка на rls.clsatc';
