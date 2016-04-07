DROP FUNCTION ASU.GET_NACHMEDFIO
/

--
-- GET_NACHMEDFIO  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   DO_VRACHFIO (Function)
--
CREATE OR REPLACE FUNCTION ASU."GET_NACHMEDFIO" 
  RETURN  varchar2 IS

BEGIN
   return do_vrachfio(1063);
END; -- Function GET_NACHMEDFIO
/

SHOW ERRORS;


