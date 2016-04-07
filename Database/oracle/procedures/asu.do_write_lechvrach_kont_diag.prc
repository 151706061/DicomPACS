DROP PROCEDURE ASU.DO_WRITE_LECHVRACH_KONT_DIAG
/

--
-- DO_WRITE_LECHVRACH_KONT_DIAG  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TIB (Table)
--   TVRACH (Table)
--   PKG_SMINI (Package)
--   PKG_STATUTIL (Package)
--   TKARTA (Table)
--
CREATE OR REPLACE PROCEDURE ASU."DO_WRITE_LECHVRACH_KONT_DIAG" -- Modified by Marriage
 (
  pFK_PACID in NUMBER,
  pFK_LECHVRACHID in NUMBER,
  pFK_KONTID in NUMBER,
  pFK_SOTRID in number,
  pFC_DIAG in varchar2
 )
   IS
   CURSOR DoesLechVrachEx IS SELECT /*+first_row*/COUNT(FK_ID) FROM TVRACH WHERE FK_PACID=pFK_PACID;
   CURSOR DoesKontingentEx IS
                              SELECT /*+first_row*/COUNT(FK_ID)
                               FROM TIB
                              WHERE
                               FK_PACID=( Select FK_PEPLID from TKARTA where FK_ID = pFK_PACID)
                                and
                               FK_SMEDITID = STAT.Pkg_Statutil.GET_SMIDID('LD_KONTINGENT');
   CURSOR DoesDiagEx IS
                              SELECT /*+first_row*/COUNT(FK_ID)
                               FROM TIB
                              WHERE
                               FK_PACID=pFK_PACID
                                and
                               FK_SMEDITID = STAT.Pkg_Statutil.GET_SMIDID('DP_NAPR_DIAG');

   nTemp NUMBER;
   DBNAME varchar2(128);
   pFK_PEPLID number;

BEGIN
  Select FK_PEPLID into pFK_PEPLID from TKARTA where FK_ID = pFK_PACID;

  SELECT  ASU.PKG_SMINI.READSTRING('CONFIG', 'DB_NAME', 'H') into DBNAME FROM DUAL;
 --Пишем Врача
  if pFK_LECHVRACHID > 0 then
   OPEN  DoesLechVrachEx;
   FETCH DoesLechVrachEx INTO nTemp;
   CLOSE DoesLechVrachEx;

   if nTemp=0 then
     INSERT INTO TVRACH(
                          FK_PACID,
                          FK_VRACHID,
                          FL_VID
                         )
                   VALUES(
                          pFK_PACID,
                          pFK_LECHVRACHID,
                          'M'
                         );
   else
     UPDATE TVRACH SET
      FK_VRACHID = pFK_LECHVRACHID
     WHERE FK_PACID=pFK_PACID;
   end if;
  else
   delete from TVRACH  WHERE FK_PACID=pFK_PACID;
  end if;
  --Пишем контингент


  if (pFK_KONTID > 0) and (DBNAME = 'M') then
    OPEN  DoesKontingentEx;
    FETCH DoesKontingentEx INTO nTemp;
    CLOSE DoesKontingentEx;

    if nTemp=0 then
      INSERT INTO TIB(
                           FK_PACID,
                           FK_VRACHID,
                           FK_SMID,
                           FK_SMEDITID
                     )
              VALUES(
                           pFK_PEPLID,
                           pFK_SOTRID,
                           pFK_KONTID,
                           STAT.Pkg_Statutil.GET_SMIDID('LD_KONTINGENT')
                    );
    else
     UPDATE TIB SET
     FK_VRACHID = pFK_SOTRID,
     FK_SMID = pFK_KONTID
     WHERE FK_PACID=pFK_PEPLID and FK_SMEDITID = STAT.Pkg_Statutil.GET_SMIDID('LD_KONTINGENT');
   end if;
  else
   delete from TIB WHERE FK_PACID=pFK_PEPLID and FK_SMEDITID = STAT.Pkg_Statutil.GET_SMIDID('LD_KONTINGENT');
  end if;

  --Пока что пусть в любом случае апдейтится
  if /*(pFC_DIAG is not null)*/ true then
    OPEN  DoesDiagEx;
    FETCH DoesDiagEx INTO nTemp;
    CLOSE DoesDiagEx;

    if nTemp=0 then
      INSERT INTO TIB(
                           FK_PACID,
                           FK_VRACHID,
                           FK_SMID,
                           FK_SMEDITID,
                           FC_CHAR
                     )
              VALUES(
                           pFK_PACID,
                           pFK_SOTRID,
                           STAT.Pkg_Statutil.GET_SMIDID('DP_NAPR_DIAG'),
                           STAT.Pkg_Statutil.GET_SMIDID('DP_NAPR_DIAG'),
                           pFC_DIAG
                    );
    else
     UPDATE TIB SET
     FK_VRACHID = pFK_SOTRID,
     FC_CHAR = pFC_DIAG
     WHERE FK_PACID=pFK_PACID and FK_SMEDITID = STAT.Pkg_Statutil.GET_SMIDID('DP_NAPR_DIAG')
                              and FK_SMID = STAT.Pkg_Statutil.GET_SMIDID('DP_NAPR_DIAG') ;
   end if;
  end if;



END; -- Procedure
/

SHOW ERRORS;


