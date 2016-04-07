DROP FUNCTION ASU.GET_IMG_DESCR_BY_ID_DMEDNAZ
/

--
-- GET_IMG_DESCR_BY_ID_DMEDNAZ  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE FUNCTION ASU."GET_IMG_DESCR_BY_ID_DMEDNAZ" 
-- Voronov 28.04.2009
-- Функция возвращает описание картинки из dMedNaz.dll frmMain.iType (TImageList)
-- Необходимо синхронизировать с asu.get_img_id_by_naz_dmednaz
  ( aIMG_id NUMBER)
  RETURN VARCHAR2 DETERMINISTIC IS

BEGIN
  IF (aIMG_id is null) then Return ''; end if;
  if      (aIMG_id = 2 ) then return 'Отменено';
    elsif (aIMG_id = 1 ) then return 'Назначено';
    elsif (aIMG_id = 4 ) then return 'Рекомендовано';
    elsif (aIMG_id = 0 ) then return 'Выполнено';
    elsif (aIMG_id = 3 ) then return 'Неотложное';
    elsif (aIMG_id = 17) then return 'Отменено и выдано';
    elsif (aIMG_id = 16) then return 'Назначено и выдано';
    elsif (aIMG_id = 19) then return 'Рекомендовано и выдано';
    elsif (aIMG_id = 15) then return 'Выполнено и выдано';
    elsif (aIMG_id = 18) then return 'Неотложное, выдано';
    elsif (aIMG_id = 14) then return 'Выдано';
    else return '';
  END if;
END;
/

SHOW ERRORS;


