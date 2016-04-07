DROP PACKAGE BODY ASU.PKG_KLADR
/

--
-- PKG_KLADR  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_KLADR" 
IS
  function get_kladr_region(pkladrid asu.tkladr.fk_id%type) return varchar2
  is
    pRegion varchar2(4000);
    pRaion  varchar2(4000);
    pCity  varchar2(4000);
    pStreet  varchar2(4000);
  begin
    ASU.GET_KLADR_ADDR_PARTS_BY_ID (pkladrid,pRegion,pRaion,pCity,pStreet);
    return pRegion;
  end;

  function get_kladr_raion(pkladrid asu.tkladr.fk_id%type) return varchar2
  is
    pRegion varchar2(4000);
    pRaion  varchar2(4000);
    pCity  varchar2(4000);
    pStreet  varchar2(4000);
  begin
    ASU.GET_KLADR_ADDR_PARTS_BY_ID (pkladrid,pRegion,pRaion,pCity,pStreet);
    return pRaion;
  end;

  function get_kladr_city(pkladrid asu.tkladr.fk_id%type) return varchar2
  is
    pRegion varchar2(4000);
    pRaion  varchar2(4000);
    pCity  varchar2(4000);
    pStreet  varchar2(4000);
  begin
    ASU.GET_KLADR_ADDR_PARTS_BY_ID (pkladrid,pRegion,pRaion,pCity,pStreet);
    return pCity;
  end;

  function get_kladr_street(pkladrid asu.tkladr.fk_id%type) return varchar2
  is
    pRegion varchar2(4000);
    pRaion  varchar2(4000);
    pCity  varchar2(4000);
    pStreet  varchar2(4000);
  begin
    ASU.GET_KLADR_ADDR_PARTS_BY_ID (pkladrid,pRegion,pRaion,pCity,pStreet);
    return pStreet;
  end;

BEGIN
  null;
END;
/

SHOW ERRORS;


