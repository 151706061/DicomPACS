DROP PACKAGE BODY ASU.PKG_TRECIPE_PRINTED
/

--
-- PKG_TRECIPE_PRINTED  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_TRECIPE_PRINTED" is



PROCEDURE ADD_TRECIPE_PRINTED(
      pfk_trecipeid  IN   NUMBER,
      pfd_date       IN   DATE,
      pfn_print      IN   NUMBER default 1)
/*добавление записи в таблицу TRECIPE_PRINTED. Если рецепт распечатан, то увеличим
 на 1 поле fn_print кол-во распечатанных раз данного рецепта*/
IS
 vfn_print number :=0;
BEGIN
SELECT nvl(fn_print,0)
  INTO vfn_print
  FROM TRECIPE_PRINTED
  WHERE fk_trecipeid=pfk_trecipeid
    AND fn_print>0;

IF vfn_print>0 THEN
  UPDATE TRECIPE_PRINTED
    SET fk_trecipeid = pfk_trecipeid,
        fd_date = pfd_date,
        fn_print = fn_print + 1
    WHERE  fk_trecipeid = pfk_trecipeid;
ELSE
  INSERT INTO TRECIPE_PRINTED
    (fk_trecipeid,
     fd_date,
     fn_print)
   VALUES
    (pfk_trecipeid,
     pfd_date,
     pfn_print);
END IF;

EXCEPTION
  WHEN NO_DATA_FOUND THEN
    INSERT INTO TRECIPE_PRINTED
     (fk_trecipeid,
      fd_date,
      fn_print)
     VALUES
     (pfk_trecipeid,
      pfd_date,
      pfn_print);
END;


PROCEDURE EDIT_TRECIPE_PRINTED(
      pfk_trecipeid  IN   NUMBER,
      pfd_date       IN   DATE,
      pfn_print      IN   NUMBER)
/*редактирование записи в таблице TRECIPE_PRINTED.*/
IS
BEGIN
  UPDATE TRECIPE_PRINTED
    SET fk_trecipeid = pfk_trecipeid,
        fd_date = pfd_date,
        fn_print = pfn_print
    WHERE  fk_trecipeid = pfk_trecipeid;
END;

PROCEDURE DEL_TRECIPE_PRINTED(pfk_trecipeid IN NUMBER)
/*удаление записи в таблице TRECIPE_PRINTED.*/
IS
BEGIN
  DELETE FROM TRECIPE_PRINTED
    WHERE fk_trecipeid = pfk_trecipeid;
END;

FUNCTION WAS_PRINTED(pfk_trecipeid  IN   NUMBER) RETURN NUMBER
/*проверить был ли распечатан этот рецепт pfk_trecipeid.
Ф-ия возвращает: сколько раз распечатали рецепт pfk_trecipeid.
                 0 - рецепт pfk_trecipeid НЕ распечатан*/
IS
 vFN_RESULT number :=0;
BEGIN
SELECT nvl(fn_print,0)
  INTO vFN_RESULT
  FROM TRECIPE_PRINTED
  WHERE fk_trecipeid=pfk_trecipeid
    AND fn_print>0;

RETURN vFN_RESULT;

  EXCEPTION
    WHEN NO_DATA_FOUND THEN
     RETURN 0;
END;


begin
null;
end PKG_TRECIPE_PRINTED;
/

SHOW ERRORS;


