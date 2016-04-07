DROP PACKAGE ASU.PKG_TRECIPE_PRINTED
/

--
-- PKG_TRECIPE_PRINTED  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_TRECIPE_PRINTED" is

  -- Author  : DELPHI5
  -- Created : 04.12.2006 9:43:19
  -- Purpose : ����� ��� ������� TRECIPE_PRINTED

PROCEDURE ADD_TRECIPE_PRINTED(
      pfk_trecipeid  IN   NUMBER,
      pfd_date       IN   DATE,
      pfn_print      IN   NUMBER default 1);
/*���������� ������ � ������� TRECIPE_PRINTED.*/

PROCEDURE EDIT_TRECIPE_PRINTED(
      pfk_trecipeid  IN   NUMBER,
      pfd_date       IN   DATE,
      pfn_print      IN   NUMBER);
/*�������������� ������ � ������� TRECIPE_PRINTED.*/

PROCEDURE DEL_TRECIPE_PRINTED(pfk_trecipeid IN NUMBER);
/*�������� ������ � ������� TRECIPE_PRINTED.*/

FUNCTION WAS_PRINTED(pfk_trecipeid  IN   NUMBER) RETURN NUMBER;
/*��������� ��� �� ���������� ���� ������ pfk_trecipeid.
�-�� ����������: ������� ��� ����������� ������ pfk_trecipeid.
                 0 - ������ pfk_trecipeid �� ����������*/


end PKG_TRECIPE_PRINTED;
/

SHOW ERRORS;


