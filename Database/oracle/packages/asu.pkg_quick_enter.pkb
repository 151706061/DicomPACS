DROP PACKAGE BODY ASU.PKG_QUICK_ENTER
/

--
-- PKG_QUICK_ENTER  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_QUICK_ENTER" 
IS-- Modified by TimurLan
--------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------
  PROCEDURE DO_SET_VRACH(pFK_ID IN NUMBER,pFK_VRACHID IN NUMBER,pFK_DALID IN NUMBER) IS
  PRAGMA AUTONOMOUS_TRANSACTION;
  BEGIN
    UPDATE TVRACH SET FK_VRACHID=pFK_VRACHID,FK_DALID=pFK_DALID WHERE FK_PACID=pFK_ID AND FL_VID='M';
    COMMIT;
  END;
---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------
  function CREATE_PACIENT(pFK_IB OUT VARCHAR2, pFK_USLVIDID in number) RETURN NUMBER IS
  PRAGMA AUTONOMOUS_TRANSACTION;
  i NUMBER;
  nIBID NUMBER;
  nSrokID BINARY_INTEGER;
  nTemp number;
  nDocObslID number;
  BEGIN
--    INSERT INTO TKARTA(FK_ID) VALUES(-1) RETURNING FK_ID INTO i;
--    pFK_IB:=GET_IB(i);
--    IF pFK_IB=0 or pFK_IB IS NULL THEN
      /*SELECT MAX(FK_IBID)+1 INTO nIBID FROM TKARTA WHERE
        FK_IBY=TO_CHAR(TRUNC(SYSDATE),'YYYY');
      IF nIBID is NULL then
        nIBID:=1;
      end IF;*/ --Commented by KOsov 19.04.2010 --закоментировал, т.к. новер ИБ беру через функию SET_NewIBNum с передачей вида документции
      nTemp := 0;
      nDocObslID:=asu.SET_NewIBNum(pFK_USLVIDID,nTemp);
      pFK_IB:=nTemp||'/'||TO_CHAR(TRUNC(SYSDATE),'YYYY');

      insert into TDocObsl (fk_viddocid,fk_numib,fn_year) values (pFK_USLVIDID,nTemp,TO_CHAR(TRUNC(SYSDATE),'YYYY'))
        RETURNING FK_ID INTO nDocObslID;

      --pFK_IB:=nIBID||'/'||TO_CHAR(TRUNC(SYSDATE),'YYYY');  --Commented by KOsov 19.04.2010 --
      INSERT INTO TKARTA(FK_ID,FK_IBID,FK_IBY) VALUES(-1,nIBID,TO_CHAR(TRUNC(SYSDATE),'YYYY')) RETURNING FK_ID INTO i;--last edit
--    END IF;
    EXECUTE IMMEDIATE 'ALTER TRIGGER TKARTA_BEFORE_UPDATE DISABLE';
    EXECUTE IMMEDIATE 'ALTER TRIGGER TKARTA_AFTER_UPDATE DISABLE';
--                                         23:59:59
    DO_ADD_PLANS(i,TRUNC(SYSDATE,'MI'),TRUNC(TRUNC(SYSDATE,'MI')+1)-1/(24*60),TRUNC(TRUNC(SYSDATE,'MI')+1)-1/(24*60),1,0,0);
    DO_ADD_FAKTS(i,TRUNC(SYSDATE,'MI'),TRUNC(TRUNC(SYSDATE,'MI')+1)-1/(24*60),TRUNC(TRUNC(SYSDATE,'MI')+1)-1/(24*60),1,0,0,-1);
    --nSrokID := -1;
    --DO_WRITE_SROK(nSrokID/*-1*/,i,SYSDATE,TRUNC(SYSDATE)+1-0.00001,TRUNC(SYSDATE)+1-0.00001,1,1,0,-1,0,-1);
    --nSrokID:=-1;
    --DO_WRITE_SROK(nSrokID/*-1*/,i,SYSDATE,TRUNC(SYSDATE)+1-0.00001,TRUNC(SYSDATE)+1-0.00001,1,2,0,-1,0,-1);
    EXECUTE IMMEDIATE 'ALTER TRIGGER TKARTA_BEFORE_UPDATE ENABLE';
    EXECUTE IMMEDIATE 'ALTER TRIGGER TKARTA_AFTER_UPDATE ENABLE';

