DROP VIEW ASU.V_MATRIX_SENSORS
/

/* Formatted on 06.04.2016 15:19:09 (QP5 v5.115.810.9015) */
--
-- V_MATRIX_SENSORS  (View)
--
--  Dependencies:
--   TMATRIX_SENSORS (Table)
--   TPHYSIOTHERAPY_MAPS (Table)
--

CREATE OR REPLACE FORCE VIEW ASU.V_MATRIX_SENSORS
(
   SENSOR_ID,
   LEFT,
   RIGHT,
   TOP,
   BOTTOM,
   WORK_MODE,
   REGION_INDEX,
   TEMPLATE_ID
)
AS
   SELECT   tmatrix_sensors.fk_id AS sensor_id,
            tmatrix_sensors.fn_left AS left,
            tmatrix_sensors.fn_right AS right,
            tmatrix_sensors.fn_top AS top,
            tmatrix_sensors.fn_bottom AS bottom,
            tmatrix_sensors.fn_work_mode AS work_mode,
            NVL (tphysiotherapy_maps.fk_area_id, -1) AS region_index,
            tmatrix_sensors.fk_template_id AS template_id
     FROM      tmatrix_sensors
            LEFT JOIN
               tphysiotherapy_maps
            ON tmatrix_sensors.fk_id = tphysiotherapy_maps.fk_sensor_id
/
COMMENT ON TABLE ASU.V_MATRIX_SENSORS IS 'Предназначена для предоставления сенсоров изображения матрицы. Author: rca'
/


