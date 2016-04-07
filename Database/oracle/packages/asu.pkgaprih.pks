DROP PACKAGE ASU.PKGAPRIH
/

--
-- PKGAPRIH  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TAPRIH (Table)
--
CREATE OR REPLACE PACKAGE ASU."PKGAPRIH" 
IS
-- Person      Date    Comments
-- ---------   ------  ------------------------------------------
-- Sam          18-01-2001
  CURSOR cGetByID (pFK_ID IN NUMBER)
  IS
    SELECT FD_DATE, FC_DOC, FK_APOSTAVSHIKID, FK_AKOMUID, FC_COMMENT, FK_APRIHVIDID
      FROM ASU.TAPRIH
     WHERE FK_ID = pFK_ID;

  PROCEDURE GetByID (
    pFD_DATE            OUT      DATE,
    pFC_DOC             OUT      VARCHAR2,
    pFK_APOSTAVSHIKID   OUT      NUMBER,
    pFK_AKOMUID         OUT      NUMBER,
    pFC_COMMENT         OUT      VARCHAR2,
    pFK_APRIHVIDID      OUT      NUMBER,
    pFK_ID              IN       NUMBER
  );

  FUNCTION DoSet (
    pFD_DATE            IN   DATE,
    pFC_DOC             IN   VARCHAR2,
    pFK_APOSTAVSHIKID   IN   NUMBER,
    pFK_AKOMUID         IN   NUMBER,
    pFC_COMMENT         IN   VARCHAR2,
    pFK_APRIHVIDID      IN   NUMBER,
    pFK_ID              IN   NUMBER DEFAULT -1
    )
    RETURN NUMBER;

  PROCEDURE DoDel (pFK_ID IN NUMBER);
END;   -- Package Specification PKGAPRIH
/

SHOW ERRORS;


