DROP PACKAGE BODY ASU.PKG_PERESEL
/

--
-- PKG_PERESEL  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_PERESEL" 
IS
  --
  -- Purpose: ����������� ����� ��� ������ ������� � �������� �� ������� ASU.TPERESEL
  -- Author: Zhukov
  -- MODIFICATION HISTORY
  -- Person      Date    Comments
  -- ---------   ------  ------------------------------------------
  --  Zhukov 2009-11-18  ������ �����

  -- ����������� ��� ��� ���������� ������ ���������� ����
  TYPE v_karta_table_type
  IS
    TABLE OF NUMBER
      INDEX BY BINARY_INTEGER;

  v_karta_table   v_karta_table_type;

  -- ������� ������ ����
  PROCEDURE INIT_TABLES
  IS
  BEGIN
    v_karta_table.Delete;
  END INIT_TABLES;

  -------------------------------------------------------------------------------
  -- ��������� ����� � ������
  PROCEDURE ADD_karta_to_list (p_FK_KARTA IN INTEGER)
  IS
  BEGIN
--    v_karta_table (NVL (v_karta_table.LAST, 0) + 1) := p_FK_KARTA;
    v_karta_table (p_FK_KARTA) := p_FK_KARTA;
  END ADD_karta_to_list;

  -------------------------------------------------------------------------------
  -- ��� ��� ����� ������ ����, ����������� � v_karta_table ������������� ���� FK_ROOM
  PROCEDURE SET_TKARTA_FK_ROOM
  IS
    v_karta   PLS_INTEGER;
  BEGIN
    v_karta := v_karta_table.FIRST;

    LOOP
      EXIT WHEN v_karta IS NULL;

      --
      UPDATE   asu.tkarta
         SET   fk_room = PKG_REGIST_PACFUNC.GET_PAC_PALATAID (FK_ID)
       WHERE   FK_ID = v_karta;

      --

      v_karta := v_karta_table.NEXT (v_karta);
    END LOOP;
  END SET_TKARTA_FK_ROOM;
END;
/

SHOW ERRORS;


