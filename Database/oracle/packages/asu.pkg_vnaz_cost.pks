DROP PACKAGE ASU.PKG_VNAZ_COST
/

--
-- PKG_VNAZ_COST  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU.PKG_VNAZ_COST IS
/*
asu.get_native_region
asu.get_hmao_region
asu.GET_SMID_VACCIN_NAZ  -- Для назначения "Вакцинация" код одинковый для детей и взгослых и начинается на TP.
asu.get_procid
asu.get_vipnaz
ASU.GET_VYPNAZSOSID
asu.GET_USLVID_ER
asu.GET_USLVID_CHILD
asu.get_uslvid_disp
*/

 -- Глобальные переменные
 vUSE_TarifDetail  NUMBER;
 vTarifDetailOwner varchar(100);
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 procedure Calculate(aCostFromDate DATE default null, aSMID_KONS_SPEC_ExtFill integer default 0, aUseHEAL integer default 1, aUseDISP integer default 1, aUsePROF integer default 1, aUseER integer default 1, pUseTarifDetail Number default 0, pTarifDetailOwner Varchar2 default '');
END;
/

SHOW ERRORS;


