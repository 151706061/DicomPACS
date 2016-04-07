DROP FUNCTION ASU.GET_SHORT_RUS_WORD
/

--
-- GET_SHORT_RUS_WORD  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE FUNCTION ASU."GET_SHORT_RUS_WORD" (str IN VARCHAR2, len IN NUMBER) RETURN VARCHAR2 IS
-- �reated 20060828 by Serg
-- ���������� ����������� �� �������� �������� ����� �����

  D VARCHAR2(32767);
  S VARCHAR2(20) := '�����Ũ������������';

BEGIN
FOR I IN len..NVL(LENGTH(str), 0) LOOP
  IF INSTR(S, SUBSTR(str, I, 1)) = 0 THEN -- ���� ������������ �� ���������
   D := SUBSTR(str, 1, I)||'.';
   EXIT;
  END IF;
END LOOP;

IF D IS NULL THEN -- ���� �� ����� ����� ������ �������, ���������� ��� �����
 D := str;
END IF;

RETURN D;
END;
/

SHOW ERRORS;


