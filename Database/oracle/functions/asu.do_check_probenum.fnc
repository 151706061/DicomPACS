DROP FUNCTION ASU.DO_CHECK_PROBENUM
/

--
-- DO_CHECK_PROBENUM  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TLABREG (Table)
--   TSMID_RIGHTS (Table)
--   GET_SMIDFROMNAZ (Function)
--
CREATE OR REPLACE FUNCTION ASU."DO_CHECK_PROBENUM" (pFK_PACID  IN BINARY_INTEGER,
                                             pFK_NAZID  IN BINARY_INTEGER, -- <-- not used!!!
                                             pFN_PROBE  IN BINARY_INTEGER,
                                             pFD_REGIST IN DATE,
                                             pFK_SOTRID IN BINARY_INTEGER,
                                             pFC_DATE   IN VARCHAR2,
                                             pFN_ACCESS IN BINARY_INTEGER,
                                             pFN_LOT    IN BINARY_INTEGER DEFAULT NULL,
                                             pFN_ROW    IN BINARY_INTEGER DEFAULT NULL,
                                             pFC_DATELOT   IN VARCHAR2 DEFAULT NULL,
                                             pFN_ACCESSLOT IN BINARY_INTEGER DEFAULT NULL)
  RETURN NUMBER IS
  -- Created by TimurLan
  CURSOR c1L IS
    SELECT COUNT(FK_ID)
      FROM TLABREG
     WHERE FK_DEFAULT = pFN_LOT
       AND FK_PLACE = pFN_ROW
       AND TRUNC(FD_REGIST) = TRUNC(pFD_REGIST)
       AND FK_PACID <> pFK_PACID;
  CURSOR c1 IS
    SELECT COUNT(FK_ID)
      FROM TLABREG
     WHERE FN_PROBE = pFN_PROBE
       AND TRUNC(FD_REGIST) = TRUNC(pFD_REGIST)
       AND FK_PACID <> pFK_PACID;--GET_PACID_FROM_NAZID(pFK_NAZID);
  CURSOR c1Next IS
    SELECT NVL(MAX(FN_PROBE),0)+1
      FROM TLABREG
     WHERE TRUNC(FD_REGIST) = TRUNC(pFD_REGIST)
       AND FK_PACID <> pFK_PACID;--GET_PACID_FROM_NAZID(pFK_NAZID);
  CURSOR c2L IS
    SELECT COUNT(FK_ID)
      FROM TLABREG
     WHERE FK_DEFAULT = pFN_LOT
       AND FK_PLACE = pFN_ROW
       AND TRUNC(FD_REGIST) = TRUNC(pFD_REGIST)
       AND FK_PACID <> pFK_PACID
       AND EXISTS (SELECT FK_ID
                     FROM TSMID_RIGHTS
                    WHERE FK_SOTRID = pFK_SOTRID
                      AND FK_SMID = GET_SMIDFROMNAZ(FK_NAZID));
  CURSOR c2 IS
    SELECT COUNT(FK_ID)
      FROM TLABREG
     WHERE FN_PROBE = pFN_PROBE
       AND TRUNC(FD_REGIST) = TRUNC(pFD_REGIST)
       AND FK_PACID <> pFK_PACID--GET_PACID_FROM_NAZID(pFK_NAZID)
       AND EXISTS (SELECT FK_ID
                     FROM TSMID_RIGHTS
                    WHERE FK_SOTRID = pFK_SOTRID
                      AND FK_SMID = GET_SMIDFROMNAZ(FK_NAZID));
  CURSOR c2Next IS
    SELECT NVL(MAX(FN_PROBE),0)+1
      FROM TLABREG
     WHERE TRUNC(FD_REGIST) = TRUNC(pFD_REGIST)
       AND FK_PACID <> pFK_PACID--GET_PACID_FROM_NAZID(pFK_NAZID)
       AND EXISTS (SELECT FK_ID
                     FROM TSMID_RIGHTS
                    WHERE FK_SOTRID = pFK_SOTRID
                      AND FK_SMID = GET_SMIDFROMNAZ(FK_NAZID));
  CURSOR c3L(pDate IN DATE) IS
    SELECT COUNT(FK_ID)
      FROM TLABREG
     WHERE FK_DEFAULT = pFN_LOT
       AND FK_PLACE = pFN_ROW
       AND TRUNC(FD_REGIST) >= pDate
       AND FK_PACID <> pFK_PACID;--GET_PACID_FROM_NAZID(pFK_NAZID);
  CURSOR c3(pDate IN DATE) IS
    SELECT COUNT(FK_ID)
      FROM TLABREG
     WHERE FN_PROBE = pFN_PROBE
       AND TRUNC(FD_REGIST) >= pDate
       AND FK_PACID <> pFK_PACID;--GET_PACID_FROM_NAZID(pFK_NAZID);
  CURSOR c3Next(pDate IN DATE) IS
    SELECT NVL(MAX(FN_PROBE),0)+1
      FROM TLABREG
     WHERE FN_PROBE = pFN_PROBE
       AND TRUNC(FD_REGIST) >= pDate
       AND FK_PACID <> pFK_PACID;--GET_PACID_FROM_NAZID(pFK_NAZID);
  CURSOR c4L(pDate IN DATE) IS
    SELECT COUNT(FK_ID)
      FROM TLABREG
     WHERE FK_DEFAULT = pFN_LOT
       AND FK_PLACE = pFN_ROW
       AND TRUNC(FD_REGIST) >= pDate
       AND FK_PACID <> pFK_PACID--GET_PACID_FROM_NAZID(pFK_NAZID)
       AND EXISTS (SELECT FK_ID
                     FROM TSMID_RIGHTS
                    WHERE FK_SOTRID = pFK_SOTRID
                      AND FK_SMID = GET_SMIDFROMNAZ(FK_NAZID));
  CURSOR c4(pDate IN DATE) IS
    SELECT COUNT(FK_ID)
      FROM TLABREG
     WHERE FN_PROBE = pFN_PROBE
       AND TRUNC(FD_REGIST) >= pDate
       AND FK_PACID <> pFK_PACID--GET_PACID_FROM_NAZID(pFK_NAZID)
       AND EXISTS (SELECT FK_ID
                     FROM TSMID_RIGHTS
                    WHERE FK_SOTRID = pFK_SOTRID
                      AND FK_SMID = GET_SMIDFROMNAZ(FK_NAZID));
  CURSOR c4Next(pDate IN DATE) IS
    SELECT NVL(MAX(FN_PROBE),0)+1
      FROM TLABREG
     WHERE FN_PROBE = pFN_PROBE
       AND TRUNC(FD_REGIST) >= pDate
       AND FK_PACID <> pFK_PACID--GET_PACID_FROM_NAZID(pFK_NAZID)
       AND EXISTS (SELECT FK_ID
                     FROM TSMID_RIGHTS
                    WHERE FK_SOTRID = pFK_SOTRID
                      AND FK_SMID = GET_SMIDFROMNAZ(FK_NAZID));
       --AND GET_SMIDFROMNAZ(FK_NAZID) = GET_SMIDFROMNAZ(pFK_NAZID);
       /*AND EXISTS (SELECT FK_ID
                     FROM TSMID_RIGHTS
                    WHERE FK_SOTRID = pFK_SOTRID
                      AND FK_SMID = GET_SMIDFROMNAZ(FK_NAZID))*/
  dTemp DATE;
  Result NUMBER(2,1) := 0;
  ResultLot NUMBER(2,1) := 0;
