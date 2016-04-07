DROP FUNCTION ASU.GET_AREA_FOR_XRAY
/

--
-- GET_AREA_FOR_XRAY  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TDISTRICT_NAME (Table)
--   TDISTRICT_PACIENT (Table)
--   TSMID (Table)
--   GET_SMIDNAME (Function)
--
CREATE OR REPLACE FUNCTION ASU.get_area_for_xray (pPEPLID IN NUMBER)
  RETURN VARCHAR2 IS

  sRes VARCHAR2(150);
  cursor cAr is select '? '||fc_name||' ('||asu.get_smidname(fk_typeid)||')'
                  from asu.tdistrict_name t1, asu.tdistrict_pacient t2
                 where t1.fk_id = t2.fk_arealid
                   and t2.fk_peplid = pPEPLID
                   and t1.fk_typeid in (select fk_id from asu.tsmid where fc_synonim in ('PEDIATR_AREA', 'THERAPIST_AREA'))
                order by t2.fk_id desc;
BEGIN
    open cAr;
    fetch cAr into sRes;
    close cAr;
    RETURN sRes ;
END;
/

SHOW ERRORS;


