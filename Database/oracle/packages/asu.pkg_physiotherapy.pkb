DROP PACKAGE BODY ASU.PKG_PHYSIOTHERAPY
/

--
-- PKG_PHYSIOTHERAPY  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_PHYSIOTHERAPY" 
IS

------------------------------------------------------------------------------
-- Получает области по назначению
------------------------------------------------------------------------------

PROCEDURE PRESCRIPTION_AREAS(
    p_areas IN OUT CURSOR_TYPE, p_fk_id IN NUMBER)
AS
BEGIN

  OPEN p_areas FOR
      SELECT DISTINCT FK_ID as ID, FK_OWNER as OWNER_ID, FC_NAME as AREA_NAME
        FROM TSMID
       WHERE FK_ID IN (SELECT FK_ID
                         FROM TSMID
                        WHERE FK_OWNER IN (SELECT FK_ID
                                             FROM TSMID
                                            WHERE FC_SYNONIM = 'NAZ_AREA')
                   START WITH FK_ID IN (SELECT FK_ID
                                          FROM TSMID
                                         WHERE FK_ID IN (SELECT FK_ID
                                                           FROM TSMID
                                                          WHERE FK_ID NOT IN (SELECT FK_ID
                                                                                FROM TSMID
                                                                          START WITH FC_SYNONIM = 'RAZ_PROC'
                                                                    CONNECT BY PRIOR FK_OWNER = FK_ID)
                                                      START WITH FK_ID IN (SELECT FK_ID
                                                                             FROM TSMID
                                                                            WHERE FK_OWNER IN (SELECT FK_ID
                                                                                                 FROM TSMID
                                                                                                WHERE FC_SYNONIM = 'NAZ_AREA')
                                                                       START WITH FK_ID = GET_PROCMANID
                                                                 CONNECT BY PRIOR FK_ID = FK_OWNER)
                                                CONNECT BY PRIOR FK_OWNER = FK_ID)
                                    START WITH FK_ID = p_fk_id
                              CONNECT BY PRIOR FK_ID = FK_OWNER)
             CONNECT BY PRIOR FK_ID = FK_OWNER);
END; -- PRESCRIPTION_AREAS


------------------------------------------------------------------------------
-- Получает физиотерапевтические области по назначению
------------------------------------------------------------------------------

PROCEDURE PHYSIOTHERAPY_MAP(
    p_areas IN OUT CURSOR_TYPE,
    p_fk_prescription_id IN tmatrix_templates.fk_prescription_id%TYPE)
AS
  v_cnt NUMBER;

BEGIN
  SELECT COUNT(*)
    INTO v_cnt
    FROM DUAL
   WHERE EXISTS (
       SELECT DISTINCT id,
              area_name,
              0 as parent_id
         FROM (SELECT physio_maps.fk_area_id as id,
                      tsmid.fc_name as area_name
                 FROM tmatrix_sensors sensors,
                      tmatrix_templates tmpl,
                      tphysiotherapy_maps physio_maps, tsmid
                WHERE sensors.fk_template_id = tmpl.fk_id
                  AND physio_maps.fk_sensor_id = sensors.fk_id
                  AND tsmid.fk_id = physio_maps.fk_area_id
                  AND tmpl.fk_prescription_id = p_fk_prescription_id));

  OPEN p_areas FOR
      SELECT 0 id,
             'Все' area_name,
             -1 as parent_id
        FROM dual
       WHERE v_cnt > 0
       UNION
      SELECT DISTINCT id,
             area_name,
             0 as parent_id
        FROM (SELECT physio_maps.fk_area_id as id,
                     tsmid.fc_name as area_name
                FROM tmatrix_sensors sensors,
                     tmatrix_templates tmpl,
                     tphysiotherapy_maps physio_maps, tsmid
               WHERE sensors.fk_template_id = tmpl.fk_id
                 AND physio_maps.fk_sensor_id = sensors.fk_id
                 AND tsmid.fk_id = physio_maps.fk_area_id
                 AND tmpl.fk_prescription_id = p_fk_prescription_id);

