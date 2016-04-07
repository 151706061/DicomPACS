DROP PACKAGE ASU.PKG_USLUGI
/

--
-- PKG_USLUGI  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--   THEAL (Table)
--   TTYPEDOC (Table)
--   TSMID (Table)
--   VNAZ (Table)
--
CREATE OR REPLACE PACKAGE ASU."PKG_USLUGI" IS
  TYPE THealRoot IS TABLE OF INTEGER INDEX BY BINARY_INTEGER;

  --Функции для работы с услугами-----
  --цена услуги на определённое число
  FUNCTION GET_USLUGA_COST(PDATE DATE, PHEALID NUMBER) RETURN NUMBER;
  FUNCTION GET_HEAL_COST_STRAH(pHealid  NUMBER,
                               pCompanyID NUMBER,
                               pDate    DATE DEFAULT SYSDATE) RETURN NUMBER;
  FUNCTION GET_HEAL_COST(pHealid NUMBER, pDate DATE DEFAULT SYSDATE, pCompanyid NUMBER default -1) RETURN NUMBER;


  FUNCTION GET_PLAT_SMID_COST(pSmid IN NUMBER,pDate in date) RETURN NUMBER;
  FUNCTION GET_PLAT_TALON_COST(pTalonid IN NUMBER, pFK_ID in number) RETURN NUMBER;

  function get_pac_paytype(ppacid number, pnazid number) return number;
  function get_paytype_syn(ppaytypeid  asu.ttypedoc.fk_id %type) return asu.ttypedoc.fc_synonim %type;
  function get_pac_paytype_syn(ppacid number, pnazid number) return asu.ttypedoc.fc_synonim %type;
  function get_rootheal(psynonim asu.ttypedoc.fc_synonim %type) return number;
  function get_pac_paytype_root(ppacid number, pnazid number) return number;
  function get_cost_sr(psmidid asu.tsmid.fk_id %type,
                        proothealid asu.theal.fk_id %type,
                        pDate    date default sysdate) return number;
  function get_cost_snp(psmidid asu.tsmid.fk_id %type,
                        pnazid asu.vnaz.fk_id%type,
                        ppacid asu.vnaz.fk_id%type,
                        pDate    date default sysdate) return number;
  function get_naz_cost(pnazid asu.vnaz.fk_id%type) return number;
  function get_heal_cost_paytype(pnazid asu.vnaz.fk_id%type,proothealid asu.theal.fk_id %type) return number;

  FUNCTION GET_SMID_COST(pSmidID IN NUMBER,
                         pDate   IN DATE DEFAULT SYSDATE) RETURN NUMBER;
  FUNCTION GET_HEAL_CODE(pSmidID IN NUMBER) RETURN VARCHAR2;
  FUNCTION GET_HEAL_ID(pSmidID IN NUMBER) RETURN NUMBER;
   FUNCTION GET_HEAL_NAME(pHealid  NUMBER,
                         pDate    DATE DEFAULT SYSDATE) RETURN VARCHAR2;

  function get_heal_type(psynonim asu.ttypedoc.fk_id %type) return NUMBER;
  function get_heal_type_oms_bud_plat(psynonim asu.ttypedoc.fk_id %type) return NUMBER;
  FUNCTION GET_HEAL_ID_BY_NAZ(pnazid IN NUMBER, ppacid IN NUMBER, pUseDefUslug IN NUMBER default 1) RETURN NUMBER;
  FUNCTION GET_HEAL_ID_BY_SMID(pSmid IN NUMBER, ppacid IN NUMBER,pDate in date, pUseDefUslug IN NUMBER default 1) RETURN NUMBER;
  FUNCTION GET_HEAL_ID_BY_OPER(pnazid IN NUMBER, ppacid IN NUMBER, pOperSmid IN NUMBER, pDate in date, pUseDefUslug IN NUMBER default 1) RETURN NUMBER;
  function GetDiagByNaz(pNazID in NUMBER, pPacID IN NUMBER) RETURN NUMBER;
  function GetDiagByNazWithStac(pNazID in NUMBER, pPacID IN NUMBER) RETURN NUMBER;
  function GetNaprUch(pNAzid IN NUMBER, pPacID IN NUMBER, pSMID IN NUMBER DEFAULT 0) RETURN NUMBER;
  function GetNaprUchID(pNAzid IN NUMBER, pPacID IN NUMBER) RETURN NUMBER;
  function GetMestGit(pPacID IN NUMBER, pAdrType in number default 62) RETURN NUMBER;
  function GetKLADRNAME(pID IN NUMBER) RETURN VARCHAR2;
  function GetMestGitForRegion(pPacID IN NUMBER, pAdrType IN NUMBER default 62) RETURN number;
  function GetNaprName(pFK_SMID IN NUMBER) RETURN VARCHAR2;

  function GetMetodName(pFK_SMID IN NUMBER) RETURN VARCHAR2;
  function GetMetodID(pFK_SMID IN NUMBER) RETURN NUMBER;

  function GetVozrastNumber(pPacID IN NUMBER) RETURN NUMBER;
  function GetOperID(pNazID IN NUMBER) RETURN NUMBER;
  function GetExpr(pPacID IN NUMBER) RETURN NUMBER;
  function GetLgotType(pPacID IN NUMBER) RETURN NUMBER;
  function GetLgotUsl(pPacID IN NUMBER, pNazID IN NUMBER, pLgot IN NUMBER) return NUMBER;
  function GetWithMather(pPacID IN NUMBER) RETURN number;
  function GetOperISHOD(pNazID IN NUMBER) RETURN VARCHAR2;
  function GetDostavlen(pPacID IN NUMBER) RETURN NUMBER;

  function GetSoputDiagForAmbul(pFK_NazID IN NUMBER) RETURN NUMBER;
  function GetPredDiag(pPacID IN NUMBER, pNazID IN NUMBER) RETURN NUMBER;


  function GetKdnBefore(pPacid IN NUMBER, pdate IN DATE, pFK_OTDEL IN NUMBER) RETURN NUMBER;
  function GetKdnAfter(pPacid IN NUMBER, pdate IN DATE, pFK_OTDEL IN NUMBER) RETURN NUMBER;
  function GetKdn(pPacid IN NUMBER, pdate IN DATE, pFK_OTDEL IN NUMBER) RETURN NUMBER;
