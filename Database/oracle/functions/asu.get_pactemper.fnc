DROP FUNCTION ASU.GET_PACTEMPER
/

--
-- GET_PACTEMPER  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSMID (Table)
--   TTEMPLIST (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_PACTEMPER" (pFK_PACID  IN BINARY_INTEGER,
                                         pFN_RESNUM IN BINARY_INTEGER DEFAULT 1)
  RETURN VARCHAR2 IS
  -- a nahera vashe varchar vozvrashat'? pochemu ne number??? uebstvo!
  Result VARCHAR2(32767);
  nTemp  BINARY_INTEGER := 0;
BEGIN
  -- EBANIY MALOY!!! NAPISAT' TAKUYU HUYNU!!! BLYA ZA ETO NADO EGO SAMOGO V BOLNITCU POLOGIT !!!!
  /*SELECT COLVAL
    INTO RESULT
    FROM (SELECT TO_CHAR(FN_VALUE) COLVAL
            FROM TTEMPLIST
           WHERE FK_PACID = APACID AND
                 FK_SMIDID IN
                 (SELECT FK_ID
                    FROM TSMID
                   WHERE FC_SYNONIM = 'TL_TEMPER_UTRO' OR
                         FC_SYNONIM = 'TL_TEMPER_VECHER')

           ORDER BY FD_ZAPOLN DESC)
   WHERE ROWNUM < 2;
  RETURN(RESULT);*/
  nTemp := pFN_RESNUM;
  FOR p IN (SELECT FN_VALUE, FD_ZAPOLN, FC_TIME
              FROM TTEMPLIST, TSMID
             WHERE FK_PACID = pFK_PACID
               AND FK_SMIDID = TSMID.FK_ID
               AND (FC_SYNONIM = 'TL_TEMPER_UTRO' OR FC_SYNONIM = 'TL_TEMPER_VECHER')
             ORDER BY FD_ZAPOLN DESC, FC_TIME DESC) LOOP
    Result := TO_CHAR(p.FN_VALUE);
    nTemp  := nTemp - 1;
    EXIT WHEN nTemp < 1;
  END LOOP;

  RETURN(Result);
END GET_PACTEMPER;
/

SHOW ERRORS;


