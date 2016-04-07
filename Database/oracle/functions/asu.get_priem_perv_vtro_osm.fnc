DROP FUNCTION ASU.GET_PRIEM_PERV_VTRO_OSM
/

--
-- GET_PRIEM_PERV_VTRO_OSM  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE FUNCTION ASU.GET_PRIEM_PERV_VTRO_OSM(pFK_NAZID in number)
  return number is

  pFK_ID number;
  /*pFK_TALON_EXISTS number := -1;


  cursor C_EXISTS_TALON is
    select  NVL(MAX(TAMBTALON_NAZ.FK_TALONID),-1)
              from ASU.VNAZ, ASU.TAMBTALON_NAZ
             where VNAZ.FK_ID = pFK_NAZID
               and TAMBTALON_NAZ.FK_NAZID = VNAZ.FK_ID;

  cursor C_EXISTS is
    select FK_SMID
      from TIB
     where FK_PACID = pFK_NAZID
       and FK_SMEDITID = get_synid('VID_OSMOTR');

  cursor C_NOT_EXISTS is
    select

      DECODE(count(1), 0,ASU.GET_VID_OSMOTR_PERVICH,ASU.GET_VID_OSMOTR_VTORICH)

      from ASU.VNAZ,
           ASU.TAMBTALON_NAZ,
           (select VNAZ.FK_ID, TAMBTALON_NAZ.FK_TALONID,VNAZ.FK_SMID
              from ASU.VNAZ, ASU.TAMBTALON_NAZ
             where VNAZ.FK_ID = pFK_NAZID
               and TAMBTALON_NAZ.FK_NAZID = VNAZ.FK_ID) TCURRENT_NAZ
     where
      TAMBTALON_NAZ.FK_TALONID = TCURRENT_NAZ.FK_TALONID
      and
      TAMBTALON_NAZ.FK_NAZID = VNAZ.FK_ID
      and
      VNAZ.FK_SMID = TCURRENT_NAZ.FK_SMID
      and
      VNAZ.FK_NAZSOSID = ASU.Get_Vipnaz;*/
begin
 pFK_ID := -1;

 /*OPEN C_EXISTS;
 FETCH C_EXISTS into pFK_ID;
 CLOSE C_EXISTS;

 if pFK_ID < 0 then

   OPEN C_EXISTS_TALON;
   FETCH C_EXISTS_TALON into pFK_TALON_EXISTS;
   CLOSE C_EXISTS_TALON;

   if  pFK_TALON_EXISTS > 0 then
     OPEN C_NOT_EXISTS;
     FETCH C_NOT_EXISTS into pFK_ID;
     CLOSE C_NOT_EXISTS;
   end if;

  if pFK_TALON_EXISTS < 0 then
   pFK_ID := -1;
  end if;

 end if;*/

 return pFK_ID;

end;
/

SHOW ERRORS;


