ALTER TABLE ASU.TIB
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TIB CASCADE CONSTRAINTS
/

--
-- TIB  (Table) 
--
CREATE TABLE ASU.TIB
(
  FK_ID        NUMBER(15)                       NOT NULL,
  FC_CHAR      VARCHAR2(4000 BYTE),
  FN_NUM       NUMBER(25,10),
  FK_BID       NUMBER(15),
  FK_PACID     NUMBER(15),
  FK_SMID      NUMBER(15),
  FK_SMEDITID  NUMBER(15),
  FK_VRACHID   NUMBER(15),
  FD_DATE      DATE
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          53504K
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

COMMENT ON TABLE ASU.TIB IS 'Òàáëèöà ñ ñîäðåæèìûì äèíìà÷èåñêèõ ôîðì  '
/

COMMENT ON COLUMN ASU.TIB.FK_ID IS 'SEQUENCE=[SEQ_TIB]'
/

COMMENT ON COLUMN ASU.TIB.FC_CHAR IS 'ñòðîêà (EDIT, MEMO, BIGMEMO, NUMBER)'
/

COMMENT ON COLUMN ASU.TIB.FN_NUM IS 'NUMBER'
/

COMMENT ON COLUMN ASU.TIB.FK_BID IS 'TBLOBS.FK_ID'
/

COMMENT ON COLUMN ASU.TIB.FK_PACID IS 'TKARTA.FK_ID || VNAZ.FK_ID || TTECHBOLEZNI.FK_ID || äëÿ êîíñòàíòû get_person - TPEOPLES.FK_ID'
/

COMMENT ON COLUMN ASU.TIB.FK_SMID IS 'TSMID.FK_ID (äëÿ êîìáîáîêñà êîä)'
/

COMMENT ON COLUMN ASU.TIB.FK_SMEDITID IS 'TSMID.FK_ID (êîä ïîëÿ ââîäà)'
/

COMMENT ON COLUMN ASU.TIB.FK_VRACHID IS 'Êòî çàíåñ'
/

COMMENT ON COLUMN ASU.TIB.FD_DATE IS 'Äëÿ òèïà DATE'
/


--
-- PK_TIB  (Index) 
--
--  Dependencies: 
--   TIB (Table)
--
CREATE UNIQUE INDEX ASU.PK_TIB ON ASU.TIB
(FK_ID)
NOLOGGING
TABLESPACE USR
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
-- TIB_BID  (Index) 
--
--  Dependencies: 
--   TIB (Table)
--
CREATE INDEX ASU.TIB_BID ON ASU.TIB
(FK_BID)
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
-- TIB_BY_POCHTI_ALL  (Index) 
--
--  Dependencies: 
--   TIB (Table)
--
CREATE INDEX ASU.TIB_BY_POCHTI_ALL ON ASU.TIB
(FK_PACID, FK_SMEDITID, FK_SMID, FN_NUM)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          59136K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TIB_I_FK_PACID_FK_SMID  (Index) 
--
--  Dependencies: 
--   TIB (Table)
--
CREATE INDEX ASU.TIB_I_FK_PACID_FK_SMID ON ASU.TIB
(FK_PACID, FK_SMID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          45824K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TIB_SMID  (Index) 
--
--  Dependencies: 
--   TIB (Table)
--
CREATE INDEX ASU.TIB_SMID ON ASU.TIB
(FK_SMID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          32512K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TIB_VRACHID_SMEDITID  (Index) 
--
--  Dependencies: 
--   TIB (Table)
--
CREATE INDEX ASU.TIB_VRACHID_SMEDITID ON ASU.TIB
(FK_VRACHID, FK_SMEDITID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          38528K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TIB_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TIB (Table)
--
CREATE OR REPLACE TRIGGER ASU."TIB_BEFORE_INSERT" 
 BEFORE
  INSERT
 ON asu.tib
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
Begin
  select seq_tib.nextval into :new.fk_id from dual;
  -- Âðåìåííî äëÿ ïîääåðæêè ñòàðûõ ëè÷íûõ äàííûõ by Xand
  FOR C IN (SELECT fk_peplid FROM tkarta WHERE fk_id=:new.fk_pacid) LOOP
    EXIT;
   FOR CC IN (SELECT fk_id FROM tsmid WHERE fc_synonim LIKE 'LD%' CONNECT BY PRIOR fk_id=fk_owner START WITH fk_id=:new.fk_smeditid) LOOP
     INSERT INTO tib(fk_pacid,fk_smid,fk_smeditid) VALUES (C.fk_peplid,:new.fk_smid,:new.fk_smeditid);
    EXIT;
   END LOOP;
  END LOOP;
  -------------
  -- Äëÿ ïîääåðæêè ñòàðûõ ôóíêöèé îïðåäåëåíèÿ ñîöèàëüíîãî ïîëîæåíèÿ ïàöèåíòà by Nefedov S.M. 23.06.2006
  FOR C IN (select fk_id from tsmid where fc_synonim='LD_SOC_POL' and fk_id = :new.fk_smeditid) LOOP
        update TKARTA
        set fk_coc_polid = :new.fk_smid
        where fk_id = :new.fk_pacid;
  END LOOP;
  -------------

End;
/
SHOW ERRORS;


--
-- TIB_AFTER_INSERT  (Trigger) 
--
--  Dependencies: 
--   TIB (Table)
--
CREATE OR REPLACE TRIGGER ASU."TIB_AFTER_INSERT" 
 AFTER
  INSERT
 ON tib
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
  PSYN               TSMID.FC_SYNONIM%TYPE; --ÑÈÍÎÍÈÌ ÄËß ÏÐÈ¨ÌÍÎÃÎ ÎÒÄÅËÅÍÈß
  PTLSYN             TSMID.FC_SYNONIM%TYPE; --ÑÈÍÎÍÈÌ ËÈÑÒÀ ÎÏÁ
  PVECHER            BOOLEAN := FALSE;
  PADPARAM           BOOLEAN := FALSE;
  PAD_L              TSMID.FC_SYNONIM%TYPE;
  PAD_H              TSMID.FC_SYNONIM%TYPE;
  PAD_L_VALUE        TTEMPLIST.FN_VALUE%TYPE;
  PAD_H_VALUE        TTEMPLIST.FN_VALUE%TYPE;
  PID                TSMID.FK_ID%TYPE;
  PTL_CNT            NUMBER := 0;
BEGIN
--ÒÐÈÃÅÐ ÏÎÌÎÃÀÅÒ ÇÀÍÅÑÒÈ ÄÀÍÍÛÅ Ñ ÏÐÈ¨ÌÍÎÃÎ ÎÒÄÅËÅÍÈß Â ÒÀÁËÈÖÓ "ËÈÑÒÀ ÎÏÁ"(TTEMPLIST)
  SELECT FC_SYNONIM INTO PSYN FROM TSMID WHERE FK_ID = :NEW.FK_SMID;
  IF PSYN IN ('PD_AD','PD_TEMPER','PD_VES','PD_ROST','TECH_ROD_PULS') THEN
    BEGIN
      IF (SYSDATE - TRUNC(SYSDATE)) > 1/2 THEN  --ÎÏÅÐÅÄÅËÅÍÈÅ ÒÈÏÀ(ÓÒÐÎ-ÄÅÍÜ) ÄËß ÏÀÐÀÌÅÒÐÀ
        PVECHER := TRUE;
      END IF;

      IF PSYN = 'PD_AD' THEN
        BEGIN
          PADPARAM := TRUE;
          IF PVECHER THEN
            BEGIN
              PAD_L := 'TL_AD_L_VECHER';
              PAD_H := 'TL_AD_H_VECHER';
            END;
          ELSE
            BEGIN
              PAD_L := 'TL_AD_L_UTRO';
              PAD_H := 'TL_AD_H_UTRO';
            END;
          END IF;
        END;
      ELSIF PSYN = 'PD_TEMPER' THEN
        BEGIN
          IF PVECHER THEN
                --commented by a.nakorjakov 04-02-2008 PTLSYN := 'TL_PULS_VECHER';
                PTLSYN := 'TL_TEMPER_VECHER'; --added by a.nakorjakov
          ELSE PTLSYN := 'TL_TEMPER_UTRO';
          END IF;
        END;
      ELSIF PSYN = 'PD_VES' THEN PTLSYN := 'TL_VES';
      ELSIF PSYN = 'PD_ROST' THEN PTLSYN := 'TL_ROST';
      /*Added by A.Nakorjakov 120508
      started*/
      ELSIF PSYN = 'TECH_ROD_PULS' THEN
        BEGIN
            IF PVECHER THEN
                PTLSYN := 'TL_PULS_VECHER';
            ELSE
                PTLSYN := 'TL_PULS_UTRO';
            END IF;
        END;
      /*Added by A.Nakorjakov 120508
      started*/
      END IF;

      IF PADPARAM THEN--ÅÑËÈ ÏÀÐÀÌÅÒÐ - ÀÐÒÅÐÈÀËÜÍÎÅ ÄÀÂËÅÍÈÅ(Ò.Ê. ÎÍ Â "ÏÐÈ¨ÌÊÅ" ÒÈÏÀ EDIT: ÍÈÆ/ÂÅÐÕ), ÅÃÎ ÍÀÄÎ ÏÀÐÑÈÒÜ.
        BEGIN
          IF (INSTR(:NEW.FC_CHAR,'/')-1) > 0 THEN
            BEGIN
              --commented by A.Nakorjakov 04-02-2008 PAD_L_VALUE := SUBSTR(:NEW.FC_CHAR,0,INSTR(:NEW.FC_CHAR,'/')-1);
              --commented by A.Nakorjakov 04-02-2008 PAD_H_VALUE := SUBSTR(:NEW.FC_CHAR,INSTR(:NEW.FC_CHAR,'/')+1);
              PAD_H_VALUE := SUBSTR(:NEW.FC_CHAR,0,INSTR(:NEW.FC_CHAR,'/')-1); --Added by A.Nakorjakov 04-02-2008
              PAD_L_VALUE := SUBSTR(:NEW.FC_CHAR,INSTR(:NEW.FC_CHAR,'/')+1);--Added by A.Nakorjakov 04-02-2008

              --L
              SELECT FK_ID INTO PID FROM TSMID WHERE FC_SYNONIM = PAD_L;
              --ÏÐÎÂÅÐÈÒÜ ÅÑÒÜ ËÈ ÄÀÍÍÛÅ ÓÆÅ Â TTEMPLIST
              SELECT COUNT(TTEMPLIST.FK_ID) INTO PTL_CNT FROM TTEMPLIST
                    WHERE TTEMPLIST.FK_PACID = :NEW.FK_PACID
                    AND TTEMPLIST.FK_SMIDID = PID
                    AND TTEMPLIST.FD_ZAPOLN = TRUNC(SYSDATE);
              IF PTL_CNT > 0 THEN --UPDATE
                BEGIN
                  UPDATE TTEMPLIST
                     SET TTEMPLIST.FN_VALUE = PAD_L_VALUE
                        WHERE TTEMPLIST.FK_PACID = :NEW.FK_PACID
                        AND TTEMPLIST.FK_SMIDID = PID
                        AND TTEMPLIST.FD_ZAPOLN = TRUNC(SYSDATE);
                END;
              ELSE  --INSERT
                BEGIN
                  INSERT INTO TTEMPLIST(FK_PACID,FD_ZAPOLN,FK_SMIDID,FN_VALUE,FK_SOTRID)
                  VALUES(:NEW.FK_PACID,TRUNC(SYSDATE),PID,PAD_L_VALUE,:NEW.FK_VRACHID);
                END;
              END IF;
              --H
              SELECT FK_ID INTO PID FROM TSMID WHERE FC_SYNONIM = PAD_H;
              --ÏÐÎÂÅÐÈÒÜ ÅÑÒÜ ËÈ ÄÀÍÍÛÅ ÓÆÅ Â TTEMPLIST
              SELECT COUNT(TTEMPLIST.FK_ID) INTO PTL_CNT FROM TTEMPLIST
                    WHERE TTEMPLIST.FK_PACID = :NEW.FK_PACID
                    AND TTEMPLIST.FK_SMIDID = PID
                    AND TTEMPLIST.FD_ZAPOLN = TRUNC(SYSDATE);
              IF PTL_CNT > 0 THEN --UPDATE
                BEGIN
                  UPDATE TTEMPLIST
                     SET TTEMPLIST.FN_VALUE = PAD_H_VALUE
                        WHERE TTEMPLIST.FK_PACID = :NEW.FK_PACID
                        AND TTEMPLIST.FK_SMIDID = PID
                        AND TTEMPLIST.FD_ZAPOLN = TRUNC(SYSDATE);
                END;
              ELSE  --INSERT
                BEGIN
                  INSERT INTO TTEMPLIST(FK_PACID,FD_ZAPOLN,FK_SMIDID,FN_VALUE,FK_SOTRID)
                  VALUES(:NEW.FK_PACID,TRUNC(SYSDATE),PID,PAD_H_VALUE,:NEW.FK_VRACHID);
                END;
              END IF;
            END;
          END IF;
        END;
      ELSE
        BEGIN
          SELECT FK_ID INTO PID FROM TSMID WHERE FC_SYNONIM = PTLSYN;
          --ÏÐÎÂÅÐÈÒÜ ÅÑÒÜ ËÈ ÄÀÍÍÛÅ ÓÆÅ Â TTEMPLIST
          SELECT COUNT(TTEMPLIST.FK_ID) INTO PTL_CNT FROM TTEMPLIST
                WHERE TTEMPLIST.FK_PACID = :NEW.FK_PACID
                AND TTEMPLIST.FK_SMIDID = PID
                AND TTEMPLIST.FD_ZAPOLN = TRUNC(SYSDATE);
          IF PTL_CNT > 0 THEN --UPDATE
            BEGIN
              UPDATE TTEMPLIST
                 SET TTEMPLIST.FN_VALUE = :NEW.FN_NUM
                    WHERE TTEMPLIST.FK_PACID = :NEW.FK_PACID
                    AND TTEMPLIST.FK_SMIDID = PID
                    AND TTEMPLIST.FD_ZAPOLN = TRUNC(SYSDATE);
            END;
          ELSE  --INSERT
            BEGIN
              INSERT INTO TTEMPLIST(FK_PACID,FD_ZAPOLN,FK_SMIDID,FN_VALUE,FK_SOTRID)
              VALUES(:NEW.FK_PACID,TRUNC(SYSDATE),PID,:NEW.FN_NUM,:NEW.FK_VRACHID);
            END;
          END IF;
        END;
      END IF;
    END;
  END IF;

EXCEPTION
  --WHEN NO_DATA_FOUND THEN NULL;
  --WHEN OTHERS THEN RAISE;
  WHEN OTHERS THEN NULL;
END TIB_AFTER_INSERT;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TIB 
-- 
ALTER TABLE ASU.TIB ADD (
  CONSTRAINT PK_TIB
 PRIMARY KEY
 (FK_ID)
    USING INDEX 
    TABLESPACE USR
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
               ))
/

GRANT DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE ON ASU.TIB TO EXCHANGE
/

GRANT DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE ON ASU.TIB TO EXCH43
/

