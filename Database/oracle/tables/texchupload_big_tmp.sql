DROP TABLE ASU.TEXCHUPLOAD_BIG_TMP CASCADE CONSTRAINTS
/

--
-- TEXCHUPLOAD_BIG_TMP  (Table) 
--
CREATE GLOBAL TEMPORARY TABLE ASU.TEXCHUPLOAD_BIG_TMP
(
  FK_ID             NUMBER,
  FK_OMS_ID         NUMBER,
  FK_AMBID          NUMBER,
  FC_DOCVIDAN       VARCHAR2(100 BYTE),
  FK_VIDDOC_EIS     NUMBER,
  FC_PAC_SNILS      VARCHAR2(50 BYTE),
  FK_EIS_TRAVM      NUMBER,
  OTKAZ_GOSP        VARCHAR2(10 BYTE),
  FN_DNST           NUMBER,
  FC_DNU            VARCHAR2(10 BYTE),
  LPU_NAPR          VARCHAR2(100 BYTE),
  FK_TYPEDOC_EIS    NUMBER,
  FK_OTDELID_S      NUMBER,
  FP_OUT            NUMBER,
  FD_OUT            DATE,
  FN_TYPE_PODR      NUMBER,
  FC_DOCSER         VARCHAR2(10 BYTE),
  FC_DOCNUM         VARCHAR2(10 BYTE),
  FD_DOCDATE        DATE,
  FP_CHECKED        NUMBER(1),
  FP_LOADED         NUMBER(1),
  FP_IN_FOMS        NUMBER(1),
  FC_SMK_NAME       VARCHAR2(250 BYTE),
  FC_STRAH_ADDR     VARCHAR2(250 BYTE),
  FC_LIFE_ADDR      VARCHAR2(250 BYTE),
  FN_KDN            NUMBER,
  IS_POLICY_GOOD    NUMBER(1),
  POLICYBEG         DATE,
  POLICYEND         DATE,
  POLICYSER         VARCHAR2(30 BYTE),
  POLICYNUM         VARCHAR2(30 BYTE),
  POLICYTYPE        VARCHAR2(20 BYTE),
  SNAME             VARCHAR2(30 BYTE),
  FNAME             VARCHAR2(30 BYTE),
  MNAME             VARCHAR2(30 BYTE),
  DDMMYYYY          DATE,
  POL               CHAR(1 BYTE),
  NACIONAL          VARCHAR2(30 BYTE),
  COUNTRY           VARCHAR2(30 BYTE),
  STATE             VARCHAR2(50 BYTE),
  RON               VARCHAR2(30 BYTE),
  CITYPAS           VARCHAR2(30 BYTE),
  VILLAGE           VARCHAR2(30 BYTE),
  STREETPAS         VARCHAR2(40 BYTE),
  DOMPAS            VARCHAR2(10 BYTE),
  KORPAS            VARCHAR2(10 BYTE),
  FLATPAS           VARCHAR2(10 BYTE),
  FC_ADR            VARCHAR2(100 BYTE),
  MR                VARCHAR2(100 BYTE),
  DIA_SD            VARCHAR2(10 BYTE),
  DIA_O             VARCHAR2(10 BYTE),
  DIA_C             VARCHAR2(10 BYTE),
  DIA_E             VARCHAR2(10 BYTE),
  DATE_S            DATE,
  DATE_E            DATE,
  EXITUS            VARCHAR2(30 BYTE),
  DOC_FIO           VARCHAR2(100 BYTE),
  DOCSPEC           VARCHAR2(70 BYTE),
  FK_DOCSPEC        NUMBER,
  DESTROY           VARCHAR2(50 BYTE),
  KOL_POS           NUMBER,
  TYPE_PODR         NUMBER(1),
  KEM_NAPR          VARCHAR2(50 BYTE),
  ID_ILL            NUMBER,
  SMK_ID_P          NUMBER,
  SMK_ID            NUMBER,
  TYPEDOG           NUMBER(1),
  PROTOCOL          NUMBER,
  N_MAP             NUMBER,
  PID               NUMBER,
  SSD               VARCHAR2(50 BYTE),
  SUM_OPL           NUMBER,
  FK_PEPLID         NUMBER,
  POLICYID          NUMBER,
  FC_TOMP           VARCHAR2(10 BYTE),
  FC_SOP_TOMP       VARCHAR2(10 BYTE),
  FC_SERVPLACE      VARCHAR2(30 BYTE),
  TYPEPLACE         NUMBER(1),
  ILLKIND           NUMBER,
  FC_OTDEL_S        VARCHAR2(100 BYTE),
  PL                NUMBER(1),
  EXITUS_DOP        NUMBER(5),
  ILLKIND_NAME      VARCHAR2(255 BYTE),
  AGENT_STATUS      NUMBER,
  AGENT_SUR_NAME    VARCHAR2(30 BYTE),
  AGENT_FIRST_NAME  VARCHAR2(20 BYTE),
  AGENT_PATR_NAME   VARCHAR2(20 BYTE),
  AGENT_VDK         NUMBER,
  AGENT_DOCSER      VARCHAR2(10 BYTE),
  AGENT_DOCNUM      VARCHAR2(10 BYTE),
  AGENT_DATE_V      VARCHAR2(10 BYTE),
  AGENT_KEM         VARCHAR2(100 BYTE),
  MOVE_S            NUMBER(4),
  T_PILL            NUMBER(1),
  INSP_RW           NUMBER(1),
  INSP_VICH         NUMBER(1),
  ID_TREAT          NUMBER(1),
  KOIKA             NUMBER,
  P_DIA_E           VARCHAR2(10 BYTE),
  OTKL              NUMBER(1),
  SOST_OP           NUMBER(1),
  DATE_O            DATE,
  DATE_C            DATE,
  NUM_NAPRAV        VARCHAR2(10 BYTE),
  DIA_SOUR_PR       VARCHAR2(10 BYTE),
  NACIONAL_ID       NUMBER(3),
  HEMO              NUMBER,
  ALLERG            VARCHAR2(30 BYTE),
  PHONE             VARCHAR2(16 BYTE),
  PROF              NUMBER(3),
  EXT_PID           NUMBER,
  DISP_DATE_S       DATE,
  DISP_DIA          VARCHAR2(10 BYTE),
  DISP_DATE_E       DATE,
  DISP_CAUSE        NUMBER(2),
  DISP_DOCOR_S      NUMBER(5),
  DISP_DOCTOR_E     NUMBER(5),
  DISP_LPU          NUMBER(4),
  DISP_LPU_NAME     VARCHAR2(100 BYTE),
  ID_CARD           NUMBER(20),
  DATE_OPEN_CARD    VARCHAR2(10 BYTE),
  DATE_CLOSED_CARD  VARCHAR2(10 BYTE),
  ADD_CARD_NUMBER   VARCHAR2(100 BYTE),
  DATE_NAPR         VARCHAR2(10 BYTE),
  PROFMP_ID         NUMBER(9),
  SOTR_ID           NUMBER,
  POLICY_TYPE_ID    NUMBER(2),
  STANDARD_TYPE_ID  NUMBER(1),
  BIRD_PLACE_NAME   VARCHAR2(100 BYTE),
  N_UCH             NUMBER(3),
  TYPE_UCH          NUMBER(2),
  DATE_START_UCH    VARCHAR2(10 BYTE),
  DATE_END_UCH      VARCHAR2(10 BYTE),
  AGENT_POL         VARCHAR2(1 BYTE),
  AGENT_DR          VARCHAR2(10 BYTE),
  TYPE_V_MU         NUMBER(1),
  MODERN            NUMBER(1),
  DOC_NAME_S        VARCHAR2(100 BYTE),
  DOCSPEC_S         NUMBER(5),
  DOCSPEC_S_NAME    VARCHAR2(70 BYTE),
  FK_OTDELID_E      NUMBER,
  FC_OTDEL_E        VARCHAR2(100 BYTE),
  ENP               VARCHAR2(20 BYTE),
  DISP_KAT          NUMBER(2),
  GZ                NUMBER(1),
  DISP_RES          NUMBER(1),
  AMB_PR            NUMBER(2),
  FK_USLVIDID       NUMBER
)
ON COMMIT PRESERVE ROWS
NOCACHE
/

