ALTER TABLE ASU.TSMID
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TSMID CASCADE CONSTRAINTS
/

--
-- TSMID  (Table) 
--
CREATE TABLE ASU.TSMID
(
  FK_ID                NUMBER(15)               NOT NULL,
  FC_NAME              VARCHAR2(255 BYTE),
  FK_CLASS             NUMBER(2),
  FK_CHANGE            NUMBER(3),
  FC_ED_IZM            VARCHAR2(20 BYTE),
  FN_LOW_M             NUMBER(9,3),
  FN_HI_M              NUMBER(9,3),
  FN_LOW_W             NUMBER(9,3),
  FN_HI_W              NUMBER(9,3),
  FP_PAT               VARCHAR2(1 BYTE)         DEFAULT 0,
  FC_TIME              VARCHAR2(8 BYTE),
  FN_ED                NUMBER(5,2),
  FC_REMARK            VARCHAR2(254 BYTE),
  FK_LOINC_CODE        VARCHAR2(6 BYTE),
  FC_SYNONIM           VARCHAR2(254 BYTE),
  FC_ANSWER            VARCHAR2(254 BYTE),
  FC_ANSWER_W          VARCHAR2(25 BYTE),
  FC_ANSWER_M          VARCHAR2(25 BYTE),
  FK_MKB9              VARCHAR2(20 BYTE),
  FK_MKB10             VARCHAR2(200 BYTE),
  FK_OWNER             NUMBER(15),
  FP_ISFOLDER          NUMBER(1),
  FC_TYPE              VARCHAR2(25 BYTE),
  FN_ORDER             NUMBER(15),
  FK_DEFAULT           NUMBER(15,4),
  FN_COUNT             NUMBER(5),
  FN_PEOPLE            NUMBER(2),
  FN_PRICE             NUMBER(6,2),
  FN_NORM0             NUMBER(9,3),
  FN_NORM0M            NUMBER(9,3),
  FN_NORM1             NUMBER(9,3),
  FN_NORM1M            NUMBER(9,3),
  FN_COST1             NUMBER(6,2),
  FN_COST2             NUMBER(6,2),
  FN_COST3             NUMBER(6,2),
  FP_INOUT             NUMBER(1),
  FL_SHOWANAL          NUMBER(1)                DEFAULT 0,
  FL_STAT              NUMBER(1)                DEFAULT 0,
  FL_SHOWPRINT         NUMBER(1)                DEFAULT 1,
  FL_SHOWDIAGPREDZAKL  NUMBER(1),
  FN_EDCHILD           NUMBER(5,2),
  FL_PLATDEFAULT       NUMBER(1),
  FL_USLUGA            NUMBER(1)                DEFAULT 0,
  FL_DEL               NUMBER(1)                DEFAULT 0,
  FK_MZKOD             VARCHAR2(20 BYTE),
  FL_REQUIRED          NUMBER(1)                DEFAULT 0,
  FK_GUID              VARCHAR2(32 BYTE)        DEFAULT null
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          20752K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
CACHE
NOPARALLEL
MONITORING
/

COMMENT ON TABLE ASU.TSMID IS 'Глобальный справочник системы '
/

COMMENT ON COLUMN ASU.TSMID.FK_ID IS 'SEQUENCE=[SEQ_TSMID]'
/

COMMENT ON COLUMN ASU.TSMID.FC_NAME IS 'Название'
/

COMMENT ON COLUMN ASU.TSMID.FK_CLASS IS 'Класс, в анализах тип забора метриала'
/

COMMENT ON COLUMN ASU.TSMID.FK_CHANGE IS 'Изменение'
/

COMMENT ON COLUMN ASU.TSMID.FC_ED_IZM IS 'Ед.изм.'
/

COMMENT ON COLUMN ASU.TSMID.FN_LOW_M IS 'Нижнее для мужчин'
/

COMMENT ON COLUMN ASU.TSMID.FN_HI_M IS 'Верхнее для мужчин'
/

COMMENT ON COLUMN ASU.TSMID.FN_LOW_W IS 'Нижнее для женщин'
/

COMMENT ON COLUMN ASU.TSMID.FN_HI_W IS 'Верхнее для женщин'
/

COMMENT ON COLUMN ASU.TSMID.FP_PAT IS 'Паталогия'
/

COMMENT ON COLUMN ASU.TSMID.FC_TIME IS 'Время'
/

COMMENT ON COLUMN ASU.TSMID.FN_ED IS 'Кол-во ед-ц'
/

COMMENT ON COLUMN ASU.TSMID.FC_REMARK IS 'Комментарий'
/

COMMENT ON COLUMN ASU.TSMID.FK_LOINC_CODE IS 'Признак для процедур. -1 - поле количества, xxxxxx - поле кратности'
/

COMMENT ON COLUMN ASU.TSMID.FC_SYNONIM IS 'Синоним'
/

COMMENT ON COLUMN ASU.TSMID.FC_ANSWER IS 'Ответ, для анализов формула расчета'
/

COMMENT ON COLUMN ASU.TSMID.FC_ANSWER_W IS 'Ответ для женщин'
/

COMMENT ON COLUMN ASU.TSMID.FC_ANSWER_M IS 'Ответ для мужчин'
/

COMMENT ON COLUMN ASU.TSMID.FK_MKB9 IS 'Код МКБ9'
/

COMMENT ON COLUMN ASU.TSMID.FK_MKB10 IS 'Код МКБ10'
/

COMMENT ON COLUMN ASU.TSMID.FK_OWNER IS 'Родитель'
/

COMMENT ON COLUMN ASU.TSMID.FP_ISFOLDER IS 'Удалить'
/

COMMENT ON COLUMN ASU.TSMID.FC_TYPE IS 'Тип'
/

COMMENT ON COLUMN ASU.TSMID.FN_ORDER IS 'Порядок при сортировке'
/

COMMENT ON COLUMN ASU.TSMID.FK_DEFAULT IS 'Произвольное'
/

COMMENT ON COLUMN ASU.TSMID.FN_COUNT IS 'Кол-во'
/

COMMENT ON COLUMN ASU.TSMID.FN_PEOPLE IS 'кол-во человек'
/

COMMENT ON COLUMN ASU.TSMID.FN_PRICE IS 'Цена общая'
/

COMMENT ON COLUMN ASU.TSMID.FN_NORM0 IS 'Удалить'
/

COMMENT ON COLUMN ASU.TSMID.FN_NORM0M IS 'Удалить'
/

COMMENT ON COLUMN ASU.TSMID.FN_NORM1 IS 'Удалить'
/

COMMENT ON COLUMN ASU.TSMID.FN_NORM1M IS 'Удалить'
/

COMMENT ON COLUMN ASU.TSMID.FN_COST1 IS 'Цена 1'
/

COMMENT ON COLUMN ASU.TSMID.FN_COST2 IS 'Цена 2'
/

COMMENT ON COLUMN ASU.TSMID.FN_COST3 IS 'Цена 3'
/

COMMENT ON COLUMN ASU.TSMID.FP_INOUT IS 'Признак для формы входная или выходная (у анализов 1 - параметр, 0 - значение); в назначениях (0-параметр, 1-заключение)'
/

COMMENT ON COLUMN ASU.TSMID.FL_SHOWANAL IS 'Показывать ли этот уровень при выборе анализа к назначению 1-да, 0-нет, 2 - дополнительный выбор'
/

COMMENT ON COLUMN ASU.TSMID.FL_STAT IS 'Учитывать в отчетах'
/

COMMENT ON COLUMN ASU.TSMID.FL_SHOWPRINT IS 'Показывать ли FC_NAME при создании текстов. (ИБ, фразы)'
/

COMMENT ON COLUMN ASU.TSMID.FL_SHOWDIAGPREDZAKL IS 'служебное поле'
/

COMMENT ON COLUMN ASU.TSMID.FN_EDCHILD IS 'Кол-во ФТ единиц для детей'
/

COMMENT ON COLUMN ASU.TSMID.FL_PLATDEFAULT IS 'Кол-во процедур в путевке'
/

COMMENT ON COLUMN ASU.TSMID.FL_USLUGA IS 'Является данная ветка услугой'
/

COMMENT ON COLUMN ASU.TSMID.FL_DEL IS 'Признак удаления by TimurLan'
/

COMMENT ON COLUMN ASU.TSMID.FK_MZKOD IS 'Код классификатора МЗ'
/


--
-- IDX_TSMID_GUID  (Index) 
--
--  Dependencies: 
--   TSMID (Table)
--
CREATE INDEX ASU.IDX_TSMID_GUID ON ASU.TSMID
(FK_GUID)
NOLOGGING
TABLESPACE USR
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TSMID_BY_FC_TYPE  (Index) 
--
--  Dependencies: 
--   TSMID (Table)
--
CREATE INDEX ASU.TSMID_BY_FC_TYPE ON ASU.TSMID
(FC_TYPE)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TSMID_BY_NAME  (Index) 
--
--  Dependencies: 
--   TSMID (Table)
--
CREATE INDEX ASU.TSMID_BY_NAME ON ASU.TSMID
(FC_NAME)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          20992K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TSMID_BY_ORDER  (Index) 
--
--  Dependencies: 
--   TSMID (Table)
--
CREATE INDEX ASU.TSMID_BY_ORDER ON ASU.TSMID
(FN_ORDER)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          2M
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TSMID_BY_OWNER_ORDER  (Index) 
--
--  Dependencies: 
--   TSMID (Table)
--
CREATE INDEX ASU.TSMID_BY_OWNER_ORDER ON ASU.TSMID
(FK_OWNER, FN_ORDER)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          13440K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TSMID_BY_OWNER_TYPE  (Index) 
--
--  Dependencies: 
--   TSMID (Table)
--
CREATE INDEX ASU.TSMID_BY_OWNER_TYPE ON ASU.TSMID
(FK_OWNER, FC_TYPE)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          13952K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TSMID_BY_SYN_OWNER  (Index) 
--
--  Dependencies: 
--   TSMID (Table)
--
CREATE INDEX ASU.TSMID_BY_SYN_OWNER ON ASU.TSMID
(FC_SYNONIM, FK_ID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          8832K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TSMID_FKID  (Index) 
--
--  Dependencies: 
--   TSMID (Table)
--
CREATE INDEX ASU.TSMID_FKID ON ASU.TSMID
(FK_ID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TSMID_ID_OWNER  (Index) 
--
--  Dependencies: 
--   TSMID (Table)
--
CREATE UNIQUE INDEX ASU.TSMID_ID_OWNER ON ASU.TSMID
(FK_OWNER, FK_ID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          13M
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TSMID_ON_FUNCMKB10  (Index) 
--
--  Dependencies: 
--   TSMID (Table)
--
CREATE INDEX ASU.TSMID_ON_FUNCMKB10 ON ASU.TSMID
(SUBSTR("ASU"."GET_FULLMKB10"("FK_MKB10"),1,20))
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          12M
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TSMID_OWNER_SHOWPRINT  (Index) 
--
--  Dependencies: 
--   TSMID (Table)
--
CREATE INDEX ASU.TSMID_OWNER_SHOWPRINT ON ASU.TSMID
(FK_OWNER, FL_SHOWPRINT)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TSMID$UPPER_MKB10  (Index) 
--
--  Dependencies: 
--   TSMID (Table)
--
CREATE INDEX ASU.TSMID$UPPER_MKB10 ON ASU.TSMID
(UPPER("FK_MKB10"))
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TR_TSMID  (Trigger) 
--
--  Dependencies: 
--   TSMID (Table)
--
CREATE OR REPLACE TRIGGER ASU."TR_TSMID" 
     AFTER INSERT OR UPDATE OR DELETE ON tsmid FOR EACH ROW
DISABLE
declare
     vID  number;
     vStr varchar2(2000);
     vtsmidfk_owner varchar(32);
      
   begin
     if PKG_sync.v_is_repl = 0 and pkg_sync.get_smid(nvl(:new.fk_owner, :old.fk_owner)) then
       PKG_sync.v_is_repl := 2;
          
       if INSERTING then
         begin
          select t.fk_guid into  vtsmidfk_owner from asu.tsmid t where t.fk_id = :new.fk_owner;
         exception when others then
           vtsmidfk_owner := null;
         end;
       
         insert into tsmid_s (FK_ID,FK_GUID,FC_NAME,FK_CLASS,FK_CHANGE,FC_ED_IZM,FN_LOW_M,FN_HI_M,FN_LOW_W,FN_HI_W,FP_PAT,FC_TIME,FN_ED,FC_REMARK,FK_LOINC_CODE,FC_SYNONIM,FC_ANSWER,FC_ANSWER_W,FC_ANSWER_M,FK_MKB9,FK_MKB10,FP_ISFOLDER,FC_TYPE,FN_ORDER,FK_DEFAULT,FN_COUNT,FN_PEOPLE,FN_PRICE,FN_NORM0,FN_NORM0M,FN_NORM1,FN_NORM1M,FN_COST1,FN_COST2,FN_COST3,FP_INOUT,FL_SHOWANAL,FL_STAT,FL_SHOWPRINT,FL_SHOWDIAGPREDZAKL,FN_EDCHILD,FL_PLATDEFAULT,FL_USLUGA,FL_DEL,FK_MZKOD,FL_REQUIRED,fk_ownerg,fd_edittime)
              values (0,:new.FK_GUID,:new.FC_NAME,:new.FK_CLASS,:new.FK_CHANGE,:new.FC_ED_IZM,:new.FN_LOW_M,:new.FN_HI_M,:new.FN_LOW_W,:new.FN_HI_W,:new.FP_PAT,:new.FC_TIME,:new.FN_ED,:new.FC_REMARK,:new.FK_LOINC_CODE,:new.FC_SYNONIM,:new.FC_ANSWER,:new.FC_ANSWER_W,:new.FC_ANSWER_M,:new.FK_MKB9,:new.FK_MKB10,:new.FP_ISFOLDER,:new.FC_TYPE,:new.FN_ORDER,:new.FK_DEFAULT,:new.FN_COUNT,:new.FN_PEOPLE,:new.FN_PRICE,:new.FN_NORM0,:new.FN_NORM0M,:new.FN_NORM1,:new.FN_NORM1M,:new.FN_COST1,:new.FN_COST2,:new.FN_COST3,:new.FP_INOUT,:new.FL_SHOWANAL,:new.FL_STAT,:new.FL_SHOWPRINT,:new.FL_SHOWDIAGPREDZAKL,:new.FN_EDCHILD,:new.FL_PLATDEFAULT,:new.FL_USLUGA,:new.FL_DEL,:new.FK_MZKOD,:new.FL_REQUIRED,vtsmidfk_owner,systimestamp);
       elsif DELETING then
         insert into tsmid_s (fk_id, fk_guid, fd_edittime)
              values (1, :old.fk_guid, systimestamp);
       elsif UPDATING then
         begin
          select t.fk_guid into  vtsmidfk_owner from asu.tsmid t where t.fk_id = :new.fk_owner;
         exception when others then
           vtsmidfk_owner := null;
         end;
       
         insert into tsmid_s (FK_ID,FK_GUID,FC_NAME,FK_CLASS,FK_CHANGE,FC_ED_IZM,FN_LOW_M,FN_HI_M,FN_LOW_W,FN_HI_W,FP_PAT,FC_TIME,FN_ED,FC_REMARK,FK_LOINC_CODE,FC_SYNONIM,FC_ANSWER,FC_ANSWER_W,FC_ANSWER_M,FK_MKB9,FK_MKB10,FP_ISFOLDER,FC_TYPE,FN_ORDER,FK_DEFAULT,FN_COUNT,FN_PEOPLE,FN_PRICE,FN_NORM0,FN_NORM0M,FN_NORM1,FN_NORM1M,FN_COST1,FN_COST2,FN_COST3,FP_INOUT,FL_SHOWANAL,FL_STAT,FL_SHOWPRINT,FL_SHOWDIAGPREDZAKL,FN_EDCHILD,FL_PLATDEFAULT,FL_USLUGA,FL_DEL,FK_MZKOD,FL_REQUIRED,fk_ownerg,fd_edittime)
              values (2,:new.FK_GUID,:new.FC_NAME,:new.FK_CLASS,:new.FK_CHANGE,:new.FC_ED_IZM,:new.FN_LOW_M,:new.FN_HI_M,:new.FN_LOW_W,:new.FN_HI_W,:new.FP_PAT,:new.FC_TIME,:new.FN_ED,:new.FC_REMARK,:new.FK_LOINC_CODE,:new.FC_SYNONIM,:new.FC_ANSWER,:new.FC_ANSWER_W,:new.FC_ANSWER_M,:new.FK_MKB9,:new.FK_MKB10,:new.FP_ISFOLDER,:new.FC_TYPE,:new.FN_ORDER,:new.FK_DEFAULT,:new.FN_COUNT,:new.FN_PEOPLE,:new.FN_PRICE,:new.FN_NORM0,:new.FN_NORM0M,:new.FN_NORM1,:new.FN_NORM1M,:new.FN_COST1,:new.FN_COST2,:new.FN_COST3,:new.FP_INOUT,:new.FL_SHOWANAL,:new.FL_STAT,:new.FL_SHOWPRINT,:new.FL_SHOWDIAGPREDZAKL,:new.FN_EDCHILD,:new.FL_PLATDEFAULT,:new.FL_USLUGA,:new.FL_DEL,:new.FK_MZKOD,:new.FL_REQUIRED,vtsmidfk_owner,systimestamp);
       end if;
       PKG_sync.v_is_repl := 0;
     end if;
   exception when others then
     begin
      PKG_sync.v_is_repl := 0;
      select seq_sync_log.nextval into vID from dual;
      vStr := SQLERRM;
      insert into tsync_log values (vID, systimestamp(3), vStr);
     end;
   end;
/
SHOW ERRORS;


--
-- TSMID_BACKUP  (Trigger) 
--
--  Dependencies: 
--   TSMID (Table)
--
CREATE OR REPLACE TRIGGER ASU."TSMID_BACKUP" --Created by TimurLan
  BEFORE DELETE ON ASU.TSMID   REFERENCING NEW AS NEW OLD AS OLD
  FOR EACH ROW

-- Код триггера модифицирован системой автоматической генерации триггеров репликации aTrigger.exe от:16.02.2004 21:47:18
BEGIN
  IF (USERENV('CLIENT_INFO') is null) or (USERENV('CLIENT_INFO') <> '%MAIL%') THEN

BEGIN
  -- ORIGINAL TRIGGER BODY BEGIN FROM HERE:
  BEGIN
    INSERT INTO TSMID_BACKUP(FK_ID, FC_NAME, FK_CLASS, FK_CHANGE, FC_ED_IZM, FN_LOW_M, FN_HI_M, FN_LOW_W, FN_HI_W, FP_PAT, FC_TIME, FN_ED, FC_REMARK, FK_LOINC_CODE, FC_SYNONIM, FC_ANSWER, FC_ANSWER_W, FC_ANSWER_M, FK_MKB9, FK_MKB10, FK_OWNER, FP_ISFOLDER, FC_TYPE, FN_ORDER, FK_DEFAULT, FN_COUNT, FN_PEOPLE, FN_PRICE, FN_NORM0, FN_NORM0M, FN_NORM1, FN_NORM1M, FN_COST1, FN_COST2, FN_COST3, FP_INOUT, FL_SHOWANAL, FL_STAT, FL_SHOWPRINT, FL_SHOWDIAGPREDZAKL, FN_EDCHILD, FL_PLATDEFAULT, FL_USLUGA, FL_DEL)
    VALUES (:OLD.FK_ID, :OLD.FC_NAME, :OLD.FK_CLASS, :OLD.FK_CHANGE, :OLD.FC_ED_IZM, :OLD.FN_LOW_M, :OLD.FN_HI_M, :OLD.FN_LOW_W, :OLD.FN_HI_W, :OLD.FP_PAT, :OLD.FC_TIME, :OLD.FN_ED, :OLD.FC_REMARK, :OLD.FK_LOINC_CODE, :OLD.FC_SYNONIM, :OLD.FC_ANSWER, :OLD.FC_ANSWER_W, :OLD.FC_ANSWER_M, :OLD.FK_MKB9, :OLD.FK_MKB10, :OLD.FK_OWNER, :OLD.FP_ISFOLDER, :OLD.FC_TYPE, :OLD.FN_ORDER, :OLD.FK_DEFAULT, :OLD.FN_COUNT, :OLD.FN_PEOPLE, :OLD.FN_PRICE, :OLD.FN_NORM0, :OLD.FN_NORM0M, :OLD.FN_NORM1, :OLD.FN_NORM1M, :OLD.FN_COST1, :OLD.FN_COST2, :OLD.FN_COST3, :OLD.FP_INOUT, :OLD.FL_SHOWANAL, :OLD.FL_STAT, :OLD.FL_SHOWPRINT, :OLD.FL_SHOWDIAGPREDZAKL, :OLD.FN_EDCHILD, :OLD.FL_PLATDEFAULT, :OLD.FL_USLUGA, :OLD.FL_DEL);
  END;
  -- ORIGINAL TRIGGER BODY ENDS HERE
END;

  END IF;
END;
/
SHOW ERRORS;


--
-- TSMID_DELETE  (Trigger) 
--
--  Dependencies: 
--   TSMID (Table)
--
CREATE OR REPLACE TRIGGER ASU."TSMID_DELETE" 
BEFORE  DELETE
ON tsmid
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
BEGIN
  DELETE tvrachkab_naz--tnazvrach
   WHERE fk_smid = :old.fk_id;

  DELETE
    FROM tib
   WHERE fk_smid = :old.fk_id;

  DELETE
    FROM tib
   WHERE fk_smeditid = :old.fk_id;

  DELETE
    FROM tdiag
   WHERE fk_smdiagid = :old.fk_id;

  DELETE
    FROM tsubdiag
   WHERE fk_smdiagid = :old.fk_id;

  DELETE
    FROM vnaz
   WHERE fk_smid = :old.fk_id;
END;
/
SHOW ERRORS;


--
-- TSMID_INSERT  (Trigger) 
--
--  Dependencies: 
--   TSMID (Table)
--
CREATE OR REPLACE TRIGGER ASU."TSMID_INSERT" 
BEFORE INSERT
ON tsmid
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
DECLARE
  CURSOR c1 IS
    SELECT SEQ_TSMID.NEXTVAL FROM DUAL;

  id NUMBER;
BEGIN
  IF :new.fk_id IS NULL OR :new.fk_id = -1 THEN
    OPEN c1;
    FETCH c1
      INTO id;
    CLOSE c1;
    :NEW.FK_ID := ID;
  END IF;
  if :NEW.FK_guid is null then 
    :NEW.FK_guid:= sys_guid();
  end if;
END;
/
SHOW ERRORS;


--
-- TSMID_INSERT_UPDATE  (Trigger) 
--
--  Dependencies: 
--   TSMID (Table)
--
CREATE OR REPLACE TRIGGER ASU."TSMID_INSERT_UPDATE" 
 BEFORE 
 INSERT OR UPDATE
 ON ASU.TSMID  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
BEGIN
  :new.fc_synonim := upper (:new.fc_synonim);
END;
/
SHOW ERRORS;


--
-- TSMID_LOG  (Trigger) 
--
--  Dependencies: 
--   TSMID (Table)
--
CREATE OR REPLACE TRIGGER ASU."TSMID_LOG" 
 AFTER
 INSERT OR DELETE OR UPDATE
 ON ASU.TSMID  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
DISABLE
BEGIN
  if INSERTING then
    PKG_LOG.Do_log('TSMID', 'FK_ID', 'INSERT', null, PKG_LOG.GET_VALUE(:new.FK_ID), :new.fk_id);
    PKG_LOG.Do_log('TSMID', 'FK_OWNER', 'INSERT', null, PKG_LOG.GET_VALUE(:new.FK_OWNER), :new.fk_id);
    PKG_LOG.Do_log('TSMID', 'FC_NAME', 'INSERT', null, PKG_LOG.GET_VALUE(:new.FC_NAME), :new.fk_id);
  elsif DELETING then
    PKG_LOG.Do_log('TSMID', 'FK_ID', 'DELETE', PKG_LOG.GET_VALUE(:old.FK_ID), null, :old.fk_id);
    PKG_LOG.Do_log('TSMID', 'FK_OWNER', 'DELETE', PKG_LOG.GET_VALUE(:old.FK_OWNER), null, :old.fk_id);
    PKG_LOG.Do_log('TSMID', 'FC_NAME', 'DELETE', PKG_LOG.GET_VALUE(:old.FC_NAME), null, :old.fk_id);
  elsif UPDATING then
    PKG_LOG.Do_log('TSMID', 'FK_ID', 'UPDATE', PKG_LOG.GET_VALUE(:old.FK_ID), PKG_LOG.GET_VALUE(:new.FK_ID), :old.fk_id);
    if UPDATING ('FC_NAME') AND PKG_LOG.GET_VALUE(:old.FC_NAME) <> PKG_LOG.GET_VALUE(:new.FC_NAME) then
      PKG_LOG.Do_log('TSMID', 'FC_NAME', 'UPDATE', PKG_LOG.GET_VALUE(:old.FC_NAME), PKG_LOG.GET_VALUE(:new.FC_NAME), :old.fk_id);
    end if;
    if UPDATING ('FP_PAT') AND PKG_LOG.GET_VALUE(:old.FP_PAT) <> PKG_LOG.GET_VALUE(:new.FP_PAT) then
      PKG_LOG.Do_log('TSMID', 'FP_PAT', 'UPDATE', PKG_LOG.GET_VALUE(:old.FP_PAT), PKG_LOG.GET_VALUE(:new.FP_PAT), :old.fk_id);
    end if;
    if UPDATING ('FN_ED') AND PKG_LOG.GET_VALUE(:old.FN_ED) <> PKG_LOG.GET_VALUE(:new.FN_ED) then
      PKG_LOG.Do_log('TSMID', 'FN_ED', 'UPDATE', PKG_LOG.GET_VALUE(:old.FN_ED), PKG_LOG.GET_VALUE(:new.FN_ED), :old.fk_id);
    end if;
    if UPDATING ('FK_LOINC_CODE') AND PKG_LOG.GET_VALUE(:old.FK_LOINC_CODE) <> PKG_LOG.GET_VALUE(:new.FK_LOINC_CODE) then
      PKG_LOG.Do_log('TSMID', 'FK_LOINC_CODE', 'UPDATE', PKG_LOG.GET_VALUE(:old.FK_LOINC_CODE), PKG_LOG.GET_VALUE(:new.FK_LOINC_CODE), :old.fk_id);
    end if;
    if UPDATING ('FC_SYNONIM') AND PKG_LOG.GET_VALUE(:old.FC_SYNONIM) <> PKG_LOG.GET_VALUE(:new.FC_SYNONIM) then
      PKG_LOG.Do_log('TSMID', 'FC_SYNONIM', 'UPDATE', PKG_LOG.GET_VALUE(:old.FC_SYNONIM), PKG_LOG.GET_VALUE(:new.FC_SYNONIM), :old.fk_id);
    end if;
    if UPDATING ('FK_MKB10') AND PKG_LOG.GET_VALUE(:old.FK_MKB10) <> PKG_LOG.GET_VALUE(:new.FK_MKB10) then
      PKG_LOG.Do_log('TSMID', 'FK_MKB10', 'UPDATE', PKG_LOG.GET_VALUE(:old.FK_MKB10), PKG_LOG.GET_VALUE(:new.FK_MKB10), :old.fk_id);
    end if;
    if UPDATING ('FK_OWNER') AND PKG_LOG.GET_VALUE(:old.FK_OWNER) <> PKG_LOG.GET_VALUE(:new.FK_OWNER) then
      PKG_LOG.Do_log('TSMID', 'FK_OWNER', 'UPDATE', PKG_LOG.GET_VALUE(:old.FK_OWNER), PKG_LOG.GET_VALUE(:new.FK_OWNER), :old.fk_id);
    end if;
    if UPDATING ('FC_TYPE') AND PKG_LOG.GET_VALUE(:old.FC_TYPE) <> PKG_LOG.GET_VALUE(:new.FC_TYPE) then
      PKG_LOG.Do_log('TSMID', 'FC_TYPE', 'UPDATE', PKG_LOG.GET_VALUE(:old.FC_TYPE), PKG_LOG.GET_VALUE(:new.FC_TYPE), :old.fk_id);
    end if;
    if UPDATING ('FP_INOUT') AND PKG_LOG.GET_VALUE(:old.FP_INOUT) <> PKG_LOG.GET_VALUE(:new.FP_INOUT) then
      PKG_LOG.Do_log('TSMID', 'FP_INOUT', 'UPDATE', PKG_LOG.GET_VALUE(:old.FP_INOUT), PKG_LOG.GET_VALUE(:new.FP_INOUT), :old.fk_id);
    end if;
    if UPDATING ('FL_SHOWANAL') AND PKG_LOG.GET_VALUE(:old.FL_SHOWANAL) <> PKG_LOG.GET_VALUE(:new.FL_SHOWANAL) then
      PKG_LOG.Do_log('TSMID', 'FL_SHOWANAL', 'UPDATE', PKG_LOG.GET_VALUE(:old.FL_SHOWANAL), PKG_LOG.GET_VALUE(:new.FL_SHOWANAL), :old.fk_id);
    end if;
    if UPDATING ('FL_DEL') AND PKG_LOG.GET_VALUE(:old.FL_DEL) <> PKG_LOG.GET_VALUE(:new.FL_DEL) then
      PKG_LOG.Do_log('TSMID', 'FL_DEL', 'UPDATE', PKG_LOG.GET_VALUE(:old.FL_DEL), PKG_LOG.GET_VALUE(:new.FL_DEL), :old.fk_id);
    end if;
  end if;
  null;
END TSMID_LOG;
/
SHOW ERRORS;


--
-- TSMID_MKB10  (Trigger) 
--
--  Dependencies: 
--   TSMID (Table)
--
CREATE OR REPLACE TRIGGER ASU."TSMID_MKB10" 
  BEFORE INSERT OR UPDATE OR DELETE ON ASU.TSMID   REFERENCING OLD AS OLD NEW AS NEW
  FOR EACH ROW
DECLARE
  sm_default NUMBER;
  sm_mkb VARCHAR2(200);
  --ищем по коду в TICD10
  CURSOR getdest(pcode VARCHAR2) IS SELECT i.fk_id,i.fl_can_del FROM asu.ticd10 i WHERE i.fc_kod = pcode;
  CURSOR getdestid(pid NUMBER) IS SELECT i.fl_can_del FROM asu.ticd10 i WHERE i.fk_id = pid;
  icid NUMBER;
  iccandel NUMBER;
  --ищем родителя по коду в TICD10
  CURSOR getdestowner(pcode VARCHAR2) IS SELECT i.fk_id FROM asu.ticd10 i WHERE i.fc_kod = pcode;
  icownerid NUMBER;
  --получаем родителя в TSMID
  CURSOR getparent(pownerid NUMBER) IS SELECT substr(trim(UPPER(asu.get_mkb10_by_id(pownerid))),1,10) mkb10 FROM dual;--asu.tsmid s WHERE s.fk_id = pownerid;
  smkod asu.ticd10.fc_kod%TYPE;

  kod asu.ticd10.fc_kod%TYPE;
  symb asu.ticd10.fc_symb%TYPE;
  kod1 asu.ticd10.fc_kod1%TYPE;
  newname asu.ticd10.fc_name%TYPE;
BEGIN

  /*if asu.get_rootid(nvl(:new.fk_owner,:old.fk_owner)) <> stat.pkg_statutil.GET_SMIDID('DIAGS_MKB10') then  
   return;
  end if;*/
  
  IF :new.Fk_Mkb10 IS NULL AND :old.Fk_Mkb10 IS NULL THEN
   return;
  END IF;

  IF UPDATING OR DELETING THEN
   sm_default := :old.Fk_Default;
  END IF;

  newname := substr(:NEW.FC_NAME,1,250);
  --проверка кода на спецсимволы
  kod := substr(trim(UPPER(:NEW.Fk_Mkb10)),1,10);
  IF instr(kod,'+') = LENGTH(kod) OR instr(kod,'*') = LENGTH(kod) THEN
   symb := SUBSTR(kod,LENGTH(kod),1);
   kod1 := SUBSTR(kod,1,LENGTH(kod)-1);
  ELSE
   symb := NULL;
   kod1 := kod;
  END IF;

  IF sm_default IS NOT NULL THEN
    icid := sm_default;
    OPEN getdestid(icid);
    FETCH getdestid INTO iccandel;
    IF getdestid%NOTFOUND THEN iccandel := 1; END IF;
    CLOSE getdestid;
  ELSE
    IF inserting THEN
     sm_mkb := :new.Fk_Mkb10;
    ELSIF updating THEN
     sm_mkb := :new.Fk_Mkb10;
    END IF;
    OPEN getdest(sm_MKB);
    FETCH getdest INTO icid,iccandel;
    IF getdest%NOTFOUND THEN icid := NULL; iccandel := 1; END IF;
    CLOSE getdest;
  END IF;

  IF INSERTING OR UPDATING THEN
    OPEN getparent(:NEW.Fk_Owner);
    FETCH getparent INTO smkod;
    IF getparent%NOTFOUND THEN smkod := NULL; END IF;
    CLOSE getparent;

    OPEN getdestowner(smkod);
    FETCH getdestowner INTO icownerid;
    IF getdestowner%NOTFOUND THEN icownerid := NULL; END IF;
    CLOSE getdestowner;
  END IF;


  IF INSERTING THEN
   IF icid IS NULL THEN -- код уже есть, уходим от сюда
    INSERT INTO asu.ticd10(fk_parent,fc_name,fc_kod,fc_symb,fc_kod1,fl_can_del) VALUES(icownerid,:new.Fc_Name,kod,symb,kod1,1) RETURNING fk_id INTO icid;
   ELSE
    IF iccandel IS NOT NULL THEN
     UPDATE asu.ticd10 SET fc_name = NEWNAME, fc_kod = kod, fc_symb = symb, fc_kod1 = kod1 WHERE fk_id = icid;
    END IF;
   END IF;
   :new.Fk_Default := icid;
  ELSIF UPDATING THEN
   IF iccandel IS NOT NULL THEN --проверка на запрещенность записи
    IF icid IS NULL THEN
     INSERT INTO asu.ticd10(fk_parent,fc_name,fc_kod,fc_symb,fc_kod1,fl_can_del) VALUES(icownerid,:new.Fc_Name,kod,symb,kod1,1) RETURNING fk_id INTO icid;
    ELSE
     if :new.fl_del = 1 then
      DELETE FROM asu.ticd10 WHERE fk_id = icid;
     else
      UPDATE asu.ticd10 SET fc_name = NEWNAME, fc_kod = kod, fc_symb = symb, fc_kod1 = kod1 WHERE fk_id = icid;
     end if;
    END IF;
   END IF;
   :new.Fk_Default := icid;
  ELSIF DELETING THEN
   IF iccandel IS NOT NULL THEN --проверка на запрещенность записи
    IF icid IS NOT NULL THEN
     DELETE FROM asu.ticd10 WHERE fk_id = icid;
    END IF;
   END IF;
  END IF;
End;
/
SHOW ERRORS;


DROP SYNONYM BUH.TSMID
/

--
-- TSMID  (Synonym) 
--
--  Dependencies: 
--   TSMID (Table)
--
CREATE SYNONYM BUH.TSMID FOR ASU.TSMID
/


DROP SYNONYM STAT.TSMID
/

--
-- TSMID  (Synonym) 
--
--  Dependencies: 
--   TSMID (Table)
--
CREATE SYNONYM STAT.TSMID FOR ASU.TSMID
/


-- 
-- Non Foreign Key Constraints for Table TSMID 
-- 
ALTER TABLE ASU.TSMID ADD (
  CONSTRAINT TSMID_BY_ID
 PRIMARY KEY
 (FK_ID))
/

GRANT REFERENCES, SELECT ON ASU.TSMID TO EXCHANGE
/

GRANT REFERENCES, SELECT ON ASU.TSMID TO EXCH43
/

GRANT DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE ON ASU.TSMID TO LAB
/

GRANT REFERENCES, SELECT ON ASU.TSMID TO LOGIN
/

