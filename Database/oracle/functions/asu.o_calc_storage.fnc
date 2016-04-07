DROP FUNCTION ASU.O_CALC_STORAGE
/

--
-- O_CALC_STORAGE  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE FUNCTION ASU."O_CALC_STORAGE" 
  ( initial_extent  IN number,
    next_extent     IN number,
    min_extents     IN number,
    pct_increase    IN number)  RETURN  number IS
 initial_storage   number := 0;
 i             number := 1;
BEGIN
 initial_storage := nvl(initial_extent,0);
 WHILE (nvl(min_extents,0) - i > 0 ) LOOP
  IF i = 1  THEN
    initial_storage := initial_storage + nvl(next_extent,0);
  ELSE
    initial_storage := initial_storage + trunc(nvl(next_extent,0)*(1+nvl(pct_increase,50)/100));
  END IF;
  i := i + 1;
 END LOOP;
 return initial_storage;
END; -- Function O_CALC_STORAGE
/

SHOW ERRORS;


