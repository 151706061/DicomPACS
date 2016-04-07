DROP PACKAGE ASU.PKG_LAB_QC
/

--
-- PKG_LAB_QC  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU.pkg_lab_qc
IS
-- Пакет предназначен для проведения внутрилабораторного контроля качества
-- %Author rca

-- Определение количества измерений на данный момент времени.
-- %param p_series_id      tqc_series.fk_id
FUNCTION COUNT_N(p_series_id IN NUMBER) RETURN NUMBER;

-- Определение среднего арифметического отклонения результатов измерений.
-- %param p_series_id      tqc_series.fk_id
FUNCTION COUNT_Xn(p_series_id IN NUMBER) RETURN NUMBER;

-- Определение среднего квадратичного отклонения результатов измерений.
-- %param p_series_id      tqc_series.fk_id
FUNCTION COUNT_Sn(p_series_id IN NUMBER) RETURN NUMBER;

-- Определение коэффициента вариации результатов измерений.
-- %param p_series_id      tqc_series.fk_id
FUNCTION COUNT_CVn(p_series_id IN NUMBER) RETURN NUMBER;

-- Определение относительного смещения результатов измерений.
-- %param p_series_id      tqc_series.fk_id
-- %param p_method_id      tqc_method.fk_id
-- %param p_level_id       tqc_mlevel.fk_id
FUNCTION COUNT_Bn(p_series_id IN NUMBER,
    p_method_id IN NUMBER, p_level_id IN NUMBER) RETURN NUMBER;

-- Определение правильность методики.
-- %param p_series_id      tqc_series.fk_id
-- %param p_count_cv     Коэффициент вариации результатов измерений
-- %param p_count_b      Относительное смещение результатов измерений.
FUNCTION VALID_METHOD(p_series_id IN NUMBER,
    p_count_cv IN NUMBER, p_count_b IN NUMBER) RETURN NUMBER;

END; -- PKG_LAB_QC
/

SHOW ERRORS;


