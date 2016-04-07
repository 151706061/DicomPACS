-- Create table
create table MED.TFINSOURCE_REPLACE
(
  FK_ID             NUMBER,
  MEDICID           NUMBER,
  FD_DATE           DATE,
  FK_FINSOURCE_PRIH NUMBER,
  FK_FINSOURCE_RASH NUMBER
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
comment on table MED.TFINSOURCE_REPLACE
  is 'Подменяет ист. фин-ия для выбранных медикаментов. Травмацентр Author: Neronov A.S.';
-- Add comments to the columns 
comment on column MED.TFINSOURCE_REPLACE.FK_ID
  is 'ID';
comment on column MED.TFINSOURCE_REPLACE.MEDICID
  is 'MED.TMEDIC.MEDICID - медикамент';
comment on column MED.TFINSOURCE_REPLACE.FD_DATE
  is 'Дата начала действия';
comment on column MED.TFINSOURCE_REPLACE.FK_FINSOURCE_PRIH
  is 'MED.TFINSOURCE.FK_ID - ист. фин-ия приходного документа';
comment on column MED.TFINSOURCE_REPLACE.FK_FINSOURCE_RASH
  is 'MED.TFINSOURCE.FK_ID - ист. фин-ия для расх. документа (на который подменять)';



-- Create sequence 
create sequence MED.SEQ_TFINSOURCE_REPLACE
minvalue 1
maxvalue 999999999999999999999999999
start with 1000020
increment by 1
cache 20;


CREATE OR REPLACE TRIGGER MED.TFINSOURCE_REPLACE_BI 
 BEFORE
  INSERT
 ON med.TFINSOURCE_REPLACE
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
 SELECT SEQ_TFINSOURCE_REPLACE.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
END;