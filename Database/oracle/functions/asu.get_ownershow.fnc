DROP FUNCTION ASU.GET_OWNERSHOW
/

--
-- GET_OWNERSHOW  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBMS_STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSMID (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_OWNERSHOW" 
  ( pfk_smid in number)
  RETURN  number IS
cursor c is select fl_showanal from tsmid where fk_id=pFK_SMID;
res number;
BEGIN
  open c;
  fetch c into res;
  close c;
  return res;
  EXCEPTION
     when no_data_found then
       raise_application_error(-20001,'Запрошен отсутствующий код из TSMID');
     WHEN OTHERS THEN
       raise_application_error(SQLCODE, SQLERRM);
END; -- Function GET_OWNERSHOW
/

SHOW ERRORS;


