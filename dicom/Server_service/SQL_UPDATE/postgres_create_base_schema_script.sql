DO $$
BEGIN


if not exists (SELECT * FROM information_schema.schemata t
                  WHERE t.schema_name = 'mypacs') then
  CREATE SCHEMA mypacs AUTHORIZATION asu;
end if;


-- --------------------------------------------
if not exists(
   SELECT 1 FROM information_schema.sequences t 
          where t.sequence_name='gen_conclusions_id' and t.sequence_schema='mypacs' )
then 
  CREATE SEQUENCE mypacs.gen_conclusions_id
    INCREMENT 1 MINVALUE 1
    MAXVALUE 9223372036854775807 START 1
    CACHE 1 CYCLE;
end if;  

if not exists(
   SELECT 1 FROM information_schema.sequences t 
          where t.sequence_name='gen_devices_id' and t.sequence_schema='mypacs' )
then 
  CREATE SEQUENCE mypacs.gen_devices_id
    INCREMENT 1 MINVALUE 1
    MAXVALUE 9223372036854775807 START 1
    CACHE 1;
end if;  

if not exists(
   SELECT 1 FROM information_schema.sequences t 
          where t.sequence_name='gen_diagnoz_id' and t.sequence_schema='mypacs' )
then 
  CREATE SEQUENCE mypacs.gen_diagnoz_id
    INCREMENT 1 MINVALUE 1
    MAXVALUE 9223372036854775807 START 1
    CACHE 1 CYCLE;
end if;  

if not exists(
   SELECT 1 FROM information_schema.sequences t 
          where t.sequence_name='gen_events_id' and t.sequence_schema='mypacs' )
then 
  CREATE SEQUENCE mypacs.gen_events_id
    INCREMENT 1 MINVALUE 1
    MAXVALUE 9223372036854775807 START 1
    CACHE 1;
end if;  

if not exists(
   SELECT 1 FROM information_schema.sequences t 
          where t.sequence_name='gen_events_rsnd_id' and t.sequence_schema='mypacs' )
then 
  CREATE SEQUENCE mypacs.gen_events_rsnd_id
    INCREMENT 1 MINVALUE 1
    MAXVALUE 9223372036854775807 START 1
    CACHE 1;
end if;  

if not exists(
   SELECT 1 FROM information_schema.sequences t 
          where t.sequence_name='gen_eventswl_id' and t.sequence_schema='mypacs' )
then 
  CREATE SEQUENCE mypacs.gen_eventswl_id
    INCREMENT 1 MINVALUE 1
    MAXVALUE 9223372036854775807 START 1
    CACHE 1;
end if;  

if not exists(
   SELECT 1 FROM information_schema.sequences t 
          where t.sequence_name='gen_hospitals_id' and t.sequence_schema='mypacs' )
then 
  CREATE SEQUENCE mypacs.gen_hospitals_id
    INCREMENT 1 MINVALUE 1
    MAXVALUE 9223372036854775807 START 1
    CACHE 1;
end if;  

if not exists(
   SELECT 1 FROM information_schema.sequences t 
          where t.sequence_name='gen_nuid' and t.sequence_schema='mypacs' )
then 
  CREATE SEQUENCE mypacs.gen_nuid
    INCREMENT 1 MINVALUE 1
    MAXVALUE 9223372036854775807 START 1
    CACHE 1 CYCLE;
end if;  

if not exists(
   SELECT 1 FROM information_schema.sequences t 
          where t.sequence_name='gen_rules_id' and t.sequence_schema='mypacs' )
then 
  CREATE SEQUENCE mypacs.gen_rules_id
    INCREMENT 1 MINVALUE 1
    MAXVALUE 9223372036854775807 START 1
    CACHE 1;
end if;  

if not exists(
   SELECT 1 FROM information_schema.sequences t 
          where t.sequence_name='gen_templates_id' and t.sequence_schema='mypacs' )
then 
  CREATE SEQUENCE mypacs.gen_templates_id
    INCREMENT 1 MINVALUE 1
    MAXVALUE 9223372036854775807 START 1
    CACHE 1;
end if;  

if not exists(
   SELECT 1 FROM information_schema.sequences t 
          where t.sequence_name='gen_users_id' and t.sequence_schema='mypacs' )
then 
  CREATE SEQUENCE mypacs.gen_users_id
    INCREMENT 1 MINVALUE 1
    MAXVALUE 9223372036854775807 START 1
    CACHE 1;
end if;  

if not exists(
   SELECT 1 FROM information_schema.sequences t 
          where t.sequence_name='gen_worklist_id' and t.sequence_schema='mypacs' )
then 
  CREATE SEQUENCE mypacs.gen_worklist_id
    INCREMENT 1 MINVALUE 1
    MAXVALUE 9223372036854775807 START 1
    CACHE 1;
end if;  

-- --------------------------------------------
-- --------------------------------------------
-- --------------------------------------------
DROP FUNCTION IF EXISTS "mypacs"."f_conclusions"() CASCADE;
CREATE OR REPLACE FUNCTION mypacs.f_conclusions (
)
RETURNS trigger AS
$body$
BEGIN
  if new.fk_id is null then
    new.fk_id=nextval('mypacs.gen_conclusions_id');
  end if;
  RETURN new;
END;
$body$
LANGUAGE 'plpgsql'
VOLATILE
CALLED ON NULL INPUT
SECURITY INVOKER
COST 100;

-- --------------------------------------------
DROP FUNCTION IF EXISTS "mypacs"."f_devices"() CASCADE;
CREATE OR REPLACE FUNCTION mypacs.f_devices (
)
RETURNS trigger AS
$body$
BEGIN
  if new.fk_id is null then
    new.fk_id=nextval('mypacs.gen_devices_id');
  end if;
  RETURN new;
END;
$body$
LANGUAGE 'plpgsql'
VOLATILE
CALLED ON NULL INPUT
SECURITY INVOKER
COST 100;

-- --------------------------------------------
DROP FUNCTION IF EXISTS "mypacs"."f_diagnoz"() CASCADE;
CREATE OR REPLACE FUNCTION mypacs.f_diagnoz (
)
RETURNS trigger AS
$body$
BEGIN
  if new.fk_id is null then
    new.fk_id=nextval('mypacs.gen_diagnoz_id');
  end if;
  RETURN new;
END;
$body$
LANGUAGE 'plpgsql'
VOLATILE
CALLED ON NULL INPUT
SECURITY INVOKER
COST 100;

-- --------------------------------------------
DROP FUNCTION IF EXISTS "mypacs"."f_events"() CASCADE;
CREATE OR REPLACE FUNCTION mypacs.f_events (
)
RETURNS trigger AS
$body$
BEGIN
  if new.fk_id is null then
    new.fk_id=nextval('mypacs.gen_events_id');
  end if;
  RETURN new;
END;
$body$
LANGUAGE 'plpgsql'
VOLATILE
CALLED ON NULL INPUT
SECURITY INVOKER
COST 100;

-- --------------------------------------------
DROP FUNCTION IF EXISTS "mypacs"."f_events_rsnd_del"() CASCADE;
CREATE OR REPLACE FUNCTION mypacs.f_events_rsnd_del (
)
RETURNS trigger AS
$body$
BEGIN
  delete from mypacs.events_rsnd_err_lst where fk_id_rsnd=old.fk_id;
  RETURN new;
END;
$body$
LANGUAGE 'plpgsql'
VOLATILE
CALLED ON NULL INPUT
SECURITY INVOKER
COST 100;

-- --------------------------------------------
DROP FUNCTION IF EXISTS "mypacs"."f_events_rsnd_ins"() CASCADE;
CREATE OR REPLACE FUNCTION mypacs.f_events_rsnd_ins (
)
RETURNS trigger AS
$body$
BEGIN
  if new.fk_id is null then
    new.fk_id=nextval('mypacs.gen_events_rsnd_id');
  end if;
  RETURN new;
