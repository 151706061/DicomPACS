DROP FUNCTION ASU.GET_RES_DISP
/

--
-- GET_RES_DISP  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TIB (Table)
--   TSMID (Table)
--   TKARTA (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_RES_DISP" (pfk_pacid IN NUMBER) RETURN VARCHAR2 IS
-- Created 20060920 by Serg
-- Функция возвращает группу диспансеризации
CURSOR c
IS
  SELECT MAX(SM.FC_NAME)
         FROM TIB,
              TKARTA,
              (SELECT FK_ID,
                      FC_NAME
                      FROM TSMID
                      CONNECT BY PRIOR FK_ID = FK_OWNER
                      START WITH FC_SYNONIM = 'LD_GET_SMID_DISP') SM
              WHERE SM.FK_ID = TIB.FK_SMID
              AND TIB.FK_PACID = TKARTA.FK_ID
              AND TKARTA.FK_ID = pfk_pacid;

   D VARCHAR2(32767);

BEGIN
 OPEN C;
  FETCH C INTO D;
 CLOSE C;
 RETURN D;
END;
/

SHOW ERRORS;


