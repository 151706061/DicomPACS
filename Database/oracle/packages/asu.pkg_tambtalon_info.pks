DROP PACKAGE ASU.PKG_TAMBTALON_INFO
/

--
-- PKG_TAMBTALON_INFO  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU.PKG_TAMBTALON_INFO
  IS

 procedure SetFL_MODERNIZACIA(pFK_TALONID in number, pFL_MODERNIZACIA in number);
 function GetFL_MODERNIZACIA(pFK_TALONID in number) return number;

 procedure SetFC_PACCODE(pFK_TALONID in number, pFC_PACCODE in varchar2);
 function GetFC_PACCODE(pFK_TALONID in number) return varchar2;
 procedure SetFK_VISITVID(pFK_TALONID in number, pFK_VISITVID in number);
 function GetFK_VISITVID(pFK_TALONID in number) return number;
 procedure SetFC_KOM_CODE(pFK_TALONID in number, pFC_KOM_CODE in varchar2);
 function GetFC_KOM_CODE(pFK_TALONID in number) return varchar2;

 function GetFK_CITIZEN_KAT (pFK_TALONID in number) return number;
 procedure SetFK_CITIZEN_KAT(pFK_TALONID in number, pFK_CITIZEN_KAT in number);

 function GetFK_SECOND_DISP (pFK_TALONID in number) return number;
 procedure SetFK_SECOND_DISP(pFK_TALONID in number, pFK_SECOND_DISP in number);







END PKG_TAMBTALON_INFO; -- Package Specification PKG_DIAGS
/

SHOW ERRORS;


