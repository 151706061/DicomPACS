DROP PACKAGE BODY ASU.PKG_TREPORTSPREF
/

--
-- PKG_TREPORTSPREF  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU.pkg_treportspref is

function Get_barcodetype(PSYN in varchar2) return number is
res number;
cursor c is
 select r.fl_barcode from asu.treportspref r where r.fc_synonim=pSyn;
begin
open c;
fetch c into res;
if c%notfound then res:=0; end if;
close c;
return(res);
end;

function Get_onallpages(PSYN in varchar2) return number is
res number;
cursor c is
 select r.fl_onallpages from asu.treportspref r where r.fc_synonim=pSyn;
begin
open c;
fetch c into res;
if c%notfound then res:=0; end if;
close c;
return(res);
end;

end;
/

SHOW ERRORS;


