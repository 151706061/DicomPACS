DROP FUNCTION ASU.GET_IMG_ID_BY_NAZ_DMEDNAZ
/

--
-- GET_IMG_ID_BY_NAZ_DMEDNAZ  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TNAZMED (Table)
--   TFREQUENCY (Table)
--   TNAZMED_PROLONG (Table)
--   GET_NAZURGENT (Function)
--   GET_RECOMEND (Function)
--   GET_VIPNAZ (Function)
--
CREATE OR REPLACE FUNCTION ASU.get_img_id_by_naz_dmednaz
-- Voronov 27.04.2009
-- ������� ���������� ����� �������� �� dMedNaz.dll frmMain.iType (TImageList)
-- �������� ����� �� �������� ��� ��� � �������.
-- ���������� -1 � ������ ����� ��� ���������� �� ������� ���������� ������
-- ���������� ���������������� � asu.get_img_descr_by_id_dmednaz
-- Melnikov 2015.02.19 ������� ������ ����� �������, ��� ����� ������� ������
  ( aCurDate DATE,
    aNaz_fk_State NUMBER,
    aSpisDate DATE,
    aNaz_fd_begin DATE,
    aNaz_fd_cancel DATE,
    aNazmedID NUMBER
     )
  RETURN NUMBER DETERMINISTIC IS

  FUNCTION getCntNazFreq RETURN NUMBER IS
  res NUMBER;--Melnikov 2015.02.19*/
  CURSOR c IS
  SELECT COUNT(*)
  FROM (SELECT  trunc(N.FD_BEGIN + (CASE WHEN N.fn_mnog > 1 THEN (LEVEL - 1) ELSE (LEVEL - 1) * (1 / N.fn_mnog) END),'mi') as FD_NAZ_DATE
          FROM (SELECT N.*, F.FN_MNOG FROM asu.tnazmed N, ASU.TFREQUENCY  F
                 WHERE N.FK_FREQUENCYID = F.fk_id
                   AND N.FK_ID = aNazmedID
                   AND F.FN_MNOG > 0) N
        CONNECT BY LEVEL-1 < N.Fn_Duration
        UNION
        -- ���������
        SELECT  trunc(N.FD_BEGIN + (CASE WHEN N.fn_mnog > 1 THEN (LEVEL - 1) ELSE (LEVEL - 1) * (1 / N.fn_mnog) END),'mi') as FD_NAZ_DATE
          FROM (SELECT P.FD_BEGIN, P.FN_DURATION, F.FN_MNOG FROM asu.tnazmed N, asu.tnazmed_prolong P, ASU.TFREQUENCY  F
                 WHERE N.FK_FREQUENCYID = F.fk_id
                   AND p.fk_nazmedid = N.FK_ID
                   AND N.FK_ID = aNazmedID
                   AND F.FN_MNOG > 0) N
        CONNECT BY LEVEL-1 < N.Fn_Duration)
   WHERE FD_NAZ_DATE = aCurDate;
  BEGIN
  OPEN c;
  FETCH c INTO res;
  IF c%NOTFOUND THEN res := 0; END IF;
  CLOSE c;
  RETURN res;
  END;

 --Melnikov 2015.02.19*/nCnt NUMBER;
BEGIN
 /* OPEN c;
  FETCH c INTO nCnt;
  CLOSE c;--Melnikov 2015.02.19*/

  -- Neronov A.S. 29.11.2011
  -- ������� �������� ��������� ID ������
  IF (aCurDate is null)or(aNaz_fk_State is null) then Return -1; end if;
  IF (aSpisDate is null) THEN
    if /*(aNaz_fk_State = ASU.GET_NAZCANCEL)and*/(Trunc(aCurDate) = TRUNC(aNaz_fd_cancel)) then return 2;
    elsif
       (aNaz_fk_State = ASU.GET_VIPNAZ)AND(Trunc(aCurDate) = TRUNC(aNaz_fd_begin)) then return 0;
    elsif
       /*(aNaz_fk_State = ASU.GET_NEVIP)and*/(Trunc(aCurDate) = TRUNC(aNaz_fd_begin)) then return 1;
    elsif
       (aNaz_fk_State = ASU.GET_RECOMEND) then return 4;
    elsif
       (aNaz_fk_State = ASU.GET_NAZURGENT) then return 3;
    ELSIF
       (getCntNazFreq /*ncnt Melnikov 2015.02.19*/ <> 0) then return 1; -- ��� ����������� ������ �������� ��������� � �����������������
    else
      return -1;
    end if;
  ELSE
      -- 0 - ���������, 1 - ���������, 2 - ��������, 3 - �������, 4 - �������������,
    if /*(aNaz_fk_State = ASU.GET_NAZCANCEL)AND*/(Trunc(aCurDate) = TRUNC(aNaz_fd_cancel)) then return 17;
    elsif
       (aNaz_fk_State = ASU.GET_VIPNAZ)AND(Trunc(aCurDate) = TRUNC(aNaz_fd_begin)) then return 15;
    elsif
       /*(aNaz_fk_State = ASU.GET_NEVIP)AND*/(Trunc(aCurDate) = TRUNC(aNaz_fd_begin)) then return 16;
    elsif
       (aNaz_fk_State = ASU.GET_RECOMEND) then return 19;
    elsif
       (aNaz_fk_State = ASU.GET_NAZURGENT) then return 18;
    else
      return 14;
    end if;
  END if;
  Return -1;

  /*IF (aCurDate is null)or(aNaz_fk_State is null) then Return -1; end if;
  IF (aSpisDate is null) THEN
    if \*(aNaz_fk_State = ASU.GET_NAZCANCEL)and*\(Trunc(aCurDate) = TRUNC(aNaz_fd_cancel)) then return 2;
    elsif
       \*(aNaz_fk_State = ASU.GET_NEVIP)and*\(Trunc(aCurDate) = TRUNC(aNaz_fd_begin)) then return 1;
    elsif
       (aNaz_fk_State = ASU.GET_RECOMEND) then return 4;
    elsif
       (aNaz_fk_State = ASU.GET_VIPNAZ) then return 0;
    elsif
       (aNaz_fk_State = ASU.GET_NAZURGENT) then return 3;
    else
      return -1;
    end if;
  ELSE
      -- 0 - ���������, 1 - ���������, 2 - ��������, 3 - �������, 4 - �������������,
    if \*(aNaz_fk_State = ASU.GET_NAZCANCEL)and*\(Trunc(aCurDate) = TRUNC(aNaz_fd_cancel)) then return 17;
    elsif
       \*(aNaz_fk_State = ASU.GET_NEVIP)and*\(Trunc(aCurDate) = TRUNC(aNaz_fd_begin)) then return 16;
    elsif
       (aNaz_fk_State = ASU.GET_RECOMEND) then return 19;
    elsif
       (aNaz_fk_State = ASU.GET_VIPNAZ) then return 15;
    elsif
       (aNaz_fk_State = ASU.GET_NAZURGENT) then return 18;
    else
      return 14;
    end if;
  END if;
  Return -1;*/
END;
/

SHOW ERRORS;


