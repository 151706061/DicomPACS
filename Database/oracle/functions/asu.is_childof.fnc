DROP FUNCTION ASU.IS_CHILDOF
/

--
-- IS_CHILDOF  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSMID (Table)
--
CREATE OR REPLACE FUNCTION ASU."IS_CHILDOF" 
  ( pFK_CHILDID IN number, pFK_PARENTID in number)
  RETURN  number IS
-- Person      Date    Comments
-- ---------   ------  -------------------------------------------
-- sam         31.05.2000  является ли заданный лист дерева ребенком родителя
cursor c is select fk_id
     from tsmid
     where fk_id=pFK_CHILDID
     start with fk_id=pFK_PARENTID
     connect by prior fk_id=fk_owner;
res number;
BEGIN
  open c;
  res:=1;
  fetch c into res;
  if c%notfound then
    res:=0;
  else
    res:=1;
  end if;
  close c;
  return res;
END; -- Function IS_CHILDOF
/

SHOW ERRORS;


