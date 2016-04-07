-- Start of DDL Script for Procedure MED.DO_UPDATE_TREBKOL
-- Generated 05.12.2008 9:12:15 from MED@ASU

CREATE OR REPLACE 
PROCEDURE     med.do_update_trebkol
   ( aDPID IN NUMBER)
   IS

   CURSOR RashByTrebDoc is
   SELECT
        dpc.dpcid,
        DPC.fn_kol as FN_VIDANO_KOL,
        k.medicid,
        DPC.fn_trebkol,
        dpc.fk_trebdpc,
        NVL(tdp.fn_kol,0 ) as fn_kol,
        tdp.fk_medicid
    FROM    MED.TDPC DPC, MED.TTREB_DPC TDP, med.tkart k
    WHERE DPC.dpid = aDPID
      AND DPC.fk_trebdpc = TDp.fk_id(+)
      and dpc.kartid = k.kartid
      order by dpc.fk_trebdpc, k.medicid;

   pfk_trebdpc NUMBER;
   pfk_dpcid NUMBER;
   FN_TREB_KOL_OST NUMBER;
   pIS_TREB_KOL_CHANGE NUMBER;
   -- Declare program variables as shown above
BEGIN
  pfk_trebdpc := -1;
  pfk_dpcid := -1;
  FN_TREB_KOL_OST := 0;
  select DECODE(MAX(s.fc_synonim), 'IMN',0, 1) into pIS_TREB_KOL_CHANGE from med.tdocs d, med.tsklad s 
  where d.dpid = aDPID
    and s.fk_id = d.fk_sklad_id;

  if pIS_TREB_KOL_CHANGE = 1 then  
    FOR pRashByTrebDoc in RashByTrebDoc loop
      if pfk_trebdpc <> pRashByTrebDoc.fk_trebdpc then
        if (FN_TREB_KOL_OST > 0)and(pfk_dpcid<>-1) then
          update MED.TDPC DPC set dpc.fn_trebkol = dpc.fn_trebkol+FN_TREB_KOL_OST where dpc.dpcid = pfk_dpcid;
        end if;
        FN_TREB_KOL_OST := pRashByTrebDoc.fn_kol;
        pfk_trebdpc     := pRashByTrebDoc.fk_trebdpc;
      end if;

      pfk_dpcid       := pRashByTrebDoc.dpcid;
      if FN_TREB_KOL_OST >= pRashByTrebDoc.FN_VIDANO_KOL then
        update MED.TDPC DPC set dpc.fn_trebkol = pRashByTrebDoc.FN_VIDANO_KOL where dpc.dpcid = pfk_dpcid;
        FN_TREB_KOL_OST := FN_TREB_KOL_OST - pRashByTrebDoc.FN_VIDANO_KOL;
      else
        update MED.TDPC DPC set dpc.fn_trebkol = FN_TREB_KOL_OST where dpc.dpcid = pfk_dpcid;
        FN_TREB_KOL_OST := 0;
      end if;
    end loop;

    if (FN_TREB_KOL_OST > 0)and(pfk_dpcid<>-1) then
       update MED.TDPC DPC set dpc.fn_trebkol = dpc.fn_trebkol+FN_TREB_KOL_OST where dpc.dpcid = pfk_dpcid;
    end if;
  else
    FOR pRashByTrebDoc in RashByTrebDoc loop
      update MED.TDPC DPC set dpc.fn_trebkol = pRashByTrebDoc.fn_kol where dpc.dpcid = pRashByTrebDoc.dpcid;     
    end loop;
  end if;    
  
  commit;
END; -- Procedure
/



-- End of DDL Script for Procedure MED.DO_UPDATE_TREBKOL

