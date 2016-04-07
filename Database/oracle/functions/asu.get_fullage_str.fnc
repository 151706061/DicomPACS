DROP FUNCTION ASU.GET_FULLAGE_STR
/

--
-- GET_FULLAGE_STR  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--
CREATE OR REPLACE FUNCTION ASU."GET_FULLAGE_STR" (p_date DATE) return varchar2 is
  RESULT VARCHAR2(20);
  YY INTEGER;
  MM INTEGER;
  DD INTEGER;
  k1 number;
begin
  IF (p_date IS NULL) THEN
    RETURN('');
  END IF;
  
  YY:=TRUNC(MONTHS_BETWEEN(SYSDATE, p_date) / 12); -- Полных лет
  k1:=MONTHS_BETWEEN(SYSDATE, p_date)- YY*12;
  MM:= TRUNC(k1);        -- Полных месяцев
  DD:=TRUNC((k1-MM)*30); -- Полных дней

  IF YY>0 AND YY<5 THEN 
    RESULT:=YY || ' г. ';
  ELSE
    RESULT:=YY || ' л. ';
  END IF;
  RESULT:=RESULT || MM || ' м. ' || DD || ' д.';
  return(Result);

EXCEPTION
   WHEN OTHERS                      
   THEN BEGIN
     Result:='#';
     return(Result);
   END;
   
end GET_FULLAGE_STR;
/

SHOW ERRORS;


