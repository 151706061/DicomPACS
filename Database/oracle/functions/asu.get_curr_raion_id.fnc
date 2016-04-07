DROP FUNCTION ASU.GET_CURR_RAION_ID
/

--
-- GET_CURR_RAION_ID  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TRAION (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_CURR_RAION_ID" RETURN traion.FK_ID%TYPE IS
-- Возвращает ID текущего района
-- Created 20081017 by Linnikov
BEGIN
  RETURN(14283);
END GET_CURR_RAION_ID;
/

SHOW ERRORS;


