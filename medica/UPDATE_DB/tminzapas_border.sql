-- Add/modify columns 
alter table MED.TMINZAPAS add fn_border number;
/
-- Add comments to the columns 
comment on column MED.TMINZAPAS.fn_border
  is 'граница для сигнализации о приближении к мин запасу - отношение мин запаса к текущему остатку';

/

create index TMINZAPAS_idx01 on MED.TMINZAPAS (medicid, mogroupid);
/

