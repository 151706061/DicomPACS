DROP PROCEDURE ASU.DO_INSERT_UPDATE_TIB3
/

--
-- DO_INSERT_UPDATE_TIB3  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TIB (Table)
--   TSMID (Table)
--
CREATE OR REPLACE PROCEDURE ASU."DO_INSERT_UPDATE_TIB3"
   (pFK_PACID         IN NUMBER,
    pFC_CHAR          IN VARCHAR2,
    pFC_SYNONIM       IN VARCHAR2)
   IS

nTmp NUMBER;
BEGIN
        SELECT MAX(FK_ID)
        INTO nTmp
        FROM  ASU.TIB I
        WHERE FK_PACID = pFK_PACID
              AND FK_SMID = (SELECT NVL(MAX(FK_ID), 0) FROM ASU.TSMID WHERE (fl_del <> 1 or fl_del is null) and FC_SYNONIM = pFC_SYNONIM);

        IF nTmp IS NOT NULL
        THEN
           UPDATE ASU.TIB
           SET FC_CHAR = pFC_CHAR
           WHERE FK_ID = nTmp;
        ELSE
           INSERT INTO ASU.TIB(FK_PACID, FK_SMID, FC_CHAR)
           VALUES (pFK_PACID, (SELECT NVL(FK_ID, 0) FK_ID FROM ASU.TSMID WHERE (fl_del <> 1 or fl_del is null) and FC_SYNONIM = pFC_SYNONIM), pFC_CHAR);
        END IF;
END "DO_INSERT_UPDATE_TIB3"; -- Procedure
/

SHOW ERRORS;


