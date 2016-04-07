-- Create/Recreate indexes 
drop index MED.PK_INVOPIS;
-- Create/Recreate primary, unique and foreign key constraints 
alter table MED.TINVOPIS
  add constraint TINVOPIS_PK primary key (INVOPISID);
alter table MED.TINVOPIS
  add constraint TINVLIST_TINVOPIS_INVLISTID_FK foreign key (INVLISTID)
  references MED.tinvlist (INVLISTID);
