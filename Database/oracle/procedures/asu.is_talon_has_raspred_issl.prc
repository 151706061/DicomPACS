DROP PROCEDURE ASU.IS_TALON_HAS_RASPRED_ISSL
/

--
-- IS_TALON_HAS_RASPRED_ISSL  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   STRING_AGG (Function)
--   TNAZIS (Table)
--   TAMBTALON_NAZ (Table)
--   TSMID (Table)
--   GET_NAZ_CANCEL (Function)
--   GET_NAZ_OTKAZ (Function)
--   GET_NEYAV (Function)
--   GET_PASS_REGISTRATOR (Function)
--   GET_PASS_REGISTRATOR_DD (Function)
--   GET_RECOMEND (Function)
--   GET_VIPNAZ (Function)
--
CREATE OR REPLACE PROCEDURE ASU.IS_TALON_HAS_RASPRED_ISSL(pFK_TALONID IN NUMBER,
                                                       pFD_DATE    in date,
                                                       pNazs out varchar2,
                                                       pRes out number)
   IS



  cursor c is
   select COUNT(1), ASU.string_agg(FC_NAME)  from  (
                select TSMID.FC_NAME
                   from ASU.TNAZIS, ASU.TAMBTALON_NAZ,  ASU.TSMID
                  where
                    TNAZIS.FK_SMID  = TSMID.FK_ID
                    and
                    TNAZIS.FD_RUN >= TRUNC(pFD_DATE)
                    and TNAZIS.FK_NAZSOSID not in
                        (ASU.Get_Vipnaz, asu.get_recomend, asu.get_neyav,
                         asu.get_naz_otkaz, asu.get_naz_cancel,
                         asu.GET_PASS_REGISTRATOR_DD,
                         ASU.GET_PASS_REGISTRATOR)
                     and TNAZIS.FK_ID = TAMBTALON_NAZ.FK_NAZID
                     and TAMBTALON_NAZ.FK_TALONID = pFK_TALONID) TT;

BEGIN
  OPEN C;
  FETCH C INTO pRes,pNazs;
  CLOSE C;
END;
/

SHOW ERRORS;


