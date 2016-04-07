DROP FUNCTION ASU.IS_PAC_IN_PRIEMN_OTDEL
/

--
-- IS_PAC_IN_PRIEMN_OTDEL  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TROOM (Table)
--   GET_PACPALATAID (Function)
--   IS_PRIEMN_OTDEL (Function)
--
CREATE OR REPLACE FUNCTION ASU."IS_PAC_IN_PRIEMN_OTDEL" 
  ( pPacID IN NUMBER)
  RETURN  NUMBER IS
--
-- MODIFICATION HISTORY
-- Person      Date    Comments
-- ---------   ------  -------------------------------------------
-- Nefedov S.M. 22.02.2006 Created Возвращает 1 если пациент в приёмном отделении, 0 если нет
-- Nefedov S.M. 19.05.2006 Modyfied заточка на функцию IS_PRIEMN_OTDEL, которая может работать с несколькими ПО
-- ---------   ------  -------------------------------------------
CURSOR c IS
    select fk_id
    from troom
    where fk_id = GET_PACPALATAID(pPacID)
    and IS_PRIEMN_OTDEL(fk_otdelID) = 1; --GET_PRIEMN_OTDELID;
    nFlg NUMBER;
BEGIN
    nFlg:=0;
    FOR cCurs IN c LOOP
        if cCurs.fk_id > 0 then
            nFlg:=1;
        end if;
    END LOOP;
    RETURN nFlg;
END;
/

SHOW ERRORS;


