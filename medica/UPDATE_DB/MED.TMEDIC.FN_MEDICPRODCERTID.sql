-- Add/modify columns 
alter table MED.TMEDIC add FN_MEDICPRODCERTID number default 0;
-- Add comments to the columns 
comment on column MED.TMEDIC.FN_MEDICPRODCERTID
  is 'Производитель/Сертификат';
