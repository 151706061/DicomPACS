DROP PACKAGE ASU.PKG_PRINTCODES
/

--
-- PKG_PRINTCODES  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_PRINTCODES" is

  -- Author  : NSV_VAMPIRE
  -- Created : 17.08.2006 11:02:55
  -- Purpose : ДЛЯ ТАБЛИЦЫ TPRINTCODES

  procedure ADD_LASTNUM(pFD_DATE     in date,
                        pFN_LASTNUM  in number);
  /*Добавляем дату и номер последней распечатанной пробы в TPRINTCODES*/

  procedure DELETE_NUM(pFK_ID    in number);
  /*удаляем пробу из TPRINTCODES*/

  function GET_LASTNUM(pFD_DATE    in date) return number;
  /*Получить номер последней распечатанной пробы в указанном дне  ИЗ ТАБЛИЦЫ TPRINTCODES*/

  function can_print(pFD_DATE   in date,
                     pFN_PROBA  in number)return number;
  /*Ф-ия проверяет можно ли распечатать пробу с номером pFN_PROBA и датой pFD_DATE*/

end PKG_PRINTCODES;
/

SHOW ERRORS;


