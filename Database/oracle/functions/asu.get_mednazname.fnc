DROP FUNCTION ASU.GET_MEDNAZNAME
/

--
-- GET_MEDNAZNAME  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TNAZMED (Table)
--   TNAZMEDLECH (Table)
--   TFREQUENCY (Table)
--   TVVODPATH (Table)
--   TLATIN_NAMES (Table)
--   TMASSUNITS (Table)
--   TMEDIC_TSPECIALMEDIC (Table)
--   IS_AMBULANCE (Function)
--
CREATE OR REPLACE FUNCTION ASU."GET_MEDNAZNAME" (pnazid IN NUMBER) RETURN VARCHAR2 IS
 -- Created 20071109 by Linnikov
 -- Функция возвращает название и параметры едикаментозного назначения по TNAZMED.FK_ID
 CURSOR C(pfk_nazid NUMBER) IS
  SELECT LN.FC_NAME ||
         DECODE(L.FN_KOL,
                0,
                '',
                ', кол-во: ' || TO_CHAR(ROUND(L.FN_KOL, 2), 'FM999G999G990D09') || ' ' ||
                U.FC_SHORTNAME)  ||
         DECODE(L.FN_DOZA,
                0,
                '',
                ', доза: ' || TO_CHAR(ROUND(L.FN_DOZA, 2), 'FM999G990D09') || ' ' ||
                U.FC_SHORTNAME) ||
         DECODE(TRIM(F.FC_NAME), NULL, '', ', кратность: ' || F.FC_NAME) ||
         DECODE(DECODE(ASU.IS_AMBULANCE(N.FK_PACID), 1, 1, 0) * N.FN_DURATION,
                0,
                '',
                ', продолжитeльность: ' || N.FN_DURATION || ' дн') ||
         DECODE(TRIM(N.FC_REMARK), NULL, '', ', ' || N.FC_REMARK) AS FC_MEDNAZ
    FROM TNAZMED                  N,
         TNAZMEDLECH              L,
         MED.TLATIN_NAMES         LN,
         MED.TMASSUNITS           U,
         ASU.TFREQUENCY           F,
         ASU.TVVODPATH            V,
         MED.TMEDIC_TSPECIALMEDIC MS
   WHERE N.FK_ID = L.FK_NAZMEDID
     AND L.FK_MEDICID = LN.FK_ID
     AND L.FK_DOZUNITS = U.FK_ID(+)
     AND N.FK_FREQUENCYID = F.FK_ID(+)
     AND N.FK_VVODPATHID = V.FK_ID(+)
     AND L.FK_MEDICID = MS.MEDICID(+)
     AND N.FK_ID = pfk_nazid;

 pRes VARCHAR2(1000);

BEGIN
 OPEN C(pnazid);
  FETCH C INTO pRes;
 CLOSE C;
 RETURN pRes;
END;
/

SHOW ERRORS;


