DROP FUNCTION ASU.NEXT_NUMBER
/

--
-- NEXT_NUMBER  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE FUNCTION ASU."NEXT_NUMBER" (pFC_IN VARCHAR2,pFC_MASK IN VARCHAR2) -- Created by TimurLan 4 rPutsPlan, Plan.EXE
 RETURN VARCHAR2 IS
  cIn   VARCHAR2(15);
  cOut  VARCHAR2(15);
  cMask VARCHAR2(15);
  nTemp NUMBER;
BEGIN
   cIn := pFC_IN;
   cOut:= '';
   cMask := pFC_MASK;
   FOR i IN REVERSE 1..LENGTH(cMask) LOOP
     if (SUBSTR(cMask,i,1) = '*') AND (SUBSTR(cMask,i+1,1) = '*') then
     begin
       if (nTemp = 1) then
       begin
         if SUBSTR(cIn,i,1) <> '9' then
           cOut  := TO_CHAR( TO_NUMBER( SUBSTR(cIn,i,1) + 1 )) || cOut;
           nTemp := 0;
         else
           cOut  := '0' || cOut;
           nTemp := 1;
         end if;
       end;
       elsif (nTemp = 0) then
         cOut  := SUBSTR(cIn,i,1) || cOut;
       end if;
     end;
     elsif (SUBSTR(cMask,i,1) = '*') then
     begin
       if SUBSTR(cIn,i,1) <> '9' then
         cOut  := TO_CHAR( TO_NUMBER( SUBSTR(cIn,i,1) + 1 )) || cOut;
         nTemp := 0;
       else
         cOut  := '0' || cOut;
         nTemp := 1;
       end if;
     end;
     else
     begin
       cOut  := SUBSTR(cIn,i,1) || cOut;
       nTemp := 0;
     end;
     end if;
   END LOOP;
   RETURN cOut;
END;
/

SHOW ERRORS;


