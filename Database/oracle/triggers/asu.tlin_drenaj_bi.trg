DROP TRIGGER ASU.TLIN_DRENAJ_BI
/

--
-- TLIN_DRENAJ_BI  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TLIN_DRENAJ (Sequence)
--   TLIN_DRENAJ (Table)
--
CREATE OR REPLACE TRIGGER ASU.tlin_drenaj_bi
  before insert ON ASU.TLIN_DRENAJ   REFERENCING NEW AS NEW OLD AS OLD
  for each ROW
BEGIN
 SELECT asu.seq_tlin_drenaj.nextval INTO :new.Fk_Id FROM dual;
END;
/
SHOW ERRORS;


