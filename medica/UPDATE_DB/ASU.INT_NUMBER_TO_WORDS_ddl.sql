-- Start of DDL Script for Function ASU.INT_NUMBER_TO_WORDS
-- Generated 30-но€-2009 9:30:26 from ASU@ASU

CREATE OR REPLACE 
FUNCTION     asu.int_number_to_words (aSource IN NUMBER,                         -- целое число
                             aRod IN NUMBER default 1,                  -- род - 1-мужской, 2-женский, 0-средний
                             aWordFor1 IN VARCHAR2 default null,        -- подпись дл€ цифр, оканчивающихс€ на 1 (например 'рубль')
                             aWordFor234 IN VARCHAR2 default null,      -- подпись дл€ цифр, оканчивающихс€ на 2,3,4 (например 'рубл€')
                             aWordFor567890_1x IN VARCHAR2 default null -- подпись дл€ всех остальных чисел, включа€ 11, 12, и т.д. (например 'рублей')
                            ) RETURN varchar2 IS
  result VARCHAR2(500);
  i  NUMBER;
  s VARCHAR2(50);
  n NUMBER;
  n1 NUMBER;  
BEGIN
  -- ‘орматируем входное число в хитрый строковый формат
  result := ltrim(to_char(TRUNC(aSource), '9,9,,9,,,,,,9,9,,9,,,,,9,9,,9,,,,9,9,,9,,,.'));

  s := TO_CHAR(TRUNC(aSource)); -- определ€ем 2 последние цифры числа
  s := SUBSTR(s, Length(s)-1, 2);
  n := TO_NUMBER(s);
  n1 := (Trunc(  ((n / 10) - Trunc(n / 10))*10 ));
  result := replace( result, '.', 'r');
  -- t - тыс€чи; m - милионы; M - миллиарды;
  result := replace( result, ',,,,,,', 'eM');
  result := replace( result, ',,,,,', 'em');
  result := replace( result, ',,,,', 'et');
  -- e - единицы; d - дес€тки; c - сотни;
  result := replace( result, ',,,', 'e');
  result := replace( result, ',,', 'd');
  result := replace( result, ',', 'c');
  --
  result := replace( result, '0c0d0et', '');
  result := replace( result, '0c0d0em', '');
  result := replace( result, '0c0d0eM', '');

  -- «аменим вхождени€ форматированного представлени€ числа словесными формулировками
  result := replace( result, '0c', '');
  result := replace( result, '1c', 'сто ');
  result := replace( result, '2c', 'двести ');
  result := replace( result, '3c', 'триста ');
  result := replace( result, '4c', 'четыреста ');
  result := replace( result, '5c', 'п€тьсот ');
  result := replace( result, '6c', 'шестьсот ');
  result := replace( result, '7c', 'семьсот ');
  result := replace( result, '8c', 'восемьсот ');
  result := replace( result, '9c', 'дев€тьсот ');
  --
  result := replace( result, '1d0e', 'дес€ть ');
  result := replace( result, '1d1e', 'одиннадцать ');
  result := replace( result, '1d2e', 'двенадцать ');
  result := replace( result, '1d3e', 'тринадцать ');
  result := replace( result, '1d4e', 'четырнадцать ');
  result := replace( result, '1d5e', 'п€тнадцать ');
  result := replace( result, '1d6e', 'шестнадцать ');
  result := replace( result, '1d7e', 'семнадцать ');
  result := replace( result, '1d8e', 'восемнадцать ');
  result := replace( result, '1d9e', 'дев€тнадцать ');
  --
  result := replace( result, '0d', '');
  result := replace( result, '2d', 'двадцать ');
  result := replace( result, '3d', 'тридцать ');
  result := replace( result, '4d', 'сорок ');
  result := replace( result, '5d', 'п€тьдес€т ');
  result := replace( result, '6d', 'шестьдес€т ');
  result := replace( result, '7d', 'семьдес€т ');
  result := replace( result, '8d', 'восемьдес€т ');
  result := replace( result, '9d', 'дев€носто ');
  --
  result := replace( result, '1et', 'одна тыс€ча ');
  result := replace( result, '2et', 'две тыс€чи ');
  result := replace( result, '3et', 'три тыс€чи ');
  result := replace( result, '4et', 'четыре тыс€чи ');
  result := replace( result, '1em', 'один миллион ');
  result := replace( result, '2em', 'два миллиона ');
  result := replace( result, '3em', 'три миллиона ');
  result := replace( result, '4em', 'четыре миллиона ');
  result := replace( result, '1eM', 'один миллиард ');
  result := replace( result, '2eM', 'два миллиарда ');
  result := replace( result, '3eM', 'три миллиарда ');
  result := replace( result, '4eM', 'четыре миллиарда ');
  --
  result := replace( result, '0et', 't');
  result := replace( result, '0em', 'm');
  result := replace( result, '0eM', 'M');
  result := replace( result, '0er', 'r');

  --
  if aRod = 1 then
    result := replace( result, '1e', 'один ');
    result := replace( result, '2e', 'два ');
  elsif  aRod = 2 then
    result := replace( result, '1e', 'одна ');
    result := replace( result, '2e', 'две ');
  elsif  aRod = 0 then
    result := replace( result, '1e', 'одно ');
    result := replace( result, '2e', 'два ');
  end if;

  result := replace( result, '3e', 'три ');
  result := replace( result, '4e', 'четыре ');
  result := replace( result, '5e', 'п€ть ');
  result := replace( result, '6e', 'шесть ');
  result := replace( result, '7e', 'семь ');
  result := replace( result, '8e', 'восемь ');
  result := replace( result, '9e', 'дев€ть ');
  --
  result := replace( result, 't', 'тыс€ч ');
  result := replace( result, 'm', 'миллионов ');
  result := replace( result, 'M', 'миллиардов ');

  -- единицы измерени€
  if ((n<10) or (n>20)) and(n1 = 1) then
    result := replace( result, 'r', aWordFor1);
  elsif ((n<10) or (n>20)) and(n1 in(2,3,4))  then -- проверка что это не 10..20 и 
    result := replace( result, 'r', aWordFor234);
  else
    result := replace( result, 'r', aWordFor567890_1x);
  end if;

  -- ѕриведем первый символ выражени€ в верхний регистр
  RETURN result; -- (UPPER(SUBSTR(Result,1,1))||SUBSTR(Result,2));
END INT_NUMBER_TO_WORDS;
/



-- End of DDL Script for Function ASU.INT_NUMBER_TO_WORDS