END; -- PHYSIOTHERAPY_MAP


------------------------------------------------------------------------------
-- Добавляем новый шаблон карты назначения
------------------------------------------------------------------------------

FUNCTION ADD_MATRIX_TEMPLATE(
    p_fk_prescription_id IN tmatrix_templates.fk_prescription_id%TYPE,
    p_fn_height IN tmatrix_templates.fn_height%TYPE,
    p_fn_width IN tmatrix_templates.fn_width%TYPE) RETURN NUMBER
AS
  v_fk_id NUMBER;

BEGIN
  INSERT INTO tmatrix_templates
              (fk_prescription_id, fn_height, fn_width)
       VALUES (p_fk_prescription_id, p_fn_height, p_fn_width)
    RETURNING fk_id
         INTO v_fk_id;

  RETURN v_fk_id;
END; -- ADD_MATRIX_TEMPLATE


------------------------------------------------------------------------------
-- Добавление области для физиотерапевтической карты.
------------------------------------------------------------------------------

PROCEDURE ADD_PHYSIOTHERAPY_AREA(
    p_fk_prescription_id IN tmatrix_templates.fk_prescription_id%TYPE,
    p_fk_area_id IN tphysiotherapy_maps.fk_area_id%TYPE,
    p_fn_left IN tmatrix_sensors.fn_left%TYPE,
    p_fn_top IN tmatrix_sensors.fn_top%TYPE,
    p_fn_right IN tmatrix_sensors.fn_right%TYPE,
    p_fn_bottom IN tmatrix_sensors.fn_bottom%TYPE
    )
AS
  v_fk_sensor_id NUMBER;
  v_fk_template_id NUMBER;
  v_cnt NUMBER;

BEGIN
--  IF NOT IS_EXIST_AREA_SENSOR(
--      p_fk_prescription_id,
--      p_fn_left, p_fn_top, p_fn_right, p_fn_bottom) THEN

    v_cnt := 0;
    v_fk_template_id := FIND_TMPL_BY_PRESCRIPTION_ID(p_fk_prescription_id);

    SELECT COUNT(*)
      INTO v_cnt
      FROM DUAL
     WHERE EXISTS (SELECT NULL
                     FROM tmatrix_sensors
                    WHERE tmatrix_sensors.fk_template_id = v_fk_template_id
                      AND tmatrix_sensors.fn_left = p_fn_left
                      AND tmatrix_sensors.fn_right = p_fn_right
                      AND tmatrix_sensors.fn_top = p_fn_top
                      AND tmatrix_sensors.fn_bottom = p_fn_bottom);

    IF v_cnt > 0 THEN

      SELECT tmatrix_sensors.fk_id
        INTO v_fk_sensor_id
        FROM tmatrix_sensors
       WHERE tmatrix_sensors.fk_template_id = v_fk_template_id
         AND tmatrix_sensors.fn_left = p_fn_left
         AND tmatrix_sensors.fn_right = p_fn_right
         AND tmatrix_sensors.fn_top = p_fn_top
         AND tmatrix_sensors.fn_bottom = p_fn_bottom;

      INSERT INTO tphysiotherapy_maps
                  (fk_sensor_id, fk_area_id)
           VALUES (v_fk_sensor_id, p_fk_area_id);
    END IF;
--  END IF;
END; -- ADD_PHYSIOTHERAPY_AREA


------------------------------------------------------------------------------
-- Удаление области для физиотерапевтической карты.
------------------------------------------------------------------------------

PROCEDURE DELETE_PHYSIOTHERAPY_AREA(
    p_fk_prescription_id IN tmatrix_templates.fk_prescription_id%TYPE,
    p_fk_area_id IN tphysiotherapy_maps.fk_area_id%TYPE)
AS
  v_fk_template_id NUMBER;

