-- Add/modify columns 
alter table MED.TMO_GROUP add FK_PARENTID number;
-- Add comments to the columns 
comment on column MED.TMO_GROUP.FK_PARENTID
  is 'родительский узел';
-- Create/Recreate primary, unique and foreign key constraints 
alter table MED.TMO_GROUP
  add constraint FK_C_TMO_GROUP_PARENT foreign key (FK_PARENTID)
  references med.tmo_group (GROUPID);
