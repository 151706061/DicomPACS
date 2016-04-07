DROP FUNCTION ASU.GET_USLCODE
/

--
-- GET_USLCODE  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   PKG_EXCHANGE (Package)
--   THEAL_COST (Table)
--   THEAL_SMID (Table)
--   THEAL_TMP (Table)
--   TAMBULANCE (Table)
--   TSMID (Table)
--   TSOTR (Table)
--   GET_DET_USL_OWNER (Function)
--   GET_OKB_SOOTV_COMPANYID (Function)
--   GET_VZROSL_USL_OWNER (Function)
--   IS_ADULT (Function)
--   TKARTA (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_USLCODE" ( pFK_SMID IN NUMBER,pFK_PACID in NUMBER, pFK_VRACHID in number, IsAmbulance in number default -1)
  RETURN  VARCHAR2 IS
  pFD_ROJD date;
  pIsAmbulance number  := IsAmbulance;
  strTemp VARCHAR2(200);
BEGIN
  if pIsAmbulance = -1 then
   select count(1) into pIsAmbulance from ASU.TAmbulance where FK_ID = pFK_PACID;
  end if;

  if pIsAmbulance = 1 then
    select FD_ROJD into pFD_ROJD from ASU.TAMBULANCE where FK_ID = pFK_PACID;
  else
    select FD_ROJD into pFD_ROJD  from ASU.TKARTA where FK_ID = pFK_PACID;
  end if;

  select
  max(CASE
               -- Ii?aaaeyai ii oaaeeoa niioaaonoaee
                WHEN (SELECT COUNT(1)
                        FROM ASU.TSMID S
                       WHERE S.FK_ID = pFK_SMID
                         AND S.FC_SYNONIM IN
                             ('PERV_OSMOTR', 'TECHBOLEZNI', 'OSM_DNEV', 'KONS_PRIEM_VRACH_OSM')) > 0 THEN
                 (SELECT MAX(H.CODE)
                    FROM ASU.THEAL_TMP H
                   WHERE H.FK_ID =
                         EXCH43.PKG_EXCHANGE.GET_THEIR_ID(ASU.GET_OKB_SOOTV_COMPANYID,
                                                          DECODE(TO_CHAR(ASU.IS_ADULT( pFD_ROJD)),
                                                                 '1',
                                                                 'USL_VZROS_46',
                                                                 'USL_DETI_46'),
                                                          'TS_SPRAV',
                                                          (SELECT FK_SPRAVID
                                                             FROM LOGIN.TSOTR S
                                                            WHERE S.FK_ID = pFK_VRACHID)))
                WHEN (SELECT COUNT(1)
                        FROM asu.tsmid s
                       WHERE s.fk_owner IN
                             (SELECT fk_id FROM asu.tsmid WHERE fc_synonim = 'KONS_SPEC')
                         AND s.fk_id = pFK_SMID) > 0 THEN
                 (SELECT MAX(H.CODE)
                    FROM ASU.THEAL_TMP H, ASU.THEAL_COST C, ASU.THEAL_SMID S
                   WHERE H.FK_ID = C.FK_HEALID
                     AND S.FK_HEAL = H.FK_ID
                     AND S.FK_SMID = pFK_SMID
                     AND H.FK_OWNER = DECODE(ASU.IS_ADULT(pFD_ROJD),
                                             1,
                                             asu.get_vzrosl_usl_owner,
                                             ASU.Get_Det_Usl_Owner))
                ELSE
                 (SELECT MAX(H.CODE)
FROM ASU.THEAL_TMP H, ASU.THEAL_COST C, ASU.THEAL_SMID S
                   WHERE H.FK_ID = C.FK_HEALID
                     AND S.FK_HEAL = H.FK_ID
                     AND S.FK_SMID = pFK_SMID)
               END) into strTemp from DUAL;


  RETURN strTemp;
END;
/

SHOW ERRORS;


