DROP FUNCTION ASU.GET_CURMONTHDAY
/

--
-- GET_CURMONTHDAY  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   DBMS_STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSROKY (Table)
--   DO_VYBDATE (Function)
--
CREATE OR REPLACE FUNCTION ASU."GET_CURMONTHDAY" 
(pacid in number)
return number is
 cursor c1  is select TRUNC(fd_data1), TRUNC(fd_data3)
                 from tsroky
                where fk_pacid=pacid
                  and fk_pryb in (2, 4, 5, 6)
                  and trunc(fd_data3)>=trunc(do_vybdate(fk_pacid), 'mon');
 cursor c2 is select trunc(do_vybdate(pacid), 'mon') vybd from dual;
 d1 date;
 d3 date;
 vybdate date;
 res number;
BEGIN
  res:=0;
  open c2;
  if c2%notfound then
    raise_application_error(-20003, 'Не могу подсчитать кол-во дней пробытых в прошлом месяце, т.к. человек не является выписанным');
  end if;
  fetch c2 into vybdate;
  open c1;
  loop
    fetch c1 into d1, d3;
    exit when c1%notfound;
    if d1<=vybdate then
      res:=res+d3-vybdate+1;
    else
      res:=res+d3-d1+1;
    end if;
  end loop;
  close c1;
  return res;
END;
/

SHOW ERRORS;


