DROP FUNCTION ASU.IS_PAC_IN_REANIM_OTDEL
/

--
-- IS_PAC_IN_REANIM_OTDEL  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSMINI (Table)
--   TROOM (Table)
--   TOTDEL (Synonym)
--   GET_NEVIP (Function)
--   GET_PRIEM_OTD (Function)
--   GET_REANIMID (Function)
--   GET_REANIM_OTD (Function)
--   GET_RECOMEND (Function)
--   TKARTA (Table)
--   VNAZ (Table)
--
CREATE OR REPLACE FUNCTION ASU."IS_PAC_IN_REANIM_OTDEL" (pFK_PACID in NUMBER)
  RETURN NUMBER IS
  pRes number;
BEGIN
  Select DECODE(count(FK_PACID), 0, 0, 1)
    into pRes
    from (Select Tkarta.FK_ID as FK_PACID
            from ASU.TKArta,
                 ASU.Troom,
                 (Select FK_ID
                    from ASU.TOtdel
                   where FL_DEL = 0
                  connect by prior FK_ID = FK_OWNERID
                   start with FK_ID in
                              (select ASU.GET_REANIM_OTD from dual
                                union all
                               select  ASU.Get_Priem_Otd from dual
                                union all
                               (SELECT to_number(fc_key)
                                  FROM asu.tsmini
                                 where fc_section = 'CONFIG_PRIEMN_OTDEL_ID'
                                   and fc_value like ' Œƒ œ–»®ÃÕŒ√Œ Œ“ƒ≈À≈Õ»ﬂ%'))) TNeedOtdel
           where Tkarta.FK_ROOM = TRoom.FK_ID
             and TNeedOtdel.FK_ID = Troom.FK_OTDELID
             and TKARTA.FK_ID = pFK_PACID
          union all
          Select FK_PACID
            from ASU.VNAZ
           where FK_SMID = ASU."GET_REANIMID"
             and FK_NAZSOSID in (ASU.GET_NEVIP, asu.get_recomend)
             and FK_PACID = pFK_PACID) T;
  return pRes;
END;
/

SHOW ERRORS;


