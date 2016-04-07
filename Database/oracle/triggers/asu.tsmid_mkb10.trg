DROP TRIGGER ASU.TSMID_MKB10
/

--
-- TSMID_MKB10  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   DBMS_STANDARD (Package)
--   TICD10 (Table)
--   TSMID (Table)
--   GET_MKB10_BY_ID (Function)
--
CREATE OR REPLACE TRIGGER ASU."TSMID_MKB10" 
  BEFORE INSERT OR UPDATE OR DELETE ON ASU.TSMID   REFERENCING OLD AS OLD NEW AS NEW
  FOR EACH ROW
DECLARE
  sm_default NUMBER;
  sm_mkb VARCHAR2(200);
  --ищем по коду в TICD10
  CURSOR getdest(pcode VARCHAR2) IS SELECT i.fk_id,i.fl_can_del FROM asu.ticd10 i WHERE i.fc_kod = pcode;
  CURSOR getdestid(pid NUMBER) IS SELECT i.fl_can_del FROM asu.ticd10 i WHERE i.fk_id = pid;
  icid NUMBER;
  iccandel NUMBER;
  --ищем родителя по коду в TICD10
  CURSOR getdestowner(pcode VARCHAR2) IS SELECT i.fk_id FROM asu.ticd10 i WHERE i.fc_kod = pcode;
  icownerid NUMBER;
  --получаем родителя в TSMID
  CURSOR getparent(pownerid NUMBER) IS SELECT substr(trim(UPPER(asu.get_mkb10_by_id(pownerid))),1,10) mkb10 FROM dual;--asu.tsmid s WHERE s.fk_id = pownerid;
  smkod asu.ticd10.fc_kod%TYPE;

  kod asu.ticd10.fc_kod%TYPE;
  symb asu.ticd10.fc_symb%TYPE;
  kod1 asu.ticd10.fc_kod1%TYPE;
  newname asu.ticd10.fc_name%TYPE;
BEGIN

  /*if asu.get_rootid(nvl(:new.fk_owner,:old.fk_owner)) <> stat.pkg_statutil.GET_SMIDID('DIAGS_MKB10') then  
   return;
  end if;*/
  
  IF :new.Fk_Mkb10 IS NULL AND :old.Fk_Mkb10 IS NULL THEN
   return;
  END IF;

  IF UPDATING OR DELETING THEN
   sm_default := :old.Fk_Default;
  END IF;

  newname := substr(:NEW.FC_NAME,1,250);
  --проверка кода на спецсимволы
  kod := substr(trim(UPPER(:NEW.Fk_Mkb10)),1,10);
  IF instr(kod,'+') = LENGTH(kod) OR instr(kod,'*') = LENGTH(kod) THEN
   symb := SUBSTR(kod,LENGTH(kod),1);
   kod1 := SUBSTR(kod,1,LENGTH(kod)-1);
  ELSE
   symb := NULL;
   kod1 := kod;
  END IF;

  IF sm_default IS NOT NULL THEN
    icid := sm_default;
    OPEN getdestid(icid);
    FETCH getdestid INTO iccandel;
    IF getdestid%NOTFOUND THEN iccandel := 1; END IF;
    CLOSE getdestid;
  ELSE
    IF inserting THEN
     sm_mkb := :new.Fk_Mkb10;
    ELSIF updating THEN
     sm_mkb := :new.Fk_Mkb10;
    END IF;
    OPEN getdest(sm_MKB);
    FETCH getdest INTO icid,iccandel;
    IF getdest%NOTFOUND THEN icid := NULL; iccandel := 1; END IF;
    CLOSE getdest;
  END IF;

  IF INSERTING OR UPDATING THEN
    OPEN getparent(:NEW.Fk_Owner);
    FETCH getparent INTO smkod;
    IF getparent%NOTFOUND THEN smkod := NULL; END IF;
    CLOSE getparent;

    OPEN getdestowner(smkod);
    FETCH getdestowner INTO icownerid;
    IF getdestowner%NOTFOUND THEN icownerid := NULL; END IF;
    CLOSE getdestowner;
  END IF;


  IF INSERTING THEN
   IF icid IS NULL THEN -- код уже есть, уходим от сюда
    INSERT INTO asu.ticd10(fk_parent,fc_name,fc_kod,fc_symb,fc_kod1,fl_can_del) VALUES(icownerid,:new.Fc_Name,kod,symb,kod1,1) RETURNING fk_id INTO icid;
   ELSE
    IF iccandel IS NOT NULL THEN
     UPDATE asu.ticd10 SET fc_name = NEWNAME, fc_kod = kod, fc_symb = symb, fc_kod1 = kod1 WHERE fk_id = icid;
    END IF;
   END IF;
   :new.Fk_Default := icid;
  ELSIF UPDATING THEN
   IF iccandel IS NOT NULL THEN --проверка на запрещенность записи
    IF icid IS NULL THEN
     INSERT INTO asu.ticd10(fk_parent,fc_name,fc_kod,fc_symb,fc_kod1,fl_can_del) VALUES(icownerid,:new.Fc_Name,kod,symb,kod1,1) RETURNING fk_id INTO icid;
    ELSE
     if :new.fl_del = 1 then
      DELETE FROM asu.ticd10 WHERE fk_id = icid;
     else
      UPDATE asu.ticd10 SET fc_name = NEWNAME, fc_kod = kod, fc_symb = symb, fc_kod1 = kod1 WHERE fk_id = icid;
     end if;
    END IF;
   END IF;
   :new.Fk_Default := icid;
  ELSIF DELETING THEN
   IF iccandel IS NOT NULL THEN --проверка на запрещенность записи
    IF icid IS NOT NULL THEN
     DELETE FROM asu.ticd10 WHERE fk_id = icid;
    END IF;
   END IF;
  END IF;
End;
/
SHOW ERRORS;


