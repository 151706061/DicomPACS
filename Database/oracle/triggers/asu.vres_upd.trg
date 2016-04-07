DROP TRIGGER ASU.VRES_UPD
/

--
-- VRES_UPD  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   V$SESSION (Synonym)
--   DBMS_STANDARD (Package)
--   TRESAN (Table)
--   TRESIS (Table)
--   TRESKONS (Table)
--   TRESLECH (Table)
--   TPATALOGY (Table)
--   TSMID (Table)
--   VRES (Table)
--   GET_AMBVRACH (Function)
--   GET_ANALID (Function)
--   GET_ISSLEDID (Function)
--   GET_KONSID (Function)
--   GET_PACVRACH (Function)
--   GET_PATALOGY_LEVEL (Function)
--   GET_PROCID (Function)
--   INSNAZ (Package)
--   IS_AMBULANCE (Function)
--   VNAZ (Table)
--
CREATE OR REPLACE TRIGGER ASU."VRES_UPD" 
 BEFORE 
 UPDATE
 ON ASU.VRES  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
DECLARE
   CURSOR c1 IS
      SELECT fk_id
        FROM tsmid
       START WITH fk_id = :new.fk_smid
      CONNECT BY PRIOR fk_owner = fk_id
       ORDER BY ROWNUM DESC;
   CURSOR c2 IS
      SELECT fk_id
        FROM tsmid
       START WITH fk_id = :old.fk_smid
      CONNECT BY PRIOR fk_owner = fk_id
       ORDER BY ROWNUM DESC;
   CURSOR c3 (resid NUMBER) IS
      SELECT fd_run
        FROM vnaz
       WHERE fk_resultid = resid;
   nidnew    NUMBER;
   nidold    NUMBER;
   vrachid   NUMBER;
   retid     NUMBER;
   d         DATE;
   SMODULENAME VARCHAR2(64);
BEGIN
  SELECT PROGRAM
    INTO sMODULENAME
    FROM V$SESSION
   WHERE SID = USERENV('SID');
   if insnaz.bins then
      return;
   end if;
   insnaz.bins:=true;

   retid := :old.fk_id;
   OPEN c1;
   OPEN c2;
   FETCH c1 INTO nidnew;
   FETCH c2 INTO nidold;
   CLOSE c1;
   CLOSE c2;
   IF nidnew <> nidold THEN
     raise_application_error(-20002, 'нельзя менять вид назначения(FK_SMID) в таблице VRES');
   END IF;
   IF nidnew = get_issledid THEN
      UPDATE tresis
         SET fk_id = :new.fk_id,
             fk_smid = :new.fk_smid,
             fd_ins = :new.fd_ins,
             fc_res = :new.fc_res,
             fk_blobid = :new.fk_blobid,
             fn_res = :new.fn_res,
             fc_type = :new.fc_type,
             fk_vrachid = :new.fk_vrachid,
             fk_pacid = :new.fk_pacid,
             fk_nazid = :new.fk_nazid,
             fc_coment = :new.fc_coment,
             fk_patname = :new.fk_patid
       WHERE fk_id = :old.fk_id;
--       RETURN; 26.05.2010 из-за этой строки сбивалась работа триггеров!!! закомментировано Prihodko N.
   END IF;
   IF nidnew = get_konsid THEN
      UPDATE treskons
         SET fk_id = :new.fk_id,
             fk_smid = :new.fk_smid,
             fd_ins = :new.fd_ins,
             fc_res = :new.fc_res,
             fk_blobid = :new.fk_blobid,
             fn_res = :new.fn_res,
             fc_type = :new.fc_type,
             fk_vrachid = :new.fk_vrachid,
             fk_pacid = :new.fk_pacid,
             fk_nazid = :new.fk_nazid,
             fc_coment = :new.fc_coment,
             fk_patname = :new.fk_patid
       WHERE fk_id = :old.fk_id;
   END IF;
   IF nidnew = get_procid THEN
      UPDATE treslech
         SET fk_id = :new.fk_id,
             fk_smid = :new.fk_smid,
             fd_ins = :new.fd_ins,
             fc_res = :new.fc_res,
             fk_blobid = :new.fk_blobid,
             fn_res = :new.fn_res,
             fc_type = :new.fc_type,
             fk_vrachid = :new.fk_vrachid,
             fk_pacid = :new.fk_pacid,
             fk_nazid = :new.fk_nazid,
             fc_coment = :new.fc_coment,
             fk_patname = :new.fk_patid
       WHERE fk_id = :old.fk_id;
   END IF;
   IF nidnew = get_analid THEN
    IF  (sMODULENAME = 'CorrectKarta.exe')  OR (sMODULENAME = 'CopyPeople.exe')
then
      update tresan set fk_pacid=:new.fk_pacid WHERE fk_id = :old.fk_id;
    else
      if     :old.fk_id != :new.fk_id or
             :old.fk_smid != :new.fk_smid or
             :old.fd_ins != :new.fd_ins or
             :old.fc_res != :new.fc_res or
             :old.fk_blobid != :new.fk_blobid or
             :old.fn_res != :new.fn_res or
             :old.fc_type != :new.fc_type or
             :old.fk_vrachid != :new.fk_vrachid or
             :old.fk_pacid != :new.fk_pacid or
             :old.fk_nazid != :new.fk_nazid or
             :old.fc_coment != :new.fc_coment or
             :old.fk_patid != :new.fk_patid
       then
         insnaz.bins:=false;
         raise_application_error(-20002, 'В таблице VRES можно менять только инормацию о Впервые выявленной патологии');
       end if;
       update tresan set fl_patfirst=:new.fl_patfirst WHERE fk_id = :old.fk_id;
      end if;

   END IF;
  IF get_patalogy_level (:new.fk_patid) > 0 THEN
     IF is_ambulance (:new.fk_pacid) = 0 THEN
        vrachid := get_pacvrach (:new.fk_pacid);
     ELSIF is_ambulance (:new.fk_pacid) = 1 THEN
        vrachid := get_ambvrach (:new.fk_pacid);
     END IF;
     OPEN c3 (retid);
     FETCH c3 INTO d;
     CLOSE c3;
     INSERT INTO tpatalogy
                 (fd_data, fk_pacid, fk_smid, fk_patid, fk_vrachid, fk_resid)
          VALUES (d, :new.fk_pacid, :new.fk_smid, :new.fk_patid, vrachid, retid);
  END IF;
  insnaz.bins:=false;

EXCEPTION
   WHEN NO_DATA_FOUND THEN
      insnaz.bins:=false;
      raise_application_error (-20000, 'Попытка вставить значения отсутствующее в TSMID ' || :new.fk_smid);
   when others then
     insnaz.bins:=false;
     raise;
END;
/
SHOW ERRORS;


