DROP TABLE ASU.TPRIEMORDER CASCADE CONSTRAINTS
/

--
-- TPRIEMORDER  (Table) 
--
CREATE TABLE ASU.TPRIEMORDER
(
  FK_ID        NUMBER(15)                       NOT NULL,
  FK_PACID     NUMBER(15)                       NOT NULL,
  FN_SOS       NUMBER(1)                        DEFAULT 1                     NOT NULL,
  FK_NAZVRACH  NUMBER(15)                       NOT NULL,
  FD_DATE      DATE                             NOT NULL
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
NOCACHE
NOPARALLEL
MONITORING
/

COMMENT ON TABLE ASU.TPRIEMORDER IS 'Shpielevoy - Очередь при записи на прием через терминал'
/

COMMENT ON COLUMN ASU.TPRIEMORDER.FK_PACID IS 'код пациента TAmbulance.fk_id'
/

COMMENT ON COLUMN ASU.TPRIEMORDER.FN_SOS IS '1 - поставлен в очередь;  2 - обработан'
/

COMMENT ON COLUMN ASU.TPRIEMORDER.FK_NAZVRACH IS 'tnazvrach.fk_id, там есть и SotrId и KabId и Smid'
/

COMMENT ON COLUMN ASU.TPRIEMORDER.FD_DATE IS 'дата, на которую хотел бы записаться пациент'
/


--
-- TPRIEMORDER_INSERT  (Trigger) 
--
--  Dependencies: 
--   TPRIEMORDER (Table)
--
CREATE OR REPLACE TRIGGER ASU."TPRIEMORDER_INSERT" 
 BEFORE
  INSERT
 ON asu.TPRIEMORDER
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
Begin
  SELECT asu.SEQ_TPRIEMORDER.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
End;
/
SHOW ERRORS;


