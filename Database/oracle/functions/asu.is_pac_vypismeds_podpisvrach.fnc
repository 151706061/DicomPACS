DROP FUNCTION ASU.IS_PAC_VYPISMEDS_PODPISVRACH
/

--
-- IS_PAC_VYPISMEDS_PODPISVRACH  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSROKY (Table)
--   TEDIT_STATKART (Table)
--   TKARTA (Table)
--
CREATE OR REPLACE FUNCTION ASU.IS_PAC_VYPISMEDS_PODPISVRACH(pPacID in NUMBER) return number is
  Result number;
  tmp number;
begin
  Result := 0;

  tmp := 0;
  for c in (select 1 as F
              from tkarta
             where fk_id = pPacID
               and fp_tek_coc = 3) loop
    tmp := c.F;
  end loop;
  Result := Result + tmp;

  tmp := 0;
  for c in (select 1 as F
              from tsroky
             where fk_pacid = pPacID
               and fk_pryb = 3) loop
    tmp := c.F;
  end loop;
  Result := Result + tmp;

  tmp := 0;
  for c in (select 1 as F
              from tedit_statkart
             where FK_PACID = pPacID
               AND FD_DATE = (select max(FD_DATE)
                                from tedit_statkart
                               where fk_pacid = pPacID)
               and fl_state = 1) loop
    tmp := c.F;
  end loop;
  Result := Result + tmp;

  if Result = 3 then
    Result := 1;
  else
    Result := 0;
  end if;

  return(Result);
end IS_PAC_VYPISMEDS_PODPISVRACH;
/

SHOW ERRORS;


