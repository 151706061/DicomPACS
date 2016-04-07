DO $$
BEGIN

CREATE OR REPLACE FUNCTION mir.dicom_wl_buffer_trigger_after (
)
RETURNS trigger AS
$body$
    BEGIN
      update mir.dicom_wl_buffer t set oid=public.generate_uuid_v4(),
        create_date = now()
      where accessionnumber=new.accessionnumber
        and ((create_date is null) or (oid is null));
      return NEW;
    END;
$body$
LANGUAGE 'plpgsql'
VOLATILE
CALLED ON NULL INPUT
SECURITY INVOKER
COST 100;

END;
$$;


