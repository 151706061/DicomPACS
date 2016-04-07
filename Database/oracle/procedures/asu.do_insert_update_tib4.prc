DROP PROCEDURE ASU.DO_INSERT_UPDATE_TIB4
/

--
-- DO_INSERT_UPDATE_TIB4  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TIB (Table)
--   TSMID (Table)
--
CREATE OR REPLACE PROCEDURE ASU."DO_INSERT_UPDATE_TIB4"
   (pFK_PACID         IN NUMBER,
    pFD_DATE          IN DATE,
    pFC_SYNONIM       IN VARCHAR2)
   IS

nTmp NUMBER;
BEGIN
        SELECT MAX(FK_ID)
        INTO nTmp
        FROM  ASU.TIB I
        WHERE FK_PACID = pFK_PACID
        AND FK_SMID = (SELECT MAX(FK_ID) FROM ASU.TSMID WHERE (fl_del <> 1 or fl_del is null) and FC_SYNONIM = pFC_SYNONIM);

        IF nTmp IS NOT NULL
        THEN
           UPDATE ASU.TIB
           SET FD_DATE = pFD_DATE
           WHERE FK_ID = nTmp;
        ELSE
           INSERT INTO ASU.TIB(FK_PACID, FK_SMID, FD_DATE)
           VALUES (pFK_PACID,  (SELECT NVL(FK_ID, 0) FK_ID FROM TSMID WHERE (fl_del <> 1 or fl_del is null) and FC_SYNONIM = pFC_SYNONIM), pFD_DATE);
       END IF;
END "DO_INSERT_UPDATE_TIB4"; -- Procedure
/

SHOW ERRORS;


