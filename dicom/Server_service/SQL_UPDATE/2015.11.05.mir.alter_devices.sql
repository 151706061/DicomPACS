ALTER TABLE mypacs.devices
  ADD COLUMN fc_charset VARCHAR(21);

COMMENT ON COLUMN mypacs.devices.fc_charset
IS 'кодировка для возврата списка worklist';