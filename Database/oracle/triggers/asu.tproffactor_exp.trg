DROP TRIGGER ASU.TPROFFACTOR_EXP
/

--
-- TPROFFACTOR_EXP  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBMS_STANDARD (Package)
--   TPROFFACTOR (Table)
--   PKG_LINK (Package)
--
CREATE OR REPLACE TRIGGER ASU."TPROFFACTOR_EXP" 
AFTER INSERT  OR UPDATE  OR  DELETE
ON ASU.TPROFFACTOR REFERENCING NEW AS NEW OLD AS OLD
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
                      'TPROFFACTOR DELETE KEY=FK_ID',
                      :OLD.FK_ID,
                      'DELETE');

    elsif INSERTING then

      -- FK_ID
      PKG_LINK.TO_EXP(dTimeStamp,
                      'ASU',
                      'TPROFFACTOR INSERT FK_ID=:FN_NEW',
                      null,
                      :NEW.FK_ID);

      -- FK_PARENT
      if :NEW.FK_PARENT is not null then
        PKG_LINK.TO_EXP(dTimeStamp,
                        'ASU',
                        'TPROFFACTOR UPDATE FK_PARENT=:FN_NEW KEY=FK_ID',
                        :NEW.FK_ID,
                        :NEW.FK_PARENT);
      end if;

      -- CODE
      if :NEW.CODE is not null then
        PKG_LINK.TO_EXP(dTimeStamp,
                        'ASU',
                        'TPROFFACTOR UPDATE CODE=:FH_NEW KEY=FK_ID',
                        :NEW.FK_ID,
                        :NEW.CODE);
      end if;

      -- NAME
      if :NEW.NAME is not null then
        PKG_LINK.TO_EXP(dTimeStamp,
                        'ASU',
                        'TPROFFACTOR UPDATE NAME=:FH_NEW KEY=FK_ID',
                        :NEW.FK_ID,
                        :NEW.NAME);
      end if;

    elsif UPDATING then

      -- FK_ID
      IF UPDATING('FK_ID') THEN
        PKG_LINK.TO_EXP(dTimeStamp,
                        'ASU',
                        'TPROFFACTOR UPDATE FK_ID=:FN_NEW KEY=FK_ID',
                        :OLD.FK_ID,
                        :NEW.FK_ID);
      end if;

      -- FK_PARENT
      IF UPDATING('FK_PARENT') THEN
        PKG_LINK.TO_EXP(dTimeStamp,
                        'ASU',
                        'TPROFFACTOR UPDATE FK_PARENT=:FN_NEW KEY=FK_ID',
                        :OLD.FK_ID,
                        :NEW.FK_PARENT);
      end if;

      -- CODE
      IF UPDATING('CODE') THEN
        PKG_LINK.TO_EXP(dTimeStamp,
                        'ASU',
                        'TPROFFACTOR UPDATE CODE=:FH_NEW KEY=FK_ID',
                        :OLD.FK_ID,
                        :NEW.CODE);
      end if;

      -- NAME
      IF UPDATING('NAME') THEN
        PKG_LINK.TO_EXP(dTimeStamp,
                        'ASU',
                        'TPROFFACTOR UPDATE NAME=:FH_NEW KEY=FK_ID',
                        :OLD.FK_ID,
                        :NEW.NAME);
      end if;

    end if;
  end if;
END TPROFFACTOR_EXP;
/
SHOW ERRORS;


