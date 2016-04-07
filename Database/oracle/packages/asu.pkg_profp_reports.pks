DROP PACKAGE ASU.PKG_PROFP_REPORTS
/

--
-- PKG_PROFP_REPORTS  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_PROFP_REPORTS" 
  IS
   -- получить список назначений в виде строки, разделенной символом ;
   -- на вход отдаетс€ TPROFP_LIST.FK_ID
   FUNCTION GET_NAZ_PROFP_LIST(List_ID IN number) RETURN  VARCHAR2;

   -- получить строку, содержащую дату в виде 01 €нвар€ 2006
   -- на вход переменна€ типа Date
   function GET_SPEC_DATE(aDate in Date) return VARCHAR2;

   -- получить строку, содержащую заключение в виде вариантов
   -- "вы€влено" и "не вы€влено"
   -- на вход переменна€ типа Date
   function GET_SPEC_ZAKL(aStr in VARCHAR2) return VARCHAR2;
END; -- Package spec
/

SHOW ERRORS;


