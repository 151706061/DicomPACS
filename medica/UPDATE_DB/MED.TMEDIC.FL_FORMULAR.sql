-- Add/modify columns 
alter table MED.TMEDIC add FL_FORMULAR NUMBER(1);
-- Add comments to the columns 
comment on column MED.TMEDIC.FL_FORMULAR
  is '������ � ������������ �������� (�����)';
