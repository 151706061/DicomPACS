DROP FUNCTION ASU.DO_GETFORMID
/

--
-- DO_GETFORMID  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSMID (Table)
--
CREATE OR REPLACE FUNCTION ASU."DO_GETFORMID" (PID in number) return number is
cursor c1 is select level, fk_id, fc_type
                     from tsmid start with fk_id=PID
                     connect by prior fk_owner=fk_id;
lev number;
id number;
stype varchar2(100);
begin
  open c1;
  loop
    fetch c1 into lev, id, stype;
    if (lev<>1) and (stype='FORM') then
      close c1;
      RETURN (id);
    end if;
    exit when (c1%notfound);
  end loop;
  close c1;
  RETURN(-1);
end;
/

SHOW ERRORS;


