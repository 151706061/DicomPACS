-- Start of DDL Script for Sequence ASU.SEQ_TMEDICGIVEN
-- Generated 26-дек-2007 12:03:18 from ASU@asu

CREATE SEQUENCE asu.seq_tmedicgiven
  INCREMENT BY 1
  START WITH 81
  MINVALUE 1
  MAXVALUE 9999999999999999999999999999
  NOCYCLE
  NOORDER
  CACHE 20
/


-- End of DDL Script for Sequence ASU.SEQ_TMEDICGIVEN


-- Start of DDL Script for Table ASU.TMEDICGIVEN
-- Generated 26-дек-2007 12:02:24 from ASU@asu

CREATE TABLE asu.tmedicgiven
    (fk_id                          NUMBER NOT NULL,
    fk_nazmark                     NUMBER,
    fk_nazmedlechid                NUMBER,
    fk_medicgiven                  NUMBER,
    fk_sotrfrom                    NUMBER,
    fk_sotrto                      NUMBER,
    fp_mode                        NUMBER,
    fd_given                       DATE,
    fd_date                        DATE,
    fn_kol                         NUMBER,
    fk_dpcid                       NUMBER)
  PCTFREE     10
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  usr
  STORAGE   (
    INITIAL     65536
    MINEXTENTS  1
    MAXEXTENTS  2147483645
  )
  NOCACHE
  MONITORING
/





-- Indexes for ASU.TMEDICGIVEN

CREATE INDEX asu.tmedicgiven_nmlech_nmar_medgiv ON asu.tmedicgiven
  (
    fk_nazmedlechid                 ASC,
    fk_nazmark                      ASC,
    fk_medicgiven                   ASC
  )
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  usr
  STORAGE   (
    INITIAL     65536
    MINEXTENTS  1
    MAXEXTENTS  2147483645
  )
NOLOGGING
/



-- Constraints for ASU.TMEDICGIVEN

ALTER TABLE asu.tmedicgiven
ADD CONSTRAINT pk_medicgiven PRIMARY KEY (fk_id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  usr
  STORAGE   (
    INITIAL     65536
    MINEXTENTS  1
    MAXEXTENTS  2147483645
  )
/


-- Triggers for ASU.TMEDICGIVEN

CREATE OR REPLACE TRIGGER asu.tmedicgiven_before_insert
 BEFORE
  INSERT
 ON asu.tmedicgiven
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
  -- LOCAL VARIABLES HERE
BEGIN
  IF :NEW.FK_ID IS NULL THEN
      SELECT SEQ_TMEDICGIVEN.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
  END IF;
  :NEW.FD_DATE := SYSDATE;
END;
/


-- Comments for ASU.TMEDICGIVEN

COMMENT ON TABLE asu.tmedicgiven IS '“аблица св€зки препаратов, выданных постовой медсестре старшей медсестрой.
FP_MODE - –ежим, в котором происходило внесение записи в таблицу. ќпредел€етс€  select fc_value from asu.tsmini sm where sm.fc_section = ''medica.exe'' and fc_key = ''MEDSES_GIVE_MODE''. ≈сли не найден, то режим = 0
FP_MODE = 0 - ни страша€, ни младша€ медсестры не внос€т запись соотвествий
FP_MODE = 1 - старша€ медсестра при выдаче постовой медсестре делает соответствие. «десь постова€ медсестра вносит только FK_NAZMARK 
FP_MODE = 2 - старша€ медсестра при выдаче постовой медсестре Ќ≈ делает соответствие. ѕостова€ медсестра делает соответствие при выдаче пациенту'
/
COMMENT ON COLUMN asu.tmedicgiven.fd_date IS 'ƒата внесени€ записи'
/
COMMENT ON COLUMN asu.tmedicgiven.fd_given IS 'ƒата выдачи'
/
COMMENT ON COLUMN asu.tmedicgiven.fk_dpcid IS 'MED.TDPC.DPCID заполн€етс€ только старшей медсестрой'
/
COMMENT ON COLUMN asu.tmedicgiven.fk_id IS 'SEQUENCE=[SEQ_TMEDICGIVEN]'
/
COMMENT ON COLUMN asu.tmedicgiven.fk_medicgiven IS 'MED.TMEDIC.FK_ID - ссылка на препарат, который действительно выдали'
/
COMMENT ON COLUMN asu.tmedicgiven.fk_nazmark IS 'ASU.TNAZMARK.FK_ID - ссылка на запись о выдаче пациенту. ≈сли mode = 1, заполн€етс€ только постовой сестрой при выдаче'
/
COMMENT ON COLUMN asu.tmedicgiven.fk_nazmedlechid IS 'ASU.TNAZMEDLECH.FK_ID - ссылка на св€зку назначени€ и препарата'
/
COMMENT ON COLUMN asu.tmedicgiven.fk_sotrfrom IS 'TSOTR.FK_ID - кто выдал (обычно старша€ мед.сестра)'
/
COMMENT ON COLUMN asu.tmedicgiven.fk_sotrto IS 'TSOTR.FK_ID - кому выдал (обычно постова€ медсестра)'
/
COMMENT ON COLUMN asu.tmedicgiven.fn_kol IS ' ол-во выданного препарата'
/
COMMENT ON COLUMN asu.tmedicgiven.fp_mode IS '–ежим, в котором происходило внесение записи в таблицу. ќпредел€етс€  select fc_value from asu.tsmini sm where sm.fc_section = ''medica.exe'' and fc_key = ''MEDSES_GIVE_MODE'' не найден, то режим = 0'
/

-- End of DDL Script for Table ASU.TMEDICGIVEN
EXIT
/