-- Add/modify columns 
alter table MED.TUCHGR add FC_SYNONIM VARCHAR2(50);
-- Add comments to the columns 
comment on column MED.TUCHGR.FC_SYNONIM
  is '������� (Added by Neronov A.S. 08.02.2011)';
  
commit;

update med.tuchgr set FC_SYNONIM = 'UCHGR_SPIRT' where FC_UCHGR = '������';
update med.tuchgr set FC_SYNONIM = 'UCHGR_VSPOMOG_MAT' where FC_UCHGR = '��������������� ��������';
update med.tuchgr set FC_SYNONIM = 'UCHGR_PEREVYAZ_MAT' where FC_UCHGR = '������������ ��������';
update med.tuchgr set FC_SYNONIM = 'UCHGR_EXTEMP_PREP' where FC_UCHGR = '��������������� ���������';
update med.tuchgr set FC_SYNONIM = 'UCHGR_RASH_ODNORAZ_MAT' where FC_UCHGR = '��������� ����.��������';

commit;
