-- Start of DDL Script for View RLS.VNOMENRLS
-- Generated 19-апр-2007 9:57:59 from RLS@ASU
CREATE OR REPLACE VIEW rls.vnomenrls (
   fk_id,
   fk_prep,
   fk_firm,
   nomenfirmname,
   nomenfirmfullname,
   nomenfirmadrmain,
   nomenfirmadrrussia,
   nomenfirmadrussr,
   nomenfirmcountry,
   fk_drugpack_p,
   pdrugpackshortname,
   pdrugpackfullname,
   drugsinppack,
   fk_massunit,
   ppackmass,
   ppackmassshortname,
   ppackmassfullname,
   ppackmassunit,
   fk_cubicunits,
   ppackvolume,
   ppackvolumeshortname,
   ppackvolumefullname,
   ppackvolumeunit,
   fk_drugset,
   drugsetshortname,
   drugsetfullname,
   fk_drugpack_i,
   idrugpackshortname,
   idrugpackfullname,
   ppackinupack,
   inangro,
   eancode,
   fk_drugstorcond,
   fc_drugstorcond,
   fk_life,
   fc_lifetime,
   lifetime,
   priceinrub,
   fc_priceinrub,
   priceorder,
   pricedate,
   priceincurr,
   currencysymbol,
   currencyname,
   fc_priceincurr,
   result )
AS
SELECT /*+ rule*/
      n.fk_id,
      n.fk_prep,
      n.fk_firm,
      fn.fc_name AS NomenFirmName,
      f.fullname AS NomenFirmFullName,
      f.adrmain AS NomenFirmAdrMain,
      f.adrrussia AS NomenFirmAdrRussia,
      f.adrussr AS NomenFirmAdrUssr,
      c.fc_name AS NomenFirmCountry,
      n.fk_drugpack_p,
      dp.fc_name AS PDrugPackShortName,
      dp.fullname AS PDrugPackFullName,
      n.drugsinppack,
      n.fk_massunit,
      n.PPackMass,
      mu.shortname AS PPackMassShortName,
      mu.fullname AS PPackMassFullName,
      CASE WHEN n.fk_massunit > 0 THEN n.ppackmass||' '||mu.shortname ELSE '' END AS PPackMassUnit,
      n.fk_cubicunits,
      n.Ppackvolume,
      cu.shortname AS PpackVolumeShortName,
      cu.fullname AS PpackVolumeFullName,
      CASE WHEN n.fk_cubicunits > 0 THEN n.ppackvolume||' '||cu.shortname ELSE '' END AS PPackVolumeUnit,
      n.fk_drugset,
      ds.shortname AS DrugSetShortName,
      ds.fullname AS DrugSetFullName,
      n.fk_drugpack_i,
      dp2.fc_name AS IDrugPackShortName,
      dp2.fullname AS IDrugPackFullName,
      n.Ppackinupack,
      n.Inangro,
      n.Eancode,
      n.fk_drugstorcond,
      dsc.fc_text AS fc_drugstorcond,
      n.fk_life,
      lt.fc_text AS FC_LifeTime,
      lt.lifetime,
      n.Priceinrub,
      CASE WHEN N.Priceinrub > 0 THEN n.Priceinrub||' р.' ELSE '' END AS FC_Priceinrub,
      n.priceorder,
      n.Pricedate,
      n.Priceincurr,
      cr.symbols AS CurrencySymbol,
      cr.fc_name AS CurrencyName,
      CASE WHEN n.fk_currency > 0 THEN n.Priceincurr||' '||cr.Symbols ELSE '' END AS fc_Priceincurr,
      ' '||CASE WHEN n.fk_drugpack_p = 0 AND nvl(n.drugsinppack,0) = 0 THEN ''
                WHEN n.fk_drugpack_p = 0 AND nvl(n.drugsinppack,0) > 0 THEN ' '||n.drugsinppack||' шт/перв.уп.' 
                WHEN n.fk_drugpack_p > 0 AND nvl(n.drugsinppack,0) = 0 THEN ' '||dp.fc_name||''
      ELSE ' '||n.drugsinppack||' шт/'||dp.fc_name||'' END||      
      CASE WHEN n.fk_massunit > 0 THEN ' '||n.ppackmass||' '||mu.shortname ELSE '' END||
      CASE WHEN n.fk_cubicunits > 0 THEN ' '||n.ppackvolume||' '||cu.shortname ELSE '' END||
      CASE WHEN N.fk_drugpack_i = 0 AND nvl(n.ppackinupack,0) = 0 THEN '' 
           WHEN N.fk_drugpack_i = 0 AND nvl(n.ppackinupack,0) > 0 THEN ' '||n.ppackinupack||' шт/втор.уп.'
           WHEN N.fk_drugpack_i > 0 AND nvl(n.ppackinupack,0) = 0 THEN ' '||dp2.fc_name
      ELSE ' '||n.ppackinupack||' шт/'||dp2.fc_name END
      AS RESULT
FROM  Rls.Tnomen n, Rls.Tfirms f, Rls.Tfirmnames fn, Rls.Tcountries c,
      Rls.Tdrugpack dp,Rls.Tmassunits mu, Rls.Tcubicunits cu, Rls.Tdrugset ds,
      Rls.Tdrugpack dp2, Rls.Tdrugstorcond dsc, Rls.Tdruglifetime lt, Rls.Tcurrency cr
WHERE n.fk_firm = f.fk_id
  AND f.fk_name = fn.fk_id
  AND f.fk_country = c.fk_id 
  AND n.fk_drugpack_p = dp.fk_id
  AND n.fk_massunit = mu.fk_id
  AND n.Fk_Cubicunits = cu.fk_id
  AND n.fk_drugset = ds.fk_id
  AND n.fk_drugpack_i = dp2.fk_id
  AND n.fk_drugstorcond = dsc.fk_id
  AND n.fk_life = lt.fk_id
  AND n.fk_currency = cr.fk_id;
-- Create synonym VNOMENRLS
CREATE PUBLIC SYNONYM vnomenrls  FOR rls.vnomenrls;
-- End of DDL Script for View RLS.VNOMENRLS
