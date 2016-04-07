-- Add/modify columns 
alter table MED.TMEDIC add FL_MIBP number(1);
-- Add comments to the columns 
comment on column MED.TMEDIC.FL_MIBP
  is 'Медицинский иммунобиологический препарат (МИБП)';
