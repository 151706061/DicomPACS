DROP PACKAGE BODY ASU.PKG_TARIF_KDN
/

--
-- PKG_TARIF_KDN  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_TARIF_KDN"
IS

FUNCTION GetActualTarifKDN(pFK_TIPROOM in TTARIF_KDN.FK_TIPROOM%TYPE, pDATE in date default sysdate) return number
is
  Result number;

  cursor c is
  select FK_ID
    from TTARIF_KDN
   where FL_DEL <> 1
     and FK_TIPROOM = pFK_TIPROOM
     and FD_DATE = (select MAX(FD_DATE)
                      from TTARIF_KDN
                     where FL_DEL <> 1
                       and FK_TIPROOM = pFK_TIPROOM
                       and trunc(FD_DATE) <= trunc(pDATE));
begin
  open c;
  fetch c into Result;
  if c%NOTFOUND then
    Result := -1;
  end if;
  close c;

  Return Result;
end;

FUNCTION GetTarifKDN(pFK_TIPROOM in TTARIF_KDN.FK_TIPROOM%TYPE, pDATE in date default sysdate) return number
is
  Result number;

  cursor c is
  select FN_COST
    from TTARIF_KDN
   where FL_DEL <> 1
     and FK_TIPROOM = pFK_TIPROOM
     and FD_DATE = (select MAX(FD_DATE)
                      from TTARIF_KDN
                     where FL_DEL <> 1
                       and FK_TIPROOM = pFK_TIPROOM
                       and trunc(FD_DATE) <= trunc(pDATE));
begin
  open c;
  fetch c into Result;
  if c%NOTFOUND then
    Result := 0;
  end if;
  close c;

  Return Result;
end;

FUNCTION GetKDNSumCost(pPacid in number, pPereselID in number default -1) return number
is
  Result number;

  cursor c is
  with
  T as
  (select P.FK_PACID,
         get_fio(P.FK_PACID) FC_FIO,
         case
           when EXISTS(SELECT NULL
                         FROM ASU.TKARTA,
                              (SELECT FK_ID
                                 FROM ASU.TUSLVID
                               CONNECT BY PRIOR FK_ID = FK_OWNERID
                                START WITH FK_ID IN (ASU.DOC_IB_DS, ASU.DOC_IBDS_STAC, ASU.DOC_ABORT_DS)) DOC
                        WHERE TKARTA.FK_ID = P.FK_PACID
                          AND DOC.FK_ID = FK_USLVIDID)
           then
             (trunc(P.Fd_Data2) - trunc(P.Fd_Data1))+1
           else
             (trunc(P.Fd_Data2) - trunc(P.Fd_Data1))
         end FN_KDN,
         P.FK_PALATAID,
         P.FD_DATA1,
         P.FD_DATA2,
         decode(NVL(P.FK_KOYKAVIDID, 0), 0, STR.FK_VIDID, P.FK_KOYKAVIDID) FK_KOYKAVIDID,
         decode(NVL(P.FK_KOYKAVIDID, 0), 0, TR.FC_VID, (SELECT MAX(FC_VID) FROM TTIPROOM WHERE FK_ID = P.FK_KOYKAVIDID)) FC_VID,
         decode(NVL(P.FK_KOYKAVIDID, 0), 0, PKG_TARIF_KDN.GetTarifKDN(STR.FK_VIDID, trunc(P.Fd_Data1)), PKG_TARIF_KDN.GetTarifKDN(P.FK_KOYKAVIDID, trunc(P.Fd_Data1))) FN_TARIF
    from tperesel p,
         tsrtiproom str,
         ttiproom tr
  where fk_pacid = pPacid
    and P.Fk_Palataid = str.fk_palataid
    and str.fk_vidid = tr.fk_id
    and P.fk_id = decode(pPereselID, -1, P.fk_id, pPereselID))

  select SUM(FN_KDN * FN_TARIF) FN_SUM_ALL
    from T;
begin
  open c;
  fetch c into Result;
  if c%NOTFOUND then
    Result := 0;
  end if;
  close c;

  Return Result;
end;

END;
/

SHOW ERRORS;


