-- Add/modify columns 
alter table MED.TPRODCERT add FL_FOREIGHN NUMBER(1) default 0 not null;
-- Add comments to the columns 
comment on column MED.TPRODCERT.FL_FOREIGHN
  is '1 - импортный производитель';
