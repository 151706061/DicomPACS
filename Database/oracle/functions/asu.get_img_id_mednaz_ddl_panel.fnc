DROP FUNCTION ASU.GET_IMG_ID_MEDNAZ_DDL_PANEL
/

--
-- GET_IMG_ID_MEDNAZ_DDL_PANEL  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   GET_NAZURGENT (Function)
--   GET_RECOMEND (Function)
--   GET_VIPNAZ (Function)
--
CREATE OR REPLACE FUNCTION ASU.GET_IMG_ID_MEDNAZ_DDL_PANEL
-- Voronov 27.04.2009
-- ������� ���������� ����� �������� �� dMedNaz.dll frmMain.iType (TImageList)
-- �������� ����� �� �������� ��� ��� � �������.
-- ���������� -1 � ������ ����� ��� ���������� �� ������� ���������� ������
-- ���������� ���������������� � asu.get_img_descr_by_id_dmednaz
  ( aCurDate DATE,
    aNaz_fk_State NUMBER,
    aSpisDate DATE,
    aNaz_fd_begin DATE,
    aNaz_fd_cancel DATE
     )
  RETURN NUMBER DETERMINISTIC IS

BEGIN
  IF (aCurDate is null)or(aNaz_fk_State is null) then Return -1; end if;
  IF (aSpisDate is null) THEN
    if /*(aNaz_fk_State = ASU.GET_NAZCANCEL)and*/(Trunc(aCurDate) = TRUNC(aNaz_fd_cancel)) then return 23;
    elsif
       /*(aNaz_fk_State = ASU.GET_NEVIP)and*/(Trunc(aCurDate) = TRUNC(aNaz_fd_begin)) then return 2;
    elsif
       (aNaz_fk_State = ASU.GET_RECOMEND) then return 89;
    elsif
       (aNaz_fk_State = ASU.GET_VIPNAZ) then return 1;
    elsif
       (aNaz_fk_State = ASU.GET_NAZURGENT) then return 3;
    else
      return -1;
    end if;
  ELSE
      -- 0 - ���������, 1 - ���������, 2 - ��������, 3 - �������, 4 - �������������,
    if /*(aNaz_fk_State = ASU.GET_NAZCANCEL)and*/(Trunc(aCurDate) = TRUNC(aNaz_fd_cancel)) then return 17;
    elsif
       /*(aNaz_fk_State = ASU.GET_NEVIP)and*/(Trunc(aCurDate) = TRUNC(aNaz_fd_begin)) then return 16;
    elsif
       (aNaz_fk_State = ASU.GET_RECOMEND) then return 19;
    elsif
       (aNaz_fk_State = ASU.GET_VIPNAZ) then return 15;
    elsif
       (aNaz_fk_State = ASU.GET_NAZURGENT) then return 18;
    else
      return 14;
    end if;
  END if;
  Return -1;
END;
/

SHOW ERRORS;


