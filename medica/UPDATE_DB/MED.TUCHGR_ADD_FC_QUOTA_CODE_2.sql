ALTER TABLE MED.TUCHGR ADD ( FC_QUOTA_CODE_2 VARCHAR2 (2) )
/
COMMENT ON COLUMN MED.TUCHGR.FC_QUOTA_CODE_2 IS 'код квоты (2-ая пара цифр)'
/

update med.tuchgr set fc_quota_code_2 = '01' where UPPER(FC_UCHGR) = UPPER('Дезинфекционные средства');
update med.tuchgr set fc_quota_code_2 = '02' where UPPER(FC_UCHGR) = UPPER('Изделия медицинского назначения');
update med.tuchgr set fc_quota_code_2 = '03' where UPPER(FC_UCHGR) = UPPER('Перевязочный материал');
update med.tuchgr set fc_quota_code_2 = '04' where UPPER(FC_UCHGR) = UPPER('Медицинский инструмент');
update med.tuchgr set fc_quota_code_2 = '05' where UPPER(FC_UCHGR) = UPPER('Лекарственные средства');
update med.tuchgr set fc_quota_code_2 = '06' where UPPER(FC_UCHGR) = UPPER('Расходный материал');
update med.tuchgr set fc_quota_code_2 = '07' where UPPER(FC_UCHGR) = UPPER('Расходный материал лабораторий');
update med.tuchgr set fc_quota_code_2 = '08' where UPPER(FC_UCHGR) = UPPER('Реактивы');
update med.tuchgr set fc_quota_code_2 = '09' where UPPER(FC_UCHGR) = UPPER('Шовный материал');
update med.tuchgr set fc_quota_code_2 = '10' where UPPER(FC_UCHGR) = UPPER('Контрастные средства');
update med.tuchgr set fc_quota_code_2 = '11' where UPPER(FC_UCHGR) = UPPER('ПКУ');
update med.tuchgr set fc_quota_code_2 = '12' where UPPER(FC_UCHGR) = UPPER('Экстемпоральные, спиртосодержащие растворы');
update med.tuchgr set fc_quota_code_2 = '13' where UPPER(FC_UCHGR) = UPPER('Расходная медицинская техника, вживляемая в организм человека');
update med.tuchgr set fc_quota_code_2 = '14' where UPPER(FC_UCHGR) = UPPER('Лабораторная посуда');
update med.tuchgr set fc_quota_code_2 = '15' where UPPER(FC_UCHGR) = UPPER('Расходный материал одноразового использования');

commit;
