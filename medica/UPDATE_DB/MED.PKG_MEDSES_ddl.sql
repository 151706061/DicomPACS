-- Start of DDL Script for Package Body MED.PKG_MEDSES
-- Generated 12-фев-2009 10:16:03 from MED@ASU

CREATE OR REPLACE 
PACKAGE                 med.pkg_medses
IS
function get_existkart (akartid in number)
return number;
function get_buhmo
RETURN NUMBER;

FUNCTION get_curmo
   RETURN NUMBER;

FUNCTION GET_PRODUCE_MO
--получение moid МО, который производит медикаменты
   RETURN NUMBER;

PROCEDURE set_curmo (moid IN NUMBER);
PROCEDURE Set_IsShowReserv( aIsShowReserv IN NUMBER);
FUNCTION Get_IsShowReserv RETURN NUMBER;
FUNCTION get_data2 RETURN DATE;

PROCEDURE set_data1 (pdata IN DATE);

PROCEDURE set_data2 (pdata IN DATE);

FUNCTION get_data1
   RETURN DATE;

FUNCTION ROUNDTO2(p IN NUMBER) RETURN NUMBER;
---ф-ия округляет число до 2 знака после запятой.  1.2345 => 1.24

-- получить текущую группу текущего мат. отв.
FUNCTION GET_CUR_MOGROUP_BY_CUR_MO RETURN NUMBER;
-- получить текущую группу мат. отв.
FUNCTION GET_CUR_MOGROUP_BY_MOID ( pmoid IN   NUMBER ) RETURN NUMBER;
  FUNCTION GET_MOGROUP_NAME ( MOGROUP_ID IN   NUMBER ) RETURN VARCHAR2;
  PROCEDURE set_curmo_group (mo_gr IN NUMBER);
  PROCEDURE ResetDatePeriod;
  FUNCTION Get_UPPERCASE_Reserv_NAME RETURN VARCHAR2;
  FUNCTION get_cur_mogroup
   RETURN NUMBER;
  FUNCTION GET_CUR_MO_SKLAD_ID
   RETURN NUMBER;
  FUNCTION GET_ISUSESKLAD
   RETURN NUMBER;
  PROCEDURE set_IsUseSklad (aIsUseSklad IN NUMBER);
  FUNCTION GET_CUR_MO_SKLAD_SYNONIM
   RETURN VARCHAR2;
END; -- Package spec
/


CREATE OR REPLACE 
PACKAGE BODY     med.pkg_medses
IS
   nCurMO   NUMBER;
   nCurMO_Group NUMBER := 0;
   -- добавил Воронов О.А. 16.01.2008
   nIsShowRezerv NUMBER := 0; -- показывать резерв: 0 - нет, 1 - да

   nIsUseSklad NUMBER := 0;
   nCurMO_sklad_id NUMBER := null;
   nCurMO_sklad_SYNONIM MED.TSKLAD.fc_synonim%TYPE;
   --начало текущего месяца
--   dData1   DATE :=trunc(last_day(sysdate-(last_day(sysdate)-sysdate)))+1;
   --конец месяца
--   dData2   DATE :=trunc(last_day(sysdate)+1);

-- поскольку эти переменные уже задействованы в запросах, то можно использовать их
   dData1   DATE :=trunc(TO_DATE ('01.01.2000', 'DD.MM.YYYY'));
   dData2   DATE :=trunc((SYSDATE) + 1 - 1 / (24 * 60 * 60)); -- до конца сегодняшнего дня
function get_existkart (akartid in number)
return number is
res number;
begin
SELECT /*+rule*/ count(*) into res
                      FROM   tdpc, tdocs
                      WHERE  tdpc.dpid = tdocs.dpid
AND                          tdpc.kartid = akartid
AND                          (tdocs.motoid = pkg_medses.get_curmo  or tdocs.motoid = decode(pkg_medses.get_curmo,pkg_medses.get_buhmo,22));

if  res>0 then return 1; else return 0;
end if;
end;

function get_buhmo
return number is
begin

  return 141;
