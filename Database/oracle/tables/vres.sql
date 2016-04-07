DROP TABLE ASU.VRES CASCADE CONSTRAINTS
/

--
-- VRES  (Table) 
--
CREATE TABLE ASU.VRES
(
  FK_ID        NUMBER,
  FK_SMID      NUMBER,
  FD_INS       DATE,
  FC_RES       VARCHAR2(4000 BYTE),
  FK_BLOBID    NUMBER(15),
  FN_RES       NUMBER,
  FC_TYPE      VARCHAR2(30 BYTE),
  FK_VRACHID   NUMBER,
  FK_PACID     NUMBER(15),
  FK_NAZID     NUMBER(15),
  FK_PATID     NUMBER,
  FC_COMENT    VARCHAR2(4000 BYTE),
  FK_SOS       NUMBER,
  FL_ZAKL      NUMBER,
  FL_PATFIRST  NUMBER(1)                        DEFAULT 0
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          85632K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING
/

COMMENT ON TABLE ASU.VRES IS 'Результаты назначений = (TRESLECH+TRESAN+TRESKONS+TRESIS)
  '
/

COMMENT ON COLUMN ASU.VRES.FK_ID IS 'SEQUENCE=[SEQ_TRES]'
/

COMMENT ON COLUMN ASU.VRES.FK_SMID IS 'Код проводимого назначения'
/

COMMENT ON COLUMN ASU.VRES.FD_INS IS 'Дата ввода результата'
/

COMMENT ON COLUMN ASU.VRES.FC_RES IS 'Текстовый результат'
/

COMMENT ON COLUMN ASU.VRES.FK_BLOBID IS 'Ссылка на строковый результат, хранящийся в справочнике TSMID'
/

COMMENT ON COLUMN ASU.VRES.FN_RES IS 'Числовой результат'
/

COMMENT ON COLUMN ASU.VRES.FC_TYPE IS 'Тип результата TEXT - результат в FC_RES, CLOB результат в FK_BLOBID'
/

COMMENT ON COLUMN ASU.VRES.FK_VRACHID IS 'Врач выполнивший'
/

COMMENT ON COLUMN ASU.VRES.FK_PACID IS 'Код пациента'
/

COMMENT ON COLUMN ASU.VRES.FK_NAZID IS 'Код назначения'
/

COMMENT ON COLUMN ASU.VRES.FK_PATID IS 'TPATNAME.FK_ID'
/

COMMENT ON COLUMN ASU.VRES.FC_COMENT IS 'Коментарий'
/

COMMENT ON COLUMN ASU.VRES.FK_SOS IS 'Статус'
/

COMMENT ON COLUMN ASU.VRES.FL_ZAKL IS 'Признак подписи результата (0 - не подписан, 1-подписан)'
/

COMMENT ON COLUMN ASU.VRES.FL_PATFIRST IS 'Впервые ли выявлена патология'
/


--
-- VRES_BY_ID  (Index) 
--
--  Dependencies: 
--   VRES (Table)
--
CREATE INDEX ASU.VRES_BY_ID ON ASU.VRES
(FK_ID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- VRES_BY_INS  (Index) 
--
--  Dependencies: 
--   VRES (Table)
--
CREATE INDEX ASU.VRES_BY_INS ON ASU.VRES
(FD_INS)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          22912K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- VRES_BY_NAZID_ZAKL  (Index) 
--
--  Dependencies: 
--   VRES (Table)
--
CREATE INDEX ASU.VRES_BY_NAZID_ZAKL ON ASU.VRES
(FK_NAZID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          23296K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- VRES$PACID$FK_SMID  (Index) 
--
--  Dependencies: 
--   VRES (Table)
--
CREATE INDEX ASU.VRES$PACID$FK_SMID ON ASU.VRES
(FK_PACID, FK_SMID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- VRES_PACID_SOS  (Index) 
--
--  Dependencies: 
--   VRES (Table)
--
CREATE INDEX ASU.VRES_PACID_SOS ON ASU.VRES
(FK_PACID, FK_SOS)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- VRES_UPDATE_RASPIS  (Trigger) 
--
--  Dependencies: 
--   VRES (Table)
--
CREATE OR REPLACE TRIGGER ASU."VRES_UPDATE_RASPIS" 
 AFTER
 UPDATE
 ON ASU.VRES  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
BEGIN
 if (:new.FK_SOS = asu.get_vipnaz) or (:new.FK_SOS = asu.get_nazcancel) then
  delete from ASU.TPACLST where TPAClst.Nazid = :new.FK_ID;
 end if;
END;
/
SHOW ERRORS;


--
-- VRES_ALERT  (Trigger) 
--
--  Dependencies: 
--   VRES (Table)
--
CREATE OR REPLACE TRIGGER ASU."VRES_ALERT" 
  AFTER INSERT OR UPDATE-- OR DELETE 
  ON ASU.VRES REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW
DECLARE
  cTimeStamp VARCHAR2(32767);
  CURSOR c1 IS
    SELECT PKG_LOG.GET_CLIENT(CLIENT_INFO) CLIENT_INFO
      FROM V$SESSION
     WHERE AUDSID=USERENV('SESSIONID');
  CURSOR c2 IS
    SELECT * FROM SYS.DBMS_ALERT_INFO WHERE NAME LIKE 'NAZMON%';
BEGIN
  IF PKG_LISTPAT.GET_PATHID(:NEW.FK_SMID) <> GET_ANALID THEN
    FOR p in c2 LOOP

      FOR d in c1 LOOP
        cTimeStamp := TRIM(TO_CHAR(SYSDATE,'dd.mm.yyyy hh24:mi:ss ') || GET_SOTRNAME(d.CLIENT_INFO));
      END LOOP;

      if DELETING then
        INSERT INTO TNAZMON (FC_MESSAGE,FC_REСIVER) VALUES (cTimeStamp||' VRES DELETE FK_ID='||TO_CHAR(:OLD.FK_ID),p.NAME);
        DBMS_ALERT.SIGNAL(p.NAME,cTimeStamp||' VRES DELETE FK_ID='||TO_CHAR(:OLD.FK_ID));
      elsif INSERTING then
        IF PKG_LISTPAT.GET_PATHID(:NEW.FK_SMID) <> GET_PROCID THEN
          INSERT INTO TNAZMON (FC_MESSAGE,FC_REСIVER) VALUES (cTimeStamp||' VRES INSERT FK_ID='||TO_CHAR(:NEW.FK_ID),p.NAME);
          DBMS_ALERT.SIGNAL(p.NAME,cTimeStamp||' VRES INSERT FK_ID='||TO_CHAR(:NEW.FK_ID));
        ELSIF TRUNC(:NEW.FD_INS) = TRUNC(SYSDATE) THEN
          INSERT INTO TNAZMON (FC_MESSAGE,FC_REСIVER) VALUES (cTimeStamp||' VNAZ INSERT FK_ID='||TO_CHAR(:NEW.FK_NAZID),p.NAME);
          DBMS_ALERT.SIGNAL(p.NAME,cTimeStamp||' VNAZ INSERT FK_ID='||TO_CHAR(:NEW.FK_NAZID));
          /*INSERT INTO TNAZMON (FC_MESSAGE,FC_REСIVER) VALUES (cTimeStamp||' VRES INSERT FK_ID='||TO_CHAR(:NEW.FK_ID),p.NAME);
          DBMS_ALERT.SIGNAL(p.NAME,cTimeStamp||' VRES INSERT FK_ID='||TO_CHAR(:NEW.FK_ID));*/
        END IF;
      elsif UPDATING then
        IF UPDATING('FK_SOS') AND (:NEW.FK_SOS <> :OLD.FK_SOS) THEN
          INSERT INTO TNAZMON (FC_MESSAGE,FC_REСIVER) VALUES (cTimeStamp||' VRES UPDATE FK_ID='||TO_CHAR(:OLD.FK_ID),p.NAME);
          DBMS_ALERT.SIGNAL(p.NAME,cTimeStamp||' VRES UPDATE FK_ID='||TO_CHAR(:OLD.FK_ID));
        END IF;
      end if;

    END LOOP;
  END IF;
END VRES_ALERT;
/
SHOW ERRORS;


--
-- VRES_DEL  (Trigger) 
--
--  Dependencies: 
--   VRES (Table)
--
CREATE OR REPLACE TRIGGER ASU."VRES_DEL" 
 BEFORE
 DELETE
 ON asu.VRES
 REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
DECLARE
BEGIN
    DELETE FROM tpatalogy WHERE fk_resid = :old.fk_id;
    if insnaz.bins then
      return;
    end if;
   insnaz.bins:=true;
    DELETE FROM tresis    WHERE fk_id = :old.fk_id;
    DELETE FROM treskons  WHERE fk_id = :old.fk_id;
    DELETE FROM treslech  WHERE fk_id = :old.fk_id;
    DELETE FROM tresan    WHERE fk_id = :old.fk_id;
  insnaz.bins:=false;
 exception
    when others then
      insnaz.bins:=false;
      raise;
END;
/
SHOW ERRORS;


--
-- VRES_INS  (Trigger) 
--
--  Dependencies: 
--   VRES (Table)
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
   -- добавил insnaz.bins:= false; т.к. после вставки процедуры не сбрасывался флаг и соответсвенно если следом
   -- шла вставка есчо одной записи, рушилась вся логика и не добавлялась запись
      insnaz.bins:= false;
      RETURN;
   END IF;
   IF nid = get_analid THEN
     insnaz.bins:=false;
     raise_application_error(-20002,'Нельзя вставлять данные об анализах в таблицу VRES');
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
      raise_application_error (-20000, '¦юяяvЄър тёЄртшЄ№ т VRES чряшё№ ё ъюфюь юЄёєЄёЄтє¦•шь т TSMID' || :new.fk_smid);
   when others then
      insnaz.bins:=false;
END;
/
SHOW ERRORS;


--
-- VRES_UPD  (Trigger) 
--
--  Dependencies: 
--   VRES (Table)
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


DROP SYNONYM STAT.VRES
/

--
-- VRES  (Synonym) 
--
--  Dependencies: 
--   VRES (Table)
--
CREATE SYNONYM STAT.VRES FOR ASU.VRES
/


