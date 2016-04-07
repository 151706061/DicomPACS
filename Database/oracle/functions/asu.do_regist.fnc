DROP FUNCTION ASU.DO_REGIST
/

--
-- DO_REGIST  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TNAZAN (Table)
--   TLABREG (Table)
--   GET_DEFAULT_FROM_SMID (Function)
--   GET_LAB_RAZD (Function)
--   GET_SMIDFROMNAZ (Function)
--
CREATE OR REPLACE FUNCTION ASU."DO_REGIST" ( pFK_ID IN NUMBER,pFK_PACID IN NUMBER,pFN_PROBE IN NUMBER,pFD_REGIST IN DATE,pFK_NAPRID IN NUMBER,pFK_PLACE IN NUMBER) RETURN NUMBER
   IS
PRAGMA AUTONOMOUS_TRANSACTION;
--
-- Purpose: Регистрирует назначение на анализ с кодом pFK_ID
--
CURSOR cProbe IS SELECT COUNT(FK_ID) FROM TLABREG
                 WHERE FN_PROBE=pFN_PROBE AND FD_REGIST<=pFD_REGIST AND FK_PACID<>pFK_PACID AND
                 GET_DEFAULT_FROM_SMID(get_lab_razd(GET_SMIDFROMNAZ(FK_NAZID)))<>1;
/*CURSOR cID (nFK_PACID NUMBER,nFK_ID NUMBER,dFD_REGIST DATE)IS SELECT tnazan.fk_id
                                            FROM tnazan,
                                                 tsmid,
                                                 (SELECT get_synid ('ANAL_BIOHIM') FK_BIOHIM
                                                    FROM DUAL),
                                                 (SELECT fd_run fd_vrun
                                                    FROM (SELECT TRUNC (fd_run) fd_run, -ROWNUM fk_id,
                                                                 get_fullpath (fk_smid) FC_NAZAN
                                                            FROM (SELECT DISTINCT get_owner_from_smid (fk_smid) fk_smid,
                                                                                  TRUNC (fd_run) fd_run
                                                                    FROM tnazan,
                                                                         tsmid,
                                                                         (SELECT get_synid ('ANAL_BIOHIM') FK_BIOHIM
                                                                            FROM DUAL)
                                                                   WHERE tnazan.fk_pacid = nFK_PACID
                                                                     AND tnazan.fk_nazsosid = 2
                                                                     AND TRUNC (tnazan.fd_run) <= dFD_REGIST
                                                                     AND tsmid.fk_id = tnazan.fk_smid
                                                                     AND fk_owner = FK_BIOHIM) )
                                                   WHERE fk_id = nFK_ID)
                                           WHERE tnazan.fk_pacid = nFK_PACID
                                             AND tnazan.fk_nazsosid = 2
                                             AND TRUNC (tnazan.fd_run) = FD_VRUN
                                             AND tsmid.fk_id = tnazan.fk_smid
                                             AND fk_owner = FK_BIOHIM ;
*/
n NUMBER;
BEGIN

-- Капустин А.В. 30.01.2003 Югорск
/*
  IF GET_DEFAULT_FROM_SMID(get_lab_razd(GET_SMIDFROMNAZ(GET_SMIDFROMNAZ(pFK_ID))))<>1 THEN
    OPEN cProbe;
    FETCH cProbe INTO n;
    CLOSE cProbe;
    if n>0 then
      ROLLBACK;
      raise_application_error(-20001,'Данная проба уже зарегистрирована');
    end if;
  END IF;
*/

/*  --Не дай бог биохимия....
  IF pFK_ID<0 then
    raise_application_error(-20002,'Oops...');
    FOR p IN cID(pFK_PACID,pFK_ID,pFD_REGIST) LOOP
      INSERT INTO TLABREG (FK_PACID,FK_NAZID,FD_REGIST,FN_PROBE,FK_NAPRID) VALUES (pFK_PACID,p.FK_ID,pFD_REGIST,pFN_PROBE,pFK_NAPRID);
      UPDATE TNAZAN SET FK_NAZSOSID=4 WHERE FK_ID=p.FK_ID;
    END LOOP;
  ELSE
*/  --Усе остальное....

  INSERT INTO TLABREG (FK_PACID,FK_NAZID,FD_REGIST,FN_PROBE,FK_NAPRID,FK_PLACE) VALUES (pFK_PACID,pFK_ID,pFD_REGIST,pFN_PROBE,pFK_NAPRID,pFK_PLACE) RETURNING FN_PROBE INTO n;
  COMMIT;
  UPDATE TNAZAN SET FK_NAZSOSID=4 WHERE FK_ID=pFK_ID;
  COMMIT;
  RETURN n;

--  END IF;
END; -- Procedure
/

SHOW ERRORS;


