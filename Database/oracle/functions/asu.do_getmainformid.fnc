DROP FUNCTION ASU.DO_GETMAINFORMID
/

--
-- DO_GETMAINFORMID  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSMID (Table)
--
CREATE OR REPLACE FUNCTION ASU."DO_GETMAINFORMID" (PID in number) return number is
cursor c1 is select level, fk_id, fc_type
                     from tsmid start with fk_id=PID
                     connect by prior fk_owner=fk_id;
lev number;
id number;
rid number;
stype varchar2(100);
begin
  open c1;
  rid:=-1;
  loop
    fetch c1 into lev, id, stype;
    if (lev<>1) and (stype='FORM') then
      rid:=id;
			--EXIT rem by TimurLan;
    end if;
    exit when (c1%notfound);
  end loop;
  close c1;
  return rid;
end;
/

SHOW ERRORS;


