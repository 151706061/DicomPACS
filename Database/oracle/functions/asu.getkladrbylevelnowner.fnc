DROP FUNCTION ASU.GETKLADRBYLEVELNOWNER
/

--
-- GETKLADRBYLEVELNOWNER  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TKLADR (Table)
--
CREATE OR REPLACE FUNCTION ASU.GetKladrByLevelNOwner (pChildKladrId NUMBER, pLevel NUMBER)
-- Efimov V.A. 20110401 Функция возвращает ID родителя вершины pChildKladrId, соответствующего уровню pLevel
RETURN VARCHAR2 IS
  vOwnerKladrId NUMBER;
BEGIN
  SELECT Max(Fk_id) into vOwnerKladrId
          FROM (SELECT TK.Fk_id, TK.FN_LEVEL
                  FROM ASU.TKLADR TK
                 WHERE TK.FL_DEL = 0
                CONNECT BY PRIOR TK.FK_OWNER = TK.FK_ID
                 START WITH TK.FK_ID = pChildKladrId)
         WHERE FN_LEVEL = pLevel;

  return vOwnerKladrId;
END;
/

SHOW ERRORS;


