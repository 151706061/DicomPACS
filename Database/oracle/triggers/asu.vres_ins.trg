DROP TRIGGER ASU.VRES_INS
/

--
-- VRES_INS  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   DBMS_STANDARD (Package)
--   SEQ_TKARTA (Sequence)
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
CREATE OR REPLACE TRIGGER ASU."VRES_INS" 
 BEFORE 
 INSERT
 ON ASU.VRES  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
DECLARE
   CURSOR c1 IS
      SELECT fk_id FROM tsmid
       START WITH fk_id = :new.fk_smid
      CONNECT BY PRIOR fk_owner = fk_id
       ORDER BY ROWNUM DESC;
--
   CURSOR c2 (resid NUMBER) IS
      SELECT fd_run
        FROM vnaz
       WHERE fk_resultid = resid;
--
   nid       NUMBER;
   retid     NUMBER;
   vrachid   NUMBER;
   d         DATE;
BEGIN
   if :new.fk_id is null then
     select seq_tkarta.nextval into :new.fk_id from dual;
   end if;
   if insnaz.bins then
      return;
   end if;
   insnaz.bins:=true;
   OPEN c1;
   FETCH c1 INTO nid;
   CLOSE c1;
--   select seq_tres.nextval into :new.fk_id from dual;
   IF nid = get_issledid THEN
      INSERT INTO tresis
        (fk_id,fk_smid,fd_ins,fc_res,fk_blobid,fn_res,fc_type,fk_vrachid,fk_pacid,fk_nazid,fc_coment,fk_sos,fl_patfirst)
        VALUES (:new.fk_id,:new.fk_smid,:new.fd_ins,:new.fc_res,:new.fk_blobid,:new.fn_res,:new.fc_type,:new.fk_vrachid,
                :new.fk_pacid,:new.fk_nazid,:new.fc_coment,:new.fk_sos,:new.fl_patfirst)
        RETURNING fk_id INTO retid;
   END IF;
   IF nid = get_konsid THEN
      INSERT INTO treskons
        (fk_id,fk_smid,fd_ins,fc_res,fk_blobid,fn_res,fc_type,fk_vrachid,fk_pacid,fk_nazid,fc_coment,fk_sos,fl_patfirst)
        VALUES (:new.fk_id,:new.fk_smid,:new.fd_ins,:new.fc_res,:new.fk_blobid,:new.fn_res,:new.fc_type,:new.fk_vrachid,
                :new.fk_pacid,:new.fk_nazid,:new.fc_coment,:new.fk_sos,:new.fl_patfirst)
        RETURNING fk_id INTO retid;
   END IF;
   IF nid = get_procid THEN
      INSERT INTO treslech
               (fk_id,fk_smid,fd_ins,fc_res,fk_blobid,fn_res,fc_type,fk_vrachid,fk_pacid,fk_nazid,fc_coment,fk_sos,fl_patfirst)
        VALUES (:new.fk_id,:new.fk_smid,:new.fd_ins,:new.fc_res,:new.fk_blobid,:new.fn_res,:new.fc_type,:new.fk_vrachid,
                :new.fk_pacid,:new.fk_nazid,:new.fc_coment,:new.fk_sos,:new.fl_patfirst)
         RETURNING fk_id INTO retid;
         
    -- deemaric 9.10.2008
   -- добавил insnaz.bins:= false; т.к. после вставки процедуры не сбрасывалс€ флаг и соответсвенно если следом
   -- шла вставка есчо одной записи, рушилась вс€ логика и не добавл€лась запись
      insnaz.bins:= false;
      RETURN;
   END IF;
   IF nid = get_analid THEN
     insnaz.bins:=false;
     raise_application_error(-20002,'Ќельз€ вставл€ть данные об анализах в таблицу VRES');
   END IF;
   IF get_patalogy_level (:new.fk_patid) > 0 THEN
     IF is_ambulance (:new.fk_pacid) = 0 THEN
        vrachid := get_pacvrach (:new.fk_pacid);
     ELSIF is_ambulance (:new.fk_pacid) = 1 THEN
        vrachid := get_ambvrach (:new.fk_pacid);
     END IF;
     OPEN c2 (retid);
     FETCH c2 INTO d;
     CLOSE c2;
     INSERT INTO tpatalogy
                 (fd_data, fk_pacid, fk_smid, fk_patid, fk_vrachid, fk_resid)
          VALUES (d, :new.fk_pacid, :new.fk_smid, :new.fk_patid, vrachid, retid);
   END IF;
   insnaz.bins:=false;
EXCEPTION
   WHEN NO_DATA_FOUND THEN
      insnaz.bins:=false;
      raise_application_error (-20000, '¶ю€€v™ър тЄ™ртш™є т VRES чр€шЄє Є ъюфюь ю™ЄЇ™Є™тЇ¶Хшь т TSMID' || :new.fk_smid);
   when others then
      insnaz.bins:=false;
END;
/
SHOW ERRORS;


