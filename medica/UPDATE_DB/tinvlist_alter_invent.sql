-- Add/modify columns 
alter table MED.TINVLIST add FN_TYPE number(1);
alter table MED.TINVLIST add FD_DT_BEG date;
alter table MED.TINVLIST add FD_DT_END date;
alter table MED.TINVLIST add FC_PEOPLES varchar2(500);
alter table MED.TINVLIST add FC_CITY varchar2(50);
-- Add comments to the columns 
comment on column MED.TINVLIST.FN_TYPE
  is '0-плановая 1-внезапная';
comment on column MED.TINVLIST.FD_DT_BEG
  is 'дата начала периода за который проводится инвентаризация';
comment on column MED.TINVLIST.FD_DT_END
  is 'дата окончания периода за который проводится инвентаризация';
comment on column MED.TINVLIST.FC_PEOPLES
  is 'список лиц, в присутствии кого проводилась инвентаризация';
comment on column MED.TINVLIST.FC_CITY
  is 'город (село) в печатной форме инвентаризации';

-- Add/modify columns 
alter table MED.TINVLIST add FD_DAT_PRIKAZ date;
alter table MED.TINVLIST add FC_NMB_PRIKAZ varchar2(50);
-- Add comments to the columns 
comment on column MED.TINVLIST.FD_DAT_PRIKAZ
  is 'Дата приказа';
comment on column MED.TINVLIST.FC_NMB_PRIKAZ
  is 'Номер приказа';

