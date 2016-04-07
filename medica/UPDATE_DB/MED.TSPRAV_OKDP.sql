create table MED.TSPRAV_OKDP
(
  FK_ID       NUMBER not null,
  FK_PARENTID NUMBER default 0 not null,
  FC_NAME     VARCHAR2(1000) not null,
  FC_CODE     VARCHAR2(7) not null
)
tablespace USERS
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
comment on table MED.TSPRAV_OKDP
  is 'Справочник ОКДП';
comment on column MED.TSPRAV_OKDP.FK_ID
  is 'ID';
comment on column MED.TSPRAV_OKDP.FK_PARENTID
  is 'ID родителя';
comment on column MED.TSPRAV_OKDP.FC_NAME
  is 'Наименование';
comment on column MED.TSPRAV_OKDP.FC_CODE
  is 'Код';

create sequence MED.SEQ_TSPRAV_OKDP
minvalue 1
maxvalue 999999999999999
start with 494
increment by 1
nocache;

CREATE OR REPLACE TRIGGER MED."TSPRAV_OKDP_INS" 
 BEFORE
 INSERT
 ON MED.TSPRAV_OKDP
 REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
BEGIN
  IF :NEW.FK_ID IS NULL OR :NEW.FK_ID < 0 THEN
    SELECT SEQ_TSPRAV_OKDP.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
  END IF;
END;
/

