DROP PACKAGE ASU.PKG_WORKDAYS
/

--
-- PKG_WORKDAYS  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_WORKDAYS" 
  IS

  PROCEDURE setworkday (p_date IN DATE, p_l IN NUMBER, p_safely BOOLEAN := FALSE);
  PROCEDURE yearfill (p_year IN INTEGER);
  function isWorkday(p_date IN Date) return number;
  PRAGMA RESTRICT_REFERENCES(isWorkday,WNDS,WNPS);
  procedure checkfill_year(p_date IN DATE);
  function workdays_between(p_d1 IN Date, p_d2 IN Date)  return number;
  PRAGMA RESTRICT_REFERENCES(workdays_between,WNDS,WNPS);
  FUNCTION previous_workday (p_d IN DATE)
   RETURN DATE;
  PRAGMA RESTRICT_REFERENCES(previous_workday,WNDS,WNPS);
  FUNCTION next_workday (p_d IN DATE)
   RETURN DATE;
  PRAGMA RESTRICT_REFERENCES(next_workday,WNDS,WNPS);
END; -- Package spec
/

SHOW ERRORS;


