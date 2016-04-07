-- Start of DDL Script for Trigger ASU_ITEMS.TITEMS_AFTER_INS
-- Generated 30-ÌÓˇ-2008 18:51:58 from ASU_ITEMS@ASU

CREATE OR REPLACE TRIGGER asu_items.titems_after_ins
 AFTER
  INSERT
 ON asu_items.titems
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
/*  insert into med.tmedic m (FC_NAME, EIID, UCHGRID, FN_FPACKINUPACK, FK_FPACKID, FC_COMMENT, FL_EQUIPMENT, FK_TITEMS, FL_VISIBLE_FOR_NOT_APTEKA, FK_SKLAD_ID)
  select :NEW.FC_MODEL as FC_NAME
        ,(select max(eiid) from med.tei where UPPER(FC_NAME) like 'ÿ“%') as EIID
        ,(select max(uchgrid) from med.tuchgr where UPPER(FC_uchgr) like 'Œ¡Œ–”ƒŒ¬¿Õ»≈%') as UCHGRID
        ,1 as FN_FPACKINUPACK
        ,(select max(eiid) from med.tei where UPPER(FC_NAME) like 'ÿ“%') as FK_FPACKID
        ,:NEW.FC_IMPLEMENTATION as FC_COMMENT
        ,1 as FL_EQUIPMENT
        ,:NEW.FK_ID as FK_TITEMS
        ,0 as FL_VISIBLE_FOR_NOT_APTEKA
        ,(select max(FK_ID) from med.TSKLAD where FC_SYNONIM = 'IMN') as FK_SKLAD_ID
        from dual;
*/
  null;
end;
/


-- End of DDL Script for Trigger ASU_ITEMS.TITEMS_AFTER_INS