COMMENT ON TABLE ASU.TEXCHUPLOAD_BIG_TMP IS 'Временная таблица №2 для выгрузки страховых данных Author:Linnikov 20080110'
/

COMMENT ON COLUMN ASU.TEXCHUPLOAD_BIG_TMP.INSP_RW IS 'Обследование на RW (1-да, 0-нет)'
/

COMMENT ON COLUMN ASU.TEXCHUPLOAD_BIG_TMP.INSP_VICH IS 'Обследование на AIDS (1-да, 0-нет)'
/

COMMENT ON COLUMN ASU.TEXCHUPLOAD_BIG_TMP.ID_TREAT IS 'Дефекты догоспитального этапа (1-несвоевременность, 2-недост. Объем кл/диаг обследования, 3-неправильная тактика, 4-несовп. Д-за лечения)'
/

COMMENT ON COLUMN ASU.TEXCHUPLOAD_BIG_TMP.KOIKA IS 'Вид койки (передавать пустым)'
/

COMMENT ON COLUMN ASU.TEXCHUPLOAD_BIG_TMP.P_DIA_E IS 'Диагноз патологоанатомический'
/

COMMENT ON COLUMN ASU.TEXCHUPLOAD_BIG_TMP.OTKL IS 'Признак отклонения пат. от диаг. (1- дa, 0 – нет)'
/

