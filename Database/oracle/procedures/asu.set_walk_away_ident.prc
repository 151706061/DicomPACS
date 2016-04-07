DROP PROCEDURE ASU.SET_WALK_AWAY_IDENT
/

--
-- SET_WALK_AWAY_IDENT  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TANALIZATOR_COMPARISONS (Table)
--   TSMID (Table)
--   TBL_COMPARISONS (Table)
--
CREATE OR REPLACE PROCEDURE ASU."SET_WALK_AWAY_IDENT" (pname  asu.tsmid.fc_name%type,
                                                pident varchar2) is
  bak_lab_id      number := 789193;
  v_smid_name     asu.tsmid.fc_name%type;
  v_ident         varchar2(250);
  v_analizator_id number := 441;
  v_command       varchar2(250);
  v_id            number;
  v_child_id      number;
  v_naz_smid_id   number;
  cnt             number;
begin
  v_smid_name := pname;
  v_ident     := pident;
  for c in (select fk_id
              from asu.tsmid
             where fc_name = v_smid_name
            connect by prior fk_id = fk_owner
             start with fk_id = bak_lab_id) loop

    select max(fk_id)
      into v_naz_smid_id
      from asu.tsmid
     where fk_owner = bak_lab_id
    connect by prior fk_owner = fk_id
     start with fk_id = c.fk_id;
    if (v_naz_smid_id is not null) then
      v_command := trim(upper(v_ident || to_char(v_naz_smid_id)));
      select count(1)
      into cnt
      from asu.tbl_comparisons f
      where f.fk_lab_issl_id = c.fk_id and f.fc_apparat_issl_id = v_command;
      
      update asu.tsmid s set s.fc_answer = 'MTABLE_COMBO' where s.fk_id = c.fk_id; 
      
      if cnt = 0 then
        insert into asu.tbl_comparisons
          (fk_id,fk_profiles_id, fc_apparat_issl_id, fk_lab_issl_id)
        values
          ((select max(fk_id)+1 from asu.tbl_comparisons),-1, v_command, c.fk_id)
        returning fk_id into v_id;
        insert into asu.tanalizator_comparisons
          (fk_analizatorid, fk_comparisid, fc_command)
        values
          (v_analizator_id, v_id, v_command);

        for cc in (select fk_id,fc_name from asu.tsmid where fk_owner = c.fk_id) loop
--          v_command := trim(upper(v_ident || to_char(v_naz_smid_id) ||
--                                  cc.fc_name));
          v_command := trim(upper(cc.fc_name));

          insert into asu.tbl_comparisons
            (fk_id, fk_profiles_id, fc_apparat_issl_id, fk_lab_issl_id)
          values
            ((select max(fk_id)+1 from asu.tbl_comparisons),-1, v_command, cc.fk_id)
          returning fk_id into v_child_id;
          insert into asu.tanalizator_comparisons
            (fk_analizatorid, fk_comparisid, fc_command)
          values
            (v_analizator_id, v_child_id, v_command);
        end loop;
      end if;
    end if;
  end loop;
end;
/

SHOW ERRORS;


