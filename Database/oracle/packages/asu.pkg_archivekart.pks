DROP PACKAGE ASU.PKG_ARCHIVEKART
/

--
-- PKG_ARCHIVEKART  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_ARCHIVEKART" 
is
   procedure Do_Archive_Kart(pPacId Number,pSotrId Number,pArchiveDate Date,pReason Number,pComment Varchar2);
   procedure Do_Annul_Archive_Kart(pPacId Number,pSotrId Number);
   function IsKartInArchiv(pPacID Number) return Number;
end;
/

SHOW ERRORS;