--    DO_WRITE_SROK(-1,i,TRUNC(SYSDATE),TRUNC(SYSDATE)+1,TRUNC(SYSDATE)+1,1,1,0,-1,0,-1);
--    DO_WRITE_SROK(-1,i,TRUNC(SYSDATE),TRUNC(SYSDATE)+1,TRUNC(SYSDATE)+1,1,2,0,-1,0,-1);
    COMMIT;
    RETURN i;
  END;
---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------
  PROCEDURE DELETE_PACIENT(pFK_ID IN NUMBER) IS
  PRAGMA AUTONOMOUS_TRANSACTION;
  begin
    DELETE FROM TKARTA WHERE FK_ID=pFK_ID;
    COMMIT;
  end;
---------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------
/**********************************************************************************************/ -- Added by Kosov
/**********************************************************************************************/
  PROCEDURE DELETE_PEOPLE(pFK_PeplID IN NUMBER) IS
    PRAGMA AUTONOMOUS_TRANSACTION;
  begin
--    bDONT_DELETE_IB := TRUE;
    DELETE FROM TPEOPLES WHERE FK_ID = pFK_PeplID;
--    bDONT_DELETE_IB := FALSE;
    COMMIT;
  end;
  /**********************************************************************************************/
  /**********************************************************************************************/