end get_buhmo;
-- получить текущую группу мат. отв.
FUNCTION GET_CUR_MOGROUP_BY_MOID ( pmoid IN   NUMBER ) RETURN NUMBER
 IS
--   MOGROUP_ID NUMBER; -- группа мат. отв.
BEGIN
--  MOGROUP_ID := 0;
  SELECT MAX(gr2.fk_group)
  into nCurMO_Group
  FROM
    (SELECT moingr.fk_group
     FROM med.tmo_in_group moingr, med.tmo_group gr1, med.tmo
     where
         moingr.fk_mo = pmoid
     and moingr.fk_group = gr1.groupid
     and tmo.moid = pmoid
     and moingr.fk_group = tmo.fk_curmogroupid
     UNION -- юнинон на случай если группа для мат. отв. не была найдена
     SELECT 0 as fk_group from DUAl
     ) gr2;

  RETURN NVL(nCurMO_Group, 0);
END GET_CUR_MOGROUP_BY_MOID;
-- получить текущую группу текущего мат. отв.
FUNCTION GET_CUR_MOGROUP_BY_CUR_MO RETURN NUMBER
is
BEGIN
  IF nCurMO_Group > 0 then
-- сия фича нужна для отображения в VMEDKART_KOLOST остатков НЕ текущей группы
-- использовать крайне аккуратно, не забывая обнулить nCurMO_Group после использования
    RETURN nCurMO_Group;
  ELSE
    RETURN GET_CUR_MOGROUP_BY_MOID ( nCurMO );
  END IF;
END GET_CUR_MOGROUP_BY_CUR_MO;

-- получить имя группы. Если такой группы нет, возвращается пустая строка
FUNCTION GET_MOGROUP_NAME ( MOGROUP_ID IN   NUMBER ) RETURN VARCHAR2
 IS
   group_name VARCHAR2(200); -- название группы мат. отв.
BEGIN
  group_name := '';
  SELECT  MAX(gr2.fc_group)
  into group_name
  from
    (SELECT gr1.fc_group
     FROM med.tmo_group gr1
     where gr1.groupid = MOGROUP_ID
     UNION -- юнинон на случай, если группа не найдена
     SELECT '' as fc_group from DUAL) gr2;

  RETURN NVL(group_name, '');
END GET_MOGROUP_NAME;


FUNCTION get_curmo
   RETURN NUMBER
IS
BEGIN
   RETURN nCurMO;
END get_curmo;

FUNCTION get_cur_mogroup
   RETURN NUMBER
IS
BEGIN
   RETURN nCurMO_Group;
END get_cur_mogroup;

FUNCTION GET_CUR_MO_SKLAD_ID
   RETURN NUMBER
IS
BEGIN
   RETURN nCurMO_sklad_id;
END GET_CUR_MO_SKLAD_ID;

FUNCTION GET_CUR_MO_SKLAD_SYNONIM
   RETURN VARCHAR2
IS
BEGIN
   RETURN nCurMO_sklad_SYNONIM;
END GET_CUR_MO_SKLAD_SYNONIM;


FUNCTION GET_PRODUCE_MO
--получение moid МО, который производит медикаменты
   RETURN NUMBER
IS
 vMOID NUMBER :=-1;

BEGIN
SELECT
    NVL(MAX(MOID),-1)
  INTO
    vMOID
  FROM TMO
  WHERE FN_MOTYPE = 1;

IF vMOID=-1 THEN
--НЕ НАШЛИ МО, КОТОРЫЙ производит медикаменты => его надо добавить в таблицу TMO
INSERT INTO TMO
  (MOID,
   FC_NAME,
   FL_CRM,
   FK_PARENT,
   FK_SOTRID,
   FL_TREB,
   FN_MOTYPE)
  VALUES
  (null,
   'Отдел РПО',
   0,
   0,
   -1,
   0,
   1);
commit;
SELECT
    NVL(MAX(MOID),-1)
  INTO
    vMOID
  FROM TMO
  WHERE FN_MOTYPE = 1;
END IF;

   RETURN vMOID;
END GET_PRODUCE_MO;

