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
-- ����� ��� ������ � ���������� ���� ��� ������������
-- %Author RCA

TYPE CURSOR_TYPE IS REF CURSOR;

-- �������� ������� �� ����������
-- %param p_areas - ������, �������� ��� �������,
--                  ������������� ���������� ����������
-- %param p_fk_id - FK_ID ����������

PROCEDURE PRESCRIPTION_AREAS(
    p_areas IN OUT CURSOR_TYPE, p_fk_id IN NUMBER);


-- �������� �������������������� ������� �� ����������
-- %param p_areas - ������, �������� �������������������� �������,
--                  ������������� ���������� ����������
-- %param p_fk_prescription_id - FK_ID ����������

PROCEDURE PHYSIOTHERAPY_MAP(
    p_areas IN OUT CURSOR_TYPE,
    p_fk_prescription_id IN tmatrix_templates.fk_prescription_id%TYPE);


-- ��������� ����� ������ ����� ����������
-- %param p_fk_prescription_id - ID ����������
-- %param p_fn_height - ������ �����������
-- %param p_fn_width - ������ �����������

FUNCTION ADD_MATRIX_TEMPLATE(
    p_fk_prescription_id IN tmatrix_templates.fk_prescription_id%TYPE,
    p_fn_height IN tmatrix_templates.fn_height%TYPE,
    p_fn_width IN tmatrix_templates.fn_width%TYPE
    ) RETURN NUMBER;


-- ���������� ������� ��� �������������������� �����.
-- %param p_fk_prescription_id - ID ����������
-- %param p_fk_area_id - ID ������� ����������
-- %param p_fn_left - ����� ���������� �������
-- %param p_fn_top - ������� ���������� �������
-- %param p_fn_right - ������ ���������� �������
-- %param p_fn_bottom - ������ ���������� �������

PROCEDURE ADD_PHYSIOTHERAPY_AREA(
    p_fk_prescription_id IN tmatrix_templates.fk_prescription_id%TYPE,
    p_fk_area_id IN tphysiotherapy_maps.fk_area_id%TYPE,
    p_fn_left IN tmatrix_sensors.fn_left%TYPE,
    p_fn_top IN tmatrix_sensors.fn_top%TYPE,
    p_fn_right IN tmatrix_sensors.fn_right%TYPE,
    p_fn_bottom IN tmatrix_sensors.fn_bottom%TYPE
    );


-- �������� ������� ��� �������������������� �����.
-- %param p_fk_prescription_id - ID ����������
-- %param p_fk_area_id - ID ������� ����������

PROCEDURE DELETE_PHYSIOTHERAPY_AREA(
    p_fk_prescription_id IN tmatrix_templates.fk_prescription_id%TYPE,
    p_fk_area_id IN tphysiotherapy_maps.fk_area_id%TYPE);


-- �������� ���� ��������, ������������� �������������������� �����.
-- %param p_fk_prescription_id - ID ����������

PROCEDURE DELETE_ALL_PHYSIOTHERAPY_AREAS(
    p_fk_prescription_id IN tmatrix_templates.fk_prescription_id%TYPE);


-- ��������� ����������� ������� �����
-- %param p_fk_id - fk_id �������
-- %param p_fb_display - ����������� ������� �����
-- %param p_fb_display_selected - ����������� ������� ���������� �����
-- %param p_fb_display_active - ����������� ������� �������� �����

PROCEDURE UPDATE_MAP_TEMPLATE(
    p_fk_id IN tmatrix_templates.fk_id%TYPE,
    p_fb_display IN tmatrix_templates.fb_display%TYPE,
    p_fb_display_selected IN tmatrix_templates.fb_display_selected%TYPE,
    p_fb_display_active IN tmatrix_templates.fb_display_active%TYPE);


-- ��������� ����������� ������� �����
-- %param p_fk_prescription_id - ID ����������
-- %param p_fn_height - ������ �����������
-- %param p_fn_width - ������ �����������
-- %param p_fb_display - ����������� ������� �����
-- %param p_fb_display_selected - ����������� ������� ���������� �����
-- %param p_fb_display_active - ����������� ������� �������� �����

PROCEDURE UPDATE_MAP_TEMPLATE(
    p_fk_prescription_id IN tmatrix_templates.fk_prescription_id%TYPE,
    p_fn_height IN tmatrix_templates.fn_height%TYPE,
    p_fn_width IN tmatrix_templates.fn_width%TYPE,
    p_fb_display IN tmatrix_templates.fb_display%TYPE,
    p_fb_display_selected IN tmatrix_templates.fb_display_selected%TYPE,
    p_fb_display_active IN tmatrix_templates.fb_display_active%TYPE);


