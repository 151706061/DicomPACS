DROP TABLE ASU.PLSQL_ARCHIVE CASCADE CONSTRAINTS
/

--
-- PLSQL_ARCHIVE  (Table) 
--
CREATE TABLE ASU.PLSQL_ARCHIVE
(
  OBJECT_NAME    VARCHAR2(128 BYTE),
  OBJECT_TYPE    VARCHAR2(19 BYTE),
  OBJECT_OWNER   VARCHAR2(32 BYTE),
  CREATION_TIME  DATE,
  STATUS         VARCHAR2(7 BYTE),
  SOURCE         CLOB,
  ERRORS         CLOB,
  AUTHOR         VARCHAR2(128 BYTE),
  VERSION_LABEL  VARCHAR2(32 BYTE),
  SEQ            NUMBER(10),
  BRANCH         VARCHAR2(32 BYTE),
  SOURCE_SIZE    NUMBER(10),
  PRIORITY       VARCHAR2(32 BYTE),
  COMMENTS       VARCHAR2(4000 BYTE),
  LABEL          VARCHAR2(4000 BYTE),
  USERNAME       VARCHAR2(30 BYTE),
  OSUSER         VARCHAR2(30 BYTE),
  TERMINAL       VARCHAR2(16 BYTE),
  PROGRAM        VARCHAR2(200 BYTE)
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
LOGGING 
NOCOMPRESS 
LOB (SOURCE) STORE AS 
      ( TABLESPACE  USR 
        ENABLE      STORAGE IN ROW
        CHUNK       8192
        PCTVERSION  10
        NOCACHE
        INDEX       (
          TABLESPACE USR
          STORAGE    (
                      INITIAL          64K
                      NEXT             1
                      MINEXTENTS       1
                      MAXEXTENTS       UNLIMITED
                      PCTINCREASE      0
                      BUFFER_POOL      DEFAULT
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
  LOB (ERRORS) STORE AS 
      ( TABLESPACE  USR 
        ENABLE      STORAGE IN ROW
        CHUNK       8192
        PCTVERSION  10
        NOCACHE
        INDEX       (
          TABLESPACE USR
          STORAGE    (
                      INITIAL          64K
                      NEXT             1
                      MINEXTENTS       1
                      MAXEXTENTS       UNLIMITED
                      PCTINCREASE      0
                      BUFFER_POOL      DEFAULT
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

COMMENT ON TABLE ASU.PLSQL_ARCHIVE IS 'Таблица, которая ведет аудит  измененных программынх объектов Функции, процедуры, пакеты
Author: Zhukov'
/

COMMENT ON COLUMN ASU.PLSQL_ARCHIVE.ERRORS IS 'Пока не заполняется'
/

COMMENT ON COLUMN ASU.PLSQL_ARCHIVE.AUTHOR IS 'Автор береться из комментариев'
/

COMMENT ON COLUMN ASU.PLSQL_ARCHIVE.VERSION_LABEL IS 'версия, берется из комментраев'
/

COMMENT ON COLUMN ASU.PLSQL_ARCHIVE.USERNAME IS 'Oracle user'
/

COMMENT ON COLUMN ASU.PLSQL_ARCHIVE.OSUSER IS 'v$session.osuser'
/

COMMENT ON COLUMN ASU.PLSQL_ARCHIVE.TERMINAL IS 'v$session.TERMINAL'
/

COMMENT ON COLUMN ASU.PLSQL_ARCHIVE.PROGRAM IS 'v$session.program'
/


