DROP FUNCTION ASU.GET_IS_OPER_IN_TIME
/

--
-- GET_IS_OPER_IN_TIME  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TIB (Table)
--   TSMID (Table)
--   GET_VIPNAZ (Function)
--   VNAZ (Table)
--
CREATE OR REPLACE FUNCTION ASU.GET_IS_OPER_IN_TIME (pfk_pacid IN NUMBER, pdata1 DATE, pdata2 DATE) RETURN VARCHAR2 IS
-- Efimov V.A. 20130221 Возвращает 1 если для пациента pfk_pacid в период с pdata1 по pdata2 была выполнена операция, иначе 0
-- http://192.168.1.9/redmine/issues/21836
  vfk_pacid number(15);
 BEGIN
   SELECT max(n.fk_pacid)
     into vfk_pacid
    FROM ASU.VNAZ N
   INNER JOIN (SELECT TS.FK_ID
                FROM ASU.TSMID TS
               WHERE (FL_DEL <> 1 OR FL_DEL IS NULL)
                 AND TS.FC_SYNONIM IN ('KONS_PROTHOPER', 'RENTGENXIR_OPER', 'ABORT', 'UROLOG_OPER')) TSM ON TSM.FK_ID = N.FK_SMID
   WHERE N.FK_NAZSOSID = ASU.GET_VIPNAZ
     and n.fk_pacid = pfk_pacid
     and (SELECT I.FD_DATE -- decode(I.FD_DATE, NULL, to_date(FC_CHAR, 'DD.MM.YYYY HH24:MI:SS'), I.FD_DATE)
            FROM ASU.TIB I
           WHERE I.FK_SMID IN (SELECT TS.FK_ID
                                 FROM ASU.TSMID TS
                                WHERE (FL_DEL <> 1 OR FL_DEL IS NULL)
                                  AND TS.FC_SYNONIM IN ('PROTHOPER_OKON'))
             AND I.FK_PACID = N.FK_ID) between pdata1 and pdata2;

  if vfk_pacid is null then
    RETURN 0;
  else
    RETURN 1;
  end if;
 END;
/

SHOW ERRORS;


