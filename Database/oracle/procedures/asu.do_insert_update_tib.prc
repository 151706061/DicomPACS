DROP PROCEDURE ASU.DO_INSERT_UPDATE_TIB
/

--
-- DO_INSERT_UPDATE_TIB  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TIB (Table)
--   TSMID (Table)
--   GET_SMIDOWNER (Function)
--
CREATE OR REPLACE PROCEDURE ASU."DO_INSERT_UPDATE_TIB"
   (pFK_PACID         IN NUMBER,
    pFK_SMID          IN NUMBER,
    pFC_SYNONIM       VARCHAR2)
   IS

   nTmp NUMBER;
BEGIN
        SELECT MAX(FK_ID)
        INTO nTmp
        FROM  ASU.TIB I
        WHERE FK_PACID = pFK_PACID
              AND FK_SMEDITID IN (SELECT FK_ID FROM TSMID WHERE (fl_del <> 1 or fl_del is null) and FC_SYNONIM = pFC_SYNONIM);

         IF nTmp IS NOT NULL
         THEN
            UPDATE ASU.TIB
            SET FK_SMID = pFK_SMID
            WHERE FK_ID = nTmp;
         ELSE
            INSERT INTO ASU.TIB(FK_PACID, FK_SMID, FK_SMEDITID)
            VALUES (pFK_PACID, pFK_SMID, ASU.get_smidowner(pFK_SMID));
         END IF;
END "DO_INSERT_UPDATE_TIB"; -- Procedure
/

SHOW ERRORS;


