DROP PACKAGE ASU.PKG_TAMBULANCE_INFO
/

--
-- PKG_TAMBULANCE_INFO  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU.PKG_TAMBULANCE_INFO
  IS

 ---------------------------------------------------------------------------------------------------------
 procedure SetFK_CARD_STATUSID(pFK_AMBID in number, pFK_CARD_STATUSID in number);
 function GetFK_CARD_STATUSID(pFK_AMBID in number) return number;
 ---------------------------------------------------------------------------------------------------------
 procedure SetFK_PRICREP(pFK_AMBID in number, pFK_PRICREP_UCH in number);
 function GetFK_PRICREP(pFK_AMBID in number) return number;
 ----------------------------------------------------------------------------------------------------------
 procedure SetFK_LAST_APPSOTR(pFK_AMBID in number, pFK_LAST_APPSOTR in number);
 function GetFK_LAST_APPSOTR(pFK_AMBID in number) return number;
 ----------------------------------------------------------------------------------------------------------
 ----------------------------------------------------------------------------------------------------------
 procedure SetFD_LAST_APPSOTR(pFK_AMBID in number, pFD_LAST_APPSOTR in date);
 function GetFD_LAST_APPSOTR(pFK_AMBID in number) return date;
 ----------------------------------------------------------------------------------------------------------


END;
/

SHOW ERRORS;


