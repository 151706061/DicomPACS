DROP FUNCTION ASU.GET_DEFAULTINSCOMPANY
/

--
-- GET_DEFAULTINSCOMPANY  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE FUNCTION ASU."GET_DEFAULTINSCOMPANY" return number is
  Res number;
begin
  Res := 15165;
  return(Res);
end ;
/

SHOW ERRORS;