END;
$body$
LANGUAGE 'plpgsql'
VOLATILE
CALLED ON NULL INPUT
SECURITY INVOKER
COST 100;

-- --------------------------------------------
DROP FUNCTION IF EXISTS "mypacs"."f_events_wl"() CASCADE;
CREATE OR REPLACE FUNCTION mypacs.f_events_wl (
)
RETURNS trigger AS
$body$
BEGIN
  if new.fk_id is null then
    new.fk_id=nextval('mypacs.gen_eventswl_id');
  end if;
  RETURN new;
END;
$body$
LANGUAGE 'plpgsql'
VOLATILE
CALLED ON NULL INPUT
SECURITY INVOKER
COST 100;

-- --------------------------------------------
DROP FUNCTION IF EXISTS "mypacs"."f_hospitals"() CASCADE;
CREATE OR REPLACE FUNCTION mypacs.f_hospitals (
)
RETURNS trigger AS
$body$
BEGIN
  if new.p_id is null then
    new.p_id=nextval('mypacs.gen_hospitals_id');
  end if;
  RETURN new;
END;
$body$
LANGUAGE 'plpgsql'
VOLATILE
CALLED ON NULL INPUT
SECURITY INVOKER
COST 100;

-- --------------------------------------------
DROP FUNCTION IF EXISTS "mypacs"."f_patients_dl"() CASCADE;
CREATE OR REPLACE FUNCTION mypacs.f_patients_dl (
)
RETURNS trigger AS
$body$
BEGIN
  delete from mypacs.studies where p_pid = old.p_pid;
  RETURN new;
END;
$body$
LANGUAGE 'plpgsql'
VOLATILE
CALLED ON NULL INPUT
SECURITY INVOKER
COST 100;

-- --------------------------------------------
DROP FUNCTION IF EXISTS "mypacs"."f_rules"() CASCADE;
CREATE OR REPLACE FUNCTION mypacs.f_rules (
)
RETURNS trigger AS
$body$
BEGIN
  if new.fk_id is null then
    new.fk_id=nextval('mypacs.gen_rules_id');
  end if;
  RETURN new;
END;
$body$
LANGUAGE 'plpgsql'
VOLATILE
CALLED ON NULL INPUT
SECURITY INVOKER
COST 100;

-- --------------------------------------------
DROP FUNCTION IF EXISTS "mypacs"."f_studies_bd"() CASCADE;
CREATE OR REPLACE FUNCTION mypacs.f_studies_bd (
)
RETURNS trigger AS
$body$
BEGIN
  delete from mypacs.series where studyuid = old.studyuid;
  delete from mypacs.images where studyuid = old.studyuid;
  RETURN new;
END;
$body$
LANGUAGE 'plpgsql'
VOLATILE
CALLED ON NULL INPUT
SECURITY INVOKER
COST 100;

-- --------------------------------------------
DROP FUNCTION IF EXISTS "mypacs"."f_templates"() CASCADE;
CREATE OR REPLACE FUNCTION mypacs.f_templates (
)
RETURNS trigger AS
$body$
BEGIN
  if new.fk_id is null then
    new.fk_id=nextval('mypacs.gen_templates_id');
    new.fn_is_del = 0;
  end if;
  RETURN new;
END;
$body$
LANGUAGE 'plpgsql'
VOLATILE
CALLED ON NULL INPUT
SECURITY INVOKER
COST 100;

-- --------------------------------------------
DROP FUNCTION IF EXISTS "mypacs"."f_users"() CASCADE;
CREATE OR REPLACE FUNCTION mypacs.f_users (
)
RETURNS trigger AS
$body$
BEGIN
  if new.fk_id is null then
    new.fk_id=nextval('mypacs.gen_users_id');
    new.fn_del = 0;
  end if;
  RETURN new;
END;
$body$
LANGUAGE 'plpgsql'
VOLATILE
CALLED ON NULL INPUT
SECURITY INVOKER
COST 100;

-- --------------------------------------------
DROP FUNCTION IF EXISTS "mypacs"."f_worklist"() CASCADE;
CREATE OR REPLACE FUNCTION mypacs.f_worklist (
)
RETURNS trigger AS
$body$
BEGIN
  if new.fk_id is null then
    new.fk_id=nextval('mypacs.gen_worklist_id');
  end if;
  RETURN new;
END;
$body$
LANGUAGE 'plpgsql'
VOLATILE
CALLED ON NULL INPUT
SECURITY INVOKER
COST 100;

-- --------------------------------------------

-- --------------------------------------------
-- --------------------------------------------
-- --------------------------------------------
if not exists( SELECT 1 FROM information_schema.tables t 
                 where t.table_schema = 'mypacs' and t.table_name='applytable' )
then
  CREATE TABLE mypacs.applytable (
    idfield VARCHAR(64) NOT NULL, 
    namefield VARCHAR(100), 
    enamefield VARCHAR(100), 
    apply_time TIMESTAMP WITHOUT TIME ZONE, 
    uidfield VARCHAR(70), 
    birthdatefield TIMESTAMP WITHOUT TIME ZONE, 
    sexfield VARCHAR(4), 
    doctorfield VARCHAR(16), 
    descfield VARCHAR(40), 
    bstate INTEGER, 
    prof INTEGER, 
    ward VARCHAR(16), 
    modality VARCHAR(10), 
    p_pid VARCHAR(20), 
    accessionnumber VARCHAR(100), 
    bodypart VARCHAR(30), 
    CONSTRAINT applytable_pkey PRIMARY KEY(idfield)
  ) WITHOUT OIDS;

  COMMENT ON COLUMN mypacs.applytable.idfield
  IS 'уникальный id записи';

  COMMENT ON COLUMN mypacs.applytable.namefield
  IS 'фио (eng)';

  COMMENT ON COLUMN mypacs.applytable.enamefield
  IS 'фио (rus)';

  COMMENT ON COLUMN mypacs.applytable.apply_time
  IS 'дата,время исследования';

  COMMENT ON COLUMN mypacs.applytable.uidfield
  IS 'uid';

  COMMENT ON COLUMN mypacs.applytable.birthdatefield
  IS 'дата рождения';

  COMMENT ON COLUMN mypacs.applytable.sexfield
  IS 'пол';

  COMMENT ON COLUMN mypacs.applytable.doctorfield
  IS 'врач';

  COMMENT ON COLUMN mypacs.applytable.descfield
  IS 'описание';

  COMMENT ON COLUMN mypacs.applytable.bstate
  IS 'статус исследования : 1 - в процессе  2 - завершено';

  COMMENT ON COLUMN mypacs.applytable.modality
  IS 'modality';

  COMMENT ON COLUMN mypacs.applytable.p_pid
  IS 'patientid';

  COMMENT ON COLUMN mypacs.applytable.accessionnumber
  IS 'accessionnumber';

  COMMENT ON COLUMN mypacs.applytable.bodypart
  IS 'часть тела';
end if;
  -- --------------------------------------------
if not exists( SELECT 1 FROM information_schema.tables t 
                 where t.table_schema = 'mypacs' and t.table_name='cns_dicomdisplay' )
then
  CREATE TABLE mypacs.cns_dicomdisplay (
    modality VARCHAR(10) NOT NULL, 
    w_position VARCHAR(4) NOT NULL, 
    display_id INTEGER NOT NULL, 
    group_id INTEGER NOT NULL, 
    element_id INTEGER NOT NULL, 
    title VARCHAR(24), 
    calledae VARCHAR(1), 
    CONSTRAINT cns_dicomdisplay_pkey PRIMARY KEY(modality, w_position, display_id)
  ) WITHOUT OIDS;

  CREATE INDEX cns_dicomdisplay_group_id ON mypacs.cns_dicomdisplay
    USING btree (group_id);
end if;
  -- --------------------------------------------
if not exists( SELECT 1 FROM information_schema.tables t 
                 where t.table_schema = 'mypacs' and t.table_name='cns_lookup_table' )
