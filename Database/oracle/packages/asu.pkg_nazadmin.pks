DROP PACKAGE ASU.PKG_NAZADMIN
/

--
-- PKG_NAZADMIN  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_NAZADMIN" IS
-- MODIFICATION HISTORY
-- A. Panchenko      7.02.2001    Create
   PROCEDURE DO_REARRANGE_ROWS
   (
       pFK_OWNER    IN   NUMBER,
      pFN_REQNUM    IN   NUMBER,
      pFL_RESERVE   IN   NUMBER
   );
   PROCEDURE DO_WRITE_SMID
   (
       pFK_ID          IN OUT   NUMBER,
      pFK_OWNER        IN       NUMBER,
      pFC_NAME         IN       VARCHAR2,
      pFC_ED_IZM       IN       VARCHAR2,
      pFN_EDVZR        IN       NUMBER,
      pFN_EDCHILD      IN       NUMBER,
      pFC_SYNONIM      IN       VARCHAR2,
      pFN_ORDER        IN       NUMBER,
      pFC_TYPE         IN       VARCHAR2,
      pFN_LOW_M        IN       VARCHAR2,
      pFN_HI_M         IN       VARCHAR2,
      pFN_LOW_W        IN       VARCHAR2,
      pFN_HI_W         IN       VARCHAR2,
      pFL_SHOWANAL     IN       NUMBER,
      pFL_SHOWPRINT    IN       NUMBER,
      pFP_PAT          IN       NUMBER,
      pFK_DEFAULT      IN       NUMBER,
      pFK_CLASS        IN       NUMBER,
      pFK_LOINC_CODE   IN       NUMBER,
      pFP_INOUT        IN       NUMBER,
      pFL_STAT         IN       NUMBER,
      pFN_ED           IN       NUMBER,
      pFC_ANSWER       IN       VARCHAR2
   );
   PROCEDURE DO_WRITE_NORM
   (
       pFK_ID     IN   NUMBER,
      pFK_SMID    IN   NUMBER,
      pFN_YEAR1   IN   NUMBER,
      pFN_YEAR2   IN   NUMBER,
      pFN_LOW_M   IN   NUMBER,
      pFN_HI_M    IN   NUMBER,
      pFN_LOW_W   IN   NUMBER,
      pFN_HI_W    IN   NUMBER,
      pFL_PAT     IN   NUMBER
   );
   PROCEDURE DO_DELETE_NORM( pFK_ID IN NUMBER );
   PROCEDURE DO_WRITE_VRACH
   (
       pFK_ID         IN OUT   NUMBER,
      pFK_SMID        IN       NUMBER,
      pFK_SOTRID      IN       NUMBER,
      pFK_KABINETID   IN       NUMBER,
      pFN_NORMPROC    IN       NUMBER
   );
   PROCEDURE DO_WRITE_OTV
   (
       pFK_ID    IN OUT   NUMBER,
      pFK_SMID   IN       NUMBER,
      pFK_SPEC   IN       NUMBER,
      pFDEL      IN       NUMBER
   );
   PROCEDURE DO_WRITE_RECEPT
   (
       pFK_ID        IN OUT   NUMBER,
      pFK_SMID       IN       NUMBER,
      pFK_RECEPTID   IN       NUMBER
   );
   PROCEDURE DO_WRITE_FKSMID( pFK_SMID IN NUMBER );
END;
/

SHOW ERRORS;


