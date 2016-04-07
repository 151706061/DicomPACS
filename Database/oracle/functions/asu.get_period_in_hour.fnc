DROP FUNCTION ASU.GET_PERIOD_IN_HOUR
/

--
-- GET_PERIOD_IN_HOUR  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE FUNCTION ASU."GET_PERIOD_IN_HOUR" (pFD_DATE1 in DATE, pFD_DATE2 in DATE)
  return VARCHAR2 -- Created by TimurLan
 is
  nHours   BINARY_INTEGER;
  nMinutes BINARY_INTEGER;
--  Result   VARCHAR2(32767);
begin
  if pFD_DATE1 is null or pFD_DATE2 is null or pFD_DATE1 > pFD_DATE2 then
    return null;
  end if;
  nHours := TRUNC(pFD_DATE2 - pFD_DATE1) * 24 + TRUNC(((pFD_DATE2 - pFD_DATE1) - TRUNC(pFD_DATE2 - pFD_DATE1)) * (24));
  nMinutes := TRUNC((((pFD_DATE2 - pFD_DATE1) - TRUNC(pFD_DATE2 - pFD_DATE1)) * (24) - TRUNC(((pFD_DATE2 - pFD_DATE1) - TRUNC(pFD_DATE2 - pFD_DATE1)) * (24))) * 60);
  return(TO_CHAR(nHours)||':'||TO_CHAR(nMinutes,'FM00'));
end;
/

SHOW ERRORS;


