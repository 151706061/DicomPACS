DROP PACKAGE BODY ASU.MEDSTAT
/

--
-- MEDSTAT  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."MEDSTAT" 
IS
/*-------------------------------------------------------------------------------------------*\
|               Variables
\*-------------------------------------------------------------------------------------------*/
  sResultTable   VARCHAR2(100);
/*-------------------------------------------------------------------------------------------*\
|               Cursors
\*-------------------------------------------------------------------------------------------*/
  CURSOR cdiags
  IS
    SELECT fk_id,
           fc_name,   -- поля для совместимости с типом курсора cGroupDiag
           LPAD (' ', 5000) AS fc_fieldname,
           LEVEL AS fn_level
      FROM (SELECT fk_id, fc_name, 1 AS prizn
              FROM tsmid
             WHERE fk_owner = get_diagid
               AND fk_id <> get_synid ('DIAG_ANY')
            UNION
                 SELECT fk_id, 'Прочие заболевания', 2 AS prizn
                   FROM tsmid
                  WHERE fk_id = get_synid ('DIAG_ANY'))
     ORDER BY prizn, fc_name;
  CURSOR cGroupDiag
  IS
    SELECT fk_id,
           DECODE (LEVEL, 1, fc_name, LPAD (' ', LEVEL * 3) || 'в т.ч. ' || fc_name) AS fc_name,
           LPAD (' ', 5000) AS fc_fieldname,
           LEVEL AS fn_level,
           fk_id AS fn_total,
           fk_mkb10
      FROM tsmid
     WHERE fk_id <> get_alldiagid
     START WITH fk_owner = get_groupdiagid
     CONNECT BY PRIOR fk_id = fk_owner;
  CURSOR cNaz (nStartOwner IN NUMBER)
  IS
    SELECT fk_id,
           REPLACE (get_fullpath (fk_id), ':', '|') AS fc_name,
           LPAD (' ', 5000) AS fc_caption,
           LPAD (' ', 5000) AS fc_fieldname,
           fk_id AS fn_total
      FROM tsmid
     WHERE is_it_naz (fk_id) = 1
     START WITH fk_owner = nStartOwner
     CONNECT BY PRIOR fk_id = fk_owner
     ORDER BY fc_name;
  CURSOR cNazView (nStartOwner IN NUMBER)
  IS
    SELECT fk_id,
           DECODE (LEVEL, 1, fc_name, LPAD (' ', LEVEL * 3) || 'в т.ч. ' || fc_name) AS fc_name,
           fk_id AS fn_total,
           LEVEL AS fn_level
      FROM tsmid
     WHERE fl_showanal = 1
     START WITH fk_id = nStartOwner
     CONNECT BY PRIOR fk_id = fk_owner;
  CURSOR cSMIDName (pFK_SMID IN NUMBER)
  IS
    SELECT fc_name
      FROM tsmid
     WHERE fk_id = pFK_SMID;
/*-------------------------------------------------------------------------------------------*\
|               TYPES
\*-------------------------------------------------------------------------------------------*/
  TYPE TDiags IS TABLE OF cDiags%ROWTYPE
    INDEX BY BINARY_INTEGER;
  TYPE TGroupDiag IS TABLE OF cGroupDiag%ROWTYPE
    INDEX BY BINARY_INTEGER;
  TYPE TNaz IS TABLE OF cnaz%ROWTYPE
    INDEX BY BINARY_INTEGER;
  TYPE TNazView IS TABLE OF cnazview%ROWTYPE
    INDEX BY BINARY_INTEGER;
/*-------------------------------------------------------------------------------------------*\
|               F U N C T I O N S
\*-------------------------------------------------------------------------------------------*/
/*-------------------------------------------------------------------------------------------*\
|               get_temptable
\*-------------------------------------------------------------------------------------------*/
  FUNCTION get_temptablename
    RETURN VARCHAR2
  IS
  BEGIN
    RETURN 'medstat' || TO_CHAR (SYSDATE, 'ddmmyyyyhh24miss');
  END;
/*-------------------------------------------------------------------------------------------*\
|               GetResultTable
\*-------------------------------------------------------------------------------------------*/
  FUNCTION GetResultTable
    RETURN VARCHAR2
  IS
  BEGIN
    RETURN sResultTable;
  END;
/*-------------------------------------------------------------------------------------------*\
|               SetResultTable
\*-------------------------------------------------------------------------------------------*/
  PROCEDURE SetResultTable (sValue IN VARCHAR2)
  IS
  BEGIN
    sResultTable := sValue;
  END;
/*-------------------------------------------------------------------------------------------*\
|               countnaz
\*-------------------------------------------------------------------------------------------*/
  --сколько раз врач назначал это назанчение за период(подбивка снизу)
  FUNCTION countNaz (NazSMID IN NUMBER, d1 IN DATE, d2 IN DATE, nVrachID IN NUMBER, pSex IN NUMBER)
    RETURN NUMBER
  IS
    CURSOR c0Vrach (pnaz IN NUMBER, pVrach IN NUMBER, pd1 IN DATE, pd2 IN DATE, pSex IN NUMBER)
    IS
      SELECT COUNT (tdiag.fk_id) AS fn_count
        FROM tdiag,
             vnaz,
             (SELECT fk_id
                FROM tsmid
               WHERE fk_default IN (SELECT fk_id
                                      FROM tsmid
                                     START WITH fk_id = get_groupdiagid
                                     CONNECT BY PRIOR fk_id = fk_owner)) qDiags,
             (SELECT fk_id
                FROM tsmid
               START WITH fk_id = pNaz
               CONNECT BY PRIOR fk_id = fk_owner) qNaz,
       (SELECT tk.fk_id
          FROM tkarta tk, TSROKY
         WHERE TSROKY.FK_ID = (SELECT MAX (FK_ID) FK_MAXID
                                 FROM TSROKY
                                WHERE FK_PACID = tk.fk_id
                                  AND FK_PRYB IN (2, 4, 6, 5))
         AND fd_data3 BETWEEN pd1 AND pd2
           AND fp_sex <= pSex) tkarta
       WHERE tdiag.fk_smdiagid = qDiags.fk_id
         AND tdiag.fk_pacid = vnaz.fk_pacid
         AND tdiag.fk_vrachid = pVrach
         and vnaz.fk_vrachid = pVrach
         AND tdiag.fl_main = 1
         AND fp_type = 2
         AND vnaz.fk_smid = qNaz.fk_id
         AND tkarta.fk_id = tdiag.fk_pacid;
    CURSOR c0Otd (pnaz IN NUMBER, pOtd IN NUMBER, pd1 IN DATE, pd2 IN DATE, pSex IN NUMBER)
    IS
      SELECT COUNT (tdiag.fk_id) AS fn_count
        FROM tdiag,
             vnaz,
             (SELECT fk_id
                FROM tsmid
               WHERE fk_default IN (SELECT fk_id
                                      FROM tsmid
                                     START WITH fk_id = get_groupdiagid
                                     CONNECT BY PRIOR fk_id = fk_owner)) qDiags,
             (SELECT fk_id
                FROM tsmid
               START WITH fk_id = pNaz
               CONNECT BY PRIOR fk_id = fk_owner) qNaz,
       (SELECT tk.fk_id
          FROM tkarta tk, TSROKY
         WHERE TSROKY.FK_ID = (SELECT MAX (FK_ID) FK_MAXID
                                 FROM TSROKY
                                WHERE FK_PACID = tk.fk_id
                                  AND FK_PRYB IN (2, 4, 6, 5))
         AND fd_data3 BETWEEN pd1 AND pd2
           AND fp_sex <= pSex) tkarta                              ,
             (SELECT fk_id
                FROM tsotr
               WHERE get_vrachotd (fk_id) = pOtd) qVrachOTD
       WHERE tdiag.fk_smdiagid = qDiags.fk_id
         AND tdiag.fk_pacid = vnaz.fk_pacid
         AND tdiag.fk_vrachid = qVrachOTD.FK_ID
         and vnaz.fk_vrachid = qVrachOTD.FK_ID
         AND tdiag.fl_main = 1
         AND fp_type = 2
         AND vnaz.fk_smid = qNaz.fk_id
         AND tkarta.fk_id = tdiag.fk_pacid
         AND qVrachOTD.fk_id = tdiag.fk_vrachid;
    CURSOR c0San (pnaz IN NUMBER, pd1 IN DATE, pd2 IN DATE, pSex IN NUMBER)
    IS
      SELECT COUNT (tdiag.fk_id) AS fn_count
        FROM tdiag,
             vnaz,
             (SELECT fk_id
                FROM tsmid
               WHERE fk_default IN (SELECT fk_id
                                      FROM tsmid
                                     START WITH fk_id = get_groupdiagid
                                     CONNECT BY PRIOR fk_id = fk_owner)) qDiags,
             (SELECT fk_id
                FROM tsmid
               START WITH fk_id = pNaz
               CONNECT BY PRIOR fk_id = fk_owner) qNaz,
       (SELECT tk.fk_id
          FROM tkarta tk, TSROKY
         WHERE TSROKY.FK_ID = (SELECT MAX (FK_ID) FK_MAXID
                                 FROM TSROKY
                                WHERE FK_PACID = tk.fk_id
                                  AND FK_PRYB IN (2, 4, 6, 5))
         AND fd_data3 BETWEEN pd1 AND pd2
           AND fp_sex <= pSex) tkarta
       WHERE tdiag.fk_smdiagid = qDiags.fk_id
         AND tdiag.fk_pacid = vnaz.fk_pacid
         AND tdiag.fl_main = 1
         AND fp_type = 2
         AND vnaz.fk_smid = qNaz.fk_id
         AND tkarta.fk_id = tdiag.fk_pacid;
  BEGIN
    IF nVrachID > 0 THEN
      FOR i IN c0Vrach (NazSMID, nVrachID, d1, d2, pSex)
      LOOP
        RETURN i.fn_count;
      END LOOP;
    ELSIF nVrachID < 0 THEN
      FOR i IN c0Otd (NazSMID, -nVrachID, d1, d2, pSex)
      LOOP
        RETURN i.fn_count;
      END LOOP;
    ELSIF nVrachID = 0 THEN
      FOR i IN c0San (NazSMID, d1, d2, pSex)
      LOOP
        RETURN i.fn_count;
      END LOOP;
    END IF;
  END countNaz;
