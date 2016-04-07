DROP PROCEDURE ASU.DO_DELETE_TIB2
/

--
-- DO_DELETE_TIB2  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TIB (Table)
--   TSMID (Table)
--
CREATE OR REPLACE PROCEDURE ASU."DO_DELETE_TIB2"
   (pFK_PACID         IN NUMBER,
    pFC_SYNONIM       IN VARCHAR2,
    pRM_OPTION        IN NUMBER) --если pRM_OPTION = 0 тогда FK_SMEDITID IN (...)
                                 --иначе FK_SMID IN (...)
   IS
BEGIN
   IF pRM_OPTION = 0
   THEN
      DELETE FROM ASU.TIB T
      WHERE T.FK_PACID = pFK_PACID
            AND FK_SMEDITID IN (SELECT FK_ID FROM ASU.TSMID WHERE (fl_del <> 1 or fl_del is null) and FC_SYNONIM = pFC_SYNONIM);
   ELSE
      DELETE FROM ASU.TIB T
      WHERE T.FK_PACID = pFK_PACID
            AND FK_SMID IN (SELECT NVL(FK_ID, 0) as FK_ID FROM ASU.TSMID WHERE (fl_del <> 1 or fl_del is null) and FC_SYNONIM = pFC_SYNONIM);
   END IF;
END "DO_DELETE_TIB2";
/

SHOW ERRORS;


