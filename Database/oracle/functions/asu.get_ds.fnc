DROP FUNCTION ASU.GET_DS
/

--
-- GET_DS  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TDIAG (Table)
--   TSMID (Table)
--   GET_CLINIK_DIAG (Function)
--   GET_MAINDIAG (Function)
--   GET_ZAKL_DIAG (Function)
--   VNAZ (Table)
--
CREATE OR REPLACE FUNCTION ASU.get_ds(pfk_id in number)
  RETURN varchar2 IS

  sRes varchar2(4000);

  cursor cZakl is select * from (select fc_write||' ('||(select fk_mkb10 from asu.tsmid where fk_id = t1.fk_smdiagid)||')' as fc_name
                    from asu.tdiag t1, asu.vnaz t2
                   where t1.fk_pacid = t2.fk_pacid
                     and t2.fk_id = pfk_id
                     and t1.fl_main = asu.get_maindiag
                     and t1.fp_type = asu.GET_ZAKL_DIAG
                  order by t1.fd_date desc) t
                  where rownum = 1;

  cursor cClinik is select * from (select fc_write||' ('||(select fk_mkb10 from asu.tsmid where fk_id = t1.fk_smdiagid)||')' as fc_name
                      from asu.tdiag t1, asu.vnaz t2
                     where t1.fk_pacid = t2.fk_pacid
                       and t2.fk_id = pfk_id
                       and t1.fl_main = asu.get_maindiag
                       and t1.fp_type = asu.GET_CLINIK_DIAG
                    order by t1.fd_date desc) t
                    where rownum = 1;

  cursor cBegin is select * from (select fc_write||' ('||(select fk_mkb10 from asu.tsmid where fk_id = t1.fk_smdiagid)||')' as fc_name
                    from asu.tdiag t1, asu.vnaz t2
                   where t1.fk_pacid = t2.fk_pacid
                     and t2.fk_id = pfk_id
                     and t1.fl_main = asu.get_maindiag
                     and t1.fp_type = (select fk_id from asu.tsmid where fc_synonim = 'PRI_POSTYPLENII')
                  order by t1.fd_date desc) t
                  where rownum = 1;

BEGIN
  open cZakl;
  fetch cZakl into sRes;
  close cZakl;
  if sRes is null then
    open cClinik;
    fetch cClinik into sRes;
    close cClinik;
    if sRes is null then
      open cBegin;
      fetch cBegin into sRes;
      close cBegin;
    end if;
  end if;
  RETURN sRes; -- Prihodko N. 07.02.2012 Возвращает последний заключительный диагноз, иначе последний клинический, иначе последний при поступлении
END;
/

SHOW ERRORS;


