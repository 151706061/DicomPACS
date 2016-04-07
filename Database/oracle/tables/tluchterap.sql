DROP TABLE ASU.TLUCHTERAP CASCADE CONSTRAINTS
/

--
-- TLUCHTERAP  (Table) 
--
CREATE TABLE ASU.TLUCHTERAP
(
  FK_ID                      NUMBER(15)         NOT NULL,
  FK_PACID                   NUMBER(15),
  FL_STATUS                  NUMBER(1),
  FD_DATE1                   DATE,
  FD_DATE2                   DATE,
  FK_APPARATID               NUMBER(15),
  FK_VIDLECHIDS              VARCHAR2(200 BYTE),
  FK_METODIDS                VARCHAR2(200 BYTE),
  FK_PRIMENENIEID            NUMBER(15),
  FK_VIDOBLUCHID             NUMBER(15),
  FC_NUMKURS                 VARCHAR2(100 BYTE),
  FK_VRACHID                 NUMBER(15),
  FK_TYPEKARD                NUMBER(1),
  FD_INS                     DATE               DEFAULT sysdate,
  FC_BEFOREPERERIV           VARCHAR2(100 BYTE),
  FC_PERERIV                 VARCHAR2(100 BYTE),
  FC_FTUTEXT                 VARCHAR2(255 BYTE),
  FC_DOPUSL                  VARCHAR2(255 BYTE),
  FK_EKRAN                   NUMBER(15),
  FC_RIK1                    VARCHAR2(50 BYTE),
  FC_RIK2                    VARCHAR2(50 BYTE),
  FC_RIO1                    VARCHAR2(50 BYTE),
  FC_RIO2                    VARCHAR2(50 BYTE),
  FC_DISTCENTERSBYHORIZONT1  VARCHAR2(50 BYTE),
  FC_DISTCENTERSBYHORIZONT2  VARCHAR2(50 BYTE),
  FC_DISTCENTERSBYVERTICAL1  VARCHAR2(50 BYTE),
  FC_DISTCENTERSBYVERTICAL2  VARCHAR2(50 BYTE),
  FP_VELOCITYKACHTYPE1       NUMBER(1),
  FP_VELOCITYKACHTYPE2       NUMBER(1),
  FC_VELOCITYKACH1           VARCHAR2(50 BYTE),
  FC_VELOCITYKACH2           VARCHAR2(50 BYTE),
  FC_ANGLE                   VARCHAR2(50 BYTE),
  FC_AMPLITUDE               VARCHAR2(50 BYTE),
  FK_EFFECT                  NUMBER(15)         DEFAULT -1,
  FK_STANDARTID              NUMBER(15)         DEFAULT -1,
  FK_HEALIDS                 VARCHAR2(200 BYTE),
  FL_SHABLON                 NUMBER(1)          DEFAULT 0,
  FK_OWNERVRACHID            NUMBER(15),
  FC_NAME                    VARCHAR2(200 BYTE),
  FL_FORALL                  NUMBER(1)
)
TABLESPACE USR
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
NOLOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING
/

COMMENT ON TABLE ASU.TLUCHTERAP IS 'Таблица назначенных лучевых терапий.   Author: Slusarenko M.D.  04.06.2013'
/

COMMENT ON COLUMN ASU.TLUCHTERAP.FK_PACID IS 'tkarta.fk_id или tambulance.fk_id'
/

COMMENT ON COLUMN ASU.TLUCHTERAP.FL_STATUS IS 'Статус. 1 - лечение окончено; 0 - лечение не окончено.'
/

COMMENT ON COLUMN ASU.TLUCHTERAP.FD_DATE1 IS 'Дата начала лечения.'
/

COMMENT ON COLUMN ASU.TLUCHTERAP.FD_DATE2 IS 'Дата окончания лечения.'
/

COMMENT ON COLUMN ASU.TLUCHTERAP.FK_APPARATID IS 'Лучевая установка (id из ветки tsmid с синонимом LUCHTERAPIYA_APPARAT)'
/

COMMENT ON COLUMN ASU.TLUCHTERAP.FK_VIDLECHIDS IS 'Вид лечения - может быть несколько (перечисленные через запятую id из ветки tsmid с синонимом LUCHTERAPIYA_VIDLECH)'
/

COMMENT ON COLUMN ASU.TLUCHTERAP.FK_METODIDS IS 'Методика лучевой терапии - может быть несколько (перечисленные через запятую id из ветки tsmid с синонимом LUCHTERAPIYA_METOD)'
/

COMMENT ON COLUMN ASU.TLUCHTERAP.FK_PRIMENENIEID IS 'Применение на этапах лечения (id из ветки tsmid с синонимом LUCHTERAPIYA_PRIMENENIE)'
/

COMMENT ON COLUMN ASU.TLUCHTERAP.FK_VIDOBLUCHID IS 'Вид облучения (id из ветки tsmid с синонимом LUCHTERAPIYA_VIDOBLUCH)'
/

COMMENT ON COLUMN ASU.TLUCHTERAP.FC_NUMKURS IS 'Номер курса (вводится от руки)'
/

COMMENT ON COLUMN ASU.TLUCHTERAP.FK_VRACHID IS 'Врач, назначивший курс'
/

COMMENT ON COLUMN ASU.TLUCHTERAP.FK_TYPEKARD IS 'Тип карты. 0 - Близкофокусная лучевая терапия; 1 - Дистанционная гамма терапия (гинекология); 2 - Дистанционная гамма терапия (общий вариант)'
/

COMMENT ON COLUMN ASU.TLUCHTERAP.FD_INS IS 'Дата создания курса'
/

COMMENT ON COLUMN ASU.TLUCHTERAP.FC_BEFOREPERERIV IS 'Облучение до перерыва (дней)'
/

