DROP FUNCTION ASU.GET_PAC_SL_ADDR
/

--
-- GET_PAC_SL_ADDR  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBMS_OUTPUT (Synonym)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSMINI (Table)
--   TCOMPANY (Table)
--   TADRESS (Table)
--   PKG_REGIST_PACFUNC (Package)
--   PKG_SMINI (Package)
--   GET_INTOWN (Function)
--   GET_KLADR_SHORTADDR_BY_ID (Function)
--   GET_REGION (Function)
--   GET_STREET (Function)
--   GET_TOWN (Function)
--   IS_PAC_NATIVE (Function)
--
CREATE OR REPLACE FUNCTION ASU."GET_PAC_SL_ADDR" (pfk_pacid IN BINARY_INTEGER)
  RETURN VARCHAR2
-- Created 20060828 by Serg
  -- Функция возвращает адрес пациента (если местный то без страны и региона)
  ----------------------------------
  -- Modified by Spasskiy S.N.
  -- + КЛАДР
  -- + старые адреса: дописывать или нет адрес строкой зависит от настройки в TSMINI
  ----------------------------------
 IS
  REGID2      NUMBER;
  REGID1      NUMBER;
  COUNTRY2    NUMBER;
  COUNTRY1    NUMBER;
  KLADR       NUMBER;
  ADRID       NUMBER;
  ADDR        VARCHAR2(255);
  gHouse      TADRESS.FC_HOUSE%TYPE;
  gKorpus     TADRESS.FC_KORPUS%TYPE;
  gKvartira   TADRESS.FC_KVARTIRA%TYPE;
  l_stradress TADRESS.Fc_Adr%TYPE;
  RESULT      VARCHAR2(255);

  CURSOR C(pfk_adrid IN NUMBER) IS
    SELECT COALESCE(FK_COUNTRYID, -1979) COUNTRY,
           FK_REGIONID REGION,
           FK_KLADR,
           GET_TOWN(FK_TOWNID) || ' ' || GET_INTOWN(FK_INTOWNID) || ' ' ||
           GET_STREET(FK_STREETID) adr_str,
           FC_HOUSE,
           FC_KORPus,
           FC_KVARTIRA,
           fc_adr
      FROM TADRESS
     WHERE FK_ID = pfk_adrid; --GET_PAC_ADRID(PFK_PACID);

  CURSOR C1 IS
    SELECT C.FK_COUNTRYID, C.FK_REGIONID
      FROM TCOMPANY C
     WHERE C.FK_ID = (SELECT TO_NUMBER(I.FC_VALUE) ORGID
                        FROM TSMINI I
                       WHERE I.FC_KEY = 'SL_ORG');

  CURSOR C2(pfk_adrid IN NUMBER, ptype IN NUMBER) IS
    SELECT DECODE(ptype, 0, '', GET_REGION(FK_RAIONID)) || ' ' || -- 20060627 Serg убрал /*+ RULE*/
           GET_TOWN(FK_TOWNID) || ' ' || GET_INTOWN(FK_INTOWNID) || ' ' ||
           GET_STREET(FK_STREETID) || ' ' || FC_HOUSE || ' ' ||
           PKG_REGIST_PACFUNC.ADD_VALUE(FC_KORPUS, 'КОРП.', 'BEFORE') || ' ' ||
           PKG_REGIST_PACFUNC.ADD_VALUE(FC_KVARTIRA, 'КВ.', 'BEFORE') ADDR
      FROM TADRESS
     WHERE FK_ID = pfk_adrid;
  FUNCTION ADD_COMMA(pStr IN VARCHAR2, pPrefix IN VARCHAR2) RETURN VARCHAR2 IS
  BEGIN
    IF pStr IS NULL THEN
      RETURN pStr;
    ELSE
      RETURN pPrefix || '. ' || pStr || ', ';
    END IF;
  END;

BEGIN
  ADRID := PKG_REGIST_PACFUNC.GET_PAC_ADRID(pfk_pacid);
  
  OPEN C(ADRID);
  
  FETCH C
    INTO COUNTRY1, REGID1, KLADR, ADDR, gHouse, gKorpus, gKvartira, l_stradress;
  CLOSE C;

  IF nvl(KLADR, 0) <= 0 
  THEN
    OPEN C1;
    
    FETCH C1
      INTO COUNTRY2, REGID2;
    
    CLOSE C1;

    IF COUNTRY1 = COUNTRY2 
    THEN
      IF REGID1 = REGID2 
      THEN
        RESULT := ADDR || ' ' || ADD_COMMA(gHouse, 'д') ||
                  ADD_COMMA(gKorpus, 'корп') || ADD_COMMA(gKvartira, 'кв');
        dbms_output.put_line('1-a');
      ELSE
        RESULT := GET_REGION(REGID1) || ' ' || ADDR || ' ' ||
                  ADD_COMMA(gHouse, 'д') || ADD_COMMA(gKorpus, 'корп') ||
                  ADD_COMMA(gKvartira, 'кв');
        OPEN C2(ADRID, 1);
        
        dbms_output.put_line('2-a');
      END IF;
    ELSE
      RESULT := asu.PKG_REGIST_PACFUNC .GET_PAC_ADRFULL(pfk_pacid);
      dbms_output.put_line('4-a');
    END IF;
       
    IF ASU.PKG_SMINI.READSTRING('IBTITUL_LIST', 'IS_PRINT_POCHT_ADR', '1') = '1' 
    THEN
       if INSTR(RESULT, l_stradress) = 0
       THEN
            RESULT := RESULT || ' ' || l_stradress;
            dbms_output.put_line('3-a');
       END IF;
    END IF;
  ELSE
    IF IS_PAC_NATIVE(PFK_PACID) = 1 THEN
      RESULT := get_kladr_shortaddr_by_id(KLADR) || ' ' ||
                ADD_COMMA(gHouse, 'д') || ADD_COMMA(gKorpus, 'корп') ||
                ADD_COMMA(gKvartira, 'кв');
      dbms_output.put_line('5-a');
    ELSE
      RESULT := PKG_REGIST_PACFUNC.GET_PAC_ADRFULL(pfk_pacid);
      dbms_output.put_line('6-a');
    END IF;

  END IF;

  RETURN(PKG_REGIST_PACFUNC.REPLACE_SPACES(RESULT));
END;
/

SHOW ERRORS;


