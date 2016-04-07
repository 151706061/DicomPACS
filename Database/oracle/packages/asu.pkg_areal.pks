DROP PACKAGE ASU.PKG_AREAL
/

--
-- PKG_AREAL  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TADRESS (Table)
--   TDISTRICT (Table)
--   TDISTRICT_NAME (Table)
--
CREATE OR REPLACE PACKAGE ASU.pkg_areal as
  type t_UID is record ( USER_ID number, DATE_IN DATE);
  type tbl_UID is table of t_UID;
  TYPE DIAPAZON1 IS REF CURSOR;
  type Diapazon is record ( FK_ID number);
  type tDiapazon is table of Diapazon;

  type Diapazon2 is record ( FK_ID varchar2(6));
  type tDiapazon2 is table of Diapazon2;

nAreal_PED NUMBER;
nAreal_GYN NUMBER;
nAreal_TER NUMBER;
nAreal_sto NUMBER;
nMySity NUMBER;
nCurrAdrType  NUMBER;
  -- список пациентов, приписанных к участку p_arealid == TDISTRICT_NAME.FK_ID на дату p_olddate
  function  AREALIST_ON_DATE(p_arealid IN NUMBER, p_olddate IN DATE) return tbl_UID parallel_enable pipelined;
  FUNCTION  GET_DIAPAZON (s varchar2)    RETURN   tdiapazon  parallel_enable  pipelined;
  FUNCTION  GET_DIAPAZON2 (s varchar2)   RETURN   tdiapazon2  parallel_enable  pipelined;
  FUNCTION  CUT_ROOM (pHouse VARCHAR2,pStr varchar2) return VARCHAR2;
  FUNCTION  GET_TYPEID(pStr varchar2) RETURN NUMBER;
  PROCEDURE SET_CONST_SMID(pName VARCHAR2, pWhere varchar2);
  FUNCTION  GET_AREALID_BY_ADDR (pAdrID IN TADRESS.FK_ID%TYPE,  pType in number default -1 ) RETURN TDISTRICT.FK_ID%TYPE ;
  FUNCTION  GET_DISTRICTNAME_BY_ID (pDistrictID IN TDISTRICT.FK_ID%TYPE,pWrite NUMBER default -1) RETURN TDISTRICT_NAME.FC_NAME%TYPE ;
  FUNCTION  GET_AREAL_TYPE(pId NUMBER  := - 137) RETURN varchar2;
  function  isMySity (pId NUMBER  := - 137) RETURN BOOLEAN;
--  FUNCTION  GET_REGION_BY_ADR (pAdrID IN TADRESS.FK_ID%TYPE) RETURN varchar2;-- ASU.TAREANAME.FC_NAME%TYPE ;
 FUNCTION  GET_REGION_BY_ADR (pAdrID IN TADRESS.FK_ID%TYPE default null ,pPeplID IN TADRESS.fk_pacid%TYPE default null) RETURN varchar2 ; --ASU.TAREANAME.FC_NAME%TYPE

END;
/

SHOW ERRORS;


