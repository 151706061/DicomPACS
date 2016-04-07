DROP TABLE ASU.TDIKTTASKS CASCADE CONSTRAINTS
/

--
-- TDIKTTASKS  (Table) 
--
CREATE TABLE ASU.TDIKTTASKS
(
  FK_ID       NUMBER(9)                         NOT NULL,
  FK_BLOBID   NUMBER(9),
  FK_CLOBID   NUMBER(9),
  FC_COMMENT  VARCHAR2(255 BYTE),
  FD_DATA     DATE                              DEFAULT sysdate               NOT NULL,
  FK_VRACHID  NUMBER(9)                         NOT NULL
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          520K
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

COMMENT ON TABLE ASU.TDIKTTASKS IS 'Список аудио материалов для набивки диктофончице'
/

COMMENT ON COLUMN ASU.TDIKTTASKS.FK_ID IS 'SEQUENCE=[SEQ_TDIKTTASK]'
/

COMMENT ON COLUMN ASU.TDIKTTASKS.FK_BLOBID IS 'Файл для набивки'
/

COMMENT ON COLUMN ASU.TDIKTTASKS.FK_CLOBID IS 'Код клоба с результатом'
/

COMMENT ON COLUMN ASU.TDIKTTASKS.FC_COMMENT IS 'Комментарий'
/

COMMENT ON COLUMN ASU.TDIKTTASKS.FD_DATA IS 'Когда сделано задание'
/

COMMENT ON COLUMN ASU.TDIKTTASKS.FK_VRACHID IS 'Какой врач дал это задание'
/


--
-- TDIKTTASKS_COMMENT  (Index) 
--
--  Dependencies: 
--   TDIKTTASKS (Table)
--
CREATE INDEX ASU.TDIKTTASKS_COMMENT ON ASU.TDIKTTASKS
(FC_COMMENT)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          128K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TDIKTTASKS_DATA  (Index) 
--
--  Dependencies: 
--   TDIKTTASKS (Table)
--
CREATE INDEX ASU.TDIKTTASKS_DATA ON ASU.TDIKTTASKS
(FD_DATA)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          128K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TDIKTTASKS_ID  (Index) 
--
--  Dependencies: 
--   TDIKTTASKS (Table)
--
CREATE UNIQUE INDEX ASU.TDIKTTASKS_ID ON ASU.TDIKTTASKS
(FK_ID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          128K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TDIKTTSK_INSERT  (Trigger) 
--
--  Dependencies: 
--   TDIKTTASKS (Table)
--
CREATE OR REPLACE TRIGGER ASU."TDIKTTSK_INSERT" 
BEFORE  INSERT  ON ASU.TDIKTTASKS FOR EACH ROW
Begin
  select SEQ_TDIKTTASK.nextval into :new.fk_id from dual;
End;
/
SHOW ERRORS;


