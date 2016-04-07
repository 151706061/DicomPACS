DROP FUNCTION ASU.GET_DIALIZ_STR_PROLONG_SHABLON
/

--
-- GET_DIALIZ_STR_PROLONG_SHABLON  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE FUNCTION ASU.get_dializ_str_prolong_shablon(AShablon in varchar2) return varchar2 is
  Res VARCHAR2(1024);
begin
  res := AShablon;
  res := REPLACE(res,':',': ,');
  res := REPLACE(res,'w','������ ');
  res := REPLACE(res,',1','��, ');
  res := REPLACE(res,',2','��, ');
  res := REPLACE(res,',3','��, ');
  res := REPLACE(res,',4','��, ');
  res := REPLACE(res,',5','��, ');
  res := REPLACE(res,',6','��, ');
  res := REPLACE(res,',7','��, ');
  res := REPLACE(res,';',chr(13));

  return(Res);
END;
/

SHOW ERRORS;


