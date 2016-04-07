DROP TABLE ASU."DbConnector" CASCADE CONSTRAINTS
/

--
-- "DbConnector"  (Table) 
--
CREATE TABLE ASU."DbConnector"
(
  "oID"           VARCHAR2(36 BYTE)             NOT NULL,
  "UID"           VARCHAR2(36 BYTE)             NOT NULL,
  "ReplyUID"      VARCHAR2(32 BYTE),
  "Source"        VARCHAR2(32 BYTE)             NOT NULL,
  "Destination"   VARCHAR2(32 BYTE)             NOT NULL,
  "Type"          VARCHAR2(32 BYTE)             DEFAULT 'ORM^O01',
  "ContentType"   VARCHAR2(32 BYTE),
  "Message"       BLOB                          NOT NULL,
  "SendTime"      TIMESTAMP(3)                  NOT NULL,
  "ExchangeTime"  DATE,
  "ProcTime"      DATE,
  "NazID"         NUMBER                        DEFAULT -1,
  "ErrorText"     VARCHAR2(1000 BYTE)
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
LOB ("Message") STORE AS 
      ( TABLESPACE  USR 
        ENABLE      STORAGE IN ROW
        CHUNK       8192
        RETENTION
        NOCACHE
        NOLOGGING
        INDEX       (
          STORAGE    (
                      PCTINCREASE      0
                     ))
        STORAGE    (
                    INITIAL          64K
                    NEXT             1M
                    MINEXTENTS       1
                    MAXEXTENTS       UNLIMITED
                    PCTINCREASE      0
                    BUFFER_POOL      DEFAULT
                   )
      )
NOCACHE
NOPARALLEL
MONITORING
/

COMMENT ON TABLE ASU."DbConnector" IS 'Таблица сопряжения с АРИС "MultiVox", используется для обмена сообщениями между МИС "ОКБ" и АРИС "MultiVox"'
/

COMMENT ON COLUMN ASU."DbConnector"."oID" IS 'Идентификатор (ключ) записи'
/

COMMENT ON COLUMN ASU."DbConnector"."UID" IS 'Идентификатор сообщения'
/

COMMENT ON COLUMN ASU."DbConnector"."ReplyUID" IS 'Идентификатор сообщения, связанного с данным сообщением'
/

COMMENT ON COLUMN ASU."DbConnector"."Source" IS 'Идентификатор системы-источника сообщения (MIS/RIS)'
/

COMMENT ON COLUMN ASU."DbConnector"."Destination" IS 'Идентификатор системы-назначения сообщения (MIS/RIS)'
/

COMMENT ON COLUMN ASU."DbConnector"."Type" IS 'Тип сообщения'
/

COMMENT ON COLUMN ASU."DbConnector"."ContentType" IS 'Способ кодировки сообщения'
/

COMMENT ON COLUMN ASU."DbConnector"."Message" IS 'Сообщение'
/

COMMENT ON COLUMN ASU."DbConnector"."SendTime" IS 'Время создания сообщения'
/

COMMENT ON COLUMN ASU."DbConnector"."ExchangeTime" IS 'Время передачи сообщения между системами. Заполняется сервисом обмена'
/

COMMENT ON COLUMN ASU."DbConnector"."ProcTime" IS 'Время обработки (признак обработки) сообщения получателем'
/

COMMENT ON COLUMN ASU."DbConnector"."NazID" IS 'Идентификатор исследования'
/

COMMENT ON COLUMN ASU."DbConnector"."ErrorText" IS 'Текст ошибки'
/


--
-- DBCONNECTOR_EXCH_TIME  (Index) 
--
--  Dependencies: 
--   "DbConnector" (Table)
--
CREATE INDEX ASU.DBCONNECTOR_EXCH_TIME ON ASU."DbConnector"
("ExchangeTime")
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
-- DBCONNECTOR_NAZID  (Index) 
--
--  Dependencies: 
--   "DbConnector" (Table)
--
CREATE INDEX ASU.DBCONNECTOR_NAZID ON ASU."DbConnector"
("NazID")
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
-- DBCONNECTOR_OID  (Index) 
--
--  Dependencies: 
--   "DbConnector" (Table)
--
CREATE UNIQUE INDEX ASU.DBCONNECTOR_OID ON ASU."DbConnector"
("oID")
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
-- DBCONNECTOR_SEND_TIME  (Index) 
--
--  Dependencies: 
--   "DbConnector" (Table)
--
CREATE INDEX ASU.DBCONNECTOR_SEND_TIME ON ASU."DbConnector"
("SendTime")
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
-- DBCONNECTOR_UID  (Index) 
--
--  Dependencies: 
--   "DbConnector" (Table)
--
CREATE UNIQUE INDEX ASU.DBCONNECTOR_UID ON ASU."DbConnector"
("UID")
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
-- DBCONNECTOR_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   "DbConnector" (Table)
--
CREATE OR REPLACE TRIGGER ASU."DBCONNECTOR_BEFORE_INSERT" 
 BEFORE
  INSERT
 ON asu."DbConnector"
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
  str VARCHAR2(32767);
  s varchar2(32555);
  s1 varchar2(32555);

  n number;
  n1 number;
BEGIN
  IF :NEW."Source" = 'RIS' THEN
    str := dbms_lob.substr(:new."Message",32555);
    str := utl_i18n.raw_to_char(str);
    n := instr(str, '<EI.1>');
    s := substr(str, n+6, length(str)-n);
    n1 := instr(s, '</EI.1>');
    s1 := substr(s, 0, n1-1);
    asu.UPDATE_RESULTID_FOR_MULTIVOX(TO_NUMBER(s1));
  END IF;
END;
/
SHOW ERRORS;


GRANT DELETE, INSERT, SELECT, UPDATE ON ASU."DbConnector" TO MULTIVOX
/

