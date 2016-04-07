DROP VIEW ASU.V_MATRIX_TEMPLATES
/

/* Formatted on 06.04.2016 15:19:10 (QP5 v5.115.810.9015) */
--
-- V_MATRIX_TEMPLATES  (View)
--
--  Dependencies:
--   TMATRIX_TEMPLATES (Table)
--

CREATE OR REPLACE FORCE VIEW ASU.V_MATRIX_TEMPLATES
(
   ID,
   PRESCRIPTION_ID,
   HEIGHT,
   WIDTH,
   DISPLAY,
   DISPLAY_SELECTED,
   DISPLAY_ACTIVE
)
AS
   SELECT   fk_id AS id,
            fk_prescription_id AS prescription_id,
            fn_height AS height,
            fn_width AS width,
            fb_display AS display,
            fb_display_selected AS display_selected,
            fb_display_active AS display_active
     FROM   tmatrix_templates
/
COMMENT ON TABLE ASU.V_MATRIX_TEMPLATES IS 'Предназначена для предоставления шаблонов матриц изображений. Author: rca'
/


