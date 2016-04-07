DROP PACKAGE ASU.PKG_RODIDATA
/

--
-- PKG_RODIDATA  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_RODIDATA" is

  -- Author  : A.NAKORJAKOV
  -- Created : 12.08.2009 16:29:47
  -- Purpose : Пакет для переноса данных в карту роженицы

  --надо переносить данные в карту из осмотров?
  function IsNeedInsertData(pPacID Number, pDocObsl Number) return boolean;

  -- перенос данных в карту беременной из предыдущих карт
  procedure DoInsertRodiData(pPacID Number, pPeopleID Number);

  -- перенести данные типа "Дата"
  procedure DoDate(pPacID      Number,
                   pSmidSynOsm Varchar2,
                   pSmidSynPac Varchar2,
                   pNazOsmotr  Number);
  -- перенести данные типа "Дата"
  procedure DoDate(pPacID      Number,
                   pSmidPac    Number,
                   pDate       Date,
                   pVrachID    Number);


  -- перенести данные типа "Число"
  procedure DoNumber(pPacID      Number,
                     pSmidSynOsm Varchar2,
                     pSmidSynPac Varchar2,
                     pNazOsmotr  Number);
  -- перенести данные типа "Число". возвращаемое значение в pNumber
  procedure DoNumber(pPacID      Number,
                     pSmidSynOsm Varchar2,
                     pSmidSynPac Varchar2,
                     pNazOsmotr  Number,
                     pNumber     OUT Number,
                     pDoUpdate   boolean);
  -- вставить/обновить данные

  procedure DoInsNumber(pPacID      Number,
                     pSmidId     Number,
                     pVrach      Number,
                     pNumber     Number);
  -- перенести данные типа "Строка"
  procedure DoEdit(pPacID      Number,
                   pSmidSynOsm Varchar2,
                   pSmidSynPac Varchar2,
                   pNazOsmotr  Number);
  -- перенести данные типа "Строка". возвращаемое значение в pEdit
  procedure DoEdit(pPacID      Number,
                   pSmidSynOsm Varchar2,
                   pSmidSynPac Varchar2,
                   pNazOsmotr  Number,
                   pEdit       OUT Varchar2,
                   pDoUpdate   boolean);
  -- перенести данные типа "Строка". возвращаемое значение в pEdit
  procedure DoEdit(pPacID     Number,
                   pSmidIdOsm Number,
                   pSmidIdPac Number,
                   pNazOsmotr Number,
                   pEdit      OUT Varchar2,
                   pDoUpdate  boolean);

  -- вставить/обновить данные
  procedure DoInsEdit(pPacID   Number,
                      pSmid    Number,
                      pVrachID Number,
                      pChar    Varchar2);

  -- перенести данные типа "Combo"
  procedure DoCombo(pPacID      Number,
                    pSmidSynOsm Varchar2,
                    pSmidSynPac Varchar2,
                    pNazOsmotr  Number);

  -- перенести данные типа "Combo". возвращаемое значение в pEdit
  procedure DoCombo(pPacID      Number,
                    pSmidSynOsm Varchar2,
                    pSmidSynPac Varchar2,
                    pNazOsmotr  Number,
                    pEdit       Out Varchar2,
                    pDoUpdate   Boolean);

  -- полный путь смида от листка pFromID до ветки pToId
  function Get_SmidPath(pFromID Number, pToId Number) return Varchar2;

  -- перенос данных о назначении
  procedure DoInsertNazEdit(pPacID     Number,
                            pNazSmidID Number,
                            pSmidKarta Number,
                            vAmbID     Number);

  -- перенос данных о назначении
  procedure DoInsertNazEdit2(pPacID     Number,
                            pNazSmidID Number,
                            pSmidKarta Number,
                            vAmbID     Number);
  -- перенос данных о назначении
  procedure DoInsertNazEdit3(pPacID     Number,
                            pNazSmidID Number,
                            pSmidKartaChar Number,
                            pSmidKartaDate Number,
                            vAmbID     Number);

  --флюорография
  procedure DoInsertFluoro(pPacID     Number,
                            vAmbID     Number);

  -- Ефимов Виктор 29.01.2009 перенос данных типа VarChar2
  -- Для ветки pVC2Smid типа VARCHAR2 выбирается самое позднее значение заполненное для человека pPeopleID
  -- и копируется в осмотр pToPacID
  procedure DoInsertVarchar2(pVC2Smid Number, pPeopleID Number, pToPacID Number);

end pkg_RodiData;
/

SHOW ERRORS;


