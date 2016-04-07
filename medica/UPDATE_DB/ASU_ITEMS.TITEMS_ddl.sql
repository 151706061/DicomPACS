-- Start of DDL Script for Table ASU_ITEMS.TITEMS
-- Generated 1-дек-2008 8:28:56 from ASU_ITEMS@ASU
set define off
CREATE TABLE asu_items.titems
    (fk_id                          NUMBER NOT NULL,
    fk_room                        NUMBER,
    fk_types_of_item               NUMBER,
    fc_model                       VARCHAR2(40 BYTE),
    fc_implementation              VARCHAR2(40 BYTE),
    fc_tu                          VARCHAR2(20 BYTE),
    fn_registration_sertificate    NUMBER,
    fc_factory_number              NUMBER,
    fn_year                        NUMBER(4,0),
    fn_warranty                    NUMBER(2,0),
    fn_life_time                   NUMBER(2,0),
    fk_producer                    NUMBER,
    fc_counry                      VARCHAR2(20 BYTE),
    fk_supplier                    NUMBER,
    fn_inventory_number            NUMBER,
    fn_okof                        NUMBER(9,0),
    fd_income_date                 DATE,
    fd_implementation              DATE,
    fn_current_status              NUMBER(1,0),
    fn_using                       NUMBER(1,0),
    fn_need_change                 NUMBER(1,0),
    fd_write_off                   DATE,
    fc_write_off                   VARCHAR2(100 BYTE),
    fk_supporter                   NUMBER,
    fn_deleted                     NUMBER(1,0))
  PCTFREE     10
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  usr
  STORAGE   (
    INITIAL     65536
    MINEXTENTS  1
    MAXEXTENTS  2147483645
  )
  NOCACHE
  MONITORING
/

CREATE SEQUENCE asu_items.seq_items
  INCREMENT BY 1
  START WITH 1
  MINVALUE 1
  MAXVALUE 999999999999999999999999999
  NOCYCLE
  NOORDER
  CACHE 20
/

-- Indexes for ASU_ITEMS.TITEMS

CREATE UNIQUE INDEX asu_items.titems_by_fk_id ON asu_items.titems
  (
    fk_id                           ASC
  )
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  usr
  STORAGE   (
    INITIAL     65536
    MINEXTENTS  1
    MAXEXTENTS  2147483645
  )
NOLOGGING
/

-- Triggers for ASU_ITEMS.TITEMS

CREATE OR REPLACE TRIGGER asu_items.titems_before_insert
 BEFORE
  INSERT
 ON asu_items.titems
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
Begin
  select ASU_ITEMS.SEQ_ITEMS.nextval into :NEW.FK_ID from dual;
End;
/

CREATE OR REPLACE TRIGGER asu_items.titems_before_del
 BEFORE
  DELETE
 ON asu_items.titems
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
declare
  RecCount NUMBER;
begin
select count(1) as k into RecCount from
  (select k.kartid As FK_ID
  from med.tmedic m, med.tkart k
  where
      m.fk_titems = :OLD.FK_ID
  and k.medicid = m.medicid
UNION ALL
  SELECT t.fk_medicid As FK_ID
  from med.tmedic m, med.ttreb_dpc t
  where
      m.fk_titems = :OLD.FK_ID
  and t.fk_medicid = m.medicid);

  IF RecCount = 0 then
    delete from med.tmedic m where m.fk_titems = :OLD.FK_ID;
  else
    update med.tmedic m set m.fl_visible = 0 where m.fk_titems = :OLD.FK_ID;
  end if;
end;
/

CREATE OR REPLACE TRIGGER asu_items.titems_after_upd
 AFTER
  UPDATE
 ON asu_items.titems
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
--  update med.tmedic m
--  set FC_NAME = :NEW.FC_MODEL,
--      FL_EQUIPMENT = 1
--  where FK_TITEMS = :NEW.FK_ID;
 null;
end;
/

