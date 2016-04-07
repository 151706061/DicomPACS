-- очистка документов
delete from MED.TDOCS;
-- очистка партий
delete from MED.TKART;
-- очистка движений препаратов
delete from MED.TDPC;
-- очистка производства
delete from MED.TKARTCO_ITEM; 
delete from MED.TKARTCOMPOS;
delete from MED.TKARTCOMPOSITE;
-- очистка требований
delete from MED.TTREB;
delete from MED.TTREB_DPC;
-- очистка инвентаризации
delete from MED.TINVLIST;
delete from MED.TINVOPIS;
-- очистка групп мат. отв.
--delete from MED.TMO_GROUP;
--delete from MED.TMO_IN_GROUP;
--update MED.TMO set TMO.fk_curmogroupid = 0;
-- очистка минимального запаса
delete from NEOTLOZH.TMINZAPAS;

-- очищаем справочники
--delete from med.tmedic;
delete from med.tmedic222;
delete from med.TMEDICOMPLEX;

--drop table med.tmedic222;
--delete from med.tei;
--delete from med.tuchgr;
--delete from med.tmassunits;
--delete from med.tfarmgr;

--commit;

