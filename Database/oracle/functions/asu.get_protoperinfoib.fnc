DROP FUNCTION ASU.GET_PROTOPERINFOIB
/

--
-- GET_PROTOPERINFOIB  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TIB (Table)
--   GET_SMIDNAME (Function)
--   PKG_STATUTIL (Package)
--
CREATE OR REPLACE FUNCTION ASU."GET_PROTOPERINFOIB" 
  ( pNazID IN NUMBER,
    pSyn IN VARCHAR2)
  RETURN  Varchar2 IS
--
-- Created by A.Nakorjakov 14-27-2007 14:27
--
-- Purpose: Возвращает список хирургов, аначтезиологов и т.д. (по синониму pSyn) для операции (pNaz)
--
  Result Varchar2 (1000);
BEGIN
    Result := '';
    for c in (select get_smidname(fk_smid) fc_name
              from asu.tib
                where fk_smeditid = stat.pkg_statutil.get_smidid(pSyn)
                and fk_smid <> fk_smeditid
              and fk_pacid = pNazID) loop
       Result := Result || c.fc_name || ' ';
    end loop;
    RETURN Result;
END;
/

SHOW ERRORS;


