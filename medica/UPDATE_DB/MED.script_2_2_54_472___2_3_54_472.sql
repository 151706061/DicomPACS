declare
  v_is_exist number(1) := 0;
begin
  begin
    select 1 into v_is_exist from all_tab_cols t where table_name = 'TMEDIC' and t.column_name='!FL_FORM_KOMISS';
  exception
  when others then
    v_is_exist:=0;
  end;  
  
  if (v_is_exist=0) then
    -- Add/modify columns 
    execute immediate 'alter table MED.TMEDIC add FL_FORM_KOMISS NUMBER(1)';
    -- Add comments to the columns 
    execute immediate 'comment on column MED.TMEDIC.FL_FORM_KOMISS is ''Формулярная комиссия'' ';
    -- Add/modify columns 
    execute immediate 'alter table MED.TMEDIC modify FL_FORM_KOMISS default 0';
    execute immediate 'update MED.TMEDIC set FL_FORM_KOMISS=0';
    commit;  
  end if;
end;
/

begin
  asu.pkg_smini.WRITESTRING('medica.exe','FUNC_USE_FORM_KOMISS','0');
end;
/


CREATE OR REPLACE VIEW MED.VMEDKART_VS_OST AS
(-- полностью переписал этот view Воронов 04.06.07
SELECT
PARTY.RID,
PARTY.KARTID, PARTY.FN_PARTY_NUM, PARTY.FC_NAME, PARTY.FD_GODEN, PARTY.FC_SERIAL,
PARTY.FL_DEL, PARTY.MOID, PARTY.FC_MONAME, PARTY.FN_PRICE, PARTY.MEDICID,
PARTY.FC_MEDIC, PARTY.FC_LAT_NAME, PARTY.FC_UEDIZM, PARTY.FC_OKEI,
PARTY.FC_EANCODE, PARTY.FK_MEDICTYPENAME, PARTY.FC_MEDICTYPENAME,
PARTY.FK_PAYTYPE, PARTY.FC_PAYTYPE, PARTY.FN_FPACKINUPACK, PARTY.FK_FPACKID,
PARTY.FC_FEDIZM, PARTY.FARMGRID, PARTY.UCHGRID,PARTY.FC_UCHGR, PARTY.FK_ATC,
      NVL(KOLOST.FN_KOLOST,0) as FN_KOLOST,-- партия
      NVL(FN_KOLOST*PARTY.FN_PRICE,0) AS FN_SUMM,
      KOLOST.FN_OST_TYPE,
      NVL(KOLOST.FN_KOLOST,0)*NVL(KOLOST.FN_FPACKINUPACK,1) as FN_FAS_KOLOST,
      DPCID,
      PARTY.fc_prod,
      PARTY.fc_cert,
      PARTY.fn_prodcertid,
      PARTY.FK_SKLAD_ID,
      PARTY.FL_BRAK,
      PARTY.BRAK_UNIQSTR,
      PARTY.FK_FINSOURCE_ID,
      kolost.PRIH_DPID,
      d.fd_data as prih_data,
      PARTY.FC_INV_NOMER,
      PARTY.FC_QUOTA_CODE,
      PARTY.FC_INTERNATIONAL_NAME,
      PARTY.FN_NDS, PARTY.FN_NACENKA, PARTY.FN_PRICE_MNF, PARTY.FL_JNVLS, PARTY.FL_VISIBLE_FOR_NOT_APTEKA, PARTY.FL_MIBP, 
      PARTY.FL_FORMULAR, PARTY.FL_FORM_KOMISS, PARTY.FC_CLASS,
			PARTY.FK_OKDP, PARTY.FC_OKDP
--      NVL((select MAX(TDPC.fn_newprice) from MED.TDPC WHERE TDPC.kartid = PARTY.KARTID),0) as FN_PRICE
  FROM
( -- здесь собираются партии
SELECT
       -- поля партии
       TKART.ROWID as RID,
       TKART.KARTID,
       TKART.fn_party_num,
       TKART.FC_NAME,
       TKART.FD_GODEN, TKART.FC_SERIAL, TKART.FL_DEL, TKART.MOID,
       (SELECT TMO.fc_name FROM MED.TMO WHERE TMO.moid = TKART.MOID) as FC_MONAME,
       TKART.FN_PRICE,
       -- поля медикамента
       TKART.MEDICID, tmedic.fc_name as FC_MEDIC,
       tmedic.FC_NAME_LAT as FC_LAT_NAME,
       tmedic.FK_SKLAD_ID,
       TEI1.fc_name as FC_UEDIZM, TEI1.fc_okei, -- fc_okei - че за поле хз
       TMEDIC.fc_eancode,
       TMEDIC.fk_type AS FK_MEDICTYPENAME, null /*TMEDICTYPE.fc_name*/ as FC_MEDICTYPENAME,
       TMEDIC.fk_paytype, null /*TPAYTYPE.fc_name*/ as FC_PAYTYPE,
       TMEDIC.fn_fpackinupack,
       TMEDIC.fk_fpackid,  TEI2.fc_name FC_FEDIZM,
       TMEDIC.FARMGRID,
			 TMEDIC.FK_ATC,
       TMEDIC.UCHGRID,
       TUCHGR.FC_UCHGR,
       pc.pfc_value as FC_PROD,
       pc.Sfc_value as FC_CERT,
       TKART.fn_prodcertid,
       TKART.FL_BRAK,
       TKART.BRAK_UNIQSTR,
       TKART.FK_FINSOURCE_ID,
       TKART.FC_INV_NOMER,
       TKART.FC_QUOTA_CODE,
       TKART.FN_NDS, TKART.FN_NACENKA, TKART.FN_PRICE_MNF, TKART.FL_JNVLS,
       TMEDIC.FL_VISIBLE_FOR_NOT_APTEKA, TMEDIC.FC_INTERNATIONAL_NAME,
       TMEDIC.FL_MIBP, TMEDIC.FL_FORMULAR, TMEDIC.FL_FORM_KOMISS, TMEDIC.FC_CLASS,
  		 TMEDIC.FK_OKDP, OKDP.FC_CODE || ' ' || OKDP.FC_NAME as FC_OKDP
FROM
       MED.TKART, MED.TMEDIC, MED.TEI TEI1, MED.TEI TEI2,  MED.TUCHGR, MED.TSPRAV_OKDP OKDP,
     (select -- pfc_value - названия производителей, Sfc_value - сертификаты
        p1.FK_ID as PFK_ID, p1.fn_parent as pfn_parent, nvl(p1.fc_value, p2.fc_value) as  pfc_value             -- производитель
        ,p2.FK_ID as SFK_ID, p2.fn_parent as Sfn_parent, decode(p1.FK_ID, null, null, p2.fc_value) as Sfc_value -- сертификат
      from med.tprodcert  p1, med.tprodcert p2 where p1.fk_id(+) = p2.fn_parent) pc
WHERE
  --  TMEDIC.medicid=47003 and 
    TKART.medicid = TMEDIC.medicid -- привязка медикамента к партии
    and TKART.fn_prodcertid = pc.SFK_ID(+)
-- далее идут условия привязки характеристик медикамента к медикаменту
    AND TMEDIC.eiid = TEI1.eiid(+)
    AND TMEDIC.UCHGRID = TUCHGR.UCHGRID(+)
    AND TMEDIC.fk_fpackid = TEI2.eiid (+)
    AND TMEDIC.FK_OKDP = OKDP.FK_ID (+)
) PARTY,
  MED.VMEDKART_KOLOST KOLOST,
  med.tdocs d
WHERE
  KOLOST.KartID = PARTY.KARTID(+) and
  KOLOST.prih_dpid = d.dpid(+)
);
/


