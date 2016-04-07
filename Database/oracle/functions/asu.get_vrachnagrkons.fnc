DROP FUNCTION ASU.GET_VRACHNAGRKONS
/

--
-- GET_VRACHNAGRKONS  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSMID (Table)
--   TMP_NAZAGES (Table)
--   GET_KONSID (Function)
--
CREATE OR REPLACE FUNCTION ASU."GET_VRACHNAGRKONS" (
  pFK_VRACHID   IN   NUMBER
 ,pFD_DATA      IN   DATE
 ,pFK_SMID      IN   NUMBER
 ,pFN_AGE1      IN   NUMBER DEFAULT 0
 ,pFN_AGE2      IN   NUMBER DEFAULT 2000
 ,pFK_OWNER     IN   NUMBER DEFAULT get_konsid
)
  RETURN NUMBER
IS
  CURSOR c (
    pFK_VRACHID   IN   NUMBER
   ,pFD_DATA      IN   DATE
   ,pFK_SMID      IN   NUMBER
   ,pFN_AGE1      IN   NUMBER
   ,pFN_AGE2      IN   NUMBER
   ,pFK_OWNER     IN   NUMBER
  )
  IS
    SELECT SUM (fn_count)
      FROM tmp_nazages,
                 (SELECT fk_id
              FROM tsmid
             START WITH fk_owner = pFK_OWNER
            CONNECT BY PRIOR fk_id = fk_owner) q
     WHERE fk_roomid = pFK_vrachid
       AND fd_ins = TRUNC (pFD_DATA)
       AND fn_age BETWEEN pFN_AGE1 AND pFN_AGE2
       and fk_smid = q.fk_id;

/*    SELECT COUNT (vnaz.fk_id)
      FROM vnaz, tmp_pacages*/
                              /*,
           (SELECT fk_id
              FROM tsmid
             START WITH fk_owner = pFK_OWNER
            CONNECT BY PRIOR fk_id = fk_owner) q
     WHERE fk_ispolid = pFK_VRACHID
       AND q.fk_id = vnaz.fk_smid
       AND fk_smid = pFK_SMID
       AND TRUNC (fd_run) = pFD_DATA
       AND fk_nazsosid = get_vipnaz
       and vnaz.fk_pacid=tmp_pacages.fk_pacid
       and fn_age BETWEEN pFN_AGE1 AND pFN_AGE2;

--       AND get_pacageonvyb (fk_pacid) BETWEEN pFN_AGE1 AND pFN_AGE2;*/
  nres   NUMBER (9, 0);
-- Declare program variables as shown above
BEGIN
  OPEN c (pFK_VRACHID, pFD_DATA, pFK_SMID, pFN_AGE1, pFN_AGE2, pFK_OWNER);
  FETCH c INTO nres;
  CLOSE c;
  RETURN nRes;
END GET_VRACHNAGRKONS;
/

SHOW ERRORS;


