ALTER TABLE MED.TMEDIC ADD ( FC_QUOTA_CODE_234 VARCHAR2 (6) )
/
COMMENT ON COLUMN MED.TMEDIC.FC_QUOTA_CODE_234 IS '3 последние пары цифр кода квотирования'
/

update med.tmedic m set m.FC_QUOTA_CODE_234 = (select u.fc_quota_code_2 from med.tuchgr u where u.uchgrid = m.uchgrid );
update med.tmedic m set m.FC_QUOTA_CODE_234 = nvl(m.FC_QUOTA_CODE_234,'00')||'0000';
commit;
