DROP FUNCTION ASU.GET_DISTRICT_NAME_ID_BY_AMB
/

--
-- GET_DISTRICT_NAME_ID_BY_AMB  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   DOC_AMBDP (Function)
--   DOC_AMBUL_GK (Function)
--   TOTDEL (Synonym)
--   TADRESS (Table)
--   TAMBULANCE (Table)
--   TDISTRICT (Table)
--   TDISTRICT_NAME (Table)
--   TDISTRICT_PACIENT (Table)
--   TDOCOBSL (Table)
--   PKG_REGIST_PACFUNC (Package)
--   DOC_STOM_KARTA (Function)
--   GET_DISTRICTID_BY_ADDRID (Function)
--   GET_PROPISKAID (Function)
--
CREATE OR REPLACE FUNCTION ASU.GET_DISTRICT_NAME_ID_BY_AMB(pPeplid in NUMBER, pAmbID IN TADRESS.FK_ID%TYPE,
     pSotrId IN TDISTRICT_NAME.FK_SOTR%TYPE DEFAULT -1,
     pOtdID  IN TOTDEL.FK_ID%TYPE DEFAULT -1)

 RETURN TDISTRICT.FK_ID%TYPE IS
 -- Created 23.09.2010 by Linnikov
 -- Определяет код участка по коду пацу
   THERAPIST_AREA number := 946806; -- OTHER
   GYNEC_AREA number := 946807;     --DOC_AMBUL_GK
   DENTAL_AREA number := 946808;    --DOC_STOM_KARTA
   PEDIATR_AREA number := 946809;   --DOC_AMBDP


   --pNeedArea number;
   pREs number := NULL;
   pFK_D number;


   cursor GET_AMB_AREAL is
     Select MAX(Tdistrict.FK_ID) from ASU.Tdistrict_name, ASU.Tdistrict,asu.TAmbulance,ASU.TDistrict_pacient,
      (
          Select DECODE(MAX(TDocObsl.FK_VIDDOCID),asu.DOC_AMBUL_GK, GYNEC_AREA,
                                       asu.DOC_STOM_KARTA,DENTAL_AREA,
                                       asu.DOC_AMBDP,PEDIATR_AREA,
                                       THERAPIST_AREA) as FK_TYPE
          from ASU.TAmbulance , asu.TDocObsl
           where
          TAmbulance.FK_DOCOBSL = TDocObsl.FK_ID
           and
          TAmbulance.FK_ID =pAmbID
      ) TNeedType
     where
      Tdistrict_name.FK_ID = Tdistrict.FK_DISTRICT
       and
      Tdistrict_name.FK_TYPEID =  TNeedType.FK_TYPE
       and
      TDistrict_pacient.FK_AREALID = TDistrict_name.FK_ID
       and
      TDistrict_pacient.FK_PEPLID = pPeplid;


  cursor GET_DISTRICT_NAME_ID(pFK_DISTRICTID in number) is
   select dn.FK_ID from ASU.TDISTRICT_NAME dn, ASU.TDIstrict d where d.fk_district = dn.fk_id and
   d.Fk_Id = pFK_DISTRICTID;
BEGIN
 OPEN  GET_AMB_AREAL;
 FETCH GET_AMB_AREAL INTO pREs;
 CLOSE GET_AMB_AREAL;

 if pREs is NULL then
  pREs := GET_DISTRICTID_BY_ADDRID(ASU.PKG_REGIST_PACFUNC.GET_PAC_ADRID(pAmbID,asu.GET_PROPISKAID), pSotrId, pOtdID);
 end if;

 if (pRes is not NULL) and (pRes > 0) then
    pFK_D := pRes;
    OPEN  GET_DISTRICT_NAME_ID(pFK_D);
    FETCH GET_DISTRICT_NAME_ID INTO pREs;
    CLOSE GET_DISTRICT_NAME_ID;
  else
   pres := -1;
 end if;

 return pRes;
END;
/

SHOW ERRORS;


