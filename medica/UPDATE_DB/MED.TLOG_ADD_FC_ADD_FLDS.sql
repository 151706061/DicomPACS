-- Add/modify columns 
alter table MED.TLOG add FC_ADD_FLDS VARCHAR2(500);
-- Add comments to the columns 
comment on column MED.TLOG.FC_ADD_FLDS
  is 'остальные поля в формате ''поле'':значение;''поле'':значение;...';
