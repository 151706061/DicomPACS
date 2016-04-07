DROP FUNCTION ASU.GET_PALATA_FREE_MESTA
/

--
-- GET_PALATA_FREE_MESTA  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TPERESEL (Table)
--   TPERESELEX (Table)
--   GET_PALATAMESTADATE (Function)
--   TKARTA (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_PALATA_FREE_MESTA" (pFK_ID IN NUMBER,pFD_DATA IN DATE)
RETURN NUMBER
 IS-- used in rDirector,rFreeRoom;
  CURSOR cTemp IS
         SELECT /*+ rule*/COUNT(TPERESEL.FK_ID)
           FROM TPERESEL,TKARTA
          WHERE FK_PALATAID=pFK_ID
            --AND pFD_DATA BETWEEN FD_DATA1 AND FD_DATA2/*+1-1/(24*60*60)*/ Comment by Nefedov 30.11.2006
            AND decode(trunc(fd_data2)-trunc(fd_data1),0,trunc(fd_data2),fd_data2)>= decode(trunc(fd_data2)-trunc(fd_data1),0, trunc(pFD_DATA),pFD_DATA)
            AND FK_PACID=TKARTA.FK_ID
            AND (FP_TEK_COC > 1 or FP_TEK_COC = -2)
          UNION
          SELECT /*+ rule*/COUNT(TPERESEL.FK_ID)
           FROM TPERESELEX TPERESEL,TKARTA
          WHERE FK_PALATAID=pFK_ID
            --AND pFD_DATA BETWEEN FD_DATA1 AND FD_DATA2/*+1-1/(24*60*60)*/ Comment by Nefedov 30.11.2006
            AND decode(trunc(fd_data2)-trunc(fd_data1),0,trunc(fd_data2),fd_data2)>= decode(trunc(fd_data2)-trunc(fd_data1),0, trunc(pFD_DATA),pFD_DATA)
            AND FK_PACID=TKARTA.FK_ID
            AND (FP_TEK_COC > 1 or FP_TEK_COC = -2);
  nTemp1 NUMBER;
  nTemp2 NUMBER;
BEGIN
  OPEN cTemp;
  FETCH cTemp INTO nTemp1;
  CLOSE cTemp;
  SELECT GET_PALATAMESTADATE(pFK_ID,pFD_DATA) INTO nTemp2 FROM DUAL;
  nTemp1:=nTemp2-nTemp1;
  RETURN nTemp1;
END;
/

SHOW ERRORS;


