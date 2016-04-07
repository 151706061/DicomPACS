DROP FUNCTION ASU.GET_NATIONALITY
/

--
-- GET_NATIONALITY  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TIB (Table)
--   TAMBULANCE (Table)
--   TSMID (Table)
--   TKARTA (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_NATIONALITY" (pfk_pacid IN NUMBER) RETURN VARCHAR2 IS
-- Created 20060920 by Serg
-- Функция возвращает национальность пациента
CURSOR c
IS
  SELECT MAX(SM.FC_NAME)
         FROM TIB,
              (SELECT FK_PEPLID FROM ASU.TKARTA WHERE TKARTA.FK_ID = pfk_pacid
              UNION ALL
              SELECT FK_PEPLID FROM ASU.TAMBULANCE WHERE TAMBULANCE.FK_ID = pfk_pacid) PAC,
              (SELECT FK_ID,
                      FC_NAME
                      FROM TSMID
                      CONNECT BY PRIOR FK_ID = FK_OWNER
                      START WITH FC_SYNONIM = 'LD_NAROD') SM
              WHERE SM.FK_ID = TIB.FK_SMID
              AND TIB.FK_PACID = PAC.FK_PEPLID;

   D VARCHAR2(32767);

BEGIN
 OPEN C;
  FETCH C INTO D;
 CLOSE C;
 RETURN D;
END;
/

SHOW ERRORS;


