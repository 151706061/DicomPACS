DROP PACKAGE ASU.PLAN_TO_VYP
/

--
-- PLAN_TO_VYP  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TSROKY (Table)
--   GET_PACFCPALATA (Function)
--   GET_PACFIO (Function)
--   TKARTA (Table)
--
CREATE OR REPLACE PACKAGE ASU."PLAN_TO_VYP" 
  IS
   CURSOR cWhoPlan(pFD_DATA1 DATE) IS
       select/*+ rule*/
         GET_PACFIO(TKARTA.FK_ID) as FC_FIO,
         GET_PACFCPALATA(TKARTA.FK_ID) FC_PALATA
       from
         TKARTA, TSROKY
       where
         TKARTA.FP_TEK_COC=2 AND
         TSROKY.FD_DATA2=pFD_DATA1 and
         TSROKY.FK_ID=(select max(FK_ID)
                       from TSROKY
                         where TSROKY.FK_PACID=TKARTA.FK_ID AND FK_PRYB IN (2,4,5,6) )
       order by FC_FIO ;


   PROCEDURE DO_CALC_REPORT_PERIOD(pFD_DATA1 IN DATE,pFD_DATA2 IN DATE,pFK_SOTRID IN NUMBER,pFC_SAN IN VARCHAR2,pFC_TABLE OUT VARCHAR2);
END; -- Package spec
/

SHOW ERRORS;


