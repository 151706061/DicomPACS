DROP TABLE ASU.TEXCHUPLOAD_OPER CASCADE CONSTRAINTS
/

--
-- TEXCHUPLOAD_OPER  (Table) 
--
CREATE GLOBAL TEMPORARY TABLE ASU.TEXCHUPLOAD_OPER
(
  PID        NUMBER                             NOT NULL,
  ID_ILL     NUMBER                             NOT NULL,
  ID_SERV    NUMBER                             NOT NULL,
  N_MAP      NUMBER                             NOT NULL,
  PLACE_OP   NUMBER                             NOT NULL,
  DATE_OPER  VARCHAR2(19 BYTE),
  MORPHEY    NUMBER,
  DOC_NAME   VARCHAR2(100 BYTE)                 NOT NULL,
  DOC_SPEC   NUMBER,
  TYPE_OPER  NUMBER,
  COMPL      VARCHAR2(50 BYTE),
  O_ANASTEZ  VARCHAR2(30 BYTE),
  O_OPERATS  VARCHAR2(30 BYTE)
)
ON COMMIT DELETE ROWS
NOCACHE
/

COMMENT ON TABLE ASU.TEXCHUPLOAD_OPER IS 'Операции для выгрузки в БД мединфоцентра Author: Linnikov'
/

COMMENT ON COLUMN ASU.TEXCHUPLOAD_OPER.PID IS 'Идентификатор пациента'
/

COMMENT ON COLUMN ASU.TEXCHUPLOAD_OPER.ID_ILL IS 'Идентификатор случая'
/

COMMENT ON COLUMN ASU.TEXCHUPLOAD_OPER.ID_SERV IS 'Идентификатор услуги'
/

COMMENT ON COLUMN ASU.TEXCHUPLOAD_OPER.N_MAP IS 'Номер медицинской карты'
/

COMMENT ON COLUMN ASU.TEXCHUPLOAD_OPER.PLACE_OP IS 'Отделение операции'
/

COMMENT ON COLUMN ASU.TEXCHUPLOAD_OPER.DATE_OPER IS 'Дата операции, формат дд.мм.гггг чч:мм:сс, значение по умолчанию sysdate'
/

COMMENT ON COLUMN ASU.TEXCHUPLOAD_OPER.MORPHEY IS 'Тип наркоза (MORPHEY)'
/

COMMENT ON COLUMN ASU.TEXCHUPLOAD_OPER.DOC_NAME IS 'Фамилия, имя и отчество врача'
/

COMMENT ON COLUMN ASU.TEXCHUPLOAD_OPER.DOC_SPEC IS 'Специальность врача'
/

COMMENT ON COLUMN ASU.TEXCHUPLOAD_OPER.TYPE_OPER IS 'Тип операции (1-плановая, 2-экстренная)'
/

COMMENT ON COLUMN ASU.TEXCHUPLOAD_OPER.COMPL IS 'Осложнения'
/

COMMENT ON COLUMN ASU.TEXCHUPLOAD_OPER.O_ANASTEZ IS 'Осложнения анестезии (если несколько, то значения разделяются запятой)'
/

COMMENT ON COLUMN ASU.TEXCHUPLOAD_OPER.O_OPERATS IS 'Осложнения оперативного вмешательств (если несколько, то значения разделяются запятой)'
/


