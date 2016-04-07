DROP PACKAGE ASU.PKG_SANKARTA
/

--
-- PKG_SANKARTA  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_SANKARTA" IS
  -- Updated : 11.11.2003 by TimurLan
  -- LastUpdated : 14.11.2003 by Kapustin A.V.
   FUNCTION get_fullkart (
      ppacid   IN   NUMBER/*,
      ucher    IN   VARCHAR2 DEFAULT '������������� ���',
      obl      IN   VARCHAR2 DEFAULT '���������',
      town     IN   VARCHAR2 DEFAULT '������',
      street   IN   VARCHAR2 DEFAULT '���������������, 23�'*/
   )
      RETURN NUMBER;
  FUNCTION getRazdelIbText (pFK_PACID IN NUMBER, nStartID IN NUMBER, sCaption IN VARCHAR2, sDefault IN VARCHAR2)
    RETURN CLOB;
  FUNCTION getanambolIbText (pFK_PACID IN NUMBER)
    RETURN CLOB;
  function getFlurografText(pPacID in number) return clob;
  function getEKGText(ppacid in number) return clob;
  function getGinekologText(ppacid in number) return clob;

  -- Added by Kapustin A.V.
  function getResAnText(ppacid in number) return clob;
END;
/

SHOW ERRORS;


