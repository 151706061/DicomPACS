DROP FUNCTION ASU.GET_TEL_MOB_TYPE
/

--
-- GET_TEL_MOB_TYPE  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE FUNCTION ASU."GET_TEL_MOB_TYPE" return integer is

  -- ���������� tcontacts.type = 10 - ��� ��������� �������

begin
  return 10;  
end get_tel_mob_type;
/

SHOW ERRORS;


