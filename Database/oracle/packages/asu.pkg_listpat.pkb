DROP PACKAGE BODY ASU.PKG_LISTPAT
/

--
-- PKG_LISTPAT  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_LISTPAT" IS

--used in aVrachList.dpr & aNazMon.dpr Created by Nebary Modified by TimurLan
FUNCTION get_nazname(pVNazID IN NUMBER) RETURN VARCHAR2 IS
  sRes VARCHAR2(4000);
  nNaz NUMBER;
BEGIN
  SELECT fk_smid INTO nNaz FROM vnaz WHERE fk_id=pVNazID;
  sRes:=get_fullpath(nNaz);
  RETURN sRes;
END;

FUNCTION get_ispolnitelname(pVNazID IN NUMBER) RETURN VARCHAR2 IS
  sRes VARCHAR2(4000);
BEGIN
  SELECT tsotr.fc_fam||' '||DECODE(SUBSTR(tsotr.fc_name,0,1), NULL, '', SUBSTR(tsotr.fc_name,0,1)||'. ')||DECODE(SUBSTR(tsotr.fc_otch,0,1), NULL, '', SUBSTR(tsotr.fc_otch,0,1)||'. ') INTO sRes
    FROM tsotr, vnaz
   WHERE vnaz.fk_id=pVNazID
     AND tsotr.fk_id=vnaz.fk_ispolid;
  RETURN sRes;
END;

FUNCTION get_napravitname(pVNazID IN NUMBER) RETURN VARCHAR2 IS
  sRes VARCHAR2(4000);
BEGIN
  SELECT tsotr.fc_fam||' '||DECODE(SUBSTR(tsotr.fc_name,0,1), NULL, '', SUBSTR(tsotr.fc_name,0,1)||'. ')||DECODE(SUBSTR(tsotr.fc_otch,0,1), NULL, '', SUBSTR(tsotr.fc_otch,0,1)||'. ') INTO sRes
    FROM tsotr, vnaz
   WHERE vnaz.fk_id=pVNazID
     AND tsotr.fk_id=vnaz.fk_vrachid;
  RETURN sRes;
END;

FUNCTION get_datenaz(pVNazID IN NUMBER) RETURN VARCHAR2 IS
  sRes VARCHAR2(4000);
BEGIN
  SELECT TO_CHAR(fd_naz, 'DD.MM.YYYY') INTO sRes FROM vnaz WHERE fk_id=pVNazID;
  RETURN sRes;
END;

FUNCTION get_datevip(pVNazID IN NUMBER) RETURN VARCHAR2 IS
  sRes VARCHAR2(4000);
BEGIN
  SELECT TO_CHAR(fd_run, 'DD.MM.YYYY') INTO sRes FROM vnaz WHERE fk_id=pVNazID;
  RETURN sRes;
END;

FUNCTION get_vipsos(pVNazID IN NUMBER) RETURN VARCHAR2 IS
  sRes VARCHAR2(4000);
BEGIN
  SELECT tnazsos.fc_name INTO sRes FROM tnazsos, vnaz
   WHERE vnaz.fk_id=pVNazID
     AND tnazsos.fk_id=vnaz.fk_nazsosid;
  RETURN sRes;
END;

FUNCTION get_pacdiags_spec(pVNazID IN NUMBER) RETURN VARCHAR2 IS
  CURSOR cDiags(nPacid IN NUMBER, nVrachID IN NUMBER) IS
         SELECT tsmid.fc_name||' '||tdiag.fc_write, tdiag.fk_nazid FROM tdiag, tsmid
          WHERE tdiag.fp_type=4 --Диагноз специалиста
            AND tdiag.fk_pacid=nPacID
            AND tdiag.fk_vrachid=nVrachID
            AND tsmid.fk_id=tdiag.fk_smdiagid
          ORDER BY tdiag.fd_date, tdiag.fk_id;
  sRes     VARCHAR2(4000);
  sTmp     VARCHAR2(4000);
  nNaz     NUMBER;
  nPacID   NUMBER;
  nVrachID NUMBER;
