DROP PROCEDURE ASU.DO_INSERT_NEW_SUBDIAG
/

--
-- DO_INSERT_NEW_SUBDIAG  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   V_$SESSION (View)
--   ALL_OBJECTS (View)
--   V$LOCK (Synonym)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSUBDIAG (Table)
--
CREATE OR REPLACE PROCEDURE ASU."DO_INSERT_NEW_SUBDIAG" (pFK_DIAGID   IN NUMBER,
                                pFK_SMDIAGID IN NUMBER) IS

  pMaxFK   NUMBER;
  cErrName VARCHAR2(32767);
  CURSOR cErr IS
    SELECT s.MACHINE --l.*, o.owner object_owner, o.object_Name
      FROM sys.all_objects o, v$lock l, sys.v_$session s
     WHERE l.sid > 0
       AND l.TYPE = 'TM'
       AND l.SID = s.SID
       AND o.object_id = l.id1
       AND object_name = 'TDIAG';
BEGIN
/*  open cErr;
  fetch cErr into cErrName;
  close cErr;
  if cErrName is not null then
    cErrName := 'ВНИМАНИЕ! Подождите. Справочник поддиагнозов редактируется сотрудником с терминала ' || cErrName;
    raise_application_error(-20001, cErrName);
  end if;*/

 -- SELECT IS_SUBDIAG_OK(pFK_SMDIAGID, pFK_DIAGID) INTO pMaxFK FROM DUAL;

  INSERT INTO TSUBDIAG (FK_DIAGID, FK_SMDIAGID)
  VALUES (pFK_DIAGID, pFK_SMDIAGID);
END;-- LastUpdated : 05.11.2003 by TimurLan
/

SHOW ERRORS;


