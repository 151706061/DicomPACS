DROP TABLE ASU.TONKOUCHET CASCADE CONSTRAINTS
/

--
-- TONKOUCHET  (Table) 
--
CREATE TABLE ASU.TONKOUCHET
(
  FK_ID        NUMBER(15),
  FK_PACID     NUMBER(15),
  FL_STATUS    NUMBER(1)                        DEFAULT 1,
  FD_DATA1     DATE                             DEFAULT sysdate,
  FD_DATA2     DATE,
  FK_SOTRID1   NUMBER(15),
  FK_REASONID  NUMBER(15),
  FK_DIAGID    NUMBER(15),
  FK_SOTRID2   NUMBER(15)
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

COMMENT ON TABLE ASU.TONKOUCHET IS '�������, ���������� ������ � ���������� � ������ �������� � ���������.   Slusarenko M.D.   12.08.2014'
/

COMMENT ON COLUMN ASU.TONKOUCHET.FK_PACID IS 'asu.tambulance.fk_id'
/

COMMENT ON COLUMN ASU.TONKOUCHET.FL_STATUS IS '1 - ��������� �� ���� ����, 0 - ���� � �����'
/

COMMENT ON COLUMN ASU.TONKOUCHET.FD_DATA1 IS '���� ���������� �� ����'
/

COMMENT ON COLUMN ASU.TONKOUCHET.FD_DATA2 IS '���� ������ � ����� (��������� ������ ��� FL_STATUS = 0)'
/

COMMENT ON COLUMN ASU.TONKOUCHET.FK_SOTRID1 IS '���������, ����������� �� ��������'
/

COMMENT ON COLUMN ASU.TONKOUCHET.FK_REASONID IS 'asu.tsmid.fk_id - ������� ������ � �����'
/

COMMENT ON COLUMN ASU.TONKOUCHET.FK_DIAGID IS 'asu.tdiag.fk_id - ������� �����������, � ������� ������� ��������� �� ����'
/

COMMENT ON COLUMN ASU.TONKOUCHET.FK_SOTRID2 IS '���������, ������� �������� � ���������'
/


--
-- TONKOUCHET_BI  (Trigger) 
--
--  Dependencies: 
--   TONKOUCHET (Table)
--
CREATE OR REPLACE TRIGGER ASU.TONKOUCHET_BI
  before insert ON ASU.TONKOUCHET   REFERENCING NEW AS NEW OLD AS OLD
  for each row
declare
  -- local variables here
begin
  if (:new.fk_id is null) then
     select asu.seq_tonkouchet.nextval into :new.fk_id from dual;
  end if;
end;
/
SHOW ERRORS;