/*-------------------------------------------------------------------------------------------*\
|               countNazTotal
\*-------------------------------------------------------------------------------------------*/
  --сколько раз врач назначал это назанчение за период(подбивка снизу)
  FUNCTION countNazTotal (
    NazSMID    IN   NUMBER,
    d1         IN   DATE,
    d2         IN   DATE,
    nVrachID   IN   NUMBER,
    pSex       IN   NUMBER,
    pPokaz     IN   NUMBER DEFAULT 0
    )
    --nVrachID : <0 код отделения, >0 код врача, =0 по всему санаторию
    --pSex : 0: по женщинам, 1: по всем
    --pPokaz:  1 : по пртивопоказанным, 0 : по всем
    RETURN NUMBER
  IS
    CURSOR c0Vrach (pnaz IN NUMBER, pVrach IN NUMBER, pd1 IN DATE, pd2 IN DATE, pSex IN NUMBER, pPokaz IN NUMBER)
    IS
      SELECT  COUNT (vnaz.fk_id) AS fn_count
        FROM vnaz, (SELECT fk_id
                      FROM tsmid
                     START WITH fk_id = pNaz
                     CONNECT BY PRIOR fk_id = fk_owner) qNaz, (SELECT tk.fk_id
                                                                 FROM tkarta tk, TSROKY
                                                                WHERE TSROKY.FK_ID = (SELECT MAX (FK_ID) FK_MAXID
                                                                                        FROM TSROKY
                                                                                       WHERE FK_PACID = tk.fk_id
                                                                                         AND FK_PRYB IN (2, 4, 6, 5))
                                                                  AND fp_sex <= pSex
                                                                  AND fl_pokaz >= pPokaz) tkarta
       WHERE vnaz.fk_smid = qNaz.fk_id
         AND tkarta.fk_id = vnaz.fk_pacid
         and vnaz.fk_vrachid=pVrach;
    CURSOR c0Otd (pnaz IN NUMBER, pOtd IN NUMBER, pd1 IN DATE, pd2 IN DATE, pSex IN NUMBER, pPokaz IN NUMBER)
    IS
      SELECT COUNT (vnaz.fk_id) AS fn_count
        FROM vnaz,
             (SELECT fk_id
                FROM tsmid
               START WITH fk_id = pNaz
               CONNECT BY PRIOR fk_id = fk_owner) qNaz,
             (SELECT fk_id
                FROM tsotr
               WHERE get_vrachotd (fk_id) = pOtd) qVrachOTD,
             (SELECT tk.fk_id
                FROM tkarta tk, TSROKY
               WHERE TSROKY.FK_ID = (SELECT MAX (FK_ID) FK_MAXID
                                       FROM TSROKY
                                      WHERE FK_PACID = tk.fk_id
                                        AND FK_PRYB IN (2, 4, 6, 5))
                 AND fp_sex <= pSex
                 AND fl_pokaz >= pPokaz) tkarta
       WHERE vnaz.fk_smid = qNaz.fk_id
         AND qVrachOTD.fk_id = vnaz.fk_vrachid
         AND tkarta.fk_id = vnaz.fk_pacid;
    CURSOR c0San (pnaz IN NUMBER, pd1 IN DATE, pd2 IN DATE, pSex IN NUMBER, pPokaz IN NUMBER)
    IS
      SELECT COUNT (vnaz.fk_id) AS fn_count
        FROM vnaz, (SELECT fk_id
                      FROM tsmid
                     START WITH fk_id = pNaz
                     CONNECT BY PRIOR fk_id = fk_owner) qNaz, (SELECT tk.fk_id
                                                                 FROM tkarta tk, TSROKY
                                                                WHERE TSROKY.FK_ID = (SELECT MAX (FK_ID) FK_MAXID
                                                                                        FROM TSROKY
                                                                                       WHERE FK_PACID = tk.fk_id
                                                                                         AND FK_PRYB IN (2, 4, 6, 5))
                                                                  AND fp_sex <= pSex
                                                                  AND fl_pokaz >= pPokaz) tkarta
       WHERE vnaz.fk_smid = qNaz.fk_id
         AND tkarta.fk_id = vnaz.fk_pacid;
  BEGIN
    IF nVrachID > 0 THEN
      FOR i IN c0Vrach (NazSMID, nVrachID, d1, d2, pSex, pPokaz)
      LOOP
        RETURN i.fn_count;
      END LOOP;
    ELSIF nVrachID < 0 THEN
      FOR i IN c0Otd (NazSMID, -nVrachID, d1, d2, pSex, pPokaz)
      LOOP
        RETURN i.fn_count;
      END LOOP;
    ELSIF nVrachID = 0 THEN
      FOR i IN c0San (NazSMID, d1, d2, pSex, pPokaz)
      LOOP
        RETURN i.fn_count;
      END LOOP;
    END IF;
  END countNaztotal;
/*-------------------------------------------------------------------------------------------*\
|               countDiag
\*-------------------------------------------------------------------------------------------*/
  --сколько диагнозов поставил врач за период(подбивка справа)
  FUNCTION countDiag (DiagSMID IN NUMBER, pDetail IN NUMBER, d1 IN DATE, d2 IN DATE, nVrachID IN NUMBER, pSex IN NUMBER)
    RETURN NUMBER
  --если DiagSMID < 0 то считаем всего всех диагнозов
  IS
    --по группам
    CURSOR c0Vrach (pDiag IN NUMBER, pVrach IN NUMBER, pd1 IN DATE, pd2 IN DATE, pSex IN NUMBER)
    IS
      SELECT COUNT (tdiag.fk_id) AS fn_count
        FROM tdiag,   /*vnaz, */tkarta, (SELECT fk_id
                                           FROM tsmid
                                          WHERE fk_default IN (SELECT fk_id
                                                                 FROM tsmid
                                                                START WITH fk_id = pDiag
                                                                CONNECT BY PRIOR fk_id = fk_owner)) qDiags
       WHERE tdiag.fk_smdiagid = qDiags.fk_id
         AND tdiag.fk_vrachid = pVrach
         AND tdiag.fl_main = 1
         AND fp_type = 2
/*         AND vnaz.fk_pacid = tdiag.fk_pacid*/
         AND fd_date BETWEEN pd1 AND pd2
         AND tkarta.fk_id = tdiag.fk_pacid
         AND tkarta.fp_sex <= pSex;
    CURSOR c0Otd (pDiag IN NUMBER, pOtd IN NUMBER, pd1 IN DATE, pd2 IN DATE, pSex IN NUMBER)
    IS
      SELECT COUNT (tdiag.fk_id) AS fn_count
        FROM tdiag,   /*             vnaz,*/
             tkarta,
             (SELECT fk_id
                FROM tsmid
               WHERE fk_default IN (SELECT fk_id
                                      FROM tsmid
                                     START WITH fk_id = pDiag
                                     CONNECT BY PRIOR fk_id = fk_owner)) qDiags,
             (SELECT fk_id
                FROM tsotr
               WHERE get_vrachotd (fk_id) = pOtd) qVrachOTD
       WHERE tdiag.fk_smdiagid = qDiags.fk_id
         AND tdiag.fl_main = 1
         AND fp_type = 2
/*         AND vnaz.fk_pacid = tdiag.fk_pacid*/
         AND fd_date BETWEEN pd1 AND pd2
         AND tkarta.fk_id = tdiag.fk_pacid
         AND tkarta.fp_sex <= pSex
         AND qVrachOTD.fk_id = tdiag.fk_vrachid;
    CURSOR c0San (pDiag IN NUMBER, pd1 IN DATE, pd2 IN DATE, pSex IN NUMBER)
    IS
      SELECT COUNT (tdiag.fk_id) AS fn_count
        FROM tdiag,   /*vnaz,*/tkarta, (SELECT fk_id
                                          FROM tsmid
                                         WHERE fk_default IN (SELECT fk_id
                                                                FROM tsmid
                                                               START WITH fk_id = pDiag
                                                               CONNECT BY PRIOR fk_id = fk_owner)) qDiags
       WHERE tdiag.fk_smdiagid = qDiags.fk_id
         AND tdiag.fl_main = 1
         AND fp_type = 2
