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
    
    -- Пытаемся получить номер дома, как число
    BEGIN
      NUM:=TO_NUMBER(HOUSE1);
    EXCEPTION WHEN OTHERS THEN
      -- В номере дома есть или буквы или дробь
      IDX:=INSTR(HOUSE1,'/');
      IF IDX>0 THEN 
        -- Если есть дробь - отбрасываем её и всё, что за ней
        HOUSE1:=SUBSTR(HOUSE1,1,IDX-1);
      END IF;
      -- отбрасываем любые буквы-индексы после номера дома
      HOUSE1:=TRANSLATE(HOUSE1,'0123456789АБВГДЕЁЖЗИКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ','0123456789');
      -- ещё раз пробуем получить номер дома, как число
      BEGIN
        NUM:=TO_NUMBER(HOUSE1);
      EXCEPTION WHEN OTHERS THEN
        -- глухая невезуха - пусть тогда номер будет нулём
        NUM:=0;
      END;
    END;

    -- Попадает ли вычисленый номер дома в проверяемый диапазон?
    IF NUM>=NUM_FROM AND NUM<=NUM_TO THEN
      -- Проверить - есть ли этот дом в исключениях
      HOUSE1:=SUBSTR(INP_STR,N,I-N);
      HOUSE2:=','||HOUSE1||',';
      K:=INSTR(TST_STR,HOUSE1); -- K>0 - существующий дом исключается из FROM-TO
    END IF;

    N:=I+1;
  EXIT WHEN K=0 OR I=L;
  END LOOP;
  IF K=0 THEN
    RESULT:=1; -- Есть пересечение
  END IF;  
  return(Result);
END HOUSES_INTERSECT_FROMTO;
/

SHOW ERRORS;


