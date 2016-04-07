DROP PROCEDURE ASU.IS_TALON_HAS_OUT_PERION_NAZ
/

--
-- IS_TALON_HAS_OUT_PERION_NAZ  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   STRING_AGG (Function)
--   TAMBTALON (Table)
--   TAMBTALON_NAZ (Table)
--   TSMID (Table)
--   GET_DEF_FUNCT (Function)
--   GET_DIETID (Function)
--   GET_LECHENIE_ID (Function)
--   GET_PEJIMID (Function)
--   GET_VIPNAZ (Function)
--   VNAZ (Table)
--
CREATE OR REPLACE PROCEDURE ASU.IS_TALON_HAS_OUT_PERION_NAZ(pFK_TALONID IN NUMBER,
                                                       pFD_DATE    in date,
                                                       pNazs out varchar2,
                                                       pRes out number)
   IS



  cursor c is
   select
       count(1), string_agg(TSMID.FC_NAME||' '||TO_CHAR(VNAZ.FD_RUN,'DD.MM.YYYY HH24:mi:ss'))
  from ASu.TAMBTALON_NAZ, ASU.VNAZ, ASU.TAMBTALON, asu.TSMID
 where TAMBTALON.FK_ID = TAMBTALON_NAZ.FK_TALONID
   and VNAZ.FK_SMID = TSMID.FK_ID
   and TAMBTALON_NAZ.FK_NAZID = VNAZ.FK_ID
   and VNAZ.FD_RUN not between TAMBTALON.FD_OPENED and
       pFD_DATE + 0.99999
   and TAMBTALON.FK_ID = pFK_TALONID
   and VNAZ.FK_NAZSOSID = ASU.GET_VIPNAZ;

   cursor d is
   select
       count(1), string_agg(TSMID.FC_NAME||' '||TO_CHAR(VNAZ.FD_RUN,'DD.MM.YYYY HH24:mi:ss'))
  from ASu.TAMBTALON_NAZ, ASU.VNAZ, ASU.TAMBTALON, asu.TSMID
 where TAMBTALON.FK_ID = TAMBTALON_NAZ.FK_TALONID
   and VNAZ.FK_SMID = TSMID.FK_ID
   and TAMBTALON_NAZ.FK_NAZID = VNAZ.FK_ID
   and VNAZ.FD_RUN not between TAMBTALON.FD_OPENED and
       pFD_DATE + 0.99999
   and TAMBTALON.FK_ID = pFK_TALONID
   and VNAZ.FK_NAZSOSID = ASU.GET_VIPNAZ
   AND TSMID.FK_ID <> ASU.GET_LECHENIE_ID
   AND TSMID.FK_ID <> ASU.GET_DIETID
   AND TSMID.FK_ID <> ASU.GET_PEJIMID
   AND TSMID.FC_SYNONIM <> 'RECOMENDACII';

  n NUMBER;

BEGIN
  n := 0;

  SELECT ASU.GET_DEF_FUNCT('AMBTALON_NOT_REC_LECH_DIET',0) INTO n FROM DUAL;

  IF n = 1
  THEN
     OPEN d;
     FETCH d INTO pRes,pNazs;
     CLOSE d;
  ELSE
     OPEN C;
     FETCH C INTO pRes,pNazs;
     CLOSE C;
  END IF;
END;
/

SHOW ERRORS;


