DROP FUNCTION ASU.GET_PLAN_FLUORO_DATE
/

--
-- GET_PLAN_FLUORO_DATE  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TNAZIS (Table)
--   TSMINI (Table)
--   TIB (Table)
--   TAMBULANCE (Table)
--   TTUBPARAM (Table)
--   TSHABLON_XRAY_ZAKL (Table)
--   TSMID (Table)
--   GET_OWNER_FROM_SMID (Function)
--   GET_PASS_REGISTRATOR (Function)
--   GET_VIPNAZ (Function)
--   GET_XRAY_FLU (Function)
--   GET_XRAY_TUBDISPANCER (Function)
--   TKARTA (Table)
--   TPLANTUB (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_PLAN_FLUORO_DATE" (PFK_PACID IN NUMBER) -- передается peplid
RETURN VARCHAR2 IS
sRes VARCHAR2(1000);
dPlan DATE;
idTub NUMBER;
CURSOR cNaz IS SELECT TTUBPARAM.FK_ID
                 FROM ASU.TNAZIS, ASU.TTUBPARAM
                WHERE FK_SMID = ASU.GET_XRAY_TUBDISPANCER
                  AND FK_PACID = PFK_PACID --ASU.GET_PEPLID(PFK_PACID)
                  AND TNAZIS.FK_ID = TTUBPARAM.FK_NAZID(+)
                  AND SYSDATE >= FD_BEGIN
                  AND SYSDATE < TO_DATE(FD_END)+1;

CURSOR cPlan(idTub NUMBER) IS SELECT FD_END
                                FROM ASU.TPLANTUB
                               WHERE FK_TUBID = idTub
                                 AND SYSDATE >= FD_BEGIN
                                 AND SYSDATE < TO_DATE(FD_END)+1;

CURSOR c IS SELECT TO_CHAR(ADD_MONTHS(FD_RUN, (select (select fn_norm1 from asu.tsmid where fk_id = tib.fk_smid)
                                                 from asu.tib
                                                where fk_pacid = PFK_PACID --asu.get_peplid(PFK_PACID)
                                                  and fk_smid in (select fk_id
                                                 from asu.tsmid
                                                where fk_owner in (select fk_id from asu.tsmid where fc_synonim = 'XRAY_PERIOD_OSMOTROV')))),
                           'dd.mm.yyyy', 'nls_date_language=russian')
              FROM ASU.TNAZIS
             WHERE ASU.GET_OWNER_FROM_SMID(TNAZIS.FK_SMID) = GET_XRAY_FLU
               AND TNAZIS.FK_PACID IN (SELECT FK_ID FROM ASU.TAMBULANCE WHERE FK_PEPLID = PFK_PACID
                                        UNION
                                       SELECT FK_ID FROM ASU.TKARTA WHERE FK_PEPLID = PFK_PACID)
               AND (TNAZIS.FK_NAZSOSID = ASU.GET_VIPNAZ OR TNAZIS.FK_NAZSOSID = ASU.GET_PASS_REGISTRATOR)
               AND NOT EXISTS (SELECT 1 
                                 FROM ASU.TIB 
                                WHERE FK_PACID = TNAZIS.FK_ID 
                                  AND FK_BID IN (SELECT FK_ID FROM ASU.TSHABLON_XRAY_ZAKL
                                                 START WITH FK_ID IN (SELECT TO_NUMBER(FC_VALUE) 
                                                                        FROM ASU.TSMINI 
                                                                       WHERE FC_SECTION = 'XRAY' 
                                                                         AND FC_KEY = 'DOOBSLEDOVAN')
                                                 CONNECT BY PRIOR FK_ID = FK_OWNER))
            ORDER BY FD_RUN DESC;
BEGIN
  OPEN cNaz;
  FETCH cNaz INTO idTub;

  IF cNaz%ROWCOUNT > 0 THEN
    OPEN cPlan(idTub);
    FETCH cPlan INTO dPlan;
    CLOSE cPlan;
    sRes := TO_CHAR(dPlan, 'dd.mm.yyyy');
  ELSE
    OPEN c;
    FETCH c INTO sRes;
    CLOSE c;
  END IF;
   CLOSE cNaz;
   RETURN sRes;
END; --Created: Prihodko; Comments: Возвращает дату плановой флюорографии
/

SHOW ERRORS;


