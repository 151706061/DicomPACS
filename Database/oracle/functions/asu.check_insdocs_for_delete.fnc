DROP FUNCTION ASU.CHECK_INSDOCS_FOR_DELETE
/

--
-- CHECK_INSDOCS_FOR_DELETE  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   WM_CONCAT (Synonym)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   WM_CONCAT (Function)
--   TPAC_INSURANCE (Table)
--   TAMBTALON (Table)
--   TAMBTALON_NAZ (Table)
--   TINSURDOCS (Table)
--   TKARTA (Table)
--   VNAZ (Table)
--
CREATE OR REPLACE FUNCTION ASU.CHECK_INSDOCS_FOR_DELETE(pFK_ID IN NUMBER)
  RETURN  varchar2 IS

  res varchar2(4000);
  CURSOR cTemp IS
  Select WM_CONCAT(FC_NAME) as FC_NAME
   from (select ROWNUM as RN,
               TINSURDOCS.FK_ID,
               ' ' || VNAZ.FC_NAME || '(' || TO_CHAR(FD_RUN, 'DD.MM.YYYY') || ')' as FC_NAME
          from asu.Tinsurdocs, ASU.TAmbtalon, asu.TAmbtalon_naz, asu.VNAZ
         where VNAZ.FK_ID = TAMBTALON_NAZ.FK_NAZID
           and TAMBTALON_NAZ.FK_TALONID = TAMBTALON.FK_ID
           and TAMBTALON.Fk_Insuranceid = TINSURDOCS.FK_ID
           and VNAZ.FK_NAZSOSID = 1
           and TINSURDOCS.FK_ID = pFK_ID
         union all
        select ROWNUM as RN,
               TINSURDOCS.FK_ID,
               ' ' || VNAZ.FC_NAME || '(' || TO_CHAR(FD_RUN, 'DD.MM.YYYY') || ')' as FC_NAME
          from asu.Tinsurdocs, ASU.TKarta, asu.tpac_insurance, asu.VNAZ
         where VNAZ.FK_PACID = TKARTA.FK_ID
           and Tpac_Insurance.Fk_Pacid = TKARTA.FK_ID
           and Tpac_Insurance.Fk_Insurdocid = TINSURDOCS.FK_ID
           and VNAZ.FK_NAZSOSID = 1
           and TINSURDOCS.FK_ID = pFK_ID
       ) T
 where RN < 20 --Первые 20 назначений выводим. Если их много, чтобы не был достигнут предел 4 000 символов.
 GROUP BY FK_ID;
BEGIN
  res := 'NONE';

  OPEN cTemp;
  FETCH cTemp INTO res;
  CLOSE cTemp;

  if length(res) > 128 then
    res := SUBSTR(res,1,128)||' ...';
  end if;

  RETURN res;
END;
/

SHOW ERRORS;