BEGIN
  v_fk_template_id := FIND_TMPL_BY_PRESCRIPTION_ID(p_fk_prescription_id);

  DELETE FROM tphysiotherapy_maps
        WHERE fk_sensor_id IN (SELECT fk_id
                                 FROM tmatrix_sensors
                                WHERE fk_template_id = v_fk_template_id)
          AND fk_area_id = p_fk_area_id;

END; -- DELETE_PHYSIOTHERAPY_AREA


------------------------------------------------------------------------------
-- Удаление всех областей, принадлежащих физиотерапевтической карте.
------------------------------------------------------------------------------

PROCEDURE DELETE_ALL_PHYSIOTHERAPY_AREAS(
    p_fk_prescription_id IN tmatrix_templates.fk_prescription_id%TYPE)
AS
  v_fk_template_id NUMBER;

BEGIN
  v_fk_template_id := FIND_TMPL_BY_PRESCRIPTION_ID(p_fk_prescription_id);

  DELETE FROM tphysiotherapy_maps
        WHERE fk_sensor_id IN (SELECT fk_id
                                 FROM tmatrix_sensors
                                WHERE fk_template_id = v_fk_template_id);

END; -- DELETE_ALL_PHYSIOTHERAPY_AREAS


------------------------------------------------------------------------------
-- Обнавляем изображение шаблона карты
------------------------------------------------------------------------------

PROCEDURE UPDATE_MAP_TEMPLATE(
    p_fk_id IN tmatrix_templates.fk_id%TYPE,
    p_fb_display IN tmatrix_templates.fb_display%TYPE,
    p_fb_display_selected IN tmatrix_templates.fb_display_selected%TYPE,
    p_fb_display_active IN tmatrix_templates.fb_display_active%TYPE)
AS
BEGIN
  UPDATE tmatrix_templates
     SET tmatrix_templates.fb_display = p_fb_display,
         tmatrix_templates.fb_display_selected = p_fb_display_selected,
         tmatrix_templates.fb_display_active = p_fb_display_active
   WHERE tmatrix_templates.fk_id = p_fk_id;

END; -- UPDATE_MAP_TEMPLATE


-----------------------------------------------------------------------------
-- Обнавляем изображение шаблона карты
------------------------------------------------------------------------------

PROCEDURE UPDATE_MAP_TEMPLATE(
    p_fk_prescription_id IN tmatrix_templates.fk_prescription_id%TYPE,
    p_fn_height IN tmatrix_templates.fn_height%TYPE,
    p_fn_width IN tmatrix_templates.fn_width%TYPE,
    p_fb_display IN tmatrix_templates.fb_display%TYPE,
    p_fb_display_selected IN tmatrix_templates.fb_display_selected%TYPE,
    p_fb_display_active IN tmatrix_templates.fb_display_active%TYPE)
AS
BEGIN
  UPDATE tmatrix_templates
     SET tmatrix_templates.fn_height = p_fn_height,
         tmatrix_templates.fn_width = p_fn_width,
         tmatrix_templates.fb_display = p_fb_display,
         tmatrix_templates.fb_display_selected = p_fb_display_selected,
         tmatrix_templates.fb_display_active = p_fb_display_active
   WHERE tmatrix_templates.fk_prescription_id = p_fk_prescription_id;

END; -- UPDATE_MAP_TEMPLATE


------------------------------------------------------------------------------
-- Ищем fk_id шаблона карты по назначению.
------------------------------------------------------------------------------

FUNCTION FIND_TMPL_BY_PRESCRIPTION_ID(
    p_fk_prescription_id IN tmatrix_templates.fk_prescription_id%TYPE
    ) RETURN NUMBER
AS
  v_fk_id NUMBER;

BEGIN
  SELECT tmatrix_templates.fk_id
    INTO v_fk_id
    FROM tmatrix_templates
   WHERE tmatrix_templates.fk_prescription_id = p_fk_prescription_id;

  RETURN v_fk_id;

END; -- FIND_TMPL_BY_PRESCRIPTION_ID


