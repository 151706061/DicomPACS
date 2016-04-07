DROP PACKAGE ASU.PKGTNAZMED
/

--
-- PKGTNAZMED  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKGTNAZMED" 
IS
/*-------------------------------------------------------------------------------------------*\
|               Cursors
\*-------------------------------------------------------------------------------------------*/
/*  CURSOR cGetByID (pFK_ID IN NUMBER)
  IS
    SELECT FK_PACID, FK_VRACHID, FK_RECEPTID, FN_UCHKOL, fd_date, FC_COMMENT, FP_STATUS, fl_sam, fc_sam, fn_day,fn_perday
      FROM tnazmed
     WHERE fk_id = pFK_ID;
  CURSOR cChekChilds (pFK_ID IN NUMBER)
  IS
    SELECT ROWID
      FROM TRESMED
     WHERE fk_nazmedid = pfk_id;
/*-------------------------------------------------------------------------------------------*\
|               Procedures
\*-------------------------------------------------------------------------------------------*/
  FUNCTION isExistsChilds (pFK_ID IN NUMBER)
    RETURN NUMBER;
  PROCEDURE DoDelCascade (pfk_id IN NUMBER);
  PROCEDURE DoSet (
    pFK_PACID      IN   NUMBER,
    pFK_VRACHID    IN   NUMBER,
    pFK_RECEPTID   IN   NUMBER,
    pFN_UCHKOL     IN   NUMBER,
    pFD_DATE       IN   DATE,
    pFC_COMMENT    IN   VARCHAR2,
    pFP_STATUS     IN   NUMBER,
    pfl_sam        IN   NUMBER,
    pfc_sam        IN   VARCHAR2,
    pfn_day        IN   NUMBER,
    pfn_perday     IN   NUMBER,
    pfk_id         IN   NUMBER DEFAULT -1);
  PROCEDURE DoDel (pfk_id IN NUMBER);
  PROCEDURE GetByID (
    pfk_id         IN       NUMBER,
    pFK_PACID      OUT      NUMBER,
    pFK_VRACHID    OUT      NUMBER,
    pFK_RECEPTID   OUT      NUMBER,
    pFN_UCHKOL     OUT      NUMBER,
    pFD_DATE       OUT      DATE,
    pFC_COMMENT    OUT      VARCHAR2,
    pFP_STATUS     OUT      NUMBER,
    pfl_sam        OUT      NUMBER,
    pfc_sam        OUT      VARCHAR2,
    pfn_day        OUT   NUMBER,
    pfn_perday     OUT   NUMBER
    );
  FUNCTION DecodeStatus (pFP_STATUS IN NUMBER) RETURN VARCHAR2;
--  PRAGMA RESTRICT_REFERENCES (DecodeStatus, RNDS, WNDS, RNPS, WNPS); ?????????--by TimurLan
  PROCEDURE DoCancelNaz (pFK_ID IN NUMBER, pFK_OTMENASOTRID IN NUMBER, pFC_WHYOTMENA VARCHAR2);
  FUNCTION GetPACIDByID (pFK_ID IN NUMBER)
    RETURN NUMBER; 
END PKGtnazmed;
/

SHOW ERRORS;


