DROP PACKAGE BODY ASU.PKG_REGIST_CLEAN
/

--
-- PKG_REGIST_CLEAN  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_REGIST_CLEAN" 
 IS
  -- Author  : TIMURLAN
  -- Created : 07.06.2001 9:55:07
  -- Purpose : ДЛЯ УБОРКИ ПАЛАТ УБОРЩИЦАМИ :)
Procedure START_MANUAL(pFK_PALATAID IN NUMBER, pFK_SOTRID IN NUMBER, pFL_AUTO IN NUMBER)
 IS
 PRAGMA AUTONOMOUS_TRANSACTION;
 CURSOR c (pID NUMBER)
  IS SELECT FK_ID FROM TCLEAN WHERE FL_DONE = -1 AND FK_PALATAID = pID;
 pFK_ID NUMBER;
 pFK_JOBID NUMBER;
 nTime NUMBER;
 dDate1 DATE; dDate2 DATE;
 str VARCHAR(300);
BEGIN
  nTime:=PKG_SMINI.READSTRING ('CONFIG', 'CLEAN_ROOM', '1');-- во избежание глюков не < минуты
  dDate1:=TRUNC(SYSDATE,'MI');
  dDate2:=dDate1 + nTime * 0.00069445;
  OPEN c (pFK_PALATAID);
  FETCH c into pFK_ID;
  str:='';
  IF c%NOTFOUND THEN-- если не запланировано
    if pFL_AUTO = 1 then
      -- add JOB !!!
      DBMS_JOB.SUBMIT(pFK_JOBID,null,dDate2,NO_PARSE => TRUE);
--      DBMS_JOB.BROKEN(pFK_JOBID,TRUE,null);
      str:='begin pkg_regist_clean.stop_auto(pfk_palataid => '||pFK_PALATAID||', pfk_jobid => '||pFK_JOBID||'); end;';
      DBMS_JOB.WHAT(pFK_JOBID,str);
--      DBMS_JOB.BROKEN(pFK_JOBID,FALSE,null);
      insert into TCLEAN (FK_PALATAID,FD_DATA1,FD_DATE2,FL_DONE,FK_SOTRID,FK_JOBID)
           values (pFK_PALATAID,dDate1,dDate2,0,pFK_SOTRID,pFK_JOBID);
    else
      insert into TCLEAN (FK_PALATAID,FD_DATA1,FD_DATE2,FL_DONE,FK_SOTRID)
           values (pFK_PALATAID,dDate1,dDate2,0,pFK_SOTRID);
    end if;
  ELSE
    if pFL_AUTO = 1 then
      -- add JOB !!!
      DBMS_JOB.SUBMIT(pFK_JOBID,null,dDate2,NO_PARSE => TRUE);
--      DBMS_JOB.BROKEN(pFK_JOBID,TRUE,null);
      str:='begin pkg_regist_clean.stop_auto(pfk_palataid => '||pFK_PALATAID||', pfk_jobid => '||pFK_JOBID||'); end;';
      DBMS_JOB.WHAT(pFK_JOBID,str);
--      DBMS_JOB.BROKEN(pFK_JOBID,FALSE,null);
      UPDATE TCLEAN
         SET FD_DATA1 = dDate1,
             FD_DATE2 = dDate2,
             FL_DONE = 0,
             FK_SOTRID = pFK_SOTRID,
             FK_JOBID = pFK_JOBID
       WHERE FK_ID = pFK_ID;
    else
      UPDATE TCLEAN
         SET FD_DATA1 = dDate1,
             FD_DATE2 = dDate2,
             FL_DONE = 0,
             FK_SOTRID = pFK_SOTRID
       WHERE FK_ID = pFK_ID;
    end if;
  END IF;
  CLOSE c;
  commit;
END;
---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------
Procedure STOP_MANUAL(pFK_PALATAID IN NUMBER, pFK_SOTRID IN NUMBER)
 IS
 PRAGMA AUTONOMOUS_TRANSACTION;
 CURSOR c
  IS SELECT FK_ID,FD_DATE2,FK_JOBID FROM TCLEAN WHERE FK_ID = (SELECT MIN(FK_ID) FROM TCLEAN WHERE FL_DONE = 0 AND FK_PALATAID = pFK_PALATAID);
 nFK_ID NUMBER;
 nFD_DATE2 DATE;
 nFK_JOBID NUMBER;
BEGIN
  OPEN c;
  FETCH c into nFK_ID,nFD_DATE2,nFK_JOBID;
  CLOSE c;
  -- delete job if it is
  if nFK_JOBID > 0 then
    DBMS_JOB.REMOVE (nFK_JOBID);
  end if;

  if nFD_DATE2 < SYSDATE then
    nFD_DATE2 := TRUNC(SYSDATE,'MI');
  end if;
  UPDATE TCLEAN
     SET FD_DATE2 = nFD_DATE2,
         FL_DONE = 1,
         FK_SOTRID = pFK_SOTRID,
         FK_JOBID = null
   WHERE FK_ID = nFK_ID;

  commit;
