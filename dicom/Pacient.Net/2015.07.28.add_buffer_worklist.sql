DO $$
BEGIN
  if not exists (SELECT 1
                   FROM information_schema.tables t
                  WHERE t.table_schema = 'mir'
                    and table_name='dicom_wlres_buffer'
                    and table_type='BASE TABLE') then
    CREATE TABLE mir.dicom_wlres_buffer (
      fdate timestamp,	
      accessionnumber VARCHAR(100),
      lpu VARCHAR(36)
    ) WITHOUT OIDS;

    COMMENT ON COLUMN mir.dicom_wlres_buffer.fdate 
    IS 'дата исследования';

    COMMENT ON COLUMN mir.dicom_wlres_buffer.accessionnumber
    IS 'номер протокола исследования';

    COMMENT ON COLUMN mir.dicom_wlres_buffer.lpu
    IS 'ЛПУ';

    CREATE INDEX dicom_wlres_buffer_idx1 ON mir.dicom_wlres_buffer
    USING btree (accessionnumber);

  end if;  

END;
$$