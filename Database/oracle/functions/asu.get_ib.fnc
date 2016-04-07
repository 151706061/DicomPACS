DROP FUNCTION ASU.GET_IB
/

--
-- GET_IB  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   DOC_PROF_KARTA (Function)
--   TPROFP_DOG (Table)
--   TPROFP_LIST (Table)
--   TAMBULANCE (Table)
--   TDOCOBSL (Table)
--   TPERESEL (Table)
--   GET_MAXPERESELID (Function)
--   TKARTA (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_IB"
  ( pFK_PACID IN NUMBER)
  RETURN  VARCHAR2 IS
-- Modify   15.08.2006 by Nefedov S.M. for new generation number IB
-- Modify   19.02.2008 by Nefedov S.V. add join tdocobsl and tambulance
--Изменено 16/12/2013 (добавлено спец, нумерация для Карты профосмотра ASU.DOC_PROF_KARTA)
  CURSOR cTemp IS
  SELECT TO_CHAR(FK_IBID),FK_IBY, 1 as FL FROM TKARTA WHERE FK_ID=pFK_PACID
    UNION
  SELECT TO_CHAR(FK_IBID),FK_IBY, 2 as FL FROM TAMBULANCE WHERE FK_ID=pFK_PACID
    UNION
  SELECT TO_CHAR(TDOCOBSL.fk_numib),TDOCOBSL.fn_year, 3 as FL FROM TPERESEL, TDOCOBSL
  WHERE TPERESEL.fk_id=GET_MAXPERESELID(pFK_PACID)
    and TDOCOBSL.fk_id=TPERESEL.fk_docobslid
    UNION
  SELECT TO_CHAR(TDOCOBSL.fk_numib), TDOCOBSL.fn_year, 4 as FL FROM TAMBULANCE, TDOCOBSL
  WHERE TDOCOBSL.fk_id=TAMBULANCE.fk_docobsl
    and TAMBULANCE.FK_ID=pFK_PACID
    UNION
  SELECT tpd.fc_dognum, td.fk_numib, 5 as FL
  FROM ASU.TAMBULANCE ta INNER JOIN ASU.TDOCOBSL td
       ON td.fk_id = ta.fk_docobsl INNER JOIN ASU.TPROFP_LIST tl
       ON ta.fk_id = tl.fk_ambulanceid INNER JOIN ASU.TPROFP_DOG tpd
       ON tl.fk_dogid = tpd.fk_id
  WHERE ta.FK_ID = pFK_PACID
    AND td.fk_viddocid = ASU.DOC_PROF_KARTA
  order by FL desc;
  n NUMBER;
  id NUMBER;
  y NUMBER;
BEGIN
  OPEN cTemp;
  FETCH cTemp INTO id,y, n;
  CLOSE cTemp;
  if (id IS NULL) or (y is NULL) then
    RETURN '';
  end if;
  RETURN TO_CHAR(id)||'/'||TO_CHAR(Y);
END;
/

SHOW ERRORS;


DROP SYNONYM STAT.GET_IB
/

--
-- GET_IB  (Synonym) 
--
--  Dependencies: 
--   GET_IB (Function)
--
CREATE SYNONYM STAT.GET_IB FOR ASU.GET_IB
/


