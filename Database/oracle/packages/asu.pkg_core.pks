DROP PACKAGE ASU.PKG_CORE
/

--
-- PKG_CORE  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_CORE" 
  IS
-- Процедуры и функции ядра

  function TestRight(p_ID_SOTR in INteger, p_ID_RIGHT in integer) return integer;
  PRAGMA restrict_references(TestRight,WNDS,WNPS);

  Function Get_CONSTBYNAME(p_NAME IN VARCHAR)RETURN NUMBER;
  PRAGMA restrict_references(Get_CONSTBYNAME,WNDS,WNPS);
  PROCEDURE set_defaultrazdels;
  PROCEDURE write_tib_val (
  p_fk_pacid      IN   INTEGER,
  p_fk_smeditid   IN   INTEGER,
  p_val           IN   INTEGER
);
  PROCEDURE write_tib_val_text (
  p_fk_pacid      IN   INTEGER,
  p_fk_smeditid   IN   INTEGER,
  p_val           IN   VARCHAR2,
  p_fk_sotr       IN INTEGER
);
  PROCEDURE write_tib_val1 (
  p_fk_pacid      IN   INTEGER,
  p_fk_smeditid   IN   INTEGER,
  p_val           IN   INTEGER,
  p_fk_sotr       IN INTEGER

);
  PROCEDURE write_tib_val_Num (
  p_fk_pacid      IN   INTEGER,
  p_fk_smeditid   IN   INTEGER,
  p_fk_sotr           IN   INTEGER,
  p_fn_NUM  IN NUMBER

);
  PROCEDURE write_tib_val_date (
    p_fk_pacid      IN   INTEGER,
    p_fk_smeditid   IN   INTEGER,
    p_val           IN   DATE,
    p_fk_sotr       IN   INTEGER
  );
END; -- Package spec
/

SHOW ERRORS;


