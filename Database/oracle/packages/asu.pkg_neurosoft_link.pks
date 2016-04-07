DROP PACKAGE ASU.PKG_NEUROSOFT_LINK
/

--
-- PKG_NEUROSOFT_LINK  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_NEUROSOFT_LINK" 
  IS

    -- ������� XML ���� � ����������� ��� �������� � �������
    PROCEDURE prc_create_ip_xml_file(pfk_nazid IN NUMBER,pfk_smid IN NUMBER,pfk_pacid IN NUMBER);

    -- ��������� XML ���� � ������������ �� ��������
    PROCEDURE prc_load_op_xml_file (pdir IN VARCHAR2, pfile IN VARCHAR2);

    -- ��������� ��� ������ �� ����������-������
    PROCEDURE prc_load_data;

END;
/

SHOW ERRORS;


