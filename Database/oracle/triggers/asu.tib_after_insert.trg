DROP TRIGGER ASU.TIB_AFTER_INSERT
/

--
-- TIB_AFTER_INSERT  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TIB (Table)
--   TSMID (Table)
--   TTEMPLIST (Table)
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


