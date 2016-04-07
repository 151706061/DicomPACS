CREATE TABLE MED.TLINK_IMPNAKL
  (
  FK_ID NUMBER,
  FN_OUR_TABLE_NUM NUMBER,
  FK_OUR_KEY_FIELD_VALUE NUMBER,
  FK_POST_ID NUMBER,
  FN_THEIR_TABLE_NUM NUMBER,
  FK_THEIR_KEY_FIELD_VALUE NUMBER,
  FC_THEIR_VALUE VARCHAR2 (200)
 )
/
COMMENT ON TABLE MED.TLINK_IMPNAKL IS 
'Таблица для связывания наших таблиц и таблиц поставщиков. Воронов О.А. 30.04.2009'
/
COMMENT ON COLUMN MED.TLINK_IMPNAKL.FN_OUR_TABLE_NUM IS 'Условный номер таблиц, которые нужно будет связывать. 1 - MED.TPOSTAV, 2- MED.TMEDIC, 3 - MED.TEI'
/
COMMENT ON COLUMN MED.TLINK_IMPNAKL.FK_OUR_KEY_FIELD_VALUE IS 'значение ключевого поля нашей таблицы'
/
COMMENT ON COLUMN MED.TLINK_IMPNAKL.FK_POST_ID IS 'ID поставщика (MED.TPOSTAV.postavid), от которого приходит такая чудная накладная'
/
COMMENT ON COLUMN MED.TLINK_IMPNAKL.FN_THEIR_TABLE_NUM IS 'Условный номер таблицы поставщика (поставщики - медикаменты - 1, единицы измерения - 2 и т.д.)'
/
COMMENT ON COLUMN MED.TLINK_IMPNAKL.FK_THEIR_KEY_FIELD_VALUE IS 'Значение ключевого поля для значения (дает поставщик). Необязательное.'
/
COMMENT ON COLUMN MED.TLINK_IMPNAKL.FC_THEIR_VALUE IS 'Значения, которые поставщик упоминает в электронной накладной.'
/
-- Indexes for MED.TLINK_IMPNAKL

CREATE INDEX med.tlink_search_their_value ON med.tlink_impnakl
  (
    fn_our_table_num                ASC,
    fc_their_value                  ASC,
    fk_post_id                      ASC
  )
/

