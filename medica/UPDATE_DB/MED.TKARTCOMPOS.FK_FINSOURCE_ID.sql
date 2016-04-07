-- Add/modify columns 
alter table MED.TKARTCOMPOS add FK_FINSOURCE_ID number;
-- Add comments to the columns 
comment on column MED.TKARTCOMPOS.FK_FINSOURCE_ID
  is 'Источник финансирования';
