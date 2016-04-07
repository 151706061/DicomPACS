DROP PROCEDURE ASU.DO_WRITE_DIAGDETAIL
/

--
-- DO_WRITE_DIAGDETAIL  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TDIAGDETAIL (Table)
--
CREATE OR REPLACE PROCEDURE ASU."DO_WRITE_DIAGDETAIL" -- Modified by Marriage
(pFK_DIAGID in NUMBER, pFK_ETAPID in NUMBER, pFK_STADIAID in NUMBER, pFK_GRUPID in NUMBER default -1) IS
  CURSOR DoesEx IS
    SELECT
     COUNT(FK_ID)
      FROM Tdiagdetail
     WHERE FK_DIAGID = pFK_DIAGID;
  nTemp NUMBER;

BEGIN

  OPEN DoesEx;
  FETCH DoesEx into nTemp;
  Close DoesEx;

  if nTemp = 0 then
   INSERT INTO Tdiagdetail(Fk_Diagid,Fk_Etapid,Fk_Stadiaid,Fk_Grupid)
    values (pFk_Diagid, pFk_Etapid,pFk_Stadiaid,pFK_GRUPID);
  else
   UPDATE Tdiagdetail SET
    Fk_Etapid = pFk_Etapid,
    Fk_Stadiaid = pFk_Stadiaid,
    fk_grupid = pFK_GRUPID
   where Fk_Diagid = pFk_Diagid;
  end if;
END; -- Procedure
/

SHOW ERRORS;


