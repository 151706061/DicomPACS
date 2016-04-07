DROP PROCEDURE ASU.IS_TALON_HAS_RASPRED_RGISSL
/

--
-- IS_TALON_HAS_RASPRED_RGISSL  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   STRING_AGG (Function)
--   TAMBTALON_NAZ (Table)
--   TSMID (Table)
--   GET_NAZ_CANCEL (Function)
--   GET_NAZ_OTKAZ (Function)
--   GET_NEYAV (Function)
--   GET_PASS_REGISTRATOR (Function)
--   GET_PASS_REGISTRATOR_DD (Function)
--   GET_RECOMEND (Function)
--   GET_RG_ISSL (Function)
--   GET_VIPNAZ (Function)
--   GET_XRAY_UROLOG (Function)
--   VNAZ (Table)
--
CREATE OR REPLACE PROCEDURE ASU.IS_TALON_HAS_RASPRED_RGISSL(pFK_TALONID IN NUMBER,
                                                       pFD_DATE    in date,
                                                       pNazs out varchar2,
                                                       pRes out number)
   IS



  cursor c is
   select COUNT(1), ASU.string_agg(FC_NAME)  from  (
    select DISTINCT TSMID.FC_NAME
      from ASU.TSMID
     where FK_ID in (GET_RG_ISSL, GET_XRAY_UROLOG)--, GET_ONKO_OWNERID)
    connect by prior FK_OWNER = FK_ID
     start with FK_ID in
                (select FK_SMID
                   from ASU.VNAZ, ASU.TAMBTALON_NAZ
                  where
                    VNAZ.FD_RUN >= TRUNC(pFD_DATE)
                    and VNAZ.FK_NAZSOSID not in
                        (ASU.Get_Vipnaz, asu.get_recomend, asu.get_neyav,
                         asu.get_naz_otkaz, asu.get_naz_cancel,
                         asu.GET_PASS_REGISTRATOR_DD,
                         ASU.GET_PASS_REGISTRATOR)
                     and VNAZ.FK_ID = TAMBTALON_NAZ.FK_NAZID
                     and TAMBTALON_NAZ.FK_TALONID = pFK_TALONID)) TT;

BEGIN
  OPEN C;
  FETCH C INTO pRes,pNazs;
  CLOSE C;
END;
/

SHOW ERRORS;


