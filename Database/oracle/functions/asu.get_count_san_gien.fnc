DROP FUNCTION ASU.GET_COUNT_SAN_GIEN
/

--
-- GET_COUNT_SAN_GIEN  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TPOVTOR (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_COUNT_SAN_GIEN" 
  (pFK_SMID IN NUMBER,pFD_DATE IN DATE )
  RETURN NUMBER IS
--
-- Purpose: Возвращает количество санитарно-гигиенических исследований за число
-- By Philip A. Milovanov
  CURSOR c IS SELECT FN_SAN FROM TPOVTOR WHERE FK_SMID=pFK_SMID AND FD_DATE=pFD_DATE;
  i NUMBER;
BEGIN
  OPEN c;
  FETCH c INTO i;
  CLOSE c;
  if i is null then
    i:=0;
  end if;
  RETURN i;
END; -- Function GET_COUNT_SAN_GIEN
/

SHOW ERRORS;


