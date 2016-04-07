DROP FUNCTION ASU.IS_ADULT
/

--
-- IS_ADULT  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TKARTA (Table)
--
CREATE OR REPLACE FUNCTION ASU."IS_ADULT" (pdate IN asu.tkarta.fd_rojd%TYPE, ptodate date default sysdate) RETURN NUMBER IS
 -- Created 20090318 by Linnikov
 -- Определяет по дате рождения совершеннолетний человек или нет
BEGIN
 IF TRUNC(MONTHS_BETWEEN(ptodate, pdate)) < 216 THEN
  RETURN(0);
 ELSE
  RETURN(1);
 END IF;
END;
/

SHOW ERRORS;


