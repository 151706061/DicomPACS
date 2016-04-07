DROP FUNCTION ASU.GET_PALATA_FCVID
/

--
-- GET_PALATA_FCVID  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TTIPROOM (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_PALATA_FCVID" (pFK_ID IN NUMBER) RETURN VARCHAR2
 IS-- used in rFreeRoom;
  CURSOR cTemp IS
         SELECT /*+rule*/ FC_VID
           FROM TTIPROOM
          WHERE FK_ID=pFK_ID;
  strTemp TTIPROOM.FC_VID%TYPE;
BEGIN
  OPEN cTemp;
  FETCH cTemp INTO strTemp;
  CLOSE cTemp;
  RETURN strTemp;
END;
/

SHOW ERRORS;


