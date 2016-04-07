DROP FUNCTION ASU.GET_PAC_PULS
/

--
-- GET_PAC_PULS  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSMID (Table)
--   TTEMPLIST (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_PAC_PULS" (pFK_PACID  IN BINARY_INTEGER,
                                         pFN_RESNUM IN BINARY_INTEGER DEFAULT 1)
  RETURN NUMBER IS
  Result NUMBER;
  nTemp  BINARY_INTEGER := 0;
BEGIN
  nTemp := pFN_RESNUM;
  FOR p IN (SELECT FN_VALUE, FD_ZAPOLN, FC_TIME
              FROM TTEMPLIST, TSMID
             WHERE FK_PACID = pFK_PACID
               AND FK_SMIDID = TSMID.FK_ID
               AND (FC_SYNONIM = 'TL_PULS_UTRO' OR FC_SYNONIM = 'TL_PULS_VECHER')
             ORDER BY FD_ZAPOLN DESC, FC_TIME DESC) LOOP
    Result := p.FN_VALUE;
    nTemp  := nTemp - 1;
    EXIT WHEN nTemp < 1;
  END LOOP;

  RETURN(Result);
END GET_PAC_PULS;
/

SHOW ERRORS;


