ALTER TABLE MED.TKARTCO_ITEM ADD ( FN_CUR_OST NUMBER )
/
COMMENT ON COLUMN MED.TKARTCO_ITEM.FN_CUR_OST IS 'остаток на текущий момент -  заполн€етс€ вручную из аптеки (обход нередактируемого запроса)'
/

quit
/