CREATE OR REPLACE TRIGGER asu_items.titems_after_ins
 AFTER
  INSERT
 ON asu_items.titems
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
/*  insert into med.tmedic m (FC_NAME, EIID, UCHGRID, FN_FPACKINUPACK, FK_FPACKID, FC_COMMENT, FL_EQUIPMENT, FK_TITEMS, FL_VISIBLE_FOR_NOT_APTEKA, FK_SKLAD_ID)
  select :NEW.FC_MODEL as FC_NAME
        ,(select max(eiid) from med.tei where UPPER(FC_NAME) like 'ШТ%') as EIID
        ,(select max(uchgrid) from med.tuchgr where UPPER(FC_uchgr) like 'ОБОРУДОВАНИЕ%') as UCHGRID
        ,1 as FN_FPACKINUPACK
        ,(select max(eiid) from med.tei where UPPER(FC_NAME) like 'ШТ%') as FK_FPACKID
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


-- Comments for ASU_ITEMS.TITEMS

COMMENT ON COLUMN asu_items.titems.fc_counry IS 'Страна происхождения'
/
COMMENT ON COLUMN asu_items.titems.fc_factory_number IS 'Заводской номер'
/
COMMENT ON COLUMN asu_items.titems.fc_implementation IS 'Исполнение'
/
COMMENT ON COLUMN asu_items.titems.fc_model IS 'Марка, модель'
/
COMMENT ON COLUMN asu_items.titems.fc_tu IS 'ТУ на изделие'
/
COMMENT ON COLUMN asu_items.titems.fc_write_off IS 'Причина списания'
/
COMMENT ON COLUMN asu_items.titems.fd_implementation IS 'Дата ввода в эксплуатацию'
/
COMMENT ON COLUMN asu_items.titems.fd_income_date IS 'Дата постановки на баланс'
/
COMMENT ON COLUMN asu_items.titems.fd_write_off IS 'Дата списания'
/
COMMENT ON COLUMN asu_items.titems.fk_id IS 'Поле, для индексации таблицы'
/
COMMENT ON COLUMN asu_items.titems.fk_producer IS 'Изготовитель. Ссылка на базу данных TCONTRACTORS'
/
COMMENT ON COLUMN asu_items.titems.fk_room IS 'Местоположение. Ссылка на таблиуц TROOM'
/
COMMENT ON COLUMN asu_items.titems.fk_supplier IS 'Поставщик. Ссылка на базу данных TCONTRACTORS'
/
COMMENT ON COLUMN asu_items.titems.fk_supporter IS 'Сервисное обслуживание. Ссылка на таблицу TCONTRACTORS'
/
COMMENT ON COLUMN asu_items.titems.fk_types_of_item IS 'Вид изделия. Ссылка на таблицу TTYPES_OF_ITEM'
/
COMMENT ON COLUMN asu_items.titems.fn_current_status IS 'Текущее состояние'
/
COMMENT ON COLUMN asu_items.titems.fn_deleted IS 'Признак удаления строки'
/
COMMENT ON COLUMN asu_items.titems.fn_inventory_number IS 'Инвентарный номер'
/
COMMENT ON COLUMN asu_items.titems.fn_life_time IS 'Срок службы (лет)'
/
COMMENT ON COLUMN asu_items.titems.fn_need_change IS 'Необходимость замены'
/
COMMENT ON COLUMN asu_items.titems.fn_okof IS 'Код по ОКОФ'
/
COMMENT ON COLUMN asu_items.titems.fn_registration_sertificate IS 'Номер регистрационного удостоверения'
/
COMMENT ON COLUMN asu_items.titems.fn_using IS 'Использование'
/
COMMENT ON COLUMN asu_items.titems.fn_warranty IS 'Гарантия (лет)'
/
COMMENT ON COLUMN asu_items.titems.fn_year IS 'Год выпуска'
/

grant select, insert, update, delete, references, index on ASU_ITEMS.TITEMS to med;

-- End of DDL Script for Table ASU_ITEMS.TITEMS

quit
/