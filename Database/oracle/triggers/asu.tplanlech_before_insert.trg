DROP TRIGGER ASU.TPLANLECH_BEFORE_INSERT
/

--
-- TPLANLECH_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TPLANLECH (Sequence)
--   TSMID (Table)
--   TPLANLECH (Table)
--
CREATE OR REPLACE TRIGGER ASU."TPLANLECH_BEFORE_INSERT" 
BEFORE INSERT
ON ASU.TPLANLECH REFERENCING OLD AS OLD NEW AS NEW
FOR EACH ROW
DECLARE
cursor c1 is select fc_name from tsmid start with fk_id=:new.fk_smid connect by prior fk_owner=fk_id order by rownum desc;
sName VARCHAR(100);
Begin
  SELECT SEQ_TPLANLECH.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
  OPEN c1;
  FETCH c1 INTO sName;
  CLOSE c1;
  if sName='Исследования' then
    :NEW.FP_WHAT:=1;
    return;
  end if;
  if sName='Консультации' then
    :NEW.FP_WHAT:=1;
    return;
  end if;
  if sName='Процедуры' then
    :NEW.FP_WHAT:=0;
    return;
  end if;
  if sName='Анализы' then
    :NEW.FP_WHAT:=1;
    return;
  end if;
End;
/
SHOW ERRORS;


