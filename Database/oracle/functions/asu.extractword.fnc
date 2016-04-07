DROP FUNCTION ASU.EXTRACTWORD
/

--
-- EXTRACTWORD  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   WORDPOSITION (Function)
--
CREATE OR REPLACE FUNCTION ASU."EXTRACTWORD" (N in Integer, S in varchar2, WordDelims in varchar2)
return varchar2
is
  I                 integer;
  result varchar2(32767):='';
begin
  I:=WordPosition(N, S, WordDelims);
  if I<>0 then
    while (I<=Length(S)) and not(substr(s, i, 1)=WordDelims) loop
      result:=result||substr(s, i, 1);
      i:=i+1;
    end loop;
 end if;
 return result;
end;
/

SHOW ERRORS;