BEGIN
  if pFC_DATE is null or pFN_ACCESS is null then --≈—À» Õ≈“ œ¿–¿Ã≈“–Œ¬ œ–Œ¬≈– » - “¿ Œ√Œ ¡€“‹ Õ≈ ÃŒ∆≈“ ÕŒ ¬—≈-“¿ »..
    RETURN Result;
  end if;
  if pFN_PROBE < 0 then -- ≈—À» Œ“–»÷¿“≈À‹Õ€…, “Œ √≈Õ≈–»Ã ÕŒ¬”ﬁ œ–Œ¡”...
    if pFC_DATE = 'SYSDATE' and pFN_ACCESS = 0 then
      open c1Next;
      fetch c1Next into Result;
      close c1Next;
      if Result < ABS(pFN_PROBE) then
        Result := ABS(pFN_PROBE);
      end if;
      RETURN Result;
    elsif pFC_DATE = 'SYSDATE' and pFN_ACCESS = 1 then
      open c2Next;
      fetch c2Next into Result;
      close c2Next;
      if Result < ABS(pFN_PROBE) then
        Result := ABS(pFN_PROBE);
      end if;
      RETURN Result;
    elsif pFC_DATE <> 'SYSDATE' and pFN_ACCESS = 0 then
      dTemp:=TO_DATE(pFC_DATE,'DD.MM.YYYY');
      open c3Next(dTemp);
      fetch c3Next into Result;
      close c3Next;
      if Result < ABS(pFN_PROBE) then
        Result := ABS(pFN_PROBE);
      end if;
      RETURN Result;
    elsif pFC_DATE <> 'SYSDATE' and pFN_ACCESS = 1 then
      dTemp:=TO_DATE(pFC_DATE,'DD.MM.YYYY');
      open c4Next(dTemp);
      fetch c4Next into Result;
      close c4Next;
      if Result < ABS(pFN_PROBE) then
        Result := ABS(pFN_PROBE);
      end if;
      RETURN Result;
    end if;
  else-- »Õ¿◊≈ - ‘”Õ ÷»ﬂ œ–Œ¬≈– »...
    if pFC_DATE = 'SYSDATE' and pFN_ACCESS = 0 then
      open c1;
      fetch c1 into Result;
      close c1;
      --RETURN Result;
    elsif pFC_DATE = 'SYSDATE' and pFN_ACCESS = 1 then
      open c2;
      fetch c2 into Result;
      close c2;
      --RETURN Result;
    elsif pFC_DATE <> 'SYSDATE' and pFN_ACCESS = 0 then
      dTemp:=TO_DATE(pFC_DATE,'DD.MM.YYYY');
      open c3(dTemp);
      fetch c3 into Result;
      close c3;
      --RETURN Result;
    elsif pFC_DATE <> 'SYSDATE' and pFN_ACCESS = 1 then
      dTemp:=TO_DATE(pFC_DATE,'DD.MM.YYYY');
      open c4(dTemp);
      fetch c4 into Result;
      close c4;
      --RETURN Result;
    end if;
  end if;
  if pFN_LOT > 0 then-- ≈—À» ” ¿«¿Õ ÀŒ“ “Œ œ–Œ¬≈–ﬂ≈Ã » ≈√Œ...
    if pFC_DATELOT = 'SYSDATE' and pFN_ACCESSLOT = 0 then
      open c1L;
      fetch c1L into ResultLot;
      close c1L;
      RETURN (Result + ResultLot * 0.1);
    elsif pFC_DATELOT = 'SYSDATE' and pFN_ACCESSLOT = 1 then
      open c2L;
      fetch c2L into ResultLot;
      close c2L;
      RETURN (Result + ResultLot * 0.1);
    elsif pFC_DATELOT <> 'SYSDATE' and pFN_ACCESSLOT = 0 then
      dTemp:=TO_DATE(pFC_DATELOT,'DD.MM.YYYY');
      open c3L(dTemp);
      fetch c3L into ResultLot;
      close c3L;
      RETURN (Result + ResultLot * 0.1);
    elsif pFC_DATELOT <> 'SYSDATE' and pFN_ACCESSLOT = 1 then
      dTemp:=TO_DATE(pFC_DATELOT,'DD.MM.YYYY');
      open c4L(dTemp);
      fetch c4L into ResultLot;
      close c4L;
      RETURN (Result + ResultLot * 0.1);
    end if;
  end if;
  /*open c;
  fetch c into Result;
  close c;*/
  RETURN Result;
  EXCEPTION WHEN OTHERS THEN NULL;
  RETURN Result;
END;
/

SHOW ERRORS;


