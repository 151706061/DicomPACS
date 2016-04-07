DROP PACKAGE ASU.PKG_PHYSIOTHERAPY
/

--
-- PKG_PHYSIOTHERAPY  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TIB (Table)
--   TMATRIX_SENSORS (Table)
--   TMATRIX_TEMPLATES (Table)
--   TPHYSIOTHERAPY_MAPS (Table)
--
CREATE OR REPLACE PACKAGE ASU."PKG_PHYSIOTHERAPY" 
IS
-- Пакет для работы с редактором карт для физиотерапии
-- %Author RCA

TYPE CURSOR_TYPE IS REF CURSOR;

-- Получает области по назначению
-- %param p_areas - Курсор, хранящий все области,
--                  принадлежащие указанному назначению
-- %param p_fk_id - FK_ID назначения

PROCEDURE PRESCRIPTION_AREAS(
    p_areas IN OUT CURSOR_TYPE, p_fk_id IN NUMBER);


-- Получает физиотерапевтические области по назначению
-- %param p_areas - Курсор, хранящий физиотерапевтические области,
--                  принадлежащие указанному назначению
-- %param p_fk_prescription_id - FK_ID назначения

PROCEDURE PHYSIOTHERAPY_MAP(
    p_areas IN OUT CURSOR_TYPE,
    p_fk_prescription_id IN tmatrix_templates.fk_prescription_id%TYPE);


-- Добавляем новый шаблон карты назначения
-- %param p_fk_prescription_id - ID назначения
-- %param p_fn_height - высота изображения
-- %param p_fn_width - ширина изображения

FUNCTION ADD_MATRIX_TEMPLATE(
    p_fk_prescription_id IN tmatrix_templates.fk_prescription_id%TYPE,
    p_fn_height IN tmatrix_templates.fn_height%TYPE,
    p_fn_width IN tmatrix_templates.fn_width%TYPE
    ) RETURN NUMBER;


-- Добавление области для физиотерапевтической карты.
-- %param p_fk_prescription_id - ID назначения
-- %param p_fk_area_id - ID области назначения
-- %param p_fn_left - левая координата сенсора
-- %param p_fn_top - верхняя координата сенсора
-- %param p_fn_right - правая координата сенсора
-- %param p_fn_bottom - нижняя координата сенсора

PROCEDURE ADD_PHYSIOTHERAPY_AREA(
    p_fk_prescription_id IN tmatrix_templates.fk_prescription_id%TYPE,
    p_fk_area_id IN tphysiotherapy_maps.fk_area_id%TYPE,
    p_fn_left IN tmatrix_sensors.fn_left%TYPE,
    p_fn_top IN tmatrix_sensors.fn_top%TYPE,
    p_fn_right IN tmatrix_sensors.fn_right%TYPE,
    p_fn_bottom IN tmatrix_sensors.fn_bottom%TYPE
    );


-- Удаление области для физиотерапевтической карты.
-- %param p_fk_prescription_id - ID назначения
-- %param p_fk_area_id - ID области назначения

PROCEDURE DELETE_PHYSIOTHERAPY_AREA(
    p_fk_prescription_id IN tmatrix_templates.fk_prescription_id%TYPE,
    p_fk_area_id IN tphysiotherapy_maps.fk_area_id%TYPE);


-- Удаление всех областей, принадлежащих физиотерапевтической карте.
-- %param p_fk_prescription_id - ID назначения

PROCEDURE DELETE_ALL_PHYSIOTHERAPY_AREAS(
    p_fk_prescription_id IN tmatrix_templates.fk_prescription_id%TYPE);


-- Обнавляем изображение шаблона карты
-- %param p_fk_id - fk_id шаблона
-- %param p_fb_display - изображение шаблона карты
-- %param p_fb_display_selected - изображение шаблона выделенной карты
-- %param p_fb_display_active - изображение шаблона активной карты

PROCEDURE UPDATE_MAP_TEMPLATE(
    p_fk_id IN tmatrix_templates.fk_id%TYPE,
    p_fb_display IN tmatrix_templates.fb_display%TYPE,
    p_fb_display_selected IN tmatrix_templates.fb_display_selected%TYPE,
    p_fb_display_active IN tmatrix_templates.fb_display_active%TYPE);


-- Обнавляем изображение шаблона карты
-- %param p_fk_prescription_id - ID назначения
-- %param p_fn_height - высота изображения
-- %param p_fn_width - ширина изображения
-- %param p_fb_display - изображение шаблона карты
-- %param p_fb_display_selected - изображение шаблона выделенной карты
-- %param p_fb_display_active - изображение шаблона активной карты

