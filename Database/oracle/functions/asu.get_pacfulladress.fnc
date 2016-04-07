DROP FUNCTION ASU.GET_PACFULLADRESS
/

--
-- GET_PACFULLADRESS  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TADRESS (Table)
--   GET_COUNTRY (Function)
--   GET_INTOWN (Function)
--   GET_RAION (Function)
--   GET_REGION (Function)
--   GET_STREET (Function)
--   GET_TOWN (Function)
--   TKARTA (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_PACFULLADRESS" (pFK_PACID IN NUMBER) -- Created by TimurLan
RETURN VARCHAR2
 IS
  CURSOR cTemp
   IS
    SELECT /*+ rule*/GET_COUNTRY(FK_COUNTRYID)||' '||GET_REGION(FK_REGIONID)||' '||GET_RAION(FK_RAIONID)||' '||GET_TOWN(FK_TOWNID)||' '||GET_INTOWN(FK_INTOWNID)||' '||
                     GET_STREET(FK_STREETID)||' '||' '||'д.'||FC_HOUSE||' '||' '||'корп.'||FC_KORPUS||' '||' '||'кв.'||FC_KVARTIRA
      FROM TADRESS
     WHERE FK_ID=(select MIN(TADRESS.FK_ID)
                    from TADRESS
                   where fk_pacid = (select fk_peplid
                                       from tkarta
                                      where fk_id = pFK_PACID));
  strTemp VARCHAR2(3000);
BEGIN
  OPEN cTemp;
  FETCH cTemp INTO strTemp;
  CLOSE cTemp;
  RETURN strTemp;
END;
/

SHOW ERRORS;


