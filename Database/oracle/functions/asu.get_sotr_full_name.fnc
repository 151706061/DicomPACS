DROP FUNCTION ASU.GET_SOTR_FULL_NAME
/

--
-- GET_SOTR_FULL_NAME  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSOTR (Synonym)
--
CREATE OR REPLACE FUNCTION ASU."GET_SOTR_FULL_NAME" (sotr_id in number)
  RETURN  varchar2 IS
-- Zhukov эту функцию не использовать!!!
-- А тому кто ее написал оторвать руки  
cursor surname (sotr_id number)
 is
  select fc_fam from tsotr
  where tsotr.fk_id=sotr_id;
cursor name (sotr_id number)
 is
  select fc_name from tsotr
  where tsotr.fk_id=sotr_id;
cursor patronym (sotr_id number)
 is
  select fc_otch from tsotr
  where tsotr.fk_id=sotr_id;
 fio   varchar2(90);
 fam   varchar2(30);
 im    varchar2(30);
 otch  varchar2(30);
BEGIN
  open surname (sotr_id);
   fetch surname into fam;
  close surname;
  open name (sotr_id);
   fetch name into im;
  close name;
  open patronym (sotr_id);
   fetch patronym into otch;
  close patronym;
   fio:=fam||' '||im||' '||otch;
  return fio;
END;
/

SHOW ERRORS;


GRANT EXECUTE ON ASU.GET_SOTR_FULL_NAME TO EXCHANGE
/

GRANT EXECUTE ON ASU.GET_SOTR_FULL_NAME TO EXCH43
/

