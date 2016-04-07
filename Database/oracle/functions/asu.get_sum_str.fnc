DROP FUNCTION ASU.GET_SUM_STR
/

--
-- GET_SUM_STR  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE FUNCTION ASU."GET_SUM_STR" (Data IN NUMBER) RETURN VARCHAR2 IS
-- Спижжено by Linnikov 20080522
-- Функция формирования суммы прописью
-- На входе принимает числовое значение формата 123456789012.12
-- То есть не более 15 знаков в длину, вместе с разделителем
--         и дробной частью. Дробная часть может отсутствовать.
-- На выходе функции формируется строка с суммой прописью.
   Stmon  VARCHAR2(255); -- монтирует строку
   St VARCHAR2(15); -- вспомогательная переменная
--
   d1  VARCHAR2(3); -- три знака
--
   Tr1  VARCHAR2(1); -- сотни
   Tr2  VARCHAR2(1); -- десятки
   Tr3  VARCHAR2(1); -- единицы
--
  kop1  VARCHAR2(1); -- десятки копеек
  kop2  VARCHAR2(1); -- единицы копеек

BEGIN

-- {конвертация из флоат в строку}
  St:=substr((to_char(abs(data),'999999999990D00')),2,15);
  Stmon:=''; -- начальная инициализация монтирующей строки

FOR i IN 1..5 LOOP
-- {выделяем три цифры}
  d1:=SUBSTR(St,1,3);
  St:=substr(St,4,(length(St)-3));

-- {первая цифра из трёх}
  Tr1:=SUBSTR(d1,1,1);

-- {вторая цифра из трёх}
  Tr2:=SUBSTR(d1,2,1);

-- {третья цифра из трёх}
  Tr3:=SUBSTR(d1,3,1);

/*-------------------------------------------------------
              ОБРАБОТКА ЦЕЛОЙ ЧАСТИ ЧИСЛА (РУБЛЕЙ)
*/

-- обработка первой цифры
if i<>5 then
  IF Tr1='1' THEN Stmon:=Stmon||'сто ';
  END IF;
--
  IF Tr1='2' THEN Stmon:=Stmon||'двести ';
  END IF;
--
  IF Tr1='3' THEN Stmon:=Stmon||'триста';
  END IF;
--
  IF Tr1='4' THEN Stmon:=Stmon||'четыреста';
  END IF;
--
  IF Tr1='5' THEN Stmon:=Stmon||'пятьсот ';
  END IF;
--
  IF Tr1='6' THEN Stmon:=Stmon||'шестьсот ';
  END IF;
--
  IF Tr1='7' THEN Stmon:=Stmon||'семьсот ';
  END IF;
--
  IF Tr1='8' THEN Stmon:=Stmon||'восемьсот ';
  END IF;
--
  IF Tr1='9' THEN Stmon:=Stmon||'девятьсот ';
  END IF;

-- обработка 2 цифры
  IF Tr2='1' THEN
     IF Tr3='0' THEN Stmon:=Stmon||'десять ';
     END IF;
--
     If Tr3='1' THEN Stmon:=Stmon||'одиннадцать ';
     END IF;
--
     If Tr3='2' THEN Stmon:=Stmon||'двенадцать ';
     END IF;
--
     If Tr3='3' THEN Stmon:=Stmon||'тpинадцать ';
     END IF;
--
     If Tr3='4' THEN Stmon:=Stmon||'четыpнадцать ';
     END IF;
--
     If Tr3='5' THEN Stmon:=Stmon||'пятнадцать ';
     END IF;
--
     If Tr3='6' THEN Stmon:=Stmon||'шестнадцать ';
     END IF;
--
     If Tr3='7' THEN Stmon:=Stmon||'семнадцать ';
     END IF;
--
     If Tr3='8' THEN Stmon:=Stmon||'восемнадцать ';
     END IF;
--
     If Tr3='9' THEN Stmon:=Stmon||'девятнадцать ';
     END IF;
 END IF;
--
     If Tr2='2' then Stmon:=Stmon||'двадцать ';
     END IF;
--
     If Tr2='3' then Stmon:=Stmon||'тpидцать ';
     END IF;
--
     If Tr2='4' then Stmon:=Stmon||'соpок ';
     END IF;
--
     If Tr2='5' then Stmon:=Stmon||'пятьдесят ';
     END IF;
--
     If Tr2='6' then Stmon:=Stmon||'шестьдесят ';
     END IF;
--
     If Tr2='7' then Stmon:=Stmon||'семьдесят ';
     END IF;
--
     If Tr2='8' then Stmon:=Stmon||'восемьдесят ';
     END IF;
--
     If Tr2='9' then Stmon:=Stmon||'девяносто ';
     END IF;

-- обработка 3 цифры
  IF Tr2!='1' then
     If Tr3='1' and i!=3 then Stmon:=Stmon||'один ';
     END IF;
--
     If Tr3='1' and i=3 then Stmon:=Stmon||'одна ';
     END IF;
