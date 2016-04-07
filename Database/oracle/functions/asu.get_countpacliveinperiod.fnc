DROP FUNCTION ASU.GET_COUNTPACLIVEINPERIOD
/

--
-- GET_COUNTPACLIVEINPERIOD  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TPERESEL (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_COUNTPACLIVEINPERIOD" 
  ( pfd_data1 IN date,
  pfd_data2 IN date)
  RETURN  number IS
cursor c is
select count(distinct fk_pacid) as fn_count from tperesel
  where
  fd_data1 between pfd_data1 and pfd_data2
  or
  fd_data2 between pfd_data1 and pfd_data2;
res number;
BEGIN
  open c;
  fetch c into res;
  close c;
  return res;
END; -- Function GET_COUNTPACLIVEINPERIOD
/

SHOW ERRORS;