COMMENT ON COLUMN ASU.TEXCHUPLOAD_BIG_TMP.SOST_OP IS 'Состояние опьянения (1 – алкогольное, 2 – наркотическое)'
/

COMMENT ON COLUMN ASU.TEXCHUPLOAD_BIG_TMP.DATE_O IS 'Дата диагноза осложнения (dd.mm.yyyy)'
/

COMMENT ON COLUMN ASU.TEXCHUPLOAD_BIG_TMP.DATE_C IS 'Дата диагноза сопутствующего (dd.mm.yyyy)'
/

COMMENT ON COLUMN ASU.TEXCHUPLOAD_BIG_TMP.NUM_NAPRAV IS 'Номер направления'
/

COMMENT ON COLUMN ASU.TEXCHUPLOAD_BIG_TMP.DIA_SOUR_PR IS 'Код диагноза приемного отделения (Удалено http://192.168.1.2:15000/redmine/issues/show/8415)'
/

COMMENT ON COLUMN ASU.TEXCHUPLOAD_BIG_TMP.NACIONAL_ID IS 'Национальность (справочник NATIONAL)'
/

COMMENT ON COLUMN ASU.TEXCHUPLOAD_BIG_TMP.HEMO IS 'Код группы крови (справочник HEMO)'
/

COMMENT ON COLUMN ASU.TEXCHUPLOAD_BIG_TMP.ALLERG IS 'Лекарственная непереносимость'
/

COMMENT ON COLUMN ASU.TEXCHUPLOAD_BIG_TMP.PHONE IS 'Телефон'
/

COMMENT ON COLUMN ASU.TEXCHUPLOAD_BIG_TMP.PROF IS 'Профессия (справочник PROFES)'
/

COMMENT ON COLUMN ASU.TEXCHUPLOAD_BIG_TMP.EXT_PID IS 'Уникальный внешний код пациента'
/

COMMENT ON COLUMN ASU.TEXCHUPLOAD_BIG_TMP.DISP_DATE_S IS 'Дисп. учет Дата постановки '
/

COMMENT ON COLUMN ASU.TEXCHUPLOAD_BIG_TMP.DISP_DIA IS 'Дисп. учет Код диагноза'
/

COMMENT ON COLUMN ASU.TEXCHUPLOAD_BIG_TMP.DISP_DATE_E IS 'Дисп. учет Дата снятия '
/

COMMENT ON COLUMN ASU.TEXCHUPLOAD_BIG_TMP.DISP_CAUSE IS 'Дисп. учет Код причины снятия '
/

COMMENT ON COLUMN ASU.TEXCHUPLOAD_BIG_TMP.DISP_DOCOR_S IS 'Дисп. учет Врач поставивший'
/

