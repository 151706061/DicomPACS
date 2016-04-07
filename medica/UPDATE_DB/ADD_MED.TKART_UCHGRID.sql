-- добавляем учетную группу в карточку 
alter table MED.TKART add UCHGRID number;

comment on column MED.TKART.UCHGRID
  is 'учетная группа на дату регистрации приходного документа';
  
alter table MED.TKART
  add constraint TKART_TUCHGR_FK foreign key (UCHGRID)
  references med.tuchgr (UCHGRID);
    
-- добавляем индекс по новому полю
create index med.TKART_I_UCHGRID on MED.TKART (uchgrid);
