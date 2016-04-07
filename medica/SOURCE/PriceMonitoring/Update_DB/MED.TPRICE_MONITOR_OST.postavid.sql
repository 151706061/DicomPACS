ALTER TABLE MED.TPRICE_MONITOR_OST ADD (postavid NUMBER)
/
COMMENT ON COLUMN MED.TPRICE_MONITOR_OST.postavid IS 'ссылка на med.tpostav.postavid - поставщик'
/
