create or replace function asu.get_tnazis_mod(pid_tsmid asu.tsmid.fk_id%type)
  return varchar2 is
  vmod asu.tmodality.fc_name%type;
Begin
  select min(t4.fc_name)
    into vmod
    from asu.tsmid_modality t3, asu.tmodality t4
   where t4.fk_id = t3.fk_modality
     and t3.fk_smid = pid_tsmid;
  return vmod;
end;