PROCEDURE set_curmo (moid IN NUMBER)
IS
BEGIN
  nIsUseSklad := GET_ISUSESKLAD;
  nCurMO := moid;
  if nIsUseSklad = 1 then
    select MAX(m.fk_sklad_id) into nCurMO_sklad_id from med.tmo m where m.moid = nCurMO;
--    if nCurMO_sklad_id is null then
--      select MAX(mg.FK_SKLAD_ID) into nCurMO_sklad_id from med.tmo_group mg where mg.groupid = nCurMO_Group;
--    end if;
    select MAX(FC_SYNONIM) into nCurMO_sklad_SYNONIM from med.tsklad where FK_ID = nCurMO_sklad_id;
  end if;

  set_curmo_group( GET_CUR_MOGROUP_BY_CUR_MO );
END set_curmo;

PROCEDURE set_IsUseSklad (aIsUseSklad IN NUMBER)
IS
BEGIN
  nIsUseSklad := aIsUseSklad;
END set_IsUseSklad;

FUNCTION GET_ISUSESKLAD
   RETURN NUMBER
IS
BEGIN
  RETURN TO_NUMBER(asu.PKG_SMINI.readstring('medica.exe', 'FUNC_USE_SKLAD', '0'));
END GET_ISUSESKLAD;

PROCEDURE set_curmo_group (mo_gr IN NUMBER)
IS
BEGIN
  nCurMO_Group := mo_gr;
  
  if nIsUseSklad = 1 then
    if nCurMO_sklad_id is null then
      select MAX(mg.FK_SKLAD_ID) into nCurMO_sklad_id from med.tmo_group mg where mg.groupid = nCurMO_Group;
      select MAX(FC_SYNONIM) into nCurMO_sklad_SYNONIM from med.tsklad where FK_ID = nCurMO_sklad_id;
    end if;
  end if;  
END set_curmo_group;

PROCEDURE Set_IsShowReserv( aIsShowReserv IN NUMBER)
IS
BEGIN
  if aIsShowReserv > 1 then
    nIsShowRezerv := 1;
  else
    nIsShowRezerv := aIsShowReserv;
  end if;
END Set_IsShowReserv;

FUNCTION Get_UPPERCASE_Reserv_NAME RETURN VARCHAR2
IS
BEGIN
  RETURN 'РЕЗЕРВ';
END Get_UPPERCASE_Reserv_NAME;

FUNCTION Get_IsShowReserv RETURN NUMBER
IS
BEGIN
  RETURN nIsShowRezerv;
END Get_IsShowReserv;

FUNCTION get_data1
  RETURN DATE
IS
  DATA DATE;
BEGIN
RETURN dData1;
END get_data1;

PROCEDURE set_data1 (pdata IN DATE)
IS
BEGIN
dData1 := pdata;
END set_data1;

FUNCTION get_data2
  RETURN DATE
IS
  DATA DATE;
BEGIN
RETURN dData2;
END get_data2;

PROCEDURE ResetDatePeriod
IS
BEGIN
  dData1 := TO_DATE('01.01.2000','DD.MM.YYYY');
-- опять возвращаемся к старому
  dData2 := TO_DATE('01.01.2999','DD.MM.YYYY'); --trunc((SYSDATE) + 1 - 1 / (24 * 60 * 60)); -- выставляем дату/время - сегодня 23:59:59
--dData2 := trunc((SYSDATE) + 1 - 1 / (24 * 60 * 60)); -- выставляем дату/время - сегодня 23:59:59
END ResetDatePeriod;

PROCEDURE set_data2 (pdata IN DATE)
IS
BEGIN
dData2 := pdata;
END set_data2;

FUNCTION ROUNDTO2(p IN NUMBER) RETURN NUMBER
---ф-ия округляет число до 2 знака после запятой.  1.2345 => 1.24
IS
I1 NUMBER;
I2 NUMBER;
BEGIN
I1:=(TRUNC(100*P)) / 100;
I2:=ROUND(p,2);

RETURN I2;
END ROUNDTO2;

END;
/


-- End of DDL Script for Package Body MED.PKG_MEDSES

