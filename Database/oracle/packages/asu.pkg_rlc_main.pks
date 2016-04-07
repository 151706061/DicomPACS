DROP PACKAGE ASU.PKG_RLC_MAIN
/

--
-- PKG_RLC_MAIN  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TSTANDART (Table)
--
CREATE OR REPLACE PACKAGE ASU."PKG_RLC_MAIN" is

  -- Author  : NEBARY 
  -- Created : 13.05.2008 14:55:52
  -- Purpose : Процедуры модуля "Расчет стоимости лечения законченного случая"

  -- Public variable declarations
  
  Type rowGetKDNS is record( 
    FK_PACID Number,
    FK_INSURDOCID Number,
    FK_PERESELID Number,
    FC_NAME asu.tstandart.fc_name%TYPE,
    FC_CODE asu.tstandart.fc_code%TYPE,
    KOL_USL Number,
    FN_COST Number,
    FN_SUM Number
  );
  
  type TGET_KDNS_BY_PAC is table of rowGetKDNS;
  
  nSMIDPriVipiske number;
  nSMIDClinik     number;
  bSMIDMain       number;

  -- Public function and procedure declarations
  FUNCTION get_stac_nakl(pPacID number) RETURN NUMBER;
  FUNCTION get_amb_nakl RETURN NUMBER;
  PROCEDURE set_amb_nakl(pValue IN NUMBER);
  PROCEDURE set_stac_nakl(pValue IN NUMBER);
  function GET_KDNS_BY_PAC(pPacid Number) RETURN TGET_KDNS_BY_PAC pipelined;
  function GET_KDNS_BY_PAC_WORK(pPacid Number) RETURN TGET_KDNS_BY_PAC pipelined;
  FUNCTION get_cost_kdn_by_pac_peresel(pPacID number, pPereselID number) RETURN NUMBER;
  function get_stac_cost_total(pPacID in number) return number;
  function get_amb_cost_total(pPacID in number) return number;
  FUNCTION get_ambtalon_cost_total(pTalonID IN NUMBER) RETURN NUMBER;
  function get_stac_cost(pPacID in number, pMinOrMax in number) return number;
  function get_amb_cost(pPacID in number, pMinOrMax in number) return number;
  function get_ambtalon_cost(pTalonID in number, pMinOrMax in number)
    return number;

  function get_stac_tomp(pPacID in number) return number;
  function get_amb_tomp(pPacID in number) return number;
  function get_ambtalon_tomp(pTalonID in number) return number;

  function get_stac_diag(pPacID in number) return varchar2;
  function get_ambtalon_diag(pTalonID in number) return varchar2;

end pkg_rlc_main;
/

SHOW ERRORS;


