DROP PROCEDURE ASU.TST_INSERT_BAKTERIA
/

--
-- TST_INSERT_BAKTERIA  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TANALIZATOR_COMPARISONS (Table)
--   TSMID (Table)
--   TBL_COMPARISONS (Table)
--
CREATE OR REPLACE PROCEDURE ASU."TST_INSERT_BAKTERIA" (pname varchar2,pOwner Number, pNazSmidID number) is
 -- bak_lab_id      number := 789193;
  v_smid_name     asu.tsmid.fc_name%type;
  v_analizator_id number := 441;
  v_command       varchar2(250);
  v_id            number;
  v_naz_smid_id   number;
  cnt             number;
  v_smidid        number;
begin
  v_smid_name := pname;

  select max(fk_id)
  into v_smidid
  from asu.tsmid
  where fk_owner = pOwner
  and fc_name = v_smid_name;

  if v_smidid is null then
    insert into asu.tsmid
      (fc_name, fk_owner)
    values
      (v_smid_name, pOwner) returning fk_id into v_smidid;
  end if;

    v_naz_smid_id := pNazSmidID;

    if (v_naz_smid_id is not null) then
      v_command := trim(v_smid_name || to_char(v_naz_smid_id));
      select count(1)
      into cnt
      from asu.tbl_comparisons f
      where f.fk_lab_issl_id = v_smidid and f.fc_apparat_issl_id = v_command;

      if cnt = 0 then
        insert into asu.tbl_comparisons
          (fk_id,fk_profiles_id, fc_apparat_issl_id, fk_lab_issl_id)
        values
          ((select max(fk_id)+1 from asu.tbl_comparisons),-1, v_command, v_smidid)
        returning fk_id into v_id;
        insert into asu.tanalizator_comparisons
          (fk_analizatorid, fk_comparisid, fc_command)
        values
          (v_analizator_id, v_id, v_command);
      end if;
    end if;

end;
/

SHOW ERRORS;


