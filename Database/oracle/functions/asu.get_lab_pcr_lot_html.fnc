DROP FUNCTION ASU.GET_LAB_PCR_LOT_HTML
/

--
-- GET_LAB_PCR_LOT_HTML  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBMS_LOB (Synonym)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   GET_SOTRNAME (Function)
--   TNAZAN (Table)
--   TLABREG (Table)
--   TLAB_PCR_LOT (Table)
--   TLAB_PCR_REGIST (Table)
--   PKG_REGIST_PACFUNC (Package)
--   GET_NAZSOS (Function)
--   GET_NAZ_CANCEL (Function)
--   GET_SMIDNAME (Function)
--   GET_SMIDOWNER (Function)
--   GET_VIPNAZ (Function)
--
CREATE OR REPLACE FUNCTION ASU."GET_LAB_PCR_LOT_HTML" 
(pFK_ID IN NUMBER, pFN_PROBE IN NUMBER) RETURN  CLOB IS
    CURSOR cLot IS SELECT GET_SMIDNAME(GET_SMIDOWNER(FK_SMID)) || ' - ' || GET_SMIDNAME(FK_SMID) FC_SMID,
                          FC_NAME
                   FROM TLAB_PCR_LOT a
                   WHERE a.FK_ID = pFK_ID;

    CURSOR cPac IS SELECT PKG_REGIST_PACFUNC.GET_PAC_FIO(b.FK_PACID) FC_PACFIO,
                          c.FN_PROBE,
                          TO_CHAR(c.FD_REGIST, 'dd.mm.yyyy') FC_DATE,
                          LOGIN.GET_SOTRNAME(a.FK_SOTRID) FC_SOTRFIO,
                          GET_NAZSOS(b.FK_NAZSOSID) FC_NAZSOS
                   FROM TLAB_PCR_REGIST a,
                        TNAZAN b,
                        TLABREG c
                   WHERE b.FK_NAZSOSID != GET_VIPNAZ
                         AND b.FK_NAZSOSID != GET_NAZ_CANCEL
                         AND a.FK_NAZID = b.FK_ID
                         AND c.FK_NAZID = b.FK_ID
                         AND a.FK_LOTID = pFK_ID
                         AND a.FN_PLACE = pFN_PROBE;
  clTemp  CLOB;
  sHtml   LONG;
  -- Штатив
  FC_NAME VARCHAR(200);
  FC_SMID VARCHAR(200);
--  FC_SOS VARCHAR(20);
--  FD_BEGIN DATE;
--  FD_END DATE;
--  FC_SOTRID VARCHAR(100);
--  FC_SMIDNAME VARCHAR(255);
  -- Пациент
  FC_FIO VARCHAR(100);
  FN_PROBE VARCHAR(10);
  FC_DATE VARCHAR(10);
  FC_SOTRFIO VARCHAR(100);
  FC_NAZSOS VARCHAR(20);
  FC_RESULT VARCHAR(50);
BEGIN
   DBMS_LOB.CREATETEMPORARY(clTemp, FALSE);
   OPEN cLot;
   FETCH cLot INTO FC_SMID, FC_NAME;
   CLOSE cLot;
   sHtml := '<B>Штатив: </B> ' || FC_NAME ||  CHR(13);
   sHtml := sHtml || '<BR><B>Назначение: </B> ' || FC_SMID || CHR(13);

   DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);

   OPEN cPac;
   FETCH cPac INTO FC_FIO, FN_PROBE, FC_DATE, FC_SOTRFIO, FC_NAZSOS;
   CLOSE cPac;


   IF FC_FIO IS NOT NULL THEN
     sHtml :=  '<BR><BR><B>----------------------------</B></BR>';
     sHtml := sHtml || '<BR><B>Ячейка: </B> ' || TO_CHAR(pFN_PROBE) || CHR(13);
     sHtml := sHtml || '<BR><B>Пациент: </B> ' || FC_FIO || CHR(13);
     sHtml := sHtml || '<BR><B>№ Пробы: </B> ' || FN_PROBE || CHR(13);
     sHtml := sHtml || '<BR><B>Дата регистрации в штативе: </B> ' || FC_DATE || CHR(13);
 --    sHtml := sHtml || '<BR><B>Результат: </B> ' || FC_RESULT || CHR(13);
     sHtml := sHtml || '<BR><B>Состояние: </B> ' || FC_NAZSOS || CHR(13);
     sHtml := sHtml || '<BR><B>Сотрудник: </B> ' || FC_SOTRFIO  || CHR(13);
   ELSIF pFN_PROBE = 0 THEN
     sHtml := '';
   ELSE
    sHtml := '<BR><BR><B>----------------------------</B></BR>';
    sHtml := sHtml || '<BR><B>Ячейка: </B> ' || TO_CHAR(pFN_PROBE);
    sHtml := sHtml || '<BR>'|| 'Ячейка пуста';
   END IF;
   DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);

   RETURN clTemp ;
--EXCEPTION
--   WHEN exception_name THEN
--       statements ;
END;
/

SHOW ERRORS;


