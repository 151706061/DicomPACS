DROP FUNCTION ASU.STRING_AGG
/

--
-- STRING_AGG  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   T_STRING_AGG (Type)
--
CREATE OR REPLACE FUNCTION ASU.string_agg (p_input VARCHAR2)
RETURN VARCHAR2

/*WM_CONCAT в 10-й и 11-й версии возвращает разные типы данных. ЧТобы не перекомпиливать версии под разные версии оракла сделали стороннюю функцию
http://www.oracle-base.com/articles/misc/StringAggregationTechniques.php*/

PARALLEL_ENABLE AGGREGATE USING t_string_agg;
/

SHOW ERRORS;


