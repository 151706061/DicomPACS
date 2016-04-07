DROP FUNCTION ASU.GET_SL_END_SLUCH
/

--
-- GET_SL_END_SLUCH  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSLINFO (Table)
--   TSLPERIOD (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_SL_END_SLUCH" (pfk_slinfoid IN NUMBER)
  RETURN DATE IS
  -- Created by Spasskiy S.N. 20.02.2008
  -- Функция возвращает дату окончания случая листка нетрудоспособности
  CURSOR C IS
    SELECT MAX(FD_END)
      FROM TSLPERIOD P,
           (SELECT FK_ID
              FROM ASU.TSLINFO
            CONNECT BY PRIOR FK_ID = FK_OWNERID
             START WITH FK_ID = pfk_slinfoid) SL
     WHERE FK_SLINFOID = SL.FK_ID
       AND FL_DEL = 0;

  D DATE;

BEGIN
  OPEN C;
  FETCH C
    INTO D;
  CLOSE C;
  RETURN D;
END;
/

SHOW ERRORS;


