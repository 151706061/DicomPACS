-- Start of DDL Script for Function MED.GET_DECODEDOCVIDMOVE
-- Generated 9-янв-2011 11:58:59 from MED@H100609

CREATE OR REPLACE 
FUNCTION     med.get_decodedocvidmove ( FP_VIDMOVE in NUMBER)
  RETURN  VARCHAR2 IS
BEGIN
  if FP_VIDMOVE = 1 THEN RETURN 'Накладная';
  elsif FP_VIDMOVE = 2 THEN RETURN 'Расход по требованию';
  elsif FP_VIDMOVE = 3 THEN RETURN 'Передача в отделение';
  elsif FP_VIDMOVE = 4 THEN RETURN 'В резерв';
  elsif FP_VIDMOVE = 5 THEN RETURN 'Из резерва';
--  elsif FP_VIDMOVE = 5 THEN RETURN 'Требование';
  elsif FP_VIDMOVE = 6 THEN RETURN 'Возврат в аптеку';
  elsif FP_VIDMOVE = 7 THEN RETURN 'Списание в РПО';
  elsif FP_VIDMOVE = 8 THEN RETURN 'Акт списания ТМЦ';
  elsif FP_VIDMOVE = 9 THEN RETURN 'Акт ввода остатков';
  elsif FP_VIDMOVE = 10 THEN RETURN 'Приход из РПО';
  elsif FP_VIDMOVE = 11 THEN RETURN 'Возврат поставщику';
  elsif FP_VIDMOVE = 12 THEN RETURN 'Отпуск по нац. проекту';
  elsif FP_VIDMOVE = 13 THEN RETURN 'Отпуск по цел. программам';
  elsif FP_VIDMOVE = 14 THEN RETURN 'Акт списания по высоким технологиям';
  else RETURN '';
  end if;
END;
/



-- End of DDL Script for Function MED.GET_DECODEDOCVIDMOVE

