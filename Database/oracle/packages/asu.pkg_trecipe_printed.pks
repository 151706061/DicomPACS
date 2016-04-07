DROP PACKAGE ASU.PKG_TRECIPE_PRINTED
/

--
-- PKG_TRECIPE_PRINTED  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_TRECIPE_PRINTED" is

  -- Author  : DELPHI5
  -- Created : 04.12.2006 9:43:19
  -- Purpose : Пакет для таблицы TRECIPE_PRINTED

PROCEDURE ADD_TRECIPE_PRINTED(
      pfk_trecipeid  IN   NUMBER,
      pfd_date       IN   DATE,
      pfn_print      IN   NUMBER default 1);
/*добавление записи в таблицу TRECIPE_PRINTED.*/

PROCEDURE EDIT_TRECIPE_PRINTED(
      pfk_trecipeid  IN   NUMBER,
      pfd_date       IN   DATE,
      pfn_print      IN   NUMBER);
/*редактирование записи в таблице TRECIPE_PRINTED.*/

PROCEDURE DEL_TRECIPE_PRINTED(pfk_trecipeid IN NUMBER);
/*удаление записи в таблице TRECIPE_PRINTED.*/

FUNCTION WAS_PRINTED(pfk_trecipeid  IN   NUMBER) RETURN NUMBER;
/*проверить был ли распечатан этот рецепт pfk_trecipeid.
Ф-ия возвращает: сколько раз распечатали рецепт pfk_trecipeid.
                 0 - рецепт pfk_trecipeid НЕ распечатан*/


end PKG_TRECIPE_PRINTED;
/

SHOW ERRORS;


