-- Add/modify columns 
alter table MED.TMINZAPAS add fn_border number;
/
-- Add comments to the columns 
comment on column MED.TMINZAPAS.fn_border
  is '������� ��� ������������ � ����������� � ��� ������ - ��������� ��� ������ � �������� �������';

/

create index TMINZAPAS_idx01 on MED.TMINZAPAS (medicid, mogroupid);
/