then
  CREATE TABLE mypacs.cns_lookup_table (
    lut_name VARCHAR(20) NOT NULL, 
    lut_data TEXT, 
    CONSTRAINT cns_lookup_table_pkey PRIMARY KEY(lut_name)
  ) WITHOUT OIDS;
end if;
  -- --------------------------------------------
if not exists( SELECT 1 FROM information_schema.tables t 
                 where t.table_schema = 'mypacs' and t.table_name='cns_modility' )
then
  CREATE TABLE mypacs.cns_modility (
    prof VARCHAR(20) NOT NULL, 
    modality VARCHAR(8), 
    groupname VARCHAR(20), 
    wordclassify VARCHAR(20), 
    mwlfilter VARCHAR(200), 
    displaymode VARCHAR(20), 
    displayfont INTEGER, 
    autogrid VARCHAR(1), 
    displayrows INTEGER, 
    displaycolumns INTEGER, 
    defaultdisplayinfo VARCHAR(1), 
    printdpi VARCHAR(10), 
    candicomprint VARCHAR(1), 
    defaultdisplaymode VARCHAR(10), 
    function2 VARCHAR(1), 
    candeleteimage VARCHAR(1), 
    capture_save_mode VARCHAR(4), 
    cut_save_mode VARCHAR(4), 
    image_source VARCHAR(16), 
    report_source VARCHAR(12), 
    report_source_objectname VARCHAR(40), 
    report_source_objectname1 VARCHAR(40), 
    report_source_objectname2 VARCHAR(40), 
    report_filter1 VARCHAR(200), 
    report_filter2 VARCHAR(200), 
    report_classify VARCHAR(200), 
    CONSTRAINT cns_modility_pkey PRIMARY KEY(prof)
  ) WITHOUT OIDS;

  CREATE INDEX cns_modility_idx ON mypacs.cns_modility
    USING btree (modality COLLATE pg_catalog."default");

  CREATE INDEX cns_modility_idx1 ON mypacs.cns_modility
    USING btree (groupname COLLATE pg_catalog."default");
end if;
  -- --------------------------------------------
if not exists( SELECT 1 FROM information_schema.tables t 
                 where t.table_schema = 'mypacs' and t.table_name='cns_usersetting' )
then
  CREATE TABLE mypacs.cns_usersetting (
    username VARCHAR(20) NOT NULL, 
    sectionname VARCHAR(20) NOT NULL, 
    itemname VARCHAR(24) NOT NULL, 
    stringvalue VARCHAR(250), 
    CONSTRAINT cns_usersetting_idx PRIMARY KEY(itemname, sectionname, username)
  ) WITHOUT OIDS;
end if;
  -- --------------------------------------------
if not exists( SELECT 1 FROM information_schema.tables t 
                 where t.table_schema = 'mypacs' and t.table_name='cns_windows_self' )
then
  CREATE TABLE mypacs.cns_windows_self (
    modality VARCHAR(10) NOT NULL, 
    partname VARCHAR(24) NOT NULL, 
    window_width1 INTEGER, 
    windows_level1 INTEGER, 
    window_width2 INTEGER, 
    windows_level2 INTEGER, 
    window_width3 INTEGER, 
    windows_level3 INTEGER, 
    CONSTRAINT cns_windows_self_idx PRIMARY KEY(partname, modality)
  ) WITHOUT OIDS;
end if;
  -- --------------------------------------------
if not exists( SELECT 1 FROM information_schema.tables t 
                 where t.table_schema = 'mypacs' and t.table_name='conclusions' )
then
  CREATE TABLE mypacs.conclusions (
    fk_id INTEGER NOT NULL, 
    fd_date TIMESTAMP WITHOUT TIME ZONE, 
    fk_userid INTEGER, 
    fc_notes TEXT, 
    fk_studyuid VARCHAR(80) NOT NULL, 
    CONSTRAINT conclusions_idx PRIMARY KEY(fk_id)
  ) WITHOUT OIDS;

  COMMENT ON COLUMN mypacs.conclusions.fk_id
  IS 'pk - первичный ключ';

  COMMENT ON COLUMN mypacs.conclusions.fd_date
  IS 'дата заключения';

  COMMENT ON COLUMN mypacs.conclusions.fk_userid
  IS 'ссылка на поле users.fk_id';

  COMMENT ON COLUMN mypacs.conclusions.fc_notes
  IS 'текст заключения';

  COMMENT ON COLUMN mypacs.conclusions.fk_studyuid
  IS 'studyuid - ссылка на таблицу study поле studyuid';

  CREATE INDEX conclusions_idx1 ON mypacs.conclusions
    USING btree (fk_userid);

  CREATE INDEX conclusions_idx2 ON mypacs.conclusions
    USING btree (fk_studyuid COLLATE pg_catalog."default");

  CREATE TRIGGER conclusions_tr_bi
    BEFORE INSERT 
    ON mypacs.conclusions FOR EACH ROW 
    EXECUTE PROCEDURE mypacs.f_conclusions();
end if;
  -- --------------------------------------------
if not exists( SELECT 1 FROM information_schema.tables t 
                 where t.table_schema = 'mypacs' and t.table_name='devices' )
then
  CREATE TABLE mypacs.devices (
    fk_id INTEGER NOT NULL, 
    fc_ip VARCHAR(100), 
    fn_port INTEGER, 
    fc_title VARCHAR(15), 
    fc_comment VARCHAR(250), 
    fn_type INTEGER, 
    fn_transfer INTEGER, 
    CONSTRAINT devices_pkey PRIMARY KEY(fk_id)
  ) WITHOUT OIDS;

  COMMENT ON COLUMN mypacs.devices.fn_type
  IS 'Тип устройства (1-сервер, 2-Рабочая станция, 3-принтер)';

  COMMENT ON COLUMN mypacs.devices.fn_transfer
  IS 'TRANSFER SYNTAX установленный по- умолчанию для отправки снимков с PACS';

  CREATE TRIGGER devices_tr_bi
    BEFORE INSERT 
    ON mypacs.devices FOR EACH ROW 
    EXECUTE PROCEDURE mypacs.f_devices();
end if;
  -- --------------------------------------------
if not exists( SELECT 1 FROM information_schema.tables t 
                 where t.table_schema = 'mypacs' and t.table_name='diagnoz' )
then
  CREATE TABLE mypacs.diagnoz (
    fk_id INTEGER NOT NULL, 
    fk_parentid INTEGER, 
    fc_name VARCHAR(50), 
    fn_posn INTEGER, 
    CONSTRAINT diagnoz_idx PRIMARY KEY(fk_id)
  ) WITHOUT OIDS;

  CREATE INDEX diagnoz_idx1 ON mypacs.diagnoz
    USING btree (fk_parentid);

  CREATE INDEX diagnoz_idx2 ON mypacs.diagnoz
    USING btree (fc_name COLLATE pg_catalog."default");

  CREATE TRIGGER diagnoz_tr_bi
    BEFORE INSERT 
    ON mypacs.diagnoz FOR EACH ROW 
    EXECUTE PROCEDURE mypacs.f_diagnoz();
end if;
  -- --------------------------------------------
if not exists( SELECT 1 FROM information_schema.tables t 
                 where t.table_schema = 'mypacs' and t.table_name='dicomprinter' )
then
  CREATE TABLE mypacs.dicomprinter (
    name VARCHAR(20) NOT NULL, 
    ipaddress VARCHAR(15), 
    printport INTEGER, 
    callingae VARCHAR(24), 
    calledae VARCHAR(24), 
    magnificationtype VARCHAR(24), 
    smoothingtype VARCHAR(24), 
    polaritytype VARCHAR(24), 
    borderdensity VARCHAR(24), 
    emptyimagedensity VARCHAR(24), 
    trimtype VARCHAR(24), 
    mindensity INTEGER, 
    maxdensity INTEGER, 
    mediumtype VARCHAR(24), 
    filmdestination VARCHAR(24), 
    copies INTEGER, 
    defaultformat VARCHAR(24), 
    filmdirection VARCHAR(24), 
    resolution VARCHAR(24), 
    priori VARCHAR(24), 
    filmsize VARCHAR(24), 
    CONSTRAINT dicomprinter_pkey PRIMARY KEY(name)
  ) WITHOUT OIDS;
