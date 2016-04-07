DROP FUNCTION ASU.GET_VAILEDNAME
/

--
-- GET_VAILEDNAME  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   GET_RUSLAT (Function)
--
CREATE OR REPLACE FUNCTION ASU."GET_VAILEDNAME" 
  ( s in varchar2)
  RETURN  varchar2 IS
-- Переводит текст в допустимое именя PL\SQL
-- Sam   09.08.2000
  res varchar2(32767);
BEGIN
  res:=substr(s,1, 18);
  res:=get_ruslat(res);
  res:=replace(res,' ','_');
  res:=replace(res,'!','_');
  res:=replace(res,',','_');
  res:=replace(res,'.','_');
  res:=replace(res,chr(10),'_');
  res:=replace(res,chr(13),'_');
  return res;
END; -- Function GET_VAILEDNAME
/

SHOW ERRORS;


