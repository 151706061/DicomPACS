ALTER TABLE ASU.TRECIPE_DLO_IMP
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TRECIPE_DLO_IMP CASCADE CONSTRAINTS
/

--
-- TRECIPE_DLO_IMP  (Table) 
--
CREATE TABLE ASU.TRECIPE_DLO_IMP
(
  FK_ID            NUMBER,
  FL_DEL           NUMBER                       DEFAULT 0,
  A_COD            VARCHAR2(10 BYTE),
  A_CODE           VARCHAR2(7 BYTE),
  SS               VARCHAR2(15 BYTE),
  UKOD             VARCHAR2(16 BYTE),
  C_KAT            VARCHAR2(4 BYTE),
  C_KATL           VARCHAR2(4 BYTE),
  S_POL            VARCHAR2(16 BYTE),
  N_POL            VARCHAR2(16 BYTE),
  DS               VARCHAR2(5 BYTE),
  DATE_VR          DATE,
  C_MNN            NUMBER,
  C_TRN            NUMBER,
  DOZ_LS           VARCHAR2(100 BYTE),
  KV_ALL           NUMBER(18,8),
  P_KEK            NUMBER,
  C_FINL           NUMBER,
  S_LR             VARCHAR2(16 BYTE),
  N_LR             NUMBER,
  PR_LR            NUMBER,
  SR_DAY           NUMBER,
  MCOD             VARCHAR2(7 BYTE),
  C_OGRN           VARCHAR2(15 BYTE),
  PCOD             VARCHAR2(22 BYTE),
  V_C_OGRN         VARCHAR2(15 BYTE),
  DATE_OBR         DATE,
  DATE_OTP         DATE,
  DELAYED_SERVICE  NUMBER,
  RECIPEGUID       VARCHAR2(40 BYTE),
  FLAGS            NUMBER,
  PROG_ONLS        NUMBER,
  FD_UPLOAD        DATE                         DEFAULT sysdate
)
TABLESPACE USERS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING
/

COMMENT ON TABLE ASU.TRECIPE_DLO_IMP IS 'ДЛО. Таблица отпущенных(импортированных) рецептов'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_IMP.FK_ID IS 'ключ'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_IMP.FL_DEL IS 'признак удаления'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_IMP.A_COD IS 'Код точки отпуска ЛС (без ОГРН)'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_IMP.A_CODE IS 'Внутрисистемный код пункта  отпуска ЛС (аптеки)'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_IMP.SS IS 'СНИЛС пациента'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_IMP.UKOD IS 'Региональный код пациента'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_IMP.C_KAT IS 'Код  категории гражданина, имеющего право на ГСП. Определяется согласно таблице 9  Приложения к Порядку обмена информацией между отделениями Пенсионного фонда РФ и территориальными фондами ОМС'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_IMP.C_KATL IS 'Код  категории гражданина, имеющего право на ГСП, в соответ-ствии с со столбцом 5 Таблицы соответствия категорий граждан, установленных Федеральным законом от 17.07.99г. № 178-ФЗ "О государственной социальной помощи"'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_IMP.S_POL IS 'Серия полиса'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_IMP.N_POL IS 'Номер полиса'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_IMP.DS IS 'Код диагноза по МКБ-10'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_IMP.DATE_VR IS 'Дата выписки рецепта'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_IMP.C_MNN IS 'Код МНН выписанного ЛС'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_IMP.C_TRN IS 'Код торгового наименования выписанного ЛС'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_IMP.DOZ_LS IS 'Дозировка выписанного ЛС'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_IMP.KV_ALL IS 'Выписанное количество единиц лекарственной формы ЛС'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_IMP.P_KEK IS 'Признак наличия протокола КЭК (0 - нет, 1 - есть)'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_IMP.C_FINL IS 'Источник финансирования'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_IMP.S_LR IS 'Серия рецепта'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_IMP.N_LR IS 'Номер рецепта. Лидирующие нули при импорте не учитываются'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_IMP.PR_LR IS 'Процент льготы рецепта (1 - 100%, 2 - 50%)'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_IMP.SR_DAY IS 'Срок действия рецепта (1 - месяц, 2 - две недели)'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_IMP.MCOD IS 'Код ЛПУ'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_IMP.C_OGRN IS 'ОГРН ЛПУ где выписан рецепт'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_IMP.PCOD IS 'Код врача (фельдшера), указывается без ОГРН ЛПУ'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_IMP.V_C_OGRN IS 'ОГРН ЛПУ где работает врач'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_IMP.DATE_OBR IS 'Дата обращения пациента в аптеку'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_IMP.DELAYED_SERVICE IS 'Признак отложенного обслуживания рецепта'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_IMP.RECIPEGUID IS 'Уникальный идентификатор рецепта (GUID)'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_IMP.FLAGS IS 'Битовые признаки по рецепту (зарезервировано)'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_IMP.PROG_ONLS IS 'Программа ЛЛО'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_IMP.FD_UPLOAD IS 'Дата импорта'
/


--
-- TRECIPE_DLO_IMP_PK  (Index) 
--
--  Dependencies: 
--   TRECIPE_DLO_IMP (Table)
--
CREATE UNIQUE INDEX ASU.TRECIPE_DLO_IMP_PK ON ASU.TRECIPE_DLO_IMP
(FK_ID)
NOLOGGING
TABLESPACE USR
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TRECIPE_DLO_IMP_RECIPEGIUD_IDX  (Index) 
--
--  Dependencies: 
--   TRECIPE_DLO_IMP (Table)
--
CREATE UNIQUE INDEX ASU.TRECIPE_DLO_IMP_RECIPEGIUD_IDX ON ASU.TRECIPE_DLO_IMP
(RECIPEGUID)
NOLOGGING
TABLESPACE USR
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TRECIPE_DLO_IMP_DEL  (Trigger) 
--
--  Dependencies: 
--   TRECIPE_DLO_IMP (Table)
--
CREATE OR REPLACE TRIGGER ASU."TRECIPE_DLO_IMP_DEL"
 BEFORE
  DELETE
 ON ASU.TRECIPE_DLO_IMP REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
  delete from asu.TRECIPE_DLO_IMP_MEDIC t
   where t.FK_RECIPE_IMP_ID = :OLD.FK_ID;
end;
/
SHOW ERRORS;


--
-- TRECIPE_DLO_IMP_INS  (Trigger) 
--
--  Dependencies: 
--   TRECIPE_DLO_IMP (Table)
--
CREATE OR REPLACE TRIGGER ASU."TRECIPE_DLO_IMP_INS"
 BEFORE
  INSERT
 ON ASU.TRECIPE_DLO_IMP REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
  if (:new.fk_id is null) then
    select ASU.SEQ_TRECIPE_DLO_IMP.nextval into :new.fk_id from dual;
  end if;
end;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TRECIPE_DLO_IMP 
-- 
ALTER TABLE ASU.TRECIPE_DLO_IMP ADD (
  CONSTRAINT TRECIPE_DLO_IMP_PK
 PRIMARY KEY
 (FK_ID),
  CONSTRAINT TRECIPE_DLO_IMP_RECIPEGIUD_IDX
 UNIQUE (RECIPEGUID))
/

