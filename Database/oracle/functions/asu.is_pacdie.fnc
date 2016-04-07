DROP FUNCTION ASU.IS_PACDIE
/

--
-- IS_PACDIE  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSROKY (Table)
--   TIB (Table)
--   TSMID (Table)
--   PKG_STATUTIL (Package)
--   TEPIKRIZ (Table)
--
CREATE OR REPLACE FUNCTION ASU."IS_PACDIE" (ppacid IN NUMBER) RETURN NUMBER IS

BEGIN
  FOR C IN (SELECT FC_SYNONIM
              FROM asu.tib, ASU.TSMID SM
             WHERE fk_pacid = pPacID
               AND fk_smeditid = STAT.pkg_statutil.GET_SMIDID('RESULT_LECH')
               AND FK_SMID = SM.FK_ID)
  LOOP
    IF C.FC_SYNONIM = 'RESLECH_UMER'
    THEN
      RETURN 1;
    ELSE
      RETURN 0;
    END IF;
  END LOOP;

  FOR C IN (SELECT TSMID.FC_SYNONIM
              FROM asu.tepikriz,
                   ASU.TSMID,
                   (SELECT FK_ID
                      FROM ASU.TSMID
                     WHERE FC_SYNONIM IN ('EPIK_POSMERT', 'EPIK_VYPISNOY')) SM
             WHERE fk_pacid = pPacid
               AND fp_type = SM.FK_ID
               AND TSMID.FK_ID = fp_reslech)
  LOOP
    IF C.FC_SYNONIM = 'RESLECH_UMER'
    THEN
      RETURN 1;
    ELSE
      RETURN 0;
    END IF;
  END LOOP;

  FOR C IN (SELECT tsroky.fk_id
              FROM asu.tsroky,
                   (SELECT fk_id
                      FROM tsmid
                     WHERE fc_synonim IN
                           ('OD_DIE', 'DIE_BEREM_DO28', 'DIE_BERPOSL28',
                            'DIE_ROZHEN', 'DIE_RODIL')) sm
             WHERE fk_pacid = ppacid
               AND fk_pryb IN (3, 7)
               AND fk_vybid = sm.fk_id)
  LOOP
    RETURN 1;
  END LOOP;
  RETURN 0;
END is_pacdie;
/

SHOW ERRORS;


