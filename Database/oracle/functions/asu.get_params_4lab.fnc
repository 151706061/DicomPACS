DROP FUNCTION ASU.GET_PARAMS_4LAB
/

--
-- GET_PARAMS_4LAB  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSMID (Table)
--   GET_IMUNNO_CLASS (Function)
--   GET_IMUNNO_CLASS_CHAR (Function)
--   GET_OWNER_FROM_SMID (Function)
--
CREATE OR REPLACE FUNCTION ASU.get_params_4lab(pfk_smid in number, pfc_type in varchar2, pfc_value in varchar2)
  RETURN varchar2 IS
  sRes varchar2(50);
  sSyn varchar2(150);
  cursor cSmid is select fc_synonim from asu.tsmid where fk_id = asu.get_owner_from_smid(pfk_smid);
BEGIN
  sRes := '';
  open cSmid;
  fetch cSmid into sSyn;
  close cSmid;
--raise_application_error(-20000, sSyn);
  if (sSyn = 'ISSLED_IMMUNOGBULIN') or (sSyn = 'ISSLED_ANTITELIGE_ASKARIDA') or (sSyn = 'ISSLED_ANTITELIGE_ANIZAKIS') then
    if (pfc_type = 'NUMBER') and (pfc_value is not null) then
      return '('||asu.get_imunno_class(to_number(pfc_value, 'FM99999999990.0999'))||')';
    end if;

    if (pfc_type = 'VARCHAR2') and (pfc_value is not null) then
      return '('||asu.get_imunno_class_char(pfc_value)||')';
    end if;
  end if;
  RETURN sRes;
END;
/

SHOW ERRORS;


