ALTER TABLE MED.TMO_GROUP ADD ( FC_QUOTA_CODE_1 VARCHAR2 (2) )
/
COMMENT ON COLUMN MED.TMO_GROUP.FC_QUOTA_CODE_1 IS '��� ����� (1-�� ���� ����)'
/

update med.tmo_group set fc_quota_code_1 = '10' where UPPER(FC_GROUP) = UPPER('������������ ���� ���');
update med.tmo_group set fc_quota_code_1 = '11' where UPPER(FC_GROUP) = UPPER('��������� ��������������- ����������');
update med.tmo_group set fc_quota_code_1 = '12' where UPPER(FC_GROUP) = UPPER('������������������� ���������');
update med.tmo_group set fc_quota_code_1 = '13' where UPPER(FC_GROUP) = UPPER('��������� �������������������� ������� ����������� � �������');
update med.tmo_group set fc_quota_code_1 = '14' where UPPER(FC_GROUP) = UPPER('����������� ���������������� �����');
update med.tmo_group set fc_quota_code_1 = '15' where UPPER(FC_GROUP) = UPPER('��������-�����������');
update med.tmo_group set fc_quota_code_1 = '50' where UPPER(FC_GROUP) = UPPER('��������� �������������� �����������');
update med.tmo_group set fc_quota_code_1 = '51' where UPPER(FC_GROUP) = UPPER('������������� ��������� ���������������� ������');
update med.tmo_group set fc_quota_code_1 = '52' where UPPER(FC_GROUP) = UPPER('��������������� ��������� ���������������� ������');
update med.tmo_group set fc_quota_code_1 = '53' where UPPER(FC_GROUP) = UPPER('��������� �������������� �����������');
update med.tmo_group set fc_quota_code_1 = '54' where UPPER(FC_GROUP) = UPPER('����������������������� ���������');
update med.tmo_group set fc_quota_code_1 = '55' where UPPER(FC_GROUP) = UPPER('������������� �����������');
update med.tmo_group set fc_quota_code_1 = '56' where UPPER(FC_GROUP) = UPPER('������������������ �����������');
update med.tmo_group set fc_quota_code_1 = '57' where UPPER(FC_GROUP) = UPPER('������-������������ ������������');
update med.tmo_group set fc_quota_code_1 = '58' where UPPER(FC_GROUP) = UPPER('��������� ����������� ����������� � ������������');
update med.tmo_group set fc_quota_code_1 = '59' where UPPER(FC_GROUP) = UPPER('��������������� ���������');
update med.tmo_group set fc_quota_code_1 = '60' where UPPER(FC_GROUP) = UPPER('�������������-������������� �����');
update med.tmo_group set fc_quota_code_1 = '01' where UPPER(FC_GROUP) = UPPER('����� ������� �����');
commit;
