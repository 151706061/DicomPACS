CREATE OR REPLACE FUNCTION ASU.GET_FORM30ID
  RETURN NUMBER DETERMINISTIC
  IS -- Created by -= aAdmin.exe =- 
     -- ATTENTION! DO NOT MODIFY THIS FUNCTION MANUALLY!!!
BEGIN
  Return ID_FORM30ID;--87697;
END;
/





begin
  insert into asu.tconst(fc_name, fc_func, fn_const)
       values ('ID Формы 30', 'GET_FORM30ID', ID_FORM30ID/*87697*/);
       
  commit;  
end;
/
