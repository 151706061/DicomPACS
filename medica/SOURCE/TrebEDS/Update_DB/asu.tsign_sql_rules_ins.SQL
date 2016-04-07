INSERT INTO asu.tsign_sql_rules
("FC_SQL","FC_TABLE","FC_COMMENT")
VALUES
('select 
  TO_CHAR(t.fk_id)||''_''||TO_CHAR(t.fd_date,''dd.mm.yyyy'')||''_''||TO_CHAR(t.fk_motoid)||''_''||TO_CHAR(t.fk_mofromid)||''_''||TO_CHAR(t.fc_comment)||''_''||TO_CHAR(t.fk_mogroupid_from)||''_''||TO_CHAR(t.fk_mogroupid_to)||''_''||TO_CHAR(t.fl_cito)||''_''||
  (select asu.string_agg(''_''||TO_CHAR(dp.fk_medicid)||''_''||TO_CHAR(dp.fn_kol)) from med.ttreb_dpc dp where dp.fk_trebid = t.fk_id) as fc_str
from med.ttreb t
where t.fk_id = :pfk_id','med.ttreb1','ЭЦП зав. отделения для требования')
/
INSERT INTO asu.tsign_sql_rules
("FC_SQL","FC_TABLE","FC_COMMENT")
VALUES
('select 
  TO_CHAR(t.fk_id)||''_''||TO_CHAR(t.fd_date,''dd.mm.yyyy'')||''_''||TO_CHAR(t.fk_motoid)||''_''||TO_CHAR(t.fk_mofromid)||''_''||TO_CHAR(t.fc_comment)||''_''||TO_CHAR(t.fk_mogroupid_from)||''_''||TO_CHAR(t.fk_mogroupid_to)||''_''||TO_CHAR(t.fl_cito)||''_''||
  (select asu.string_agg(''_''||TO_CHAR(dp.fk_medicid)||''_''||TO_CHAR(dp.fn_kol)) from med.ttreb_dpc dp where dp.fk_trebid = t.fk_id) as fc_str
from med.ttreb t
where t.fk_id = :pfk_id','med.ttreb2','ЭЦП зам. главврача для требования')
/
INSERT INTO asu.tsign_sql_rules
("FC_SQL","FC_TABLE","FC_COMMENT")
VALUES
('select 
  TO_CHAR(t.fk_id)||''_''||TO_CHAR(t.fd_date,''dd.mm.yyyy'')||''_''||TO_CHAR(t.fk_motoid)||''_''||TO_CHAR(t.fk_mofromid)||''_''||TO_CHAR(t.fc_comment)||''_''||TO_CHAR(t.fk_mogroupid_from)||''_''||TO_CHAR(t.fk_mogroupid_to)||''_''||TO_CHAR(t.fl_cito)||''_''||
  (select asu.string_agg(''_''||TO_CHAR(dp.fk_medicid)||''_''||TO_CHAR(dp.fn_kol)) from med.ttreb_dpc dp where dp.fk_trebid = t.fk_id) as fc_str
from med.ttreb t
where t.fk_id = :pfk_id','med.ttreb3','ЭЦП начмеда для требования')
/
commit
/