/*         AND vnaz.fk_pacid = tdiag.fk_pacid*/
         AND fd_date BETWEEN pd1 AND pd2
         AND tkarta.fk_id = tdiag.fk_pacid
         AND tkarta.fp_sex <= pSex;
    --по всем диагнозам
    CURSOR c1Vrach (pDiag IN NUMBER, pVrach IN NUMBER, pd1 IN DATE, pd2 IN DATE, pSex IN NUMBER)
    IS
      SELECT COUNT (tdiag.fk_id) AS fn_count
        FROM tdiag,   /*vnaz, */tkarta
       WHERE tdiag.fk_smdiagid = pDiag
         AND tdiag.fk_vrachid = pVrach
         AND tdiag.fl_main = 1
         AND fp_type = 2
         AND fd_date BETWEEN pd1 AND pd2
/*         AND vnaz.fk_pacid = tdiag.fk_pacid*/
         AND tkarta.fk_id = tdiag.fk_pacid
         AND tkarta.fp_sex <= pSex;
    CURSOR c1Otd (pDiag IN NUMBER, pOtd IN NUMBER, pd1 IN DATE, pd2 IN DATE, pSex IN NUMBER)
    IS
      SELECT COUNT (tdiag.fk_id) AS fn_count
        FROM tdiag,   /*vnaz,*/tkarta, (SELECT fk_id
                                          FROM tsotr
                                         WHERE get_vrachotd (fk_id) = pOtd) qVrachOTD
       WHERE tdiag.fk_smdiagid = pDiag
         AND tdiag.fl_main = 1
         AND fp_type = 2
         AND fd_date BETWEEN pd1 AND pd2
/*         AND vnaz.fk_pacid = tdiag.fk_pacid*/
         AND tkarta.fk_id = tdiag.fk_pacid
         AND tkarta.fp_sex <= pSex
         AND qVrachOTD.fk_id = tdiag.fk_vrachid;
    CURSOR c1San (pDiag IN NUMBER, pd1 IN DATE, pd2 IN DATE, pSex IN NUMBER)
    IS
      SELECT COUNT (tdiag.fk_id) AS fn_count
        FROM tdiag,   /*vnaz, */tkarta
       WHERE tdiag.fk_smdiagid = pDiag
         AND tdiag.fl_main = 1
         AND fp_type = 2
         AND fd_date BETWEEN pd1 AND pd2
/*         AND vnaz.fk_pacid = tdiag.fk_pacid*/
         AND tkarta.fk_id = tdiag.fk_pacid
         AND tkarta.fp_sex <= pSex;
    --всего по группам
    CURSOR c3Vrach (pVrach IN NUMBER, pd1 IN DATE, pd2 IN DATE, pSex IN NUMBER)
    IS
      SELECT COUNT (tdiag.fk_id) AS fn_count
        FROM tdiag,   /*vnaz,*/tkarta, (SELECT fk_id
                                          FROM tsmid
                                         WHERE fk_default IN (SELECT fk_id
                                                                FROM tsmid
                                                               START WITH fk_owner = get_groupdiagid
                                                               CONNECT BY PRIOR fk_id = fk_owner)) qDiags
       WHERE tdiag.fk_smdiagid = qDiags.fk_id
         AND tdiag.fk_vrachid = pVrach
         AND tdiag.fl_main = 1
         AND fp_type = 2
--         AND vnaz.fk_pacid = tdiag.fk_pacid
         AND fd_date BETWEEN pd1 AND pd2
         AND tkarta.fk_id = tdiag.fk_pacid
         AND tkarta.fp_sex <= pSex;
    CURSOR c3Otd (pOtd IN NUMBER, pd1 IN DATE, pd2 IN DATE, pSex IN NUMBER)
    IS
      SELECT COUNT (tdiag.fk_id) AS fn_count
        FROM tdiag,   --             vnaz,
             tkarta,
             (SELECT fk_id
                FROM tsmid
               WHERE fk_default IN (SELECT fk_id
                                      FROM tsmid
                                     START WITH fk_owner = get_groupdiagid
                                     CONNECT BY PRIOR fk_id = fk_owner)) qDiags,
             (SELECT fk_id
                FROM tsotr
               WHERE get_vrachotd (fk_id) = pOtd) qVrachOTD
       WHERE tdiag.fk_smdiagid = qDiags.fk_id
         AND tdiag.fl_main = 1
         AND fp_type = 2
--         AND vnaz.fk_pacid = tdiag.fk_pacid
         AND fd_date BETWEEN pd1 AND pd2
         AND tkarta.fk_id = tdiag.fk_pacid
         AND tkarta.fp_sex <= pSex
         AND qVrachOTD.fk_id = tdiag.fk_vrachid;
    CURSOR c3San (pd1 IN DATE, pd2 IN DATE, pSex IN NUMBER)
    IS
      SELECT COUNT (tdiag.fk_id) AS fn_count
        FROM tdiag, tkarta, (SELECT fk_id
                               FROM tsmid
                              WHERE fk_default IN (SELECT fk_id
                                                     FROM tsmid
                                                    START WITH fk_owner = get_groupdiagid
                                                    CONNECT BY PRIOR fk_id = fk_owner)) qDiags
       WHERE tdiag.fk_smdiagid = qDiags.fk_id
         AND tdiag.fl_main = 1
         AND fp_type = 2
--         AND vnaz.fk_pacid = tdiag.fk_pacid
         AND fd_date BETWEEN pd1 AND pd2
         AND tkarta.fk_id = tdiag.fk_pacid
         AND tkarta.fp_sex <= pSex;
  BEGIN
    IF     pDetail = 0
       AND DiagSMID > 0 THEN
      IF nVrachID > 0 THEN
        FOR i IN c0Vrach (DiagSMID, nVrachID, d1, d2, pSex)
        LOOP
          RETURN i.fn_count;
        END LOOP;
      ELSIF nVrachID = 0 THEN
        FOR i IN c0San (DiagSMID, d1, d2, pSex)
        LOOP
          RETURN i.fn_count;
        END LOOP;
      ELSIF nVrachID < 0 THEN
        FOR i IN c0Otd (DiagSMID, -nVrachID, d1, d2, pSex)
        LOOP
          RETURN i.fn_count;
        END LOOP;
      END IF;
    ELSIF     pDetail = 1
          AND DiagSMID > 0 THEN
      IF nVrachID > 0 THEN
        FOR i IN c1Vrach (DiagSMID, nVrachID, d1, d2, pSex)
        LOOP
          RETURN i.fn_count;
        END LOOP;
      ELSIF nVrachID = 0 THEN
        FOR i IN c1San (DiagSMID, d1, d2, pSex)
        LOOP
          RETURN i.fn_count;
        END LOOP;
      ELSIF nVrachID < 0 THEN
        FOR i IN c1Otd (DiagSMID, -nVrachID, d1, d2, pSex)
        LOOP
          RETURN i.fn_count;
        END LOOP;
      END IF;
    END IF;
    --всего
    IF     pDetail = 0
       AND DiagSMID < 0 THEN
      IF nVrachID > 0 THEN
        FOR i IN c3Vrach (nVrachID, d1, d2, pSex)
        LOOP
          RETURN i.fn_count;
        END LOOP;
      ELSIF nVrachID = 0 THEN
        FOR i IN c3San (d1, d2, pSex)
        LOOP
          RETURN i.fn_count;
        END LOOP;
      ELSIF nVrachID < 0 THEN
        FOR i IN c3Otd (-nVrachID, d1, d2, pSex)
        LOOP
          RETURN i.fn_count;
        END LOOP;
      END IF;
    ELSIF     pDetail = 1
          AND DiagSMID < 0 THEN
      raise_application_error (-20003, 'Пока сборка по диагнозам не написана');
    END IF;
  END countDiag;
