DROP FUNCTION ASU.FLOAT_NUMBER_TO_WORDS
/

--
-- FLOAT_NUMBER_TO_WORDS  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   INT_NUMBER_TO_WORDS (Function)
--
CREATE OR REPLACE FUNCTION ASU.float_number_to_words(aSource IN NUMBER,                         -- целое число
                               aRod IN NUMBER default 1,                  -- род - 1-мужской, 2-женский, 0-средний
                               aWordFor1 IN VARCHAR2 default null,        -- подпись дл€ цифр, оканчивающихс€ на 1 (например 'рубль')
                               aWordFor234 IN VARCHAR2 default null,      -- подпись дл€ цифр, оканчивающихс€ на 2,3,4 (например 'рубл€')
                               aWordFor567890_1x IN VARCHAR2 default null -- подпись дл€ всех остальных чисел, включа€ 11, 12, и т.д. (например 'рублей')
                            ) RETURN varchar2 IS
  result VARCHAR2(500);
  i  NUMBER;
  n NUMBER;
  DrobPart VARCHAR2(50);
BEGIN
  -- ‘орматируем входное число в хитрый строковый формат
  if TRUNC(aSource) = aSource then
    result := INT_NUMBER_TO_WORDS(aSource, aRod, aWordFor1, aWordFor234, aWordFor567890_1x);
  else
    result := INT_NUMBER_TO_WORDS(TRUNC(aSource), aRod, aWordFor1, aWordFor234, aWordFor567890_1x)||' ';

    DrobPart := ltrim(to_char((aSource-TRUNC(aSource)), '.99999'));
    DrobPart := replace( DrobPart, '.00000', ''); -- если нет дробной части
    DrobPart := Rtrim(SubStr(DrobPart,2, 5),'0');
    i := LENGTH(DrobPart);
    if i > 0 then
      n := TO_NUMBER(DrobPart);
      DrobPart := INT_NUMBER_TO_WORDS(n, 2);
      case
        WHEN i = 1 THEN result := result || INT_NUMBER_TO_WORDS(n, 2, 'дес€та€', 'дес€тых', 'дес€тых');
        WHEN i = 2 THEN result := result || INT_NUMBER_TO_WORDS(n, 2, 'сота€', 'сотых', 'сотых' );
        WHEN i = 3 THEN result := result || INT_NUMBER_TO_WORDS(n, 2, 'тыс€чна€', 'тыс€чных', 'тыс€чных');
        WHEN i = 4 THEN result := result || INT_NUMBER_TO_WORDS(n, 2, 'дес€титыс€чна€', 'дес€титыс€чных', 'дес€титыс€чных');
        WHEN i = 5 THEN result := result || INT_NUMBER_TO_WORDS(n, 2, 'стотыс€чна€', 'стотыс€чных', 'стотыс€чных');
      end case;
    end if;
  end if;
  -- ноль целых
  -- ноль рублей не пишем
  if ( (substr(trim(result),1,length(aWordFor1))=aWordFor1) or
       (substr(trim(result),1,length(aWordFor1))=aWordFor234) or
       (substr(trim(result),1,length(aWordFor1))=aWordFor567890_1x) )
     and (aWordFor234='целых')
  then
    result:='ноль '||result;
  end if;
  return result;
END FLOAT_NUMBER_TO_WORDS;
/

SHOW ERRORS;