PROCEDURE UPDATE_MAP_TEMPLATE(
    p_fk_prescription_id IN tmatrix_templates.fk_prescription_id%TYPE,
    p_fn_height IN tmatrix_templates.fn_height%TYPE,
    p_fn_width IN tmatrix_templates.fn_width%TYPE,
    p_fb_display IN tmatrix_templates.fb_display%TYPE,
    p_fb_display_selected IN tmatrix_templates.fb_display_selected%TYPE,
    p_fb_display_active IN tmatrix_templates.fb_display_active%TYPE);


-- Ищем fk_id шаблона карты по назначению.
-- %param p_fk_prescription_id - ID назначения

FUNCTION FIND_TMPL_BY_PRESCRIPTION_ID(
    p_fk_prescription_id IN tmatrix_templates.fk_prescription_id%TYPE
    ) RETURN NUMBER;

-- Добавляем новый сенсор матрицы карты назначения
-- %param p_fk_template_id - ID шаблона изображения
-- %param p_fn_left - левая координата сенсора
-- %param p_fn_top - верхняя координата сенсора
-- %param p_fn_right - правая координата сенсора
-- %param p_fn_bottom - нижняя координата сенсора
-- %param p_fn_work_mode - активный или не активный сенсор

PROCEDURE ADD_MATRIX_SENSOR(
    p_fk_template_id IN tmatrix_sensors.fk_template_id%TYPE,
    p_fn_left IN tmatrix_sensors.fn_left%TYPE,
    p_fn_top IN tmatrix_sensors.fn_top%TYPE,
    p_fn_right IN tmatrix_sensors.fn_right%TYPE,
    p_fn_bottom IN tmatrix_sensors.fn_bottom%TYPE,
    p_fn_work_mode IN tmatrix_sensors.fn_work_mode%TYPE);


-- Удаляем сенсоры матрицы карты назначения
-- %param p_fk_template_id - ID шаблона изображения

PROCEDURE DELETE_MATRIX_SENSORS(
    p_fk_template_id IN tmatrix_sensors.fk_template_id%TYPE);


-- Проверка наличия физиотерапевтических карт для шаблона карты,
-- соответствующего указанному назначению.
-- %param p_fk_prescription_id - ID назначения

FUNCTION IS_EXIST_PHYSIOTHERAPY_MAPS(
    p_fk_prescription_id IN tmatrix_templates.fk_prescription_id%TYPE
    ) RETURN BOOLEAN;


-- Проверка наличия области физиотерапевтической карты для шаблона карты,
-- соответствующего указанному назначению.
-- %param p_fk_prescription_id - ID назначения
-- %param p_fk_area_id - ID области назначения

FUNCTION IS_EXIST_MAP_AREA(
    p_fk_prescription_id IN tmatrix_templates.fk_prescription_id%TYPE,
    p_fk_area_id IN tphysiotherapy_maps.fk_area_id%TYPE
    ) RETURN BOOLEAN;


-- Проверка наличия в области физиотерапевтической карты сенсоров,
-- принадлежащих другим областям.
-- %param p_fk_prescription_id - ID назначения
-- %param p_fn_left - левая координата сенсора
-- %param p_fn_top - верхняя координата сенсора
-- %param p_fn_right - правая координата сенсора
-- %param p_fn_bottom - нижняя координата сенсора

FUNCTION IS_EXIST_AREA_SENSOR(
    p_fk_prescription_id IN tmatrix_templates.fk_prescription_id%TYPE,
    p_fn_left IN tmatrix_sensors.fn_left%TYPE,
    p_fn_top IN tmatrix_sensors.fn_top%TYPE,
    p_fn_right IN tmatrix_sensors.fn_right%TYPE,
    p_fn_bottom IN tmatrix_sensors.fn_bottom%TYPE
    ) RETURN BOOLEAN;


-- Получение родителя области карты назначения.
-- %param p_fk_id - ID области назначения

FUNCTION GET_OWNER_AREA(
    p_fk_prescription_id IN tmatrix_templates.fk_prescription_id%TYPE
    ) RETURN NUMBER;


-- Удаление областей карты назначения
-- %param p_fk_naz_id - ID назначения
-- %param p_fk_owner_area_id - ID предка области карты назначения

PROCEDURE DELETE_AREAS_FROM_TIB(
    p_fk_naz_id IN tib.fk_pacid%TYPE,
    p_fk_owner_area_id IN tib.fk_smeditid%TYPE);


-- Добавление области карты назначения, выбранной пользователем.
-- %param p_fk_area_id - ID области карты назначения
-- %param p_fk_doctor_id - ID врача
-- %param p_fk_naz_id - ID назначения
-- %param p_fk_owner_area_id - ID предка области карты назначения

PROCEDURE ADD_AREA_TO_TIB(
    p_fk_area_id IN tib.fk_smid%TYPE,
    p_fk_doctor_id IN tib.fk_vrachid%TYPE,
    p_fk_naz_id IN tib.fk_pacid%TYPE,
    p_fk_owner_area_id IN tib.fk_smeditid%TYPE);

END; -- PKG_PHYSIOTHERAPY
/

SHOW ERRORS;