end if;
  -- --------------------------------------------
if not exists( SELECT 1 FROM information_schema.tables t 
                 where t.table_schema = 'mypacs' and t.table_name='events' )
then
  CREATE TABLE mypacs.events (
    fk_id INTEGER NOT NULL, 
    fc_name VARCHAR(255), 
    fn_type INTEGER, 
    fd_date TIMESTAMP WITHOUT TIME ZONE, 
    fc_remark VARCHAR(10000), 
    CONSTRAINT events_pkey PRIMARY KEY(fk_id)
  ) WITHOUT OIDS;

  COMMENT ON COLUMN mypacs.events.fk_id
  IS 'Уникальный ID';

  COMMENT ON COLUMN mypacs.events.fc_name
  IS 'Событие';

  COMMENT ON COLUMN mypacs.events.fn_type
  IS 'Тип события
  1 - запуск сервера
  2 - остановка сервера
  3 - ошибка
  4 - событие на сервере
  5 - изменились параметры сервера';

  COMMENT ON COLUMN mypacs.events.fd_date
  IS 'Дата события';

  COMMENT ON COLUMN mypacs.events.fc_remark
  IS 'Пометки';

  CREATE INDEX events_idx ON mypacs.events
    USING btree (fd_date);

  CREATE TRIGGER events_tr_bi
    BEFORE INSERT 
    ON mypacs.events FOR EACH ROW 
    EXECUTE PROCEDURE mypacs.f_events();
end if;
  -- --------------------------------------------
if not exists( SELECT 1 FROM information_schema.tables t 
                 where t.table_schema = 'mypacs' and t.table_name='events_rsnd' )
then
  CREATE TABLE mypacs.events_rsnd (
    fk_id INTEGER NOT NULL, 
    fn_type SMALLINT, 
    fc_callingtitle VARCHAR(20), 
    fc_calledtitle VARCHAR(20), 
    fc_studyuid VARCHAR(80), 
    fc_modality VARCHAR(10), 
    fd_studydate DATE, 
    fd_date DATE, 
    fn_amm INTEGER, 
    fn_amm_err INTEGER, 
    fc_patientid VARCHAR(20), 
    fc_patientname VARCHAR(250), 
    fc_ename VARCHAR(250), 
    fc_accessionnumber VARCHAR(100), 
    CONSTRAINT events_rsnd_pkey PRIMARY KEY(fk_id)
  ) WITHOUT OIDS;

  COMMENT ON COLUMN mypacs.events_rsnd.fk_id
  IS 'pk';

  COMMENT ON COLUMN mypacs.events_rsnd.fn_type
  IS '0 - успешная пересылка  1 - ошибки';

  COMMENT ON COLUMN mypacs.events_rsnd.fc_callingtitle
  IS 'aetitle отправителя снимков';

  COMMENT ON COLUMN mypacs.events_rsnd.fc_calledtitle
  IS 'aetitle куда мы пересылаем';

  COMMENT ON COLUMN mypacs.events_rsnd.fc_studyuid
  IS 'studyuid - uid исследования';

  COMMENT ON COLUMN mypacs.events_rsnd.fc_modality
  IS 'модальность исследования';

  COMMENT ON COLUMN mypacs.events_rsnd.fd_studydate
  IS 'дата исследования';

  COMMENT ON COLUMN mypacs.events_rsnd.fd_date
  IS 'дата пересылки';

  COMMENT ON COLUMN mypacs.events_rsnd.fn_amm
  IS 'всего снимков в исследовани';

  COMMENT ON COLUMN mypacs.events_rsnd.fn_amm_err
  IS 'всего снимков с ошибками при отправке';

  COMMENT ON COLUMN mypacs.events_rsnd.fc_patientid
  IS 'id пациента';

  COMMENT ON COLUMN mypacs.events_rsnd.fc_patientname
  IS 'фио пациента';

  COMMENT ON COLUMN mypacs.events_rsnd.fc_ename
  IS 'фио пациента рус';

  COMMENT ON COLUMN mypacs.events_rsnd.fc_accessionnumber
  IS 'accessionnumber';

  CREATE TRIGGER events_rsnd_tr_bd
    AFTER DELETE 
    ON mypacs.events_rsnd FOR EACH ROW 
    EXECUTE PROCEDURE mypacs.f_events_rsnd_del();

  CREATE TRIGGER events_rsnd_tr_bi
    BEFORE INSERT 
    ON mypacs.events_rsnd FOR EACH ROW 
    EXECUTE PROCEDURE mypacs.f_events_rsnd_ins();
end if;
  -- --------------------------------------------
if not exists( SELECT 1 FROM information_schema.tables t 
                 where t.table_schema = 'mypacs' and t.table_name='events_rsnd_err_lst' )
then
  CREATE TABLE mypacs.events_rsnd_err_lst (
    fk_id_rsnd INTEGER, 
    fc_studyuid VARCHAR(80), 
    fc_instanceuid VARCHAR(80), 
    fc_comm VARCHAR(250), 
    fn_transfersyntax INTEGER, 
    fc_calledtitle VARCHAR(20)
  ) WITHOUT OIDS;

  COMMENT ON COLUMN mypacs.events_rsnd_err_lst.fk_id_rsnd
  IS 'ссылка на FK_id EVENTS_RSND';

  COMMENT ON COLUMN mypacs.events_rsnd_err_lst.fc_studyuid
  IS 'STUDYUID';

  COMMENT ON COLUMN mypacs.events_rsnd_err_lst.fc_instanceuid
  IS 'INSTANCEUID';

  COMMENT ON COLUMN mypacs.events_rsnd_err_lst.fc_comm
  IS 'текст ошибки';

  COMMENT ON COLUMN mypacs.events_rsnd_err_lst.fn_transfersyntax
  IS 'TRANSFERSYNTAX
  .  .
  описано в dcm_uid.pas в dicomVCL

  PrivateTransferSyntax = 8192;
    ImplicitVRLittleEndian = 8193;
    ExplicitVRLittleEndian = 8194;
    ExplicitVRBigEndian = 8195;
    RLELossless = 8198;
    //JPEG_1 = 8196;
    JPEGBaseline = 8196;
    //JPEG_14_SelectionValue1 = 8197;
    JPEGLossless = 8197;
    JPEGExtendedProcess_2_4 = 8199;
    JPEG_3_5 = 8200;
    JPEG_6_8 = 8201;
    JPEG_7_9 = 8202;
    JPEG_10_12 = 8203;
    JPEG_11_13 = 8204;
    JPEGLossless14 = 8205;
    JPEGLossless15 = 8206;
    JPEG_16_18 = 8207;
    JPEG_17_19 = 8208;
    JPEG_20_22 = 8209;
    JPEG_21_23 = 8210;
    JPEG_24_26 = 8211;
    JPEG_25_27 = 8212;
    JPEG_28 = 8213;
    JPEG_29 = 8214;
    {$IFDEF ECLZLIBTransferSyntax}
    zlibFastestTransferSyntax = 8215;
    ppmFastestTransferSyntax = 8216;
    bzipFastestTransferSyntax = 8217;

    zlibMaxTransferSyntax = 8222;
    ppmMaxTransferSyntax = 8223;
    bzipMaxTransferSyntax = 8224;

    zlibNormalTransferSyntax = 8225;
    ppmNormalTransferSyntax = 8226;
    bzipNormalTransferSyntax = 8227;
    {$ENDIF}
    JPEGLossless80 = 8218;
    JPEGNearLossless81 = 8219;
    JPEG2000Irreversible = 8220; //.90 lossless
    JPEG2000Reversible = 8221; //.91 losy';

  COMMENT ON COLUMN mypacs.events_rsnd_err_lst.fc_calledtitle
  IS 'called AEtitle';

  CREATE INDEX events_rsnd_err_lst_idx ON mypacs.events_rsnd_err_lst
    USING btree (fc_calledtitle COLLATE pg_catalog."default", fc_studyuid COLLATE pg_catalog."default", fk_id_rsnd);
