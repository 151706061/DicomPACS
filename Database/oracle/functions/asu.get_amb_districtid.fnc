DROP FUNCTION ASU.GET_AMB_DISTRICTID
/

--
-- GET_AMB_DISTRICTID  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   DOC_AMBDP (Function)
--   DOC_AMBUL_GK (Function)
--   TADRESS (Table)
--   TAMBULANCE (Table)
--   TDISTRICT (Table)
--   TDISTRICT_NAME (Table)
--   TDISTRICT_PACIENT (Table)
--   TDOCOBSL (Table)
--   DOC_STOM_KARTA (Function)
--   GET_DENTAL_AREA (Function)
--   GET_GYNEC_AREA (Function)
--   GET_PEDIATR_AREA (Function)
--   GET_THERAPIST_AREA (Function)
--
CREATE OR REPLACE FUNCTION ASU.GET_AMB_DISTRICTID (pPeplid in NUMBER, pAmbID IN TADRESS.FK_ID%TYPE) RETURN TDISTRICT.FK_ID%TYPE IS

   pREs number := NULL;


   cursor GET_AMB_AREAL is
     Select MAX(Tdistrict.FK_ID) as N from ASU.Tdistrict_name, ASU.Tdistrict,asu.TAmbulance,ASU.TDistrict_pacient,
      (
          Select DECODE(MAX(TDocObsl.FK_VIDDOCID),asu.DOC_AMBUL_GK, GET_GYNEC_AREA,
                                       asu.DOC_STOM_KARTA,GET_DENTAL_AREA,
                                       asu.DOC_AMBDP,GET_PEDIATR_AREA,
                                       GET_THERAPIST_AREA) as FK_TYPE
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
BEGIN
 OPEN  GET_AMB_AREAL;
 FETCH GET_AMB_AREAL INTO pREs;
 CLOSE GET_AMB_AREAL;
 return pRes;
END;
/

SHOW ERRORS;


