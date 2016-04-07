DROP PROCEDURE ASU.DO_INSERTVRES
/

--
-- DO_INSERTVRES  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TRESAN (Table)
--   TRESIS (Table)
--   TRESKONS (Table)
--   TRESLECH (Table)
--   TSMID (Table)
--   GET_ANALID (Function)
--   GET_ISSLEDID (Function)
--   GET_KONSID (Function)
--   GET_PROCID (Function)
--
CREATE OR REPLACE PROCEDURE ASU."DO_INSERTVRES" (pfk_smid IN NUMBER, pfd_ins IN DATE, pfc_res IN VARCHAR2, pfc_type IN VARCHAR2,
   pfk_vrachid IN NUMBER, pfk_pacid IN NUMBER, pfk_nazid IN NUMBER, pfk_sos IN NUMBER
) IS
   CURSOR c IS
      SELECT 1 AS fn_t
        FROM tsmid
       WHERE fk_id = get_analid
       START WITH fk_id = pfk_smid
      CONNECT BY PRIOR fk_owner = fk_id
      UNION
      SELECT 2 AS fn_t
        FROM tsmid
       WHERE fk_id = get_issledid
       START WITH fk_id = pfk_smid
      CONNECT BY PRIOR fk_owner = fk_id
      UNION
      SELECT 3 AS fn_t
        FROM tsmid
       WHERE fk_id = get_konsid
       START WITH fk_id = pfk_smid
      CONNECT BY PRIOR fk_owner = fk_id
      UNION
      SELECT 4 AS fn_t
        FROM tsmid
       WHERE fk_id = get_procid
       START WITH fk_id = pfk_smid
      CONNECT BY PRIOR fk_owner = fk_id;
BEGIN
   FOR i IN c LOOP
      IF i.fn_t = 1 THEN
         INSERT INTO tresan
                     (fk_smid, fd_ins, fc_res, fc_type, fk_vrachid, fk_pacid, fk_nazid, fk_sos)
              VALUES (pfk_smid, pfd_ins, pfc_res, pfc_type, pfk_vrachid, pfk_pacid, pfk_nazid, pfk_sos);
      ELSIF i.fn_t = 2 THEN
         INSERT INTO tresis
                     (fk_smid, fd_ins, fc_res, fc_type, fk_vrachid, fk_pacid, fk_nazid, fk_sos)
              VALUES (pfk_smid, pfd_ins, pfc_res, pfc_type, pfk_vrachid, pfk_pacid, pfk_nazid, pfk_sos);
      ELSIF i.fn_t = 3 THEN
         INSERT INTO treskons
                     (fk_smid, fd_ins, fc_res, fc_type, fk_vrachid, fk_pacid, fk_nazid, fk_sos)
              VALUES (pfk_smid, pfd_ins, pfc_res, pfc_type, pfk_vrachid, pfk_pacid, pfk_nazid, pfk_sos);
      ELSIF i.fn_t = 4 THEN
         INSERT INTO treslech
                     (fk_smid, fd_ins, fc_res, fc_type, fk_vrachid, fk_pacid, fk_nazid, fk_sos)
              VALUES (pfk_smid, pfd_ins, pfc_res, pfc_type, pfk_vrachid, pfk_pacid, pfk_nazid, pfk_sos);
      END IF;
   END LOOP;
END;
/

SHOW ERRORS;


