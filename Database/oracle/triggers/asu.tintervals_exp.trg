DROP TRIGGER ASU.TINTERVALS_EXP
/

--
-- TINTERVALS_EXP  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBMS_STANDARD (Package)
--   PKG_LINK (Package)
--   TINTERVALS (Table)
--
CREATE OR REPLACE TRIGGER ASU."TINTERVALS_EXP" 
AFTER INSERT  OR UPDATE  OR  DELETE
ON ASU.TINTERVALS REFERENCING NEW AS NEW OLD AS OLD
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
                      'TINTERVALS DELETE KEY=FK_ID',
                      :OLD.FK_ID,
                      'DELETE');

    elsif INSERTING then

      -- FK_ID
      PKG_LINK.TO_EXP(dTimeStamp,
                      'ASU',
                      'TINTERVALS INSERT FK_ID=:FN_NEW',
                      null,
                      :NEW.FK_ID);

      -- FN_DAYS
      if :NEW.FN_DAYS is not null then
        PKG_LINK.TO_EXP(dTimeStamp,
                        'ASU',
                        'TINTERVALS UPDATE FN_DAYS=:FN_NEW KEY=FK_ID',
                        :NEW.FK_ID,
                        :NEW.FN_DAYS);
      end if;

      -- NAME
      if :NEW.NAME is not null then
        PKG_LINK.TO_EXP(dTimeStamp,
                        'ASU',
                        'TINTERVALS UPDATE NAME=:FH_NEW KEY=FK_ID',
                        :NEW.FK_ID,
                        :NEW.NAME);
      end if;

    elsif UPDATING then

      -- FN_DAYS
      IF UPDATING('FN_DAYS') THEN
        PKG_LINK.TO_EXP(dTimeStamp,
                        'ASU',
                        'TINTERVALS UPDATE FN_DAYS=:FN_NEW KEY=FK_ID',
                        :OLD.FK_ID,
                        :NEW.FN_DAYS);
      end if;

      -- FK_ID
      IF UPDATING('FK_ID') THEN
        PKG_LINK.TO_EXP(dTimeStamp,
                        'ASU',
                        'TINTERVALS UPDATE FK_ID=:FN_NEW KEY=FK_ID',
                        :OLD.FK_ID,
                        :NEW.FK_ID);
      end if;

      -- NAME
      IF UPDATING('NAME') THEN
        PKG_LINK.TO_EXP(dTimeStamp,
                        'ASU',
                        'TINTERVALS UPDATE NAME=:FH_NEW KEY=FK_ID',
                        :OLD.FK_ID,
                        :NEW.NAME);
      end if;

    end if;
  end if;
END TINTERVALS_EXP;
/
SHOW ERRORS;


