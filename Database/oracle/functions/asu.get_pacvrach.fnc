DROP FUNCTION ASU.GET_PACVRACH
/

--
-- GET_PACVRACH  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TVRACH (Table)
--   TAMBVRACH (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_PACVRACH" (pFK_ID IN NUMBER)
  RETURN NUMBER
IS
  strTemp   NUMBER;
  CURSOR cTemp
  IS
    SELECT/*+ rule*/
       FK_VRACHID
      FROM TVRACH
     WHERE FK_PACID = pFK_ID
       AND FL_VID = 'M'
       UNION
    SELECT/*+ rule*/
       FK_VRACHID
      FROM TambVRACH
     WHERE FK_PACID = pFK_ID
       AND FL_VID = 'M';
BEGIN
  OPEN cTemp;
  FETCH cTemp INTO strTemp;
  CLOSE cTemp;
  RETURN strTemp;
END;
/

SHOW ERRORS;


DROP SYNONYM STAT.GET_PACVRACH
/

--
-- GET_PACVRACH  (Synonym) 
--
--  Dependencies: 
--   GET_PACVRACH (Function)
--
CREATE SYNONYM STAT.GET_PACVRACH FOR ASU.GET_PACVRACH
/


