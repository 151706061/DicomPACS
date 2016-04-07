DROP FUNCTION ASU.GET_LAST_FLUORO_NUM
/

--
-- GET_LAST_FLUORO_NUM  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TNAZID_DOOBSL (Table)
--   TNAZIS (Table)
--   TIB (Table)
--   TAMBULANCE (Table)
--   TSMID (Table)
--   GET_PASS_REGISTRATOR (Function)
--   GET_VIPNAZ (Function)
--   GET_XRAY_FLU (Function)
--   TKARTA (Table)
--
CREATE OR REPLACE FUNCTION ASU.get_last_fluoro_num(PFK_PEPLID IN NUMBER)
RETURN VARCHAR2 IS
sRes VARCHAR2(1000);

CURSOR cNotDef IS SELECT (DECODE((SELECT MAX(FC_CHAR)
                                    FROM ASU.TIB
                                   WHERE FK_PACID = TNAZIS.FK_ID AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = 'XRAY_FLU_NUMBER')),
                          NULL,
                          (SUBSTR(decode(FC_REMARK, 'Установлена последняя ФГ', '', fc_remark), 21, (length(FC_REMARK)+1)-21)),
                          (SELECT MAX(FC_CHAR)
                             FROM ASU.TIB
                            WHERE FK_PACID = TNAZIS.FK_ID AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = 'XRAY_FLU_NUMBER'))))
              FROM asu.TNAZIS
             WHERE fk_smid in (select fk_id
                                 from asu.tsmid
                                where fl_showanal = 1
                               start with fk_id = asu.get_xray_flu
                               connect by prior fk_id = fk_owner)
               AND TNAZIS.FK_PACID IN (SELECT FK_ID FROM asu.TAMBULANCE WHERE FK_PEPLID = PFK_PEPLID
                                        UNION
                                       SELECT FK_ID FROM asu.TKARTA WHERE FK_PEPLID = PFK_PEPLID)
               AND (TNAZIS.FK_NAZSOSID = asu.GET_VIPNAZ OR TNAZIS.FK_NAZSOSID = asu.GET_PASS_REGISTRATOR)
               AND not exists (select fk_nazid from asu.tnazid_doobsl where fk_nazid = tnazis.fk_id)
            ORDER BY FD_RUN DESC;

BEGIN
  OPEN cNotDef;
  FETCH cNotDef INTO sRes;
  CLOSE cNotDef;

    RETURN sRes ;
END; --Created: Prihodko N. 28.12.2010 Comments: Возвращает : номер последней ФГ
/

SHOW ERRORS;


