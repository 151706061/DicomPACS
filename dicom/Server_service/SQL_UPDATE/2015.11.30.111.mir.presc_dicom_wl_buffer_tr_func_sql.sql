DO $$
BEGIN

-- object recreation
DROP TRIGGER presc_dicom_update_tr ON mir.presc;

CREATE OR REPLACE FUNCTION mir.presc_dicom_wl_buffer_tr (
)
RETURNS trigger AS
$body$
  DECLARE
    v_id CHAR(36);
    v_modality varchar(10);
    v_dicom_pr varchar(1);
    v_studydescription varchar;
    v_firstname varchar(100);
    v_middlename varchar(100);
    v_lastname varchar(100);
    v_birthday DATE;
    v_sex NUMERIC;
    v_patientid varchar;
    vSexWL varchar(1);
    vPatientName varchar(200);
    vPatientNameENG varchar(200);
    vStudyUID varchar(100) ;
    vAccessionNumber varchar(100) ;
    vpresctypeoid CHAR(36);
    vpeopleoid CHAR(36);
    c record;
    vexists varchar(1);
  BEGIN
    if ( TG_OP = 'INSERT' ) or ( TG_OP = 'UPDATE' ) then
      v_dicom_pr = '0';
      -- цикл по курсору
      -- тип назначения
      for c in ( select nvl(p2.dicom_pr,'0') as dicom_pr,
        p2.modality, p2.name as studydescription,
        pl.firstname, pl.middlename, pl.lastname,
        pl.birthday, pl.sex,
        mir.mdoc_get_num(md.id) as patientid,
        p2.oid as presctypeoid,
        pl.oid as peopleoid
        from mir.presctype p2, mir.mdoc md, mir.people pl
        where p2.oid=new.presctype_id
        and md.id=new.mdoc_id and md.people_id=pl.oid )
      loop
        v_dicom_pr = c.dicom_pr ;
        v_modality = c.modality ;
        v_studydescription = c.studydescription ;
        v_firstname = c.firstname ;
        v_middlename = c.middlename ;
        v_lastname = c.lastname ;
        v_birthday = c.birthday ;
        v_sex = c.sex ;
        v_patientid = c.patientid ;
        vpresctypeoid = c.presctypeoid ;
        vpeopleoid = c.peopleoid ;
      end loop;
      --

      IF (v_dicom_pr='1') THEN

        v_id=new.id;

        delete from mir.dicom_wl_buffer t where t.prescid=v_id;

        vPatientName = v_firstname || ' ' || v_middlename || ' ' || v_lastname;
        vPatientNameENG = upper( replace(replace(replace(replace(
                          replace(replace(replace(replace(replace(replace(replace(replace(
                          replace(replace( translate(upper(vPatientName),
                          'абвгдезийклмнопрстуфхцъыьэАБВГДЕЗИЙКЛМНОПРСТУФХЦЪЫЬЭ',
                          'abvgdezijklmnoprstufhcjijeABVGDEZIJKLMNOPRSTUFHCJIJE'),
                          'ё', 'yo'),'ж', 'zh'),'ч', 'ch'),'ш', 'sh'),'щ', 'sch'),'ю', 'yu'),
                          'я', 'ya'),'Ё', 'Yo'),'Ж', 'Zh'),'Ч', 'Ch'),'Ш', 'Sh'),'Щ', 'Sch'),
                          'Ю', 'Yu'),'Я', 'Ya') );
        if (v_sex = '2')
        then
            vSexWL = 'M';
        else
            vSexWL = 'F';
        end if;
        --
        select trim(to_char(count(1)+1,'9999999999999')) into vAccessionNumber
          from mir.presc t where t.create_dt >= current_date
          and t.create_dt < current_date+1;
        --

     --   update mir.presc set accessionnumber=vAccessionNumber where id=new.id;
        vStudyUID = to_char(now(),'YYYY') || '.'  || to_char(now(),'MM') || '.' ||
                              to_char(now(),'DD') || '.' || to_char(now(),'HH24') || '.' ||
                              to_char(now(),'MI') || '.' || to_char(now(),'SS') || '.' ||
                              to_char(now(),'MS') || '.' || to_char(now(),'US') || trim(to_char(random(),'9.9999999999'));
        if new.accessionnumber is null then
          vAccessionNumber = to_char(now(),'YY') ||  to_char(now(),'MM') ||
                              to_char(now(),'DD') || '/' ||
                              vAccessionNumber;
          new.accessionnumber = vAccessionNumber;
        else
          vAccessionNumber = new.accessionnumber;
        end if;
        insert into mir.dicom_wl_buffer (
          studydescription, runbeg_dt, studyuid, accessionnumber,
          stationaetitle, modality, stationname, firstname,
          middlename, lastname, birthday, sex,
          patientid, patientname, patientnameeng, faction,
          prescid, presctypeid, patientoid, systext
        ) values (
          v_studydescription,
          new.prunbeg_dt,
          vStudyUID,
          vAccessionNumber,
          '', -- stationaetitle VARCHAR(100),
          v_modality,
          '', -- stationname VARCHAR(100),
          v_firstname,
          v_middlename,
          v_lastname,
          v_birthday,
          v_sex,
          v_patientid,
          vPatientName,
          vPatientNameENG,
          'trigger presc_dicom_wl_buffer_tr on mir.presc '||TG_OP||' action',
          v_id,
          vpresctypeoid,
          vpeopleoid,
          '' -- systext
        );
      end if;
      return NEW;
    else  -- DELETE
      v_dicom_pr = '0';
      -- цикл по курсору
      -- тип назначения
      for c in ( select nvl(p2.dicom_pr,'0') as dicom_pr,
        p2.modality, p2.name as studydescription,
        pl.firstname, pl.middlename, pl.lastname,
        pl.birthday, pl.sex,
        mir.mdoc_get_num(md.id) as patientid,
        p2.oid as presctypeoid,
        pl.oid as peopleoid
        from mir.presctype p2, mir.mdoc md, mir.people pl
        where p2.oid=old.presctype_id
        and md.id=old.mdoc_id and md.people_id=pl.oid )
      loop
        v_dicom_pr = c.dicom_pr ;
        v_modality = c.modality ;
        v_studydescription = c.studydescription ;
        v_firstname = c.firstname ;
        v_middlename = c.middlename ;
        v_lastname = c.lastname ;
        v_birthday = c.birthday ;
        v_sex = c.sex ;
        v_patientid = c.patientid ;
        vpresctypeoid = c.presctypeoid ;
        vpeopleoid = c.peopleoid ;
      end loop;
      --
      IF (v_dicom_pr='1') THEN
        v_id=old.id;
        delete from mir.dicom_wl_buffer t where t.prescid=v_id;
        insert into mir.dicom_wl_buffer (prescid, faction, accessionnumber)
          values (v_id, '-1', old.accessionnumber);
      end if;
      RETURN OLD;
    end if;
  EXCEPTION
  WHEN OTHERS THEN
    begin
      insert into mir.dicom_wl_log (
          studydescription,runbeg_dt,studyuid,
          accessionnumber,stationaetitle,modality,stationname,
          firstname,middlename,lastname,birthday,
          sex,patientid,patientname,patientnameeng,
          faction,systext,errorcode,
          errortext,prescid,presctypeid,patientoid
        ) values (
          v_studydescription,
          new.prunbeg_dt,
          vstudyuid,
          vAccessionNumber,
          '', -- stationaetitle VARCHAR(100),
          v_modality,
          '', -- stationname VARCHAR(100),
          v_firstname,
          v_middlename,
          v_lastname,
          v_birthday,
          v_sex,
          v_patientid,
          vPatientName,
          vPatientNameENG,
          'trigger presc_dicom_wl_buffer_tr on mir.presc '||TG_OP||' action',  -- action VARCHAR(100)
          '', -- systext VARCHAR(100),
          -1, -- errorcode NUMERIC,
          SQLERRM, -- errortext VARCHAR(100),
          new.id,
          vpresctypeoid,
          vpeopleoid
        );
      return NEW;
    exception when others then
      return NEW;
    end;
  END;
$body$
LANGUAGE 'plpgsql'
VOLATILE
CALLED ON NULL INPUT
SECURITY INVOKER
COST 100;

CREATE TRIGGER presc_dicom_update_tr
  BEFORE INSERT OR UPDATE OR DELETE
  ON mir.presc FOR EACH ROW
  EXECUTE PROCEDURE mir.presc_dicom_wl_buffer_tr();

END;
$$

