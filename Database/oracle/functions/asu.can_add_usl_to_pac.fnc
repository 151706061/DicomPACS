DROP FUNCTION ASU.CAN_ADD_USL_TO_PAC
/

--
-- CAN_ADD_USL_TO_PAC  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE FUNCTION ASU.can_add_usl_to_pac(pacid in number, smid in number) return number is
  Result integer;
begin
  
  return(0);
end can_add_usl_to_pac;
/

SHOW ERRORS;


