CREATE OR REPLACE VIEW MED.VMEDKART_VS_OST AS
(-- полностью переписал этот view ¬оронов 04.06.07
select KOLOST.RID,
       KOLOST.DRUGID,
       KOLOST.KARTID,
       KOLOST.FN_PARTY_NUM,
       KOLOST.FC_KART_NAME as FC_NAME,
       KOLOST.FD_GODEN,
       KOLOST.FC_SERIAL,
       KOLOST.FL_DEL,
       KOLOST.MOID,
       TMO.FC_NAME as FC_MONAME,
       KOLOST.FN_PRICE,
       KOLOST.MEDICID,
       tmedic.fc_name as FC_MEDIC,
       TMEDIC.FC_NAME_LAT as FC_LAT_NAME,
       TEI1.FC_NAME as FC_UEDIZM,
       TEI1.FC_OKEI,
       tmedic.FC_EANCODE,
       TMEDIC.FK_TYPE as FK_MEDICTYPENAME,
       null as FC_MEDICTYPENAME,
       tmedic.FK_PAYTYPE,
       null as FC_PAYTYPE,
       tmedic.FN_FPACKINUPACK,
       tmedic.FK_FPACKID,
       TEI2.FC_NAME as FC_FEDIZM,
       tmedic.FARMGRID,
       TUCHGR.UCHGRID,
       TUCHGR.FC_UCHGR,
       TMEDIC.UCHGRID as CUR_UCHGRID,
       tmedic.FK_ATC,
       NVL(KOLOST.FN_KOLOST, 0) as FN_KOLOST, -- парти€
       NVL(KOLOST.FN_KOLOST * KOLOST.FN_PRICE, 0) as FN_SUMM,
       KOLOST.FN_OST_TYPE,
       NVL(KOLOST.FN_KOLOST, 0) * NVL(tmedic.FN_FPACKINUPACK, 1) as FN_FAS_KOLOST,
       DPCID,
       PC.PFC_VALUE as FC_PROD,
       PC.SFC_VALUE as FC_CERT,
       KOLOST.FN_PRODCERTID,
       tmedic.FK_SKLAD_ID,
       KOLOST.FL_BRAK,
       KOLOST.BRAK_UNIQSTR,
       KOLOST.FK_FINSOURCE_ID,
       KOLOST.PRIH_DPID,
       D.FD_DATA as PRIH_DATA,   
       D.FC_DOC FC_PRIH_DOC,       
       KOLOST.FC_INV_NOMER,
       KOLOST.FC_QUOTA_CODE,
       tmedic.FC_INTERNATIONAL_NAME,
       KOLOST.FN_NDS,
       KOLOST.FN_NACENKA,
       KOLOST.FN_PRICE_MNF,
       KOLOST.FL_JNVLS,
       tmedic.FL_VISIBLE_FOR_NOT_APTEKA,
       tmedic.FL_MIBP,
       tmedic.FL_FORMULAR,
       tmedic.FL_FORM_KOMISS,
       tmedic.FC_CLASS,
       tmedic.FK_OKDP,
       OKDP.FC_CODE || ' ' || OKDP.FC_NAME as FC_OKDP,
       -- считаем остатки по медикаменту - сумма по карточкам       
       --MEDOST.AMMZ
       ( select sum(O.FN_KOLOST)
           from med.TKART tk
          inner join ( 
                select A.FK_KARTID, A.FN_KOL as FN_KOLOST
                  from MED.TCALC_PRIH_RASH A
                 where A.FK_MOGROUP = MED.PKG_MEDSES.GET_CUR_MOGROUP
                   and A.FD_DATE >= TRUNC(MED.PKG_MEDSES.GET_DATA1)
                   and A.FD_DATE < TRUNC(MED.PKG_MEDSES.GET_DATA2 + 1)
                union all
                select OST.FK_KARTID, OST.FN_OST
                  from MED.TMEDIATE_OST OST
                 where OST.FK_MOGROUP = MED.PKG_MEDSES.GET_CUR_MOGROUP_BY_CUR_MO
                union all
                select T_OST.FK_KARTID, T_OST.FN_KOL
                  from MED.TTEMP_OST T_OST
                 where T_OST.FK_MOGROUPID = MED.PKG_MEDSES.GET_CUR_MOGROUP_BY_CUR_MO
                ) O
            on tk.KARTID = o.FK_KARTID
         where tk.MEDICID = kolost.medicid
       ) as AMMZ       
  from MED.VMEDKART_KOLOST KOLOST
 inner join med.TMEDIC tmedic
    on kolost.MEDICID = tmedic.MEDICID  
  left join MED.TDOCS D -- приход
    on KOLOST.PRIH_DPID = D.DPID
  left join MED.TUCHGR
    on COALESCE(KOLOST.FK_UCHGRID, TMEDIC.UCHGRID) = TUCHGR.UCHGRID
  left join med.TMO 
    on kolost.MOID = tmo.moid
  left join MED.TEI TEI1
    on TMEDIC.EIID = TEI1.EIID
  left join MED.TEI TEI2
    on TMEDIC.FK_FPACKID = TEI2.EIID
  left join MED.TSPRAV_OKDP OKDP
    on TMEDIC.FK_OKDP = OKDP.FK_ID
  left join ( select P2.FK_ID as SFK_ID,
                     coalesce(P1.FC_VALUE, P2.FC_VALUE) as PFC_VALUE, -- производитель
                     DECODE(P1.FK_ID, null, null, P2.FC_VALUE) as SFC_VALUE -- сертификат
                from MED.TPRODCERT P2
                left join  MED.TPRODCERT P1
                  on P1.FK_ID = P2.FN_PARENT ) pc
    on kolost.FN_PRODCERTID = PC.SFK_ID                  
/*  left join
       (select K.MEDICID, sum(O.FN_KOLOST) as AMMZ
          from ( 
                select A.FK_KARTID, A.FN_KOL as FN_KOLOST
                  from MED.TCALC_PRIH_RASH A
                 where A.FK_MOGROUP = MED.PKG_MEDSES.GET_CUR_MOGROUP
                   and A.FD_DATE >= TRUNC(MED.PKG_MEDSES.GET_DATA1)
                   and A.FD_DATE < TRUNC(MED.PKG_MEDSES.GET_DATA2 + 1)
                union all
                select OST.FK_KARTID, OST.FN_OST
                  from MED.TMEDIATE_OST OST
                 where OST.FK_MOGROUP = MED.PKG_MEDSES.GET_CUR_MOGROUP_BY_CUR_MO
                union all
                select T_OST.FK_KARTID, T_OST.FN_KOL
                  from MED.TTEMP_OST T_OST
                 where T_OST.FK_MOGROUPID = MED.PKG_MEDSES.GET_CUR_MOGROUP_BY_CUR_MO
                ) O
         inner join MED.TKART K
            on O.FK_KARTID = K.KARTID
         group by K.MEDICID) MEDOST
  on MEDOST.MEDICID = KOLOST.MEDICID    
  */
  );







