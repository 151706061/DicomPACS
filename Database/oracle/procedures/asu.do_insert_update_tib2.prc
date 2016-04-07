DROP PROCEDURE ASU.DO_INSERT_UPDATE_TIB2
/

--
-- DO_INSERT_UPDATE_TIB2  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TIB (Table)
--   TSMID (Table)
--   PKG_REGIST_PEPLFUNC (Package)
--   GET_SMIDOWNER (Function)
--
CREATE OR REPLACE PROCEDURE ASU."DO_INSERT_UPDATE_TIB2"
   (pFK_PACID         IN NUMBER,
    pFK_SMID          IN NUMBER,
    pFC_SYNONIM       IN VARCHAR2)
   IS

nTmp NUMBER;
BEGIN
        SELECT MAX(FK_ID)
        INTO nTmp
        FROM  ASU.TIB
        WHERE FK_PACID = ASU.PKG_REGIST_PEPLFUNC.GET_PEPL_ID(pFK_PACID)
              AND FK_SMEDITID IN (SELECT FK_ID FROM TSMID WHERE (fl_del <> 1 or fl_del is null) and FC_SYNONIM = pFC_SYNONIM);

        IF nTmp IS NOT NULL
        THEN
           UPDATE ASU.TIB
           SET FK_SMID = pFK_SMID
           WHERE FK_ID = nTmp;
        ELSE
           INSERT INTO ASU.TIB(FK_PACID, FK_SMID, FK_SMEDITID)
           VALUES (ASU.PKG_REGIST_PEPLFUNC.GET_PEPL_ID(pFK_PACID), pFK_SMID, ASU.get_smidowner(pFK_SMID));
        END IF;
END "DO_INSERT_UPDATE_TIB2"; -- Procedure
/

SHOW ERRORS;


