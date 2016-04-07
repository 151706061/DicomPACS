DROP PACKAGE BODY ASU.PKG_PRINTCODES
/

--
-- PKG_PRINTCODES  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_PRINTCODES" is


  procedure ADD_LASTNUM(pFD_DATE     in date,
                        pFN_LASTNUM  in number) IS
  /*Aiaaaeyai aaoo e iiia? iineaaiae ?ania?aoaiiie i?iau a TPRINTCODES*/
  BEGIN
    UPDATE TPRINTCODES SET FN_LASTNUM=pFN_LASTNUM WHERE TRUNC(FD_DATE, 'YYYY')=TRUNC(pFD_DATE, 'YYYY');
    IF SQL%Rowcount=0 THEN
      INSERT INTO TPRINTCODES(FK_ID,
                            FD_DATE,
                            FN_LASTNUM)
           VALUES            (SEQ_TPRINTCODES.nextval,
                            TRUNC(pFD_DATE, 'YYYY'),
                            pFN_LASTNUM);
    END IF;
  END ADD_LASTNUM;

  procedure DELETE_NUM(pFK_ID    in number) IS
  /*??????? ????? ?? TPRINTCODES*/
  BEGIN
   DELETE FROM TPRINTCODES
     WHERE FK_ID=pFK_ID;
  END DELETE_NUM;

  function GET_LASTNUM(pFD_DATE  in date) return number IS
  /*???????? ????? ????????? ????????????? ????? ? ????????? ??? ?? ??????? TPRINTCODES*/
    vFN_LASTNUM NUMBER(8) :=0;
  BEGIN
   SELECT NVL(MAX(FN_LASTNUM), 0)
     INTO vFN_LASTNUM
     FROM TPRINTCODES
     WHERE TRUNC(FD_DATE, 'YYYY')=TRUNC(pFD_DATE, 'YYYY');

   RETURN vFN_LASTNUM;

  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      return 0;
  END GET_LASTNUM;

  function can_print(pFD_DATE   in date,
                     pFN_PROBA  in number)return number IS
  /*?-?? ????????? ????? ?? ??????????? ????? ? ??????? pFN_PROBA ? ????? pFD_DATE
    ??????????: 1 - ????? ????????
                0 - ?????? ????????, ????? ????? ?????*/
  /*  CURSOR c is
      SELECT COUNT(TLABREG.FK_ID)
        FROM TLABREG, TNAZAN
        WHERE FN_PROBE = :FN_PROBE
          AND TLABREG.FK_NAZID = TNAZAN.FK_ID
          AND TNAZAN.FK_NAZSOSID = GET_NAZ_PROCESS
          AND TRUNC(FD_REGIST) <> TRUNC(:FD_DATE) */
  BEGIN
    return 1;
  END can_print;


begin
NULL;
end PKG_PRINTCODES;
/

SHOW ERRORS;


