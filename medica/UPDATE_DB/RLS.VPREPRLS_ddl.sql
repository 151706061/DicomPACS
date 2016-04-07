-- Start of DDL Script for View RLS.VPREPRLS
-- Generated 19-апр-2007 10:05:35 from RLS@ASU
CREATE OR REPLACE VIEW rls.vpreprls (
   fk_id,
   fk_tradename,
   tradename,
   fk_latinname,
   latinname,
   fk_firm,
   prepfirmname,
   prepfirmfullname,
   prepfirmadrmain,
   prepfirmadrrussia,
   prepfirmadrussr,
   prepfirmcountry,
   fk_drugform,
   drugformshortname,
   drugformfullname,
   fk_dfmass,
   dfmass,
   prepmassshortname,
   prepmassfullname,
   prepmassunit,
   fk_dfconc,
   dfconc,
   concshortname,
   concfullname,
   concen,
   fk_dfact,
   dfact,
   aushortname,
   aufullname,
   actunit,
   fk_dfsize,
   dfsize,
   sizeshortname,
   sizefullname,
   sizeunit,
   fk_dfchar,
   charshortname,
   charfullname,
   drugdose,
   norecipe,
   fc_listtype,
   regend,
   fk_regcert,
   fc_regnum,
   regdate,
   fc_regnumber,
   annulyear,
   result )
AS
SELECT /*+ rule*/
      p.fk_id,
      p.fk_tradename,
      tn.fc_name as TradeName,
      p.fk_latinname,
      ln.fc_name AS LatinName,
      p.fk_firm,
      fn.fc_name AS PrepFirmName,
      f.fullname AS PrepFirmFullName,
      f.adrmain AS PrepFirmAdrMain,
      f.adrrussia AS PrepFirmAdrRussia,
      f.adrussr AS PrepFirmAdrUssr,
      c.fc_name AS PrepFirmCountry,
      p.fk_drugform,
      df.fc_name AS DrugFormShortName,
      df.fullname AS DrugFormFullName,
      p.fk_dfmass,
      p.dfmass,
      mu.shortname AS PrepMassShortName,
      mu.fullname AS PrepMassFullName,
      CASE WHEN p.fk_dfmass > 0 THEN p.dfmass||' '||mu.shortname ELSE '' END AS PrepMassUnit,
      p.fk_dfconc,
      p.dfconc,
      cn.ShortName AS ConcShortName,
      cn.FullName AS ConcFullName,
      CASE WHEN p.fk_dfconc > 0 THEN p.dfconc||' '||cn.shortname ELSE '' END AS Concen,
      p.fk_dfact,
      p.dfact,
      au.ShortName AS AuShortName,
      au.FullName AS AuFullName,
      CASE WHEN p.fk_dfact > 0 THEN p.dfact||' '||au.shortname ELSE '' END AS ActUnit,
      p.fk_dfsize,
      p.dfsize,
      su.shortname AS SizeShortName,
      su.Fullname AS SizeFullName,
      CASE WHEN p.fk_dfsize > 0 THEN p.dfsize||' '||su.shortname ELSE '' END AS SizeUnit,
      p.fk_dfchar,
      dfc.shortname AS CharShortName,
      dfc.fullname AS CharFullName,
      p.drugdose,
      p.Norecipe,
      CASE WHEN p.listtype IS NULL THEN '' ELSE 'Список '||p.listtype||'.' END AS fc_listtype,
      p.regend,
      p.fk_regcert,
      rc.fc_regnum,
      rc.regdate,
      rc.fc_regnum||CASE WHEN rc.regdate IS NULL THEN '' ELSE ', '||to_char(rc.regdate,'dd.mm.yyyy') END||
      CASE WHEN p.fk_firm > 0 THEN ' от '||fn.fc_name ||      
        CASE WHEN f.fk_country > 0 THEN ' ('||c.fc_name||')' ELSE '' END
      ELSE '' END AS FC_RegNumber,
      rc.annulyear,
      tn.fc_name||' '||df.fc_name||
      CASE WHEN p.fk_dfmass > 0 THEN ' '||p.dfmass||' '||mu.shortname ELSE '' END||
      CASE WHEN p.fk_dfconc > 0 THEN ' '||p.dfconc||' '||cn.shortname ELSE '' END||
      CASE WHEN p.fk_dfsize > 0 THEN ' '||p.dfsize||' '||su.shortname ELSE '' END||
      Decode(fn.fc_name,'','',' ('||fn.fc_name||')') AS RESULT
FROM  Rls.Tprep p,Rls.Ttradenames tn, Rls.Tlatinnames ln, Rls.Tdrugforms df, 
      Rls.Tmassunits mu, Rls.Tconcen cn, Rls.Tactunits au, Rls.Tsizeunits su,
      Rls.Tdrugformchars dfc, Rls.Tregcert rc, Rls.Tfirms f, Rls.Tfirmnames fn, 
      Rls.Tcountries c
WHERE p.fk_tradename = tn.fk_id
  AND p.fk_latinname = ln.fk_id
  AND p.fk_drugform = df.fk_id
  AND p.fk_dfmass = mu.fk_id
  AND p.fk_dfconc = cn.fk_id
  AND p.fk_dfact = au.fk_id
  AND p.fk_dfsize = su.fk_id
  AND p.fk_dfchar = dfc.fk_id
  AND p.fk_regcert = rc.fk_id
  AND p.fk_firm = f.fk_id
  AND f.fk_name = fn.fk_id
  AND f.fk_country = c.fk_id;
-- Create synonym VPREPRLS
CREATE PUBLIC SYNONYM vpreprls
  FOR rls.vpreprls;
-- End of DDL Script for View RLS.VPREPRLS

