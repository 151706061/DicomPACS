DROP FUNCTION ASU.IS_SMIDINTIB
/

--
-- IS_SMIDINTIB  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSMID (Table)
--
CREATE OR REPLACE FUNCTION ASU."IS_SMIDINTIB" 
  ( pFK_SMID in number)
  RETURN  number IS
-- Purpose: Расположены ли для данные об определенном СМИД в таблице TIB
--
-- MODIFICATION HISTORY
-- Person      Date    Comments
-- ---------   ------  -------------------------------------------
-- Sam       16.06.2000  Create
cursor c1 is
          select /*+rule*/fk_id
          from tsmid
          where fc_type = 'FORM'
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
END; -- Function IS_SMIDINTIB
/

SHOW ERRORS;