BEGIN
  SELECT fk_pacid, fk_ispolid INTO nPacID, nVrachID FROM vnaz WHERE fk_id=pVNazID;
  OPEN cDiags(nPacID, nVrachID);
    FETCH cDiags INTO sRes, nNaz;
    IF cDiags%NOTFOUND THEN sRes:='Не поставлен'; END IF;
  CLOSE cDiags;
  RETURN(sRes);
END;

FUNCTION get_nazuet(pVNazID IN NUMBER) RETURN VARCHAR2 IS
  nRes      NUMBER;
  nChildAge NUMBER;
  nPacAge   NUMBER;
BEGIN
  SELECT fn_2 INTO nChildAge FROM tvozr WHERE fk_id=1;
  SELECT get_pacageonvyb(fk_pacid) INTO nPacAge FROM vnaz WHERE fk_id=pVNazID;
  IF nPacAge<=nChildAge THEN
    SELECT tsmid.fn_edchild INTO nRes FROM tsmid, vnaz
     WHERE vnaz.fk_id=pVNazID
       AND tsmid.fk_id=vnaz.fk_smid;
  ELSE
    SELECT tsmid.fn_ed INTO nRes FROM tsmid, vnaz
     WHERE vnaz.fk_id=pVNazID
       AND tsmid.fk_id=vnaz.fk_smid;
  END IF;
  RETURN nRes;
END;

FUNCTION get_mkb10_spec(pVNazID IN NUMBER) RETURN VARCHAR2 IS
  CURSOR cDiags(nPacid IN NUMBER, nVrachID IN NUMBER) IS
         SELECT tsmid.fk_mkb10 FROM tdiag, tsmid
          WHERE tdiag.fp_type=4 --Диагноз специалиста
            AND tdiag.fk_pacid=nPacID
            AND tdiag.fk_vrachid=nVrachID
            AND tsmid.fk_id=tdiag.fk_smdiagid
          ORDER BY tdiag.fd_date, tdiag.fk_id;
  sRes     VARCHAR2(4000);
  sTmp     VARCHAR2(4000);
  nPacID   NUMBER;
  nVrachID NUMBER;
BEGIN
  SELECT fk_pacid, fk_ispolid INTO nPacID, nVrachID FROM vnaz WHERE fk_id=pVNazID;
  OPEN cDiags(nPacID, nVrachID);
    FETCH cDiags INTO sRes;
    IF cDiags%NOTFOUND THEN sRes:=''; END IF;
  CLOSE cDiags;
  RETURN(sRes);
END;

FUNCTION get_vrachzakl(pVNazID IN NUMBER) RETURN VARCHAR2 IS
  CURSOR cZakl IS
        SELECT tib.fc_char FROM tib
         WHERE tib.fk_pacid=pVNazID
           AND tib.fk_smid in (SELECT TSMID.FK_ID ID FROM TSMID WHERE UPPER(FC_NAME) LIKE 'ЗАКЛЮЧЕНИЕ%' UNION SELECT TSMID.FK_OWNER ID FROM TSMID WHERE UPPER(FC_NAME) LIKE 'ЗАКЛЮЧЕНИЕ%');
  sRes VARCHAR2(32767);
BEGIN
  OPEN cZakl;
    FETCH cZakl INTO sRes;
    IF cZakl%NOTFOUND THEN sRes:='Нет данных'; END IF;
  CLOSE cZakl;
  RETURN PKG_REGIST_PACFUNC.REPLACE_SPACES(REPLACE(sRes,CHR(10),' '));
END;
/*#############################################################################################################################*/
FUNCTION GET_PATHID (id IN NUMBER) RETURN NUMBER IS
  CURSOR c1 IS
    SELECT fk_id
      FROM (SELECT fk_id, fk_owner
              FROM tsmid
             START WITH fk_id = id
             CONNECT BY PRIOR fk_owner = fk_id)
  ORDER BY ROWNUM desc;
  PathID number;
BEGIN
  OPEN c1;
  FETCH c1 INTO PathID;
  CLOSE c1;
  RETURN PathID;
