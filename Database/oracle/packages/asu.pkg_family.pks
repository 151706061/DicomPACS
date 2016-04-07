DROP PACKAGE ASU.PKG_FAMILY
/

--
-- PKG_FAMILY  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_FAMILY" 
  IS

-- MODIFICATION HISTORY
-- Person      Date    Comments
-- ---------   ------  ------------------------------------------
-- Nefedov S.M. 04.10.2006  Created package

   FUNCTION Get_MainPeoplID
     ( pPeoplID IN NUMBER) RETURN NUMBER;
 
   FUNCTION Get_ChildPeopleID
     ( pPeoplID IN NUMBER) RETURN NUMBER;

    FUNCTION IS_Child
     ( pPeoplID IN NUMBER) RETURN NUMBER;
     
    FUNCTION IS_Mother
     ( pPeoplID IN NUMBER) RETURN NUMBER;
     
    FUNCTION Get_Age
     ( pPeoplID IN NUMBER) RETURN NUMBER;
     
    FUNCTION Get_FamilyName
     ( pGroupFamily IN NUMBER) RETURN VARCHAR2;
     
    FUNCTION Get_FamilyID
     ( pPeoplID IN NUMBER) RETURN NUMBER;
     
    FUNCTION Get_LevelPeoplID
     ( pPeoplID IN NUMBER) RETURN NUMBER;
END; -- Package spec
/

SHOW ERRORS;


