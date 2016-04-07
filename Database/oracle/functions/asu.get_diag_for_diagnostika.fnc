DROP FUNCTION ASU.GET_DIAG_FOR_DIAGNOSTIKA
/

--
-- GET_DIAG_FOR_DIAGNOSTIKA  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TDIAG (Table)
--   GET_MAINDIAG (Function)
--   PKG_FRFORM30 (Package)
--   VNAZ (Table)
--
CREATE OR REPLACE FUNCTION ASU.get_diag_for_diagnostika(pFK_ID IN NUMBER, pFK_PACID IN NUMBER)
  RETURN VARCHAR2 IS

  sRes VARCHAR2(5000);
  idNaz NUMBER;
  cursor cNaz is select fk_nazowner
                   from asu.vnaz
                  where fk_id = pFK_ID;

  cursor cDs is select stat.pkg_frform30.get_last_diag(pFK_PACID) from dual;
  cursor cDs1(pOwner in number) is select fc_write from asu.tdiag where fk_nazid = pOwner and fl_main = asu.get_maindiag order by fd_date desc;

BEGIN
    open cNaz;
    fetch cNaz into idNaz;
    close cNaz;
    if (idNaz = -1) or (idNaz = -2) then
      open cDs;
      fetch cDs into sRes;
      close cDs;
    else
      open cDs1(idNaz);
      fetch cDs1 into sRes;
      close cDs1;
    end if;
    RETURN sRes;
END;
/

SHOW ERRORS;


