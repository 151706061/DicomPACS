DROP TABLE ASU.VNAZ_COST CASCADE CONSTRAINTS
/

--
-- VNAZ_COST  (Table) 
--
CREATE GLOBAL TEMPORARY TABLE ASU.VNAZ_COST
(
  HEAL_COUNT             NUMBER,
  FK_TALONID             NUMBER(15),
  ID_ILL_U               NUMBER,
  NAZ_ID                 NUMBER(15),
  NAZHEAL_HEALID         NUMBER(15),
  COST_TYPE_OMS          NUMBER,
  FK_HEALID_OMS          NUMBER,
  HEAL_CODE_OMS          VARCHAR2(15 BYTE),
  FN_COST_OMS            NUMBER,
  COST_TYPE_DMS          NUMBER,
  FK_HEALID_DMS          NUMBER,
  HEAL_CODE_DMS          VARCHAR2(15 BYTE),
  FN_COST_DMS            NUMBER,
  COST_TYPE_KOMERC       NUMBER,
  FK_HEALID_KOMERC       NUMBER,
  HEAL_CODE_KOMERC       VARCHAR2(15 BYTE),
  FN_COST_KOMERC         NUMBER,
  COST_TYPE_DOGOVOR      NUMBER,
  FK_HEALID_DOGOVOR      NUMBER,
  HEAL_CODE_DOGOVOR      VARCHAR2(15 BYTE),
  FN_COST_DOGOVOR        NUMBER,
  COST_TYPE_BUDZHET      NUMBER,
  FK_HEALID_BUDZHET      NUMBER,
  HEAL_CODE_BUDZHET      VARCHAR2(15 BYTE),
  FN_COST_BUDZHET        NUMBER,
  COST_TYPE_UDOST        NUMBER,
  FK_HEALID_UDOST        NUMBER,
  HEAL_CODE_UDOST        VARCHAR2(15 BYTE),
  FN_COST_UDOST          NUMBER,
  COST_TYPE_OBOSNOVANIE  NUMBER,
  FK_HEALID_OBOSNOVANIE  NUMBER,
  HEAL_CODE_OBOSNOVANIE  VARCHAR2(15 BYTE),
  FN_COST_OBOSNOVANIE    NUMBER,
  COST_TYPE_SERTIFIKAT   NUMBER,
  FK_HEALID_SERTIFIKAT   NUMBER,
  HEAL_CODE_SERTIFIKAT   VARCHAR2(15 BYTE),
  FN_COST_SERTIFIKAT     NUMBER,
  TALON_TYPEDOC_SYN      VARCHAR2(50 BYTE),
  FK_PACID               NUMBER(15),
  FK_PEPLID              NUMBER(15),
  IS_REFUSE              NUMBER,
  DATE_E_U               DATE,
  DATE_B_U               DATE,
  DATE_E_U_TIME          DATE,
  DATE_B_U_TIME          DATE,
  FK_ISPOLID             NUMBER(15),
  FK_VRACHID             NUMBER(15),
  FK_SOTRID              NUMBER,
  FK_INSURDOCS           NUMBER,
  FK_IC_ID               NUMBER(15),
  FK_HEALID              NUMBER,
  HEAL_CODE              VARCHAR2(40 BYTE),
  FN_COST                NUMBER,
  FK_TARIF_TYPE          NUMBER(2)
)
ON COMMIT PRESERVE ROWS
NOCACHE
/

COMMENT ON TABLE ASU.VNAZ_COST IS 'Таблица используется для хранения результатов, выбранных из asu.vnaz_cost Author:Efimov'
/

COMMENT ON COLUMN ASU.VNAZ_COST.FK_PACID IS 'Карта ASU.TAMBULANCE.FK_ID или ASU.TKARTA.FK_ID'
/

COMMENT ON COLUMN ASU.VNAZ_COST.FK_PEPLID IS 'ASU.TPEOPLES.FK_ID'
/

COMMENT ON COLUMN ASU.VNAZ_COST.IS_REFUSE IS '1 - отказ в госпитализации'
/

COMMENT ON COLUMN ASU.VNAZ_COST.DATE_E_U IS 'Дата начала услуги с точностью до дня'
/

