DROP PACKAGE ASU.PKG_TWORK_PLACE_HISTORY
/

--
-- PKG_TWORK_PLACE_HISTORY  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU.pkg_twork_place_history IS
    procedure DoSetCurrentWorkPlace(pFK_ID in number) ;
    procedure DoDelete(pFK_ID in number);
    function DoSave(
                  pFK_ID           in  number,
                  pFK_COMPANYID    in  NUMBER,
                  pFK_OTDELID      in  NUMBER,
                  pFK_DOLGNOSTID   in  NUMBER,
                  pFC_RABOTA       in  VARCHAR2,
                  pFK_PEPLID       in  NUMBER,
                  pFP_MAIN         in  NUMBER,
                  pFD_BEGIN        in  DATE,
                  pFD_END          in  DATE
                  ) return number;

END;
/

SHOW ERRORS;


