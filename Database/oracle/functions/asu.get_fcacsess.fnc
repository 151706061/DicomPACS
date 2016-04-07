DROP FUNCTION ASU.GET_FCACSESS
/

--
-- GET_FCACSESS  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--
CREATE OR REPLACE FUNCTION ASU."GET_FCACSESS" (pFN_ACSESS IN BINARY_INTEGER)
  return VARCHAR2 -- Created by TimurLan
 is
  Result   VARCHAR2(5);
begin
  SELECT
    DECODE(to_char(bitand(1, pFN_ACSESS)), '1', 'R', '-')||
    DECODE(to_char(bitand(2, pFN_ACSESS)), '2', 'W', '-')||
    DECODE(to_char(bitand(4, pFN_ACSESS)), '4', 'A', '-')||
    DECODE(to_char(bitand(8, pFN_ACSESS)), '8', 'D', '-')||
    DECODE(to_char(bitand(16, pFN_ACSESS)), '16', 'N', '-')
  into Result
  FROM DUAL;

  return(Result);
end;
/

SHOW ERRORS;


