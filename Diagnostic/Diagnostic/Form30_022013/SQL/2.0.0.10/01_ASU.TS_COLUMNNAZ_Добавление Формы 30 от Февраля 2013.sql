declare
  nCnt number := 0;

  cursor c is
     select count(1) as cnt from asu.ts_columnnaz n where n.fc_name = 'Форма 30 (редакция от Февраля 2013)';


begin
  open  c;
  fetch c into nCnt;
  if (c%notfound) then
     nCnt := 0;
  end if;
  close c;
  
  if (nCnt <= 0) then
     insert into asu.ts_columnnaz(fc_name, fk_owner, fk_smid, fl_del, fc_synonim, fc_tablename)
          values ('Форма 30 (редакция от Февраля 2013)', -1, -1, 0, null, null);
          
     commit;  
  end if;
end;
