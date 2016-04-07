DROP TABLE ASU.TALGDEPEND CASCADE CONSTRAINTS
/

--
-- TALGDEPEND  (Table) 
--
CREATE TABLE ASU.TALGDEPEND
(
  FK_ID            NUMBER(9),
  FC_NAME          VARCHAR2(50 BYTE),
  FC_FUNCPARNAME   VARCHAR2(15 BYTE),
  FK_ALGPARTYPEID  NUMBER(3)
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

COMMENT ON TABLE ASU.TALGDEPEND IS 'Список параметров необходимых для выполнения алгоритма'
/

COMMENT ON COLUMN ASU.TALGDEPEND.FC_NAME IS 'Название параметра'
/

COMMENT ON COLUMN ASU.TALGDEPEND.FC_FUNCPARNAME IS 'Название параметра в функции'
/

COMMENT ON COLUMN ASU.TALGDEPEND.FK_ALGPARTYPEID IS 'Тип параметра, должен соответствовать DOA-вским типа otInteger, otString, ...'
/


