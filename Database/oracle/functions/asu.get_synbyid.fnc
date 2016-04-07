DROP FUNCTION ASU.GET_SYNBYID
/

--
-- GET_SYNBYID  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBMS_STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSMID (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_SYNBYID" (id in number,pRaise IN NUMBER:=1) return varchar2 --получает имя синонима по его коду
is
cursor c is select fc_synonim from tsmid where fk_id=id;
cres varchar(254);
begin
  open c;
  fetch c into cres;
  if c%notfound then
    close c;
    IF pRaise=1 THEN
      raise_application_error(-20003,'Был запрошен синоним с кодом '||to_char(id)||', но такая запись отсутствует в таблице TSMID.');
    ELSE
      RETURN -1;
    END IF;
  end if;
  close c;
  return cres;
end;
-- END PL/SQL BLOCK (do not remove this line) ----------------------------------
/

SHOW ERRORS;


