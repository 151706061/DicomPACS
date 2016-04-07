DROP FUNCTION ASU.GET_UPPER
/

--
-- GET_UPPER  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE FUNCTION ASU."GET_UPPER" 
  ( str varchar)
  RETURN  varchar2 IS
 sres varchar2(4000);
 i integer;
 len integer;
BEGIN
  i:=1;
  sres:=str;
  len:=Length(sres);
  if len is null then
    return sres;
  end if;
  loop
    exit when i>len+1;
    if substr(sres, i, 1)='¸' then
      sres:=substr(sres, 1, i-1)||'¨'||substr(sres, i+1, len);
    else
    if substr(sres, i, 1)='÷' then
      sres:=substr(sres, 1, i-1)||'×'||substr(sres, i+1, len);
    else
    if substr(sres, i, 1)='ü' then
      sres:=substr(sres, 1, i-1)||'Ü'||substr(sres, i+1, len);
--          raise_application_error(-20000, '!:'||sres);
    else
    if substr(sres, i, 1)='ú' then
      sres:=substr(sres, 1, i-1)||'Ú'||substr(sres, i+1, len);
    else
    if substr(sres, i, 1)='ÿ' then
      sres:=substr(sres, 1, i-1)||'ß'||substr(sres, i+1, len);
    end if;
    end if;
    end if;
    end if;
    end if;
    i:=i+1;
  end loop;
  sres:=UPPER(sres);
  return sres;
END; -- Function GET_UPPER
/

SHOW ERRORS;


