CREATE OR REPLACE FUNCTION ASU.DOC_AMBUL_ONKO
  RETURN NUMBER DETERMINISTIC
  IS -- Created by -= aAdmin.exe =- 
     -- ATTENTION! DO NOT MODIFY THIS FUNCTION MANUALLY!!!
BEGIN
  Return ID_KARTA;--1181;
END;
/





begin
  insert into asu.tconst(fc_name, fc_func, fn_const)
       values ('Вид документа: Амбулаторная карта ОНКО', 'DOC_AMBUL_ONKO', ID_KARTA/*1181*/);
       
  commit;  
end;
/