---------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------
  procedure SAVE_PACIENT(pFK_ID IN NUMBER,pFC_FAM IN VARCHAR2,pFC_IM IN VARCHAR2,pFC_OTCH IN VARCHAR2,
                         pFK_IBID IN NUMBER,pFK_IBY IN NUMBER,pFK_PALATAID IN NUMBER,pFK_VRACHID IN NUMBER,
                         pFP_SEX IN NUMBER,pFD_ROJD IN DATE,pFK_DALID IN NUMBER) IS
  PRAGMA AUTONOMOUS_TRANSACTION;
  CURSOR c(pID NUMBER) IS SELECT MAX(FK_ID) FROM TSROKY WHERE FK_PACID=pID;
  nPeplID NUMBER;
  nAdrID NUMBER;
  nTemp NUMBER;
  BEGIN
    INSERT INTO TPeoples(Fc_Fam,Fc_Im,Fc_Otch,Fp_Sex,Fd_Rojd)
    VALUES (pFC_FAM,pFC_IM,pFC_OTCH,pFP_SEX,pFD_ROJD)
    RETURNING FK_ID INTO nPeplID;
    UPDATE TKARTA
    SET FC_FAM=pFC_FAM,FC_IM=pFC_IM,FC_OTCH=pFC_OTCH,FK_IBID=pFK_IBID,FK_IBY=pFK_IBY,FP_SEX=pFP_SEX,FD_ROJD=pFD_ROJD,FP_TEK_COC=2,FK_PEPLID=nPeplID
    WHERE FK_ID=pFK_ID;
    if PKG_SMINI.READSTRING ('CONFIG', 'B_USE_DEFAULT', 0) = 1 then
      SELECT COUNT(FK_ID) INTO nTemp FROM TVIDDOC WHERE FL_DEFAULT=1;
      if nTemp = 1 then
        SELECT FK_ID INTO nTemp FROM TVIDDOC WHERE FL_DEFAULT=1;
        Update TPeoples set Fk_Docvid = nTemp WHERE FK_ID = nPeplID;
      end if;
      SELECT COUNT(FK_ID) INTO nTemp FROM TTIPROOM WHERE FL_DEFAULT=1;
      if nTemp = 1 then
        SELECT FK_ID INTO nTemp FROM TTIPROOM WHERE FL_DEFAULT=1;
        Update TKARTA set FK_PUTTYPE = nTemp WHERE FK_ID = pFK_ID;
      end if;
      SELECT COUNT(FK_ID) INTO nTemp FROM TVID WHERE FL_DEFAULT=1;
      if nTemp = 1 then
        SELECT FK_ID INTO nTemp FROM TVID WHERE FL_DEFAULT=1;
        Update TKARTA set FK_KOD2 = nTemp WHERE FK_ID = pFK_ID;
      end if;
      SELECT COUNT(FK_ID) INTO nTemp FROM TCOC_POL WHERE FL_DEFAULT=1;
      if nTemp = 1 then
        SELECT FK_ID INTO nTemp FROM TCOC_POL WHERE FL_DEFAULT=1;
        Update TKARTA set FK_COC_POLID = nTemp WHERE FK_ID = pFK_ID;
      end if;
      SELECT COUNT(FK_ID) INTO nTemp FROM TPACVID WHERE FL_DEFAULT=1;
      if nTemp = 1 then
        SELECT FK_ID INTO nTemp FROM TPACVID WHERE FL_DEFAULT=1;
        Update TKARTA set FK_PACVID = nTemp WHERE FK_ID = pFK_ID;
      end if;
      SELECT COUNT(FK_ID) INTO nTemp FROM TGROUP WHERE FL_DEFAULT=1;
      if nTemp = 1 then
        SELECT FK_ID INTO nTemp FROM TGROUP WHERE FL_DEFAULT=1;
        Update TKARTA set FK_GROUPID = nTemp WHERE FK_ID = pFK_ID;
      end if;
      SELECT COUNT(FK_ID) INTO nTemp FROM TPRIZN WHERE FL_DEFAULT=1;
      if nTemp = 1 then
        SELECT FK_ID INTO nTemp FROM TPRIZN WHERE FL_DEFAULT=1;
        Update TKARTA set FK_PRIZN = nTemp WHERE FK_ID = pFK_ID;
      end if;
      SELECT COUNT(FK_ID) INTO nTemp FROM TADRTYPE WHERE FL_DEFAULT=1;
      if nTemp = 1 then
        SELECT FK_ID INTO nTemp FROM TADRTYPE WHERE FL_DEFAULT=1;
        INSERT INTO TADRESS (FK_TYPE,FK_PACID)
                    VALUES (nTemp,nPeplID)
                    RETURNING FK_ID INTO nAdrID;
        SELECT COUNT(FK_ID) INTO nTemp FROM TCOUNTRY WHERE FL_DEFAULT=1;
        if nTemp = 1 then
          SELECT FK_ID INTO nTemp FROM TCOUNTRY WHERE FL_DEFAULT=1;
          Update TADRESS set FK_COUNTRYID = nTemp WHERE FK_ID = nAdrID;
        end if;
        SELECT COUNT(FK_ID) INTO nTemp FROM TREGION WHERE FL_DEFAULT=1;
        if nTemp = 1 then
          SELECT FK_ID INTO nTemp FROM TREGION WHERE FL_DEFAULT=1;
          Update TADRESS set FK_REGIONID = nTemp WHERE FK_ID = nAdrID;
        end if;
        SELECT COUNT(FK_ID) INTO nTemp FROM TTOWN WHERE FL_DEFAULT=1;
        if nTemp = 1 then
          SELECT FK_ID INTO nTemp FROM TTOWN WHERE FL_DEFAULT=1;
          Update TADRESS set FK_TOWNID = nTemp WHERE FK_ID = nAdrID;
        end if;
        SELECT COUNT(FK_ID) INTO nTemp FROM TRAION WHERE FL_DEFAULT=1;
        if nTemp = 1 then
          SELECT FK_ID INTO nTemp FROM TRAION WHERE FL_DEFAULT=1;
          Update TADRESS set FK_RAIONID = nTemp WHERE FK_ID = nAdrID;
        end if;
        SELECT COUNT(FK_ID) INTO nTemp FROM TINTOWN WHERE FL_DEFAULT=1;
        if nTemp = 1 then
          SELECT FK_ID INTO nTemp FROM TINTOWN WHERE FL_DEFAULT=1;
          Update TADRESS set FK_INTOWNID = nTemp WHERE FK_ID = nAdrID;
        end if;
        SELECT COUNT(FK_ID) INTO nTemp FROM TSTREET WHERE FL_DEFAULT=1;
        if nTemp = 1 then
          SELECT FK_ID INTO nTemp FROM TSTREET WHERE FL_DEFAULT=1;
          Update TADRESS set FK_STREETID = nTemp WHERE FK_ID = nAdrID;
        end if;
      end if;
    end if;
    OPEN c(pFK_ID);
    FETCH c INTO nTemp;
    CLOSE c;
    DELETE FROM TPERESEL WHERE FK_PACID=pFK_ID;
    DO_WRITE_PERESEL( -1,pFK_ID,SYSDATE,TRUNC(SYSDATE)+1-0.00001/*+1*/,pFK_PALATAID,nTemp);
    Update TVRACH
           SET FK_VRACHID=pFK_VRACHID,
               FK_DALID=pFK_DALID
           WHERE FK_PACID=pFK_ID AND FL_VID='M';
    COMMIT;
  END;
