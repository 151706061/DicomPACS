DROP FUNCTION ASU.GET_DIAG_4KONSULT
/

--
-- GET_DIAG_4KONSULT  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TDIAG (Table)
--   GET_MAINDIAG (Function)
--   GET_MKB10_FROM_TSMID (Function)
--   GET_NAPRDIAG (Function)
--   GET_SMIDNAME (Function)
--   GET_ZAKLDIAG (Function)
--
CREATE OR REPLACE FUNCTION ASU.get_diag_4konsult(pNazid in number, pType in number default 1)
  RETURN varchar2 IS

  sRes varchar2(4000);
  cursor cDiag is select fc_write, fp_type
                    from asu.tdiag
                   where fk_nazid = pNazid
                     and fl_main = asu.get_maindiag
                     and fp_type in (asu.get_naprdiag, asu.get_zakldiag);
  cursor cMkb is select fp_type, asu.get_mkb10_from_tsmid(fk_smdiagid) as mkb
                   from asu.tdiag
                  where fk_nazid = pNazid
                    and fl_main = asu.get_maindiag
                    and fp_type in (asu.get_naprdiag, asu.get_zakldiag);
  cursor cPr is select fp_type, asu.get_smidname(fl_first) as prname
                  from asu.tdiag
                 where fk_nazid = pNazid
                   and fl_main = asu.get_maindiag
                   and fp_type in (asu.get_naprdiag, asu.get_zakldiag);

BEGIN
  if pType = 1 then -- наименование диагноза
    for c in cDiag loop
      if c.fp_type = asu.get_zakldiag then
        sRes := c.fc_write;
      end if;
    end loop;
    if sRes is null then
      for c in cDiag loop
        if c.fp_type = asu.get_naprdiag then
          sRes := c.fc_write;
        end if;
      end loop;
    end if;
  end if;

  if pType = 2 then -- код МКБ-10 диагноза
    for c in cMkb loop
      if c.fp_type = asu.get_zakldiag then
        sRes := c.mkb;
      end if;
    end loop;
    if sRes is null then
      for c in cMkb loop
        if c.fp_type = asu.get_naprdiag then
          sRes := c.mkb;
        end if;
      end loop;
    end if;

  end if;

  if pType = 3 then -- признак диагноза
    for c in cPr loop
      if c.fp_type = asu.get_zakldiag then
        sRes := c.prname;
      end if;
    end loop;
    if sRes is null then
      for c in cPr loop
        if c.fp_type = asu.get_naprdiag then
          sRes := c.prname;
        end if;
      end loop;
    end if;
  end if;
  return sRes; -- Created by Prihodko N. 28.10.2011 Функция ищет диагнозы только среди заключительных и предварительных типов -- Функция возвращает pType = 1 - наименование диагноза, поставленного в рамках консультации; pType = 2 - код МКБ-10 диагноза; pType = 3 - признак(выявлен)
END;
/

SHOW ERRORS;


