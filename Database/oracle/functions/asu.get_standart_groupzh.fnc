DROP FUNCTION ASU.GET_STANDART_GROUPZH
/

--
-- GET_STANDART_GROUPZH  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   PKG_SMINI (Package)
--
CREATE OR REPLACE FUNCTION ASU."GET_STANDART_GROUPZH" 
  RETURN NUMBER DETERMINISTIC
  IS 
  v_ret NUMBER;  
BEGIN
  -- Возвращает стандрат по умолчанию
  -- используется при поиске и дагнозов
  v_ret := TO_NUMBER( PKG_SMINI.READSTRING('STANDART','STANDART_DEFAULT_ID','1'));
  Return v_ret;
  EXCEPTION
  WHEN others THEN -- caution handles all exceptions
   Return 1;
END;
/

SHOW ERRORS;


