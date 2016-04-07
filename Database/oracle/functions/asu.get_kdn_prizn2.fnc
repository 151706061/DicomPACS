DROP FUNCTION ASU.GET_KDN_PRIZN2
/

--
-- GET_KDN_PRIZN2  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSROKY (Table)
--   PKG_R_ALLFUNC (Package)
--   TKARTA (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_KDN_PRIZN2" (pFD_DATAC IN DATE,pFK_PRIZN IN NUMBER)
  RETURN NUMBER IS-- Modified by TimurLan
  CURSOR c IS
         SELECT /*+ rule*/COUNT(*)
           FROM (SELECT FK_PACID
                   FROM TSROKY,TKARTA
                  WHERE
--                        FD_DATA1<=pFD_DATAC
--                    AND FD_DATA3>=pFD_DATAC
                       (
                         ((FD_DATA1 BETWEEN pFD_DATAC AND pFD_DATAC+1-1/(24*60*60)) AND pFD_DATAC < FD_DATA3)
                       OR
                         (pFD_DATAC BETWEEN FD_DATA1 AND FD_DATA3)
                       OR
                         ((FD_DATA3 BETWEEN pFD_DATAC AND pFD_DATAC+1-1/(24*60*60)) AND pFD_DATAC > FD_DATA1)
                       )
                    AND FK_PRYB NOT IN (1,3,7)
                    AND TKARTA.FK_ID=FK_PACID
                    AND TKARTA.FK_PRIZN=pFK_PRIZN
                  UNION
                 SELECT FK_PACID
                   FROM TSROKY,TKARTA
                  WHERE
                       (
                         ((FD_DATA1 BETWEEN pFD_DATAC AND pFD_DATAC+1-1/(24*60*60)) AND pFD_DATAC < FD_DATA3)
                       OR
                         (pFD_DATAC BETWEEN FD_DATA1 AND FD_DATA3)
                       OR
                         ((FD_DATA3 BETWEEN pFD_DATAC AND pFD_DATAC+1-1/(24*60*60)) AND pFD_DATAC > FD_DATA1)
                       )
                    AND FK_PRYB = 1
                    AND PKG_R_ALLFUNC.COUNT_SROK(FK_PACID)=1
                    AND TKARTA.FK_ID=FK_PACID
                    AND TKARTA.FK_PRIZN=pFK_PRIZN
                  UNION
                 SELECT FK_PACID
                   FROM TSROKY,TKARTA
                  WHERE
--                        FD_DATA1=pFD_DATAC
--                    AND FD_DATA3>=pFD_DATAC
                       (
                         ((FD_DATA1 BETWEEN pFD_DATAC AND pFD_DATAC+1-1/(24*60*60)) AND pFD_DATAC < FD_DATA3)
                       OR
                         ((FD_DATA3 BETWEEN pFD_DATAC AND pFD_DATAC+1-1/(24*60*60)) AND pFD_DATAC = FD_DATA1)
                       )
                    AND FK_PRYB IN (5,6)
                    AND TKARTA.FK_ID=FK_PACID
                    AND TKARTA.FK_PRIZN=pFK_PRIZN );
   i NUMBER;
BEGIN
  OPEN c;
  FETCH c INTO i;
  CLOSE c;
  RETURN i;
END;
/

SHOW ERRORS;


