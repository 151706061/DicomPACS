DROP FUNCTION ASU.GET_GIVENTOPACMEDNAME
/

--
-- GET_GIVENTOPACMEDNAME  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TMEDICGIVEN (Table)
--   TMEDIC (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_GIVENTOPACMEDNAME" (pnazmedlechid IN NUMBER, pGivenDate IN DATE) RETURN VARCHAR2 IS
 -- Created 14122007 by A.Nakorjakov
 -- Функция возвращает название препарата, выданного пациенту по TNAZMEDLECH.FK_ID и дате выдачи
 pRes VARCHAR2(1000);
 IsFirst Number;
BEGIN
 pRes := '';
 IsFirst := 1;
 FOR C IN
     (select m.fc_name ||
             ' Кол-во: '||NVL(FN_KOL,0) fc_name
      from  asu.tmedicgiven mg,
            med.tmedic m
      where mg.fk_nazmedlechid = pnazmedlechid
            and mg.fk_medicgiven = m.medicid
            and trunc(mg.fd_given,'dd') = trunc(pGivenDate,'dd')) LOOP
     if (IsFirst = 1) then
        pRes := pRes || c.fc_name;
        IsFirst := 0;
     else
        pRes := pRes || CHR(13)||CHR(10)||c.fc_name;
     end if;
 END LOOP;
 RETURN pRes;
END;
/

SHOW ERRORS;


