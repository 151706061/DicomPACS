DROP PROCEDURE ASU.DO_INSERT_NEW_DIAG
/

--
-- DO_INSERT_NEW_DIAG  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TDIAG (Table)
--
CREATE OR REPLACE PROCEDURE ASU."DO_INSERT_NEW_DIAG" (pFK_PACID    IN OUT NUMBER,
                              pFK_SMDIAGID IN NUMBER,
                              pFP_TYPE     IN NUMBER,
                              pFL_FIRST    IN NUMBER,
                              pFC_WRITE    IN VARCHAR2,
                              pFD_DATE     IN DATE,
                              pFK_VRACHID  IN NUMBER,
                              pFL_MAIN     IN NUMBER,
                              pFK_MKB10    IN NUMBER DEFAULT -1,
                              pFK_NAZID IN NUMBER DEFAULT -1,
                              pFN_PODT IN NUMBER DEFAULT 0) IS

--  pMaxFK   NUMBER;
--  cErrName VARCHAR2(32767);

--  CURSOR cErr is
--    select s.MACHINE --l.*, o.owner object_owner, o.object_Name
--      from /*sys.all_objects o, */v$lock l, sys.v_$session s
--     where l.sid > 0 and l.type = 'TM' and l.SID = s.SID and /*o.object_id = */l.id1 /*and object_name */= 3587 and AUDSID<>USERENV('SESSIONID');--'TDIAG';
BEGIN
/*  open cErr;
  fetch cErr into cErrName;
  close cErr;
  if cErrName is not null then
    cErrName := 'ВНИМАНИЕ! Подождите. Справочник диагнозов редактируется сотрудником с терминала ' || cErrName;
    raise_application_error(-20001, cErrName);
  end if;*/

-- Efimov V.A. 20100728 Убрал заполнение поля FL_SHOWIB константным значением, теперь значение поля определяется значением поля FL_SHOWIB по умолчанию в asu.TDIAG
  INSERT INTO TDIAG
    (FK_PACID,
     FK_SMDIAGID,
     FP_TYPE,
     FL_FIRST,
     FC_WRITE,
     FD_DATE,
     FK_VRACHID,
     FL_MAIN,
     FK_MKB_10,
     FK_NAZID,
     FN_PODT)
  VALUES
    (pFK_PACID,
     pFK_SMDIAGID,
     pFP_TYPE,
     pFL_FIRST,
     pFC_WRITE,
     pFD_DATE,
     pFK_VRACHID,
     pFL_MAIN,
     pFK_MKB10,
     pFK_NAZID,
     pFN_PODT)
  RETURNING FK_ID INTO pFK_PACID;
END; -- LastUpdated : 18.04.2005 by Kolya
/

SHOW ERRORS;


