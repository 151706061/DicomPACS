ALTER TABLE MED.TDPC 
 ADD (
  FK_TREBDPC NUMBER DEFAULT -1
 )
/
COMMENT ON COLUMN MED.TDPC.FK_TREBDPC IS 'ID из таблицы MED.TREB_DPC - связка затребовали-выдали (только для расхода по требованию)'
/