/*-------------------------------------------------------------------------------------------*\
|               CountNazPerDiag
\*-------------------------------------------------------------------------------------------*/
  -- сколько дигнозов было поставлено при посталении этого назначения(каждая клетка)
  FUNCTION CountNazPerDiag (
    NazSMID    IN   NUMBER,
    DiagSMID   IN   NUMBER,
    pDetail    IN   NUMBER,
    d1         IN   DATE,
    d2         IN   DATE,
    nVrachID   IN   NUMBER,
    pSex       IN   NUMBER
    )
    RETURN NUMBER
  IS
    --по группам
    CURSOR c0Vrach (pNaz IN NUMBER, pDiag IN NUMBER, pVrach IN NUMBER, pd1 IN DATE, pd2 IN DATE, pSex IN NUMBER)
    IS
      SELECT COUNT (tdiag.fk_id) AS fn_count
        FROM tdiag, vnaz, tkarta, (SELECT fk_id
                                     FROM tsmid
                                    WHERE fk_default IN (SELECT fk_id
                                                           FROM tsmid
                                                          START WITH fk_id = pDiag
                                                          CONNECT BY PRIOR fk_id = fk_owner)) qDiags
       WHERE tdiag.fk_smdiagid = qDiags.fk_id
         AND tdiag.fk_pacid = vnaz.fk_pacid
         AND tdiag.fk_vrachid = pVrach
         AND vnaz.fk_vrachid = pVrach
         AND tdiag.fl_main = 1
         AND fp_type = 2
         AND fd_date BETWEEN pd1 AND pd2
         AND vnaz.fk_smid = pNaz
         AND tkarta.fk_id = tdiag.fk_pacid
         AND tkarta.fp_sex <= pSex;
    CURSOR c0Otd (pNaz IN NUMBER, pDiag IN NUMBER, pOtd IN NUMBER, pd1 IN DATE, pd2 IN DATE, pSex IN NUMBER)
    IS
      SELECT COUNT (tdiag.fk_id) AS fn_count
        FROM tdiag,
             vnaz,
             tkarta,
             (SELECT fk_id
                FROM tsmid
               WHERE fk_default IN (SELECT fk_id
                                      FROM tsmid
                                     START WITH fk_id = pDiag
                                     CONNECT BY PRIOR fk_id = fk_owner)) qDiags,
             (SELECT fk_id
                FROM tsotr
               WHERE get_vrachotd (fk_id) = pOtd) qVrachOTD
       WHERE tdiag.fk_smdiagid = qDiags.fk_id
         AND tdiag.fk_pacid = vnaz.fk_pacid
         AND tdiag.fk_vrachid = pOtd
         AND tdiag.fl_main = 1
         AND fp_type = 2
         AND fd_date BETWEEN pd1 AND pd2
         AND vnaz.fk_smid = pNaz
         AND tkarta.fk_id = tdiag.fk_pacid
         AND tkarta.fp_sex <= pSex
         AND qVrachOTD.fk_id = tdiag.fk_vrachid
         AND qVrachOTD.fk_id = vnaz.fk_vrachid;
    CURSOR c0San (pNaz IN NUMBER, pDiag IN NUMBER, pd1 IN DATE, pd2 IN DATE, pSex IN NUMBER)
    IS
      SELECT COUNT (tdiag.fk_id) AS fn_count
        FROM tdiag, vnaz, tkarta, (SELECT fk_id
                                     FROM tsmid
                                    WHERE fk_default IN (SELECT fk_id
                                                           FROM tsmid
                                                          START WITH fk_id = pDiag
                                                          CONNECT BY PRIOR fk_id = fk_owner)) qDiags
       WHERE tdiag.fk_smdiagid = qDiags.fk_id
         AND tdiag.fk_pacid = vnaz.fk_pacid
         AND tdiag.fl_main = 1
         AND fp_type = 2
         AND fd_date BETWEEN pd1 AND pd2
         AND vnaz.fk_smid = pNaz
         AND tkarta.fk_id = tdiag.fk_pacid
         AND tkarta.fp_sex <= pSex;
    --по всем диагнозам
    CURSOR c1Vrach (pNaz IN NUMBER, pDiag IN NUMBER, pVrach IN NUMBER, pd1 IN DATE, pd2 IN DATE, pSex IN NUMBER)
    IS
      SELECT COUNT (tdiag.fk_id) AS fn_count
        FROM tdiag, vnaz,        (SELECT tk.fk_id
          FROM tkarta tk, TSROKY
         WHERE TSROKY.FK_ID = (SELECT MAX (FK_ID) FK_MAXID
                                 FROM TSROKY
                                WHERE FK_PACID = tk.fk_id
                                  AND FK_PRYB IN (2, 4, 6, 5))
         AND fd_data3 BETWEEN pd1 AND pd2
           AND fp_sex <= pSex) tkarta
       WHERE tdiag.fk_smdiagid = pDiag
         AND tdiag.fk_pacid = vnaz.fk_pacid
         AND tdiag.fk_vrachid = pVrach
         AND vnaz.fk_vrachid = pVrach
         AND tdiag.fl_main = 1
         AND fp_type = 2
         AND vnaz.fk_smid = pNaz
         AND tkarta.fk_id = tdiag.fk_pacid;
    CURSOR c1Otd (pNaz IN NUMBER, pDiag IN NUMBER, pOtd IN NUMBER, pd1 IN DATE, pd2 IN DATE, pSex IN NUMBER)
    IS
      SELECT COUNT (tdiag.fk_id) AS fn_count
        FROM tdiag, vnaz,        (SELECT tk.fk_id
          FROM tkarta tk, TSROKY
         WHERE TSROKY.FK_ID = (SELECT MAX (FK_ID) FK_MAXID
                                 FROM TSROKY
                                WHERE FK_PACID = tk.fk_id
                                  AND FK_PRYB IN (2, 4, 6, 5))
         AND fd_data3 BETWEEN pd1 AND pd2
           AND fp_sex <= pSex) tkarta               , (SELECT fk_id
                                     FROM tsotr
                                    WHERE get_vrachotd (fk_id) = pOtd) qVrachOTD
       WHERE tdiag.fk_smdiagid = pDiag
         AND tdiag.fk_pacid = vnaz.fk_pacid
         AND tdiag.fl_main = 1
         AND fp_type = 2
         AND vnaz.fk_smid = pNaz
         AND tkarta.fk_id = tdiag.fk_pacid
         AND qVrachOTD.fk_id = tdiag.fk_vrachid
         AND qVrachOTD.fk_id = vnaz.fk_vrachid;
    CURSOR c1San (pNaz IN NUMBER, pDiag IN NUMBER, pd1 IN DATE, pd2 IN DATE, pSex IN NUMBER)
    IS
      SELECT COUNT (tdiag.fk_id) AS fn_count
        FROM tdiag, vnaz,        (SELECT tk.fk_id
          FROM tkarta tk, TSROKY
         WHERE TSROKY.FK_ID = (SELECT MAX (FK_ID) FK_MAXID
                                 FROM TSROKY
                                WHERE FK_PACID = tk.fk_id
                                  AND FK_PRYB IN (2, 4, 6, 5))
         AND fd_data3 BETWEEN pd1 AND pd2
           AND fp_sex <= pSex) tkarta
       WHERE tdiag.fk_smdiagid = pDiag
         AND tdiag.fk_pacid = vnaz.fk_pacid
         AND tdiag.fl_main = 1
         AND fp_type = 2
         AND vnaz.fk_smid = pNaz
         AND tkarta.fk_id = tdiag.fk_pacid;
  BEGIN
    IF pDetail = 0 THEN
      IF nVrachID > 0 THEN
        FOR i IN c0Vrach (NazSMID, DiagSMID, nVrachID, d1, d2, pSex)
        LOOP
          RETURN i.fn_count;
        END LOOP;
      ELSIF nVrachID = 0 THEN
        FOR i IN c0San (NazSMID, DiagSMID, d1, d2, pSex)
        LOOP
          RETURN i.fn_count;
        END LOOP;
      ELSIF nVrachID < 0 THEN
        FOR i IN c0Otd (NazSMID, DiagSMID, -nVrachID, d1, d2, pSex)
        LOOP
          RETURN i.fn_count;
        END LOOP;
      END IF;
    ELSIF pDetail = 1 THEN
      IF nVrachID > 0 THEN
        FOR i IN c1Vrach (NazSMID, DiagSMID, nVrachID, d1, d2, pSex)
        LOOP
          RETURN i.fn_count;
        END LOOP;
      ELSIF nVrachID = 0 THEN
        FOR i IN c1San (NazSMID, DiagSMID, d1, d2, pSex)
        LOOP
          RETURN i.fn_count;
        END LOOP;
      ELSIF nVrachID < 0 THEN
        FOR i IN c1Otd (NazSMID, DiagSMID, -nVrachID, d1, d2, pSex)
        LOOP
          RETURN i.fn_count;
        END LOOP;
      END IF;
    END IF;
  END CountNazPerDiag;
  FUNCTION CountTotalNazPerDiag (
    DiagSMID   IN   NUMBER,
    pDetail    IN   NUMBER,
    d1         IN   DATE,
    d2         IN   DATE,
    nVrachID   IN   NUMBER,
    pSex       IN   NUMBER
    )
    RETURN NUMBER
  IS
    --по группам
    CURSOR c0Vrach (pDiag IN NUMBER, pVrach IN NUMBER, pd1 IN DATE, pd2 IN DATE, pSex IN NUMBER)
    IS
      SELECT COUNT (tdiag.fk_id) AS fn_count
        FROM tdiag, vnaz, tkarta, (SELECT fk_id
                                     FROM tsmid
                                    WHERE fk_default IN (SELECT fk_id
                                                           FROM tsmid
                                                          START WITH fk_id = pDiag
                                                          CONNECT BY PRIOR fk_id = fk_owner)) qDiags
       WHERE tdiag.fk_smdiagid = qDiags.fk_id
         AND tdiag.fk_pacid = vnaz.fk_pacid
         AND tdiag.fk_vrachid = pVrach
         AND tdiag.fl_main = 1
         AND fp_type = 2
         AND fd_date BETWEEN pd1 AND pd2
         AND tkarta.fk_id = tdiag.fk_pacid
         AND tkarta.fp_sex <= pSex;
    CURSOR c0Otd (pDiag IN NUMBER, pOtd IN NUMBER, pd1 IN DATE, pd2 IN DATE, pSex IN NUMBER)
    IS
      SELECT COUNT (tdiag.fk_id) AS fn_count
        FROM tdiag,
             vnaz,
             tkarta,
             (SELECT fk_id
                FROM tsmid
               WHERE fk_default IN (SELECT fk_id
                                      FROM tsmid
                                     START WITH fk_id = pDiag
                                     CONNECT BY PRIOR fk_id = fk_owner)) qDiags,
             (SELECT fk_id
                FROM tsotr
               WHERE get_vrachotd (fk_id) = pOtd) qVrachOTD
       WHERE tdiag.fk_smdiagid = qDiags.fk_id
         AND tdiag.fk_pacid = vnaz.fk_pacid
         AND tdiag.fk_vrachid = pOtd
         AND tdiag.fl_main = 1
         AND fp_type = 2
         AND fd_date BETWEEN pd1 AND pd2
         AND tkarta.fk_id = tdiag.fk_pacid
         AND tkarta.fp_sex <= pSex
         AND qVrachOTD.fk_id = tdiag.fk_vrachid
         AND qVrachOTD.fk_id = vnaz.fk_vrachid;
    CURSOR c0San (pDiag IN NUMBER, pd1 IN DATE, pd2 IN DATE, pSex IN NUMBER)
    IS
      SELECT COUNT (tdiag.fk_id) AS fn_count
        FROM tdiag, vnaz, tkarta, (SELECT fk_id
                                     FROM tsmid
                                    WHERE fk_default IN (SELECT fk_id
                                                           FROM tsmid
                                                          START WITH fk_id = pDiag
                                                          CONNECT BY PRIOR fk_id = fk_owner)) qDiags
       WHERE tdiag.fk_smdiagid = qDiags.fk_id
         AND tdiag.fk_pacid = vnaz.fk_pacid
         AND tdiag.fl_main = 1
         AND fp_type = 2
         AND fd_date BETWEEN pd1 AND pd2
         AND tkarta.fk_id = tdiag.fk_pacid
         AND tkarta.fp_sex <= pSex;
    --по всем диагнозам
    CURSOR c1Vrach (pDiag IN NUMBER, pVrach IN NUMBER, pd1 IN DATE, pd2 IN DATE, pSex IN NUMBER)
    IS
      SELECT COUNT (tdiag.fk_id) AS fn_count
        FROM tdiag, vnaz, tkarta
       WHERE tdiag.fk_smdiagid = pDiag
         AND tdiag.fk_pacid = vnaz.fk_pacid
         AND tdiag.fk_vrachid = pVrach
         AND tdiag.fl_main = 1
         AND fp_type = 2
         AND fd_date BETWEEN pd1 AND pd2
         AND tkarta.fk_id = tdiag.fk_pacid
         AND tkarta.fp_sex <= pSex;
    CURSOR c1Otd (pDiag IN NUMBER, pOtd IN NUMBER, pd1 IN DATE, pd2 IN DATE, pSex IN NUMBER)
    IS
      SELECT COUNT (tdiag.fk_id) AS fn_count
        FROM tdiag, vnaz, tkarta, (SELECT fk_id
                                     FROM tsotr
                                    WHERE get_vrachotd (fk_id) = pOtd) qVrachOTD
       WHERE tdiag.fk_smdiagid = pDiag
         AND tdiag.fk_pacid = vnaz.fk_pacid
         AND tdiag.fl_main = 1
         AND fp_type = 2
         AND fd_date BETWEEN pd1 AND pd2
         AND tkarta.fk_id = tdiag.fk_pacid
         AND tkarta.fp_sex <= pSex
         AND qVrachOTD.fk_id = tdiag.fk_vrachid
         AND qVrachOTD.fk_id = vnaz.fk_vrachid;
    CURSOR c1San (pDiag IN NUMBER, pd1 IN DATE, pd2 IN DATE, pSex IN NUMBER)
    IS
      SELECT COUNT (tdiag.fk_id) AS fn_count
        FROM tdiag, vnaz, tkarta
       WHERE tdiag.fk_smdiagid = pDiag
         AND tdiag.fk_pacid = vnaz.fk_pacid
         AND tdiag.fl_main = 1
         AND fp_type = 2
         AND fd_date BETWEEN pd1 AND pd2
         AND tkarta.fk_id = tdiag.fk_pacid
         AND tkarta.fp_sex <= pSex;
  BEGIN
    IF pDetail = 0 THEN
      IF nVrachID > 0 THEN
        FOR i IN c0Vrach (DiagSMID, nVrachID, d1, d2, pSex)
        LOOP
          RETURN i.fn_count;
        END LOOP;
      ELSIF nVrachID = 0 THEN
        FOR i IN c0San (DiagSMID, d1, d2, pSex)
        LOOP
          RETURN i.fn_count;
        END LOOP;
      ELSIF nVrachID < 0 THEN
        FOR i IN c0Otd (DiagSMID, -nVrachID, d1, d2, pSex)
        LOOP
          RETURN i.fn_count;
        END LOOP;
      END IF;
    ELSIF pDetail = 1 THEN
      IF nVrachID > 0 THEN
        FOR i IN c1Vrach (DiagSMID, nVrachID, d1, d2, pSex)
        LOOP
          RETURN i.fn_count;
        END LOOP;
      ELSIF nVrachID = 0 THEN
        FOR i IN c1San (DiagSMID, d1, d2, pSex)
        LOOP
          RETURN i.fn_count;
        END LOOP;
      ELSIF nVrachID < 0 THEN
        FOR i IN c1Otd (DiagSMID, -nVrachID, d1, d2, pSex)
        LOOP
          RETURN i.fn_count;
        END LOOP;
      END IF;
    END IF;
  END CountTotalNazPerDiag;
