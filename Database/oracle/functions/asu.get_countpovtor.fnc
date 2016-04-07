DROP FUNCTION ASU.GET_COUNTPOVTOR
/

--
-- GET_COUNTPOVTOR  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TPOVTOR (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_COUNTPOVTOR" 
  (pFK_SMID IN NUMBER,pFD_DATE IN DATE )
  RETURN NUMBER IS
--
-- Purpose: Возвращает количество повторныъ исследований за число
-- By Philip A. Milovanov
  CURSOR c IS SELECT FN_COUNT FROM TPOVTOR WHERE FK_SMID=pFK_SMID AND FD_DATE=pFD_DATE;
  i NUMBER;
BEGIN
  OPEN c;
  FETCH c INTO i;
  CLOSE c;
  if i is null then
    i:=0;
  end if;
  RETURN i;
END; -- Function GET_COUNTPOVTOR
/

SHOW ERRORS;


