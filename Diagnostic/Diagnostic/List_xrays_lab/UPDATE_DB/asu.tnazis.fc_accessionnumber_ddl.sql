alter table asu.tnazis add fc_accessionnumber varchar2(50);
/
declare
i integer;
begin
  i:=0;
  for rec in (select t.fk_id,t.fc_type from asu.tnazis t where t.fc_type is not null and t.fc_accessionnumber is null)
  loop
    update asu.tnazis t set t.fc_accessionnumber=rec.fc_type where t.fk_id=rec.fk_id;
    i:=i+1;
    if mod(i,100)=0 then
      commit;
    end if;
  end loop;
  commit;  
end;
/