COMMENT ON COLUMN ASU.TEXCHUPLOAD_BIG_TMP.DISP_DOCTOR_E IS 'Дисп. учет Врач, снявший'
/

COMMENT ON COLUMN ASU.TEXCHUPLOAD_BIG_TMP.DISP_LPU IS 'Дисп. учет Код ЛПУ'
/

COMMENT ON COLUMN ASU.TEXCHUPLOAD_BIG_TMP.DISP_LPU_NAME IS 'Дисп. учет Наименование ЛПУ'
/

COMMENT ON COLUMN ASU.TEXCHUPLOAD_BIG_TMP.ID_CARD IS 'Код амбулаторной карты (уникальный для внешней системы)'
/

COMMENT ON COLUMN ASU.TEXCHUPLOAD_BIG_TMP.DATE_OPEN_CARD IS 'Дата заведения амбулаторной карты (dd.mm.yyyy)'
/

COMMENT ON COLUMN ASU.TEXCHUPLOAD_BIG_TMP.DATE_CLOSED_CARD IS 'Дата закрытия амбулаторной карты (dd.mm.yyyy)'
/

COMMENT ON COLUMN ASU.TEXCHUPLOAD_BIG_TMP.ADD_CARD_NUMBER IS 'Дополнение к номеру карты'
/

COMMENT ON COLUMN ASU.TEXCHUPLOAD_BIG_TMP.DATE_NAPR IS 'Дата направления (dd.mm.yyyy)'
/

COMMENT ON COLUMN ASU.TEXCHUPLOAD_BIG_TMP.PROFMP_ID IS 'Профиль медицинской помощи (Справочник EXT_PROFMP)'
/

COMMENT ON COLUMN ASU.TEXCHUPLOAD_BIG_TMP.SOTR_ID IS 'TSOTR.FK_ID врача ФИО которого передаётся в DOC_FIO'
/

COMMENT ON COLUMN ASU.TEXCHUPLOAD_BIG_TMP.POLICY_TYPE_ID IS 'Тип документа, подтверждающего право на ОМС (Справочник EXT_POLICY_TYPE)'
/

COMMENT ON COLUMN ASU.TEXCHUPLOAD_BIG_TMP.STANDARD_TYPE_ID IS 'Вид стандарта медицинской помощи Справочник (STANDARD_TYPE)'
/

COMMENT ON COLUMN ASU.TEXCHUPLOAD_BIG_TMP.BIRD_PLACE_NAME IS 'Место рождения пациента в соответствии с документом удостоверяющем личность.
Заполняется у иногородних пациентов
'
/

COMMENT ON COLUMN ASU.TEXCHUPLOAD_BIG_TMP.N_UCH IS 'Номер участка'
/

COMMENT ON COLUMN ASU.TEXCHUPLOAD_BIG_TMP.TYPE_UCH IS 'Тип Участка справочник ОФОМС.
Может принимать  значения.
1 – терапевтический,
2 – врача общей практики,
3 – семейного врача,
4 – педиатрический,
5–комплексный терапевтический,
6 – Женская консультация,
7 – Стоматология.
'
/

COMMENT ON COLUMN ASU.TEXCHUPLOAD_BIG_TMP.DATE_START_UCH IS 'Дата прикрепления к участку'
/

COMMENT ON COLUMN ASU.TEXCHUPLOAD_BIG_TMP.DATE_END_UCH IS 'Дата открепления от участка'
/

COMMENT ON COLUMN ASU.TEXCHUPLOAD_BIG_TMP.AGENT_POL IS 'Пол представителя. Заполняется у иногородних пациентов (‘М’, ’Ж’)'
/

COMMENT ON COLUMN ASU.TEXCHUPLOAD_BIG_TMP.AGENT_DR IS 'Дата рождения представителя. Заполняется у иногородних пациентов'
/

COMMENT ON COLUMN ASU.TEXCHUPLOAD_BIG_TMP.TYPE_V_MU IS 'Тип вида медицинской помощи (справочник ХМ ОФОМС TYPE_PMSP)'
/

COMMENT ON COLUMN ASU.TEXCHUPLOAD_BIG_TMP.MODERN IS 'Признак оказания помощи в рамках модернизации. (1 если в рамках)'
/

