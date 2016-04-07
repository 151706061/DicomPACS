-- Add/modify columns 
alter table MED.TMEDIC add FL_VRACH_KOMISS number(1) default 0;
-- Add comments to the columns 
comment on column MED.TMEDIC.FL_VRACH_KOMISS
  is 'При назначении требует решения врачебной комиссии';
