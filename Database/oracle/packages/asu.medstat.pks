DROP PACKAGE ASU.MEDSTAT
/

--
-- MEDSTAT  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."MEDSTAT" 
IS
/*   TYPE rvrach IS RECORD(
      fk_id                         NUMBER,
      fn_total                      NUMBER);*/
  TYPE tvrachids IS TABLE OF INTEGER
    INDEX BY BINARY_INTEGER;
  FUNCTION GetResultTable
    RETURN VARCHAR2;
  PROCEDURE SetResultTable (sValue IN VARCHAR2);
  --какие диагнозы поставили врачи за период
  PROCEDURE vr_diag (--      aVr           IN       tvrachids,
  NVr IN NUMBER, d1 IN DATE, d2 IN DATE, sTableName OUT VARCHAR2, bShowNull IN INTEGER, bIncludePre IN NUMBER);
  --какие назначения сделал врач за период
  PROCEDURE diag_naz (
    nVrachID      IN       NUMBER,
    d1            IN       DATE,
    d2            IN       DATE,
    pStartID      IN       NUMBER,
    sTableName    OUT      VARCHAR2,
    bShowNull     IN       INTEGER,
    bIncludePre   IN       NUMBER
  );
  --какие назначения сделал врач за период
  PROCEDURE naz_vr (
    nVrachID      IN       NUMBER,
    d1            IN       DATE,
    d2            IN       DATE,
    pStartID      IN       NUMBER,
    sTableName    OUT      VARCHAR2,
    bShowNull     IN       INTEGER,
    bIncludePre   IN       NUMBER,
    pPokaz        IN       NUMBER
  );
  FUNCTION GetName (pFK_ID IN NUMBER)
    RETURN VARCHAR2;
END medstat;
/

SHOW ERRORS;