/*-------------------------------------------------------------------------------------------*\
|               vr_diag
\*-------------------------------------------------------------------------------------------*/
  PROCEDURE vr_diag (   --      aVr           IN       tvrachids,
  NVr IN NUMBER, d1 IN DATE, d2 IN DATE, sTableName OUT VARCHAR2, bShowNull IN INTEGER, bIncludePre IN NUMBER)
  IS
-- простой отчет без разбивки
    nVrtotal   tvrachids;
    nVrachID   NUMBER;
    cid        NUMBER;
    sSQL       VARCHAR2(4000);
    nRow       INTEGER;
    nTemp      NUMBER;
    sTmp       VARCHAR2(32767);
    sBPre      VARCHAR2(10);
    sEPre      VARCHAR2(10);
    aVr        tvrachids;
  BEGIN
    aVr (0) := nVr;
    IF avr.COUNT = 0 THEN
      raise_application_error (-20003, 'Неверный вызов отчета, список врачей пуст');
    END IF;
    IF bIncludePre = 1 THEN
      sBPre := '<pre>';
      sEPre := '</pre>';
    END IF;
    -- создадим таблицу
    stablename := get_temptablename;
    sSQL := 'create table ' || stablename || '(fn_rownum number(3,0),fc_diag varchar2(270), fk_mkb10 varchar2(12), ';
    FOR i IN 0 .. avr.COUNT - 1
    LOOP
      sSQL := sSQL || 'fc' || avr (i) || 'abs varchar2 (170),';
      sSQL := sSQL || 'fc' || avr (i) || 'otn varchar2 (170),';
    END LOOP;
    sSQL := SUBSTR (sSQL, 1, LENGTH (sSQL) - 1) || ') nologging';
    cid := DBMS_SQL.OPEN_CURSOR;
    DBMS_SQL.parse (cid, sSQL, DBMS_SQL.NATIVE);
    -- создадим комментарии к таблице
    sTmp := 'Отчет о поставленных диагнозых за период с ' ||
            TO_CHAR (d1, 'dd.mm.yyyy') ||
            ' по ' ||
            TO_CHAR (d2, 'dd.mm.yyyy');
    IF nVrachid > 0 THEN
      sTmp := sTmp || ' врачами медучреждения';
    ELSIF nVrachid < 0 THEN
      sTmp := sTmp || ' врачами отделения ' || DO_OTDNAME (-nVrachid);
    ELSIF nVrachid = 0 THEN
      sTmp := sTmp || ' по медучреждению';
    END IF;
    EXECUTE IMMEDIATE 'comment on table ' || sTableName || ' is ''' || sTmp || '''';
    EXECUTE IMMEDIATE 'comment on column ' || sTableName || '.fc_diag  is ''Диагнозы''';
    EXECUTE IMMEDIATE 'comment on column ' || sTableName || '.fn_rownum  is ''№ п.п.''';
    EXECUTE IMMEDIATE 'comment on column ' || sTableName || '.fk_mkb10  is ''Шифр по МКБ-10''';
    FOR i IN 0 .. avr.COUNT - 1
    LOOP
      IF avr (i) > 0 THEN
        EXECUTE IMMEDIATE 'comment on column ' ||
                          sTableName ||
                          '.fc' ||
                          avr (i) ||
                          'abs is ''' ||
                          'Врач|' ||
                          do_vrachfio (avr (i)) ||
                          '|Абс.''';
        EXECUTE IMMEDIATE 'comment on column ' ||
                          sTableName ||
                          '.fc' ||
                          avr (i) ||
                          'otn is ''' ||
                          'Врач|' ||
                          do_vrachfio (avr (i)) ||
                          '|%''';
      ELSIF aVr (i) = 0 THEN
        EXECUTE IMMEDIATE 'comment on column ' ||
                          sTableName ||
                          '.fc' ||
                          avr (i) ||
                          'abs is ''' ||
                          'По всему медучрежд.|Абс.''';
        EXECUTE IMMEDIATE 'comment on column ' ||
                          sTableName ||
                          '.fc' ||
                          avr (i) ||
                          'otn is ''' ||
                          'По всему медучрежд.|%''';
      ELSIF aVr (i) < 0 THEN
        EXECUTE IMMEDIATE 'comment on column ' ||
                          sTableName ||
                          '.fc' ||
                          avr (i) ||
                          'abs is ''' ||
                          'Отделение|' ||
                          DO_OTDNAME (-avr (i)) ||
                          '|Абс.''';
        EXECUTE IMMEDIATE 'comment on column ' ||
                          sTableName ||
                          '.fc' ||
                          avr (i) ||
                          'otn is ''' ||
                          'Отделение|' ||
                          DO_OTDNAME (-avr (i)) ||
                          '|%''';
      END IF;
    END LOOP;
    -- создадим запрос для вставки
    sSQL := 'insert into ' || sTableName || '(fn_rownum, fc_diag, fk_mkb10,';
    FOR i IN 0 .. avr.COUNT - 1
    LOOP
      sSQL := sSQL || 'fc' || avr (i) || 'abs,';
      sSQL := sSQL || 'fc' || avr (i) || 'otn,';
    END LOOP;
    sSQL := SUBSTR (sSQL, 1, LENGTH (sSQL) - 1) || ') values (:prow, :pdiag, :pmkb10,';
    FOR i IN 0 .. avr.COUNT - 1
    LOOP
      sSQL := sSQL || ':pfc' || avr (i) || 'abs,';
      sSQL := sSQL || ':pfc' || avr (i) || 'otn,';
    END LOOP;
    sSQL := SUBSTR (sSQL, 1, LENGTH (sSQL) - 1) || ')';
    DBMS_SQL.parse (cid, sSQL, DBMS_SQL.native);