-- ���� fk_id ������� ����� �� ����������.
-- %param p_fk_prescription_id - ID ����������

FUNCTION FIND_TMPL_BY_PRESCRIPTION_ID(
    p_fk_prescription_id IN tmatrix_templates.fk_prescription_id%TYPE
    ) RETURN NUMBER;

-- ��������� ����� ������ ������� ����� ����������
-- %param p_fk_template_id - ID ������� �����������
-- %param p_fn_left - ����� ���������� �������
-- %param p_fn_top - ������� ���������� �������
-- %param p_fn_right - ������ ���������� �������
-- %param p_fn_bottom - ������ ���������� �������
-- %param p_fn_work_mode - �������� ��� �� �������� ������

PROCEDURE ADD_MATRIX_SENSOR(
    p_fk_template_id IN tmatrix_sensors.fk_template_id%TYPE,
    p_fn_left IN tmatrix_sensors.fn_left%TYPE,
    p_fn_top IN tmatrix_sensors.fn_top%TYPE,
    p_fn_right IN tmatrix_sensors.fn_right%TYPE,
    p_fn_bottom IN tmatrix_sensors.fn_bottom%TYPE,
    p_fn_work_mode IN tmatrix_sensors.fn_work_mode%TYPE);


-- ������� ������� ������� ����� ����������
-- %param p_fk_template_id - ID ������� �����������

PROCEDURE DELETE_MATRIX_SENSORS(
    p_fk_template_id IN tmatrix_sensors.fk_template_id%TYPE);


-- �������� ������� �������������������� ���� ��� ������� �����,
-- ���������������� ���������� ����������.
-- %param p_fk_prescription_id - ID ����������

FUNCTION IS_EXIST_PHYSIOTHERAPY_MAPS(
    p_fk_prescription_id IN tmatrix_templates.fk_prescription_id%TYPE
    ) RETURN BOOLEAN;


-- �������� ������� ������� �������������������� ����� ��� ������� �����,
-- ���������������� ���������� ����������.
-- %param p_fk_prescription_id - ID ����������
-- %param p_fk_area_id - ID ������� ����������

FUNCTION IS_EXIST_MAP_AREA(
    p_fk_prescription_id IN tmatrix_templates.fk_prescription_id%TYPE,
    p_fk_area_id IN tphysiotherapy_maps.fk_area_id%TYPE
    ) RETURN BOOLEAN;


-- �������� ������� � ������� �������������������� ����� ��������,
-- ������������� ������ ��������.
-- %param p_fk_prescription_id - ID ����������
-- %param p_fn_left - ����� ���������� �������
-- %param p_fn_top - ������� ���������� �������
-- %param p_fn_right - ������ ���������� �������
-- %param p_fn_bottom - ������ ���������� �������

FUNCTION IS_EXIST_AREA_SENSOR(
    p_fk_prescription_id IN tmatrix_templates.fk_prescription_id%TYPE,
    p_fn_left IN tmatrix_sensors.fn_left%TYPE,
    p_fn_top IN tmatrix_sensors.fn_top%TYPE,
    p_fn_right IN tmatrix_sensors.fn_right%TYPE,
    p_fn_bottom IN tmatrix_sensors.fn_bottom%TYPE
    ) RETURN BOOLEAN;


-- ��������� �������� ������� ����� ����������.
-- %param p_fk_id - ID ������� ����������

FUNCTION GET_OWNER_AREA(
    p_fk_prescription_id IN tmatrix_templates.fk_prescription_id%TYPE
    ) RETURN NUMBER;


-- �������� �������� ����� ����������
-- %param p_fk_naz_id - ID ����������
-- %param p_fk_owner_area_id - ID ������ ������� ����� ����������

PROCEDURE DELETE_AREAS_FROM_TIB(
    p_fk_naz_id IN tib.fk_pacid%TYPE,
    p_fk_owner_area_id IN tib.fk_smeditid%TYPE);


-- ���������� ������� ����� ����������, ��������� �������������.
-- %param p_fk_area_id - ID ������� ����� ����������
-- %param p_fk_doctor_id - ID �����
-- %param p_fk_naz_id - ID ����������
-- %param p_fk_owner_area_id - ID ������ ������� ����� ����������

PROCEDURE ADD_AREA_TO_TIB(
    p_fk_area_id IN tib.fk_smid%TYPE,
    p_fk_doctor_id IN tib.fk_vrachid%TYPE,
    p_fk_naz_id IN tib.fk_pacid%TYPE,
    p_fk_owner_area_id IN tib.fk_smeditid%TYPE);

END; -- PKG_PHYSIOTHERAPY
/

SHOW ERRORS;