END;

FUNCTION GET_VIPDATE(pVNazID IN NUMBER) RETURN DATE IS
  CURSOR cRes IS
    SELECT VRES.FD_INS
      FROM VRES
     WHERE VRES.FK_NAZID = pVNazID
       AND VRES.FK_SOS > 0
       AND TRUNC(VRES.FD_INS) = TRUNC(SYSDATE);
  CURSOR cNaz IS
    SELECT VNAZ.FD_RUN
      FROM VNAZ
     WHERE VNAZ.FK_ID = pVNazID;
  dDate DATE;
BEGIN
  OPEN cRes;
  FETCH cRes into dDate;
  CLOSE cRes;
  if dDate is null then
    OPEN cNaz;
    FETCH cNaz into dDate;
    CLOSE cNaz;
  end if;
  RETURN TRUNC(dDate);
END;

FUNCTION GET_NAZDATE(pVNazID IN NUMBER) RETURN DATE IS
  CURSOR cNaz IS
    SELECT VNAZ.FD_NAZ
      FROM VNAZ
     WHERE VNAZ.FK_ID = pVNazID;
  dDate DATE;
BEGIN
  OPEN cNaz;
  FETCH cNaz into dDate;
  CLOSE cNaz;
  RETURN TRUNC(dDate);
END;

FUNCTION GET_NAPRNAME(pVNazID IN NUMBER) RETURN VARCHAR2 IS
  CURSOR cNaz IS
    SELECT GET_SOTRNAME(VNAZ.FK_VRACHID)
      FROM VNAZ
     WHERE VNAZ.FK_ID = pVNazID;
  sRes VARCHAR2(32767);
BEGIN
  OPEN cNaz;
  FETCH cNaz into sRes;
  CLOSE cNaz;
  RETURN sRes;
END;

FUNCTION GET_ZAKL(pVNazID IN NUMBER) RETURN VARCHAR2 IS
  CURSOR cZakl IS
        SELECT VRES.FC_RES
          FROM VRES
         WHERE VRES.FK_NAZID=pVNazID
           AND GET_PATHID(VRES.FK_SMID) <> GET_ANALID;
  sRes VARCHAR2(32767);
BEGIN
  OPEN cZakl;
  FETCH cZakl INTO sRes;
  CLOSE cZakl;
  RETURN PKG_REGIST_PACFUNC.REPLACE_SPACES(REPLACE(NVL(sRes,''),CHR(10),' '));
END;

FUNCTION GET_COUNT_NAZ(pVNazID IN NUMBER) RETURN NUMBER IS
  CURSOR cNaz IS
        SELECT COUNT(VRES.FK_ID)
          FROM VRES
         WHERE VRES.FK_NAZID=pVNazID
           AND VRES.FK_SOS > 0;
  pNaz NUMBER;
BEGIN
  OPEN cNaz;
  FETCH cNaz INTO pNaz;
  CLOSE cNaz;
  RETURN pNaz;
END;

FUNCTION GET_COUNT_RES(pVNazID IN NUMBER) RETURN NUMBER IS
  CURSOR cRes IS
        SELECT COUNT(VRES.FK_ID)
          FROM VRES
         WHERE VRES.FK_NAZID=pVNazID
           AND VRES.FK_SOS = get_vipnaz;
  pRes NUMBER;
BEGIN
  OPEN cRes;
  FETCH cRes INTO pRes;
  CLOSE cRes;
  RETURN pRes;
END;

FUNCTION GET_NAZDOCNAME(pVNazID IN NUMBER) RETURN VARCHAR2 IS
  sRes VARCHAR2(32767);
  CURSOR cRes IS
    SELECT NVL(GET_SMIDNAME(TDOC.FK_DOCID),'Обращение') FROM TDOC WHERE FK_ID = (SELECT VNAZ.FK_DOCID FROM VNAZ WHERE FK_ID=pVNazID);
BEGIN
  OPEN cRes;
  FETCH cRes INTO sRes;
  CLOSE cRes;
  RETURN sRes;
END;
END;
/

SHOW ERRORS;