COMMENT ON COLUMN ASU.TLUCHTERAP.FC_PERERIV IS 'Перерыв в облучении (дней)'
/

COMMENT ON COLUMN ASU.TLUCHTERAP.FC_FTUTEXT IS 'Физико-технические условия (текст)'
/

COMMENT ON COLUMN ASU.TLUCHTERAP.FC_DOPUSL IS 'Физико-технические условия (доп. условия)'
/

COMMENT ON COLUMN ASU.TLUCHTERAP.FK_EKRAN IS 'Физико-технические условия (экранизация свинцовой пластиной - id из ветки tsmid с синонимом LUCHTERAPIYA_EKRAN)'
/

COMMENT ON COLUMN ASU.TLUCHTERAP.FC_RIK1 IS 'Физико-технические условия (РИК 1-го этапа) - если этап всего 1, то РИК сохраняется в это поле'
/

COMMENT ON COLUMN ASU.TLUCHTERAP.FC_RIK2 IS 'Физико-технические условия (РИК 2-го этапа)'
/

COMMENT ON COLUMN ASU.TLUCHTERAP.FC_RIO1 IS 'Физико-технические условия (РИО 1-го этапа) - если этап всего 1, то РИО сохраняется в это поле'
/

COMMENT ON COLUMN ASU.TLUCHTERAP.FC_RIO2 IS 'Физико-технические условия (РИО 2-го этапа)'
/

COMMENT ON COLUMN ASU.TLUCHTERAP.FC_DISTCENTERSBYHORIZONT1 IS 'Физико-технические условия (Расстояние между центрами качения по горизонтали 1-го этапа) - если этап всего 1, то Расстояние по гозизонтали сохраняется в это поле'
/

COMMENT ON COLUMN ASU.TLUCHTERAP.FC_DISTCENTERSBYHORIZONT2 IS 'Физико-технические условия (Расстояние между центрами качения по горизонтали 2-го этапа)'
/

COMMENT ON COLUMN ASU.TLUCHTERAP.FC_DISTCENTERSBYVERTICAL1 IS 'Физико-технические условия (Расстояние между центрами качения по вертикали 1-го этапа) - если этап всего 1, то Расстояние по вертикали сохраняется в это поле'
/

COMMENT ON COLUMN ASU.TLUCHTERAP.FC_DISTCENTERSBYVERTICAL2 IS 'Физико-технические условия (Расстояние между центрами качения по вертикали 2-го этапа)'
/

COMMENT ON COLUMN ASU.TLUCHTERAP.FP_VELOCITYKACHTYPE1 IS 'Физико-технические условия (Тип скорости качения для 1-го этапа. 0 - постоянная; 1 - переменная) - если этап всего 1, то Тип скорости качения сохраняется в это поле'
/

COMMENT ON COLUMN ASU.TLUCHTERAP.FP_VELOCITYKACHTYPE2 IS 'Физико-технические условия (Тип скорости качения для 2-го этапа. 0 - постоянная; 1 - переменная)'
/

COMMENT ON COLUMN ASU.TLUCHTERAP.FC_VELOCITYKACH1 IS 'Физико-технические условия (Скорость качения 1-го этапа) - если этап всего 1, то Скорость качения сохраняется в это поле'
/

COMMENT ON COLUMN ASU.TLUCHTERAP.FC_VELOCITYKACH2 IS 'Физико-технические условия (Скорость качения 2-го этапа)'
/

COMMENT ON COLUMN ASU.TLUCHTERAP.FC_ANGLE IS 'Физико-технические условия (Угол наклона центр. оси пучка излучения)'
/

COMMENT ON COLUMN ASU.TLUCHTERAP.FC_AMPLITUDE IS 'Физико-технические условия (Амплитуда)'
/

COMMENT ON COLUMN ASU.TLUCHTERAP.FK_EFFECT IS 'Эффективность лечения (id из ветки asu.tsmid с синонимом LUCHTERAPIYA_EFFECTLECH)'
/

COMMENT ON COLUMN ASU.TLUCHTERAP.FK_STANDARTID IS 'TSTANDART.FK_ID   (ID кода КСГ)'
/

COMMENT ON COLUMN ASU.TLUCHTERAP.FK_HEALIDS IS 'Коды услуг, установленные для курса - может быть несколько (перечисленные через запятую FK_ID из THEAL)'
/

COMMENT ON COLUMN ASU.TLUCHTERAP.FL_SHABLON IS 'ШАБЛОН: 0 - реальный курс лучевой терапии, 1 - шаблон курса лучевой терапии'
/

COMMENT ON COLUMN ASU.TLUCHTERAP.FK_OWNERVRACHID IS 'ШАБЛОН: Пользователь, создавший шаблон'
/

COMMENT ON COLUMN ASU.TLUCHTERAP.FC_NAME IS 'ШАБЛОН: Наименование шаблона'
/

COMMENT ON COLUMN ASU.TLUCHTERAP.FL_FORALL IS 'ШАБЛОН: 0 - пользовательский шаблон (использует и пересохраняет/удаляет только владелец), 1 - доступен всем пользователям (используют все пользователи, пересохраняет/удаляет только владелец)'
/


--
-- TLUCHTERAP_BI  (Trigger) 
--
--  Dependencies: 
--   TLUCHTERAP (Table)
--
CREATE OR REPLACE TRIGGER ASU.TLUCHTERAP_BI
  before insert ON ASU.TLUCHTERAP   REFERENCING NEW AS NEW OLD AS OLD
  for each row
declare
  -- local variables here
begin
  select asu.seq_tluchterap.nextval into :new.fk_id from dual;
end;
/
SHOW ERRORS;