-- занесем данные в таблицу
    nRow := 1;
    FOR rDiag IN cGroupDiag
    LOOP
      -- всего
      DBMS_SQL.parse (cid, sSQL, DBMS_SQL.native);
      DBMS_SQL.bind_variable (cid, ':prow', nRow);
      DBMS_SQL.bind_variable (cid, ':pdiag', rDiag.fc_name);
      DBMS_SQL.bind_variable (cid, ':pmkb10', rDiag.fk_mkb10);
      --переберем всех врачей
      FOR i IN 0 .. avr.COUNT - 1
      LOOP
        nTemp := countDiag (rDiag.fk_id, 0, d1, d2, aVr (i), pSex => 1);
        IF nTemp <> 0 THEN
          DBMS_SQL.bind_variable (cid, ':pfc' || avr (i) || 'abs', nTemp);
          DBMS_SQL.bind_variable (cid, ':pfc' || avr (i) || 'otn', nTemp / 100 || '%');
        ELSE
          DBMS_SQL.bind_variable (cid, ':pfc' || avr (i) || 'abs', '');
          DBMS_SQL.bind_variable (cid, ':pfc' || avr (i) || 'otn', '');
        END IF;
      END LOOP;
      nTemp := DBMS_SQL.execute (cid);
      -- в т.ч. женщины
      DBMS_SQL.parse (cid, sSQL, DBMS_SQL.native);
      DBMS_SQL.bind_variable (cid, ':prow', '');
      DBMS_SQL.bind_variable (cid, ':pdiag', LPAD (' ', rDiag.fn_level * 4) || 'в т.ч. женщины');
      DBMS_SQL.bind_variable (cid, ':pmkb10', '');
      -- переберем всех врачей
      FOR i IN 0 .. avr.COUNT - 1
      LOOP
        nTemp := countDiag (rDiag.fk_id, 0, d1, d2, aVr (i), pSex => 0);
        IF nTemp <> 0 THEN
          DBMS_SQL.bind_variable (cid, ':pfc' || avr (i) || 'abs', nTemp);
          DBMS_SQL.bind_variable (cid, ':pfc' || avr (i) || 'otn', nTemp / 100 || '%');
        ELSE
          DBMS_SQL.bind_variable (cid, ':pfc' || avr (i) || 'abs', '');
          DBMS_SQL.bind_variable (cid, ':pfc' || avr (i) || 'otn', '');
        END IF;
      END LOOP;
      nTemp := DBMS_SQL.execute (cid);
      nRow := nRow + 1;
    END LOOP;
    -- подсчитаем всего
    DBMS_SQL.parse (cid, sSQL, DBMS_SQL.native);
    DBMS_SQL.bind_variable (cid, ':prow', nRow);
    DBMS_SQL.bind_variable (cid, ':pdiag', 'Всего:');
    DBMS_SQL.bind_variable (cid, ':pmkb10', '');
    FOR i IN 0 .. avr.COUNT - 1
    LOOP
      ntemp := CountDiag (-1, 0, d1, d2, aVr (i), pSex => 1);
      DBMS_SQL.bind_variable (cid, ':pfc' || avr (i) || 'abs', nTemp);
      DBMS_SQL.bind_variable (cid, ':pfc' || avr (i) || 'otn', '100%');
      IF nTemp > 0 THEN
        EXECUTE IMMEDIATE 'update ' ||
                          sTableName ||
                          ' set fc' ||
                          avr (i) ||
                          'otn = round(fc' ||
                          avr (i) ||
                          'abs/' ||
                          nTemp ||
                          '*10000)/100';
      ELSE
        EXECUTE IMMEDIATE 'update ' || sTableName || ' set fc' || avr (i) || 'otn = 0';
      END IF;
    END LOOP;
    nTemp := DBMS_SQL.execute (cid);
    --подсчитаем всего женщины
    DBMS_SQL.parse (cid, sSQL, DBMS_SQL.native);
    DBMS_SQL.bind_variable (cid, ':prow', '');
    DBMS_SQL.bind_variable (cid, ':pdiag', '  в т.ч. женщины:');
    DBMS_SQL.bind_variable (cid, ':pmkb10', '');
    FOR i IN 0 .. avr.COUNT - 1
    LOOP
      ntemp := CountDiag (-1, 0, d1, d2, aVr (i), pSex => 0);
      DBMS_SQL.bind_variable (cid, ':pfc' || avr (i) || 'abs', nTemp);
      DBMS_SQL.bind_variable (cid, ':pfc' || avr (i) || 'otn', '100%');
    END LOOP;
    nTemp := DBMS_SQL.execute (cid);
    DBMS_SQL.close_cursor (cid);
    SetResultTable (sTableName);
  END;
/*-------------------------------------------------------------------------------------------*\
|               diagnaz                                                                       |
\*-------------------------------------------------------------------------------------------*/
  PROCEDURE diag_naz (
    nVrachID      IN       NUMBER,
    d1            IN       DATE,
    d2            IN       DATE,   -- если pStartID=0  то отчет собирается для всех назначений
    pStartID      IN       NUMBER,
    sTableName    OUT      VARCHAR2,
    bShowNull     IN       INTEGER,
    bIncludePre   IN       NUMBER
  )
  IS
