DROP FUNCTION ASU.GET_FULLESTPATH
/

--
-- GET_FULLESTPATH  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSMID (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_FULLESTPATH" 
 ( id in number)
return varchar2 is
 sName varchar2(1000);
 rn number;
 sRes varchar2(1000);
 cursor c1 is select fc_name, rownum from
                (select fk_id, fc_name, fk_owner
                from tsmid start with fk_id=id
                connect by prior fk_owner=fk_id)
                order by rownum desc;
BEGIN
  sRes:='';
  open c1;
  fetch c1 into sName, rn;
  if c1%found then
    sRes:=sRes||sName||':';
  end if;
  loop
    fetch c1 into sName, rn;
    exit when c1%notfound;
    sRes:=sRes||' '||sName;
  end loop;
  close c1;
  return sRes;
END;
/

SHOW ERRORS;


