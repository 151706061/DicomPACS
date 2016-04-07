DROP PACKAGE ASU.PKG_LINKNAZ
/

--
-- PKG_LINKNAZ  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_LINKNAZ" 
  IS
-- Created by A.Nakorjakov 290708
-- Пакет для работы с связанными назначениями


   function InsertRoot(pSmidID Number) return Number;
   function InsertLinkNaz(pLinkNazOwner Number,pSmidID Number) return Number;
   procedure DeleteLinkNaz(pLinkNazID Number);
   procedure MoveLinkNaz(pLinkNazID Number,pIsUp Number);
   function GetLinkNazOwner(pLinkNazID Number) return Number;
   function GetNazSmidOwner(pLinkNazID Number) return Number;
   function GetLinkNazChild(pLinkNazID Number) return Number;
   function GetNazSmidChild(pLinkNazID Number) return Number;
   function GetLinkNazSmid(pLinkNazID Number) return Number;

END; -- Package spec
/

SHOW ERRORS;


