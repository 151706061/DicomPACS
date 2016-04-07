-- ��������� ������� ������ � �������� 
alter table MED.TKART add UCHGRID number;

comment on column MED.TKART.UCHGRID
  is '������� ������ �� ���� ����������� ���������� ���������';
  
alter table MED.TKART
  add constraint TKART_TUCHGR_FK foreign key (UCHGRID)
  references med.tuchgr (UCHGRID);
    
-- ��������� ������ �� ������ ����
create index med.TKART_I_UCHGRID on MED.TKART (uchgrid);
