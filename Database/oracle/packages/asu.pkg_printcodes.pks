DROP PACKAGE ASU.PKG_PRINTCODES
/

--
-- PKG_PRINTCODES  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_PRINTCODES" is

  -- Author  : NSV_VAMPIRE
  -- Created : 17.08.2006 11:02:55
  -- Purpose : ��� ������� TPRINTCODES

  procedure ADD_LASTNUM(pFD_DATE     in date,
                        pFN_LASTNUM  in number);
  /*��������� ���� � ����� ��������� ������������� ����� � TPRINTCODES*/

  procedure DELETE_NUM(pFK_ID    in number);
  /*������� ����� �� TPRINTCODES*/

  function GET_LASTNUM(pFD_DATE    in date) return number;
  /*�������� ����� ��������� ������������� ����� � ��������� ���  �� ������� TPRINTCODES*/

  function can_print(pFD_DATE   in date,
                     pFN_PROBA  in number)return number;
  /*�-�� ��������� ����� �� ����������� ����� � ������� pFN_PROBA � ����� pFD_DATE*/

end PKG_PRINTCODES;
/

SHOW ERRORS;


