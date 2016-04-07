-- Create table
create table ASU.TONKOUCHET
(
  fk_id       NUMBER(15),
  fk_pacid    NUMBER(15),
  fl_status   NUMBER(1) default 1,
  fd_data1    DATE default sysdate,
  fd_data2    DATE,
  fk_sotrid1  NUMBER(15),
  fk_reasonid NUMBER(15),
  fk_diagid   NUMBER(15),
  fk_sotrid2  NUMBER(15)
)
tablespace USR
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Add comments to the table 
comment on table ASU.TONKOUCHET
  is 'Таблица, содержащая данные о постановке и снятии пациента с онкоучета.   Slusarenko M.D.   12.08.2014';
-- Add comments to the columns 
comment on column ASU.TONKOUCHET.fk_pacid
  is 'asu.tambulance.fk_id';
comment on column ASU.TONKOUCHET.fl_status
  is '1 - поставлен на онко учет, 0 - снят с учета';
comment on column ASU.TONKOUCHET.fd_data1
  is 'Дата постановки на учет';
comment on column ASU.TONKOUCHET.fd_data2
  is 'Дата снятия с учета (актуальна только при FL_STATUS = 0)';
comment on column ASU.TONKOUCHET.fk_sotrid1
  is 'Сотрудник, поставивший на онкоучет';
comment on column ASU.TONKOUCHET.fk_reasonid
  is 'asu.tsmid.fk_id - причина снятия с учета';
comment on column ASU.TONKOUCHET.fk_diagid
  is 'asu.tdiag.fk_id - Диагноз заболевания, с которым пациент поставлен на учет';
comment on column ASU.TONKOUCHET.fk_sotrid2
  is 'Сотрудник, снявший пациента с онкоучета';

----------------------------------------------------------------------------------------------------------------------------

-- Create sequence 
create sequence ASU.SEQ_TONKOUCHET
minvalue 1
maxvalue 9999999999999999999999999
start with 41
increment by 1
cache 20;

----------------------------------------------------------------------------------------------------------------------------

create or replace trigger ASU.TONKOUCHET_BI
  before insert on asu.tonkouchet
  REFERENCING NEW AS NEW OLD AS OLD
  for each row
declare
  -- local variables here
begin
  if (:new.fk_id is null) then
     select asu.seq_tonkouchet.nextval into :new.fk_id from dual;
  end if;
end;
