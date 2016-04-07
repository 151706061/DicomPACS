DROP FUNCTION ASU.GET_SYNID
/

--
-- GET_SYNID  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSMID (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_SYNID" (sConst_name IN VARCHAR2,lRaise IN NUMBER:=1)
  RETURN NUMBER
IS
--
-- Purpose: ��������� ���� �� ���� �� �������� ��� ��������
--
-- MODIFICATION HISTORY
-- Person      Date    Comments
-- ---------   ------  -------------------------------------------
--���        17.07.2000 ��������
--����       02.04.2001 �������� ��������, ���������, �������� �� ������: 0 - ���, 1 - ��.
  CURSOR c
  IS
    SELECT fk_id
      FROM tsmid
     WHERE fc_synonim = upper (sConst_name);--get_upper (sConst_name);
  nRes   NUMBER;
BEGIN
  OPEN c;
  FETCH c INTO nRes;
  IF c%NOTFOUND THEN
    CLOSE c;
    IF lRaise=1 THEN
      null;--raise_application_error (-20000, '�������  ' || get_upper (sConst_name) || ' �� ���������, ���������� ����������� �� � ������� TSMID ���� FC_SYNONIM');
    END IF;
    RETURN -1;
  END IF;
  RETURN nRes;
  CLOSE c;
END;   -- Function GET_CONST
/*
Function ASU.GET_SYNSMIDFROMTIB
  ( sConst in number,
    pFK_PACID in number)
  RETURN  number IS
-- Purpose: �������� ��� �������� �� ������� TIB
--
-- MODIFICATION HISTORY
-- Person      Date    Comments
-- ---------   ------  -------------------------------------------
cursor c is select fk_smid
            from tib
            where
              fk_pacid=pFK_PACID and
              fk_smeditid=get_synid(sConst);
nRes number;
BEGIN
  open c;
  fetch c into nRes;
  close c;
END; -- Function GET_SYNSMIDFROMTIB
*/
-- END PL/SQL BLOCK (do not remove this line) ----------------------------------
/

SHOW ERRORS;


