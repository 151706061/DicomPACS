DROP PROCEDURE ASU.DO_INS_TO_SCREENENG_J
/

--
-- DO_INS_TO_SCREENENG_J  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TDIAG (Table)
--   GET_LABVIP (Function)
--   GET_VIPNAZ (Function)
--   PKG_STATUTIL (Package)
--   TSCREENING_JOURNAL (Table)
--   TSCREENING_SDIAG (Table)
--   VNAZ (Table)
--
CREATE OR REPLACE PROCEDURE ASU.DO_INS_TO_SCREENENG_J (pFD_DBEGIN DATE DEFAULT NULL,
                                                       pFD_DEND DATE DEFAULT NULL) IS
  CURSOR get_Naz(pD_Begin DATE, pD_End DATE)
  IS
         SELECT v.FD_RUN, v.FK_ID, v.FK_PACID
         FROM ASU.VNAZ v INNER JOIN ASU.TDIAG dg
         ON v.FK_ID = dg.FK_NAZID
         WHERE v.FD_RUN BETWEEN pD_Begin AND pD_End AND (v.FK_NAZSOSID = ASU.GET_VIPNAZ OR v.FK_NAZSOSID = ASU.GET_LABVIP)
         AND dg.FL_MAIN = STAT.PKG_STATUTIL.GET_SMIDID('MAIN')
         AND EXISTS(SELECT 1 FROM ASU.TSCREENING_SDIAG tsd WHERE tsd.FL_GKT = 1 AND tsd.fk_diagsmid = dg.FK_SMDIAGID)
         ORDER BY v.FK_PACID, v.FD_RUN;

  v_GetNaz       get_Naz%ROWTYPE;
  v_Count        NUMBER;
  vFD_DEND       DATE;
  vFD_DBEGIN     DATE;
BEGIN
  IF (pFD_DBEGIN IS NULL) OR (pFD_DEND IS NULL)
  THEN
     BEGIN
       vFD_DEND := SYSDATE;
       vFD_DBEGIN := ADD_MONTHS(SYSDATE, -1);
     END;
  END IF;

  IF (pFD_DBEGIN IS NULL) OR (pFD_DEND IS NULL)
  THEN OPEN get_Naz(vFD_DBEGIN, vFD_DEND);
  ELSE OPEN get_Naz(pFD_DBEGIN, pFD_DEND);
  END IF;

  LOOP

    EXIT WHEN get_Naz%NOTFOUND;

    FETCH get_Naz INTO v_GetNaz;

    SELECT COUNT(*) INTO v_Count FROM ASU.TSCREENING_JOURNAL
    WHERE FK_PACID = v_GetNaz.FK_PACID AND FD_DBEGIN <= v_GetNaz.FD_RUN AND COALESCE(FD_DEND, SYSDATE) >= v_GetNaz.FD_RUN;

    IF v_Count < 1 AND v_GetNaz.FK_PACID IS NOT NULL
    THEN
      BEGIN
        INSERT INTO ASU.TSCREENING_JOURNAL(FD_DBEGIN, FK_PACID, FK_NAZID)
        VALUES(v_GetNaz.FD_RUN, v_GetNaz.FK_PACID, v_GetNaz.FK_ID);
      END;
    END IF;

  END LOOP; --get_Naz

  CLOSE get_Naz;

  --commit;

EXCEPTION   -- здесь начинаются обработчики исключений
            WHEN OTHERS THEN
            -- обрабатывает все прочие ошибки
            ROLLBACK;
END;
/

SHOW ERRORS;


