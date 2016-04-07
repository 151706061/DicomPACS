DROP FUNCTION ASU.IS_PRIEMN_OTDEL
/

--
-- IS_PRIEMN_OTDEL  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSMINI (Table)
--
CREATE OR REPLACE FUNCTION ASU."IS_PRIEMN_OTDEL"
( pOtdelID IN NUMBER)
  RETURN  NUMBER IS
--
-- MODIFICATION HISTORY
-- Person      Date    Comments
-- ---------   ------  -------------------------------------------
-- Nefedov S.M. 19.05.2006  ���������� 1 ���� ������� ��� �������� ���������, 0 ���� ���
-- ---------   ------  -------------------------------------------
-- 2007.08.15  Zhukov ����� upper ����� ������ ����� ����������

CURSOR c IS
    SELECT to_number(fc_key) nOtdelID
    FROM tsmini
    where fc_section='CONFIG_PRIEMN_OTDEL_ID'
    and fc_value like '��� ��Ȩ����� ���������%';
    nFlg NUMBER;
BEGIN 
    nFlg:=0;
    FOR cCurs IN c LOOP
        if cCurs.nOtdelID > 0 then
            if cCurs.nOtdelID = pOtdelID then
                nFlg:=1;
            end if;
        end if;
    END LOOP;
    RETURN nFlg;
END;
/

SHOW ERRORS;


