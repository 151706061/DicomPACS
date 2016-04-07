DROP FUNCTION ASU.GET_MONEYSTR
/

--
-- GET_MONEYSTR  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE FUNCTION ASU."GET_MONEYSTR" (source IN NUMBER)
  RETURN VARCHAR2
IS
  result   VARCHAR2 (300);
/**********************************************/
/* функци€ сумма прописью в рубл€х и копейках */
/**********************************************/
BEGIN
  -- k - копейки
  result  := LTRIM (TO_CHAR (source, '9,9,,9,,,,,,9,9,,9,,,,,9,9,,9,,,,9,9,,9,,,.99')) || 'k';
  -- t - тыс€чи; m - милионы; M - миллиарды;
  result  := REPLACE (result, ',,,,,,', 'eM');
  result  := REPLACE (result, ',,,,,', 'em');
  result  := REPLACE (result, ',,,,', 'et');
  -- e - единицы; d - дес€тки; c - сотни;
  result  := REPLACE (result, ',,,', 'e');
  result  := REPLACE (result, ',,', 'd');
  result  := REPLACE (result, ',', 'c');
  --
  result  := REPLACE (result, '0c0d0et', '');
  result  := REPLACE (result, '0c0d0em', '');
  result  := REPLACE (result, '0c0d0eM', '');
  --
  result  := REPLACE (result, '0c', '');
  result  := REPLACE (result, '1c', 'сто ');
  result  := REPLACE (result, '2c', 'двести ');
  result  := REPLACE (result, '3c', 'триста ');
  result  := REPLACE (result, '4c', 'четыреста ');
  result  := REPLACE (result, '5c', 'п€тьсот ');
  result  := REPLACE (result, '6c', 'шестьсот ');
  result  := REPLACE (result, '7c', 'семьсот ');
  result  := REPLACE (result, '8c', 'восемьсот ');
  result  := REPLACE (result, '9c', 'дев€тьсот ');
  --
  result  := REPLACE (result, '1d0e', 'дес€ть ');
  result  := REPLACE (result, '1d1e', 'одиннадцать ');
  result  := REPLACE (result, '1d2e', 'двенадцать ');
  result  := REPLACE (result, '1d3e', 'тринадцать ');
  result  := REPLACE (result, '1d4e', 'четырнадцать ');
  result  := REPLACE (result, '1d5e', 'п€тнадцать ');
  result  := REPLACE (result, '1d6e', 'шестнадцать ');
  result  := REPLACE (result, '1d7e', 'семьнадцать ');
  result  := REPLACE (result, '1d8e', 'восемнадцать ');
  result  := REPLACE (result, '1d9e', 'дев€тнадцать ');
  --
  result  := REPLACE (result, '0d', '');
  result  := REPLACE (result, '2d', 'двадцать ');
  result  := REPLACE (result, '3d', 'тридцать ');
  result  := REPLACE (result, '4d', 'сорок ');
  result  := REPLACE (result, '5d', 'п€тьдес€т ');
  result  := REPLACE (result, '6d', 'шестьдес€т ');
  result  := REPLACE (result, '7d', 'семьдес€т ');
  result  := REPLACE (result, '8d', 'восемьдес€т ');
  result  := REPLACE (result, '9d', 'дев€носто ');
  --
  result  := REPLACE (result, '0e', '');
  result  := REPLACE (result, '5e', 'п€ть ');
  result  := REPLACE (result, '6e', 'шесть ');
  result  := REPLACE (result, '7e', 'семь ');
  result  := REPLACE (result, '8e', 'восемь ');
  result  := REPLACE (result, '9e', 'дев€ть ');
  --
  result  := REPLACE (result, '1e.', 'один рубль ');
  result  := REPLACE (result, '2e.', 'два рубл€ ');
  result  := REPLACE (result, '3e.', 'три рубл€ ');
  result  := REPLACE (result, '4e.', 'четыре рубл€ ');
  result  := REPLACE (result, '1et', 'одна тыс€ча ');
  result  := REPLACE (result, '2et', 'две тыс€чи ');
  result  := REPLACE (result, '3et', 'три тыс€чи ');
  result  := REPLACE (result, '4et', 'четыре тыс€чи ');
  result  := REPLACE (result, '1em', 'один миллион ');
  result  := REPLACE (result, '2em', 'два миллиона ');
  result  := REPLACE (result, '3em', 'три миллиона ');
  result  := REPLACE (result, '4em', 'четыре миллиона ');
  result  := REPLACE (result, '1eM', 'один милиард ');
  result  := REPLACE (result, '2eM', 'два милиарда ');
  result  := REPLACE (result, '3eM', 'три милиарда ');
  result  := REPLACE (result, '4eM', 'четыре милиарда ');
  --
  result  := REPLACE (result, '11k', '11 копеек');
  result  := REPLACE (result, '12k', '12 копеек');
  result  := REPLACE (result, '13k', '13 копеек');
  result  := REPLACE (result, '14k', '14 копеек');
  result  := REPLACE (result, '1k', '1 копейка');
  result  := REPLACE (result, '2k', '2 копейки');
  result  := REPLACE (result, '3k', '3 копейки');
  result  := REPLACE (result, '4k', '4 копейки');
  --
  IF NOT (SUBSTR (result, 1, 1) = '.') THEN
    result  := REPLACE (result, '.', ' рублeй ');
  ELSE
    result  := REPLACE (result, '.', 'ноль рублeй ');
  END IF;
  result  := REPLACE (result, 't', 'тыс€ч ');
  result  := REPLACE (result, 'm', 'миллионов ');
  result  := REPLACE (result, 'M', 'милиардов ');
  result  := REPLACE (result, 'k', ' копeeк');
  --
  RETURN (result);
END get_moneystr;
/

SHOW ERRORS;


