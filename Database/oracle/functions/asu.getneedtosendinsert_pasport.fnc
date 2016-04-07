DROP FUNCTION ASU.GETNEEDTOSENDINSERT_PASPORT
/

--
-- GETNEEDTOSENDINSERT_PASPORT  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE FUNCTION ASU.GetNeedToSendINSERT_PASPORT(aPID IN NUMBER, aExportID IN NUMBER)
  RETURN NUMBER IS
  vSER VARCHAR2(30);
  vNUM VARCHAR2(30);
  vSER_O VARCHAR2(30);
  vNUM_O VARCHAR2(30);
BEGIN
  -- Created 20100707 by Efimov
  -- Возвращает 1 если необходимо вызвать INSERT_PASPORT, 0 если нет
  RETURN 0;
  
--  SELECT MAX(t.policyser), MAX(t.policynum) INTO vSER, vNUM FROM PASP_POL@KHMOKB_LINK T WHERE T.PID = aPID;

--  SELECT te.policyser, te.policynum INTO vSER_O, vNUM_O FROM ASU.TEXCHUPLOAD_BIG_TMP te WHERE te.fk_id = aExportID;

--  if (vSER <> vSER_O) OR (vNUM <> vNUM_O) then
--    RETURN 1;
--  else
--    RETURN 0;
--  END IF;
END GetNeedToSendINSERT_PASPORT;
/

SHOW ERRORS;


