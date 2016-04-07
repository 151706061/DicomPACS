CREATE TRIGGER xray_referral_dicom_tr
  AFTER INSERT OR UPDATE 
  ON mir.xray_referral FOR EACH ROW 
  EXECUTE PROCEDURE mir.xray_accessionnumber();

CREATE OR REPLACE FUNCTION mir.xray_accessionnumber (
)
RETURNS trigger AS
$body$
DECLARE
  vEditAN VARCHAR(100);
  vNEWAN VARCHAR(100);
  vAccessionNumber varchar(100) ;
BEGIN
  BEGIN
    select l.custvaluepar into vNEWAN
    from mir.lpusettings l, mir.systemsettings s 
    where s.oid=l.settings and s.param='IS_NEW_ACCESSIONNUMBER';
  EXCEPTION
  WHEN OTHERS THEN
    vNEWAN:='0';
  end;
  if (vNEWAN='1') THEN
    BEGIN
      select l.custvaluepar into vEditAN
      from mir.lpusettings l, mir.systemsettings s 
      where s.oid=l.settings and s.param='EDIT_ACCESSIONNUMBER';
    EXCEPTION
    WHEN OTHERS THEN
      vEditAN:='0';
    end;
    
    /*insert into mir.dicom_wl_log ( patientname,patientnameeng
        ) values ( 'vEditAN = '||vEditAN, 'vNEWAN = '||vNEWAN ); */
        
    if vEditAN='0' then -- если генерируется автоматически
      
      select p.accessionnumber 
      into vaccessionnumber
      from mir.presc p
      where p.xray_referral_id = new.oid;
      if vaccessionnumber is null then
        vaccessionnumber = to_char(now(),'YYYY') || '.' || to_char(now(),'MM')   || '.' ||
                           to_char(now(),'DD')   || '.' || to_char(now(),'HH24') || '.' ||
                           to_char(now(),'MI')   || '.' || to_char(now(),'SS')   || '.' ||
                           to_char(now(),'MS')   || '.' || to_char(now(),'US')   || 
                           trim(to_char(random(),'9.9999999999'));
      end if;
      if vNEWAN='1' then
        update mir.xray_referral l set l.referal_num=vaccessionnumber
        where p.xray_referral_id = new.oid;  
        update mir.presc p set p.accessionnumber=vaccessionnumber
        where p.xray_referral_id = new.oid;  
      else
        update mir.presc p set p.accessionnumber=new.referal_num
        where p.xray_referral_id = new.oid;  
      end if;
    END IF;
  END IF;
  return NEW;
EXCEPTION
  WHEN OTHERS THEN
    return NEW;
END;
$body$
LANGUAGE 'plpgsql'
VOLATILE
CALLED ON NULL INPUT
SECURITY INVOKER
COST 100;

