-- Add/modify columns 
alter table MED.TMEDIC add FC_CLASS VARCHAR2(10);
-- Add comments to the columns 
comment on column MED.TMEDIC.FC_CLASS
  is 'Класс мед. изделия';