COMMENT ON COLUMN ASU.VNAZ_COST.DATE_B_U IS 'Дата окончания услуги с точностью до дня'
/

COMMENT ON COLUMN ASU.VNAZ_COST.DATE_E_U_TIME IS 'Дата начала услуги с учётом времени'
/

COMMENT ON COLUMN ASU.VNAZ_COST.DATE_B_U_TIME IS 'Дата окончания услуги с учётом времени'
/

COMMENT ON COLUMN ASU.VNAZ_COST.FK_ISPOLID IS 'Исполнитель LOGIN.TSOTR.FK_ID'
/

COMMENT ON COLUMN ASU.VNAZ_COST.FK_VRACHID IS 'Врач, проподивший исследования LOGIN.TSOTR.FK_ID'
/

COMMENT ON COLUMN ASU.VNAZ_COST.FK_SOTRID IS 'Илиполнитель, если задан, если нет, то врач проводивший исследования'
/

COMMENT ON COLUMN ASU.VNAZ_COST.FK_INSURDOCS IS 'Документ страхового обслуживания ASU.TINSURDOCS.FK_ID'
/

COMMENT ON COLUMN ASU.VNAZ_COST.FK_IC_ID IS 'Страховая компания ASU.TCOMPANY.FK_ID'
/

COMMENT ON COLUMN ASU.VNAZ_COST.FK_HEALID IS 'ASU.THEAL.FK_ID. Услуга, выбирается из услуг разных типов, если тип оплаты совпадается с типом оплаты талона и по датам услуга является актуальной на время рассчёта стоимости'
/

COMMENT ON COLUMN ASU.VNAZ_COST.HEAL_CODE IS 'Код услуги'
/

COMMENT ON COLUMN ASU.VNAZ_COST.FN_COST IS 'Цена услуги'
/

COMMENT ON COLUMN ASU.VNAZ_COST.FK_TARIF_TYPE IS '0 - Обычные услуги, 1 - диспансеризация, 2 - профосмотры детей, 3 - скорая помощь'
/

COMMENT ON COLUMN ASU.VNAZ_COST.HEAL_COUNT IS 'кол-во'
/

COMMENT ON COLUMN ASU.VNAZ_COST.FK_TALONID IS 'Талон ASU.TAMBTALON.FK_ID'
/

COMMENT ON COLUMN ASU.VNAZ_COST.ID_ILL_U IS 'ASU.VNAZ.FK_ID или ASU.TNAZHEAL.FK_ID'
/

COMMENT ON COLUMN ASU.VNAZ_COST.NAZ_ID IS 'ASU.VNAZ.FK_ID'
/

COMMENT ON COLUMN ASU.VNAZ_COST.NAZHEAL_HEALID IS 'ASU.TNAZHEAL.FK_ID'
/

COMMENT ON COLUMN ASU.VNAZ_COST.COST_TYPE_OMS IS 'Тип цены ОМС (3 -- тариф, т.е. цена подходящая по всем параметрам, 2 -- актуальная цена, которая относится к услуге, связанной с назначением, но не подходит для случая по дополниельным параметрам(например услуга связана с назначением, но не выбрана в SetUsluga), 1 -- последняя по срокам действия цена для данного типа оплаты'
/

COMMENT ON COLUMN ASU.VNAZ_COST.FK_HEALID_OMS IS 'ASU.THEAL.FK_ID. Услуга по ОМС'
/

COMMENT ON COLUMN ASU.VNAZ_COST.HEAL_CODE_OMS IS 'Код услуга по ОМС'
/

COMMENT ON COLUMN ASU.VNAZ_COST.FN_COST_OMS IS 'Цена по ОМС (ниже аналогично по другим типам оплаты, название указывает на синоним ASU.TTYPEDOC.FC_SYNONIM)'
/

COMMENT ON COLUMN ASU.VNAZ_COST.TALON_TYPEDOC_SYN IS 'Тип оплаты талона'
/


--
-- I_VNAZ_COST_TARIF_TYPE  (Index) 
--
--  Dependencies: 
--   VNAZ_COST (Table)
--
CREATE INDEX ASU.I_VNAZ_COST_TARIF_TYPE ON ASU.VNAZ_COST
(FK_TARIF_TYPE)
/


