DROP PACKAGE ASU.PKG_PROFP
/

--
-- PKG_PROFP  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--   GET_SYNID (Function)
--
CREATE OR REPLACE PACKAGE ASU.pkg_profp
  IS
   FUNCTION isNotZakl(listid IN number) RETURN number;
   FUNCTION isALLNotZakl(listid IN number) RETURN number;
   FUNCTION GET_COUNT_vip(listid IN number) RETURN varchar2;
   FUNCTION GET_SOTR_BY_SMID(pSMID_ID number) RETURN NUMBER;
--   FUNCTION isZAKL_PROFP (pLIST_ID number) RETURN boolean;
   FUNCTION isZAKL_PROFP (pLIST_ID number) RETURN integer;
   function Get_z00 return integer;
   procedure SET_GROUP1 (pDiagId number);
   procedure SET_GODEN (pNazId number);
   FUNCTION  GET_ZAKL_PROFP RETURN integer;
  function  GET_test RETURN integer   ;
   nGET_ZAKL_PROFP number;
   nGET_Z00 number;
   nGET_DISP_GROUP1 number :=asu.get_synid('DOPDISP_GROUP_NABL_1');
   nGoden number :=asu.get_synid('PROFP_RES_OK');

   TYPE TNumZ00 IS TABLE OF NUMBER ;--  INDEX BY binary_integer;
   NumZ00 TNumZ00 :=TNumZ00();
   function Get_NumZ00(nID number) return number;
nTest number;
  END;
/

SHOW ERRORS;


