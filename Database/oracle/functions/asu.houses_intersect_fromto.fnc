DROP FUNCTION ASU.HOUSES_INTERSECT_FROMTO
/

--
-- HOUSES_INTERSECT_FROMTO  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE FUNCTION ASU."HOUSES_INTERSECT_FROMTO" (SRC_STR VARCHAR2, NUM_FROM NUMBER, NUM_TO NUMBER, CMP_STR VARCHAR2) return NUMBER is
  RESULT NUMBER;

  INP_STR VARCHAR2(1000);
  TST_STR VARCHAR2(1000);
  HOUSE1 VARCHAR2(10);
  HOUSE2 VARCHAR2(10);
  NUM INTEGER;
  I integer;
  N integer;
  K integer;
  L integer;
  IDX INTEGER;
BEGIN
  RESULT:=0;
  I:=1;
  N:=1;
  K:=1;
  TST_STR:=','||CMP_STR||',';
  INP_STR:=SRC_STR||',';
  L:=LENGTH(INP_STR);
  LOOP
    I:=INSTR(INP_STR,',',I+1); 
    HOUSE1:=SUBSTR(INP_STR,N,I-N);
    
    -- �������� �������� ����� ����, ��� �����
    BEGIN
      NUM:=TO_NUMBER(HOUSE1);
    EXCEPTION WHEN OTHERS THEN
      -- � ������ ���� ���� ��� ����� ��� �����
      IDX:=INSTR(HOUSE1,'/');
      IF IDX>0 THEN 
        -- ���� ���� ����� - ����������� � � ��, ��� �� ���
        HOUSE1:=SUBSTR(HOUSE1,1,IDX-1);
      END IF;
      -- ����������� ����� �����-������� ����� ������ ����
      HOUSE1:=TRANSLATE(HOUSE1,'0123456789�����Ũ�������������������������','0123456789');
      -- ��� ��� ������� �������� ����� ����, ��� �����
      BEGIN
        NUM:=TO_NUMBER(HOUSE1);
      EXCEPTION WHEN OTHERS THEN
        -- ������ �������� - ����� ����� ����� ����� ����
        NUM:=0;
      END;
    END;

    -- �������� �� ���������� ����� ���� � ����������� ��������?
    IF NUM>=NUM_FROM AND NUM<=NUM_TO THEN
      -- ��������� - ���� �� ���� ��� � �����������
      HOUSE1:=SUBSTR(INP_STR,N,I-N);
      HOUSE2:=','||HOUSE1||',';
      K:=INSTR(TST_STR,HOUSE1); -- K>0 - ������������ ��� ����������� �� FROM-TO
    END IF;

    N:=I+1;
  EXIT WHEN K=0 OR I=L;
  END LOOP;
  IF K=0 THEN
    RESULT:=1; -- ���� �����������
  END IF;  
  return(Result);
END HOUSES_INTERSECT_FROMTO;
/

SHOW ERRORS;