END;
---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------
Procedure STOP_AUTO(pFK_PALATAID IN NUMBER, pFK_JOBID IN NUMBER)
 IS
 PRAGMA AUTONOMOUS_TRANSACTION;
 CURSOR c (pID NUMBER)
  IS SELECT FK_ID/*,FK_JOBID*/ FROM TCLEAN WHERE FK_JOBID = pFK_JOBID/*FL_DONE = 0 AND FK_PALATAID = pID*/;
 pFK_ID NUMBER;
/* pFK_JOBID NUMBER;*/
BEGIN
  OPEN c (pFK_PALATAID);
  FETCH c into pFK_ID/*,pFK_JOBID*/;
  CLOSE c;
  -- delete job if it is
--  if pFK_JOBID > 0 then
--    DBMS_JOB.REMOVE (pFK_JOBID);
--  end if;
  UPDATE TCLEAN
     SET FL_DONE = 1,
         FK_JOBID = null
   WHERE FK_ID = pFK_ID;

  commit;
END;
---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------
Procedure ADD_AUTO(pFK_PACID IN NUMBER, pFD_DATA1 IN DATE)
 IS
 PRAGMA AUTONOMOUS_TRANSACTION;
 CURSOR c
  IS SELECT /*+ rule*/GET_PACPALATAID(pFK_PACID) FROM DUAL;
 CURSOR cExist /*+ rule*/(pFK_PALATAID NUMBER,pFD_DATE1 DATE,pFD_DATE2 DATE,pFL_DONE NUMBER)
  IS SELECT FK_ID FROM TCLEAN WHERE FK_PALATAID=pFK_PALATAID AND FD_DATA1=pFD_DATE1 AND FD_DATE2=pFD_DATE2 AND FL_DONE = pFL_DONE;
 nTime NUMBER;
 nEXIST NUMBER;
 pFK_PALATAID NUMBER;
 dDate1 DATE; dDate2 DATE;
BEGIN
  nTime:=PKG_SMINI.READSTRING ('CONFIG', 'CLEAN_ROOM', '1');-- во избежание глюков не < минуты
  dDate1:=TRUNC(pFD_DATA1,'MI');
  dDate2:=dDate1 + nTime * 0.00069445;
  open c;
  fetch c into pFK_PALATAID;
  close c;
--  if TRUNC(SYSDATE,'MI') < dDate1 then
    open cExist(pFK_PALATAID,dDate1,dDate2,-1);
    fetch cExist into nEXIST;
    if cExist%NOTFOUND then
      insert into TCLEAN (FK_PALATAID,FD_DATA1,FD_DATE2,FL_DONE,FK_SOTRID)
           values (pFK_PALATAID,dDate1,dDate2,-1,0);
    end if;
    close cExist;
/*  else
    open cExist(pFK_PALATAID,dDate1,dDate2,0);
    fetch cExist into nEXIST;
    if cExist%NOTFOUND then
      insert into TCLEAN (FK_PALATAID,FD_DATA1,FD_DATE2,FL_DONE,FK_SOTRID)
           values (pFK_PALATAID,dDate1,dDate2,0,0);
    end if;
    close cExist;
  end if;*/
/*  insert into TCLEAN (FK_PALATAID,FD_DATA1,FD_DATE2,FL_DONE,FK_SOTRID)
       values (pFK_PALATAID,dDate1,dDate2,-1,0);*/
  commit;
END;
---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------
Procedure ADD_MANUAL(pFK_PALATAID IN NUMBER, pFK_SOTRID IN NUMBER, pFD_DATA1 IN VARCHAR, pFD_DATA2 IN VARCHAR, pFL_AUTO IN NUMBER)
 IS
 PRAGMA AUTONOMOUS_TRANSACTION;
 dDate1 DATE; dDate2 DATE;
 nFL_DONE NUMBER;
 pFK_JOBID NUMBER;
 str VARCHAR(300);
