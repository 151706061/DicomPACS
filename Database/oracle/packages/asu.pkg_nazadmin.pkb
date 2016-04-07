DROP PACKAGE BODY ASU.PKG_NAZADMIN
/

--
-- PKG_NAZADMIN  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_NAZADMIN" IS
   PROCEDURE DO_REARRANGE_ROWS
   (
       pFK_OWNER    IN   NUMBER,
      pFN_REQNUM    IN   NUMBER,
      pFL_RESERVE   IN   NUMBER
   )
   IS
      CURSOR C
      IS
         SELECT FK_ID
           FROM TSMID
          WHERE FK_OWNER = pFK_OWNER
          ORDER BY FN_ORDER;
--    PRAGMA AUTONOMOUS_TRANSACTION;
      I   NUMBER;
   BEGIN
      IF pFL_RESERVE = 1 THEN
         UPDATE TSMID
            SET FN_ORDER = FN_ORDER + 1
          WHERE FN_ORDER >= pFN_REQNUM
            AND FK_OWNER = pFK_OWNER;
      ELSE
         FOR P IN C LOOP
            I :=    C%ROWCOUNT;
            UPDATE TSMID
               SET FN_ORDER = I
             WHERE FK_ID = P.FK_ID;
         END LOOP;
      END IF;
--      COMMIT;
   END;
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
   )
   IS
      CURSOR C( pFK_ID NUMBER )
      IS
         SELECT COUNT( FK_ID )
           FROM TSMID
          WHERE FK_ID = pFK_ID;
      N   NUMBER;
   BEGIN
      DO_REARRANGE_ROWS( pFK_OWNER, pFN_ORDER, 1 );
      OPEN C( pFK_ID );
      FETCH C INTO N;
      CLOSE C;
      IF N = 0 THEN
         INSERT INTO TSMID
                     (
                        FK_OWNER,
                        FC_NAME,
                        FC_ED_IZM,
--                        FN_EDVZR,
                        FN_EDCHILD,
                        FC_SYNONIM,
                        FN_ORDER,
                        FC_TYPE,
                        FN_LOW_M,
                        FN_HI_M,
                        FN_LOW_W,
                        FN_HI_W,
                        FL_SHOWANAL,
                        FL_SHOWPRINT,
                        FP_PAT,
                        FK_DEFAULT,
                        FK_CLASS,
                        FK_LOINC_CODE,
                        FP_INOUT,
                        FL_STAT,
                        FN_ED,
                        FC_ANSWER
                     )
              VALUES
              (
                  pFK_OWNER,
                 pFC_NAME,
                 pFC_ED_IZM,
--                 pFN_EDVZR,
                 pFN_EDCHILD,
                 pFC_SYNONIM,
                 pFN_ORDER,
                 pFC_TYPE,
                 pFN_LOW_M,
                 pFN_HI_M,
                 pFN_LOW_W,
                 pFN_HI_W,
                 pFL_SHOWANAL,
                 pFL_SHOWPRINT,
                 pFP_PAT,
                 pFK_DEFAULT,
                 pFK_CLASS,
                 pFK_LOINC_CODE,
                 pFP_INOUT,
                 pFL_STAT,
                 pFN_ED,
                 pFC_ANSWER
              )
           RETURNING FK_ID
            INTO pFK_ID;
      ELSE
         UPDATE TSMID
            SET FK_OWNER = pFK_OWNER,
                FC_NAME = pFC_NAME,
                FC_ED_IZM = pFC_ED_IZM,