------------------------------------------------------------------------------
-- Добавляем новый сенсор матрицы карты назначения
------------------------------------------------------------------------------

PROCEDURE ADD_MATRIX_SENSOR(
    p_fk_template_id IN tmatrix_sensors.fk_template_id%TYPE,
    p_fn_left IN tmatrix_sensors.fn_left%TYPE,
    p_fn_top IN tmatrix_sensors.fn_top%TYPE,
    p_fn_right IN tmatrix_sensors.fn_right%TYPE,
    p_fn_bottom IN tmatrix_sensors.fn_bottom%TYPE,
    p_fn_work_mode IN tmatrix_sensors.fn_work_mode%TYPE)
AS
BEGIN
  INSERT INTO tmatrix_sensors
              (fk_template_id, fn_left, fn_top, fn_right, fn_bottom,
              fn_work_mode)
       VALUES (p_fk_template_id, p_fn_left, p_fn_top, p_fn_right, p_fn_bottom,
              p_fn_work_mode);

END; -- ADD_MATRIX_SENSOR


------------------------------------------------------------------------------
-- Удаляем сенсоры матрицы карты назначения
------------------------------------------------------------------------------

PROCEDURE DELETE_MATRIX_SENSORS(
    p_fk_template_id IN tmatrix_sensors.fk_template_id%TYPE)
AS
BEGIN
  DELETE FROM tmatrix_sensors
        WHERE tmatrix_sensors.fk_template_id = p_fk_template_id;

END; -- DELETE_MATRIX_SENSORS


------------------------------------------------------------------------------
-- Проверка наличия физиотерапевтических карт для шаблона карты,
-- соответствующего указанному назначению.
------------------------------------------------------------------------------

FUNCTION IS_EXIST_PHYSIOTHERAPY_MAPS(
    p_fk_prescription_id IN tmatrix_templates.fk_prescription_id%TYPE
    ) RETURN BOOLEAN
AS
  v_cnt NUMBER;

BEGIN
  v_cnt := 0;

  SELECT COUNT(*)
    INTO v_cnt
    FROM DUAL
   WHERE EXISTS (SELECT NULL
                   FROM tmatrix_templates tmpl, tmatrix_sensors,
                        tphysiotherapy_maps physio_map
                  WHERE tmpl.fk_id = tmatrix_sensors.fk_template_id
                    AND tmatrix_sensors.fk_id = physio_map.fk_sensor_id
                    AND tmpl.fk_prescription_id = p_fk_prescription_id);

  RETURN (v_cnt > 0);

END; -- IS_EXIST_PHYSIOTHERAPY_MAPS


------------------------------------------------------------------------------
-- Проверка наличия области физиотерапевтической карты для шаблона карты,
-- соответствующего указанному назначению.
------------------------------------------------------------------------------

FUNCTION IS_EXIST_MAP_AREA(
    p_fk_prescription_id IN tmatrix_templates.fk_prescription_id%TYPE,
    p_fk_area_id IN tphysiotherapy_maps.fk_area_id%TYPE
    ) RETURN BOOLEAN
AS
  v_cnt NUMBER;

BEGIN
  v_cnt := 0;

  SELECT COUNT(*)
    INTO v_cnt
    FROM DUAL
   WHERE EXISTS (SELECT NULL
                   FROM tmatrix_templates tmpl, tmatrix_sensors,
                        tphysiotherapy_maps physio_map
                  WHERE tmpl.fk_id = tmatrix_sensors.fk_template_id
                    AND tmatrix_sensors.fk_id = physio_map.fk_sensor_id
                    AND tmpl.fk_prescription_id = p_fk_prescription_id
                    AND physio_map.fk_area_id = p_fk_area_id);

  RETURN (v_cnt > 0);

END; -- IS_EXIST_MAP_AREA


------------------------------------------------------------------------------
-- Проверка наличия в области физиотерапевтической карты сенсоров,
-- принадлежащих другим областям.
------------------------------------------------------------------------------

