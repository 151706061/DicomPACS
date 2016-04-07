DROP TRIGGER ASU.TNAZHEAL_BEFORE_INSERT
/

--
-- TNAZHEAL_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TKARTA (Sequence)
--   TNAZHEAL (Table)
--
CREATE OR REPLACE TRIGGER ASU."TNAZHEAL_BEFORE_INSERT" 
 BEFORE
  INSERT
 ON asu.tnazheal
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
BEGIN

  IF :new.fk_id IS NULL THEN
    SELECT asu.seq_tkarta.nextval INTO :NEW.FK_ID FROM DUAL;
-- Efimov V.A. 20121128 http://192.168.1.9/redmine/issues/20269 Перевёл на общую с asu.seq_tkarta сиквенцию,
-- для того, чтобы в выгрузке значение ID_ILL_U было уникальным, даже есть с назначением связано больше одной услуги.
--    SELECT SEQ_TNAZHEAL.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
  END IF;
END;
/
SHOW ERRORS;


