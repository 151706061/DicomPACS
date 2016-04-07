DROP FUNCTION ASU.IS_SMIDINTDIAG
/

--
-- IS_SMIDINTDIAG  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSMID (Table)
--   GET_DIAGID (Function)
--
CREATE OR REPLACE FUNCTION ASU."IS_SMIDINTDIAG" 
  ( pFK_SMID in number)
  RETURN  number IS
-- Purpose: Расположены ли для данные об определенном СМИД в таблице TDIAG
--
-- MODIFICATION HISTORY
-- Person      Date    Comments
-- ---------   ------  -------------------------------------------
-- Sam       16.06.2000  Create
cursor c1 is
          select /*+rule*/fk_id
          from tsmid
          where fk_id = get_diagid
          start with fk_id=pFK_SMID
          connect by prior fk_owner=fk_id;
res number;
BEGIN
 open c1;
 fetch c1 into res;
 if c1%notfound then
   res:=0;
 else
   res:=1;
 end if;
 return res;
 END; -- Function IS_SMIDINTDIAG
/

SHOW ERRORS;


