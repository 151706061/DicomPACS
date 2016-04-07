DROP FUNCTION ASU.GET_COUNT_STANDART
/

--
-- GET_COUNT_STANDART  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSTANDART (Table)
--   TSTANDART_ICD10 (Table)
--   TICD10 (Table)
--   GET_STANDART_GROUPZH (Function)
--
CREATE OR REPLACE FUNCTION ASU."GET_COUNT_STANDART" (pfc_mkb IN VARCHAR2)
   RETURN NUMBER
-- возвращает количество стандартов, которые соответсуют переданному коду МКБ10
-- передовать должне только код МКБ-10 третьего уровня (с точкой)
-- Author: неизвестен
-- Zhukov: 2006.06.21 изменил, считает тольок стандарты в хантах (fk_groupid =1)
-- Zhukov: 2008.08.13 теперь также ищет стандарты и на верхнем уровне (например A00)
-- Zhukov: 2008.11.07 исправил на функцию get_standart_groupzh
IS
   CURSOR ckolvo
   IS
      SELECT COUNT (*) AS kolvo
        FROM tstandart_icd10,
             tstandart,
             (SELECT     ticd10.fk_id
                    FROM ticd10
              CONNECT BY PRIOR ticd10.fk_id = ticd10.fk_parent
              START WITH ticd10.fc_kod1 = pfc_mkb
              UNION
              SELECT     ticd10.fk_id
                    FROM ticd10
                   WHERE LEVEL <= 2
              CONNECT BY ticd10.fk_id = PRIOR ticd10.fk_parent
              START WITH ticd10.fc_kod1 = pfc_mkb and length(pfc_mkb)=5) icd
       WHERE tstandart_icd10.fk_icd10 = icd.fk_id
         AND tstandart_icd10.fk_standart = tstandart.fk_id
         AND tstandart.fk_groupid = get_standart_groupzh;

   n   NUMBER;
BEGIN
   OPEN ckolvo;

   FETCH ckolvo
    INTO n;

   CLOSE ckolvo;

   RETURN n;
END;
/

SHOW ERRORS;


