DROP PACKAGE BODY ASU.PKG_SOGLASIE_PAC
/

--
-- PKG_SOGLASIE_PAC  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_SOGLASIE_PAC" is

procedure ins_tpersonal_data(peopleid in number, ddate in date, sotrid in number, ptype in number) is
iType number;
cursor c is
 select count(1) from asu.tpersonal_data where fk_people = peopleid;
begin
iType:=-1;
open c;
fetch c into iType;
close c;
if iType>0 then
-- if iType<>ptype then
  update asu.tpersonal_data set fd_date=ddate,fk_sotr=sotrid,fp_type=ptype where fk_people=peopleid;
-- end if;
else
 insert into asu.tpersonal_data(fk_people,fd_date,fk_sotr,fp_type) values(peopleid,ddate,sotrid,ptype);
end if;
end;

function Get_Status(peopleid in number) return number is
res number;
cursor c is
 select fp_type from asu.tpersonal_data where fk_people = peopleid;
begin
res:=-1;
open c;
fetch c into res;
close c;
return(res);
end;

end;
/

SHOW ERRORS;


