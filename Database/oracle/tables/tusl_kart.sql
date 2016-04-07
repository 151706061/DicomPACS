DROP TABLE ASU.TUSL_KART CASCADE CONSTRAINTS
/

--
-- TUSL_KART  (Table) 
--
CREATE TABLE ASU.TUSL_KART
(
  FK_ID           INTEGER                       DEFAULT -1                    NOT NULL,
  FK_HEALID       INTEGER,
  FK_GROUPID      INTEGER,
  FK_ANALIT       INTEGER,
  FN_KOL          NUMBER(12,3),
  FN_DLIT_MIN     INTEGER,
  FN_KOL_MIN_MES  INTEGER,
  FN_DEL          INTEGER,
  FK_ID_COPIED    NUMBER,
  FN_KOL_UET_MES  NUMBER
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

COMMENT ON TABLE ASU.TUSL_KART IS '�������� ������� ��������� �����'
/

COMMENT ON COLUMN ASU.TUSL_KART.FK_HEALID IS '������ �� ������ � THAEL'
/

COMMENT ON COLUMN ASU.TUSL_KART.FK_GROUPID IS '������ �� ������ ������ � BUH.TS_GROUP'
/

COMMENT ON COLUMN ASU.TUSL_KART.FK_ANALIT IS '������������� ������� ������'
/

COMMENT ON COLUMN ASU.TUSL_KART.FN_KOL IS '���-�� ������������� �������'
/

COMMENT ON COLUMN ASU.TUSL_KART.FN_DLIT_MIN IS '������������ � ������� �������� �������� �������'
/

COMMENT ON COLUMN ASU.TUSL_KART.FN_KOL_MIN_MES IS '���-�� ����� �������� ������� � �����'
/

COMMENT ON COLUMN ASU.TUSL_KART.FN_DEL IS '������� ��������'
/


--
-- TUSL_KART_BY_FK_ID  (Index) 
--
--  Dependencies: 
--   TUSL_KART (Table)
--
CREATE UNIQUE INDEX ASU.TUSL_KART_BY_FK_ID ON ASU.TUSL_KART
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
-- TUSL_KART_FK_HEALID_FK_GROUP  (Index) 
--
--  Dependencies: 
--   TUSL_KART (Table)
--
CREATE INDEX ASU.TUSL_KART_FK_HEALID_FK_GROUP ON ASU.TUSL_KART
(FK_HEALID, FK_GROUPID)
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
-- TUSL_KART_FK_ID_COPIED  (Index) 
--
--  Dependencies: 
--   TUSL_KART (Table)
--
CREATE INDEX ASU.TUSL_KART_FK_ID_COPIED ON ASU.TUSL_KART
(FK_ID_COPIED)
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
-- TUSL_KART_VANALIT  (Index) 
--
--  Dependencies: 
--   TUSL_KART (Table)
--
CREATE INDEX ASU.TUSL_KART_VANALIT ON ASU.TUSL_KART
(FK_ANALIT)
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
-- TUSL_KART_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TUSL_KART (Table)
--
CREATE OR REPLACE TRIGGER ASU."TUSL_KART_BEFORE_INSERT" 
 BEFORE
  INSERT
 ON tusl_kart
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
Begin
  SELECT SEQ_tusl_kart.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
End;
/
SHOW ERRORS;


GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE ON ASU.TUSL_KART TO WORD
/

