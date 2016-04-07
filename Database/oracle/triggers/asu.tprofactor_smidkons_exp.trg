DROP TRIGGER ASU.TPROFACTOR_SMIDKONS_EXP
/

--
-- TPROFACTOR_SMIDKONS_EXP  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBMS_STANDARD (Package)
--   TPROFACTOR_SMIDKONS (Table)
--   PKG_LINK (Package)
--
CREATE OR REPLACE TRIGGER ASU."TPROFACTOR_SMIDKONS_EXP" 
AFTER INSERT  OR UPDATE  OR  DELETE
ON ASU.TPROFACTOR_SMIDKONS REFERENCING NEW AS NEW OLD AS OLD
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
                      'TPROFACTOR_SMIDKONS DELETE KEY=FK_ID',
                      :OLD.FK_ID,
                      'DELETE');

    elsif INSERTING then

      -- FK_ID
      PKG_LINK.TO_EXP(dTimeStamp,
                      'ASU',
                      'TPROFACTOR_SMIDKONS INSERT FK_ID=:FN_NEW',
                      null,
                      :NEW.FK_ID);

      -- FK_PROFACTOR
      if :NEW.FK_PROFACTOR is not null then
        PKG_LINK.TO_EXP(dTimeStamp,
                        'ASU',
                        'TPROFACTOR_SMIDKONS UPDATE FK_PROFACTOR=:FN_NEW KEY=FK_ID',
                        :NEW.FK_ID,
                        :NEW.FK_PROFACTOR);
      end if;

      -- FK_SMID
      if :NEW.FK_SMID is not null then
        PKG_LINK.TO_EXP(dTimeStamp,
                        'ASU',
                        'TPROFACTOR_SMIDKONS UPDATE FK_SMID=:FN_NEW KEY=FK_ID',
                        :NEW.FK_ID,
                        :NEW.FK_SMID);
      end if;

    elsif UPDATING then

      -- FK_ID
      IF UPDATING('FK_ID') THEN
        PKG_LINK.TO_EXP(dTimeStamp,
                        'ASU',
                        'TPROFACTOR_SMIDKONS UPDATE FK_ID=:FN_NEW KEY=FK_ID',
                        :OLD.FK_ID,
                        :NEW.FK_ID);
      end if;

      -- FK_PROFACTOR
      IF UPDATING('FK_PROFACTOR') THEN
        PKG_LINK.TO_EXP(dTimeStamp,
                        'ASU',
                        'TPROFACTOR_SMIDKONS UPDATE FK_PROFACTOR=:FN_NEW KEY=FK_ID',
                        :OLD.FK_ID,
                        :NEW.FK_PROFACTOR);
      end if;

      -- FK_SMID
      IF UPDATING('FK_SMID') THEN
        PKG_LINK.TO_EXP(dTimeStamp,
                        'ASU',
                        'TPROFACTOR_SMIDKONS UPDATE FK_SMID=:FN_NEW KEY=FK_ID',
                        :OLD.FK_ID,
                        :NEW.FK_SMID);
      end if;

    end if;
  end if;
END TPROFACTOR_SMIDKONS_EXP;
/
SHOW ERRORS;


