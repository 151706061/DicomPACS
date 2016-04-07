DROP PACKAGE BODY ASU.PKG_LAB_QC
/

--
-- PKG_LAB_QC  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU.pkg_lab_qc
IS
-- Пакет предназначен для проведения внутрилабораторного контроля качества
-- %Author rca


------------------------------------------------------------------------------
-- Определение количества измерений на данный момент времени.
------------------------------------------------------------------------------

FUNCTION COUNT_N(p_series_id IN NUMBER) RETURN NUMBER
AS
  v_result NUMBER;

BEGIN
  SELECT count(*)
    INTO v_result
    FROM TQC_SERIES_DATA
   WHERE FK_SERIESID = p_series_id
     AND FL_DEL = 0;

  RETURN v_result;
END; -- COUNT_N


------------------------------------------------------------------------------
-- Определение среднего арифметического отклонения результатов измерений.
------------------------------------------------------------------------------

FUNCTION COUNT_Xn(p_series_id IN NUMBER) RETURN NUMBER
AS
  v_result NUMBER;

BEGIN
  SELECT COUNT(*)
    INTO v_result
    FROM DUAL
   WHERE EXISTS (SELECT NULL
                   FROM TQC_SERIES_DATA
                  WHERE fk_seriesid = p_series_id
                    AND fl_del = 0);

  IF v_result > 0 THEN

    SELECT SUM(fn_result) / COUNT(*)
      INTO v_result
      FROM TQC_SERIES_DATA
     WHERE fk_seriesid = p_series_id
       AND fl_del = 0;
  END IF;

  RETURN v_result;
END; -- COUNT_Xn


------------------------------------------------------------------------------
-- Определение среднего квадратичного отклонения результатов измерений.
------------------------------------------------------------------------------

FUNCTION COUNT_Sn(p_series_id IN NUMBER) RETURN NUMBER
AS
  v_result NUMBER;
  v_Xn NUMBER;
  v_N NUMBER;

BEGIN
  SELECT COUNT(*)
    INTO v_result
    FROM DUAL
   WHERE EXISTS (SELECT NULL
                   FROM TQC_SERIES_DATA
                  WHERE fk_seriesid = p_series_id
                    AND fl_del = 0);

  IF v_result > 0 THEN

    v_result := 0;
    v_N := COUNT_N(p_series_id);
    v_Xn := COUNT_Xn(p_series_id);

    IF v_N > 1 THEN

      SELECT SUM(SQRT(ABS(fn_result - v_Xn))) / (v_N - 1)
        INTO v_result
        FROM TQC_SERIES_DATA
       WHERE fk_seriesid = p_series_id
         AND fl_del = 0;

      IF v_result > 0 THEN

        v_result := 1 / SQRT(v_result);
      END IF;
    END IF;
  END IF;

  RETURN v_result;
END; -- COUNT_Sn


------------------------------------------------------------------------------
-- Определение коэффициента вариации результатов измерений.
------------------------------------------------------------------------------

FUNCTION COUNT_CVn(p_series_id IN NUMBER) RETURN NUMBER
AS
  v_result NUMBER;

BEGIN
  SELECT COUNT(*)
    INTO v_result
    FROM DUAL
   WHERE EXISTS (SELECT NULL
                   FROM TQC_SERIES_DATA
                  WHERE fk_seriesid = p_series_id
                    AND fl_del = 0);

  IF v_result > 0 THEN

    v_result := (COUNT_Sn(p_series_id) / COUNT_Xn(p_series_id)) * 100;
  END IF;

  RETURN v_result;
END; -- COUNT_CVn


------------------------------------------------------------------------------
-- Определение относительного смещения результатов измерений.
------------------------------------------------------------------------------

FUNCTION COUNT_Bn(p_series_id IN NUMBER,
    p_method_id IN NUMBER, p_level_id IN NUMBER) RETURN NUMBER
AS
  v_result NUMBER;
  v_Xn NUMBER;
  v_Xa NUMBER;

BEGIN
  SELECT COUNT(*)
    INTO v_result
    FROM DUAL
   WHERE EXISTS (SELECT NULL
                   FROM TQC_SERIES_DATA
                  WHERE fk_seriesid = p_series_id
                    AND fl_del = 0);

  IF v_result > 0 THEN

    SELECT COUNT(*)
      INTO v_result
      FROM DUAL
     WHERE EXISTS (SELECT NULL
                     FROM TQC_MLEVELPASPORT
                    WHERE fk_mlevelid = p_level_id
                      AND fk_metodid = p_method_id);

    IF v_result > 0 THEN

      SELECT fn_xa
        INTO v_Xa
        FROM TQC_MLEVELPASPORT
       WHERE fk_mlevelid = p_level_id
         AND fk_metodid = p_method_id;

      v_result := ((COUNT_Xn(p_series_id) - v_Xa) / v_Xa) * 100;
    END IF;
  END IF;

  RETURN v_result;
END; -- COUNT_Bn


------------------------------------------------------------------------------
-- Определение правильность методики.
------------------------------------------------------------------------------

FUNCTION VALID_METHOD(p_series_id IN NUMBER,
    p_count_cv IN NUMBER, p_count_b IN NUMBER) RETURN NUMBER
AS
  c_method_valid     CONSTANT NUMBER := 1;
  c_method_not_valid CONSTANT NUMBER := -1;
  c_cv_10            CONSTANT NUMBER := 16;
  c_b_10_min         CONSTANT NUMBER := -17;
  c_b_10_max         CONSTANT NUMBER := 17;
  c_cv_20            CONSTANT NUMBER := 15;
  c_b_20_min         CONSTANT NUMBER := -15;
  c_b_20_max         CONSTANT NUMBER := 15;
  v_result NUMBER;

BEGIN
  SELECT COUNT(*)
    INTO v_result
    FROM DUAL
   WHERE EXISTS (SELECT NULL
                   FROM TQC_SERIES_DATA
                  WHERE fk_seriesid = p_series_id
                    AND fl_del = 0);

  IF v_result > 0 THEN

    v_result := c_method_not_valid;

    IF COUNT_N(p_series_id) < 10 THEN
      IF p_count_cv <= (c_cv_10 * 5) / 10 THEN

        v_result := c_method_valid;
      END IF;
    ELSE
      IF COUNT_N(p_series_id) = 10 THEN
        IF (p_count_cv < c_cv_10) AND
            (p_count_b > c_b_10_min) AND
            (p_count_b < c_b_10_max) THEN

          v_result := c_method_valid;
        END IF;
      ELSE
        IF (p_count_cv < c_cv_20) AND
            (p_count_b > c_b_20_min) AND
            (p_count_b < c_b_20_max) THEN

          v_result := c_method_valid;
        END IF;
      END IF;
    END IF;
  END IF;

  RETURN v_result;
END; -- VALID_METHOD

END; -- PKG_LAB_QC
/

SHOW ERRORS;


