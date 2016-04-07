DROP PROCEDURE ASU.MERGE_DUPLICATES_COMPANY
/

--
-- MERGE_DUPLICATES_COMPANY  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TVAC_COMPANY (Table)
--
CREATE OR REPLACE PROCEDURE ASU.merge_duplicates_company(PNEW IN NUMBER, POLD IN NUMBER)
IS
  CURSOR cVC IS select fk_company from asu.tvac_company where fk_company = pnew;
  cOldComp NUMBER;
BEGIN
--  update asu.tlpy_company set fk_company = pnew where fk_company = pold;
--  update asu.tlpy_company set fk_company_lpy = pnew where fk_company_lpy = pold;
--  update asu.tvac_map set fk_organization = pnew where fk_organization = pold;
--  update asu.tvac_map set fk_organization_lpy = pnew where fk_organization_lpy = pold;
  open cVC;
  fetch cVC into cOldComp;
  close cVC;
  if cOldComp is not null then
    delete from asu.tvac_company where fk_company = pold;
  else
    update asu.tvac_company set fk_company = pnew where fk_company = pold;
  end if;
END; -- Procedure by Prihodko N. 21.10.2010
/

SHOW ERRORS;