-- pDetail=0 отчет по группам диагнзов
-- pDetail=1 подробный отчет по всем диагнозам
-- pStartID для консультаций, процедур, анализов или исследований
    pDetail    NUMBER          := 0;
    aDiags     TGroupDiag;
    aNaz       TNaz;
    nTmp       NUMBER;
    sSQL       VARCHAR2(32767);
    cid        NUMBER;
    n1         NUMBER;
    nDiagSum   NUMBER;
    nTotal     NUMBER;
    nStartID   NUMBER;
    sTmp       VARCHAR2(32767);
    sBPre      VARCHAR2(10);
    sEPre      VARCHAR2(10);
  BEGIN
    nStartID := pStartID;
    sTableName := get_temptablename;
    nTmp := 1;
    FOR i IN cGroupDiag
    LOOP
      aDiags (nTmp) := i;
      inc (nTmp);
    END LOOP;
    IF bIncludePre = 1 THEN
      sBPre := '<pre>';
      sEPre := '</pre>';
    END IF;
    nTmp := 1;
    -- занесем в ПЛ СКЛ таблицу все назначения и одновременно сформируем СКЛ-ник для
    -- создания таблицы отчета
    sSQL := 'create table ' || sTableName || '(fn_rownum varchar2(3), fc_diag varchar2(150)';
    IF nStartID > 0 THEN
      raise_application_error (-20003, nStartID);
      FOR i IN cNaz (nStartID)
      LOOP
        n1 := countNaz (i.fk_id, d1, d2, nVrachID, 1);
        -- если в этой колонке будут одни нули, то не включаем ее в таблицу
        OPEN cSMIDName (nStartID);
        FETCH cSMIDName INTO sTmp;
        CLOSE cSMIDName;
        IF    (   (n1 > 0)
              AND (bShowNull = 0))
           OR bShowNull = 1 THEN
          aNaz (nTmp) := i;
          aNaz (nTmp).fc_caption := sTmp || '|' || aNaz (nTmp).FC_NAME;
          aNaz (nTmp).fc_fieldname := 'fc_' || aNaz (nTmp).FK_ID;
          aNaz (nTmp).fn_total := n1;
          sSQL := sSQL || ', ' || aNaz (nTmp).fc_fieldname || 'abs varchar2(22)';
          sSQL := sSQL || ', ' || aNaz (nTmp).fc_fieldname || 'otn varchar2(22)';
          inc (nTmp);
        END IF;
      END LOOP;
    ELSE
      nStartID := get_konsid;
      FOR i IN cNaz (nStartID)
      LOOP
        n1 := countNaz (i.fk_id, d1, d2, nVrachID, 1);
        -- если в этой колонке будут одни нули, то не включаем ее в таблицу
        OPEN cSMIDName (nStartID);
        FETCH cSMIDName INTO sTmp;
        CLOSE cSMIDName;
        IF    (   (n1 > 0)
              AND (bShowNull = 0))
           OR bShowNull = 1 THEN
          aNaz (nTmp) := i;
          aNaz (nTmp).fc_caption := sTmp || '|' || aNaz (nTmp).FC_NAME;
          aNaz (nTmp).fc_fieldname := 'fc_' || aNaz (nTmp).FK_ID;
          aNaz (nTmp).fn_total := n1;
          sSQL := sSQL || ', ' || aNaz (nTmp).fc_fieldname || 'abs varchar2(22)';
          sSQL := sSQL || ', ' || aNaz (nTmp).fc_fieldname || 'otn varchar2(22)';
          inc (nTmp);
        END IF;
      END LOOP;
      nStartID := get_issledid;
      FOR i IN cNaz (nStartID)
      LOOP
        n1 := countNaz (i.fk_id, d1, d2, nVrachID, 1);
        -- если в этой колонке будут одни нули, то не включаем ее в таблицу
        OPEN cSMIDName (nStartID);
        FETCH cSMIDName INTO sTmp;
        CLOSE cSMIDName;
        IF    (   (n1 > 0)
              AND (bShowNull = 0))
           OR bShowNull = 1 THEN
          aNaz (nTmp) := i;
          aNaz (nTmp).fc_caption := sTmp || '|' || aNaz (nTmp).FC_NAME;
          aNaz (nTmp).fc_fieldname := 'fc_' || aNaz (nTmp).FK_ID;
          aNaz (nTmp).fn_total := n1;
          sSQL := sSQL || ', ' || aNaz (nTmp).fc_fieldname || 'abs varchar2(22)';
          sSQL := sSQL || ', ' || aNaz (nTmp).fc_fieldname || 'otn varchar2(22)';
          inc (nTmp);
        END IF;
      END LOOP;
      nStartID := get_procid;
      FOR i IN cNaz (nStartID)
      LOOP
        n1 := countNaz (i.fk_id, d1, d2, nVrachID, 1);
        -- если в этой колонке будут одни нули, то не включаем ее в таблицу
        OPEN cSMIDName (nStartID);
        FETCH cSMIDName INTO sTmp;
        CLOSE cSMIDName;
        IF    (   (n1 > 0)
              AND (bShowNull = 0))
           OR bShowNull = 1 THEN
          aNaz (nTmp) := i;
          aNaz (nTmp).fc_caption := sTmp || '|' || aNaz (nTmp).FC_NAME;
          aNaz (nTmp).fc_fieldname := 'fc_' || aNaz (nTmp).FK_ID;
          aNaz (nTmp).fn_total := n1;
          sSQL := sSQL || ', ' || aNaz (nTmp).fc_fieldname || 'abs varchar2(22)';
          sSQL := sSQL || ', ' || aNaz (nTmp).fc_fieldname || 'otn varchar2(22)';
          inc (nTmp);
        END IF;
      END LOOP;
      nStartID := get_analid;
      FOR i IN cNaz (nStartID)
      LOOP
        n1 := countNaz (i.fk_id, d1, d2, nVrachID, 1);
        -- если в этой колонке будут одни нули, то не включаем ее в таблицу
        OPEN cSMIDName (nStartID);
        FETCH cSMIDName INTO sTmp;
        CLOSE cSMIDName;
        IF    (   (n1 > 0)
              AND (bShowNull = 0))
           OR bShowNull = 1 THEN
          aNaz (nTmp) := i;
          aNaz (nTmp).fc_caption := sTmp || '|' || aNaz (nTmp).FC_NAME;
          aNaz (nTmp).fc_fieldname := 'fc_' || aNaz (nTmp).FK_ID;
          aNaz (nTmp).fn_total := n1;
          sSQL := sSQL || ', ' || aNaz (nTmp).fc_fieldname || 'abs varchar2(22)';
          sSQL := sSQL || ', ' || aNaz (nTmp).fc_fieldname || 'otn varchar2(22)';
          inc (nTmp);
        END IF;
      END LOOP;
    END IF;
    sSQL := sSQL || ', fc_totalabs varchar2(22), fc_totalotn varchar2(22)) nologging';
    EXECUTE IMMEDIATE sSQL;
    -- создадим комментарии к таблице
    sTmp := 'Отчет о соответствии между поставленными диагнозами и проведеннмы назначениями за период с ' ||
            TO_CHAR (d1, 'dd.mm.yyyy') ||
            ' по ' ||
            TO_CHAR (d2, 'dd.mm.yyyy');
    IF nVrachid > 0 THEN
      sTmp := sTmp || ' врачом ' || DO_VRACHFIO (nVrachid);
    ELSIF nVrachid < 0 THEN
      sTmp := sTmp || ' по отделению ' || DO_OTDNAME (-nVrachid);
    ELSIF nVrachid = 0 THEN
      sTmp := sTmp || ' по медучреждению';
    END IF;
    EXECUTE IMMEDIATE 'comment on table ' || sTableName || ' is ''' || sTmp || '''';
    EXECUTE IMMEDIATE 'comment on column ' || sTableName || '.fn_rownum  is ''№ п.п.''';
    EXECUTE IMMEDIATE 'comment on column ' || sTableName || '.fc_diag  is ''Диагнозы''';
    EXECUTE IMMEDIATE 'comment on column ' || sTableName || '.fc_totalabs is ''Всего|абс''';
    EXECUTE IMMEDIATE 'comment on column ' || sTableName || '.fc_totalotn is ''Всего|% от общего''';
    FOR i IN 1 .. aNaz.COUNT
    LOOP
      EXECUTE IMMEDIATE 'comment on column ' ||
                        sTableName ||
                        '.' ||
                        aNaz (i).fc_fieldname ||
                        'abs is ''' ||
                        aNaz (i).fc_caption ||
                        '|абс.''';
      EXECUTE IMMEDIATE 'comment on column ' ||
                        sTableName ||
                        '.' ||
                        aNaz (i).fc_fieldname ||
                        'otn is ''' ||
                        aNaz (i).fc_caption ||
                        '|% от итого''';
    END LOOP;
    --создадим запрос для вставки
    cid := DBMS_SQL.OPEN_CURSOR;
    sSQL := 'insert into ' || sTableName || '(fn_rownum, fc_diag ';
    FOR i IN 1 .. aNaz.COUNT
    LOOP
      sSQL := sSQL || ',' || aNaz (i).fc_fieldname || 'abs';
      sSQL := sSQL || ',' || aNaz (i).fc_fieldname || 'otn';
    END LOOP;
    sSQL := sSQL || ',fc_totalabs) values (:pfn_rownum, :pfc_diag ';
    FOR i IN 1 .. aNaz.COUNT
    LOOP
      sSQL := sSQL || ',:p' || aNaz (i).fc_fieldname || 'abs';
      sSQL := sSQL || ',:p' || aNaz (i).fc_fieldname || 'otn';
    END LOOP;
    sSQL := sSQL || ', :pfc_totalabs)';
    DBMS_SQL.parse (cid, sSQL, DBMS_SQL.Native);
    --подсчитаем сумму по каждому назначению для подсчета процента
    FOR i IN 1 .. aNaz.COUNT
    LOOP
      aNaz (i).fn_total := countNaz (aNaz (i).fk_id, d1, d2, nVrachID, 1);
    END LOOP;
    --расчитем и занесем все данные в таблицу
--    nDiagSum := 0;
    nTotal := 0;
    FOR diag IN 1 .. aDiags.COUNT
    LOOP
      DBMS_SQL.bind_variable (cid, ':pfn_rownum', diag);
      DBMS_SQL.bind_variable (cid, ':pfc_diag', sBPre || aDiags (diag).fc_name || sEPre);
--      nTmp := countDiag (aDiags (diag).fk_id, pDetail, d1, d2, nVrachID, pSex => 1);
--      IF aDiags (diag).fn_level = 1 THEN
--        nDiagSum := nDiagSum + nTmp;
      nDiagSum := CountTotalNazPerDiag (aDiags (diag).fk_id, pDetail, d1, d2, nVrachID, 1);
