DROP TRIGGER ASU.TPROFACTOR_STD_EXP
/

--
-- TPROFACTOR_STD_EXP  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBMS_STANDARD (Package)
--   TPROFACTOR_STD (Table)
--   PKG_LINK (Package)
--
CREATE OR REPLACE TRIGGER ASU."TPROFACTOR_STD_EXP" 
AFTER INSERT  OR UPDATE  OR  DELETE
ON ASU.TPROFACTOR_STD REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
DISABLE
DECLARE
  dTimeStamp DATE;
Begin
  if (USERENV('CLIENT_INFO') is null) or (USERENV('CLIENT_INFO') <> '%MAIL%') then
    dTimeStamp := SYSDATE;

    if DELETING then
      PKG_LINK.TO_EXP(dTimeStamp,
                      'ASU',
                      'TPROFACTOR_STD DELETE KEY=FK_ID',
                      :OLD.FK_ID,
                      'DELETE');

    elsif INSERTING then

      -- FK_ID
      PKG_LINK.TO_EXP(dTimeStamp,
                      'ASU',
                      'TPROFACTOR_STD INSERT FK_ID=:FN_NEW',
                      null,
                      :NEW.FK_ID);

      -- PERIOD_NUM
      if :NEW.PERIOD_NUM is not null then
        PKG_LINK.TO_EXP(dTimeStamp,
                        'ASU',
                        'TPROFACTOR_STD UPDATE PERIOD_NUM=:FN_NEW KEY=FK_ID',
                        :NEW.FK_ID,
                        :NEW.PERIOD_NUM);
      end if;

      -- PERIOD_NUM_INT
      if :NEW.PERIOD_NUM_INT is not null then
        PKG_LINK.TO_EXP(dTimeStamp,
                        'ASU',
                        'TPROFACTOR_STD UPDATE PERIOD_NUM_INT=:FN_NEW KEY=FK_ID',
                        :NEW.FK_ID,
                        :NEW.PERIOD_NUM_INT);
      end if;

      -- FK_INTERVAL
      if :NEW.FK_INTERVAL is not null then
        PKG_LINK.TO_EXP(dTimeStamp,
                        'ASU',
                        'TPROFACTOR_STD UPDATE FK_INTERVAL=:FN_NEW KEY=FK_ID',
                        :NEW.FK_ID,
                        :NEW.FK_INTERVAL);
      end if;

      -- CONTRAINDICATION
      if :NEW.CONTRAINDICATION is not null then
        PKG_LINK.TO_EXP(dTimeStamp,
                        'ASU',
                        'TPROFACTOR_STD UPDATE CONTRAINDICATION=:FH_NEW KEY=FK_ID',
                        :NEW.FK_ID,
                        :NEW.CONTRAINDICATION);
      end if;

      -- INTERPRETATION
      if :NEW.INTERPRETATION is not null then
        PKG_LINK.TO_EXP(dTimeStamp,
                        'ASU',
                        'TPROFACTOR_STD UPDATE INTERPRETATION=:FH_NEW KEY=FK_ID',
                        :NEW.FK_ID,
                        :NEW.INTERPRETATION);
      end if;

      -- PERIOD_NUM_C
      if :NEW.PERIOD_NUM_C is not null then
        PKG_LINK.TO_EXP(dTimeStamp,
                        'ASU',
                        'TPROFACTOR_STD UPDATE PERIOD_NUM_C=:FN_NEW KEY=FK_ID',
                        :NEW.FK_ID,
                        :NEW.PERIOD_NUM_C);
      end if;

      -- PERIOD_NUM_INT_C
      if :NEW.PERIOD_NUM_INT_C is not null then
        PKG_LINK.TO_EXP(dTimeStamp,
                        'ASU',
                        'TPROFACTOR_STD UPDATE PERIOD_NUM_INT_C=:FN_NEW KEY=FK_ID',
                        :NEW.FK_ID,
                        :NEW.PERIOD_NUM_INT_C);
      end if;

      -- FK_INTERVAL_C
      if :NEW.FK_INTERVAL_C is not null then
        PKG_LINK.TO_EXP(dTimeStamp,
                        'ASU',
                        'TPROFACTOR_STD UPDATE FK_INTERVAL_C=:FN_NEW KEY=FK_ID',
                        :NEW.FK_ID,
                        :NEW.FK_INTERVAL_C);
      end if;

    elsif UPDATING then

      -- FK_ID
      IF UPDATING('FK_ID') THEN
        PKG_LINK.TO_EXP(dTimeStamp,
                        'ASU',
                        'TPROFACTOR_STD UPDATE FK_ID=:FN_NEW KEY=FK_ID',
                        :OLD.FK_ID,
                        :NEW.FK_ID);
      end if;

      -- PERIOD_NUM
      IF UPDATING('PERIOD_NUM') THEN
        PKG_LINK.TO_EXP(dTimeStamp,
                        'ASU',
                        'TPROFACTOR_STD UPDATE PERIOD_NUM=:FN_NEW KEY=FK_ID',
                        :OLD.FK_ID,
                        :NEW.PERIOD_NUM);
      end if;

      -- PERIOD_NUM_INT
      IF UPDATING('PERIOD_NUM_INT') THEN
        PKG_LINK.TO_EXP(dTimeStamp,
                        'ASU',
                        'TPROFACTOR_STD UPDATE PERIOD_NUM_INT=:FN_NEW KEY=FK_ID',
                        :OLD.FK_ID,
                        :NEW.PERIOD_NUM_INT);
      end if;

      -- FK_INTERVAL
      IF UPDATING('FK_INTERVAL') THEN
        PKG_LINK.TO_EXP(dTimeStamp,
                        'ASU',
                        'TPROFACTOR_STD UPDATE FK_INTERVAL=:FN_NEW KEY=FK_ID',
                        :OLD.FK_ID,
                        :NEW.FK_INTERVAL);
      end if;

      -- CONTRAINDICATION
      IF UPDATING('CONTRAINDICATION') THEN
        PKG_LINK.TO_EXP(dTimeStamp,
                        'ASU',
                        'TPROFACTOR_STD UPDATE CONTRAINDICATION=:FH_NEW KEY=FK_ID',
                        :OLD.FK_ID,
                        :NEW.CONTRAINDICATION);
      end if;

      -- INTERPRETATION
      IF UPDATING('INTERPRETATION') THEN
        PKG_LINK.TO_EXP(dTimeStamp,
                        'ASU',
                        'TPROFACTOR_STD UPDATE INTERPRETATION=:FH_NEW KEY=FK_ID',
                        :OLD.FK_ID,
                        :NEW.INTERPRETATION);
      end if;

      -- PERIOD_NUM_C
      IF UPDATING('PERIOD_NUM_C') THEN
        PKG_LINK.TO_EXP(dTimeStamp,
                        'ASU',
                        'TPROFACTOR_STD UPDATE PERIOD_NUM_C=:FN_NEW KEY=FK_ID',
                        :OLD.FK_ID,
                        :NEW.PERIOD_NUM_C);
      end if;

      -- PERIOD_NUM_INT_C
      IF UPDATING('PERIOD_NUM_INT_C') THEN
        PKG_LINK.TO_EXP(dTimeStamp,
                        'ASU',
                        'TPROFACTOR_STD UPDATE PERIOD_NUM_INT_C=:FN_NEW KEY=FK_ID',
                        :OLD.FK_ID,
                        :NEW.PERIOD_NUM_INT_C);
      end if;

      -- FK_INTERVAL_C
      IF UPDATING('FK_INTERVAL_C') THEN
        PKG_LINK.TO_EXP(dTimeStamp,
                        'ASU',
                        'TPROFACTOR_STD UPDATE FK_INTERVAL_C=:FN_NEW KEY=FK_ID',
                        :OLD.FK_ID,
                        :NEW.FK_INTERVAL_C);
      end if;

    end if;
  end if;
END TPROFACTOR_STD_EXP;
/
SHOW ERRORS;


