-- Add/modify columns 
alter table MED.TTREB add FL_EDIT number(1) default 1 not null;
-- Add comments to the columns 
comment on column MED.TTREB.FL_EDIT
  is '1 - редактируется, 0 - подписан';
