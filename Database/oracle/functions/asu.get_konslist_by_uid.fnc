DROP FUNCTION ASU.GET_KONSLIST_BY_UID
/

--
-- GET_KONSLIST_BY_UID  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TNAZKONS (Table)
--   TAMBULANCE (Table)
--   TSMID (Table)
--   GET_SYNID (Function)
--
CREATE OR REPLACE FUNCTION ASU."GET_KONSLIST_BY_UID" (peopleID IN NUMBER, count_days IN NUMBER)
return VARCHAR2 is
  RESULT VARCHAR2(1000);
  FLAG BOOLEAN;
  kons_name VARCHAR2(100);
  kons_date DATE;
  CURSOR cKons (u_id NUMBER, days NUMBER) IS
    SELECT 
      NK.FD_RUN, -- Дата консультации
      NK.FC_NAME -- Вид консультации
    FROM
      ASU.TNAZKONS NK, -- Назначения
      (SELECT S.FK_ID FROM TSMID S WHERE FK_OWNER=ASU.GET_SYNID('KONS_SPEC')) SPEC, -- Консультации
      ASU.TAMBULANCE A -- Пациенты
    WHERE 
      NK.FK_SMID = SPEC.FK_ID
      AND NK.FK_NAZSOSID=1
      AND (SYSDATE-NK.FD_RUN)<days -- за последний год
      AND NK.FK_PACID=A.FK_ID
      AND A.FK_PEPLID=u_id;  
begin
  RESULT:='';
  FLAG:=FALSE;
  OPEN cKons(peopleID, count_days+1);
  LOOP
    FETCH cKons INTO kons_date, kons_name;
    EXIT WHEN cKons%NOTFOUND;
    IF FLAG THEN RESULT:=RESULT || ', ' || kons_name || '-' || TO_CHAR(kons_date,'DD.MM.YY');
    ELSE 
      RESULT:=kons_name || '-' || TO_CHAR(kons_date,'DD.MM.YY');
      FLAG:=TRUE;
    END IF;
  END LOOP;
  CLOSE cKons;  
  
  RETURN(RESULT);
end GET_KONSLIST_BY_UID;
/

SHOW ERRORS;