end if;
  -- --------------------------------------------
if not exists( SELECT 1 FROM information_schema.tables t 
                 where t.table_schema = 'mypacs' and t.table_name='events_wl' )
then
  CREATE TABLE mypacs.events_wl (
    fk_id INTEGER NOT NULL, 
    fc_name VARCHAR(255), 
    fn_type INTEGER, 
    fd_date TIMESTAMP WITHOUT TIME ZONE, 
    fc_remark VARCHAR(10000), 
    CONSTRAINT events_wl_pkey PRIMARY KEY(fk_id)
  ) WITHOUT OIDS;

  COMMENT ON COLUMN mypacs.events_wl.fk_id
  IS 'UID';

  COMMENT ON COLUMN mypacs.events_wl.fc_name
  IS 'Событие';

  COMMENT ON COLUMN mypacs.events_wl.fn_type
  IS 'Тип события (1-DicomAssociation, 2-DicomFind)';

  COMMENT ON COLUMN mypacs.events_wl.fd_date
  IS 'Дата события';

  COMMENT ON COLUMN mypacs.events_wl.fc_remark
  IS 'Комментарии';

  CREATE TRIGGER events_wl_tr_bi
    BEFORE INSERT 
    ON mypacs.events_wl FOR EACH ROW 
    EXECUTE PROCEDURE mypacs.f_events_wl();
end if;
  -- --------------------------------------------
if not exists( SELECT 1 FROM information_schema.tables t 
                 where t.table_schema = 'mypacs' and t.table_name='hospitals' )
then
  CREATE TABLE mypacs.hospitals (
    p_id INTEGER NOT NULL, 
    fc_name VARCHAR(100) NOT NULL, 
    fn_type SMALLINT NOT NULL, 
    studies_image_type VARCHAR(4), 
    fn_parentid INTEGER NOT NULL, 
    CONSTRAINT hospitals_pkey PRIMARY KEY(p_id)
  ) WITHOUT OIDS;

  COMMENT ON COLUMN mypacs.hospitals.p_id
  IS 'pk';

  COMMENT ON COLUMN mypacs.hospitals.fc_name
  IS 'наименование';

  COMMENT ON COLUMN mypacs.hospitals.fn_type
  IS '1-страна,
  2-регион,
  3-район,
  4-город,
  5-нас.пункт,
  6-лпу,
  7-отделение,
  8-dicom';

  COMMENT ON COLUMN mypacs.hospitals.studies_image_type
  IS 'модальность - для dicom устройств';

  COMMENT ON COLUMN mypacs.hospitals.fn_parentid
  IS 'id родителя';

  CREATE TRIGGER hospitals_tr_bi
    BEFORE INSERT 
    ON mypacs.hospitals FOR EACH ROW 
    EXECUTE PROCEDURE mypacs.f_hospitals();
end if;
  -- --------------------------------------------
if not exists( SELECT 1 FROM information_schema.tables t 
                 where t.table_schema = 'mypacs' and t.table_name='image_channels' )
then
  CREATE TABLE mypacs.image_channels (
    description VARCHAR(32) NOT NULL, 
    calledaet VARCHAR(40), 
    hostname VARCHAR(40) NOT NULL, 
    dicomport INTEGER NOT NULL, 
    icport INTEGER, 
    timeoutsec INTEGER, 
    defaultdevice VARCHAR(2), 
    loadimagemode INTEGER, 
    CONSTRAINT image_channels_pkey PRIMARY KEY(description)
  ) WITHOUT OIDS;
end if;
  -- --------------------------------------------
if not exists( SELECT 1 FROM information_schema.tables t 
                 where t.table_schema = 'mypacs' and t.table_name='images' )
then
  CREATE TABLE mypacs.images (
    studyuid VARCHAR(80) NOT NULL, 
    seriesuid VARCHAR(80) NOT NULL, 
    instanceuid VARCHAR(80) NOT NULL, 
    imgno INTEGER NOT NULL, 
    imagetype VARCHAR(10), 
    sizex INTEGER, 
    sizey INTEGER, 
    photometric VARCHAR(24), 
    bits INTEGER, 
    abits INTEGER, 
    bits_per_sample INTEGER, 
    imagedate TIMESTAMP WITHOUT TIME ZONE, 
    studiesdate TIMESTAMP WITHOUT TIME ZONE, 
    selectedindex INTEGER, 
    selectedindex1 INTEGER, 
    selectedindex2 INTEGER, 
    selectedindex3 INTEGER, 
    imageflag VARCHAR(80), 
    p_pid VARCHAR(80), 
    last_windows_center INTEGER, 
    last_windows_width INTEGER, 
    last_update_time TIMESTAMP WITHOUT TIME ZONE, 
    accessionnumber VARCHAR(100), 
    imagesize INTEGER, 
    CONSTRAINT images_pkey PRIMARY KEY(instanceuid)
  ) WITHOUT OIDS;

  COMMENT ON COLUMN mypacs.images.imagetype
  IS 'модальность';

  COMMENT ON COLUMN mypacs.images.accessionnumber
  IS 'accession number (номер протокола)';

  CREATE INDEX images_idx ON mypacs.images
    USING btree (accessionnumber COLLATE pg_catalog."default");

  CREATE INDEX images_idx1 ON mypacs.images
    USING btree (studyuid COLLATE pg_catalog."default");
    
  CREATE INDEX images_idx2 ON mypacs.images
    USING btree ("p_pid");  
end if;
  -- --------------------------------------------
if not exists( SELECT 1 FROM information_schema.tables t 
                 where t.table_schema = 'mypacs' and t.table_name='layout_table' )
then
  CREATE TABLE mypacs.layout_table (
    name VARCHAR(20) NOT NULL, 
    layoutdata TEXT, 
    modality VARCHAR(2), 
    CONSTRAINT layout_table_pkey PRIMARY KEY(name)
  ) WITHOUT OIDS;
end if;
  -- --------------------------------------------
if not exists( SELECT 1 FROM information_schema.tables t 
                 where t.table_schema = 'mypacs' and t.table_name='modility_setting' )
then
  CREATE TABLE mypacs.modility_setting (
    prof VARCHAR(20) NOT NULL, 
    modality VARCHAR(8) NOT NULL, 
    groupname VARCHAR(20), 
    wordclassify VARCHAR(20), 
    defaultpreset VARCHAR(20), 
    mwlfilter VARCHAR(200), 
    displayinfo VARCHAR(1), 
    displaymode VARCHAR(20), 
    info_font INTEGER, 
    info_font_width VARCHAR(20), 
    image_autogrid VARCHAR(1), 
    image_rows INTEGER, 
    image_columns INTEGER, 
    series_autogrid VARCHAR(1), 
    series_rows INTEGER, 
    series_columns INTEGER, 
    candicomprint VARCHAR(1), 
    printdpi VARCHAR(10), 
    filmsize VARCHAR(20), 
    print_rows INTEGER, 
    print_columns INTEGER, 
    imagepositionmark VARCHAR(1), 
    candeleteimage VARCHAR(1), 
    capture_save_mode VARCHAR(10), 
    cut_save_mode VARCHAR(10), 
    image_source VARCHAR(16), 
    defaultlayout VARCHAR(20), 
    CONSTRAINT modility_setting_pkey PRIMARY KEY(prof)
  ) WITHOUT OIDS;

  CREATE INDEX modility_setting_idx ON mypacs.modility_setting
    USING btree (modality COLLATE pg_catalog."default");

  CREATE INDEX modility_setting_idx1 ON mypacs.modility_setting
    USING btree (groupname COLLATE pg_catalog."default");
