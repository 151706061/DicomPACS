DROP FUNCTION ASU.GET_MOB_PHONE
/

--
-- GET_MOB_PHONE  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TCONTACTS (Table)
--   PKG_REGIST_PACFUNC (Package)
--   GET_TEL_MOB_TYPE (Function)
--
CREATE OR REPLACE FUNCTION ASU."GET_MOB_PHONE" (pID in number) return varchar2 is
 cursor cPhone is
 select fc_contact from tcontacts where fk_pacid=pkg_regist_pacfunc.get_pepl_id(pID)
 and fk_type=get_tel_mob_type;
 sResult varchar2(4000);
begin
 sResult:='';
 for C in cPhone loop
 sResult:=C.Fc_Contact;
 end loop;
 return(sResult);
end get_mob_phone;
/

SHOW ERRORS;


