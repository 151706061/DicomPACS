------------------------------------------------------------------------------------------------------
Функция GET_DOC (добавить блок обработки ASU.DOC_AMBUL_ONKO):
------------------------------------------------------------------------------------------------------

       -- АМБУЛАТОРНАЯ ИСТОРИЯ БОЛЕЗНИ (ОНКО)
     FOR D IN (SELECT fk_id FROM asu.tuslvid WHERE fk_id=c.fk_id CONNECT BY PRIOR fk_id=fk_ownerid START WITH fk_id=ASU.DOC_AMBUL_ONKO) LOOP
      nRes:=16;
     END LOOP;





------------------------------------------------------------------------------------------------------
Функция SET_FST (добавить обработку карты 16 вызовом STAT.GET_FO25_04_ONKO):
------------------------------------------------------------------------------------------------------

FUNCTION SET_FST(pFK_PACID NUMBER,pfk_razid NUMBER,nChSum OUT NUMBER, pRegistration NUMBER DEFAULT 0) RETURN CLOB IS
   clTemp CLOB;
   nGosp  NUMBER;
   nTemp NUMBER;
 BEGIN
  nChSum := -1;

  DBMS_LOB.CREATETEMPORARY(clTemp, TRUE, DBMS_LOB.CALL);
  nGosp := GET_DOC(pFK_PAcid);
  IF ( nGosp = 13 and pRegistration = 1) THEN
     nTemp := -1;
  ELSE
     nTemp := nGosp;
  END IF;
  sTmp  := '<RAZFST ID="' || TO_CHAR(pfk_RazId) || '" >' || CR ||
           '<EV TYP="FST" T="' || TO_CHAR(nTemp) || '" RAZID="' ||
           TO_CHAR(pfk_RazId) || '" SHOW="1">';

  DBMS_LOB.writeappend(clTemp, LENGTH(sTmp), sTmp);
 -- SELECT COUNT(fk_id) INTO nTmp FROM tambulance WHERE fk_id = pFK_PACID;
  IF nGosp >= 0 and not ( nGosp = 13 and pRegistration = 1) and not (nGosp = 16)
  THEN
    IF nGosp = 7
    THEN
      DBMS_LOB.append(clTemp, stat.get_donor_kart(pFk_pacid));
    ELSE
      DBMS_LOB.append(clTemp, stat.GET_IB_FIRST(pFk_pacid, nGosp));
    END IF;
  ELSE
    sTmp := ' <EVSRES><![CDATA[';
    DBMS_LOB.writeappend(clTemp, LENGTH(sTmp), sTmp);
    --  FOR C IN (SELECT fk_peplid FROM tambulance WHERE fk_id=pFk_pacid) LOOP
    --sTmp := GET_FO25_04(pFk_pacid);
    if (nGosp = 16) then
       DBMS_LOB.append(clTemp, GET_FO25_04_ONKO(pFk_pacid, pRegistration));
    else
       DBMS_LOB.append(clTemp, GET_FO25_04(pFk_pacid, pRegistration));
    end if;
    sTmp := ']]></EVSRES>' || CR;
    DBMS_LOB.writeappend(clTemp, LENGTH(sTmp), sTmp);
    --    END LOOP;
  END IF;
  sTmp := '</EV>' || CR || '</RAZFST>' || CR;
  DBMS_LOB.writeappend(clTemp, LENGTH(sTmp), sTmp);

  RETURN clTemp;
 END;





------------------------------------------------------------------------------------------------------