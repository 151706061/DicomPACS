ALTER TABLE MED.TUCHGR ADD ( FC_QUOTA_CODE_2 VARCHAR2 (2) )
/
COMMENT ON COLUMN MED.TUCHGR.FC_QUOTA_CODE_2 IS '��� ����� (2-�� ���� ����)'
/

update med.tuchgr set fc_quota_code_2 = '01' where UPPER(FC_UCHGR) = UPPER('��������������� ��������');
update med.tuchgr set fc_quota_code_2 = '02' where UPPER(FC_UCHGR) = UPPER('������� ������������ ����������');
update med.tuchgr set fc_quota_code_2 = '03' where UPPER(FC_UCHGR) = UPPER('������������ ��������');
update med.tuchgr set fc_quota_code_2 = '04' where UPPER(FC_UCHGR) = UPPER('����������� ����������');
update med.tuchgr set fc_quota_code_2 = '05' where UPPER(FC_UCHGR) = UPPER('������������� ��������');
update med.tuchgr set fc_quota_code_2 = '06' where UPPER(FC_UCHGR) = UPPER('��������� ��������');
update med.tuchgr set fc_quota_code_2 = '07' where UPPER(FC_UCHGR) = UPPER('��������� �������� �����������');
update med.tuchgr set fc_quota_code_2 = '08' where UPPER(FC_UCHGR) = UPPER('��������');
update med.tuchgr set fc_quota_code_2 = '09' where UPPER(FC_UCHGR) = UPPER('������ ��������');
update med.tuchgr set fc_quota_code_2 = '10' where UPPER(FC_UCHGR) = UPPER('����������� ��������');
update med.tuchgr set fc_quota_code_2 = '11' where UPPER(FC_UCHGR) = UPPER('���');
update med.tuchgr set fc_quota_code_2 = '12' where UPPER(FC_UCHGR) = UPPER('���������������, ���������������� ��������');
update med.tuchgr set fc_quota_code_2 = '13' where UPPER(FC_UCHGR) = UPPER('��������� ����������� �������, ���������� � �������� ��������');
update med.tuchgr set fc_quota_code_2 = '14' where UPPER(FC_UCHGR) = UPPER('������������ ������');
update med.tuchgr set fc_quota_code_2 = '15' where UPPER(FC_UCHGR) = UPPER('��������� �������� ������������ �������������');

commit;