end if;
  -- --------------------------------------------
if not exists( SELECT 1 FROM information_schema.tables t 
                 where t.table_schema = 'mypacs' and t.table_name='params' )
then
  CREATE TABLE mypacs.params (
    fc_section VARCHAR(100), 
    fc_key VARCHAR(100), 
    fc_value VARCHAR(1000)
  ) WITHOUT OIDS;

  COMMENT ON COLUMN mypacs.params.fc_section
  IS 'Имя секции';

  COMMENT ON COLUMN mypacs.params.fc_key
  IS 'Имя ключа';

  COMMENT ON COLUMN mypacs.params.fc_value
  IS 'Значение';

  CREATE INDEX params_idx ON mypacs.params
    USING btree (fc_key COLLATE pg_catalog."default");

  CREATE INDEX params_idx1 ON mypacs.params
    USING btree (fc_section COLLATE pg_catalog."default");
end if;
  -- --------------------------------------------
if not exists( SELECT 1 FROM information_schema.tables t 
                 where t.table_schema = 'mypacs' and t.table_name='patients' )
then
  CREATE TABLE mypacs.patients (
    p_ename VARCHAR(255), 
    p_sex VARCHAR(4), 
    p_pid VARCHAR(20) NOT NULL, 
    p_dateborn TIMESTAMP WITHOUT TIME ZONE, 
    p_fam VARCHAR(255), 
    p_im VARCHAR(255), 
    p_otch VARCHAR(255), 
    p_ename_rus VARCHAR(255), 
    CONSTRAINT patients_pkey PRIMARY KEY(p_pid)
  ) WITHOUT OIDS;

  COMMENT ON COLUMN mypacs.patients.p_ename
  IS 'ФИО ПАЦИЕНТА';

  COMMENT ON COLUMN mypacs.patients.p_sex
  IS 'ПОЛ ПАЦИЕНТА';

  COMMENT ON COLUMN mypacs.patients.p_pid
  IS 'НОМЕР ПАЦИЕНТА=НОМЕР МЕДИЦИНСКОЙ КАРТЫ';

  COMMENT ON COLUMN mypacs.patients.p_dateborn
  IS 'ДАТА РОЖДЕНИЯ ПАЦИЕНТА';

  COMMENT ON COLUMN mypacs.patients.p_fam
  IS 'ФАМИЛИЯ ПАЦИЕНТА';

  COMMENT ON COLUMN mypacs.patients.p_im
  IS 'ИМЯ ПАЦИЕНТА';

  COMMENT ON COLUMN mypacs.patients.p_otch
  IS 'ОТЧЕСТВО ПАЦИЕНТА';

  COMMENT ON COLUMN mypacs.patients.p_ename_rus
  IS 'ФИО ПАЦИЕНТА (РУС)';

  CREATE TRIGGER patients_tr_bd
    AFTER DELETE 
    ON mypacs.patients FOR EACH ROW 
    EXECUTE PROCEDURE mypacs.f_patients_dl();
end if;
  -- --------------------------------------------
if not exists( SELECT 1 FROM information_schema.tables t 
                 where t.table_schema = 'mypacs' and t.table_name='remote_devices' )
then
  CREATE TABLE mypacs.remote_devices (
    description VARCHAR(32) NOT NULL, 
    calledaet VARCHAR(40), 
    hostname VARCHAR(40) NOT NULL, 
    dicomport INTEGER NOT NULL, 
    hosttype VARCHAR(32) NOT NULL, 
    defaultdevice VARCHAR(2), 
    loadimagemode INTEGER, 
    CONSTRAINT remote_devices_pkey PRIMARY KEY(description)
  ) WITHOUT OIDS;
end if;
  -- --------------------------------------------
if not exists( SELECT 1 FROM information_schema.tables t 
                 where t.table_schema = 'mypacs' and t.table_name='rules' )
then
  CREATE TABLE mypacs.rules (
    fk_id INTEGER NOT NULL, 
    fk_deviceid INTEGER, 
    fk_deviceid2 INTEGER, 
    fc_mod VARCHAR(2), 
    fn_compress INTEGER, 
    fn_prc_compress SMALLINT, 
    CONSTRAINT rules_pkey PRIMARY KEY(fk_id)
  ) WITHOUT OIDS;

  COMMENT ON COLUMN mypacs.rules.fk_id
  IS 'UID';

  COMMENT ON COLUMN mypacs.rules.fk_deviceid
  IS 'DEVICES.FK_ID - куда отправлять снимки';

  COMMENT ON COLUMN mypacs.rules.fk_deviceid2
  IS 'DEVICES.FK_ID - откуда пришли снимки';

  COMMENT ON COLUMN mypacs.rules.fc_mod
  IS 'Модальность';

  COMMENT ON COLUMN mypacs.rules.fn_compress
  IS 'transfer syntax для сжатия снимка при отправке
  .   .
  описано в dcm_uid.pas в dicomVCL
  .   .
  PrivateTransferSyntax = 8192;
    ImplicitVRLittleEndian = 8193;
    ExplicitVRLittleEndian = 8194;
    ExplicitVRBigEndian = 8195;
    RLELossless = 8198;
    //JPEG_1 = 8196;
    JPEGBaseline = 8196;
    //JPEG_14_SelectionValue1 = 8197;
    JPEGLossless = 8197;
    JPEGExtendedProcess_2_4 = 8199;
    JPEG_3_5 = 8200;
    JPEG_6_8 = 8201;
    JPEG_7_9 = 8202;
    JPEG_10_12 = 8203;
    JPEG_11_13 = 8204;
    JPEGLossless14 = 8205;
    JPEGLossless15 = 8206;
    JPEG_16_18 = 8207;
    JPEG_17_19 = 8208;
    JPEG_20_22 = 8209;
    JPEG_21_23 = 8210;
    JPEG_24_26 = 8211;
    JPEG_25_27 = 8212;
    JPEG_28 = 8213;
    JPEG_29 = 8214;
    {$IFDEF ECLZLIBTransferSyntax}
    zlibFastestTransferSyntax = 8215;
    ppmFastestTransferSyntax = 8216;
    bzipFastestTransferSyntax = 8217;

    zlibMaxTransferSyntax = 8222;
    ppmMaxTransferSyntax = 8223;
    bzipMaxTransferSyntax = 8224;

    zlibNormalTransferSyntax = 8225;
    ppmNormalTransferSyntax = 8226;
    bzipNormalTransferSyntax = 8227;
    {$ENDIF}
    JPEGLossless80 = 8218;
    JPEGNearLossless81 = 8219;
    JPEG2000Irreversible = 8220; //.90 lossless
    JPEG2000Reversible = 8221; //.91 losy';

  COMMENT ON COLUMN mypacs.rules.fn_prc_compress
  IS '% сжатия';

  CREATE TRIGGER rules_tr
    BEFORE INSERT 
    ON mypacs.rules FOR EACH ROW 
    EXECUTE PROCEDURE mypacs.f_rules();
end if;
  -- --------------------------------------------
if not exists( SELECT 1 FROM information_schema.tables t 
                 where t.table_schema = 'mypacs' and t.table_name='series' )
then
  CREATE TABLE mypacs.series (
    studyuid VARCHAR(80) NOT NULL, 
    seriesuid VARCHAR(80) NOT NULL, 
    series_imagetype VARCHAR(4), 
    series_image_count INTEGER, 
    series_desc VARCHAR(80), 
    accessionnumber VARCHAR(100), 
    series_date TIMESTAMP WITHOUT TIME ZONE, 
    CONSTRAINT series_pkey PRIMARY KEY(seriesuid)
  ) WITHOUT OIDS;

  COMMENT ON COLUMN mypacs.series.accessionnumber
  IS 'AccessionNumber (номер протокола)';

  CREATE INDEX series_idx ON mypacs.series
    USING btree (accessionnumber COLLATE pg_catalog."default");
end if;
  -- --------------------------------------------
