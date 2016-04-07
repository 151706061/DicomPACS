-- Start of DDL Script for View MED.VMEDKART_KOLOST
-- Generated 13-дек-2010 16:41:13 from MED@H100609

CREATE OR REPLACE VIEW med.vmedkart_kolost (
   kartid,
   medicid,
   fn_fpackinupack,
   fn_price,
   fn_kolost,
   fn_ost_type,
   dpcid,
   prih_dpid,
   RID,
   DRUGID,
   FN_PARTY_NUM,
   FC_KART_NAME,
   FD_GODEN, 
   FC_SERIAL,
   FL_DEL,
   MOID,   
   FK_UCHGRID,
   FN_PRODCERTID,
   FL_BRAK,
   BRAK_UNIQSTR,
   FK_FINSOURCE_ID,
   FC_INV_NOMER,
   FC_QUOTA_CODE,
   FN_NDS,
   FN_NACENKA,
   FN_PRICE_MNF,
   FL_JNVLS )
AS
select O.FK_KARTID as KARTID,
       K.MEDICID,
       M.FN_FPACKINUPACK,
       K.FN_PRICE,
       (O.FN_KOLOST + COALESCE(T_OST.FN_KOL, 0)) as FN_KOLOST,
       DECODE(O.REZERV_DPCID, null, 0, 1) as FN_OST_TYPE,
       O.REZERV_DPCID as DPCID,
       O.PRIH_DPID,
       k.ROWID as RID,
       k.DRUGID,
       k.FN_PARTY_NUM,
       k.FC_NAME as FC_KART_NAME,
       k.FD_GODEN, 
       k.FC_SERIAL,
       k.FL_DEL,
       k.MOID,
       k.UCHGRID as FK_UCHGRID,
       k.FN_PRODCERTID,
       k.FL_BRAK,
       k.BRAK_UNIQSTR,
       k.FK_FINSOURCE_ID,
       k.FC_INV_NOMER,
       k.FC_QUOTA_CODE,
       k.FN_NDS,
       k.FN_NACENKA,
       k.FN_PRICE_MNF,
       k.FL_JNVLS       
  from (select B.FK_KARTID,
               sum(B.FN_KOL) as FN_KOLOST,
               B.PRIH_DPID,
               B.REZERV_DPCID
          from (select A.FK_KARTID, A.FN_KOL, A.PRIH_DPID, A.REZERV_DPCID
                  from MED.TCALC_PRIH_RASH A
                 where A.FK_MOGROUP = MED.PKG_MEDSES.GET_CUR_MOGROUP
                   and A.FD_DATE >= TRUNC(MED.PKG_MEDSES.GET_DATA1)
                   and A.FD_DATE < TRUNC(MED.PKG_MEDSES.GET_DATA2 + 1)
                union all
                select FK_KARTID, FN_OST, FK_PRIH_DPID, FK_REZERV_DPCID
                  from MED.TMEDIATE_OST
                 where MED.PKG_MEDSES.GET_CUR_MOGROUP_BY_CUR_MO = FK_MOGROUP) B
         group by B.FK_KARTID, B.PRIH_DPID, B.REZERV_DPCID) O
  inner join MED.TKART K
     on O.FK_KARTID = K.KARTID
  inner join MED.TMEDIC M
     on K.MEDICID = M.MEDICID
   left join (select sum(FN_KOL) as FN_KOL, FK_KARTID
                from MED.TTEMP_OST
               where MED.PKG_MEDSES.GET_CUR_MOGROUP_BY_CUR_MO = FK_MOGROUPID
               group by FK_KARTID ) T_OST
    on O.FK_KARTID = T_OST.FK_KARTID
/


-- End of DDL Script for View MED.VMEDKART_KOLOST

