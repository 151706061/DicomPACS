DROP PACKAGE ASU.PKG_TARIF_KDN
/

--
-- PKG_TARIF_KDN  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TTARIF_KDN (Table)
--
CREATE OR REPLACE PACKAGE ASU."PKG_TARIF_KDN"
  IS
FUNCTION GetActualTarifKDN(pFK_TIPROOM in TTARIF_KDN.FK_TIPROOM%TYPE, pDATE in date default sysdate) return number;
FUNCTION GetTarifKDN(pFK_TIPROOM in TTARIF_KDN.FK_TIPROOM%TYPE, pDATE in date default sysdate) return number;
FUNCTION GetKDNSumCost(pPacid in number, pPereselID in number default -1) return number;

END PKG_TARIF_KDN;
/

SHOW ERRORS;