-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
  FUNCTION LOAD_PACIENT(pFK_ID IN NUMBER,pFC_FAM OUT VARCHAR2,pFC_IM OUT VARCHAR2,pFC_OTCH OUT VARCHAR2,pFK_IB OUT VARCHAR2,
                         pFK_PALATAID OUT NUMBER,pFK_VRACHID OUT NUMBER,pFP_SEX OUT NUMBER,pFD_ROJD OUT DATE) RETURN NUMBER IS
  CURSOR c(pID NUMBER) IS SELECT FK_ID,FC_FAM,FC_IM,FC_OTCH,FK_IBID,FP_SEX,FD_ROJD,GET_IB(FK_ID) FROM TKARTA WHERE FK_ID=pID;
  CURSOR cV(pID NUMBER) IS SELECT FK_VRACHID FROM TVRACH WHERE FK_PACID=pID AND FL_VID='M';
  CURSOR cp(pID NUMBER) IS SELECT FK_PALATAID FROM TPERESEL WHERE FK_PACID=pID;

  CURSOR cIB(pSotrID NUMBER) is select u.fk_id as uslid
                           from asu.totdel_typedoc tot, login.totdel o, asu.tuslvid u,login.tsotr s, login.tappsotr ap
                          where tot.fk_otdelid = o.fk_id
                            and tot.fk_typedoc = u.fk_id
                            and tot.fk_otdelid = s.fk_otdelid
                            and ap.fk_sotrid = s.fk_id
                            and ap.fk_id = pSotrID
                            and u.fl_default = 1;   --Added by Kosov 19.04.2010

  n NUMBER;
  i NUMBER;
  nIBID NUMBER:=0;
  nUslVid NUMBER;  --Added by Kosov 19.04.2010
  BEGIN
    OPEN cV(pFK_ID);
    FETCH cV INTO pFK_VRACHID;
    CLOSE cV;

    OPEN cIB(pFK_VRACHID);
    FETCH cIB INTO nUslVid;
    CLOSE cIB;

    OPEN c(pFK_ID);
    FETCH c INTO i,pFC_FAM,pFC_IM,pFC_OTCH,nIBID,pFP_SEX,pFD_ROJD,pFK_IB;
    IF c%NOTFOUND THEN
      i:=CREATE_PACIENT(pFK_IB,nUslVid); --Added by Kosov 19.04.2010
    ELSE
      /*OPEN cV(pFK_ID);
      FETCH cV INTO pFK_VRACHID;
      CLOSE cV;*/
      OPEN cP(pFK_ID);
      FETCH cP INTO pFK_PALATAID;
      CLOSE cP;
    END IF;
    CLOSE c;
    IF nIBID=0 or nIBID IS NULL THEN
      SELECT MAX(FK_IBID)+1 INTO nIBID FROM TKARTA WHERE
        FK_IBY=TO_CHAR(TRUNC(SYSDATE),'YYYY');
      IF nIBID is NULL then
        nIBID:=1;
      end IF;
      pFK_IB:=nIBID||'/'||TO_CHAR(TRUNC(SYSDATE),'YYYY');
      PKG_PACIENT.DO_WRITE_IB(pFK_ID,nIBID,TO_CHAR(TRUNC(SYSDATE),'YYYY'));
    END IF;
    RETURN i;
  END;
END; -- Package Body PKG_QUICK_ENTER
/

SHOW ERRORS;


