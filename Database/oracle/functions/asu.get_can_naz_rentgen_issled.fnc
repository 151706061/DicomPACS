DROP FUNCTION ASU.GET_CAN_NAZ_RENTGEN_ISSLED
/

--
-- GET_CAN_NAZ_RENTGEN_ISSLED  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TNAZIS (Table)
--   TSMINI (Table)
--   TIB (Table)
--   TAMBULANCE (Table)
--   TSMID (Table)
--   GET_LABVIP (Function)
--   GET_PEPLID (Function)
--   GET_RG_ISSL (Function)
--   GET_VIPNAZ (Function)
--   IS_PAC_IN_REANIM_OTDEL (Function)
--   TKARTA (Table)
--
CREATE OR REPLACE FUNCTION ASU.GET_CAN_NAZ_RENTGEN_ISSLED(pFK_SMID in NUMBER, pFK_PACID in NUMBER)
  --возвращает можно ли пацику назначить рентгенологическое исследование
  --created by Marriage at 11.03.2012
  RETURN number
is
 pRes number;
 pIsRentgen number := 0;
 pMaxDoza number := 0;
 pSmidDoza number := 0;
 pCurrentDoza number := 0;
 pFK_PEPLID number;


 --Является ли рентгенологическим исследованием
 cursor cIsRentgen is
  select 1
   from asu.tsmid
  where fl_showanal = 1 and fk_id = asu.get_rg_issl
   start with fk_id = pFK_SMID
   connect by prior fk_owner = fk_id;

 --Выясняем максимальнодопустимую дозу
 cursor cMaxDoza is
  select TO_NUMBER(fc_value) from asu.tsmini where fc_section = 'XRAY' and fc_key = 'XRAY_SUMDOZA';

 --Выясняем уже полученую дозу
 cursor cCurrentDoza(Peplid in number) is
   select sum(NVL(t1.fn_num,0)) as SumDoza
      from asu.tib t1, asu.tnazis t2,
                                     (
                                      select fk_id from asu.tambulance where fk_peplid = Peplid
                                       union all
                                      select fk_id from asu.tkarta where fk_peplid = Peplid
                                     ) t3
   where t1.fk_pacid = t2.fk_id
     and t1.fk_smid = -1
     and t1.fk_smeditid = -1
     and t2.fk_pacid = t3.fk_id
     and t2.fk_nazsosid in (asu.get_vipnaz, asu.get_labvip)
     and t2.fd_run >= add_months(sysdate, -12)
     and t2.fd_run < trunc(Sysdate)+1;

 --Выясняем дозу для данного назначения по pFK_SMID
 cursor cSmidDoza is
  select NVL(fn_norm0,0) from asu.tsmid where fk_id = pFK_SMID;


BEGIN

  OPEN cIsRentgen;
  FETCH cIsRentgen INTO pIsRentgen;
  CLOSE cIsRentgen;
  --Если реанимация, то ставим сразу
  if IS_PAC_IN_REANIM_OTDEL(pFK_PACID) = 1 then
   pRes := 1;
  else
   --Если рентген, то идем проверять
   if pIsRentgen = 1 then
     OPEN cMaxDoza;
     FETCH cMaxDoza INTO pMaxDoza;
     CLOSE cMaxDoza;

     if pMaxDoza > 0 then
      pFK_PEPLID := asu.get_peplid(pFK_PACID);

      OPEN cCurrentDoza(pFK_PEPLID);
      FETCH cCurrentDoza INTO pCurrentDoza;
      CLOSE cCurrentDoza;

      OPEN cSmidDoza;
      FETCH cSmidDoza INTO pSmidDoza;
      CLOSE cSmidDoza;

      if pSmidDoza > 0 then
       pRes := pMaxDoza - pCurrentDoza - pSmidDoza;
      else
       pRes := 1;
      end if;
     else
      pRes := 1;
     end if;
   else
    --Если не рентген - можно ставить
    pRes := 1;
   end if;
  end if;

  return pRes;
END;
/

SHOW ERRORS;


