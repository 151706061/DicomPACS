DROP FUNCTION ASU.GET_COUNTPRODLOPOZDPAC
/

--
-- GET_COUNTPRODLOPOZDPAC  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSROKY (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_COUNTPRODLOPOZDPAC" (dat IN date) RETURN NUMBER -- Modified by TimurLan
 IS-- used in rDailyBuh;
 CURSOR c1 is
        select count(fk_id)
          from tsroky
         where TRUNC(fd_data1) = dat
           and fk_pryb=6;
res  number;
BEGIN
  open c1;
  fetch c1 into res;
  close c1;
  return res;
END;
/

SHOW ERRORS;


