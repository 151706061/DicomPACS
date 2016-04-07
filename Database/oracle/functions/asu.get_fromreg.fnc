DROP FUNCTION ASU.GET_FROMREG
/

--
-- GET_FROMREG  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE FUNCTION ASU.get_fromreg(pStr varchar2)
return varchar2
is
s varchar2(2000);
begin
s:=pstr;
s:= regexp_replace(s  ,'ï. ','ï.');
s:= regexp_replace(s  ,'(\d+([.]\d+)?)\([[:alpha:]]+[.]?([ ]+)?2\)','5.\1');
s:= regexp_replace(s  ,'\([[:alpha:]]+.1\)');
s:= regexp_replace(s  ,'¹[ ]*2[ ]*[ï.]','5');
s:= regexp_replace(s  ,'Ï[[:alpha:]]+.2[ ]*ï.','5.');
s:= regexp_replace(s  ,'Ï[[:alpha:]]+.?1',';');
s:= regexp_replace(s  ,'Ï[[:alpha:]]+.? ?¹? +1?',';');

s:= regexp_replace(s  ,'[[:alpha:]]+.',';');
s:= regexp_replace(s  ,'[  ]+|,',';');
s:= regexp_replace(s  ,'[;;]+',';');
s:= regexp_replace(s  ,'[[:space:]]|[[:cntrl:]]');
return s;

end;
/

SHOW ERRORS;