if not exists( SELECT 1 FROM information_schema.tables t 
                 where t.table_schema = 'mypacs' and t.table_name='studies' )
then
  CREATE TABLE mypacs.studies (
    studyuid VARCHAR(80) NOT NULL, 
    p_ename VARCHAR(50), 
    p_sex VARCHAR(4), 
    p_pid VARCHAR(80), 
    studyid VARCHAR(50), 
    peer_ip VARCHAR(20), 
    bstate INTEGER, 
    ldate TIMESTAMP WITHOUT TIME ZONE NOT NULL, 
    backuptime TIMESTAMP WITHOUT TIME ZONE, 
    backupval VARCHAR(20), 
    study_image_count INTEGER, 
    studies_image_type VARCHAR(10), 
    rphys VARCHAR(20), 
    opname VARCHAR(20), 
    performphys VARCHAR(20), 
    calling_ae_title VARCHAR(16), 
    studydescription VARCHAR(80), 
    institutionaldepartmentname VARCHAR(80), 
    referringphysicianname VARCHAR(80), 
    reportstate INTEGER, 
    printstate INTEGER, 
    p_age VARCHAR(4), 
    p_dob VARCHAR(4), 
    p_dateborn TIMESTAMP WITHOUT TIME ZONE, 
    p_ename_rus VARCHAR(50), 
    status INTEGER, 
    accessionnumber VARCHAR(100), 
    name_disc VARCHAR(50), 
    actuality SMALLINT, 
    fc_aeapparat VARCHAR(15), 
    fc_mndiagnos TEXT, 
    fc_adddiagnos TEXT, 
    studyuid_old VARCHAR(80), 
    fk_idosndiag INTEGER, 
    fk_iddopdiag INTEGER, 
    CONSTRAINT studies_pkey PRIMARY KEY(studyuid)
  ) WITHOUT OIDS;

  COMMENT ON COLUMN mypacs.studies.ldate
  IS 'StudyDate (Дата исследования)';

  COMMENT ON COLUMN mypacs.studies.studies_image_type
  IS 'модальность';

  COMMENT ON COLUMN mypacs.studies.status
  IS 'Study Status
  0 - server
  1 - archive
  2 - localbase';

  COMMENT ON COLUMN mypacs.studies.accessionnumber
  IS 'Protocol Number (Номер протокола)';

  COMMENT ON COLUMN mypacs.studies.name_disc
  IS 'Name of Disc';

  COMMENT ON COLUMN mypacs.studies.actuality
  IS 'актуальность исследования (для телемедицины)
  значения :
  0-не установлено
  1-плановая
  2-срочная
  3-экстренная
  4-завершенная';

  COMMENT ON COLUMN mypacs.studies.fc_aeapparat
  IS 'AEtitle аппарата с которого пришло исследование';

  CREATE TRIGGER studies_tr
    AFTER DELETE 
    ON mypacs.studies FOR EACH ROW 
    EXECUTE PROCEDURE mypacs.f_studies_bd();
    
  CREATE INDEX studies_idx ON mypacs.studies
    USING btree (studyuid);
    
  CREATE INDEX studies_idx1 ON mypacs.studies
    USING btree (accessionnumber); 
    
  CREATE INDEX studies_idx2 ON mypacs.studies
    USING btree (studyuid_old);   
    
end if;
  -- --------------------------------------------
if not exists( SELECT 1 FROM information_schema.tables t 
                 where t.table_schema = 'mypacs' and t.table_name='studydocs' )
then
  CREATE TABLE mypacs.studydocs (
    studyuid VARCHAR(80), 
    fdate DATE, 
    fcomment VARCHAR(50), 
    f_file TEXT, 
    fc_login VARCHAR(50), 
    f_id INTEGER NOT NULL, 
    CONSTRAINT studydocs_idx PRIMARY KEY(f_id)
  ) WITHOUT OIDS;

  CREATE INDEX studydocs_idx1 ON mypacs.studydocs
    USING btree (studyuid COLLATE pg_catalog."default");
end if;
  -- --------------------------------------------
if not exists( SELECT 1 FROM information_schema.tables t 
                 where t.table_schema = 'mypacs' and t.table_name='tags' )
then
  CREATE TABLE mypacs.tags (
    fc_title VARCHAR(15) NOT NULL, 
    fc_imagetype_1 VARCHAR(5), 
    fc_imagetype_2 VARCHAR(5), 
    fc_studyid_1 VARCHAR(5), 
    fc_studyid_2 VARCHAR(5), 
    fc_patientid_1 VARCHAR(5), 
    fc_patientid_2 VARCHAR(5), 
    fc_studydescription_1 VARCHAR(5), 
    fc_studydescription_2 VARCHAR(5), 
    fc_accessionnumber_1 VARCHAR(5), 
    fc_accessionnumber_2 VARCHAR(5), 
    fc_da_1 VARCHAR(5), 
    fc_da_2 VARCHAR(5), 
    fc_dt_1 VARCHAR(5), 
    fc_dt_2 VARCHAR(5), 
    fc_studyuid_1 VARCHAR(5), 
    fc_studyuid_2 VARCHAR(5), 
    fc_seriesuid_1 VARCHAR(5), 
    fc_seriesuid_2 VARCHAR(5), 
    fc_sernum_1 VARCHAR(5), 
    fc_sernum_2 VARCHAR(5), 
    fc_physname_1 VARCHAR(5), 
    fc_physname_2 VARCHAR(5), 
    fc_pname_1 VARCHAR(5), 
    fc_pname_2 VARCHAR(5), 
    fc_pdateborn_1 VARCHAR(5), 
    fc_pdateborn_2 VARCHAR(5), 
    fc_psex_1 VARCHAR(5), 
    fc_psex_2 VARCHAR(5), 
    fc_aid_1 VARCHAR(5), 
    fc_aid_2 VARCHAR(5), 
    fc_acqnum_1 VARCHAR(5), 
    fc_acqnum_2 VARCHAR(5), 
    fc_instanceuid_1 VARCHAR(5), 
    fc_instanceuid_2 VARCHAR(5), 
    fc_kin_1 VARCHAR(5), 
    fc_kin_2 VARCHAR(5), 
    CONSTRAINT tags_pkey PRIMARY KEY(fc_title)
  ) WITHOUT OIDS;

  COMMENT ON COLUMN mypacs.tags.fc_title
  IS 'AETITLE';

  COMMENT ON COLUMN mypacs.tags.fc_imagetype_1
  IS 'Модальность (CS Modality)';

  COMMENT ON COLUMN mypacs.tags.fc_studyid_1
  IS 'ID исследования (StudyID)';

  COMMENT ON COLUMN mypacs.tags.fc_patientid_1
  IS 'ID пациента (PatientID)';

  COMMENT ON COLUMN mypacs.tags.fc_studydescription_1
  IS 'Комментарий-описание к исследованию (Study Description)';

  COMMENT ON COLUMN mypacs.tags.fc_accessionnumber_1
  IS 'Номер протокола исследования';

  COMMENT ON COLUMN mypacs.tags.fc_da_1
  IS 'Дата исследования (Study Date)';

  COMMENT ON COLUMN mypacs.tags.fc_dt_1
  IS 'Время исследования (Study Time)';

  COMMENT ON COLUMN mypacs.tags.fc_studyuid_1
  IS 'Study Instance UID';

  COMMENT ON COLUMN mypacs.tags.fc_seriesuid_1
  IS 'Series Instanse UID';

  COMMENT ON COLUMN mypacs.tags.fc_sernum_1
  IS 'Series Number';
end if;
  -- --------------------------------------------
if not exists( SELECT 1 FROM information_schema.tables t 
                 where t.table_schema = 'mypacs' and t.table_name='templates' )
