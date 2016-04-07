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
  
  YY:=TRUNC(MONTHS_BETWEEN(SYSDATE, p_date) / 12); -- ������ ���
  k1:=MONTHS_BETWEEN(SYSDATE, p_date)- YY*12;
  MM:= TRUNC(k1);        -- ������ �������
  DD:=TRUNC((k1-MM)*30); -- ������ ����

  IF YY>0 AND YY<5 THEN 
    RESULT:=YY || ' �. ';
  ELSE
    RESULT:=YY || ' �. ';
  END IF;
  RESULT:=RESULT || MM || ' �. ' || DD || ' �.';
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