--
     If Tr3='2' and i!=3 then Stmon:=Stmon||'два ';
     END IF;
--
     If Tr3='2' and i=3 then Stmon:=Stmon||'две ';
     END IF;
--
     If Tr3='3' then Stmon:=Stmon||'тpи ';
     END IF;
--
     If Tr3='4' then Stmon:=Stmon||'четыpе ';
     END IF;
--
     If Tr3='5' then Stmon:=Stmon||'пять ';
     END IF;
--
     If Tr3='6' then Stmon:=Stmon||'шесть ';
     END IF;
--
     If Tr3='7' then Stmon:=Stmon||'семь ';
     END IF;
--
     If Tr3='8' then Stmon:=Stmon||'восемь ';
     END IF;
--
     If Tr3='9' then Stmon:=Stmon||'девять ';
     END IF;
 END IF;

/*-------------------------------------------------------
              ОБРАБОТКА МИЛЛИАРДОВ
*/
if i=1 then
  IF (Tr1=' ') And (Tr2=' ') And (Tr3=' ') then NULL;
  elsIf (Tr1='0') And (Tr2='0') And (Tr3='0') then NULL;
  elsif (Tr3='1') And (Tr2!='1') then Stmon:=Stmon||'миллиаpд ';
  elsif (Tr3='2' or Tr3='3' or Tr3='4')
         And (Tr2!='1') then Stmon:=Stmon||'миллиаpда ';
  else Stmon:=Stmon||'миллиаpдов ';
  END IF;
end if; -- КОНЕЦ ОБРАБОТКИ МИЛЛИАРДОВ

/*-------------------------------------------------------
              ОБРАБОТКА МИЛЛИОНОВ
*/
if i=2 then
  IF (Tr1=' ') And (Tr2=' ') And (Tr3=' ') then  NULL;
  elsIf (Tr1='0') And (Tr2='0') And (Tr3='0') then NULL;
  elsIf (Tr3='1') And (Tr2!='1') then Stmon:=Stmon||'миллион ';
  elsIf (Tr3='2' or Tr3='3' or Tr3='4')
         And (Tr2!='1') then Stmon:=Stmon||'миллиона ';
  else Stmon:=Stmon||'миллионов ';
  END IF;
end if;-- КОНЕЦ ОБРАБОТКИ МИЛЛИОНОВ

/*-------------------------------------------------------
              ОБРАБОТКА ТЫСЯЧ
*/
if i=3 then
  If (Tr1=' ') And (Tr2=' ') And (Tr3=' ') then NULL;
  elsIf (Tr1='0') And (Tr2='0') And (Tr3='0') then NULL;
  elsIf (Tr3='1') And (Tr2<>'1') then Stmon:=Stmon||'тысяча ';
  elsIf (Tr3='2' or Tr3='3' or Tr3='4')
         And (Tr2<>'1') then Stmon:=Stmon||'тысячи ';
  else Stmon:=Stmon||'тысяч ';
  END IF;
end if; -- КОНЕЦ ОБРАБОТКИ ТЫСЯЧ

/*-------------------------------------------------------
              ОБРАБОТКА СОТЕН
*/
if i=4 then
  IF (Tr1=' ') And (Tr2=' ') And (Tr3=' ') then NULL;
  elsif (Tr3='1') And (Tr2!='1') then Stmon:=Stmon||'pубль ';
  elsIf (Tr3='2' or Tr3='3' or Tr3='4')
         And (Tr2!='1') then Stmon:=Stmon||'pубля ';
  elsIf (Tr1=' ') And (Tr2=' ')
         And (Tr3='0') then Stmon:=Stmon||'ноль pублей ';
  else Stmon:=Stmon||'pублей ';
  END IF;
end if;-- КОНЕЦ ОБРАБОТКИ СОТЕН
--
end if;-- КОНЕЦ ОБРАБОТКИ ЦЕЛОЙ ЧАСТИ ЧИСЛА (РУБЛЕЙ)

/*-------------------------------------------------------
              ОБРАБОТКА КОПЕЕК
*/
if i=5 then
-- {выделение десятков}
  kop1:=SUBSTR(d1,2,1);

-- {выделение единиц}
  kop2:=SUBSTR(d1,3,1);

-- {добавление копеек к результирующей строке}
  Stmon:=Stmon||kop1||kop2||' ';

  If  (kop2='1') And (kop1!='1') then
       Stmon:=Stmon||'копейка';
     elsIf (kop2='2' or kop2='3' or kop2='4') And (kop1!='1') then
           Stmon:=Stmon||'копейки';
        else Stmon:=Stmon||'копеек';
  END IF;
end if;-- КОНЕЦ ОБРАБОТКИ КОПЕЕК

end loop;

-- преобразование первого симовла строки в прописную букву
  Stmon:=upper(SUBSTR(Stmon,1,1))||SUBSTR(Stmon,2,(Length(Stmon)-1));

  RETURN(Stmon);

END get_sum_str;
/

SHOW ERRORS;


