DROP FUNCTION ASU.GET_COUNT_PRYB
/

--
-- GET_COUNT_PRYB  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   GET_COUNT_IN (Function)
--   GET_COUNT_RECOVER (Function)
--
CREATE OR REPLACE FUNCTION ASU."GET_COUNT_PRYB" (pFD_DATAC IN DATE)
  RETURN VARCHAR2
  IS
  i NUMBER;
  BEGIN
    i:=GET_COUNT_RECOVER(pFD_DATAC);
    if i>0 then
      RETURN TO_CHAR(GET_COUNT_IN(pFD_DATAC))||'+'||TO_CHAR(i);
    else
      RETURN TO_CHAR(GET_COUNT_IN(pFD_DATAC));
    end if;
  END;

 --Выбыло+временно
/

SHOW ERRORS;


