DROP FUNCTION ASU.GET_NAZONTIME
/

--
-- GET_NAZONTIME  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   VRES (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_NAZONTIME" (PNAZID IN VRES.FK_PACID%TYPE, PDATE IN DATE, PTIME IN VARCHAR2, PNAZKRATINDAY IN INTEGER) RETURN INTEGER IS
  RESULT INTEGER := 0;
  BTIMEISDEFAULT BOOLEAN := FALSE;
  NKRAT INTEGER := PNAZKRATINDAY;
  NREALNAZTIMECNT INTEGER := 0;
  CURSOR CUR1 IS 
                SELECT * FROM VRES 
                 WHERE FK_NAZID = PNAZID 
                   AND FD_INS = PDATE+(TO_DATE(PTIME,'HH24:MI')-TRUNC(TO_DATE(PTIME,'HH24:MI')));
 FETCHCUR1 CUR1%ROWTYPE;                  
BEGIN
  --т-ъ бнгбпюыюер 0 - мю дюммне бпелъ мер мюгмювемхъ; 1- мюгмювемхе еярэ мю бпелъ; 2-бпелъ он слнквюмхч дкъ йпюрмнярх мюгмювемхъ;
  /*CREATED BY ZAG*/
  -- "0"-нрясрярбсер,"1"-бшонкемн,"2"-ме бшонкемн,"3"-DEFAULT-бпювю(ме бшонкемн),
  --нрлерйх-бпелемх дкъ мюгмювемхъ
  IF NKRAT IS NULL THEN
    NKRAT := 1;
  END IF;
  OPEN CUR1;
  FETCH CUR1 INTO FETCHCUR1;  
  IF CUR1%NOTFOUND THEN
    BEGIN
      --онксвхрэ наыее вхякн ъбмн гюонкмеммшу мюгмювемхи мю демэ мю кчане бпелъ, врнаш ме бшбндхрэ DEFAULT-цюкйх        
      SELECT COUNT(*) INTO NREALNAZTIMECNT FROM VRES
       WHERE FK_NAZID = PNAZID
         AND TRUNC(FD_INS) = PDATE
         AND FD_INS <> TRUNC(FD_INS); --р.е FD_INS наъгюрекэмн яндепфхр бпелъ б дюре(дпнамсч вюярэ) 
      /*еякх бпелъ ъбкъеряъ бпелемхл он слнквюмхч дкъ йпюрмнярх --х мер ъбмшу гюохяеи мю дпсцне бпелъ мю рейсыее вхякн дкъ мюгмювемхъ
      , рн бшдюрэ RESULT-2*/
      IF NREALNAZTIMECNT > 0 THEN
        RETURN(0);
      END IF; 
      IF NKRAT = 1 THEN
        BEGIN
          IF PTIME IN ('10:00') THEN
            BTIMEISDEFAULT := TRUE;
          END IF; 
        END;   
      ELSIF NKRAT = 2 THEN    
        BEGIN
          IF PTIME IN ('10:00','20:00') THEN
            BTIMEISDEFAULT := TRUE;
          END IF;        
        END;
      ELSIF NKRAT = 3 THEN
        BEGIN
          IF PTIME IN ('10:00','13:00','20:00') THEN
            BTIMEISDEFAULT := TRUE;
          END IF;        
        END;
      ELSIF NKRAT = 4 THEN
        BEGIN
          IF PTIME IN ('10:00','13:00','16:00','20:00') THEN
            BTIMEISDEFAULT := TRUE;
          END IF;        
        END;
      ELSIF NKRAT = 5 THEN
        BEGIN
          IF PTIME IN ('10:00','13:00','15:00','17:00','20:00') THEN
            BTIMEISDEFAULT := TRUE;
          END IF;        
        END;  
      ELSIF NKRAT = 6 THEN
        BEGIN
          IF PTIME IN ('10:00','13:00','15:00','17:00','20:00','22:00') THEN
            BTIMEISDEFAULT := TRUE;
          END IF;        
        END;
      END IF;
      IF BTIMEISDEFAULT THEN
        RESULT := 3;
      END IF;
    END;                   
  ELSE
    RESULT := FETCHCUR1.FK_SOS;
  END IF;
  IF CUR1%ISOPEN THEN
    CLOSE CUR1;
  END IF;
  
  RETURN(RESULT);
END GET_NAZONTIME;
/

SHOW ERRORS;


