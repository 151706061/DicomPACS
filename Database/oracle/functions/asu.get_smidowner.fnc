DROP FUNCTION ASU.GET_SMIDOWNER
/

--
-- GET_SMIDOWNER  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSMID (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_SMIDOWNER" 
  ( pFK_SMID in NUMBER)
  RETURN  NUMBER IS
-- получение кода родителя

-- MODIFICATION HISTORY
-- Person      Date    Comments
-- ---------   ------  -------------------------------------------
-- Sam
cursor c(pFK_ID in number) is select fk_owner from tsmid where fk_id=pFK_ID;
BEGIN
  for i in c(pFK_SMID) loop
    return i.fk_owner;
  end loop;
  return null;
END; -- Function GET_SMIDOWNER
/

SHOW ERRORS;


