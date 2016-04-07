DROP FUNCTION ASU.GET_CAN_SUBSCRIBE_IF_OPL
/

--
-- GET_CAN_SUBSCRIBE_IF_OPL  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--
CREATE OR REPLACE FUNCTION ASU.GET_CAN_SUBSCRIBE_IF_OPL (pFK_NAZID in number, vTompCostDT in date default sysdate)
  RETURN number IS
  nRes  INTEGER := 1;
BEGIN


  RETURN(nRes);
END;
/

SHOW ERRORS;


