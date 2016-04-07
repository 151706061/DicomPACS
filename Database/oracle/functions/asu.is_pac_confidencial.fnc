DROP FUNCTION ASU.IS_PAC_CONFIDENCIAL
/

--
-- IS_PAC_CONFIDENCIAL  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TIB (Table)
--   TSMID (Table)
--
CREATE OR REPLACE FUNCTION ASU."IS_PAC_CONFIDENCIAL" 
  ( pFK_PACID IN BINARY_INTEGER)
  RETURN  NUMBER IS
-- Функция возвращает = 1, если установлено занчение в ИБ - информация конфиденциальна, в противном случае = 0
-- MODIFICATION HISTORY
-- Person      Date    Comments
-- ---------   ------  -------------------------------------------
-- Nefedov S.M. 22.05.2006  Created this function
-- ---------   ------  -------------------------------------------
    CURSOR c IS
    select tib.fk_id from tib, tsmid
    where tib.fk_pacid=pFK_PACID
    and tib.fk_smid=tsmid.fk_id
    and tsmid.fc_synonim='PD_KONFIDENCE';
    
    n NUMBER;
BEGIN
    open c;
    fetch c into n;
    close c;
    if NVL(n,0) > 0 THEN
        n:=1;
    end if;

    RETURN (NVL(n,0));
END;
/

SHOW ERRORS;


