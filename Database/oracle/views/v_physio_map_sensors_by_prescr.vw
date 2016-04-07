DROP VIEW ASU.V_PHYSIO_MAP_SENSORS_BY_PRESCR
/

/* Formatted on 06.04.2016 15:19:16 (QP5 v5.115.810.9015) */
--
-- V_PHYSIO_MAP_SENSORS_BY_PRESCR  (View)
--
--  Dependencies:
--   TMATRIX_SENSORS (Table)
--   TMATRIX_TEMPLATES (Table)
--   TPHYSIOTHERAPY_MAPS (Table)
--

CREATE OR REPLACE FORCE VIEW ASU.V_PHYSIO_MAP_SENSORS_BY_PRESCR
(
   PRESCRIPTION_ID,
   AREA_ID,
   LEFT,
   TOP,
   RIGHT,
   BOTTOM
)
AS
   SELECT   tmatrix_templates.fk_prescription_id AS prescription_id,
            tphysiotherapy_maps.fk_area_id AS area_id,
            tmatrix_sensors.fn_left AS left,
            tmatrix_sensors.fn_top AS top,
            tmatrix_sensors.fn_right AS right,
            tmatrix_sensors.fn_bottom AS bottom
     FROM   tmatrix_sensors, tmatrix_templates, tphysiotherapy_maps
    WHERE   tmatrix_sensors.fk_template_id = tmatrix_templates.fk_id
            AND tphysiotherapy_maps.fk_sensor_id = tmatrix_sensors.fk_id
/