--      END IF;
      FOR naz IN 1 .. aNaz.COUNT
      LOOP
        nTmp := CountNazPerDiag (aNaz (naz).FK_ID, aDiags (diag).fk_id, pDetail, d1, d2, nVrachID, 1);
        IF nTmp != 0 THEN
          DBMS_SQL.bind_variable (cid, ':p' || aNaz (naz).fc_fieldName || 'abs', TO_CHAR (nTmp));
        ELSE
          DBMS_SQL.bind_variable (cid, ':p' || aNaz (naz).fc_fieldName || 'abs', '');
        END IF;
        IF aNaz (naz).fn_total * nTmp = 0 THEN
          DBMS_SQL.bind_variable (cid, ':p' || aNaz (naz).fc_fieldName || 'otn', '');
        ELSE
          DBMS_SQL.bind_variable (
            cid,
            ':p' || aNaz (naz).fc_fieldName || 'otn',
            SUBSTR (TO_CHAR (nTmp / nDiagSum * 100, 'FM9999999990D9999'), 1, 6) || '%'
          );
        END IF;
      END LOOP;
      DBMS_SQL.bind_variable (cid, ':pfc_totalabs', nDiagSum);
      nTotal := nTotal + nDiagSum;
      nTmp := DBMS_SQL.execute (cid);
    END LOOP;
    --сделаем ИТОГО снизу
    DBMS_SQL.bind_variable (cid, ':pfn_rownum', aDiags.COUNT + 1);
    DBMS_SQL.bind_variable (cid, ':pfc_diag', sBPre || 'ИТОГО' || sEPre);
    DBMS_SQL.bind_variable (cid, ':pfc_totalabs', nTotal);
    FOR naz IN 1 .. aNaz.COUNT
    LOOP
      nTmp := CountNaz (aNaz (naz).FK_ID, d1, d2, nVrachID, 1);
      IF nTmp = 0 THEN
        DBMS_SQL.bind_variable (cid, ':p' || aNaz (naz).fc_fieldName || 'abs', '');
      ELSE
        DBMS_SQL.bind_variable (cid, ':p' || aNaz (naz).fc_fieldName || 'abs', TO_CHAR (nTmp));
      END IF;
      IF aNaz (naz).fn_total * nTmp * nTotal = 0 THEN
        DBMS_SQL.bind_variable (cid, ':p' || aNaz (naz).fc_fieldName || 'otn', '');
      ELSE
        sSQL := '100%';
        DBMS_SQL.bind_variable (
          cid,
          ':p' || aNaz (naz).fc_fieldName || 'otn',
          SUBSTR (TO_CHAR (nTmp / nTotal * 100, 'FM9999999990D9999'), 1, 6) || '%'
        );
      END IF;
    END LOOP;
    nTmp := DBMS_SQL.execute (cid);
    IF nTotal <> 0 THEN
      EXECUTE IMMEDIATE 'update ' ||
                        sTableName ||
                        ' set fc_totalotn=substr(to_char(fc_totalabs/:1*100,''FM9999999990D99999''),1,6)||''%'''
        USING ntotal;
    END IF;
    DBMS_SQL.close_cursor (cid);
    IF bShowNull = 0 THEN
      FOR i IN 1 .. aNaz.COUNT
      LOOP
        IF     (aNaz (i).fn_total = 0)
           AND (bShowNull = 0) THEN
          EXECUTE IMMEDIATE 'alter table ' || sTableName || ' drop column ' || aNaz (i).fc_fieldName || 'abs';
          EXECUTE IMMEDIATE 'alter table ' || sTableName || ' drop column ' || aNaz (i).fc_fieldName || 'otn';
        END IF;
      END LOOP;
    END IF;
    SetResultTable (sTableName);
  END;
/*-------------------------------------------------------------------------------------------*\
|               naz_vr
\*-------------------------------------------------------------------------------------------*/
  PROCEDURE naz_vr (
    nVrachID      IN       NUMBER,
    d1            IN       DATE,
    d2            IN       DATE,
    pStartID      IN       NUMBER,
    sTableName    OUT      VARCHAR2,
    bShowNull     IN       INTEGER,
    bIncludePre   IN       NUMBER,
    pPokaz        IN       NUMBER
  )
  IS
-- pDetail=0 отчет по группам диагнзов
-- pDetail=1 подробный отчет по всем диагнозам
    aNazView    TNazView;
    nTmp        NUMBER;
    sSQL        VARCHAR2(32767);
    cid         NUMBER;
    n1          NUMBER;
    nDiagSum    NUMBER;
    sTmp        VARCHAR2(800);
    nTotalNaz   NUMBER;
    sBPre       VARCHAR2(10);
    sEPre       VARCHAR2(10);
  BEGIN
    sTableName := get_temptablename;
    nTmp := 1;
    IF bIncludePre = 1 THEN
      sBPre := '<pre>';
      sEPre := '</pre>';
    END IF;
    --консультации
    FOR i IN cNazView (get_konsid)
    LOOP
      aNazView (nTmp) := i;
      inc (nTmp);
    END LOOP;
    --исследования
    FOR i IN cNazView (get_issledid)
    LOOP
      aNazView (nTmp) := i;
      inc (nTmp);
    END LOOP;
    --анализы
    FOR i IN cNazView (get_analid)
    LOOP
      aNazView (nTmp) := i;
      inc (nTmp);
    END LOOP;
    --процедцры
    FOR i IN cNazView (get_procid)
    LOOP
      aNazView (nTmp) := i;
      inc (nTmp);
    END LOOP;
    nTmp := 1;
    -- занесем в ПЛ СКЛ таблицу все назначения и одновременно сформируем СКЛ-ник для
    -- создания таблицы отчета
    sSQL := 'create table ' || sTableName || '(fn_rownum varchar2(3), fc_naz varchar2(150)';
    --
    --здесь вставить определение новых полей
    --
    sSQL := sSQL || ', fc_totalabs varchar2(22), fc_totalotn varchar2(22)) nologging';
    EXECUTE IMMEDIATE sSQL;
    -- создадим комментарии к таблице
    sTmp := 'Сводный отчет о назначениях за период с ' ||
            TO_CHAR (d1, 'dd.mm.yyyy') ||
            ' по ' ||
            TO_CHAR (d2, 'dd.mm.yyyy');
    IF nVrachid > 0 THEN
--      raise_application_error(-20003,'Vrach = '|| nVrachID);
      sTmp := sTmp || ' по врачу ' || DO_VRACHFIO (nVrachid);
    ELSIF nVrachid < 0 THEN
      sTmp := sTmp || ' по отделению ' || DO_OTDNAME (-nVrachid);
    ELSIF nVrachid = 0 THEN
      sTmp := sTmp || ' по медучреждению';
    END IF;
    EXECUTE IMMEDIATE 'comment on table ' || sTableName || ' is ''' || sTmp || '''';
    EXECUTE IMMEDIATE 'comment on column ' || sTableName || '.fn_rownum  is ''№ п.п.''';
    EXECUTE IMMEDIATE 'comment on column ' || sTableName || '.fc_naz  is ''Назначение''';
    EXECUTE IMMEDIATE 'comment on column ' || sTableName || '.fc_totalabs is ''Всего|абс''';
    EXECUTE IMMEDIATE 'comment on column ' || sTableName || '.fc_totalotn is ''Всего|% от общего''';
--
--здесь вставить комментарии на новые поля
--
--создадим запрос для вставки
    cid := DBMS_SQL.OPEN_CURSOR;
    sSQL := 'insert into ' || sTableName || '(fn_rownum, fc_naz ';
--
--здесь вставить новые поля для вставки
--
    sSQL := sSQL || ',fc_totalabs, fc_totalotn) values (:pfn_rownum, :pfc_naz ';
    --
    --здесь вставить Values новых полей
    --
    sSQL := sSQL || ', :pfc_totalabs, :pfc_totalotn)';
    DBMS_SQL.parse (cid, sSQL, DBMS_SQL.Native);
    --подсчитаем сумму по каждому назначенияю для подсчета процента
    nTotalNaz := 0;
    FOR i IN 1 .. aNazView.COUNT
    LOOP
      aNazView (i).fn_total := countNazTotal (aNazView (i).fk_id, d1, d2, nVrachID, 1, pPokaz);
      IF aNazView (i).fn_level = 1 THEN
        nTotalNaz := nTotalNaz + aNazView (i).fn_total;
      END IF;
    END LOOP;
    --расчитем и занесем все данные в таблицу
    nDiagSum := 0;
    FOR naz IN 1 .. aNazView.COUNT
    LOOP
      DBMS_SQL.bind_variable (cid, ':pfn_rownum', naz);
      DBMS_SQL.bind_variable (cid, ':pfc_naz', sBPre || aNazView (naz).fc_name || sEPre);
      IF aNazView (naz).fn_total = 0 THEN
        DBMS_SQL.bind_variable (cid, ':pfc_totalotn', '');
        DBMS_SQL.bind_variable (cid, ':pfc_totalabs', '');
      ELSE
        DBMS_SQL.bind_variable (
          cid,
          ':pfc_totalotn',
          SUBSTR (TO_CHAR (aNazView (naz).fn_total / nTotalNaz * 100, 'FM9999999990D9999'), 1, 6) || '%'
        );
        DBMS_SQL.bind_variable (cid, ':pfc_totalabs', TO_CHAR (aNazView (naz).fn_total));
      END IF;
      nTmp := DBMS_SQL.execute (cid);
    END LOOP;
    --сделаем ИТОГО снизу
    DBMS_SQL.bind_variable (cid, ':pfn_rownum', aNazView.COUNT + 1);
    DBMS_SQL.bind_variable (cid, ':pfc_naz', sBPre || 'ИТОГО' || sEPre);
    DBMS_SQL.bind_variable (cid, ':pfc_totalabs', TO_CHAR (nTotalNaz));
    DBMS_SQL.bind_variable (cid, ':pfc_totalotn', '100%');
    nTmp := DBMS_SQL.execute (cid);
    DBMS_SQL.close_cursor (cid);
    SetResultTable (sTableName);
  END;
/*-------------------------------------------------------------------------------------------*\
|               GetName
\*-------------------------------------------------------------------------------------------*/
  FUNCTION GetName (pFK_ID IN NUMBER)
    RETURN VARCHAR2
  IS
    res   VARCHAR2(150);
  BEGIN
    IF pFK_ID = 0 THEN
      res := 'Медучреждения';
    END IF;
    IF pFK_ID > 0 THEN
      res := do_vrachfio (pFK_ID);
    END IF;
    IF pFK_ID < 0 THEN
      res := get_otdname (-pFK_ID);
    END IF;
    return res;
  END;
END MEDSTAT;
/

SHOW ERRORS;


