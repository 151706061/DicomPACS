-- Add/modify columns 
alter table MED.TMEDIC add FC_SHORTNAME VARCHAR2(250);
-- Add comments to the columns 
comment on column MED.TMEDIC.FC_SHORTNAME
  is 'Сокращенное наименование объекта учета';