COMMENT ON COLUMN ASU.TEXCHUPLOAD_BIG_TMP.DOC_NAME_S IS 'Фамилия, имя и отчество лечащего врача в профильном отделении, куда поступил пациент из приемного отделения'
/

COMMENT ON COLUMN ASU.TEXCHUPLOAD_BIG_TMP.DOCSPEC_S IS 'Специальность врача  в профильном отделении, куда поступил пациент из приемного отделения'
/

COMMENT ON COLUMN ASU.TEXCHUPLOAD_BIG_TMP.DOCSPEC_S_NAME IS 'Название специальности врача  в профильном отделении, куда поступил пациент из приемного отделения'
/

COMMENT ON COLUMN ASU.TEXCHUPLOAD_BIG_TMP.DISP_KAT IS 'Категория граждан, подлежащих диспансеризации (обязательно в случаи ДДН) '
/

COMMENT ON COLUMN ASU.TEXCHUPLOAD_BIG_TMP.GZ IS 'Группы состояния здоровья граждан по итогам диспансеризации, проф. (обязательно в случаи ДДН) '
/

COMMENT ON COLUMN ASU.TEXCHUPLOAD_BIG_TMP.DISP_RES IS 'Направление гражданина на II этап диспансеризации (обязательно в случаи ДДН)'
/

COMMENT ON COLUMN ASU.TEXCHUPLOAD_BIG_TMP.AMB_PR IS 'Виды посещений при оказании медицинской помощи в амбулаторных условиях в рамках программ ОМС(справочник ХМ ОФОМС AMB_PR)'
/

COMMENT ON COLUMN ASU.TEXCHUPLOAD_BIG_TMP.PL IS 'Экстреннно\планово [Added 20090216 by Linnikov]'
/

COMMENT ON COLUMN ASU.TEXCHUPLOAD_BIG_TMP.EXITUS_DOP IS 'Дополнительный исход заболевания [Added 20090505 by Linnikov]'
/

COMMENT ON COLUMN ASU.TEXCHUPLOAD_BIG_TMP.ILLKIND_NAME IS 'Характер заболевания [TSMID.FC_NAME]'
/

COMMENT ON COLUMN ASU.TEXCHUPLOAD_BIG_TMP.AGENT_STATUS IS 'Статус представителя пациента'
/

COMMENT ON COLUMN ASU.TEXCHUPLOAD_BIG_TMP.AGENT_SUR_NAME IS 'Фамилия родителя (представителя) пациента'
/

COMMENT ON COLUMN ASU.TEXCHUPLOAD_BIG_TMP.AGENT_FIRST_NAME IS 'Имя родителя (представителя) пациента'
/

COMMENT ON COLUMN ASU.TEXCHUPLOAD_BIG_TMP.AGENT_PATR_NAME IS 'Отчество родителя (представителя) пациента'
/

COMMENT ON COLUMN ASU.TEXCHUPLOAD_BIG_TMP.AGENT_VDK IS 'Тип документа, удостоверяющего личность представителя'
/

COMMENT ON COLUMN ASU.TEXCHUPLOAD_BIG_TMP.AGENT_DOCSER IS 'Серия документа, удостоверяющего личность представителя'
/

COMMENT ON COLUMN ASU.TEXCHUPLOAD_BIG_TMP.AGENT_DOCNUM IS 'Номер документа, удостоверяющего личность представителя'
/

COMMENT ON COLUMN ASU.TEXCHUPLOAD_BIG_TMP.AGENT_DATE_V IS 'Дата выдачи документа, удостоверяющего личность представителя'
/

COMMENT ON COLUMN ASU.TEXCHUPLOAD_BIG_TMP.AGENT_KEM IS 'Кем выдан документ, удостоверяющий личность представителя'
/

COMMENT ON COLUMN ASU.TEXCHUPLOAD_BIG_TMP.MOVE_S IS 'Кем доставлен в ЛПУ (справочник MOVINGS)'
/

COMMENT ON COLUMN ASU.TEXCHUPLOAD_BIG_TMP.T_PILL IS 'Доставлен в стационар от начала заболевания (справочник T_PILL)'
/


