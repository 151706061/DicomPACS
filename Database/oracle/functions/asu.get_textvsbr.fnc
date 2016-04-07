DROP FUNCTION ASU.GET_TEXTVSBR
/

--
-- GET_TEXTVSBR  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE FUNCTION ASU."GET_TEXTVSBR" ( s in varchar2)
  RETURN  varchar2 IS
  sRes1 varchar2(32767);
  sRes2 varchar2(32767);
BEGIN
 sRes1 := s;
 sRes2 := '';
-- loop
-- sRes2:=replace (sres1, chr(10), '<br>');
-- sRes1:=replace (sres1, chr(10), '<br>');
-- exit when sRes1=sRes2;
-- end loop;
 return sres1;
END;
/

SHOW ERRORS;


