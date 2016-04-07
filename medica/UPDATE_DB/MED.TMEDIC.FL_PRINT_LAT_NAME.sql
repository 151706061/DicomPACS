ALTER TABLE MED.TMEDIC 
 ADD (
  FL_PRINT_LAT_NAME NUMBER (1) DEFAULT 0
 )
/
COMMENT ON COLUMN MED.TMEDIC.FL_PRINT_LAT_NAME IS 'Печать латинских названий в отчетах (0 - русское, 1 - латинское)'
/
