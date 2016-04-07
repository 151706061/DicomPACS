DROP PROCEDURE ASU.FILL_TSMID_KONS_SPEC
/

--
-- FILL_TSMID_KONS_SPEC  (Procedure) 
--
--  Dependencies: 
--   TSMID (Table)
--   TSMID_KONS_SPEC (Table)
--
CREATE OR REPLACE PROCEDURE ASU.FILL_TSMID_KONS_SPEC IS
pragma autonomous_transaction; -- используется так же в выгрузке, поэтому таблицу нельзя блокировать
BEGIN
  delete from ASU.TSMID_KONS_SPEC;
  insert into ASU.TSMID_KONS_SPEC(FK_ID, FC_SYNONIM)
  SELECT ns.fk_id, NS.FC_SYNONIM
      FROM ASU.TSMID NS
     WHERE NS.FK_OWNER = (SELECT TS.FK_ID FROM ASU.TSMID TS WHERE TS.FC_SYNONIM = 'KONS_SPEC');
  commit;
end;
/

SHOW ERRORS;


