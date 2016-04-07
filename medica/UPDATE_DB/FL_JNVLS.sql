ALTER TABLE MED.TMEDIC ADD ( FL_JNVLS NUMBER (1) )
/
COMMENT ON COLUMN MED.TMEDIC.FL_JNVLS IS 'Жизненно необходимое и важнейшее лекарственное средство или изделие медицинского назначения'
/

ALTER TABLE MED.TKART ADD ( FL_JNVLS NUMBER (1) )
/
COMMENT ON COLUMN MED.TKART.FL_JNVLS IS 'Жизненно необходимое и важнейшее лекарственное средство или изделие медицинского назначения'
/
