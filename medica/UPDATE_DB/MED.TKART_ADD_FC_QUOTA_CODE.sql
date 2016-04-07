ALTER TABLE MED.TKART ADD (FC_QUOTA_CODE VARCHAR2 (8) )
/
COMMENT ON COLUMN MED.TKART.FC_QUOTA_CODE IS 'код квотирования'
/
ALTER TABLE MED.TKART MODIFY (FC_QUOTA_CODE DEFAULT '00000000')
/

CREATE INDEX MED.TKART_FC_QUOTA_CODE ON MED.TKART
   (  FC_QUOTA_CODE ASC  ) 
 COMPUTE STATISTICS 
/

update med.tkart k
set k.fc_quota_code = (select max(m.fc_quota_code_234) 
                       from med.tmedic m 
                       where m.medicid = k.medicid);
                                
update med.tkart k
set k.fc_quota_code = '00'||nvl(k.fc_quota_code,'000000');

commit;
