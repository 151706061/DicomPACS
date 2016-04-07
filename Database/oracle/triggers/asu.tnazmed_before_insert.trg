DROP TRIGGER ASU.TNAZMED_BEFORE_INSERT
/

--
-- TNAZMED_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TKARTA (Sequence)
--   TNAZMED (Table)
--   TSOTR (Synonym)
--   TVRACH (Table)
--   TSMID (Table)
--   GET_NEVIP (Function)
--   GET_RECOMEND (Function)
--   TNAZVRACH (View)
--   VNAZ (Table)
--
CREATE OR REPLACE TRIGGER ASU."TNAZMED_BEFORE_INSERT" 
 BEFORE 
 INSERT
 ON ASU.TNAZMED  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
DECLARE
/*  iVrachID   INTEGER;*/
  iAccess    INTEGER;
  iSotrRight INTEGER;
BEGIN
  IF :NEW.FK_ID IS NULL THEN
/*  прояснение на отметки о выполнении */
/*    SELECT SEQ_TNAZMED.NEXTVAL INTO :NEW.FK_ID FROM DUAL;*/
    SELECT SEQ_TKARTA.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
  END IF;

/*set status*/
  BEGIN
    IF :NEW.fk_osmotrid = -1 THEN
      :NEW.FK_STATE := GET_NEVIP;
    ELSE
      /*IsSotrRight - Php*/
      BEGIN
        select MIN(FN_ACCESS) INTO iAccess
        from tnazvrach
        where fk_smid IN (select fk_smid from vnaz where fk_id = :NEW.fk_osmotrid)
          and fk_sotrid = :NEW.fk_vrachid;
      EXCEPTION
        WHEN NO_DATA_FOUND THEN iAccess := 0;
        WHEN OTHERS THEN RAISE;
      END;

      /*IsVrachFromOtdel - Php*/
      select COUNT(0) INTO iSotrRight
      from tsotr ts,tsotr ts1
      where ts.fk_id=:NEW.fk_vrachid
        and ts1.fk_id = (select max(fk_vrachid) from tvrach where fk_pacid=:NEW.fk_pacid)
                  and ts.fk_otdelid=ts1.fk_otdelid;

      IF (iAccess IN (1,2)) OR (iSotrRight > 0) THEN
        :NEW.FK_STATE := GET_NEVIP;
      ELSE
        :NEW.FK_STATE := GET_RECOMEND;
      END IF;
    END IF;
  END;

/*  BEGIN
    SELECT 1 INTO IVRACHID FROM TVRACH WHERE FK_PACID = :NEW.FK_PACID AND FK_VRACHID = :NEW.FK_VRACHID;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN :NEW.FK_STATE := GET_RECOMEND;
  END;*/

  SELECT FK_ID INTO :NEW.FK_NAZTYPEID FROM TSMID WHERE FC_SYNONIM = 'NAZTYPE_PLAN';

END TNAZMED_BEFORE_INSERT;
/
SHOW ERRORS;


