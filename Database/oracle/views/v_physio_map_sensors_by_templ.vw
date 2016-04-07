DROP VIEW ASU.V_PHYSIO_MAP_SENSORS_BY_TEMPL
/

/* Formatted on 06.04.2016 15:19:17 (QP5 v5.115.810.9015) */
--
-- V_PHYSIO_MAP_SENSORS_BY_TEMPL  (View)
--
--  Dependencies:
--   TMATRIX_SENSORS (Table)
--   TPHYSIOTHERAPY_MAPS (Table)
--

CREATE OR REPLACE FORCE VIEW ASU.V_PHYSIO_MAP_SENSORS_BY_TEMPL
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
            tphysiotherapy_maps.fk_area_id AS region_index,
            tmatrix_sensors.fk_template_id AS template_id
     FROM   tmatrix_sensors, tphysiotherapy_maps
    WHERE   tmatrix_sensors.fk_id = tphysiotherapy_maps.fk_sensor_id
/


