DROP FUNCTION ASU.GET_PAC_FC_KOYKA_VID
/

--
-- GET_PAC_FC_KOYKA_VID  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TTIPROOM (Table)
--   TPERESEL (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_PAC_FC_KOYKA_VID" 
  ( pFK_PACID IN BINARY_INTEGER, pDate IN DATE)
  RETURN  VARCHAR2 IS
-- Функция возвращает название профиля койки пациента
-- MODIFICATION HISTORY
-- Person      Date    Comments
-- ---------   ------  -------------------------------------------
-- Nefedov S.M. 15.05.2006  Created this function 
-- ---------   ------  -------------------------------------------
    CURSOR c
     IS
    SELECT /*+ rule*/FC_VID
        FROM TTIPROOM
       WHERE FK_ID in (SELECT FK_KOYKAVIDID from TPERESEL WHERE FK_PACID = pFK_PACID
                      and FD_DATA1 <= pDate and FD_DATA2 >= pDate);
    n ttiproom.fc_vid%type;
BEGIN 
    open c;
    fetch c into n;
    --raise_application_error(-20003, to_char(pDate, 'dd.mm.yyyy hh.mi.ss'));
    close c;
    --raise_application_error(-20003,n);
    RETURN (NVL(n,'Не выбран'));
END;
/

SHOW ERRORS;


