DROP PACKAGE ASU.PKGNAZTMEDIC
/

--
-- PKGNAZTMEDIC  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TMEDIC (Table)
--
CREATE OR REPLACE PACKAGE ASU."PKGNAZTMEDIC" IS
/*-------------------------------------------------------------------------------------------*\
|               Cursors
\*-------------------------------------------------------------------------------------------*/
   CURSOR CGETBYID( PPFK_ID IN NUMBER )
   IS
      SELECT FC_NAME, NVL( UCHGRID, -1 ), NVL( EIID, -1 ), NVL( FARMGRID, -1 )
        FROM med.TMEDIC
       WHERE MEDICID = PPFK_ID;
/*-------------------------------------------------------------------------------------------*\
|               Procedures
\*-------------------------------------------------------------------------------------------*/
   PROCEDURE GETBYID
   (
       pFK_MEDICID   IN       NUMBER DEFAULT -1,
      pFC_NAME       OUT      VARCHAR2,
      pFK_UCHGRID    OUT      NUMBER,
      pFK_EIID       OUT      NUMBER,
      pFK_FARMGRID   OUT      NUMBER
   );
/*-------------------------------------------------------------------------------------------*\
|               Functions
\*-------------------------------------------------------------------------------------------*/
   FUNCTION GETNAMEBYID( pFK_ID IN NUMBER )
      RETURN VARCHAR2;
   FUNCTION GETEIID( pFK_ID IN NUMBER )
      RETURN NUMBER;
END PKGNAZTMEDIC;
/

SHOW ERRORS;


