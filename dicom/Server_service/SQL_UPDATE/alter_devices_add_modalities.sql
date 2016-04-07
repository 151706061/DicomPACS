ALTER TABLE mypacs.devices
  ADD COLUMN fc_mod VARCHAR(100);

COMMENT ON COLUMN mypacs.devices.fc_mod
IS 'список допустимых модальностей аппарата (через запятую)';