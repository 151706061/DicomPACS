DROP FUNCTION ASU.GET_LABACCUMINFO_HTML
/

--
-- GET_LABACCUMINFO_HTML  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBMS_LOB (Synonym)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   GET_SOTRNAME (Function)
--   TNAZAN (Table)
--   TLABLOT_ACCUM (Table)
--   TLABLOT_PARAM (Table)
--   TLABREG (Table)
--   TLABREG_ACCUM (Table)
--   TRESAN (Table)
--   PKG_REGIST_PACFUNC (Package)
--   GET_NAZSOS (Function)
--   GET_RESULT_VALUE (Function)
--   GET_SMIDNAME (Function)
--
CREATE OR REPLACE FUNCTION ASU."GET_LABACCUMINFO_HTML" (pFK_ID IN NUMBER, pFN_PROBE IN NUMBER) RETURN  CLOB IS
    CURSOR cLot IS SELECT T2.FC_NAME,
                          DECODE(T1.FK_SOS, 0, 'Заполняется', 1, 'Отработан') FC_SOS,
                          T1.FD_BEGIN,
                          T1.FD_END,
                          LOGIN.GET_SOTRNAME(T1.FK_SOTRID) FC_SOTR,
                          GET_SMIDNAME(T1.FK_SMID)
                   FROM TLABLOT_ACCUM T1,
                        TLABLOT_PARAM T2
                   WHERE T1.FK_LOTACCUM = T2.FK_ID
                         AND T1.FK_ID = pFK_ID;

    CURSOR cPac IS SELECT PKG_REGIST_PACFUNC.GET_PAC_FULLFIO(T2.FK_PACID) FC_FIO,
                          T3.FN_PROBE,
                          TO_CHAR(T1.FD_REGIST, 'dd.mm.yyyy') FC_DATE,
                          LOGIN.GET_SOTRNAME(T1.FK_SOTRID) FC_SOTRFIO,
                          GET_NAZSOS(T5.FK_NAZSOSID) FC_NAZSOS,
                          GET_RESULT_VALUE(T1.FK_NAZID, T4.FK_SMID)FC_RESULT
                   FROM TLABREG_ACCUM T1,
                        TNAZAN T2,
                        TLABREG T3,
                        TRESAN T4,
                        TNAZAN T5
                   WHERE T1.FK_LOT_ACCUME = pFK_ID
                        AND T1.FN_PROBE = pFN_PROBE
                        AND T1.FK_NAZID = T2.FK_ID
                        AND T3.FK_ID = T1.FK_LABREG
                        AND T4.FK_NAZID(+) = T1.FK_NAZID
                        AND T4.FL_ZAKL(+) = 0
                        AND T5.FK_ID = T1.FK_NAZID;
  clTemp  CLOB;
  sHtml   LONG;
  -- Штатив
  FC_NAME VARCHAR(200);
  FC_SOS VARCHAR(20);
  FD_BEGIN DATE;
  FD_END DATE;
  FC_SOTRID VARCHAR(100);
  FC_SMIDNAME VARCHAR(255);
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
   FETCH cLot INTO FC_NAME, FC_SOS, FD_BEGIN, FD_END, FC_SOTRID, FC_SMIDNAME;
   CLOSE cLot;
   sHtml := '<B>Штатив: </B> ' || FC_NAME ||  CHR(13);
   sHtml := sHtml || '<BR><B>Назначение: </B> ' || FC_SMIDNAME || CHR(13);
   sHtml := sHtml || '<BR><B>Дата начала: </B> ' || FD_BEGIN || CHR(13);
   IF FD_END IS NOT NULL THEN
     sHtml := sHtml || '<BR><B>Дата окончания: </B> ' || FD_END || CHR(13);
   END IF;
   sHtml := sHtml || '<BR><B>Открыл сотрудник: </B> ' || FC_SOTRID || CHR(13);
   sHtml := sHtml || '<BR><B>Состояние: </B> ' || FC_SOS || CHR(13);

   DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sHtml),sHtml);

   OPEN cPac;
   FETCH cPac INTO FC_FIO, FN_PROBE, FC_DATE, FC_SOTRFIO, FC_NAZSOS, FC_RESULT;
   CLOSE cPac;


   IF FC_FIO IS NOT NULL THEN
     sHtml :=  '<BR><BR><B>----------------------------</B></BR>';
     sHtml := sHtml || '<BR><B>Ячейка: </B> ' || TO_CHAR(pFN_PROBE) || CHR(13);
     sHtml := sHtml || '<BR><B>Пациент: </B> ' || FC_FIO || CHR(13);
     sHtml := sHtml || '<BR><B>№ Пробы: </B> ' || FN_PROBE || CHR(13);
     sHtml := sHtml || '<BR><B>Дата регистрации в штативе: </B> ' || FC_DATE || CHR(13);
     sHtml := sHtml || '<BR><B>Результат: </B> ' || FC_RESULT || CHR(13);
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


