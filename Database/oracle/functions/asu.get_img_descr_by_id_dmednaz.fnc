DROP FUNCTION ASU.GET_IMG_DESCR_BY_ID_DMEDNAZ
/

--
-- GET_IMG_DESCR_BY_ID_DMEDNAZ  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE FUNCTION ASU."GET_IMG_DESCR_BY_ID_DMEDNAZ" 
-- Voronov 28.04.2009
-- ������� ���������� �������� �������� �� dMedNaz.dll frmMain.iType (TImageList)
-- ���������� ���������������� � asu.get_img_id_by_naz_dmednaz
  ( aIMG_id NUMBER)
  RETURN VARCHAR2 DETERMINISTIC IS

BEGIN
  IF (aIMG_id is null) then Return ''; end if;
  if      (aIMG_id = 2 ) then return '��������';
    elsif (aIMG_id = 1 ) then return '���������';
    elsif (aIMG_id = 4 ) then return '�������������';
    elsif (aIMG_id = 0 ) then return '���������';
    elsif (aIMG_id = 3 ) then return '����������';
    elsif (aIMG_id = 17) then return '�������� � ������';
    elsif (aIMG_id = 16) then return '��������� � ������';
    elsif (aIMG_id = 19) then return '������������� � ������';
    elsif (aIMG_id = 15) then return '��������� � ������';
    elsif (aIMG_id = 18) then return '����������, ������';
    elsif (aIMG_id = 14) then return '������';
    else return '';
  END if;
END;
/

SHOW ERRORS;


