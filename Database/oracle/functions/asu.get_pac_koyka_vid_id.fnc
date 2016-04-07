DROP FUNCTION ASU.GET_PAC_KOYKA_VID_ID
/

--
-- GET_PAC_KOYKA_VID_ID  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSRTIPROOM (Table)
--   TTIPROOM (Table)
--   TPERESEL (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_PAC_KOYKA_VID_ID" 
  ( pFK_PACID IN BINARY_INTEGER, pDate IN DATE)
  RETURN  NUMBER IS
-- Функция возвращает ID профиля койки пациента
-- MODIFICATION HISTORY
-- Person      Date    Comments
-- ---------   ------  -------------------------------------------
-- Nefedov S.M. 16.05.2006  Created this function
-- Nefedov S.M. 10.08.2006  Modyfied - trunc second
-- ---------   ------  -------------------------------------------
    CURSOR c IS
    SELECT FK_KOYKAVIDID from TPERESEL WHERE FK_PACID = pFK_PACID
                      --and FD_DATA1 <= pDate and FD_DATA2 >= pDate;
                      and to_date(to_char(FD_DATA1,'dd.mm.yyyy hh24.mi'), 'dd.mm.yyyy hh24.mi') <=to_date(to_char(pDate,'dd.mm.yyyy hh24.mi'), 'dd.mm.yyyy hh24.mi')
                      and to_date(to_char(FD_DATA2,'dd.mm.yyyy hh24.mi'), 'dd.mm.yyyy hh24.mi') >=to_date(to_char(pDate,'dd.mm.yyyy hh24.mi'), 'dd.mm.yyyy hh24.mi')
                      order by fk_id desc;
    CURSOR c1 IS
    SELECT FK_VIDID FROM TSRTIPROOM
    WHERE FK_PALATAID in (SELECT FK_KOYKAVIDID from TPERESEL WHERE FK_PACID = pFK_PACID
                            --and FD_DATA1 <= pDate and FD_DATA2 >= pDate)
                            and to_date(to_char(FD_DATA1,'dd.mm.yyyy hh24.mi'), 'dd.mm.yyyy hh24.mi') <=to_date(to_char(pDate,'dd.mm.yyyy hh24.mi'), 'dd.mm.yyyy hh24.mi')
                            and to_date(to_char(FD_DATA2,'dd.mm.yyyy hh24.mi'), 'dd.mm.yyyy hh24.mi') >=to_date(to_char(pDate,'dd.mm.yyyy hh24.mi'), 'dd.mm.yyyy hh24.mi')
                            )
            --AND pDate>=FD_DATA1
            AND to_date(to_char(pDate,'dd.mm.yyyy hh24.mi'), 'dd.mm.yyyy hh24.mi')>=to_date(to_char(FD_DATA1,'dd.mm.yyyy hh24.mi'), 'dd.mm.yyyy hh24.mi')
            --AND (pDate<=FD_DATA2 OR FD_DATA2 IS NULL) and FL_REMONT<1;
            AND (to_date(to_char(pDate,'dd.mm.yyyy hh24.mi'), 'dd.mm.yyyy hh24.mi')<=to_date(to_char(FD_DATA2,'dd.mm.yyyy hh24.mi'), 'dd.mm.yyyy hh24.mi')
                or to_date(to_char(FD_DATA2,'dd.mm.yyyy hh24.mi'), 'dd.mm.yyyy hh24.mi') IS NULL) and FL_REMONT<1;
                
    n ttiproom.FK_ID%type;
BEGIN
    open c;
    fetch c into n;
    close c;
    if NVL(n,0) = 0 THEN
        open c1;
        fetch c1 into n;
        close c1;
    end if;

    RETURN (NVL(n,0));
END;
/

SHOW ERRORS;


