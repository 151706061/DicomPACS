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
  res := REPLACE(res,'w','Неделя ');
  res := REPLACE(res,',1','Пн, ');
  res := REPLACE(res,',2','Вт, ');
  res := REPLACE(res,',3','Ср, ');
  res := REPLACE(res,',4','Чт, ');
  res := REPLACE(res,',5','Пт, ');
  res := REPLACE(res,',6','Сб, ');
  res := REPLACE(res,',7','Вс, ');
  res := REPLACE(res,';',chr(13));

  return(Res);
END;
/

SHOW ERRORS;