BEGIN
/*  dDate1:=TRUNC(pFD_DATA1,'MI');
  dDate2:=TRUNC(pFD_DATA2,'MI');*/
  dDate1:=TO_DATE(pFD_DATA1,'DD.MM.YYYY HH24:MI');
  dDate2:=TO_DATE(pFD_DATA2,'DD.MM.YYYY HH24:MI');
  str:='';
  if SYSDATE > dDate1 then
    nFL_DONE := 0;
  else
    nFL_DONE := -1;
  end if;
  if pFL_AUTO = 1 then
    -- add JOB !!!
    DBMS_JOB.SUBMIT(pFK_JOBID,null,dDate2,NO_PARSE => TRUE);
    str:='begin pkg_regist_clean.stop_auto(pfk_palataid => '||pFK_PALATAID||', pfk_jobid => '||pFK_JOBID||'); end;';
    DBMS_JOB.WHAT(pFK_JOBID,str);
    insert into TCLEAN (FK_PALATAID,FD_DATA1,FD_DATE2,FL_DONE,FK_SOTRID,FK_JOBID)
         values (pFK_PALATAID,dDate1,dDate2,nFL_DONE,pFK_SOTRID,pFK_JOBID);
  else
    insert into TCLEAN (FK_PALATAID,FD_DATA1,FD_DATE2,FL_DONE,FK_SOTRID)
         values (pFK_PALATAID,dDate1,dDate2,nFL_DONE,pFK_SOTRID);
  end if;
  commit;
END;
---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------
Procedure EDIT_MANUAL(pFK_CLEANID IN NUMBER, pFK_PALATAID IN NUMBER, pFK_SOTRID IN NUMBER, pFD_DATA1 IN VARCHAR, pFD_DATA2 IN VARCHAR, pFL_AUTO IN NUMBER, pFK_JOBID IN NUMBER)
 IS
 PRAGMA AUTONOMOUS_TRANSACTION;
 CURSOR cJOB
  IS SELECT job from sys.dba_jobs where job = pFK_JOBID;
 dDate1 DATE; dDate2 DATE;
 nFL_DONE NUMBER;
 nFK_JOBID NUMBER;
 nTemp NUMBER;
 str VARCHAR(300);
BEGIN
  dDate1:=TO_DATE(pFD_DATA1,'DD.MM.YYYY HH24:MI');
  dDate2:=TO_DATE(pFD_DATA2,'DD.MM.YYYY HH24:MI');
  str:='';
  if SYSDATE > dDate1 then
    nFL_DONE := 0;
  else
    nFL_DONE := -1;
  end if;
  if pFL_AUTO = 1 then
    if  pFK_JOBID > 0 then
      DBMS_JOB.NEXT_DATE(JOB => pFK_JOBID,NEXT_DATE => dDate2);
      UPDATE TCLEAN
         SET FD_DATA1 = dDate1,
             FD_DATE2 = dDate2,
             FL_DONE = nFL_DONE,
             FK_SOTRID = pFK_SOTRID,
             FK_JOBID = pFK_JOBID
       WHERE FK_ID = pFK_CLEANID;
    else
      DBMS_JOB.SUBMIT(nFK_JOBID,null,dDate2,NO_PARSE => TRUE);
      str:='begin pkg_regist_clean.stop_auto(pfk_palataid => '||pFK_PALATAID||', pfk_jobid => '||nFK_JOBID||'); end;';
      DBMS_JOB.WHAT(nFK_JOBID,str);
      UPDATE TCLEAN
         SET FD_DATA1 = dDate1,
             FD_DATE2 = dDate2,
             FL_DONE = nFL_DONE,
             FK_SOTRID = pFK_SOTRID,
             FK_JOBID = nFK_JOBID
       WHERE FK_ID = pFK_CLEANID;
    end if;
  else
    if pFK_JOBID > 0 then
      open cJOB;
      fetch cJob into nTemp;
      if cJob%FOUND then
        DBMS_JOB.REMOVE(JOB => pFK_JOBID);
      end if;
      close cJob;
    end if;
    UPDATE TCLEAN
       SET FD_DATA1 = dDate1,
           FD_DATE2 = dDate2,
           FL_DONE = nFL_DONE,
           FK_SOTRID = pFK_SOTRID,
           FK_JOBID = null
     WHERE FK_ID = pFK_CLEANID;
  end if;
  commit;
END;
---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------
FUNCTION GET_SOST (pFK_ID IN NUMBER)
  RETURN NUMBER
IS
 CURSOR c1
  IS SELECT FL_DONE FROM TCLEAN WHERE FK_ID = pFK_ID AND FL_DONE <> -1;
 CURSOR c2
  IS SELECT -1 FROM TCLEAN WHERE FK_ID = pFK_ID AND FL_DONE = -1 AND FD_DATA1 > SYSDATE;
 CURSOR c3
  IS SELECT -10 FROM TCLEAN WHERE FK_ID = pFK_ID AND FL_DONE = -1 AND FD_DATA1 < SYSDATE;
 nTemp NUMBER;
BEGIN
  OPEN c1;
  FETCH c1 INTO nTemp;
  IF c1%NOTFOUND THEN
    OPEN c2;
    FETCH c2 INTO nTemp;
    IF c2%NOTFOUND THEN
      OPEN c3;
      FETCH c3 INTO nTemp;
      CLOSE c3;
    END IF;
    CLOSE c2;
  END IF;
  CLOSE c1;
  RETURN nTemp;
END;
End PKG_REGIST_CLEAN;
/

SHOW ERRORS;


