DROP PACKAGE BODY ASU.PKG_NEUROSOFT_LINK
/

--
-- PKG_NEUROSOFT_LINK  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_NEUROSOFT_LINK" 
IS

    -- Создать XML файл с назначением для загрузки в аппарат
    PROCEDURE prc_create_ip_xml_file(pfk_nazid IN NUMBER,pfk_smid IN NUMBER,pfk_pacid IN NUMBER) IS
    BEGIN
        o_neurosoft_link.prc_create_ip_xml_file(pfk_nazid, pfk_smid, pfk_pacid);
    END;


    -- Загрузить XML файл с результатами из аппарата
    PROCEDURE prc_load_op_xml_file (pdir IN VARCHAR2, pfile IN VARCHAR2) IS
    BEGIN
        o_neurosoft_link.prc_load_op_xml_file(pdir, pfile);
    END;


    -- Загрузить все данные из директории-связки
    PROCEDURE prc_load_data IS
    BEGIN
        o_neurosoft_link.prc_load_data;
    END;

END;
/

SHOW ERRORS;


