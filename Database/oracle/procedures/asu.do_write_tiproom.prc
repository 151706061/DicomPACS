DROP PROCEDURE ASU.DO_WRITE_TIPROOM
/

--
-- DO_WRITE_TIPROOM  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBMS_STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSRTIPROOM (Table)
--
CREATE OR REPLACE PROCEDURE ASU."DO_WRITE_TIPROOM" 
   (pFK_ID IN NUMBER,pFK_PALATAID IN NUMBER,pFN_MESTA IN NUMBER,pFK_VIDID IN NUMBER,pFD_DATA1 IN DATE)
   IS
  CURSOR cTemp IS SELECT /*+ rule*/ MAX(FK_ID) FROM TSRTIPROOM WHERE FK_PALATAID=pFK_PALATAID AND FK_ID<pFK_ID;
  dTemp DATE;
  nPrevID NUMBER;
  nTemp NUMBER;
BEGIN
  if pFN_MESTA<=0 then
    raise_application_error(-20025,'Не указано количество свободных мест!');
  end if;
  if pFK_VIDID<=0 then
    raise_application_error(-20026,'Не указан вид палаты!');
  end if;
  if pFD_DATA1 IS NULL then
    raise_application_error(-20027,'Не указаны дата изменения данных о палата!');
  end if;
  OPEN cTemp;
  FETCH cTemp INTO nPrevID;
  CLOSE cTemp;
  SELECT COUNT(FK_ID) INTO nTemp FROM TSRTIPROOM WHERE FK_ID=nPrevID;
  if nTemp>0 then
--    raise_application_error(-20027,TO_CHAR(nPrevID));
    SELECT /*+rule*/FD_DATA1 INTO dTemp FROM TSRTIPROOM WHERE FK_ID=nPrevID;
    if dTemp>=pFD_DATA1 then
      raise_application_error(-20028,'Новая дата изменения данных не может быть меньше предыдущей!');
    end if;
    UPDATE TSRTIPROOM SET FD_DATA2=pFD_DATA1-1 WHERE FK_ID=nPrevID;
  end if;
  UPDATE TSRTIPROOM SET FN_MESTA=pFN_MESTA,FK_VIDID=pFK_VIDID,FD_DATA1=pFD_DATA1,FD_DATA2=NULL WHERE FK_ID=pFK_ID;
END; -- Procedure
/

SHOW ERRORS;


