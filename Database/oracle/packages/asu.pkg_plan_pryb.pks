DROP PACKAGE ASU.PKG_PLAN_PRYB
/

--
-- PKG_PLAN_PRYB  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_PLAN_PRYB" 
  IS
function get_plan_pryb(data in date,vrach_id in number)
return number;

END; -- Package Specification PKG_PLAN_PRYB
/

SHOW ERRORS;