--  function GetHirurgKdnAfter()
----------------------------------------------------------------------------------
FUNCTION GET_HEAL_ID_BY_SMID_TYPE_VOZR(
                              pSmid IN NUMBER, 
                              ppacid IN NUMBER,
                              pDate in date, 
                              pHealType in number, 
                              pPacAge in number,
                              pUseDefUslug IN NUMBER default 1) RETURN NUMBER;
                              
  function GetUslCostByInsurance(pInsid IN NUMBER) RETURN NUMBER;
  function GetUslCostBySertificat(pSertid IN NUMBER) RETURN NUMBER;
  function GetCertificatBalance(pCertificatid IN NUMBER) RETURN NUMBER;
  function GetInsuranceBalance(pInsid IN NUMBER) RETURN NUMBER;
  function GetDogovorBalance(pInsid in number) return number;
  function CanNazSKNaz(pFK_NAZID IN NUMBER) RETURN NUMBER;
  
  FUNCTION GET_HEAL_CODE_BY_HEALID(pHealID IN NUMBER) RETURN VARCHAR2;
  FUNCTION GET_HEALS_BY_NAZ(pnazid IN NUMBER, pUseDefUslug IN NUMBER default 0) RETURN SYS_REFCURSOR;
  FUNCTION GET_HEALS_BY_NAZ_PRIEM(pnazid IN NUMBER, pUseDefUslug IN NUMBER default 0) RETURN SYS_REFCURSOR;                              
END;
/

SHOW ERRORS;


