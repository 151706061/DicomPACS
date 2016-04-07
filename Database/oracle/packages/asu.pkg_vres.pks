DROP PACKAGE ASU.PKG_VRES
/

--
-- PKG_VRES  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_VRES" 
IS

-- MODIFICATION HISTORY
-- Andrew      11.04.2002
   FUNCTION get_nazproc_count (pnazid IN NUMBER, psmid IN NUMBER)
      RETURN NUMBER; -- ���������� ���������� �������� ������� ��������� � TNAZPARAM, �� ������ ����������.
   FUNCTION get_nazproc_mask (pnazid IN NUMBER, psmid IN NUMBER)
      RETURN VARCHAR2; -- ���������� ����� ����������� �������� �� ������ ����������.
   PROCEDURE Write_proccount (pnazid NUMBER, psmid NUMBER, pCount number);

   PROCEDURE insert_someproc (
      psmid     IN   NUMBER,
      ppacid    IN   NUMBER,
      pnazid    IN   NUMBER,
--      psosid    IN   NUMBER,
      pdayins        DATE
   ); --��������� ����������
   FUNCTION get_num_of_sunday
      RETURN NUMBER;
END;
/

SHOW ERRORS;


