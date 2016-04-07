-- Add/modify columns 
alter table MED.TMASSUNITS add FN_ORDER number;
-- Add comments to the columns 
comment on column MED.TMASSUNITS.FN_ORDER
  is 'Для сортировки';
