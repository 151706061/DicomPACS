DROP FUNCTION ASU.GET_VRACH_KONS_ISL_TAL
/

--
-- GET_VRACH_KONS_ISL_TAL  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TNAZIS (Table)
--   TNAZKONS (Table)
--   TAMBTALON_NAZ (Table)
--   GET_VIPNAZ (Function)
--
CREATE OR REPLACE FUNCTION ASU.GET_VRACH_KONS_ISL_TAL ( pTALON_ID IN NUMBER)
  RETURN  NUMBER IS

res NUMBER;
BEGIN
  res := -1;

  SELECT COALESCE(MAX(v.fk_ispolid), -1) INTO res
  FROM ASU.TNAZKONS v INNER JOIN ASU.TAMBTALON_NAZ tn
  ON v.fk_id = tn.fk_nazid
  WHERE tn.fk_talonid = pTALON_ID AND v.fk_nazsosid = asu.get_vipnaz
  AND v.fd_run = (SELECT MAX(v1.FD_RUN)FROM ASU.TNAZKONS v1 INNER JOIN ASU.TAMBTALON_NAZ tn1
      ON v1.fk_id = tn1.fk_nazid AND v1.fk_nazsosid = asu.get_vipnaz
      WHERE tn1.fk_talonid = pTALON_ID);

  IF res > 0
  THEN
    RETURN res;
  END IF;

  SELECT COALESCE(MAX(v.fk_ispolid), -1) INTO res
  FROM ASU.TNAZKONS v INNER JOIN ASU.TAMBTALON_NAZ tn
  ON v.fk_id = tn.fk_nazid
  WHERE tn.fk_talonid = pTALON_ID AND v.fk_nazsosid <> asu.get_vipnaz
  AND v.fd_run = (SELECT MAX(v1.FD_RUN)FROM ASU.TNAZKONS v1 INNER JOIN ASU.TAMBTALON_NAZ tn1
      ON v1.fk_id = tn1.fk_nazid AND v1.fk_nazsosid <> asu.get_vipnaz
      WHERE tn1.fk_talonid = pTALON_ID);

  IF res > 0
  THEN
    RETURN res;
  END IF;

  SELECT COALESCE(MAX(v.fk_ispolid), -1) INTO res
  FROM ASU.TNAZIS v INNER JOIN ASU.TAMBTALON_NAZ tn
  ON v.fk_id = tn.fk_nazid
  WHERE tn.fk_talonid = pTALON_ID AND v.fk_nazsosid = asu.get_vipnaz
  AND v.fd_run = (SELECT MAX(v1.FD_RUN)FROM ASU.TNAZIS v1 INNER JOIN ASU.TAMBTALON_NAZ tn1
      ON v1.fk_id = tn1.fk_nazid AND v1.fk_nazsosid = asu.get_vipnaz
      WHERE tn1.fk_talonid = pTALON_ID);

  IF res > 0
  THEN
    RETURN res;
  END IF;

  SELECT COALESCE(MAX(v.fk_ispolid), -1) INTO res
  FROM ASU.TNAZIS v INNER JOIN ASU.TAMBTALON_NAZ tn
  ON v.fk_id = tn.fk_nazid
  WHERE tn.fk_talonid = pTALON_ID AND v.fk_nazsosid <> asu.get_vipnaz
  AND v.fd_run = (SELECT MAX(v1.FD_RUN)FROM ASU.TNAZIS v1 INNER JOIN ASU.TAMBTALON_NAZ tn1
      ON v1.fk_id = tn1.fk_nazid AND v1.fk_nazsosid <> asu.get_vipnaz
      WHERE tn1.fk_talonid = pTALON_ID);

  IF res > 0
  THEN
    RETURN res;
  END IF;

  RETURN res;
END;
/

SHOW ERRORS;


