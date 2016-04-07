DROP FUNCTION ASU.GET_ANY_ADR
/

--
-- GET_ANY_ADR  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TADRESS (Table)
--   TKLADR (Table)
--
CREATE OR REPLACE FUNCTION ASU.get_any_adr
( pAdrID IN TADRESS.FK_ID%TYPE default null ,
  pPeplID IN TADRESS.fk_pacid%TYPE default null) RETURN varchar2 --ASU.TAREANAME.FC_NAME%TYPE
 is
 pStr varchar(200);
 pStr2 varchar(20);
 pfc_house TADRESS.fc_house%TYPE;
 pfc_korpus TADRESS.fc_korpus%TYPE;
 pfk_kladr TADRESS.fk_kladr%TYPE;
 pfc_kvartira TADRESS.fc_kvartira%TYPE;
 pfk_type TADRESS.fk_type%TYPE;
 pId number;


 pName varchar(200);
 cursor cAddr is
  select a.fc_house,a.fc_korpus,a.fk_kladr,a.fk_type,a.fc_kvartira  from asu.tadress a where fk_id = pAdrID;

 cursor cAddrPepl is
  select a.fc_house,a.fc_korpus,a.fk_kladr,a.fk_type,a.fc_kvartira  from asu.tadress a where fk_pacid = pPeplID and a.fk_type = 61;--//nCurrAdrType;


 begin
 if (pAdrID is not null ) then
 open caddr;
 fetch  caddr     into pfc_house,pfc_korpus,pfk_kladr,pfk_type,pfc_kvartira;
 close caddr;

 elsif (pPeplID is not null) then
  open cAddrPepl;
 fetch  cAddrPepl into pfc_house,pfc_korpus,pfk_kladr,pfk_type,pfc_kvartira;
 close cAddrPepl;

 end if;


-- select a.fc_house,a.fc_korpus,a.fk_kladr into  pfc_house,pfc_korpus,pfk_kladr from asu.tadress a where fk_id = pAdrID;
if (nvl(pfk_kladr,-1)<1) then
return 'Àäðåñ íå ÊËÀÄÐ';
end if;

begin
SELECT rtrim(reverse(sys_connect_by_path(REVERSE(fc_name||' ('||fc_prefix||')'),',')),',')x into pstr FROM asu.tkladr t
where CONNECT_BY_ISLEAF=1
CONNECT by PRIOR fk_owner=fk_id
START WITH fk_id = pfk_kladr;
select nvl2(pfc_house,',ä.'||pfc_house,'')||
       nvl2(pfc_korpus,'/'||pfc_korpus,'')||
       nvl2(pfc_kvartira,',êâ.'||pfc_kvartira,'') into pstr2 from dual;
pstr:=pstr||pstr2;

exception when others then
pstr := '---2';
end;

return pstr;
 end;
/

SHOW ERRORS;


