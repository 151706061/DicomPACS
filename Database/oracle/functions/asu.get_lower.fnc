DROP FUNCTION ASU.GET_LOWER
/

--
-- GET_LOWER  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE FUNCTION ASU."GET_LOWER" 
  ( str varchar)
  RETURN  varchar2 IS
 sres varchar2(4000);
 i integer;
 len integer;
BEGIN
  i:=1;
  sres:=str;
  len:=length(sres);
  loop
    i:=instr(sres,'�');
    exit when i=0 or i is null;
    sres:=substr(sres,0,i-1)||'�'||substr(sres,i+1, len);
  end loop;
  loop
    i:=instr(sres,'�');
    exit when i=0 or i is null;
    sres:=substr(sres,0,i-1)||'�'||substr(sres,i+1, len);
  end loop;
  loop
    i:=instr(sres,'�');
    exit when i=0 or i is null;
    sres:=substr(sres,0,i-1)||'�'||substr(sres,i+1, len);
  end loop;
  loop
    i:=instr(sres,'�');
    exit when i=0 or i is null;
    sres:=substr(sres,0,i-1)||'�'||substr(sres,i+1, len);
  end loop;
  sres:=LOWER(sres);
  return sres;
END; -- Function GET_UPPER
/

SHOW ERRORS;


