DROP FUNCTION ASU.GET_MEDNAZ_DAYDOZE
/

--
-- GET_MEDNAZ_DAYDOZE  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TNAZMEDLECH (Table)
--   TFREQUENCY (Table)
--   TVVODPATH (Table)
--   TLATIN_NAMES (Table)
--   TMASSUNITS (Table)
--   TMEDIC (Table)
--   TNAZMED (Synonym)
--   TNAZMEDLECH (Synonym)
--   PKG_MEDICNAZN (Package)
--
CREATE OR REPLACE FUNCTION ASU."GET_MEDNAZ_DAYDOZE" (pnazid IN NUMBER) RETURN VARCHAR2 IS
 -- Created 19122007 by A.Nakorjakov
 -- Функция возвращает суточную дозу медикаментов, назначенных в назначении TNAZMED.FK_ID
 CURSOR cNazMedLechCount(ppnazid Number)
 IS
   SELECT COUNT(1) FROM ASU.TNAZMEDLECH T WHERE T.FK_NAZMEDID = ppnazid;

 pRes VARCHAR2(1000);
 v_fc_remark varchar2(1000);
 IsFirst Number;
 NazMedLechCount Number;
 v_cmn_str varchar2(250):='_';
-- v_DAYDOZE varchar2(100):='';
BEGIN

 open cNazMedLechCount(pnazid);
      fetch cNazMedLechCount into NazMedLechCount;
 close cNazMedLechCount;

 if NazMedLechCount = 0 then RETURN ''; end if; --если нет медикаментов по назначению, то и возвращать нечего

 IsFirst := 1;
 FOR C IN
 (  /*SELECT LN.FC_NAME,round(F.FN_MNOG * L.FN_DOZA, 2) AS FN_DAYDOZE
    FROM TNAZMED                  N,
         TNAZMEDLECH              L,
         MED.TLATIN_NAMES         LN,
         ASU.TFREQUENCY           F
   WHERE N.FK_ID = L.FK_NAZMEDID
     AND L.FK_MEDICID = LN.FK_ID
     AND N.FK_FREQUENCYID = F.FK_ID(+)
     AND N.FK_ID = pnazid*/

   SELECT initcap(nvl(nvl(trim(ME.FC_SHORTNAME),ME.FC_NAME),m.fc_name))
     || DECODE(NVL(L.FN_KOL,0),  0,'', ' по ' || rtrim(TO_CHAR(DECODE(L.FN_KOL,0,'',L.FN_KOL), 'fm9999999999990d9999999'), '.,') || ' ' || U2.FC_SHORTNAME )
     /*|| ' ' || NVL(TRIM(L.FC_REMARK), ' ')*/ as FC_NAME,
--      round(F.FN_MNOG * L.FN_DOZA, 2) AS FN_DAYDOZE,
      rtrim(TO_CHAR(DECODE(L.FN_DOZA,0,'',L.FN_DOZA), 'fm9999999999990d9999999')) AS FN_DAYDOZE,
      U.FC_SHORTNAME as fc_edizmer_doza,
   --     NVL(ME.FC_SHORTNAME,M.FC_NAME)
   --  || DECODE(NVL(L.FN_KOL,0),  0,'', ' по ' || rtrim(TO_CHAR(DECODE(L.FN_KOL,0,'',L.FN_KOL), 'fm9999999999990d9999999'), '.,') || ' ' || U2.FC_SHORTNAME )
   --  || DECODE(nvl(L.FN_DOZA,0), 0,'', ' (доза: ' || rtrim(TO_CHAR(DECODE(L.FN_DOZA,0,'',L.FN_DOZA), 'fm9999999999990d9999999'), '.,') || ' ' || U.FC_SHORTNAME|| ') ' )||' '

      DECODE(V.FC_NAME, null, '', ' '||V.FC_NAME)
     || DECODE(trim(F.FC_NAME), null, '', ' '||F.FC_NAME || '. ')
   --  || DECODE(TRIM(N.FC_REMARK), NULL, '', ', ' || N.FC_REMARK)
   --  || DECODE(nvl(F.FN_MNOG * L.FN_DOZA,0), 0,'', ', Суточная доза ' || rtrim(TO_CHAR(DECODE(F.FN_MNOG * L.FN_DOZA,0,'',F.FN_MNOG * L.FN_DOZA),'fm9999999999990d9999999'), '.,')||' '||U.FC_SHORTNAME||'.')
   --  || decode(L.FN_DOZA, 0, '', ', Курсовая доза: ' || rtrim(TO_CHAR(L.FN_DOZA * F.FN_MNOG * DECODE(N.FD_CANCEL,NULL,TRUNC(SYSDATE) - TRUNC(N.FD_BEGIN) + 1,TRUNC(N.FD_CANCEL) - TRUNC(N.FD_BEGIN) + 1),'fm9999999999990d9999999'), '.,')) || ' ' || U.FC_SHORTNAME

     || case when  ((nvl(N.FP_DURATION_TYPE,1) <> 0) and NVL(N.FN_DURATION,0) > 0) then ', ' ||  N.FN_DURATION ||' '||asu.pkg_medicnazn.GET_DURATION_TYPE_NAME(nvl(N.FP_DURATION_TYPE,1), N.FN_DURATION)
             when    (nvl(N.FP_DURATION_TYPE,1) = 0) then ', ' ||  asu.pkg_medicnazn.GET_DURATION_TYPE_NAME(nvl(N.FP_DURATION_TYPE,1))
                          else '' end
--     || ' ' || NVL(TRIM(L.FC_REMARK), ' ')
        AS FC_MEDNAZ,
      NVL(TRIM(N.FC_REMARK), ' ') as n_fc_remark
      FROM
        MED.TNAZMED N, MED.TNAZMEDLECH L, MED.TLATIN_NAMES M, MED.TMASSUNITS U, MED.TMASSUNITS U2,
        ASU.TFREQUENCY F, ASU.TVVODPATH V, MED.TMEDIC ME
      WHERE N.FK_ID = L.FK_NAZMEDID
        AND L.FK_MEDICID = M.fk_id(+)
        AND L.FK_DOZUNITS = U.FK_ID(+)
        AND L.FK_KOLUNITS = U2.FK_ID(+)
        AND N.FK_FREQUENCYID = F.FK_ID(+)
        AND N.FK_VVODPATHID = V.FK_ID(+)
        AND M.FK_MEDICID = ME.MEDICID(+)
        AND N.FK_ID = pnazid
      ORDER BY L.FK_ID

 )
 LOOP
     if v_fc_remark is null then
       v_fc_remark:=c.n_fc_remark;
     end if;
     /*if ( (nvl(c.FN_DAYDOZE,0)<>0 ) and
          (nvl(v_cmn_str,'')='_') )
     then*/
      -- if v_cmn_str is null then
         v_cmn_str:=':  ' ||C.FC_MEDNAZ;
     --  end if;
   --  end if;
   /*  if (nvl(c.FN_DAYDOZE,0)<>0 ) then
       v_DAYDOZE:=to_char(c.FN_DAYDOZE);
       if v_DAYDOZE like '.%' then
         v_DAYDOZE:='0'||v_DAYDOZE;
       end if;
     else
       v_DAYDOZE:=' ';
     end if;*/
     if IsFirst = 1 then
       -- if NazMedLechCount = 1 then
           --только один медикамент по назначению, возвращать только число
       --    pRes := '0'; -- pRes || C.FN_DAYDOZE;
      --  else
           --несколько медикаментов по назначению, возвращать название медикамента и его суточную дозу
          /* if C.FN_DAYDOZE>0 then
             pRes := pRes || C.FC_NAME || ':  ' ||C.FN_DAYDOZE||' '||nvl(c.fc_edizmer_doza,' ');
           else*/
             pRes := pRes || C.FC_NAME ; -- || ':  ' ||C.FN_DAYDOZE;
         /*  end if;*/
      --  end if;
        IsFirst := 0;
     else
        --если запись непервая, значит несколько медикаментов по одному назначению,
        --возвращать название медикамента и его суточную дозу
--        pRes := pRes || CHR(13)||CHR(10)||C.FC_NAME ; -- || ': ' ||C.FN_DAYDOZE;

       /* if C.FN_DAYDOZE>0 then
          pRes := pRes || '; '||C.FC_NAME || ': ' ||C.FN_DAYDOZE||' '||nvl(c.fc_edizmer_doza,' ');
        else*/
          pRes := pRes || '; '||C.FC_NAME ; -- || ': ' ||C.FN_DAYDOZE;
      /*  end if;*/
     end if;
 END LOOP;
 if v_cmn_str='_' then
   v_cmn_str:='';
 end if;
 if trim(pRes)<>'0' then
   pRes := pRes || v_cmn_str || ' '||nvl(v_fc_remark,' ');
 end if;
 RETURN pRes;
END;
/

SHOW ERRORS;


