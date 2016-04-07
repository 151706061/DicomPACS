DROP FUNCTION ASU.GET_PAC_PRYB
/

--
-- GET_PAC_PRYB  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   GET_PACINCOME (Function)
--
CREATE OR REPLACE FUNCTION ASU."GET_PAC_PRYB" 
  ( pFK_ID IN NUMBER,pFP_TEK_COC IN NUMBER)
  RETURN  DATE IS
BEGIN
    if pFP_TEK_COC IN (3,2) then
     return GET_PACINCOME(pFK_ID);
    elsif pFP_TEK_COC=1 then
     return NULL;
    end if;
END;
/

SHOW ERRORS;


