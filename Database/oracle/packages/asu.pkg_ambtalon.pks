DROP PACKAGE ASU.PKG_AMBTALON
/

--
-- PKG_AMBTALON  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_AMBTALON"
IS
--
-- To modify this template, edit file PKGSPEC.TXT in TEMPLATE
-- directory of SQL Navigator
--
-- Purpose: Briefly explain the functionality of the package
--
-- MODIFICATION HISTORY
-- Person      Date    Comments
-- ---------   ------  ------------------------------------------
   -- Enter package declarations as shown below
   PROCEDURE add_talon (
      pAMBID        IN   NUMBER,
      pdate_begin   IN   DATE,
      potdelid      IN   NUMBER,
      psotrid       IN   NUMBER,
      pMedsesid       IN   NUMBER,
      preason       IN   NUMBER,
      poplat        IN   NUMBER,
      pserplace     IN   NUMBER,
      pfk_id        IN OUT NUMBER
   );
PROCEDURE LinkTalonNaz (
      pAMBID        IN   NUMBER,
      pTalonID       IN   NUMBER,
      pNazId       IN   NUMBER
   );

   PROCEDURE DELETE_SUB_DIAG(pDIAGID IN NUMBER, pTALONID IN NUMBER);
   FUNCTION GET_SUB_LIST(pTALONID IN NUMBER) RETURN VARCHAR2;
   FUNCTION GET_SUB_LIST_REASON(pTALONID IN NUMBER) RETURN VARCHAR2;
   function  Get_last_diag_talon_FL_FIRST(pFK_TALONID in number, pFL_MAIN in number, pFP_TYPE in number) return number;
   function  Get_last_diag_talon_MKB(pFK_TALONID in number, pFL_MAIN in number, pFP_TYPE in number) return varchar2;
   function  Get_last_diag_talon(pFK_TALONID in number, pFL_MAIN in number, pFP_TYPE in number) return number;
END;                                                           -- Package spec
/

SHOW ERRORS;