--                FN_EDVZR = pFN_EDVZR,
                FN_EDCHILD = pFN_EDCHILD,
                FC_SYNONIM = pFC_SYNONIM,
                FN_ORDER = pFN_ORDER,
                FC_TYPE = pFC_TYPE,
                FN_LOW_M = pFN_LOW_M,
                FN_HI_M = pFN_HI_M,
                FN_LOW_W = pFN_LOW_W,
                FN_HI_W = pFN_HI_W,
                FL_SHOWANAL = pFL_SHOWANAL,
                FL_SHOWPRINT = pFL_SHOWPRINT,
                FP_PAT = pFP_PAT,
                FK_DEFAULT = pFK_DEFAULT,
                FK_CLASS = pFK_CLASS,
                FK_LOINC_CODE = pFK_LOINC_CODE,
                FP_INOUT = pFP_INOUT,
                FL_STAT = pFL_STAT,
                FN_ED = pFN_ED,
                FC_ANSWER = pFC_ANSWER
          WHERE FK_ID = pFK_ID;
      END IF;
      DO_REARRANGE_ROWS( pFK_OWNER, pFN_ORDER, 0 );
   END;
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
   )
   IS
   BEGIN
      IF pFK_ID = -1 THEN
         INSERT INTO TSMIDNORMS
                     (
                        FK_SMID,
                        FN_YEAR1,
                        FN_YEAR2,
                        FN_LOW_M,
                        FN_HI_M,
                        FN_LOW_W,
                        FN_HI_W,
                        FL_PAT
                     )
              VALUES
              (
                  pFK_SMID,
                 pFN_YEAR1,
                 pFN_YEAR2,
                 pFN_LOW_M,
                 pFN_HI_M,
                 pFN_LOW_W,
                 pFN_HI_W,
                 pFL_PAT
              );
      ELSE
         UPDATE TSMIDNORMS
            SET FN_YEAR1 = pFN_YEAR1,
                FN_YEAR2 = pFN_YEAR2,
                FN_LOW_M = pFN_LOW_M,
                FN_HI_M = pFN_HI_M,
                FN_LOW_W = pFN_LOW_W,
                FN_HI_W = pFN_HI_W,
                FL_PAT = pFL_PAT
          WHERE FK_ID = pFK_ID;
      END IF;
   END;
   PROCEDURE DO_DELETE_NORM( pFK_ID IN NUMBER )
   IS
   BEGIN
      DELETE
        FROM TSMIDNORMS
       WHERE FK_ID = pFK_ID;
   END;
   PROCEDURE DO_WRITE_VRACH
   (
       pFK_ID         IN OUT   NUMBER,
      pFK_SMID        IN       NUMBER,
      pFK_SOTRID      IN       NUMBER,
      pFK_KABINETID   IN       NUMBER,
      pFN_NORMPROC    IN       NUMBER
   )
   IS
   BEGIN
      IF ( pFK_ID = -1 ) THEN
         INSERT INTO TNAZVRACH
                     ( FK_SMID, FK_SOTRID, FK_KABINETID, FN_NORMPROC )
              VALUES( pFK_SMID, pFK_SOTRID, pFK_KABINETID, pFN_NORMPROC )
           RETURNING FK_ID
            INTO pFK_ID;
      ELSE
         UPDATE TNAZVRACH
            SET FK_SMID = pFK_SMID,
                FK_SOTRID = pFK_SOTRID,
                FK_KABINETID = pFK_KABINETID,
                FN_NORMPROC = pFN_NORMPROC
          WHERE FK_ID = pFK_ID;
      END IF;
   END;
   PROCEDURE DO_WRITE_OTV
   (
       pFK_ID    IN OUT   NUMBER,
      pFK_SMID   IN       NUMBER,
      pFK_SPEC   IN       NUMBER,
      pFDEL      IN       NUMBER
   )
   IS
   BEGIN
      IF (     ( pFK_ID = -1 )
          AND ( pFDEL = 1 )) THEN
         INSERT INTO TNAZRASPRED
                     ( FK_SMID, FK_SPEC )
              VALUES( pFK_SMID, pFK_SPEC )
           RETURNING FK_ID
            INTO pFK_ID;
      ELSE
         BEGIN
            IF pFDEL = 0 THEN
               DELETE
                 FROM TNAZRASPRED
                WHERE FK_ID = pFK_ID;
            ELSE
               UPDATE TNAZRASPRED
                  SET FK_SMID = pFK_SMID,
                      FK_SPEC = pFK_SPEC
                WHERE FK_ID = pFK_ID;
            END IF;
         END;
      END IF;
   END;
   PROCEDURE DO_WRITE_RECEPT
   (
       pFK_ID        IN OUT   NUMBER,
      pFK_SMID       IN       NUMBER,
      pFK_RECEPTID   IN       NUMBER
   )
   IS
   BEGIN
      IF pFK_ID = -1 THEN
         INSERT INTO TRECEPTNAZ
                     ( FK_SMID, FK_RECEPTID )
              VALUES( pFK_SMID, pFK_RECEPTID )
           RETURNING FK_ID
            INTO pFK_ID;
      ELSE
         UPDATE TRECEPTNAZ
            SET FK_SMID = pFK_SMID,
                FK_RECEPTID = pFK_RECEPTID
          WHERE FK_ID = pFK_ID;
      END IF;
      IF pFK_RECEPTID = 0 THEN
         DELETE
           FROM TRECEPTNAZ
          WHERE FK_ID = pFK_ID;
      END IF;
   END;
   PROCEDURE DO_WRITE_FKSMID( pFK_SMID IN NUMBER )
   IS
   BEGIN
      UPDATE TLECHPARAM
         SET FK_SMID = pFK_SMID
       WHERE FK_SMID = -1;
      UPDATE TSMIDNORMS
         SET FK_SMID = pFK_SMID
       WHERE FK_SMID = -1;
   END;
END;
/

SHOW ERRORS;


