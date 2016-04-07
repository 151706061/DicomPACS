ALTER TABLE MED.TIMP_DOC 
 ADD (
  FL_CHECK_DOGOVOR NUMBER (1),
  FL_IS_CHECKED NUMBER (1),
  FK_MO_CHECKED NUMBER,
  FD_CHECKED_DATE DATE
 )
/
ALTER TABLE MED.TIMP_DOC 
 MODIFY (
  FL_CHECK_DOGOVOR DEFAULT 0,
  FL_IS_CHECKED DEFAULT 0
 )
/
COMMENT ON COLUMN MED.TIMP_DOC.FL_CHECK_DOGOVOR IS 'проверять документ на соответствие договорам'
/
COMMENT ON COLUMN MED.TIMP_DOC.FL_IS_CHECKED IS 'Документ сверен с договорами'
/
COMMENT ON COLUMN MED.TIMP_DOC.FK_MO_CHECKED IS 'кто проверил (MED.TMO)'
/
COMMENT ON COLUMN MED.TIMP_DOC.FD_CHECKED_DATE IS 'дата выставления флага проверки'
/

CREATE OR REPLACE TRIGGER MED.TIMP_DOC_INS
 BEFORE 
 INSERT
 ON MED.TIMP_DOC
 REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW 
begin
  if NVL(:new.fk_id,0) < 1 then
    select MED.SEQ_TIMP_DOC.nextval into :new.fk_id from dual;
  end if;
  :new.FD_INS_DATE      := sysdate;
  :new.FK_INS_MO        := med.pkg_medses.get_curmo;
  :new.FL_IS_CHECKED    := 0;
  :new.FL_CHECK_DOGOVOR := 0;
end;
/

