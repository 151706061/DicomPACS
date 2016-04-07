ALTER TABLE MED.TMO_GROUP ADD ( FC_QUOTA_CODE_1 VARCHAR2 (2) )
/
COMMENT ON COLUMN MED.TMO_GROUP.FC_QUOTA_CODE_1 IS 'код квоты (1-ая пара цифр)'
/

update med.tmo_group set fc_quota_code_1 = '10' where UPPER(FC_GROUP) = UPPER('Операционный блок КХО');
update med.tmo_group set fc_quota_code_1 = '11' where UPPER(FC_GROUP) = UPPER('Отделение анестезиологии- реанимации');
update med.tmo_group set fc_quota_code_1 = '12' where UPPER(FC_GROUP) = UPPER('Кардиохирургическое отделение');
update med.tmo_group set fc_quota_code_1 = '13' where UPPER(FC_GROUP) = UPPER('Отделение рентгенхирургических методов диагностики и лечения');
update med.tmo_group set fc_quota_code_1 = '14' where UPPER(FC_GROUP) = UPPER('Центральный стерилизационный отдел');
update med.tmo_group set fc_quota_code_1 = '15' where UPPER(FC_GROUP) = UPPER('Экспресс-лаборатория');
update med.tmo_group set fc_quota_code_1 = '50' where UPPER(FC_GROUP) = UPPER('Отделение функциональной диагностики');
update med.tmo_group set fc_quota_code_1 = '51' where UPPER(FC_GROUP) = UPPER('Хирургическое отделение консультативного отдела');
update med.tmo_group set fc_quota_code_1 = '52' where UPPER(FC_GROUP) = UPPER('Терапевтическое отделение консультативного отдела');
update med.tmo_group set fc_quota_code_1 = '53' where UPPER(FC_GROUP) = UPPER('Отделение ультразвуковой диагностики');
update med.tmo_group set fc_quota_code_1 = '54' where UPPER(FC_GROUP) = UPPER('Рентгенодиагностическое отделение');
update med.tmo_group set fc_quota_code_1 = '55' where UPPER(FC_GROUP) = UPPER('Биохимическая лаборатория');
update med.tmo_group set fc_quota_code_1 = '56' where UPPER(FC_GROUP) = UPPER('Бактериологическая лаборатория');
update med.tmo_group set fc_quota_code_1 = '57' where UPPER(FC_GROUP) = UPPER('Медико-генетическая консультация');
update med.tmo_group set fc_quota_code_1 = '58' where UPPER(FC_GROUP) = UPPER('Отделение клинической иммунологии и аллергологии');
update med.tmo_group set fc_quota_code_1 = '59' where UPPER(FC_GROUP) = UPPER('Эндоскопическое отделение');
update med.tmo_group set fc_quota_code_1 = '60' where UPPER(FC_GROUP) = UPPER('Регистратурно-диспетчерский отдел');
update med.tmo_group set fc_quota_code_1 = '01' where UPPER(FC_GROUP) = UPPER('Отдел платных услуг');
commit;
