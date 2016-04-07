DROP FUNCTION ASU.GET_PACPOL
/

--
-- GET_PACPOL  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TTYPETIME (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_PACPOL" ( POLID IN NUMBER)
  RETURN  VARCHAR2 IS
--
-- To modify this template, edit file FUNC.TXT in TEMPLATE
-- directory of SQL Navigator
--
-- Purpose: Briefly explain the functionality of the function
--
-- MODIFICATION HISTORY
-- Person      Date    Comments
-- ---------   ------  -------------------------------------------
s varchar2(4000);
cursor c is
 Select FC_NAME from Ttypetime where FK_ID = POLID;
BEGIN
    if POLID=-2 then
      RETURN 'Перерыв';
    end if;
    if POLID=-1 then
      RETURN 'Неизвестен';
    end if;
    if POLID=1 then
      RETURN 'Мужской';
    end if;
    if POLID=0 then
      RETURN 'Женский';
    end if;

    if POLID > 99 then
     OPEN C;
     FETCH C into s;
     close C;
     RETURN S;
    end if;

END; -- Function GET_PACPOL
/

SHOW ERRORS;