then
  CREATE TABLE mypacs.templates (
    fk_id INTEGER NOT NULL, 
    studies_image_type VARCHAR(10), 
    fc_notes TEXT, 
    fc_comm VARCHAR(100) NOT NULL, 
    fn_is_del SMALLINT, 
    CONSTRAINT templates_pkey PRIMARY KEY(fk_id)
  ) WITHOUT OIDS;

  COMMENT ON COLUMN mypacs.templates.fk_id
  IS 'PK - первичный ключ';

  COMMENT ON COLUMN mypacs.templates.studies_image_type
  IS 'Модальность';

  COMMENT ON COLUMN mypacs.templates.fc_notes
  IS 'Текст шаблона';

  COMMENT ON COLUMN mypacs.templates.fc_comm
  IS 'Комментарии';

  COMMENT ON COLUMN mypacs.templates.fn_is_del
  IS '(=1) - признак удаленной записи';

  CREATE TRIGGER templates_tr_bi
    BEFORE INSERT 
    ON mypacs.templates FOR EACH ROW 
    EXECUTE PROCEDURE mypacs.f_templates();
end if;
  -- --------------------------------------------
if not exists( SELECT 1 FROM information_schema.tables t 
                 where t.table_schema = 'mypacs' and t.table_name='users' )
then
  CREATE TABLE mypacs.users (
    fc_login VARCHAR(50) NOT NULL, 
    fc_fam VARCHAR(100), 
    fc_im VARCHAR(100), 
    fc_otch VARCHAR(100), 
    fd_rojd TIMESTAMP WITHOUT TIME ZONE, 
    fc_address VARCHAR(150), 
    fc_tel VARCHAR(100), 
    fn_adm INTEGER, 
    fn_del INTEGER, 
    fk_id INTEGER NOT NULL, 
    fn_iswado SMALLINT, 
    fn_isqueries SMALLINT, 
    fn_isconcl SMALLINT, 
    fc_firma VARCHAR(100), 
    fc_doljn VARCHAR(50), 
    fc_uslugi VARCHAR(250), 
    fc_specializations VARCHAR(250), 
    fn_cr SMALLINT, 
    fn_dx SMALLINT, 
    fn_io SMALLINT, 
    fn_mr SMALLINT, 
    fn_ot SMALLINT, 
    fn_sc SMALLINT, 
    fn_xa SMALLINT, 
    fn_ct SMALLINT, 
    fn_es SMALLINT, 
    fn_mg SMALLINT, 
    fn_nm SMALLINT, 
    fn_px SMALLINT, 
    fn_rg SMALLINT, 
    fn_us SMALLINT, 
    fn_xc SMALLINT, 
    fn_rf SMALLINT, 
    CONSTRAINT users_pkey PRIMARY KEY(fk_id)
  ) WITHOUT OIDS;

  COMMENT ON COLUMN mypacs.users.fc_login
  IS 'Логин пользователя';

  COMMENT ON COLUMN mypacs.users.fc_fam
  IS 'Фамилия пользователя';

  COMMENT ON COLUMN mypacs.users.fc_im
  IS 'Имя пользователя';

  COMMENT ON COLUMN mypacs.users.fc_otch
  IS 'Отчество пользователя';

  COMMENT ON COLUMN mypacs.users.fd_rojd
  IS 'Дата рождения пользователя';

  COMMENT ON COLUMN mypacs.users.fc_address
  IS 'Адрес пользователя';

  COMMENT ON COLUMN mypacs.users.fc_tel
  IS 'Телефон пользователя';

  COMMENT ON COLUMN mypacs.users.fn_adm
  IS 'Признак является ли админом данный пользователь (0 - нет, 1 - да)';

  COMMENT ON COLUMN mypacs.users.fn_del
  IS 'Признак удаления (0 - не удален, 1 - удален)';

  COMMENT ON COLUMN mypacs.users.fk_id
  IS 'Уникальный идентификатор';

  COMMENT ON COLUMN mypacs.users.fn_iswado
  IS '(=1) признак что пользователь заведен для ЦМИ';

  COMMENT ON COLUMN mypacs.users.fn_isqueries
  IS 'право формировать очередь исследований на заключение';

  COMMENT ON COLUMN mypacs.users.fn_isconcl
  IS 'право писать заключения (=1)
  только смотреть заключения (=2)';

  COMMENT ON COLUMN mypacs.users.fc_firma
  IS 'организация';

  COMMENT ON COLUMN mypacs.users.fc_doljn
  IS 'должность';

  COMMENT ON COLUMN mypacs.users.fc_uslugi
  IS 'список предоставляемых услуг';

  COMMENT ON COLUMN mypacs.users.fc_specializations
  IS 'список специализаций';

  COMMENT ON COLUMN mypacs.users.fn_cr
  IS 'фильтр по этой модальности при просмотре исследований';

  CREATE INDEX users_idx ON mypacs.users
    USING btree (fc_login COLLATE pg_catalog."default", fn_del);

  CREATE TRIGGER users_tr
    BEFORE INSERT 
    ON mypacs.users FOR EACH ROW 
    EXECUTE PROCEDURE mypacs.f_users();
end if;
  -- --------------------------------------------
if not exists( SELECT 1 FROM information_schema.tables t 
                 where t.table_schema = 'mypacs' and t.table_name='windows_preset' )
then
  CREATE TABLE mypacs.windows_preset (
    modality VARCHAR(2) NOT NULL, 
    partname VARCHAR(24) NOT NULL, 
    hotkey VARCHAR(24) NOT NULL, 
    window_width INTEGER, 
    windows_level INTEGER, 
    CONSTRAINT windows_preset_idx PRIMARY KEY(partname, modality)
  ) WITHOUT OIDS;
end if;
  -- --------------------------------------------
if not exists( SELECT 1 FROM information_schema.tables t 
                 where t.table_schema = 'mypacs' and t.table_name='worklist' )
then
  CREATE TABLE mypacs.worklist (
    p_ename VARCHAR(255), 
    p_sex VARCHAR(4), 
    p_pid VARCHAR(20) NOT NULL, 
    p_dateborn TIMESTAMP WITHOUT TIME ZONE, 
    p_fam VARCHAR(255), 
    p_im VARCHAR(255), 
    p_otch VARCHAR(255), 
    p_ename_rus VARCHAR(255), 
    p_patientsex VARCHAR(3), 
    accessionnumber VARCHAR(100), 
    modality VARCHAR(10), 
    studyuid VARCHAR(80), 
    p_st_dt TIMESTAMP WITHOUT TIME ZONE, 
    status VARCHAR(20), 
    fk_id INTEGER NOT NULL, 
    procedureid INTEGER, 
    startdateworklist DATE, 
    enddateworklist DATE, 
    stepstarttime VARCHAR(10), 
    stepfinishtime VARCHAR(10), 
    physiciansname VARCHAR(100), 
    stepdescription VARCHAR(250), 
    stepid VARCHAR(20), 
    stationname VARCHAR(50), 
    procdescription VARCHAR(250), 
    procpriority VARCHAR(20), 
    stationaetitle VARCHAR(50), 
    CONSTRAINT worklist_pkey PRIMARY KEY(fk_id)
  ) WITHOUT OIDS;

  CREATE TRIGGER worklist_tr
    BEFORE INSERT 
    ON mypacs.worklist FOR EACH ROW 
    EXECUTE PROCEDURE mypacs.f_worklist();
end if;
-- --------------------------------------------
-- --------------------------------------------
-- --------------------------------------------
-- --------------------------------------------
-- --------------------------------------------
-- --------------------------------------------
-- --------------------------------------------
-- --------------------------------------------
-- --------------------------------------------
-- --------------------------------------------
-- --------------------------------------------
-- --------------------------------------------
-- --------------------------------------------
-- --------------------------------------------
-- --------------------------------------------
-- --------------------------------------------
-- --------------------------------------------
-- --------------------------------------------
-- --------------------------------------------
-- --------------------------------------------
-- --------------------------------------------
-- --------------------------------------------
-- --------------------------------------------
-- --------------------------------------------
-- --------------------------------------------
-- --------------------------------------------
-- --------------------------------------------
-- --------------------------------------------


END;
$$