FUNCTION IS_EXIST_AREA_SENSOR(
    p_fk_prescription_id IN tmatrix_templates.fk_prescription_id%TYPE,
    p_fn_left IN tmatrix_sensors.fn_left%TYPE,
    p_fn_top IN tmatrix_sensors.fn_top%TYPE,
    p_fn_right IN tmatrix_sensors.fn_right%TYPE,
    p_fn_bottom IN tmatrix_sensors.fn_bottom%TYPE
    ) RETURN BOOLEAN
AS
  v_cnt NUMBER;

BEGIN
  v_cnt := 0;

  SELECT COUNT(*)
    INTO v_cnt
    FROM DUAL
   WHERE EXISTS (SELECT NULL
                   FROM tmatrix_templates tmpl, tmatrix_sensors,
                        tphysiotherapy_maps physio_map
                  WHERE tmpl.fk_id = tmatrix_sensors.fk_template_id
                    AND tmatrix_sensors.fk_id = physio_map.fk_sensor_id
                    AND tmpl.fk_prescription_id = p_fk_prescription_id
                    AND tmatrix_sensors.fn_left = p_fn_left
                    AND tmatrix_sensors.fn_top = p_fn_top
                    AND tmatrix_sensors.fn_right = p_fn_right
                    AND tmatrix_sensors.fn_bottom = p_fn_bottom);

  RETURN (v_cnt > 0);

END; -- IS_EXIST_AREA_SENSOR


------------------------------------------------------------------------------
-- Получение родителя области карты назначения.
------------------------------------------------------------------------------

FUNCTION GET_OWNER_AREA(
    p_fk_prescription_id IN tmatrix_templates.fk_prescription_id%TYPE
    ) RETURN NUMBER
IS
  v_owner NUMBER;
  v_fk_id NUMBER;
  v_fk_owner_id NUMBER;
  v_area_name tsmid.fc_name%TYPE;
  p_areas CURSOR_TYPE;

BEGIN
  v_owner := -1;
  PRESCRIPTION_AREAS(p_areas, p_fk_prescription_id);

  LOOP
    FETCH p_areas INTO v_fk_id, v_fk_owner_id, v_area_name;
    EXIT WHEN p_areas%NOTFOUND;

    IF ((v_fk_owner_id <> v_owner) AND (v_owner <> -1)) OR
        ((v_fk_owner_id = -1) AND (v_owner = -1)) THEN

      v_owner := -1;
      EXIT;
    ELSE
      v_owner := v_fk_owner_id;
    END IF;
  END LOOP;

  CLOSE p_areas;

  RETURN v_owner;

END; -- GET_OWNER_AREA


------------------------------------------------------------------------------
-- Удаление областей карты назначения
------------------------------------------------------------------------------

PROCEDURE DELETE_AREAS_FROM_TIB(
    p_fk_naz_id IN tib.fk_pacid%TYPE,
    p_fk_owner_area_id IN tib.fk_smeditid%TYPE)
AS
BEGIN
  DELETE
    FROM tib
   WHERE fk_pacid = p_fk_naz_id
     AND fk_smeditid = p_fk_owner_area_id;

END; -- DELETE_AREA_FROM_TIB


------------------------------------------------------------------------------
-- Добавление области карты назначения, выбранной пользователем.
------------------------------------------------------------------------------

PROCEDURE ADD_AREA_TO_TIB(
    p_fk_area_id IN tib.fk_smid%TYPE,
    p_fk_doctor_id IN tib.fk_vrachid%TYPE,
    p_fk_naz_id IN tib.fk_pacid%TYPE,
    p_fk_owner_area_id IN tib.fk_smeditid%TYPE)
AS
BEGIN
  INSERT INTO tib (fk_smid, fk_vrachid, fk_pacid, fk_smeditid)
       VALUES (p_fk_area_id, p_fk_doctor_id, p_fk_naz_id, p_fk_owner_area_id);

END; -- ADD_AREA_TO_TIB

END; -- PKG_PHYSIOTHERAPY
/

SHOW ERRORS;


