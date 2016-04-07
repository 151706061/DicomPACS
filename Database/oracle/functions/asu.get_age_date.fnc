DROP FUNCTION ASU.GET_AGE_DATE
/

--
-- GET_AGE_DATE  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TAMBULANCE (Table)
--   TKARTA (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_AGE_DATE" 
  ( pFK_PACID IN NUMBER,pFD_DATE IN DATE)
  RETURN  NUMBER IS
  --by TimurLan: функция СТАРАЯ! вместо нее НАДО ЮЗАТЬ PKG_REGIST_PACFUNC.GET_PAC_AGE_DATE(!)
  res   NUMBER;
  CURSOR c1
  IS
    SELECT (MONTHS_BETWEEN (pFD_DATE, fd_rojd) / 12) AS fn_age
      FROM tkarta
     WHERE tkarta.fk_id = pFK_PACID
    UNION ALL
    SELECT (MONTHS_BETWEEN (pFD_DATE, fd_rojd) / 12) AS fn_age
      FROM tambulance
     WHERE tambulance.fk_id = pFK_PACID;
BEGIN
  OPEN c1;
  FETCH c1 INTO res;
  CLOSE c1;
  IF res IS NULL THEN
    res := -1;
  END IF;
  RETURN res;
END;
/

SHOW ERRORS;


